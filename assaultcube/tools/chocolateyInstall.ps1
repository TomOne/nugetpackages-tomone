$packageName = "assaultcube"
$url = "http://sourceforge.net/projects/actiongame/files/AssaultCube%20Version%201.1.0.4/AssaultCube_v1.1.0.4.exe/download"
$zipPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\assaultcube.zip"
$assaultcubePath = 
if (Test-Path "$env:ProgramFiles\AssaultCube_v1.1.0.4") {
    $unzipLocation = "$env:ProgramFiles\AssaultCube_v1.1.0.4"
} else {
    $unzipLocation = "${env:ProgramFiles(x86)}\AssaultCube_v1.1.0.4"
}

Install-ChocolateyPackage $packageName 'exe' '/S' $url
Install-ChocolateyZipPackage $packageName $zipPath $unzipLocation