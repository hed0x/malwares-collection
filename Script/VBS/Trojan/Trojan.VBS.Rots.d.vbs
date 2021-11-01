on error resume next
set outstreem=wscript.stdout
if (lcase(right(wscript.fullname,11))="wscript.exe") then
   set objShell=wscript.createObject("wscript.shell")
   objShell.Run("cmd.exe /k cscript //nologo "&chr(34)&wscript.scriptfullname&chr(34))
   wscript.quit
end if
if wscript.arguments.count<4 then
   usage()
   wscript.echo "Not enough parameters."
   wscript.quit
end if

ipaddress=wscript.arguments(0)
username=wscript.arguments(1)
password=wscript.arguments(2)
stroption=wscript.arguments(3)
select case lcase(stroption)
case "-l"
case "-ki","-kn"
   if wscript.arguments.count<5 then
      usage()
      wscript.echo "Not enough parameters."
      wscript.quit
   else
      strprocess=wscript.arguments(4)
   end if
case "-c"
   if wscript.arguments.count<5 then
      usage()
      wscript.echo "Not enough parameters."
      wscript.quit
   else
      strcmdline=wscript.arguments(4)
   end if
case else
   usage()
   wscript.echo "Parameters Error."
   wscript.quit
end select

usage()
outstreem.write "Conneting "&ipaddress&"...."
set objlocator=createobject("wbemscripting.swbemlocator")
set objswbemservices=objlocator.connectserver(ipaddress,"root/cimv2",username,password)
showerror(err.number)

select case lcase(stroption)
case "-l"
   outstreem.write "Listing process...."
   set colinstances=objswbemservices.execquery("select * from win32_process")
   showerror(err.number)
   wscript.echo vbcrlf&"Name"&chr(9)&chr(9)&"Pid"&chr(9)&"ExecutablePath"
   for each objinstance in colinstances
   if len(objinstance.name)<8 then
      strname=objinstance.name&chr(9)
   else
      strname=objinstance.name
   end if
   wscript.echo strname&chr(9)&objinstance.handle&chr(9)&objinstance.executablepath
   next
   wscript.echo vbcrlf&"All process have been listed Successfully!"
case "-ki"
   outstreem.write "Killing id="&strprocess&" process...."
   set objinstance=objswbemservices.get("win32_process.handle="&"'"&strprocess&"'")
   if vartype(objinstance)<>vbobject then
      wscript.echo vbcrlf&"Specified process is not exist."
      wscript.quit
   else
      set objmethod=objinstance.methods_("terminate")
      set objinparam=objmethod.inparameters.spawninstance_()
      objinparam.reason=0
      set objoutparam=objinstance.execmethod_("terminate",objinparam)
      showerror(objoutparam.returnvalue)
   end if
case "-kn"
   outstreem.write "Killing name="&strprocess&" process...."
   strwqlquery="select * from win32_process where name="&"'"&strprocess&"'"
   set colinstances=objswbemservices.execquery(strwqlquery)
   if colinstances.count<1 then
      wscript.echo vbcrlf&"Specified process is not exist."
      wscript.quit
   else
      for each objinstance in colinstances
         set objmethod=objinstance.methods_("terminate")
         set objinparam=objmethod.inparameters.spawninstance_()
         objinparam.reason=0
         set objoutparam=objinstance.execmethod_("terminate",objinparam)
      next
      showerror(objoutparam.returnvalue)
   end if
case "-c"
   outstreem.write "Createing specified process...."
   set objinstance=objswbemservices.get("win32_process")
   set objmethod=objinstance.methods_("create")
   set objinparam=objmethod.inparameters.spawninstance_()
   objinparam.commandline=strcmdline
   set objoutparam=objinstance.execmethod_("create",objinparam)
   showerror(objoutparam.returnvalue)
   wscript.echo "New Process ID is "&objoutparam.processid
end select

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
wscript.echo "RPMS v1.02"
wscript.echo "Remote Process Manager Script, by zzzEVAzzz"
wscript.echo "Welcome to visite www.isgrey.com"
wscript.echo "Usage:"
wscript.echo "cscript "&wscript.scriptfullname&" targetIP username password option [parameter]"
wscript.echo "option:"
wscript.echo "    -l  :  list target process. no parameter."
wscript.echo "    -ki process_id  :  kill the process as id."
wscript.echo "    -kn process_name  :  kill the process as name."
wscript.echo "    -c cmdline  :  create a process as cmdline."
wscript.echo string(79,"*")&vbcrlf
end function