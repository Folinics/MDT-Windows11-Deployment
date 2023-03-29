# Make temp directory 
New-Item -Path 'C:\Microsoft365Installation' -ItemType directory

# Copy items
Copy-Item "\\wds002-bueno\Deploy$\Custom Scripts\Microsoft365Installation\*" "C:\Microsoft365Installation" -Recurse

# Change location
Set-Location C:\Microsoft365Installation

# Start Office download
setup.exe /download configuration-Office365-x64.xml


