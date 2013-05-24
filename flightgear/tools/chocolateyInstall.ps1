$packageName = "flightgear"
$fileType = "exe"
$silentArgs = "/VERYSILENT"
$url = "http://ftp.igh.cnrs.fr/pub/flightgear/ftp/Windows/Setup%20FlightGear%202.10.0.3.exe"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url