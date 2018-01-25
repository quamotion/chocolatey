$ErrorActionPreference = 'Stop';

$packageName = 'remotetestkit'
$registryUninstallerKeyName = '{2DF95E00-F429-4B59-B7D7-F24B82D3272E}_is1'
$installerType = 'EXE'
$url = 'https://appkitbox.com/en/wp-content/download/remotetestkit-en.exe'
$silentArgs = '/VERYSILENT'
$validExitCodes = @(0)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"