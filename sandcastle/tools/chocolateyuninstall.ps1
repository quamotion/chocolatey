# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'sandcastle'

try
{
	$msiPackageGuid = '{07BAE775-6B29-4D6D-974B-57C5BFA5EF59}'
	$msiArgs = "/x $msiPackageGuid /qn REBOOT=ReallySuppress"

	Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'
	Write-ChocolateySuccess $package
} catch {
	Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
}