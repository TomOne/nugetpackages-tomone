$packageName = 'mpc-hc'
$fileType = 'exe'
$silentArgs = '/VERYSILENT'
$url = 'http://sourceforge.net/projects/mpc-hc/files/MPC%20HomeCinema%20-%20Win32/MPC-HC_v1.6.8_x86/MPC-HC.1.6.8.x86.exe/download'
$url64bit = 'http://sourceforge.net/projects/mpc-hc/files/MPC%20HomeCinema%20-%20x64/MPC-HC_v1.6.8_x64/MPC-HC.1.6.8.x64.exe/download'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url $url64bit