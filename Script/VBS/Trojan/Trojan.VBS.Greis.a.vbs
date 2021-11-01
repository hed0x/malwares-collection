on error resume next
set instreem=wscript.stdin
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
select case stroption
   case "-r"
      intflag=2
      strshow="reboot"
   case "-s"
      intflag=1
      strshow="shutdown"
   case "-l"
      intflag=0
      strshow="logoff"
   case "-p"
      intflag=8
      strshow="power off"
   case "-fr"
      intflag=6
      strshow="force reboot"
   case "-fs"
      inrflag=5
      strshow="force shutdown"
   case "-fl"
      intflag=4
      strshow="force logoff"
   case "-fp"
      intflag=12
      strshow="force power off"
   case else
      usage()
      wscript.echo "Parameters error."
      wscript.quit
end select

usage()
outstreem.write "Conneting "&ipaddress&"...."
set objlocator=createobject("wbemscripting.swbemlocator")
set objswbemservices=objlocator.connectserver(ipaddress,"root/cimv2",username,password)
showerror(err.number)

outstreem.write "Applying for security privilege...."
objswbemservices.security_.privileges.add 23,true
objswbemservices.security_.privileges.add 18,true
showerror(err.number)

if intflag<>0 then
   outstreem.write "Checking boot os...."
   strwqlquery="select * from win32_computersystem"
   set colinstances=objswbemservices.execquery(strwqlquery)
   for each objinstance in colinstances
      bootos1=objinstance.properties_.item("systemstartupoptions")
   next
   strwqlquery="select * from win32_operatingsystem"
   set colinstances=objswbemservices.execquery(strwqlquery)
   for each objinstance in colinstances
      bootos2=objinstance.properties_.item("caption")
   next
   showerror(err.number)
   os2strlen=len(bootos2)+2
   stros1=left(bootos1(0),os2strlen)
   if stros1<>chr(34)&bootos2&chr(34) then
      wscript.echo "Current os is not default boot os!"
      outstreem.write "Do you want to continue?(y/n):"
      strinput=instreem.readline
      if lcase(strinput)<>"y" then
         wscript.echo "Canceled!"
         wscript.quit
      end if
   end if
end if

outstreem.write "Now, "&strshow&"ing target...."
strwqlquery="select * from win32_operatingsystem where primary='true'"
set colinstances=objswbemservices.execquery(strwqlquery)
for each objinstance in colinstances
   objinstance.win32shutdown(intflag)
next
if err.number=0 then
   wscript.echo "OK!"&vbcrlf&"Target has been "&strshow&" Successfully!"
else
   wscript.echo "Error!"
end if

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
wscript.echo "RRSS v1.05"
wscript.echo "Remote Reboot and Shutdown Script, by zzzEVAzzz"
wscript.echo "Welcome to visite www.isgrey.com"
wscript.echo "Usage:"
wscript.echo "cscript "&wscript.scriptfullname&" targetIP username password -r|s|l|p"
wscript.echo "-r : reboot target."
wscript.echo "-s : shutdown target."
wscript.echo "-l : logoff target current user."
wscript.echo "-p : power off target."
wscript.echo string(79,"*")&vbcrlf
end function