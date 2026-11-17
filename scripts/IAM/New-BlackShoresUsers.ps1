# ============================================================
# Black Shores - Automated Active Directory User Provisioning
# Version: 2.0
#
# Purpose:
# Create employee accounts from a validated CSV file,
# assign departmental security groups, and enforce
# initial password security requirements.
#
# Usage:
# Preview: .\New-BlackShoresUsers.ps1 -Apply -WhatIf
# Execute: .\New-BlackShoresUsers.ps1 -Apply
#
# IMPORTANT:
# Run on DC01 using an authorized administrative account.
# ============================================================

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$Apply,
    [string]$CsvPath = "C:\Lab\IAM\blackshores-employees.csv"
)

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory -ErrorAction Stop

# ------------------------------------------------------------
# 1. DOMAIN CONFIGURATION
# ------------------------------------------------------------

$DomainDN = "DC=corp,DC=blackshores,DC=test"
$DomainName = "corp.blackshores.test"

$Groups = @{
    IT             = "SG_IT_Staff"
    HumanResources = "SG_HR_Staff"
    Finance        = "SG_Finance_Staff"
    Sales          = "SG_Sales_Staff"
    Operations     = "SG_Operations_Staff"
}

$RequiredColumns = @(
    "FirstName",
    "LastName",
    "SamAccountName",
    "Department",
    "Title"
)

# ------------------------------------------------------------
# 2. IMPORT EMPLOYEE DATA
# ------------------------------------------------------------

$Employees = @(Import-Csv -LiteralPath $CsvPath)

if ($Employees.Count -eq 0) {
    throw "Employee CSV is empty."
}

$SeenUsernames = @{}

# ------------------------------------------------------------
# 3. VALIDATE EMPLOYEE RECORDS
# ------------------------------------------------------------

$Plan = foreach ($Employee in $Employees) {

    foreach ($Column in $RequiredColumns) {

        if ([string]::IsNullOrWhiteSpace($Employee.$Column)) {
            throw "Missing required value: $Column"
        }
    }

    $Username = $Employee.SamAccountName.Trim()
    $Department = $Employee.Department.Trim()

    $FirstName = $Employee.FirstName.Trim()
    $LastName = $Employee.LastName.Trim()
    $Title = $Employee.Title.Trim()

    $Name = "$FirstName $LastName"

    # Validate username format
    if ($Username -notmatch '^[a-z][a-z0-9._-]{1,19}$') {
        throw "Invalid username: $Username"
    }

    # Check for duplicates within the CSV
    if ($SeenUsernames.ContainsKey($Username)) {
        throw "Duplicate CSV username: $Username"
    }

    $SeenUsernames[$Username] = $true

    # Validate department
    if (-not $Groups.ContainsKey($Department)) {
        throw "Unknown department: $Department"
    }

    # Determine target OU and security group
    $OU = "OU=$Department,OU=Users,OU=BlackShores,$DomainDN"
    $Group = $Groups[$Department]

    # Confirm target OU exists
    Get-ADOrganizationalUnit -Identity $OU |
        Out-Null

    # Confirm security group exists and has correct type
    $GroupObject = Get-ADGroup -Identity $Group

    if (
        $GroupObject.GroupCategory -ne "Security" -or
        $GroupObject.GroupScope -ne "Global"
    ) {
        throw "Incorrect security group configuration: $Group"
    }

    # Check for existing Active Directory accounts
    $Existing = @(
        Get-ADUser -Filter {
            SamAccountName -eq $Username
        } -SearchBase $DomainDN
    )

    if ($Existing.Count -gt 0) {
        throw "Account already exists: $Username"
    }

    # Add employee to validated provisioning plan
    [PSCustomObject]@{
        Name       = $Name
        FirstName  = $FirstName
        LastName   = $LastName
        Username   = $Username
        Department = $Department
        Title      = $Title
        OU         = $OU
        Group      = $Group
        Status     = "Ready"
    }
}

# ------------------------------------------------------------
# 4. DISPLAY PROVISIONING PLAN
# ------------------------------------------------------------

Write-Host ""
Write-Host "Black Shores Provisioning Plan"

$Plan |
    Format-Table Name, Username, Department, Group, Status -AutoSize

# Stop unless actual provisioning was requested
if (-not $Apply) {

    Write-Host "PREVIEW ONLY: No Active Directory changes made."

    return
}

# ------------------------------------------------------------
# 5. PROVISION EMPLOYEE ACCOUNTS
# ------------------------------------------------------------

foreach ($Person in $Plan) {

    $Action = "Create user and assign group $($Person.Group)"

    if ($PSCmdlet.ShouldProcess($Person.Username, $Action)) {

        $Created = $false
        $Password = $null

        try {

            # Request a unique temporary password
            $Password = Read-Host `
                "Unique temporary password for $($Person.Username)" `
                -AsSecureString

            # Define user creation parameters
            $UserParams = @{
                Name              = $Person.Name
                GivenName         = $Person.FirstName
                Surname           = $Person.LastName
                SamAccountName    = $Person.Username
                UserPrincipalName = "$($Person.Username)@$DomainName"
                Path              = $Person.OU
                Department        = $Person.Department
                Title             = $Person.Title
                AccountPassword   = $Password
                Enabled           = $false
            }

            # Create account in disabled state
            New-ADUser @UserParams -ErrorAction Stop

            $Created = $true

            # Add account to departmental group
            Add-ADGroupMember `
                -Identity $Person.Group `
                -Members $Person.Username `
                -ErrorAction Stop

            # Enable account after group assignment
            Enable-ADAccount `
                -Identity $Person.Username `
                -ErrorAction Stop

            # ------------------------------------------------
            # 6. ENFORCE PASSWORD SECURITY
            # ------------------------------------------------

            # Require password change at first sign-in
            Set-ADUser `
                -Identity $Person.Username `
                -ChangePasswordAtLogon $true `
                -ErrorAction Stop

            # Read back security settings
            $VerifiedUser = Get-ADUser `
                -Identity $Person.Username `
                -Properties pwdLastSet,PasswordNeverExpires,Enabled `
                -ErrorAction Stop

            # Confirm security requirements
            if (
                -not $VerifiedUser.Enabled -or
                $VerifiedUser.pwdLastSet -ne 0 -or
                $VerifiedUser.PasswordNeverExpires
            ) {
                throw "Account security verification failed."
            }

            # Verify security group membership
            $GroupMembers = @(
                Get-ADGroupMember `
                    -Identity $Person.Group `
                    -ErrorAction Stop
            )

            $MembershipFound = @(
                $GroupMembers | Where-Object {
                    $_.SamAccountName -eq $Person.Username
                }
            ).Count -gt 0

            if (-not $MembershipFound) {
                throw "Security group membership verification failed."
            }

            Write-Host "Provisioned and verified: $($Person.Username)"
        }

        catch {

            Write-Warning "Provisioning failed for $($Person.Username)."

            # If this run created the account, attempt to
            # disable it until the problem is investigated.
            if ($Created) {

                try {
                    Disable-ADAccount `
                        -Identity $Person.Username `
                        -ErrorAction Stop

                    Write-Warning "Account disabled for investigation."
                }
                catch {
                    Write-Warning "Could not disable account. Manual review required."
                }
            }

            throw
        }

        finally {

            # Release the temporary password reference
            $Password = $null
        }
    }
}

# ------------------------------------------------------------
# END OF SCRIPT
# ------------------------------------------------------------
