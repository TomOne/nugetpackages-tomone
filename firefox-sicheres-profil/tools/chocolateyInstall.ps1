try {

	$name = "firefox-sicheres-profil"
	$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
	$fileFullPath = "$scriptPath\firefox_sicheres_profil.zip"
    
    if (Test-Path $env:APPDATA\Mozilla\sicheres_profil_installiert) {
        Write-Host Das sichere Profil ist bereits installiert. Deshalb wird keine weitere Aktion vorgenommen.
    } elseif (Test-Path $env:APPDATA\Mozilla) {
        
        $i = 1
        while () {}
        
        Rename-Item -NewName Mozilla.old -Path $env:APPDATA\Mozilla
        Get-ChocolateyUnzip $fileFullPath $env:APPDATA
    } else {
        Get-ChocolateyUnzip $fileFullPath $env:APPDATA
    }

    Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw
}