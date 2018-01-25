$ErrorActionPreference = 'Stop';

$packageName = 'remotetestkit'
$registryUninstallerKeyName = '{2DF95E00-F429-4B59-B7D7-F24B82D3272E}_is1'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT'
$validExitCodes = @(0)

if ([Environment]::Is64BitProcess)
{
	$file = (Get-ItemProperty "hklm:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2DF95E00-F429-4B59-B7D7-F24B82D3272E}_is1").UninstallString
}
else
{
	$file = (Get-ItemProperty "hklm:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{2DF95E00-F429-4B59-B7D7-F24B82D3272E}_is1").UninstallString
}

Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
