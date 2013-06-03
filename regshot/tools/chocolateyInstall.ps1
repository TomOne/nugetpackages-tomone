try { 
  
  $packageName = "RegShot"
  $url = "http://sourceforge.net/projects/regshot/files/regshot/1.9.0/Regshot-1.9.0.7z/download"

  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64

  $mydir = (Split-Path -parent $MyInvocation.MyCommand.Definition)
  $contentDir = ($mydir | Split-Path | Join-Path -ChildPath "content")
  $binDir = ($mydir | Split-Path | Join-Path -ChildPath "bin")
  $toolsDir = ($mydir | Split-Path | Join-Path -ChildPath "tools")
  if($is64bit) {
  	$shortcutTarget = Join-Path $binDir "${packageName}_x64.exe"
  } else {
  	$shortcutTarget = Join-Path $binDir "${packageName}.exe"
  }
  
  Get-ChocolateyWebFile $packageName $fileFullPath $url

  Install-ChocolateyDesktopLink $shortcutTarget

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
