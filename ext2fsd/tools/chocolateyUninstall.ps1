$os_name = (Get-WmiObject -class Win32_OperatingSystem).Caption
if ($os_name -like '* 8*'){
Remove-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" -Name "$env:temp\chocolatey\ext2fsd\ext2fsdInstall.exe"
}

$unfile = "Ext2Fsd\unins000.exe"

if (Test-Path "${Env:ProgramFiles(x86)}\$unfile") {
    $unpath = "${Env:ProgramFiles(x86)}\$unfile"
}
else {
    $unpath = "${Env:ProgramFiles}\$unfile"
}
Uninstall-ChocolateyPackage 'ext2fsd' 'exe' '' "$unpath"
Write-Host The system must be rebooted for the changes to be completed.
