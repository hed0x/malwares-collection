   /*pControl v0.5
   coded by v1rusL4ir (2008) viruslair[at]ihrisko[dot]org

       This code is freeware.You can use,modify,distribute this code
       but you can't sell it or use as part of commercial software without my approval.
       Contact me and we can make a deal.

       Use this code/tool at own risk.Im not responsible of anything you do with this code.
       I don't take responsibility of any damage caused by improper usage of this code/tool
       Keep the original copyright but dont misrepresent modifyed version as original one.

       future improvements - the module name+path in terminate output.
   */

   #include <windows.h>
   #include <Psapi.h>
   #include <stdio.h>

   #pragma comment(lib,"Psapi.lib")

   #define DEVICE_NAME  "\\\\.\\PControl_device"
   #define SERVICE_NAME "ProcessControl"
   #define DRIVER_FILE  "pcontrol.sys"

   bool LoadDriver();
   DWORD Read_Proc();
   void CleanUp();

   FILE* file;
   typedef struct pinfo{
       DWORD parent;
       DWORD process;
       BOOLEAN create;
   }PROC_INFO;

   BOOL CtrlHandler(DWORD fdwCtrlType)
   {
     switch(fdwCtrlType)
     {
       case CTRL_C_EVENT:
       case CTRL_CLOSE_EVENT:
       case CTRL_BREAK_EVENT:
       case CTRL_LOGOFF_EVENT:
       case CTRL_SHUTDOWN_EVENT:
         CleanUp();
         return FALSE;
     }
     return FALSE;
   }

   int main(int argc,char **argv)
   {
       printf ("PControl v0.5 coded by v1rusL4ir(2008).\n");
       printf ("You can enable logging to file by passing \"-l [filename]\" as an argument.\n");

       HANDLE hDevice,hProc,hProcParent;
       char proc_file[MAX_PATH],p_proc_file[MAX_PATH],log_file[MAX_PATH];
       DWORD bRead = 0;
       PROC_INFO p_info;
       SYSTEMTIME time;

       if(argc > 1)
       {
           if(strcmp(argv[1],"-l") == 0){

               file = fopen(argv[2],"a");

               if(file)
                   printf("[+]Logging enabled.Logfile: %s .\n",argv[2]);
               else
                   printf("[-]Cannot open the file.Logging disabled.\n");

           }else
               printf("[-]Invalid parameter\n");
       }

       if(!LoadDriver()) return -1;

       printf("[+]Driver loaded.\n");

       if(( hDevice = CreateFile( DEVICE_NAME, GENERIC_READ | GENERIC_WRITE,0,NULL,
            OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL)) == INVALID_HANDLE_VALUE){
                printf("[-]Cannot open I/O device \n ");
                return -1;
       }

       printf("[+]Connected to device.\n");

       SetConsoleCtrlHandler((PHANDLER_ROUTINE)CtrlHandler, TRUE);

       while(1){
           ReadFile(hDevice,&p_info,sizeof(PROC_INFO),&bRead,0);
           if(bRead == sizeof(PROC_INFO)){
               GetLocalTime(&time);

               printf("-------------------------------------------------------\n");

               if(p_info.create){
                   hProc = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ,TRUE,p_info.process);
                   hProcParent = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ,TRUE,p_info.parent);

                   if(hProc && hProcParent){
                       GetModuleFileNameEx(hProc,NULL,(LPSTR)&proc_file,MAX_PATH);
                       GetModuleFileNameEx(hProcParent,NULL,(LPSTR)&p_proc_file,MAX_PATH);

                       if (p_info.create){
                           printf("[%d:%d:%d]Process execution detected: %s PID: %d \n",time.wHour,time.wMinute,time.wSecond,proc_file,p_info.process);
                           printf("\tExecuted by: %s PID: %d \n",p_proc_file,p_info.parent);

                           if(file){
                               fprintf(file,"-----------------------------------------------------\n");
                               fprintf(file,"[%d:%d:%d]Process execution detected: %s PID: %d \n",time.wHour,time.wMinute,time.wSecond,proc_file,p_info.process);
                               fprintf(file,"\tExecuted by: %s PID: %d \n",p_proc_file,p_info.parent);
                           }
                       }
                   }
               }else{
                   printf("[%d:%d:%d]Process termination detected. PID: %d \n",time.wHour,time.wMinute,time.wSecond,p_info.process);

                   if(file){
                       fprintf(file,"-----------------------------------------------------\n");
                       fprintf(file,"[%d:%d:%d]Process termination detected. PID: %d \n",time.wHour,time.wMinute,time.wSecond,p_info.process);
                   }
               }

               ZeroMemory(&proc_file,sizeof(MAX_PATH));
               ZeroMemory(&p_proc_file,sizeof(MAX_PATH));
           }

           ZeroMemory(&p_info,sizeof(PROC_INFO));
           Sleep(1000);
           bRead = 0;
       }

       CleanUp();
       return 0;
   }

   bool LoadDriver()
   {
       SC_HANDLE hManager;
       SC_HANDLE hService;
       SERVICE_STATUS ss;
       char path[MAX_PATH];

       GetModuleFileName(0,path,MAX_PATH);
       char *pos = strrchr(path,'\\');
       *(pos + 1) = 0;
       strcat(path,DRIVER_FILE);

       // does file exists?
       FILE *f = fopen(path, "r");
       if(!f){
           printf("[-]Cannot locate driver.Put it in the same directory,where this application is.\n");
           return FALSE;
       }
       fclose(f);

       // try to open service manager
       hManager = OpenSCManager(NULL, NULL, SC_MANAGER_CREATE_SERVICE);
       if(!hManager){
           printf("[-]Failed to open services manage.r\n");
           return FALSE;
        }

       // check if service exists.
       if((hService = OpenService(hManager, SERVICE_NAME, SERVICE_START | DELETE | SERVICE_STOP | SERVICE_QUERY_STATUS)) == NULL){
           // create service
           hService = CreateService(hManager, SERVICE_NAME, SERVICE_NAME,
           SERVICE_START | DELETE | SERVICE_STOP | SERVICE_QUERY_STATUS, SERVICE_KERNEL_DRIVER,
           SERVICE_DEMAND_START, SERVICE_ERROR_IGNORE, path,
           NULL, NULL, NULL, NULL, NULL);

           if(!hService){
             printf("[-]Failed to obtain service handle.\n");
             CloseServiceHandle(hManager);
             return FALSE;
           }
        }

       // start service
       QueryServiceStatus(hService, &ss);
       if(ss.dwCurrentState != SERVICE_RUNNING) {
           if(!StartService(hService, 0, NULL)){
               printf("[-]Failed to start service.\n");
               ControlService(hService, SERVICE_CONTROL_STOP, &ss);
               DeleteService(hService);
               CloseServiceHandle(hService);
               CloseServiceHandle(hManager);
               return FALSE;
           }
       }

       CloseServiceHandle(hService);
       CloseServiceHandle(hManager);

       return TRUE;
   }

   void CleanUp()
   {
       if(file)
           fclose(file);

       printf("[*]Unloading driver - ");

       SC_HANDLE hManager;
       SC_HANDLE hService;
       SERVICE_STATUS ss;
       hManager = OpenSCManager(NULL, NULL, SC_MANAGER_CREATE_SERVICE);
       hService = OpenService(hManager, SERVICE_NAME, SERVICE_START | DELETE | SERVICE_STOP);
       ControlService(hService, SERVICE_CONTROL_STOP, &ss);
       DeleteService(hService);
       CloseServiceHandle(hService);
       CloseServiceHandle(hManager);

       printf("[+]DONE \n");
   }
