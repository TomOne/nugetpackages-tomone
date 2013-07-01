Function checkIfPackageVersionAlreadyInstalled ($programUninstallEntryName, $checkVersion) {
    # For every program on 32-bit-systems and for 64-bit-software on 64-bit systems
    # $programUninstallEntryName = The value which contains the registry-key “DisplayName” of the affected program
    $registrypath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
    $installedVersion = (Get-ItemProperty $registrypath | Select DisplayName, DisplayVersion | Where-Object {$_.DisplayName -like "*$programUninstallEntryName*"}).DisplayVersion
    # $installedVersion is the value of the registry-key “DisplayVersion” of the affected program

    if ($installedVersion -eq $null) {
        # For 32-bit-software on 64-bit systems
        $registrypath = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
        $installedVersion = (Get-ItemProperty $registrypath | Select DisplayName, DisplayVersion | Where-Object {$_.DisplayName -like "*$programUninstallEntryName*"}).DisplayVersion
    }

    if ($installedVersion -ge $checkVersion) {
        $alreadyInstalled = "True"
    } else {$alreadyInstalled = "False"}
    return $alreadyInstalled
}


#checkIfPackageVersionAlreadyInstalled "CCleaner" "4.1"
checkIfPackageVersionAlreadyInstalled "CDBurnerXP" "4.5.1.4003"