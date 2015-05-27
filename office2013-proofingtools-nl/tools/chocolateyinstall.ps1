# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'office2013-proofingtools-nl' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = '{90150000-001F-0413-0000-0000000FF1CE}' #ensure this is the value in the registry
$installerType = 'EXE' #only one of these: exe, msi, msu
$url = 'http://download.microsoft.com/download/4/0/1/401E7341-886C-4A95-8D0A-018314733702/proofingtools_nl-nl-x86.exe' # download url

$silentArgs = '/quiet'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# main helper functions - these have error handling tucked into them already
# see https://github.com/chocolatey/choco/wiki/HelpersReference
# Install an application, will assert administrative rights
# add additional optional arguments as necessary
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"