# Black Shores - Employee CSV Validation
# Purpose: Validate employee data before AD provisioning.
# This script makes no Active Directory changes.

$CsvPath = Join-Path $PSScriptRoot "blackshores-employees.csv"

$DepartmentGroups = @{
    IT             = "SG_IT_Staff"
    HumanResources = "SG_HR_Staff"
    Finance        = "SG_Finance_Staff"
    Sales          = "SG_Sales_Staff"
    Operations     = "SG_Operations_Staff"
}

$RequiredColumns = @(
    "FirstName", "LastName", "SamAccountName",
    "Department", "Title"
)

$Employees = @(Import-Csv -LiteralPath $CsvPath)

if ($Employees.Count -eq 0) {
    throw "The CSV contains no employees."
}

$SeenUsernames = @{}

$Results = foreach ($Employee in $Employees) {

    foreach ($Column in $RequiredColumns) {
        if ([string]::IsNullOrWhiteSpace($Employee.$Column)) {
            throw "Missing required value: $Column"
        }
    }

    $Username = $Employee.SamAccountName.Trim()
    $Department = $Employee.Department.Trim()

    if (-not $DepartmentGroups.ContainsKey($Department)) {
        throw "Unknown department: $Department"
    }

    if ($SeenUsernames.ContainsKey($Username)) {
        throw "Duplicate username: $Username"
    }

    $SeenUsernames[$Username] = $true

    [PSCustomObject]@{
        Name = "$($Employee.FirstName) $($Employee.LastName)"
        Username = $Username
        Department = $Department
        SecurityGroup = $DepartmentGroups[$Department]
        Status = "Valid"
    }
}

$Results | Format-Table -AutoSize

Write-Host "Validation passed: $($Results.Count) employee records."
Write-Host "No Active Directory changes were made."
