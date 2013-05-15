$os_name = (Get-WmiObject -class Win32_OperatingSystem).Caption
if ($os_name -like '* 8*'){
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags" -Name Layers 

New-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" -propertyType String -Name "$env:temp\chocolatey\ext2fsd\ext2fsdInstall.exe" -value "~ RUNASADMIN WIN7RTM"
}

Install-ChocolateyPackage 'ext2fsd' 'exe' '' 'http://sourceforge.net/projects/ext2fsd/files/Ext2fsd/0.51/Ext2Fsd-0.51.exe'
