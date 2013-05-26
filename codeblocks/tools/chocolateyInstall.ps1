$packageName = "codeblocks"
$fileType = "exe"
$silentArgs = "/S"
$url = "http://sourceforge.net/projects/codeblocks/files/Binaries/12.11/Windows/codeblocks-12.11mingw-setup.exe/download"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url