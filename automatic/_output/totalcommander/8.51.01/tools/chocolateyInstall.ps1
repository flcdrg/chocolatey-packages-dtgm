# generated vars
$packageName = 'totalcommander'
$url = 'http://totalcmd2.s3.amazonaws.com/tcmd851ax32.exe'
$checksum = '8d3c71d63c878a037bdffb7660f5e26e0c9d7c09'
$url64 = 'http://totalcmd2.s3.amazonaws.com/tcmd851ax32_64.exe'
$checksum64 = 'd343527bb975f5a9694b3602a07fd79f6eb5b782'

# static vars
$checksumType = 'sha1'
$checksumType64 = 'sha1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$chocoTempDir = Join-Path $Env:Temp "chocolatey"
$tempDir = Join-Path $chocoTempDir "$packageName"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
$zipFile = Join-Path $tempDir "totalcommanderInstall.exe"
$cabFile = Join-Path $tempDir "INSTALL.CAB"

Get-ChocolateyWebFile -PackageName "$packageName" `
                      -FileFullPath "$zipFile" `
                      -Url "$url" `
                      -Url64bit "$url64" `
                      -Checksum "$checksum" `
                      -Checksum64 "$checksum64" `
                      -ChecksumType "$checksumType" `
                      -ChecksumType64 "$checksumType64"

try {
  $proc = Start-Process -FilePath "7za" `
                        -ArgumentList "e -o`"$tempDir`" -y `"$zipFile`"" `
                        -Wait `
                        -NoNewWindow `
                        -PassThru
  $proc.WaitForExit()
  $exitCode = $proc.ExitCode
  if($exitCode -ne 0) {
    throw "Exit Code: $exitCode.  Error executing 7za to unzip $zipFile into $tempDir "
  }
  
  $proc = Start-Process -FilePath "7za" `
                        -ArgumentList "e -o`"$toolsDir`" -y `"$cabFile`"" `
                        -Wait `
                        -NoNewWindow `
                        -PassThru
  $proc.WaitForExit()
  $exitCode = $proc.ExitCode
  if($exitCode -ne 0) {
    throw "Exit Code: $exitCode.  Error executing 7za to unzip $cabFile into $toolsDir "
  }

  # create empty sidecar so shimgen creates shim for GUI rather than console
  $installFile = Join-Path -Path $toolsDir `
                           -ChildPath "TotalCmd.exe"
  Set-Content -Path $installFile `
              -Value $null
  
  # create empty "ignore" sidecars so shimgen does not create shims
  foreach ($i in $(gci (Join-Path $toolsDir "*.exe"))) {
    $ignoreExec = $i | where-object {$i.name -notlike "TotalCmd*"}
    if ($ignoreExec) {
      $ignoreFile = Join-Path -Path $toolsDir `
                              -ChildPath $ignoreExec.name
      Set-Content -Path $ignoreFile".ignore" `
                  -Value $null
    }
  }
} catch {
  throw $_.Exception
}