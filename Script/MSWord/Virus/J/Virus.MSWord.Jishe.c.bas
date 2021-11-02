olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jishe.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jishe.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JiShenhua.bas 
in file: Virus.MSWord.Jishe.c - OLE stream: 'Macros/VBA/JiShenhua'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Version 1.0
'这是本人学习制作的一个宏病毒防杀程序,它可以防止部分WORD宏病毒的感染
'这需要有大量的宏病毒特征码作为依据,如果你发现有本疫苗无能为力的宏病毒
'感谢您及时与我联系,你也可以自选修改本程序,以加强本疫苗的功力
'与病毒作斗争就如同抵御社会犯罪,需要大家的共同努力
'欢迎加入其中并成为一名战士,也许你正是大家期待已久的勇士
'
'程序设计: 冀慎华
'办公电话:
'伊妹地址: club@263.net
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
    
    '当前打开模板文件名
    file$ = WordBasic.[MacroFileName$]()
    
    '关闭宏病毒保护
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
    '检查打开的文档中是否有病毒
    HasVirus = False
    If (Documents.Count <> 0) Then
        For Each myDoc In Documents
            If (myDoc.VBProject.Protection = 0) Then
                For Each xitem In myDoc.VBProject.VBComponents
                    If (xitem.Name = "ThisDocument") Then
                        '此部分有代码时，如果找不到本模块标志则认定为病毒
                        LinesofCode = xitem.codemodule.CountOfLines
                        If (LinesofCode > 0) And (Not HasVirus) Then
                            HasVirus = Not xitem.codemodule.Find(answer, 1, 1, 1 + LinesofCode, 1)
                        End If
                    ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                        '文档中除本模块代码之外，如果还有其它代码则认定为病毒
                        HasVirus = True
                    End If
                Next
            End If
        Next
    End If
    '检查文档模板中是否有病毒
    If Not HasVirus Then
        For Each myTemp In Templates
            If (myTemp.VBProject.Protection = 0) Then
                For Each xitem In myTemp.VBProject.VBComponents
                    If (xitem.Name = "ThisDocument") Then
                        '此部分有代码时，如果找不到本模块标志则认定为病毒
                        LinesofCode = xitem.codemodule.CountOfLines
                        If (LinesofCode > 0) And (Not HasVirus) Then
                            HasVirus = Not xitem.codemodule.Find(answer, 1, 1, 1 + LinesofCode, 1)
                        End If
                    ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                        '文档中除本模块代码之外，如果还有其它代码则认定为病毒
                        HasVirus = True
                    End If
                Next
            End If
        Next
    End If
    If HasVirus Then '如果有病毒，向用户提出报告
        Load VirusReport
        VirusReport.Show
    End If
    '向打开的文档中写入本代码
    If (Documents.Count <> 0) Then
        For Each myDoc In Documents
            '检查文档中是否已经有本模块代码
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
    '向WORD模板中写入本代码
    For Each myTemp In Templates
            '检查文档中是否已经有本模块代码
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
    
    answer = "FreeAntiWordMacroVirus"  '本病毒疫苗特征码
    
    '当前打开模板文件名
    file$ = WordBasic.[MacroFileName$]()
    
    '关闭宏病毒保护
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
    '向新建的文档中写入本代码
    If (Documents.Count <> 0) Then
        For Each myDoc In Documents
            '检查文档中是否已经有本模块代码
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
'关闭WORD之前清理autoexec.dot文件中的病毒
Dim LinesofCode As Long
Dim myDoc As Document
Dim FileName As String

'清除打开文档中的病毒代码
If (UCase(Dir("c:\Autoexec.dot")) = "AUTOEXEC.DOT") Then
    WordBasic.DisableAutoMacros
    Documents.Open FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
    For Each myDoc In Word.Documents
        If (UCase(myDoc.Name) = "AUTOEXEC.DOT") And (myDoc.VBProject.Protection = 0) Then
            For Each xitem In myDoc.VBProject.VBComponents
                If (xitem.Name = "ThisDocument") Then
                    LinesofCode = xitem.codemodule.CountOfLines
                    If LinesofCode > 0 Then
                        xitem.codemodule.deletelines 1, LinesofCode
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
in file: Virus.MSWord.Jishe.c - OLE stream: 'Macros/VBA/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





































'初始化窗体，设定窗体参数
Private Sub UserForm_Initialize()
CheckBox1.Value = True
If Documents.Count <> 0 Then
    Information.Value = ActiveDocument.FullName
End If
Beep
End Sub
Private Sub CommandButtonNothing_Click()
'关闭窗体，不作任何处理
Dim ret As Integer
ret = MsgBox("领导，虽然你可能会批评我，但还是要告诉你，这样做是很危险的。是否真得不做处理，请指示。", vbYesNo + vbDefaultButton2, "再次报告！")
If ret = vbYes Then
    Unload VirusReport
End If
End Sub
Private Sub CommandButtonOpenVisubasic_Click()
'打开VisulBasic编辑器
    ShowVisualBasicEditor = True
End Sub
Private Sub CommandButtonDetail_Click()
'报告病毒的详细情况
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
                LinesofCode = xitem.codemodule.CountOfLines
                If LinesofCode > 0 Then
                    If (Not xitem.codemodule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块中可能有病毒。" + Chr(10)
                        If (xitem.codemodule.Find("Document_Open", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块中有自动运行代码Document_Open。" + Chr(10)
                        End If
                        If (xitem.codemodule.Find("Document_Close", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块中有自动运行代码Document_Close。" + Chr(10)
                        End If
                        If (xitem.codemodule.Find("Document_New", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块中有自动运行代码Document_New。" + Chr(10)
                        End If
                        If (xitem.codemodule.Find("insertlines", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块中有自我复制语句InsertLines。" + Chr(10)
                        End If
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块可能是病毒。" + Chr(10)
                If (xitem.codemodule.Find("MacroCopy", 1, 1, 1 + LinesofCode, 1)) Then
                    myStr = myStr + myTemp.Name + "<" + xitem.Name + ">模块中有自我复制语句MacroCopy。" + Chr(10)
                End If
            End If
        Next
    End If
Next
For Each myDoc In Word.Documents
    If (myDoc.VBProject.Protection = 0) Then
        For Each xitem In myDoc.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.codemodule.CountOfLines
                If LinesofCode > 0 Then
                    If (Not xitem.codemodule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块中可能有病毒。" + Chr(10)
                        If (xitem.codemodule.Find("Document_Open", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块中有自动运行代码Document_Open。" + Chr(10)
                        End If
                        If (xitem.codemodule.Find("Document_Close", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块中有自动运行代码Document_Close。" + Chr(10)
                        End If
                        If (xitem.codemodule.Find("Document_New", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块中有自动运行代码Document_New。" + Chr(10)
                        End If
                        If (xitem.codemodule.Find("insertlines", 1, 1, 1 + LinesofCode, 1)) Then
                            myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块中有自我复制语句InsertLines。" + Chr(10)
                        End If
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块可能是病毒。" + Chr(10)
                If (xitem.codemodule.Find("MacroCopy", 1, 1, 1 + LinesofCode, 1)) Then
                    myStr = myStr + myDoc.Name + "<" + xitem.Name + ">模块中有自我复制语句MacroCopy。" + Chr(10)
                End If
            End If
        Next
    End If
Next
Information.Value = myStr
End Sub
Private Sub CommandButtonKill_Click()
'杀病毒
Dim LinesofCode As Long
Dim myDoc As Document
Dim myTemp As Template
Dim answer As String

answer = "MyMacroVirusKillerV1.0"
'清除Autoexec.dot中的病毒
If (UCase(Dir("c:\Autoexec.dot")) = "AUTOEXEC.DOT") Then
    WordBasic.DisableAutoMacros
    Documents.Open FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
    Set myDoc = ActiveDocument
    If (myDoc.VBProject.Protection = 0) Then
        For Each xitem In myDoc.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.codemodule.CountOfLines
                If LinesofCode > 0 Then
                    If (Not xitem.codemodule.Find(answer, star, 1, star + LinesofCode, 1)) Then
                        xitem.codemodule.deletelines 1, LinesofCode
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
'清除打开文档中的病毒代码
For Each myDoc In Word.Documents
    If (myDoc.VBProject.Protection = 0) Then
        For Each xitem In myDoc.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.codemodule.CountOfLines
                If LinesofCode > 0 Then
                    If (Not xitem.codemodule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        xitem.codemodule.deletelines 1, LinesofCode
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myDoc.VBProject.VBComponents.Remove (xitem)
            End If
        Next
    End If
Next
'清除WORD模板中的病毒代码
For Each myTemp In Word.Templates
    If (myTemp.VBProject.Protection = 0) Then
        For Each xitem In myTemp.VBProject.VBComponents
            If (xitem.Name = "ThisDocument") Then
                LinesofCode = xitem.codemodule.CountOfLines
                If LinesofCode > 0 Then
                    If (Not xitem.codemodule.Find(answer, 1, 1, 1 + LinesofCode, 1)) Then
                        xitem.codemodule.deletelines 1, LinesofCode
                    End If
                End If
            ElseIf (xitem.Name <> "JiShenhua") And (xitem.Name <> "VirusReport") Then
                myTemp.VBProject.VBComponents.Remove (xitem)
            End If
        Next
    End If
Next
Unload VirusReport
MsgBox "按照您的指示，我已经把怀疑是病毒的东东全部清理完毕， 不过也可能好心办了坏事，那可不要怪我哟。", vbOKOnly, "冀慎华向您报告："
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Jishe.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 919 bytes
' Macros/VBA/JiShenhua - 12839 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B "Version 1.0"
' Line #1:
' 	QuoteRem 0x0000 0x0043 "这是本人学习制作的一个宏病毒防杀程序,它可以防止部分WORD宏病毒的感染"
' Line #2:
' 	QuoteRem 0x0000 0x0045 "这需要有大量的宏病毒特征码作为依据,如果你发现有本疫苗无能为力的宏病毒"
' Line #3:
' 	QuoteRem 0x0000 0x003C "感谢您及时与我联系,你也可以自选修改本程序,以加强本疫苗的功力"
' Line #4:
' 	QuoteRem 0x0000 0x0031 "与病毒作斗争就如同抵御社会犯罪,需要大家的共同努力"
' Line #5:
' 	QuoteRem 0x0000 0x0037 "欢迎加入其中并成为一名战士,也许你正是大家期待已久的勇士"
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x0010 "程序设计: 冀慎华"
' Line #8:
' 	QuoteRem 0x0000 0x0009 "办公电话:"
' Line #9:
' 	QuoteRem 0x0000 0x0016 "伊妹地址: club@263.net"
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
' 	QuoteRem 0x0004 0x0012 "当前打开模板文件名"
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	St file$ 
' Line #24:
' Line #25:
' 	QuoteRem 0x0004 0x000E "关闭宏病毒保护"
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
' 	QuoteRem 0x0004 0x001A "检查打开的文档中是否有病毒"
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
' 	QuoteRem 0x0018 0x0030 "此部分有代码时，如果找不到本模块标志则认定为病毒"
' Line #38:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
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
' 	MemLd codemodule 
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
' 	QuoteRem 0x0018 0x0034 "文档中除本模块代码之外，如果还有其它代码则认定为病毒"
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
' 	QuoteRem 0x0004 0x0018 "检查文档模板中是否有病毒"
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
' 	QuoteRem 0x0018 0x0030 "此部分有代码时，如果找不到本模块标志则认定为病毒"
' Line #57:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
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
' 	MemLd codemodule 
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
' 	QuoteRem 0x0018 0x0034 "文档中除本模块代码之外，如果还有其它代码则认定为病毒"
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
' 	QuoteRem 0x0015 0x001A "如果有病毒，向用户提出报告"
' Line #70:
' 	Ld VirusReport 
' 	ArgsCall Local 0x0001 
' Line #71:
' 	Ld VirusReport 
' 	ArgsMemCall Show 0x0000 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	QuoteRem 0x0004 0x0018 "向打开的文档中写入本代码"
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
' 	QuoteRem 0x000C 0x001E "检查文档中是否已经有本模块代码"
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
' 	QuoteRem 0x0004 0x0016 "向WORD模板中写入本代码"
' Line #94:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #95:
' 	QuoteRem 0x000C 0x001E "检查文档中是否已经有本模块代码"
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
' 	QuoteRem 0x0027 0x0010 "本病毒疫苗特征码"
' Line #120:
' Line #121:
' 	QuoteRem 0x0004 0x0012 "当前打开模板文件名"
' Line #122:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	St file$ 
' Line #123:
' Line #124:
' 	QuoteRem 0x0004 0x000E "关闭宏病毒保护"
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
' 	QuoteRem 0x0004 0x0018 "向新建的文档中写入本代码"
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
' 	QuoteRem 0x000C 0x001E "检查文档中是否已经有本模块代码"
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
' 	QuoteRem 0x0000 0x0028 "关闭WORD之前清理autoexec.dot文件中的病毒"
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
' 	QuoteRem 0x0000 0x0018 "清除打开文档中的病毒代码"
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
' 	MemLd codemodule 
' 	MemLd CountOfLines 
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
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
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
' Macros/VBA/VirusReport - 11605 bytes
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
' Line #37:
' 	QuoteRem 0x0000 0x0018 "初始化窗体，设定窗体参数"
' Line #38:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #39:
' 	LitVarSpecial (True)
' 	Ld CheckBox1 
' 	MemSt Value 
' Line #40:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Information 
' 	MemSt Value 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	ArgsCall Beep 0x0000 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Private Sub CommandButtonNothing_Click())
' Line #46:
' 	QuoteRem 0x0000 0x0016 "关闭窗体，不作任何处理"
' Line #47:
' 	Dim 
' 	VarDefn ret (As Integer)
' Line #48:
' 	LitStr 0x0056 "领导，虽然你可能会批评我，但还是要告诉你，这样做是很危险的。是否真得不做处理，请指示。"
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x000A "再次报告！"
' 	ArgsLd MsgBox 0x0003 
' 	St ret 
' Line #49:
' 	Ld ret 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld VirusReport 
' 	ArgsCall Unlock 0x0001 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Private Sub CommandButtonOpenVisubasic_Click())
' Line #54:
' 	QuoteRem 0x0000 0x0014 "打开VisulBasic编辑器"
' Line #55:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub CommandButtonDetail_Click())
' Line #58:
' 	QuoteRem 0x0000 0x0012 "报告病毒的详细情况"
' Line #59:
' 	Dim 
' 	VarDefn answer (As String)
' Line #60:
' 	Dim 
' 	VarDefn myStr (As String)
' Line #61:
' 	Dim 
' 	VarDefn myDoc (As Document)
' Line #62:
' 	Dim 
' 	VarDefn myTemp (As Template)
' Line #63:
' Line #64:
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	St answer 
' Line #65:
' 	LitStr 0x0000 ""
' 	St myStr 
' Line #66:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Templates 
' 	ForEach 
' Line #67:
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #68:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #69:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #70:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #71:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #72:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #73:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 ">模块中可能有病毒。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #74:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #75:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0024 ">模块中有自动运行代码Document_Open。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #78:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0025 ">模块中有自动运行代码Document_Close。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	LitStr 0x000C "Document_New"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #81:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">模块中有自动运行代码Document_New。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	LitStr 0x000B "insertlines"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #84:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0022 ">模块中有自我复制语句InsertLines。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	EndIfBlock 
' Line #88:
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
' Line #89:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0011 ">模块可能是病毒。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #90:
' 	LitStr 0x0009 "MacroCopy"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #91:
' 	Ld myStr 
' 	Ld myTemp 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0020 ">模块中有自我复制语句MacroCopy。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	StartForVariable 
' 	Next 
' Line #97:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Documents 
' 	ForEach 
' Line #98:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #99:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #100:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #101:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #102:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #103:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #104:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 ">模块中可能有病毒。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #105:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #106:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0024 ">模块中有自动运行代码Document_Open。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #109:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0025 ">模块中有自动运行代码Document_Close。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	LitStr 0x000C "Document_New"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #112:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0023 ">模块中有自动运行代码Document_New。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	LitStr 0x000B "insertlines"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #115:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0022 ">模块中有自我复制语句InsertLines。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	EndIfBlock 
' Line #119:
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
' Line #120:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0011 ">模块可能是病毒。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #121:
' 	LitStr 0x0009 "MacroCopy"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #122:
' 	Ld myStr 
' 	Ld myDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld xitem 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0020 ">模块中有自我复制语句MacroCopy。"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St myStr 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	StartForVariable 
' 	Next 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	StartForVariable 
' 	Next 
' Line #128:
' 	Ld myStr 
' 	Ld Information 
' 	MemSt Value 
' Line #129:
' 	EndSub 
' Line #130:
' 	FuncDefn (Private Sub CommandButtonKill_Click())
' Line #131:
' 	QuoteRem 0x0000 0x0006 "杀病毒"
' Line #132:
' 	Dim 
' 	VarDefn LinesofCode (As Long)
' Line #133:
' 	Dim 
' 	VarDefn myDoc (As Document)
' Line #134:
' 	Dim 
' 	VarDefn myTemp (As Template)
' Line #135:
' 	Dim 
' 	VarDefn answer (As String)
' Line #136:
' Line #137:
' 	LitStr 0x0016 "MyMacroVirusKillerV1.0"
' 	St answer 
' Line #138:
' 	QuoteRem 0x0000 0x0018 "清除Autoexec.dot中的病毒"
' Line #139:
' 	LitStr 0x000F "c:\Autoexec.dot"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "AUTOEXEC.DOT"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #140:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #141:
' 	LitStr 0x000F "c:\Autoexec.dot"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #142:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set myDoc 
' Line #143:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #144:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #145:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #146:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #147:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #148:
' 	Ld answer 
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #149:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndIfBlock 
' Line #152:
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
' Line #153:
' 	Ld xitem 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	StartForVariable 
' 	Next 
' Line #156:
' 	Ld myDoc 
' 	ArgsMemCall Save 0x0000 
' Line #157:
' 	Ld myDoc 
' 	ArgsMemCall Close 0x0000 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	QuoteRem 0x0000 0x0018 "清除打开文档中的病毒代码"
' Line #161:
' 	StartForVariable 
' 	Ld myDoc 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Documents 
' 	ForEach 
' Line #162:
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #163:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #164:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #165:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #166:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #167:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #168:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	EndIfBlock 
' Line #171:
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
' Line #172:
' 	Ld xitem 
' 	Paren 
' 	Ld myDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #173:
' 	EndIfBlock 
' Line #174:
' 	StartForVariable 
' 	Next 
' Line #175:
' 	EndIfBlock 
' Line #176:
' 	StartForVariable 
' 	Next 
' Line #177:
' 	QuoteRem 0x0000 0x0018 "清除WORD模板中的病毒代码"
' Line #178:
' 	StartForVariable 
' 	Ld myTemp 
' 	EndForVariable 
' 	Ld Word 
' 	MemLd Templates 
' 	ForEach 
' Line #179:
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #180:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #181:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #182:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St LinesofCode 
' Line #183:
' 	Ld LinesofCode 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #184:
' 	Ld answer 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #185:
' 	LitDI2 0x0001 
' 	Ld LinesofCode 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	EndIfBlock 
' Line #188:
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
' Line #189:
' 	Ld xitem 
' 	Paren 
' 	Ld myTemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	StartForVariable 
' 	Next 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	StartForVariable 
' 	Next 
' Line #194:
' 	Ld VirusReport 
' 	ArgsCall Unlock 0x0001 
' Line #195:
' 	LitStr 0x005D "按照您的指示，我已经把怀疑是病毒的东东全部清理完毕， 不过也可能好心办了坏事，那可不要怪我哟。"
' 	Ld vbOKOnly 
' 	LitStr 0x0010 "冀慎华向您报告："
' 	ArgsCall MsgBox 0x0003 
' Line #196:
' 	EndSub 
' Line #197:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yr%`G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�s�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�e�N-N�S��	g 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�u�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[	g�S���[`O�v�e�N �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b4xOW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�Y�g`Onx�Oُ�N�[eg�SN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�[`O�e(u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�NhQ� Rd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yrdk�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���yb:y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QNaNS�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}T�N`OhQCg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@gKN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`O�~+RN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qNSb�bJT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T;N�{Gl�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1u�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�QN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Nek�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�Q�b
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonKill'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonNothing'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonOpenVisubasic'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButtonDetail'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Information'" IN 'Virus.MSWord.Jishe.c' - OLE stream: 'Macros/VirusReport'
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
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

