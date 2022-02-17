   #include <windows.h>
   #include <stdio.h>
   #include <io.h>

   char zip_local_file_header1[] = {0x50,0x4b,0x03,0x04, 0x0a,0x00, 0x00,0x00,
       0x00,0x00};

   struct _zip_local_file_header2 {
       unsigned short usTime;
       unsigned short usDate;
       unsigned long ulCrc32;
       unsigned long ulSizeCompressed;
       unsigned long ulSizeUncompressed;
       unsigned short usFilenameLength;
       unsigned short usExtraLength;
   };

   struct _zip_local_file_header2 zip_local_file_header2;

   char zip_central_directory1[] = {0x50,0x4b,0x01,0x02, 0x14,0x00, 0x0a,0x00,
       0x00,0x00, 0x00,0x00};

   struct _zip_central_directory2 {
       unsigned short usTime;
       unsigned short usDate;
       unsigned long ulCrc32;
       unsigned long ulSizeCompressed;
       unsigned long ulSizeUncompressed;
       unsigned short usFilenameLength;
       unsigned short f1; /* set to zero */
       unsigned short f2; /* set to zero */
       unsigned short f3; /* set to zero */
       unsigned short f4; /* set to zero */
       unsigned short usExtAttribLo;
       unsigned short usExtAttribHi;
       unsigned long f5;  /* set to zero */
   };

   struct _zip_central_directory2 zip_central_directory2;

   char zip_end1[] = {0x50,0x4b,0x05,0x06, 0x00,0x00, 0x00,0x00, 0x01,0x00,
       0x01,0x00};

   struct _zip_end2{
       unsigned long ulSize;
       unsigned long ulStartingDiskNumber;
       unsigned short f1;
   };

   struct _zip_end2 zip_end2;


   //#include "crc32.c"

   int zip_make(char *IN_FILE,char *OUT_FILE){

   //#define OUT_FILE "out.bin"
   //#define IN_FILE  "in.bin"
       char *pszFilename = "message.html";

   //  crc32_init();

       FILE *out = fopen(OUT_FILE,"ab");
       if(out == NULL) { return 1; }

       FILE *in = fopen(IN_FILE,"rb");
       if(in == NULL) { return 1; }

       int in_file_len =  _filelength(_fileno(in));
       char *buf = (char *)malloc(in_file_len);
       if(!buf) { return 1; }

       fread(buf,1,in_file_len,in);

       FILETIME CurTime;
       unsigned short usTime;
       unsigned short usDate;
       GetSystemTimeAsFileTime(&CurTime);
       FileTimeToDosDateTime(&CurTime,&usDate,&usTime);

       zip_local_file_header2.usTime = usTime;
       zip_local_file_header2.usDate = usDate;
       zip_local_file_header2.ulCrc32 = crc32(0,buf,in_file_len);
       zip_local_file_header2.ulSizeCompressed = in_file_len;
       zip_local_file_header2.ulSizeUncompressed = in_file_len;
       zip_local_file_header2.usFilenameLength = strlen(pszFilename);
       zip_local_file_header2.usExtraLength = 0;

       zip_central_directory2.usTime = usTime;
       zip_central_directory2.usDate = usDate;
       zip_central_directory2.ulCrc32 = zip_local_file_header2.ulCrc32;
       zip_central_directory2.ulSizeCompressed = in_file_len;
       zip_central_directory2.ulSizeUncompressed = in_file_len;
       zip_central_directory2.usFilenameLength = zip_local_file_header2.usFilenameLength;
       zip_central_directory2.f1 = 0;
       zip_central_directory2.f2 = 0;
       zip_central_directory2.f3 = 0;
       zip_central_directory2.f4 = 0;
       zip_central_directory2.usExtAttribLo = 0x0020;
       zip_central_directory2.usExtAttribHi = 0;
       zip_central_directory2.f5 = 0;

       zip_end2.ulSize = 46 + zip_local_file_header2.usFilenameLength;
       zip_end2.ulStartingDiskNumber = 42 + in_file_len;
       zip_end2.f1 = 0;

       /* write all that shit here */

       fwrite(&zip_local_file_header1,sizeof(zip_local_file_header1),1,out);
       fwrite(&zip_local_file_header2,sizeof(zip_local_file_header2),1,out);
       fwrite(pszFilename,strlen(pszFilename),1,out);
       fwrite(buf,in_file_len,1,out);
       fwrite(&zip_central_directory1,sizeof(zip_central_directory1),1,out);
       fwrite(&zip_central_directory2,sizeof(zip_central_directory2)-2,1,out);
       fwrite(pszFilename,strlen(pszFilename),1,out);
       fwrite(&zip_end1,sizeof(zip_end1),1,out);
       fwrite(&zip_end2,sizeof(zip_end2)-2,1,out);

       if(buf) free(buf);
       fclose(in);
       fclose(out);


       return 0;
   }
