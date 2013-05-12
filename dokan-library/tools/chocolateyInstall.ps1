$unfile = "Dokan\DokanLibrary\DokanUninstall.exe"

if (Test-Path "${Env:ProgramFiles(x86)}\$unfile") {
    $unpath = "${Env:ProgramFiles(x86)}\$unfile"
    Uninstall-ChocolateyPackage 'dokan-library' 'exe' '/S' "$unpath"
}
if (Test-Path "${Env:ProgramFiles}\$unfile") {
    $unpath = "${Env:ProgramFiles}\$unfile"
    Uninstall-ChocolateyPackage 'dokan-library' 'exe' '/S' "$unpath"
}

Install-ChocolateyPackage 'dokan-library' 'exe' '/S' 'http://dokan-dev.net/wp-content/uploads/DokanInstall_0.6.0.exe'