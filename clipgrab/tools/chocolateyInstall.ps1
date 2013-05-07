$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$clipgrabFile = Join-Path $scriptPath 'clipgrab-3.2.0.11.exe'
$clipgrabAHKFile = Join-Path $scriptPath 'clipgrab-3.2.0.11-install.exe'

Get-ChocolateyWebFile 'clipgrab' $clipgrabFile 'http://clipgrab.de/download/clipgrab-3.2.0.11.exe'

Start-ChocolateyProcessAsAdmin '' $clipgrabAHKFile

Remove-Item $clipgrabFile