# stop on all errors
$ErrorActionPreference = 'Stop';
$packageName = 'belgium-eid-middleware'

try
{
	$msiPackageGuid = '{824563DE-75AD-4166-9DC0-B6482F207466}'
	$msiArgs = "/x $msiPackageGuid /qn REBOOT=ReallySuppress"

	Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'
	Write-ChocolateySuccess $package
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
}
