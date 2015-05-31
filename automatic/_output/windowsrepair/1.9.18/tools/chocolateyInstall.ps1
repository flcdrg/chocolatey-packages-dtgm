﻿$packageName = 'windowsrepair'
$installerType = 'EXE'
#$url = 'http://www.tweaking.com/files/setups/tweaking.com_windows_repair_aio_setup.exe'
$url = 'http://www.tweaking.com/files/setups/tweaking.com_windows_repair_aio_setup.exe'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes