$packageName = "tv-browser"
$fileType = "exe"
$silentArgs = "/S"
$url = "http://sourceforge.net/projects/tvbrowser/files/TV-Browser%20Releases%20%28Java%206%20and%20higher%29/3.3/tvbrowser_3.3a_win32.exe/download"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url