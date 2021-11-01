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
ntlm=wscript.arguments(3)
port=wscript.arguments(4)
if not isnumeric(ntlm) or ntlm<0 or ntlm>2 then
   usage()
   wscript.echo "The value of NTML is wrong."
   wscript.quit
end if
if not isnumeric(port) or port<1 or port>65000 then
   usage()
   wscript.echo "The value of port is wrong."
   wscript.quit
end if

usage()
outstreem.write "Conneting "&ipaddress&"...."
set objlocator=createobject("wbemscripting.swbemlocator")
set objswbemservices=objlocator.connectserver(ipaddress,"root/default",username,password)
showerror(err.number)

outstreem.write "Setting NTLM="&ntlm&"...."
set objinstance=objswbemservices.get("stdregprov")
set objmethod=objinstance.methods_("SetDWORDvalue")
set objinparam=objmethod.inparameters.spawninstance_()
objinparam.hdefkey=&h80000002
objinparam.ssubkeyname="SOFTWARE\Microsoft\TelnetServer\1.0"
objinparam.svaluename="NTLM"
objinparam.uvalue=ntlm
set objoutparam=objinstance.execmethod_("SetDWORDvalue",objinparam)
showerror(objoutparam.returnvalue)

outstreem.write "Setting port="&port&"...."
objinparam.svaluename="TelnetPort"
objinparam.uvalue=port
set objoutparam=objinstance.execmethod_("SetDWORDvalue",objinparam)
showerror(objoutparam.returnvalue)

outstreem.write "Querying state of telnet server...."
set objswbemservices=objlocator.connectserver(ipaddress,"root\cimv2",username,password)
set colinstances=objswbemservices.execquery("select * from win32_service where name='tlntsvr'")
showerror(err.number)
for each objinstance in colinstances
if objinstance.startmode="Disabled" then
   outstreem.write "Telnet server has been disabled. Now changeing start mode to manual...."
   set objmethod=objinstance.methods_("changestartmode")
   set objinparam=objmethod.inparameters.spawninstance_()
   objinparam.startmode="Manual"
   set objoutparam=objinstance.execmethod_("changestartmode",objinparam)
   showerror(objoutparam.returnvalue)
end if
outstreem.write "Changeing state...."
if objinstance.started=true then
   intstatus=objinstance.stopservice()
   showerror(intstatus)
   wscript.echo "Target telnet server has been STOP Successfully."
else
   intstatus=objinstance.startservice()
   showerror(intstatus)
   wscript.echo "Target telnet server has been START Successfully!"
   if ipaddress="." then ipaddress="127.0.0.1"
   wscript.echo "Now, you can try: telnet "&ipaddress&" "&port&" , to get a shell."
end if
next

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
wscript.echo "RTCS v1.11"
wscript.echo "Remote Telnet Configure Script, by zzzEVAzzz"
wscript.echo "Welcome to visite www.isgrey.com"
wscript.echo "Usage:"
wscript.echo "cscript "&wscript.scriptfullname&" targetIP username password NTLMAuthor telnetport"
wscript.echo "It will auto change state of target telnet server."
wscript.echo string(79,"*")&vbcrlf
end function