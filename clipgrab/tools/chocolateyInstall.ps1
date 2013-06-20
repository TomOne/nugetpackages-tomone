$packageName = 'clipgrab'
$fileType = 'exe'
$silentArgs = '/VERYSILENT'
$url = 'http://download.clipgrab.de/clipgrab-3.2.1.0.exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url