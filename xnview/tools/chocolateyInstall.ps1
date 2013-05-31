$packageName = "xnview"
$fileType = "exe"
$silentArgs = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
$url = "http://download3.xnview.com/XnView-win-full.exe"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url