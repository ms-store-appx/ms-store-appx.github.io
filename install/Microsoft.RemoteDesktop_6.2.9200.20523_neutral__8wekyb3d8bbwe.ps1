
# Set file URLs
$certUrl = "https://ms-store-appx.github.io/download/cer/Microsoft.RemoteDesktop_6.2.9200.20523_neutral__8wekyb3d8bbwe.cer"
$appxUrl = "https://ms-store-appx.github.io/download/appx/Microsoft.RemoteDesktop_6.2.9200.20523_neutral__8wekyb3d8bbwe.appx"
$certPath = "$env:TEMP\remotedesktop.cer"
$appxPath = "$env:TEMP\remotedesktop.appx"

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
