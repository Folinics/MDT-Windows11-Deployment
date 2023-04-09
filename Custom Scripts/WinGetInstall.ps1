Invoke-WebRequest 'https://cdn.winget.microsoft.com/cache/source.msix' -OutFile 'C:\Users\Administrator\Downloads\Microsoft.Winget.Source.msix' -UseBasicParsing
Push-Location 'c:\Users\Administrator\Downloads'
Add-AppxPackage -Path 'Microsoft.Winget.Source.msix'
Remove-Item Microsoft.Winget.Source.msix