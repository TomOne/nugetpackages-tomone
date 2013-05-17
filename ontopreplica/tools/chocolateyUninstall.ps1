$path = "$env:LOCALAPPDATA\OnTopReplica\OnTopReplica-Uninstall.exe"
Uninstall-ChocolateyPackage 'ontopreplica' 'exe' '/S' "$unpath"