param(
    [string]$rootFolder,
    [string]$regex,
    [string]$replacement,
    [string]$fileFilter
)

& .\replace-filenames.ps1 -rootFolder $rootFolder -regex $regex -replacement $replacement -fileFilter $fileFilter
& .\replace-infiles.ps1 -rootFolder $rootFolder -regex $regex -replacement $replacement -fileFilter $fileFilter