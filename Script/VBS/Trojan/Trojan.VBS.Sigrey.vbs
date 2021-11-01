on error resume next
set outstreem=wscript.stdout
if (lcase(right(wscript.fullname,11))="wscript.exe") then
   set objShell=wscript.createObject("wscript.shell")
   objShell.Run("cmd.exe /k cscript //nologo "&chr(34)&wscript.scriptfullname&chr(34))
   wscript.quit
end if
if wscript.arguments.count<3 then
   usage()
   wscript.echo "Not enough parameters."
   wscript.quit
end if

ipaddress=wscript.arguments(0)
username=wscript.arguments(1)
password=wscript.arguments(2)
if wscript.arguments.count>3 then
   lognamelist=wscript.arguments(3)
   viewflag=lcase(lognamelist)
   if viewflag="-v" or viewflag="-view" then lognamelist=vbNULL
else
   lognamelist=vbNULL
end if

usage()
outstreem.write "Conneting "&ipaddress&"...."
set objlocator=createobject("wbemscripting.swbemlocator")
if lognamelist<>vbNULL then
   set objswbemservices=objlocator.connectserver(ipaddress,"root/cimv2",username,password)
   objswbemservices.security_.privileges.add 7,true
   showerror(err.number)
   arrlognames=split(lognamelist&",",",")
   for i=0 to ubound(arrlognames)-1
      clearlog(arrlognames(i))
   next
   wscript.echo "Specified logs have been cleared Successfully!"
else
   set objswbemservices=objlocator.connectserver(ipaddress,"root/default",username,password)
   showerror(err.number)
   wscript.echo "Enuming eventlog name...."&vbcrlf
   set objinstance=objswbemservices.get("stdregprov")
   objinstance.enumkey &h80000002,"SYSTEM\CurrentControlSet\Services\Eventlog",arrsubkeys
   for each subkey in arrsubkeys
      wscript.echo subkey
   next
   if err.number<>0 then
      wscript.echo "Error!"
      wscript.quit
   else
      wscript.echo vbcrlf&"All log names have been listed Successfully!"
   end if
end if

function clearlog(logname)
if logname="app" then logname="application"
if logname="sys" then logname="system"
if logname="sec" then logname="security"
if logname="*" or logname="-a" or logname="-all" then
   outstreem.write "Clearing all logs...."
   strwqlquery="select * from Win32_NTEventLogFile"
   set colinstances=objswbemservices.execquery(strwqlquery,"wql",&h20)
   for each objinstance in colinstances
      if objinstance.cleareventlog()<>0 then
         wscript.echo "Error!"
         wscript.quit
      end if
   next
   wscript.echo "OK!"
   wscript.echo "All logs have been cleared Successfully!"
   wscript.quit
elseif logname<>vbNULL then
   if logname="" then logname="NULL"
   outstreem.write "Clearing "&logname&" log...."
   strwqlquery="select * from Win32_NTEventLogFile where logfilename="&"'"&logname&"'"
   set colinstances=objswbemservices.execquery(strwqlquery,"wql",&h20)
   lognameisnull=1
   for each objinstance in colinstances
      lognameisnull=0
      if objinstance.cleareventlog()<>0 then
         wscript.echo "Error!"
         wscript.quit
      end if
   next
   if lognameisnull then
      wscript.echo vbcrlf&logname&" log is not exist."
      wscript.quit
   else
      wscript.echo "OK!"
   end if
end if
end function

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

function usage()
wscript.echo string(79,"*")
wscript.echo "RCLS v1.06"
wscript.echo "Remote Clear eventLogs Script, by zzzEVAzzz"
wscript.echo "Welcome to visite www.isgrey.com"
wscript.echo "Usage:"
wscript.echo "cscript "&wscript.scriptfullname&" targetIP username password [lognamelist]"
wscript.echo "lognamelist:"
wscript.echo "   logname1[,logname2...]    clear specified logs"
wscript.echo "   *|-a|-all                 clear all logs"
wscript.echo "   -v|-view|NULL             enum log names"
wscript.echo string(79,"*")&vbcrlf
end function