$packageName = "songbird"
$fileType = "exe"
$url = "http://www.getsongbird.com/desktop/index.php?download=GSB_windows"
$unzipLocation = "$env:TEMP"
$silentArgs = "/S"
$file = "$env:TEMP\Songbird_2.2.0-2453_windows-i686-msvc8.exe"
$ignoreFile = "$file.ignore"

Install-ChocolateyZipPackage $packageName $url $unzipLocation
Remove-Item "$env:TEMP\`_`_MACOSX" -Recurse

# Set compatibility mode to Windows 7 if operating system is Windows 8 or higher.
$WindowsVersion = (Get-WmiObject -class Win32_OperatingSystem).Version
if ($WindowsVersion -ge "6.2.9200") {
    if (-not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags" -Name Layers 
    }
    New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" -propertyType String -Name "$file" -value "~ WIN7RTM"
    Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file
    # Delete compatibility mode for installer, because it’s not needed anymore
    Remove-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" -Name "$file"
} else {
    Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file
}

Remove-Item $file
Remove-Item $ignoreFile