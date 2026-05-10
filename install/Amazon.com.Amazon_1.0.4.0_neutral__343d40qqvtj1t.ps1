
# Set file URLs
$certUrl = "https://appxboxdl.dankassassin368.com/Windows%208.1%20APPX%20Files/Apps/Amazon/Amazon.com.Amazon_1.0.4.0_neutral__343d40qqvtj1t.cer"
$appxUrl = "https://appxboxdl.dankassassin368.com/Windows%208.1%20APPX%20Files/Apps/Amazon/Amazon.com.Amazon_1.0.4.0_neutral__343d40qqvtj1t.appx"
$certPath = "$env:TEMP\amazon.cer"
$appxPath = "$env:TEMP\amazon.appx"

# Download Certificate
Write-Host "Downloading certificate..."
Invoke-WebRequest -Uri $certUrl -OutFile $certPath

# Install Certificate
Write-Host "Installing certificate..."
Import-Certificate -FilePath $certPath -CertStoreLocation Cert:\LocalMachine\TrustedPeople

# Download APPX package
Write-Host "Downloading APPX package..."
Invoke-WebRequest -Uri $appxUrl -OutFile $appxPath

# Install APPX
Write-Host "Installing APPX package..."
Add-AppxPackage -Path $appxPath

Write-Host "Installation complete!"
