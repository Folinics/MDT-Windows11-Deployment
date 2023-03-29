# Make temp directory
New-Item -Path 'C:\Microsoft365Installation' -ItemType directory

# Copy items
Copy-Item "\\wds002-bueno\Deploy$\Custom Scripts\Microsoft365Installation\*" "C:\Microsoft365Installation" -Recurse

# Change location
Set-Location C:\Microsoft365Installation\

# Start Office download
./setup.exe /download M365-x64-Custom.xml

# Install Office
./setup.exe /configure M365-x64-Custom.xml

# Clean up
cd C:\
Remove-Item "C:\Microsoft365Installation\" -Recurse -Force