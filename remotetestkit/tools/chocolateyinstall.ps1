$ErrorActionPreference = 'Stop';

$packageName = 'remotetestkit'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT'
$url = 'https://appkitbox.com/en/wp-content/download/remotetestkit-en.exe'

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"