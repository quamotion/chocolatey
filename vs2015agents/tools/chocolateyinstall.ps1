$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName   = 'vs2015agents'
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = 'http://download.microsoft.com/download/8/A/F/8AFFDD5A-53D9-46EB-98D7-B61BBCAF0DE6/vstf_testagent.exe'
  silentArgs    ='/Silent /NoRestart /Log $($env:temp\vs2015agents.log)'
  validExitCodes = @(
        0, # success
        3010 # success, restart required
    )
}
Install-ChocolateyPackage @packageArgs