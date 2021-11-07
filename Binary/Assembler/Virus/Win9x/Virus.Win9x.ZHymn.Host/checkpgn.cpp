   // CHECKPGN: plugin EVENT checker

   // þ used to find such errors, as r0<-->r3 event calls/hooks

   #include <stdio.h>
   #include <stdlib.h>
   #include <dos.h>
   #include <dir.h>
   #include <io.h>
   #include <assert.h>

   #include "plugin.hpp"

   #define EVENT2ID(x)  (((x)&0x0000FF00)>>8)
   #define FLAGS2CHR(x) ((((x)&FL_PGN_CODE32)==FL_PGN_CODE32)?'X':((x)&FL_PGN_W9XR0?'0':((x)&FL_PGN_W32R3?'3':'?')))

   #define MAXPGN  256

   char* pgnname[MAXPGN];                      // plugin name
   unsigned long pgnflags[MAXPGN];             // plugin flags
   char  pgnused[MAXPGN];
   char  pgncall[MAXPGN][MAXPGN];              // event calls
   char  pgnhook[MAXPGN][MAXPGN];              // event hooks

   unsigned int   eventmax = 0;
   int   event_id  [16384];
   int   event_call[16384];
   int   event_hook[16384];

   int err = 0;
   int wrn = 0;

   void process_pgn(char* filename)
   {
     FILE*f=fopen(filename, "rb");
     assert(f);
     unsigned long len = filelength(fileno(f));
     unsigned char* buf = (char*)calloc(1,len);
     assert(fread(buf, 1,len, f)==len);
     fclose(f);

     plugin_struc *pgn = (plugin_struc*)buf;

     int id = EVENT2ID( pgn->plugin_id );
     pgnused[id]++;
     *strchr(filename,'.') = 0;
     if (pgnname[id])
     {
       printf("\n\n***ERROR***: duplicated plugin IDs: %s & %s --> %02Xxx\n", pgnname[id], filename, id);
       err++;
     }

     pgnflags[id] = pgn->plugin_flags;
     pgnname[id] = (char*)malloc(256);
     sprintf(pgnname[id], "%s.%c", filename, FLAGS2CHR(pgnflags[id]));

     for (unsigned int i=0; i<len-5; i++)
       if (buf[i+0]==0xB8)         // B8 xx xx xx xx   mov eax, EV_xxx
       if (buf[i+5]==0xFF)         // FF D5            call ebp
       if (buf[i+6]==0xD5)         //
       {
         int e = *(unsigned short*)&buf[i+1];      // short!
         int j = EVENT2ID( e );
         pgnused[j]++;
         pgncall[id][j]++;

         int p=0;
         for (unsigned int k=0; k<eventmax; k++)
           if (event_id[k]==e)
           {
             event_call[k]++;
             p++;
             break;
           }
         if (!p)
         {
            event_id  [eventmax  ]=e;
            event_call[eventmax++]++;
         }

       }

     for (unsigned int i=sizeof(plugin_struc); i<len-5; )
     {
       if ((buf[i+0]==0x66)&&(buf[i+1]==0x3D))   // cmp ax, ????
       {
         int e = *(unsigned short*)&buf[i+2];
         int j = EVENT2ID( e );
         pgnused[j]++;
         pgnhook[id][j]++;
         i+=4;

         int p=0;
         for (unsigned k=0; k<eventmax; k++)
           if (event_id[k]==e)
           {
             event_hook[k]++;
             p++;
             break;
           }
         if (!p)
         {
            event_id  [eventmax  ]=e;
            event_hook[eventmax++]++;
         }

       }
       else
       if ((buf[i]&0xF0)==0x70) i+=2;                              // jxx short
       else
       if (((*(unsigned short*)&buf[i])&0xF0FF)==0x800F) i+=6;     // jxx near
       else
       if (buf[i]==0xEB) i+=2;                                     // jmp short
       else
       if (buf[i]==0xE9) i+=5;                                     // jmp near
       else
       break;
     }

     free(buf);
   }

   void checkflags(int i,int j)
   {
     if ((!pgnname[i])||(!pgnname[j]))
     {
       wrn++;
       printf("/*WARNING*/");
       return;
     }
     if ((pgnflags[i] & pgnflags[j]) == 0)   // disallow: 0-->3, 3-->0
     {
       err++;
       printf("/*ERROR*/");
       return;
     }
   }

   char* debugptr = 0;
   char  debugname[256];
   char* event2str(unsigned short eventnum)
   {
     memset(debugname,0,sizeof(debugname));
     strcpy(debugname,"?");
     char* t = debugptr;
     while (t && (*(unsigned short*)t) )
     {
       if (*(unsigned short*)t == eventnum)
       {
         memcpy(debugname, t+3, *(unsigned char*)(t+2));
         break;
       }
       t += 3 + *(unsigned char*)(t+2);
     }
     return debugname;
   }

   void main()
   {
     printf("CHECKPGN  Plugin Checker  (x) 2000\n\n");

     memset(pgnname, 0, sizeof(pgnname));
     memset(pgnused, 0, sizeof(pgnused));
     memset(pgncall, 0, sizeof(pgncall));
     memset(pgnhook, 0, sizeof(pgnhook));
     memset(event_id, 0, sizeof(event_id));
     memset(event_call, 0, sizeof(event_call));
     memset(event_hook, 0, sizeof(event_hook));

     struct ffblk r;
     int count=0;
     for (int done=findfirst("*.PGN", &r, FA_ARCH); !done; done=findnext(&r))
     {
       process_pgn(r.ff_name);
       count++;
     }

     if (count==0)
     {
       printf("\n***ERROR***: You madafukka, compile some .PGNs first!\n");
       exit(0);
     }

     for (int i=0; i<MAXPGN; i++)
   //if (pgnname[i])
     {
       int q = 0;
       for (int k=0; k<4; k++)
       {

         int c = 0;
         for (int j=0; j<MAXPGN; j++)
         if (i!=j)
   //    if (pgnname[j])
         {
           int t;
           switch(k)
           {
             case 0: t = pgncall[i][j]; break;
             case 1: t = pgncall[j][i]; break;
             case 2: t = pgnhook[i][j]; break;
             case 3: t = pgnhook[j][i]; break;
           }
           if (t)
           {
             if (c==0)
             {
               c++;

               if (q==0)
               {
                 if (pgnname[i])
                   printf("%12s", pgnname[i]);
                 else
                   printf("  {UNK:%02Xxx}",i);
                 printf(" %c %02Xxx: ",pgnflags[i]&FL_PGN_PERMUTABLE?'P':'-',i);
                 q++;
               }
               else
                 printf("                     ");

               switch(k)
               {
                 case 0: printf("---> "); break;
                 case 1: printf("<--- "); break;
                 case 2: printf("<=== "); break;
                 case 3: printf("===> "); break;
               };

             }
             else
               printf(", ");

             if (pgnname[j])
               printf("%s", pgnname[j]);
             else
               printf("{UNK:%02Xxx}",j);
             checkflags(i,j);
           }
         }

         if (c)
           printf("\n");

       } // for k
     } // for i

     printf("\n");
     printf("ÀÁÁÁÁÅÁÁÁÙ ³ ³ ÀÁÁÁ EventMask \n");
     printf("     ³     ³ ÀÄÄÄÄÄ P=Permutable\n");
     printf("     ³     ÀÄÄÄÄÄÄÄ 0=ring0 3=ring3 X=both\n");
     printf("     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄ PluginName\n");
     printf("                     ---> calls (using 'event EV_xxx' macro)\n");
     printf("                     <--- called by\n");
     printf("                     <=== hooks (via HandleEvent subroutine)\n");
     printf("                     ===> hooked by\n");
     printf("\n");

     int c=0;
     for (int i=0; i<MAXPGN; i++)
       if (pgnused[i]&&(!pgnname[i]))
         c++;
     printf("þ %4i plugin(s) found\n", count);
     printf("þ %4i plugin(s) not found, but possibly in use\n\n", c);

     FILE*f=fopen("DEBUG.PGN","rb");
     assert(f);
     int debuglen = filelength(fileno(f));
     char* debugarr = (char*)calloc(1,debuglen);
     fread(debugarr, 1,debuglen, f);
     fclose(f);
     for (int i=0; i<debuglen; i++)
       if (!strcmp(&debugarr[i],"DEBUG$$"))
         debugptr = debugarr + i - *(unsigned long*)&debugarr[i+8];

     printf("þ %i events total\n", eventmax);
     printf("þ called, but not hooked\n");
     for (unsigned int i=0; i<eventmax; i++)
       if ((event_call[i])&&(!event_hook[i]))
       {
         printf("%04X -- %s",event_id[i],event2str(event_id[i]));
         if (!pgnname[EVENT2ID(event_id[i])]) printf(" (plugin unused)");
         printf("\n");
       }
     printf("þ hooked, but not called\n");
     for (unsigned int i=0; i<eventmax; i++)
       if ((!event_call[i])&&(event_hook[i]))
       {
         printf("%04X -- %s",event_id[i],event2str(event_id[i]));
         if (!pgnname[EVENT2ID(event_id[i])]) printf(" (plugin unused)");
         printf("\n");
       }
     printf("\n");

     if (err)
     {
       printf("*** %i error(s) ***\n", err);
       printf("*** %i warning(s) ***\n", wrn);
       exit(2);
     }
     else
     if (wrn)
     {
       printf("*** %i warning(s) ***\n", wrn);
       exit(1);
     }
     else
     {
       printf("- success\n");
       exit(0);
     }

   }
