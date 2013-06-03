try {

    $packageName = "netbeans"
    $fileType = "exe"
    $silentArgs = "--silent"
    $language = (Get-Culture).Name # Get language and country code separated by hyphen
    $language = "$language" -replace '-[a-z]{2}', '' # Remove hyphen and country code

    if ($language -eq "en") { # Installer for English
        $url = "http://dlc.sun.com.edgesuite.net/netbeans/7.3/final/bundles/netbeans-7.3-windows.exe"
        Install-ChocolateyPackage $packageName $fileType $silentArgs $url
    } else { # Installer for all other languages
        $url = "http://bits.netbeans.org/netbeans/7.3/community/latest/bundles/netbeans-7.3-windows.exe"
        Install-ChocolateyPackage $packageName $fileType $silentArgs $url
    }
    Write-ChocolateySuccess $packageName
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}