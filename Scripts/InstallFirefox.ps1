# Installs latest version of Firefox, either 32 bit or 64 depending on the OS
# Author: Folinic
#
#

# Define temp
$temp = "C:\temp"

# Check if the directory exists
if(!(Test-Path -Path $temp)) {
    # If the directory does not exist, create it
    New-Item -ItemType Directory -Force -Path $temp
}

# Set working directory
Set-Location -Path $temp

# Get the OS architecture
$osArchitecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture

# Check if the OS is 32-bit
if ($osArchitecture -eq "32-bit") {
    $url = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win&lang=en-US"
}
# else assume 64-bit
else {
   $url = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US"
}

# Download the
Invoke-WebRequest -Uri $url -OutFile "Firefox_Latest.msi"


# Use msiexec to install the software
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i LatestFirefox.msi /qn" -Wait

# Clean up
Remove-Item -Path LatestFirefox.msi
