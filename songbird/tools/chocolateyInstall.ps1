$packageName = "songbird"
$fileType = "exe"
$url = "https://s3.amazonaws.com/download.songbirdnest.com/installer/windows/i686-msvc8/Songbird_2.2.0-2453_windows-i686-msvc8.zip?AWSAccessKeyId=AKIAIWI4SLRVB3WED2QQ&Expires=1368553656&Signature=z%2BHx4yJmTUFDzBQDWsvfwUy%2BIwA%3D"
$unzipLocation = "$env:TEMP"
$silentArgs = "/S"
$file = "$env:TEMP\Songbird_2.2.0-2453_windows-i686-msvc8.exe"

Install-ChocolateyZipPackage $packageName $url "$unzipLocation"
Remove-Item "$env:TEMP\`_`_MACOSX" -Recurse
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs "$file"

Remove-Item "$file"