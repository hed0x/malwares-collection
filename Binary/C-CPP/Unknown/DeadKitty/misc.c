   /* misc stuff */

   #include "DeadKitty.h"

   /* my lame version of strlower() */
   void my_strlower(char *str)
   {
       int StrCnt;

       for(StrCnt = 0;StrCnt < strlen(str);StrCnt++)
           str[StrCnt] = tolower(str[StrCnt]);
   }

   /* get file time */
   void filetime(char *f,tm_zip *tmzip,uLong *dt)
   {
       FILETIME ftLocal;
       HANDLE hFind;
       WIN32_FIND_DATA  ff32;

       hFind = FindFirstFile(f,&ff32);

       if (hFind != INVALID_HANDLE_VALUE)
       {
           FileTimeToLocalFileTime(&(ff32.ftLastWriteTime),&ftLocal);
           FileTimeToDosDateTime(&ftLocal,((LPWORD)dt)+1,((LPWORD)dt)+0);
           FindClose(hFind);
       }

   }


   /* build a zip archive */
   int MakeZip(char *ZipName,char *fileToAdd,char *NameInArchive)
   {
       zipFile zf;
       zlib_filefunc_def ffunc;
       zip_fileinfo zi;
       int RetZip,Ret;
       char *FileContent = NULL;
       DWORD filesize,read_bytes;
       HANDLE file;

   #define CLOSE_ALL zipCloseFileInZip(zf); \
                     zipClose(zf,NULL);

       fill_win32_filefunc(&ffunc);
       zf = zipOpen2(ZipName,0,NULL,&ffunc);

       if(zf == NULL)
       {
           return 0;
       }

       /* set all fields to 0 */
       memset(&zi,0,sizeof(zi));
       filetime(fileToAdd,&zi.tmz_date,&zi.dosDate);

       RetZip = zipOpenNewFileInZip(zf,NameInArchive,&zi,NULL,0,NULL,0,
           NULL,Z_DEFLATED,Z_DEFAULT_COMPRESSION);

       if(RetZip != ZIP_OK)
       {
           CLOSE_ALL
           return 0;
       }

       /* get file size & read file */
       file = CreateFile(fileToAdd,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,
           FILE_ATTRIBUTE_NORMAL,NULL);

       if(file == INVALID_HANDLE_VALUE)
       {
           CLOSE_ALL
           return 0;
       }

       filesize = GetFileSize(file,NULL);

       /* allocate momory */
       FileContent = GlobalAlloc(GMEM_FIXED|GMEM_ZEROINIT,filesize);

       if(FileContent == NULL)
       {
           CLOSE_ALL
           CloseHandle(file);
           return 0;
       }

   #define CLOSE_ALL2 zipCloseFileInZip(zf); \
                      zipClose(zf,NULL); \
                      GlobalFree(FileContent); \
                      CloseHandle(file);

       /* read file */
       Ret = ReadFile(file,FileContent,filesize,&read_bytes,NULL);

       if(Ret == 0)
       {
           CLOSE_ALL2
           return 0;
       }

       /* write the file in the zip */
       RetZip = zipWriteInFileInZip (zf,FileContent,filesize);

       if(RetZip < 0)
       {
           CLOSE_ALL2
           GlobalFree(FileContent);
           return 0;
       }

       CLOSE_ALL2
       return 1;

   }

   /* this simply returns 0 or 1 */
   int MyRand(void)
   {
       SYSTEMTIME tm;

       GetSystemTime(&tm);

       if(tm.wMinute % 2 == 0)
       {
           return 1;
       }

       else
       {
           return 0;
       }

   }
