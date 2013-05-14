$packageName = "tor-browser"
$version = "2.3.25-6"

$langcode = (Get-Culture).Name -replace '-[a-z]{2}', '' # get language code

# add country code to language code when required
if ($langcode -eq "en") {$langcode = "en-US"}
if ($langcode -eq "es") {$langcode = "es-ES"}
if ($langcode -eq "pt") {$langcode = "pt-PT"}
if ($langcode -eq "zh") {$langcode = "zh-CN"}


$downloadFile = "$packageName-$version`_$langcode.exe"
$url = "https://www.torproject.org/dist/torbrowser/$downloadFile"
$fileFullPath = Join-Path "$env:TEMP" "$downloadFile"

# Webrequest if url is valid
$req = [system.Net.WebRequest]::Create($url)
try {
$res = $req.GetResponse()
} catch [System.Net.WebException] {
$res = $_.Exception.Response
}
$statusCode = $res.StatusCode

# Fallback to en-US if user language not available
if ($statusCode -eq "NotFound") {
    $langcode = "en-US"
    $downloadFile = "$packageName-$version`_$langcode.exe"
    $url = "https://www.torproject.org/dist/torbrowser/$downloadFile"
    $fileFullPath = Join-Path "$env:TEMP" "$downloadFile"
}

Get-ChocolateyWebFile $packageName "$fileFullPath" $url

`7za x -o"$env:HOMEDRIVE" -y "$fileFullPath"
Remove-Item "$fileFullPath"

$desktop = "$([Environment]::GetFolderPath("Desktop"))"
$startMenu = "$([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::StartMenu))\Programs"

Install-ChocolateyDesktopLink "$env:HOMEDRIVE\Tor Browser\Start Tor Browser.exe"
Rename-Item -Path "$desktop\Start Tor Browser.exe.lnk" -NewName "Tor Browser.lnk"
Copy-Item "$desktop\Tor Browser.lnk" -Destination "$startMenu"