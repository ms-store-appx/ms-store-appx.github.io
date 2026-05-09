# Set file URLs
$certUrl = "https://dl.retiled.xyz/Apptravaganza%21/iHeartRadio%20v4.3/iHeartRadio%20v4.3.cer"
$appxUrl = "https://dl.retiled.xyz/Apptravaganza%21/iHeartRadio%20v4.3/iHeartRadio%20v4.3.appx"
$certPath = "$env:TEMP\iheartradio.cer"
$appxPath = "$env:TEMP\iheartradio.appx"

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
