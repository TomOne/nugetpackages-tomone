$packageName = 'wesnoth'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://sourceforge.net/projects/wesnoth/files/wesnoth-1.10/wesnoth-1.10.6/wesnoth-1.10.6-win32.exe/download'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url