# If Windows 2000/XP, download matching version
$WinVersion = [System.Environment]::OSVersion.Version.Major
if ($WinVersion -eq 5) {
Install-ChocolateyPackage 'nomacs' 'exe' '/S' 'http://sourceforge.net/projects/nomacs/files/nomacs-1.0.2/nomacs-setup-winXP-x86.exe/download'
}


# If Windows Vista/7/8 or later, download matching version
$WinVersion = [System.Environment]::OSVersion.Version.Major
if ($WinVersion -ge 6) {
Install-ChocolateyPackage 'nomacs' 'exe' '/S' 'http://sourceforge.net/projects/nomacs/files/nomacs-1.0.2/nomacs-setup.exe/download' 'http://sourceforge.net/projects/nomacs/files/nomacs-1.0.2/nomacs-setup-x64.exe/download'
}