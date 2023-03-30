# MDT-Windows11-Deployment
My implementation of Microsoft Deployment Toolkit for Windows 11 deployments.

# Known issues credits
https://github.com/MicrosoftDocs/memdocs/blob/main/memdocs/configmgr/mdt/known-issues.md  
https://oofhours.com/2022/10/06/get-ready-and-get-mdt-ready-to-deploy-windows-11-22h2/  
https://twitter.com/jarwidmark/status/1577868717026906123  

#Removing Instagram, Facebook
The Start Menu layout in Windows 11 is stored at

C:\Users\*\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState

You make your perfect layout with all stuff pinned that is needed and unpinned that is not needed, and then you make a script to replace that file. Might need Admin for some of the user profiles. If you replace that file in Default profile, it persists in new accounts created on that machine. That file works across machines, can move from one to another.

Thats the only way to remove pinned shortcuts, as those apps are not really apps and no other script with Remove-Appx***** will work on those.

$Source = 'Helpers/start.bin'

$Destination = 'C:\Users\*\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState'

Get-ChildItem $Destination | ForEach-Object {Copy-Item -Path $Source -Destination $_ -Force}

Or good old xcopy. This snipped above is from old experimental script and may misbehave. You also need to restart StartMenuExperienceHost process after this.  
Credits: https://www.reddit.com/r/sysadmin/comments/y254xp/how_to_i_remove_apps_like_instagram_facebook_etc/

# Bootstrap.ini and CustomSettings.ini credits
https://www.reddit.com/r/MDT/comments/b8344q/configuration_of_bootstrapini_and/
https://itinlegal.wordpress.com/2017/10/17/mdt-tutorial-part-5/

# Other sources
https://learn.microsoft.com/en-us/windows/deployment/deploy-windows-cm/create-a-task-sequence-with-configuration-manager-and-mdt  
https://phoenixnap.com/kb/install-winget  
https://www.reddit.com/r/LogitechG/comments/du8p50/logitech_g_hub_profiles_backup/
