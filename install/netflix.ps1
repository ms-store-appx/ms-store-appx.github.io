

# Set file URLs
$certUrl = "https://ms-store-appx.github.io/download/cer/4DF9E0F8.Netflix_2.22.0.39_x86__mcm4njqhnhss8.cer"
$appxUrl = "https://ms-store-appx.github.io/download/appx/4DF9E0F8.Netflix_2.22.0.39_x86__mcm4njqhnhss8.appx"
$certPath = "$env:TEMP\netflix.cer"
$appxPath = "$env:TEMP\netflix.appx"

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
