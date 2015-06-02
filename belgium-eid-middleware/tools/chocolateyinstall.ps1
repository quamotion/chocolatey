# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'belgium-eid-middleware' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'belgium-eid-middleware' #ensure this is the value in the registry
$installerType = 'msi' 
$url = 'http://eid.belgium.be/nl/binaries/BeidMW407-7466-signed_tcm227-258868.msi'
$url64 = 'http://eid.belgium.be/nl/binaries/BeidMW407-64-7466-signed_tcm227-258854.msi' 
$silentArgs = '/quiet /norestart'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$certificateZipPath = Join-Path $toolsDir "Fedict_Cert_tcm227-161362.zip"
$certificatePath = Join-Path $toolsDir "fedict_codesiging.cer" # the typo in "signing" is intentional; this is the actual file name.
$fedictCertificateUrl = "http://faq.eid.belgium.be/files/Fedict_Cert_tcm227-161362.zip"

# Download the Fedict certificate
Get-ChocolateyWebFile "$packageName" "$certificateZipPath" "$fedictCertificateUrl"

# Extract the Fedict certificate
Get-ChocolateyUnzip "$certificateZipPath" "$toolsDir"

Write-Host "Installing the Fedict Code Signing Certificate from $certificatePath"
certutil -addstore TrustedPublisher "$certificatePath"

# Install the package
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" 