# stop on all errors
$ErrorActionPreference = 'Stop';

$msiPackageGuid = '{07BAE775-6B29-4D6D-974B-57C5BFA5EF59}'
$msiArgs = "/x $msiPackageGuid /qn REBOOT=ReallySuppress"

Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'