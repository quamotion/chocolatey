# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'quamotion' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = '{07B0C5A9-BA04-4D86-B3E3-2E7D1BFE13F5}' #ensure this is the value in the registry
$installerType = 'MSI' #only one of these: exe, msi, msu
$url = 'http://quamotion.mobi/Product/DownloadQuamotion?user=chocolatey' # download url
$silentArgs = '/quiet'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"