$packageName = "sweet-home-3d"
$fileType = "exe"
$silentArgs = "/VERYSILENT"
$url = "http://sourceforge.net/projects/sweethome3d/files/SweetHome3D/SweetHome3D-4.0/SweetHome3D-4.0-windows.exe/download"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url