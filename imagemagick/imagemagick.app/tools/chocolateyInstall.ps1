$packageName = 'imagemagick.app'
$installerType = 'exe'
$silentArgs = '/SILENT /SP-'
$validExitCodes = @(0)

try {
    $tempDir = "$env:TEMP\chocolatey\$packageName"
    if (-not (Test-Path $tempDir)) {New-Item $tempDir -ItemType directory}

    $listUrl = 'http://www.imagemagick.org/download/binaries/'
    $fileFullPath = "$tempDir\temp.html"

    # Obtain the download URL of the latest version using regex
    Get-ChocolateyWebFile 'HTML file containing the URL' $fileFullPath $listUrl
    $content = Select-String -Path $fileFullPath -Pattern '-Q16-x86-dll.exe'
    $content64 = Select-String -Path $fileFullPath -Pattern '-Q16-x64-dll.exe'
    $url = $content -replace '.+(ImageMagick-)([\d-\.]{1,})(-Q16-x86-dll.exe).+', 'http://www.imagemagick.org/download/binaries/$1$2$3'
    $url64 = $content64 -replace '.+(ImageMagick-)([\d-\.]{1,})(-Q16-x64-dll.exe).+', 'http://www.imagemagick.org/download/binaries/$1$2$3'

    Install-ChocolateyPackage $packageName $installerType $silentArgs $url $url64  -validExitCodes $validExitCodes

    Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw 
}