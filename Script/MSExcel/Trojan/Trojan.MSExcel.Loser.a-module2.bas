Rem Attribute VBA_ModuleType=VBAClassModule
Option VBASupport 1
Option ClassModule
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

