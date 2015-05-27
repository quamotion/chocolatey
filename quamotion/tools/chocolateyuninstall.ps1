# stop on all errors
$ErrorActionPreference = 'Stop';
$packageName = 'quamotion'

try
{
	$msiPackageGuid = '{07B0C5A9-BA04-4D86-B3E3-2E7D1BFE13F5}'
	$msiArgs = "/x $msiPackageGuid /qn REBOOT=ReallySuppress"

	Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'
	Write-ChocolateySuccess $package
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
}