$packageName = 'projectlibre.install'
$installerType = 'msi'
$partialInstallArgs = '/quiet /qn /norestart TARGETDIR='
$is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
if ($is64bit) {$installPath = ${Env:ProgramFiles(x86)}} else {$installPath = $Env:ProgramFiles}
$installArgs = $($partialInstallArgs + '"' + $installPath + '"')
$url = 'http://sourceforge.net/projects/projectlibre/files/ProjectLibre/1.6/projectlibre-1.6.msi/download'
$checksum = '{checksumx64}'
$checksumType = 'sha1'
$validExitCodes = @(0)

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -Url "$url" `
                          -SilentArgs "$silentArgs" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"
