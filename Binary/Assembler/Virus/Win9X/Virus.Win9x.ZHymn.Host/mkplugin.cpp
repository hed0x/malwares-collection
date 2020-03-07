   // PE EXE --> .PGN convertor

   // - read all the shit from the .PLUGIN section of the argv[1] (PE file)
   // - write to argv[2], plugin length == first DWORD value

   // also this program performs partial plugin data encryption.
   // the following structure will be zerofilled, if present:
   // db '$N0T'         ; signature
   // dd data_offs      ; offset of data to NOT, relative to plugin_start
   // dd data_len       ; data length, in BYTEs

   #include <windows.h>
   #include <stdio.h>
   #include <stdlib.h>
   #include <io.h>
   #include <assert.h>

   #pragma hdrstop

   #include "INCLUDE\\mz.h"
   #include "INCLUDE\\pe.h"

   #define PGNSECT ".PLUGIN"

   void main(int argc, char* argv[])
   {
     if (argc!=3) return;

     printf("MKPLUGIN: %s --> %s\n", argv[1], argv[2]);

     FILE*f=fopen(argv[1],"rb");
     assert(f);

     MZ_STRUCT mz;
     assert(fread(&mz, 1,sizeof(mz), f)==sizeof(mz));

     PE_STRUCT pe;
     fseek(f, mz.mz_neptr, SEEK_SET);
     assert(fread(&pe, 1,sizeof(pe), f)==sizeof(pe));

     PE_OBJENTRY_STRUCT oe[32];
     fseek(f, mz.mz_neptr+0x18+pe.pe_ntheadersize, SEEK_SET);
     assert(fread(&oe, 1,sizeof(oe), f)==sizeof(oe));
     for (int i=0; i<pe.pe_numofobjects; i++)
     {
       if (!memcmp(oe[i].oe_name, PGNSECT,strlen(PGNSECT)+1))
       {
         fseek(f, oe[i].oe_physoffs, SEEK_SET);
         unsigned long len;
         assert(fread(&len, 1,4, f)==4);
         fseek(f, -4, SEEK_CUR);
         unsigned long *x  = (unsigned long*)malloc(len);
         char*xc = (char*)x;
         assert(fread(x, 1,len, f)==len);
         fclose(f);
         //
         for (unsigned i=0; i<x[0]; i++)
           if (xc[i+0]=='$')
           if (xc[i+1]=='N')
           if (xc[i+2]=='0')
           if (xc[i+3]=='T')
           {
             unsigned long d_ptr = *(unsigned long*)&xc[i+4];
             unsigned long d_len = *(unsigned long*)&xc[i+8];
             printf("$N0T: %i bytes at %08X\n", d_len, d_ptr);
             for (unsigned j=0; j<d_len; j++)
               xc[d_ptr+j] = ~xc[d_ptr+j];
             for (unsigned j=0; j<12; j++)
               xc[i+j]=0;
           }
         //
         f=fopen(argv[2],"wb");
         assert(f);
         assert(fwrite(x, 1,x[0], f)==x[0]);
         fclose(f);
         exit(0);
       }
     }
     fclose(f);

     printf("- %s section not found!\n", PGNSECT);

   }
