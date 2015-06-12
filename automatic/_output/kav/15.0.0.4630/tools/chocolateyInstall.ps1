﻿$packageName = 'kav'
$installerType = 'EXE'
$LCID = (Get-Culture).LCID
$silentArgs = ''
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

##Spanish - Spain (Modern Sort) - Spain (Traditional Sort) (es-es)
##For now Spanish - Mexico (es-mx) is used
if(($LCID -eq "3082") -or ($LCID -eq "1034")){
$url = 'ftp://198.65.112.62/consumer-products/Current_Versions/KAV_Win_2015/KAV15.0.0.463es-MX_TR20140428.exe'
}

##Spanish - Mexico (es-mx)
elseif($LCID -eq "2058"){
$url = 'ftp://198.65.112.62/consumer-products/Current_Versions/KAV_Win_2015/KAV15.0.0.463es-MX_TR20140428.exe'
}

##French
#elseif($LCID -eq "1036"){
#$url = 'http://products.kaspersky-labs.com/french/homeuser/kav2014/kav14.0.0.4651fr-fr.exe'
#}

##German
#elseif($LCID -eq "1031"){
#$url = 'http://products.kaspersky-labs.com/german/homeuser/kav2014/kav14.0.0.4651de-de.exe'
#}

##Italian
#elseif($LCID -eq "1040"){
#$url = 'http://products.kaspersky-labs.com/italian/homeuser/kav2014/kav14.0.0.4651it-it.exe'
#}

##Portuguese - Brazil (pt-br)
elseif($LCID -eq "1046"){
$url = 'ftp://198.65.112.62/consumer-products/Current_Versions/KAV_Win_2015/kav15.0.0.463pt-br_TR20140527.exe'
}

##Portuguese - Portugal (pt-pt)
##For now Portuguese - Brazil (pt-br) is used
elseif($LCID -eq "2070"){
$url = 'ftp://198.65.112.62/consumer-products/Current_Versions/KAV_Win_2015/kav15.0.0.463pt-br_TR20140527.exe'
}

##Portuguese - South Africa (pt-za) ?
#elseif($LCID -eq "XXXX"){
#$url = 'http://products.kaspersky-labs.com/portuguese/homeuser/kav2014/kav14.0.0.4651pt-za.exe'
#}

##Russian - Russian (ru-ru) - Russian-Moldava (ru-mo)
#elseif(($LCID -eq "1049") -or ($LCID -eq "2073")){
#$url = 'http://products.kaspersky-labs.com/russian/homeuser/kav2014/kav14.0.0.4651ru-ru.exe'
#}

##English - United Kingdom (en-gb)
##For now English - US (en-us) is used
elseif($LCID -eq "2057"){
$url = 'ftp://198.65.112.62/consumer-products/Current_Versions/KAV_Win_2015/KAV15.0.0.463en-US_TR20140428.exe'
}

##English - US (en-us)
else{
$url = 'ftp://198.65.112.62/consumer-products/Current_Versions/KAV_Win_2015/KAV15.0.0.463en-US_TR20140428.exe'
}

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes

#LCID table
#http://msdn.microsoft.com/es-es/goglobal/bb964664.aspx

#downloads location
#http://products.kaspersky-labs.com/