# stop on all errors
$ErrorActionPreference = 'Stop';

# Variables
$packageName = 'remotetestkit' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = '{2DF95E00-F429-4B59-B7D7-F24B82D3272E}_is1' #ensure this is the value in the registry
$installerType = 'EXE'
$url = 'https://appkitbox.com/en/wp-content/download/remotetestkit-en.exe' # download url
$silentArgs = '/VERYSILENT'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# main helper functions - these have error handling tucked into them already
# see https://github.com/chocolatey/choco/wiki/HelpersReference
# Install an application, will assert administrative rights
# add additional optional arguments as necessary
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"