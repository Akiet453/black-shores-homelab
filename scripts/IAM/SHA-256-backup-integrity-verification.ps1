# CHG-006 - DC01 Offline Backup Integrity Check
# Read-only: does not modify either directory.

$Source = "E:\HomeLab\VMs\HomeLab\DC01"
$Backup = "G:\HomeLab\Backups\DC01-Post-IAM-2026-10-17\DC01"

foreach ($Path in @($Source, $Backup)) {
    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        throw "Directory not found: $Path"
    }
}

$SourceFiles = @(
    Get-ChildItem -LiteralPath $Source -File -Recurse -Force
)

$BackupFiles = @(
    Get-ChildItem -LiteralPath $Backup -File -Recurse -Force
)

$Results = foreach ($File in $SourceFiles) {

    $RelativePath = $File.FullName.Substring($Source.Length + 1)
    $BackupFile = Join-Path $Backup $RelativePath

    $Status = "FAIL"

    if (Test-Path -LiteralPath $BackupFile -PathType Leaf) {

        $Destination = Get-Item -LiteralPath $BackupFile

        if ($File.Length -eq $Destination.Length) {

            $SourceHash = (Get-FileHash -LiteralPath $File.FullName -Algorithm SHA256).Hash
            $BackupHash = (Get-FileHash -LiteralPath $BackupFile -Algorithm SHA256).Hash

            if ($SourceHash -eq $BackupHash) {
                $Status = "PASS"
            }
        }
    }

    [PSCustomObject]@{
        File = $RelativePath
        Status = $Status
    }
}

$Passed = @($Results | Where-Object Status -eq "PASS").Count
$Failed = @($Results | Where-Object Status -eq "FAIL").Count
$CountMatch = $SourceFiles.Count -eq $BackupFiles.Count

$Results | Format-Table -AutoSize

Write-Host ""
Write-Host "Source files: $($SourceFiles.Count)"
Write-Host "Backup files: $($BackupFiles.Count)"
Write-Host "Hash matches: $Passed"
Write-Host "Failures: $Failed"
Write-Host "File counts match: $CountMatch"

if ($Failed -eq 0 -and $CountMatch) {
    Write-Host "INTEGRITY CHECK: PASS" -ForegroundColor Green
}
else {
    Write-Host "INTEGRITY CHECK: FAIL" -ForegroundColor Red
}
