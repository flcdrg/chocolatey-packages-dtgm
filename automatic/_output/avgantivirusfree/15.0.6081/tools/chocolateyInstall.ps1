﻿$packageName = 'avgantivirusfree'
$installerType = 'exe'
$LCID = (Get-Culture).LCID
$SelectedLanguage = "/SelectedLanguage=$LCID"
$silentArgs = '/UILevel=silent /AppMode=setup /InstallToolbar=0 /ChangeBrowserSearchProvider=0 "$SelectedLanguage" /InstallSidebar=0 /ParticipateProductImprovement=0 /DontRestart /DisableScan /KillProcessesIfNeeded'
$url = 'http://files-download.avg.com/inst/av/avg_free_x86_all_2015_ltst_222.exe'
$checksum = '8470bea0474ca4c08fc1b2cbaf41be5e'
$checksumType = 'md5'
$url64 = 'http://files-download.avg.com/inst/av/avg_free_x64_all_2015_ltst_221.exe'
$checksum64 = 'fc338661bec349e757ce67543942c9a4'
$checksumType64 = 'md5'
$validExitCodes = @(0) #exit codes http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $scriptPath "chocolateyInstall.ahk"

Start-Process $ahkExe $ahkFile
Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -Url64bit "$url64" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType" `
                          -Checksum64 "$checksum64" `
                          -ChecksumType64 "$checksumType64"