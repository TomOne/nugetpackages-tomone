$unfile = "Ext2Fsd\unins000.exe"

if (Test-Path "${Env:ProgramFiles(x86)}\$unfile") {
    $unpath = "${Env:ProgramFiles(x86)}\$unfile"
}
else {
    $unpath = "${Env:ProgramFiles}\$unfile"
}
Uninstall-ChocolateyPackage 'ext2fsd' 'exe' '/VERYSILENT /NORESTART' "$unpath"
Write-Host The system must be rebooted for the changes to be completed.