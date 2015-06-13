$packageName = 'aida64-business'
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut_to_remove = "aida64.exe.lnk"

try {

	Remove-Item "$desktop\$shortcut_to_remove"
  
	Write-ChocolateySuccess $packageName
	
} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw 
}