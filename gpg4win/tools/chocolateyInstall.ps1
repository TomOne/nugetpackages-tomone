$packageName = 'Gpg4win' 
$installerType = 'EXE' 
$url = 'http://files.gpg4win.org/gpg4win-2.1.1.exe' 
$url64 = $url 
$silentArgs = '/S' 
$validExitCodes = @(0) 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes