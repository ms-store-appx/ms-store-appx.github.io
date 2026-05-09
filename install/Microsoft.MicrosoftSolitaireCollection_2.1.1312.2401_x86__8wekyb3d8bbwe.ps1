# Set file URLs
$certUrl = "https://appxboxdl.dankassassin368.com/Windows%208.1%20APPX%20Files/Games/Microsoft%20Solitare%20Collection/Microsoft.MicrosoftSolitaireCollection_2.1.1312.2401_x86__8wekyb3d8bbwe.cer"
$appxUrl = "https://appxboxdl.dankassassin368.com/Windows%208.1%20APPX%20Files/Games/Microsoft%20Solitare%20Collection/Microsoft.MicrosoftSolitaireCollection_2.1.1312.2401_x86__8wekyb3d8bbwe.appx"
$certPath = "$env:TEMP\accuweather.cer"
$appxPath = "$env:TEMP\accuweather.appx"

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
