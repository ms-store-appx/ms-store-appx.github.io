
# Set file URLs
$certUrl = "https://ms-store-appx.github.io/download/cer/survivalcraft.cer"
$appxUrl = "https://ms-store-appx.github.io/download/appx/survivalcraft.appx"
$certPath = "$env:TEMP\survivalcraft.cer"
$appxPath = "$env:TEMP\survivalcraft.appx"

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
