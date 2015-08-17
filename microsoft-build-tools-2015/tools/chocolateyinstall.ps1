$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName   = 'microsoft-build-tools-2015'
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = 'http://download.microsoft.com/download/E/E/D/EEDF18A8-4AED-4CE0-BEBE-70A83094FC5A/BuildTools_Full.exe'
  silentArgs    ='/Silent /NoRestart /Log $($env:temp)'
  validExitCodes = @(
        0, # success
        3010 # success, restart required
    )
}
Install-ChocolateyPackage @packageArgs