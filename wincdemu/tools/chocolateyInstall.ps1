$tools="$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Start-ChocolateyProcessAsAdmin "certutil -addstore 'TrustedPublisher' '$tools\sysprogs.cer'"

Install-ChocolateyPackage 'wincdemu' 'exe' '/UNATTENDED' 'http://wincdemu.sysprogs.org/download/WinCDEmu-3.6.exe'