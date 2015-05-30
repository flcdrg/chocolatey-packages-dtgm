$packageName = '{{PackageName}}'
$installerType = 'msi'
$url  = '{{DownloadUrl}}'
$url64  = '{{DownloadUrlx64}}'
$silentArgs = '/quiet'
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes $validExitCodes
