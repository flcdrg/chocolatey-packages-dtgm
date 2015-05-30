﻿$packageName = 'vcredist2013'
$installerType = 'exe'
$url = 'http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe'
$url64 = 'http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe'
$silentArgs = '/Q'
$validExitCodes = @(0) # http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$checksum = 'b8fab0bb7f62a24ddfe77b19cd9a1451abd7b847'
$checksumType = 'sha1'
$checksum64 = '8bf41ba9eef02d30635a10433817dbb6886da5a2'
$checksumType64 = 'sha1'

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -Url "$url" `
                          -Url64bit "$url64" `
                          -SilentArgs "$silentArgs" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType" `
                          -Checksum64 "$checksum64" `
                          -ChecksumType64 "$checksumType64"