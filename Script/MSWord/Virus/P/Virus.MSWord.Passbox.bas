olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Passbox
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Passbox 
in file: Virus.MSWord.Passbox - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
























































Private Sub CommandButton1_Click()
If CommandButton1.Caption = "OK" Then Confere
End Sub
Private Sub TextBox1_Change()
TextBox1.PasswordChar = "*"

End Sub
Private Sub userform_initialize()
Label2.Caption = "Insira a senha para abrir o arquivo"
Label1.Caption = ActiveDocument.FullName

End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
On Error GoTo Final
If CloseMode = 1 Then GoTo Final
ActiveDocument.Close
Unload PBox

Final:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |TextBox1_Change     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

