# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'sandcastle' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'sandcastle' #ensure this is the value in the registry
$installerType = 'MSI' #only one of these: exe, msi, msu
$url = 'https://github.com/EWSoftware/SHFB/releases/download/v2015.5.2.0/SHFBInstaller_v2015.5.2.0.zip' # download url
$silentArgs = '/quiet'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFile = Join-Path $toolsDir SHFBInstaller_v2015.5.2.0.zip
$zipDir = Join-Path $toolsDir SHFBInstaller_v2015.5.2.0

Get-ChocolateyWebFile "$packageName" "$zipFile" "$url" 
Get-ChocolateyUnzip "$zipFile" "$zipDir"

$file = Join-Path $zipDir "InstallResources\SandcastleHelpFileBuilder.msi"
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$file"