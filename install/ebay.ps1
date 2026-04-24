# Set file URLs
$certUrl = "https://ms-store-appx.github.io/download/cer/eBayInc.eBay_1.1.1.53_neutral__1618n3s9xq8tw.cer"
$appxUrl = "https://ms-store-appx.github.io/download/appx/eBayInc.eBay_1.1.1.53_neutral__1618n3s9xq8tw.appx"
$certPath = "$env:TEMP\ebay.cer"
$appxPath = "$env:TEMP\ebay.appx"

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
