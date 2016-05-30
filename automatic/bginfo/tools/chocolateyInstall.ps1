param(
    [switch] $RunImmediately,
    [switch] $CreateStartupShortcut,
    [string] $BgiFile
)

$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$checksum = '{{Checksum}}'
$checksumType = 'sha256'
$url64 = "$url"
$checksum64 = "$checksum"
$checksumType64 = "checksumType"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Url64bit "$url64" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType64"
Write-Verbose "Accepting license..."
$regRoot = 'HKCU:\Software\Sysinternals'
$regPkg = 'BGInfo'
$regPath = Join-Path $regRoot $regPkg
if (!(Test-Path $regRoot)) {New-Item -Path "$regRoot"}
if (!(Test-Path $regPath)) {New-Item -Path "$regRoot" -Name "$regPkg"}
Set-ItemProperty -Path "$regPath" -Name EulaAccepted -Value 1
if ((Get-ItemProperty -Path "$regPath").EulaAccepted -ne 1) {
  throw "Failed setting registry value."
}

$arguments = @{}

$packageParameters = $env:chocolateyPackageParameters

# Now parse the packageParameters using good old regular expression
if ($packageParameters) {
    $match_pattern = "\/(?<option>([a-zA-Z]+)):(?<value>([`"'])?([a-zA-Z0-9- _\\:\.]+)([`"'])?)|\/(?<option>([a-zA-Z]+))"
    $option_name = 'option'
    $value_name = 'value'

    if ($packageParameters -match $match_pattern ){
        $results = $packageParameters | Select-String $match_pattern -AllMatches
        $results.matches | % {
        $arguments.Add(
            $_.Groups[$option_name].Value.Trim(),
            $_.Groups[$value_name].Value.Trim())
    }
    }
    else
    {
        Throw "Package Parameters were found but were invalid (REGEX Failure)"
    }

    if ($arguments.ContainsKey("BgiFile")) {
        $BgiFile = $arguments["BgiFile"]
    }

    if ($arguments.ContainsKey("CreateStartupShortcut")) {
        $CreateStartupShortcut = [switch]::Present
    }

    if ($arguments.ContainsKey("RunImmediately")) {
        $RunImmediately = [switch]::Present
    }
} else {
    Write-Debug "No Package Parameters Passed in"
}

$downloadedFile = ""

if ($BgiFile)
{
    if (-not (Test-Path "c:\ProgramData\SysInternals\BGInfo"))
    {
        New-Item "c:\ProgramData\SysInternals\BGInfo" -ItemType Container | Out-Null
    }

    $downloadedFile = Get-ChocolateyWebFile -Package "bginfo" -url $BgiFile -FileFullPath "c:\ProgramData\SysInternals\BgInfo\" -GetOriginalFileName
}

if ($CreateStartupShortcut.IsPresent)
{
    Install-ChocolateyShortcut -shortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\bginfo.lnk" -targetPath "C:\ProgramData\chocolatey\bin\Bginfo.exe" -arguments "$downloadedFile /nolicprompt /timer:0" -description "Launch bginfo silently"

    if ($RunImmediately.IsPresent)
    {
        & "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\bginfo.lnk"
    }
}
else 
{
    if ($RunImmediately.IsPresent)
    {
        & "C:\ProgramData\chocolatey\bin\Bginfo.exe" /nolicprompt /timer:0
    }
}
