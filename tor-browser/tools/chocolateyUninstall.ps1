$exeFileLink = "Tor Browser.lnk"
$desktop = [Environment]::GetFolderPath("Desktop")
if (Test-Path "$desktop\$exeFileLink") {Remove-Item "$desktop\$exeFileLink"}

$startMenu = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::StartMenu))
if (Test-Path "$startMenu\Programs\$exeFileLink") {Remove-Item "$startMenu\Programs\$exeFileLink"}

if (Test-Path "$env:HOMEDRIVE\Tor Browser") {
    Remove-Item "$env:HOMEDRIVE\Tor Browser" -recurse
}