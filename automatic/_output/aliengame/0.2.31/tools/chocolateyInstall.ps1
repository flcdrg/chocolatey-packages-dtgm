$packageName = 'aliengame'
$url = 'http://scienceathome.org/wp-content/uploads/2015/07/AlienGame_win_v0.2.31.zip'
$checksum = 'd53d88ece3ae72f210674f3cdf9c85dde5639950'
$checksumType = 'sha1'
$url64 = "$url"
$checksum64 = "$checksum"
$checksumType64 = 'sha1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipDir = Join-Path $toolsDir "AlienGame_win_v0.2.31"
$installFile = Join-Path $zipDir "AlienGame.exe"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Url64bit "$url64" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType64"

Set-Content -Path ("$installFile.gui") `
            -Value $null
