# Stop on all errors
$ErrorActionPreference = 'Stop';

# Auto Uninstaller should be able to detect and handle registry uninstalls (if it is turned on, it is in preview for 0.9.9).
$packageName = 'remotetestkit'
$registryUninstallerKeyName = '{2DF95E00-F429-4B59-B7D7-F24B82D3272E}_is1' #ensure this is the value in the registry
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
