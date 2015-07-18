$packageName = 'bytecoin'
$url = 'http://sourceforge.net/projects/bytecoin-bcn/files/BytecoinWallet/BytecoinWallet-1.0.5.win64.zip/download'
$checksum = 'ba2e115e6783735e5d62bfcfa10e70636d358111'
$checksumType = 'sha1'
$url64 = "$url"
$checksum64 = "$checksum"
$checksumType64 = "$checksumType"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Url64bit "$url64" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType64"