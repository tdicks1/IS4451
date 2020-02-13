# Install NuGet provider
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Trust the PSGallery source
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

# Decide to install or update on module already present
# If loop checks if the module already exists
if ((Get-Module -Name 'SpeculationControl')){
    Write-Host "Module is already imported. Updating Existing Module."# returns True
    Update-Module SpeculationControl
}
#If the module does not exist, the module is installed.
else {
    Write-Host "Module is does not exist. Importing module now." # returns False
    Install-Module SpeculationControl
}
    

#Check for vulnerabilities
Get-SpeculationControlSettings

# TODO: Error handling (i.e. no Internet connection)
#if loop tests internet connection by attempting to connect to google.com
if (Test-NetConnection -ComputerName www.google.com) {
    Write-Host "Internet connection successful." #if the connection succeeds
}

else {
    Write-Host "Internet connection failed." #if the connection fails
}

#git commit and git push to push script to github