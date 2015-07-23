$packageName = 'piratebrowser'
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut_to_remove = "Start PirateBrowser.exe.lnk"

try {

	Remove-Item "$desktop\$shortcut_to_remove"
  
	Write-ChocolateySuccess $packageName
	
} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw 
}