# stop on all errors
$ErrorActionPreference = 'Stop';

$versionNumber = '2015.10.10.0'
$packageName = 'sandcastle' # arbitrary name for the package, used in messages
$installerType = 'MSI' #only one of these: exe, msi, msu
$url = 'https://github.com/EWSoftware/SHFB/releases/download/v' + $versionNumber + '/SHFBInstaller_v' + $versionNumber + '.zip' # download url
$silentArgs = '/quiet /norestart'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFile = Join-Path $toolsDir ('SHFBInstaller_v' + $versionNumber + '.zip')
$zipDir = Join-Path $toolsDir ('SHFBInstaller_v' + $versionNumber)

Get-ChocolateyWebFile "$packageName" "$zipFile" "$url" 
Get-ChocolateyUnzip "$zipFile" "$zipDir"

$file = Join-Path $zipDir "InstallResources\SandcastleHelpFileBuilder.msi"
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$file" -validExitCodes $validExitCodes