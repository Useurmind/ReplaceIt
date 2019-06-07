param(
    [string]$rootFolder,
    [string]$regex,
    [string]$replacement,
    [string]$fileFilter
)

$getchildProps = @{
    Path = $rootFolder
    Recurse = $true
}

if($fileFilter)
{
    $getchildProps["Filter"] = $fileFilter
}

Get-ChildItem @getchildProps | foreach {$_.FullName} |
Sort-Object -Property Length -Descending |
foreach {
    $item = Get-Item $_
    if($item.Name -imatch $regex) {
        $path = $item.FullName | Split-Path
        $newName = $item.Name -replace $regex, $replacement
        $newPath = $path | Join-Path -ChildPath $newName

        Write-Host "Renaming item $($item.FullName) to $newName"
        Rename-Item -Path $item.FullName -NewName $newPath
    }
}