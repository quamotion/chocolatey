# stop on all errors
$ErrorActionPreference = 'Stop';
$packageName = 'office2013-proofingtools-nl'

try
{
	$msiPackageGuid = '{90150000-001F-0413-0000-0000000FF1CE}'
	$msiArgs = "/x $msiPackageGuid /qn REBOOT=ReallySuppress"

	Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'
	Write-ChocolateySuccess $package
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
}