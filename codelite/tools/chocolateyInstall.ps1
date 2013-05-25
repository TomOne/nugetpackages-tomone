$packageName = "codelite"
$fileType = "exe"
$silentArgs = "/VERYSILENT"
$url = "http://sourceforge.net/projects/codelite/files/Releases/codelite-5.1/codelite-5.1.0-mingw4.7.1-wx2.9.4.exe/download"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url