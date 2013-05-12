$unfile = "Dokan\DokanLibrary\DokanUninstall.exe"

if (Test-Path "${Env:ProgramFiles(x86)}\$unfile") {
    $unpath = "${Env:ProgramFiles(x86)}\$unfile"
}
else {
    $unpath = "${Env:ProgramFiles}\$unfile"
}
Uninstall-ChocolateyPackage 'dokan-library' 'exe' '/S' "$unpath"