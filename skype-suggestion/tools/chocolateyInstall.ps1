$packageName = "skype"
$fileType = "msi"
$silentArgs = "/qn /norestart"
$url = "http://download.skype.com/msi/SkypeSetup_6.3.0.107.msi"

$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64

if ($is64bit) {
    $programUninstallEntryName = "Skype"
    $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select DisplayName, UninstallString | Where-Object {$_.DisplayName -like "$programUninstallEntryName*"}).UninstallString
} else {
    $programUninstallEntryName = "Skype"
    $uninstallString = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Select DisplayName, UninstallString | Where-Object {$_.DisplayName -like "$programUninstallEntryName*"}).UninstallString
} # get the uninstall string of the installed Skype version from the registry

$uninstallString = "$uninstallString" -replace '[{]', '`{' # adding escape character to the braces
$uninstallString = "$uninstallString" -replace '[}]', '`} /passive /norestart' # to work properly with the Invoke-Expression command, add silent arguments

if ($uninstallString -ne "") {
    Invoke-Expression "$uninstallString" # start uninstaller of old version

    do {
    $uninstalled = -not ((Test-Path "$env:ProgramFiles\Skype") -or (Test-Path "${env:ProgramFiles(x86)}\Skype"))
    Start-Sleep -Seconds 5
    $i += 1
    if ($i -gt 12) {break} # exit loop if too much time passed
    } until ($uninstalled) # this loop waits until Skype is uninstalled
}

Install-ChocolateyPackage $packageName $fileType $silentArgs $url