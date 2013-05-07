# Check if 64-bit-architecture, in that case install the 32-bit and the 64-bit-version
if ([System.IntPtr]::Size -eq 8) {
Install-ChocolateyPackage 'ffdshow' 'exe' '/verysilent' 'http://heanet.dl.sourceforge.net/project/ffdshow-tryout/Official%20releases/generic%20build%20%28stable%29/ffdshow_rev4500_20130106.exe'
}
Install-ChocolateyPackage 'ffdshow' 'exe' '/verysilent' 'http://heanet.dl.sourceforge.net/project/ffdshow-tryout/Official%20releases/generic%20build%20%28stable%29/ffdshow_rev4500_20130106.exe' 'http://heanet.dl.sourceforge.net/project/ffdshow-tryout/Official%20releases/64-bit/ffdshow_rev4500_20130106_x64.exe'