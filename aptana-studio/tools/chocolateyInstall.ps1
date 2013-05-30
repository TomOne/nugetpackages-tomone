$packageName = "aptana-studio"
$fileType = "exe"
$silentArgs = "/S"
$url = "http://download.aptana.com/studio3/standalone/3.4.0/win/Aptana_Studio_3_Setup_3.4.0.exe"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url