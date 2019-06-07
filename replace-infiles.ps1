param(
    [string]$rootFolder,
    [string]$regex,
    [string]$replacement,
    [string]$fileFilter
)

$getchildProps = @{
    Path = $rootFolder
    Recurse = $true
    File = $true
}

if($fileFilter)
{
    $getchildProps["Filter"] = $fileFilter
}

Get-ChildItem @getchildProps | foreach {
    $content = Get-Content $_.FullName | Out-String

    if($content -imatch $regex) {
        Write-Host "Replacing text in file content $($_.FullName)"

        $newContent = $content -replace $regex, $replacement

        Set-Content -Path $_.FullName -Value $newContent -Encoding UTF8
    }
}