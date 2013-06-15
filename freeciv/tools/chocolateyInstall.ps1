$packageName = 'freeciv'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://sourceforge.net/projects/freeciv/files/Freeciv%202.3/2.3.4/Freeciv-2.3.4-win32-gtk2-setup.exe/download'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url