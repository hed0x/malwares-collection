#include <windows.h>
#include <WINUSER.H>
#include "resource.h"
#include <stdio.h>


#define SERVICENAME			"p26"
#define DISPLAYNAME			"displayp26"
#define SYSNAME				"p26.sys"
#define HOOKERDRIVER	    "\\\\.\\HOOKERDRIVER"

#define IOCONTROL_SET_PID		  1
#define IOCONTROL_SET_CONFIG_FILE 2


HANDLE g_DriverHandle = NULL;


static int LoadDriver();
static int UnloadDriver();
static BOOL IsDriverLoaded();
static void TranslateLog(char * path);

//procedure of the main dialog of the app.
BOOL CALLBACK MainDlgProc(HWND hwnd, UINT msg, WPARAM w, LPARAM param)
{
  int resultado = 0; 
  char FileToSpy[MAX_PATH];
  char FileForLog[MAX_PATH];
  HANDLE hdrv;
  STARTUPINFO si;
  PROCESS_INFORMATION pi;
  int pid;
  int bytesRet;

  switch(msg)
  {

   case WM_INITDIALOG:
      
	break;

   case WM_COMMAND:
	
	switch(LOWORD(w))
	{

		case IDTRANSLATE:   
      		
			GetDlgItemText(hwnd,IDC_FILE_FOR_LOG,FileForLog,MAX_PATH);
			TranslateLog(FileForLog);

			break;
 
		case IDSPYNOW:	  

			GetDlgItemText(hwnd,IDC_FILE_TO_SPY,FileToSpy,MAX_PATH);
			GetDlgItemText(hwnd,IDC_FILE_FOR_LOG,FileForLog,MAX_PATH);
			
			ZeroMemory(&si,sizeof(si));
			ZeroMemory(&pi,sizeof(pi));
			
			si.cb = sizeof(si);
			
			if(!CreateProcess(FileToSpy,NULL,NULL,NULL,FALSE,
					  CREATE_SUSPENDED,NULL,NULL,&si,&pi))
			{
				MessageBox(0,"Error Creating Process","Error Creating Process",0);
				break;
			}

			pid = pi.dwProcessId;

			if(LoadDriver() || (hdrv = CreateFile(HOOKERDRIVER,GENERIC_READ|GENERIC_WRITE,
						0,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL))==-1)
			{
				MessageBox(0,"Error Opening Driver","Error Opening Driver",0);
				ResumeThread(pi.hThread);
				break;
			}
			
			
			DeviceIoControl(hdrv,IOCONTROL_SET_PID,&pid,4,
							NULL,0,&bytesRet,NULL);			
						
			
			ResumeThread(pi.hThread);

			WaitForSingleObject(pi.hProcess,INFINITE);

			CloseHandle(hdrv);
			if(UnloadDriver())
				MessageBox(0,
			   "A problem occured while unloading the driver",
			   "A problem occured while unloading the driver",
			   0);

		
	  		break;
		
		case IDUNLOAD:

			if(!IsDriverLoaded())
			{
				MessageBox(0,
						   "Driver is not loaded",
						   "Driver is not loaded",
						   0);
				
				break;
			}


			if(UnloadDriver())
				if(UnloadDriver())
					if(UnloadDriver())
						MessageBox(0,
						   "A problem occured while unloading the driver",
						   "A problem occured while unloading the driver",
						   0);

			break;

	}
	
	break;
 
   case WM_CLOSE:
      	
		EndDialog(hwnd, 0);
      
	break;
  
  }

  return FALSE;

}


int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)
{

	return DialogBoxParam(NULL,
		                  MAKEINTRESOURCE(INT2ESPY_DIALOG),
					      NULL,
					      MainDlgProc,
					      0);

}

/*
	QueryApiNameForService:
	
	  This function will receive as param a id of a service and 
	  it will try to search the api name for that service in
	  ntdll.
	  
	Parameters:

	  service: id of the service.

	Returning Values:

	  This function will return a (char *) to the string for that 
	  service, or "" if it doesnt find it. Dont modify the returned
	  string becoz is a pointer to real exports name of ntdll.

*/

static char * QueryApiNameForService(int service)
{
	HMODULE hmod;
	char * ptr;
	IMAGE_DOS_HEADER * doshdr;
	IMAGE_FILE_HEADER * filehdr;
	IMAGE_OPTIONAL_HEADER * opthdr;
	IMAGE_EXPORT_DIRECTORY * exports;
	int * addrNames;
	int nNames;
	int * psid;

	hmod = LoadLibrary("ntdll.dll");

	ptr = doshdr = hmod;

	ptr = ptr + doshdr->e_lfanew;
	
	//ptr -> PE header
	
	ptr+=(4/*PE SIGNATURE*/+sizeof(IMAGE_FILE_HEADER));

	//ptr -> optional header

	opthdr = ptr;
	ptr = ((char *)hmod + opthdr->DataDirectory[0].VirtualAddress);
	
	//ptr -> Export Directory
	
	exports = ptr;
	nNames = exports->NumberOfNames;
	addrNames = (int *)((char *)hmod + exports->AddressOfNames);

	for(nNames;nNames>0;nNames--)
	{
		ptr = ((char *)hmod) + addrNames[nNames-1];		
		psid = (int *)(((char *)GetProcAddress(hmod,ptr))+1);
		if(*psid == service)
		{
			return ptr;
		}
	}
	return "";
}

/*
	TranslateLog:
	
	  this function will try to translate a log file created by
	  the driver into a understandable log file.

	Parameters:
		
	  path: path of the log file created by the driver.

	Returned Values:

	  none.

*/

static void TranslateLog(char * path)
{
	FILE * f=NULL,*ft=NULL;
	char buffer[100];
	char path2[MAX_PATH+20];

	strcpy(path2,path);
	strcat(path2,".t");
	

	if((*path == 0) || !(f = fopen(path,"r+")) || !(ft = fopen(path2,"w+")))
	{
		MessageBox(0,"Invalid File","Invalid File",0);
		return;
	}
	while(fgets(buffer,50,f))
	{
		if(!strncmp(buffer,"Service",7))
		{
			int serviceid;
			int i;
			char * servicename;
			
			for(i=0;
			((buffer[i+10]<='9' && buffer[i+10]>='0')||
			(buffer[i+10]<='f' && buffer[i+10]>='a') ||
			(buffer[i+10]<='F' && buffer[i+10]>='A'));
			i++);
			
			buffer[10+i] = 0;
			serviceid = strtol(&buffer[10],NULL,16);
			strcat(buffer,"\n");
			servicename = QueryApiNameForService(serviceid);
			strcat(buffer,servicename);
			
		}
		
		fputs(buffer,ft);
	}

	fclose(ft);fclose(f);
}

/*
   IsDriverLoaded: 

	   Try to see if the driver is loaded.
   	
   Parameters: 
	
	   none.

   Returned values:

	   TRUE  = error or loaded
	   FALSE = no loaded 
*/

static BOOL IsDriverLoaded() //TRUE  = error or loaded
{							 //FALSE = no loaded 
	SC_HANDLE handleManager;
	HANDLE driverhandle;	
	BOOL retVal = TRUE;

	handleManager = OpenSCManager(NULL,SERVICES_ACTIVE_DATABASE,SC_MANAGER_ALL_ACCESS);


	if(!handleManager)
		return TRUE;

	driverhandle = OpenService(handleManager,SERVICENAME,GENERIC_READ);

	if(driverhandle)
		CloseServiceHandle(driverhandle);
	else 
		retVal = FALSE;

	CloseServiceHandle(handleManager);
	
	return retVal;
}

/*
   LoadDriver: 

	   Load and start driver for hooking.
   	
   Parameters: 
	
	   none.

   Returned values:

	   If error, it will return TRUE;

*/

static int LoadDriver()
{
	SC_HANDLE handleManager;
	char CurrentPath[MAX_PATH + sizeof(SYSNAME)];
	int retVal = TRUE;
	int err;

	if(g_DriverHandle)
		return TRUE;

	handleManager = OpenSCManager(NULL,SERVICES_ACTIVE_DATABASE,SC_MANAGER_ALL_ACCESS);

	if(!handleManager)
		return TRUE;



	
	GetCurrentDirectory(MAX_PATH,CurrentPath);
	
	strcat(CurrentPath,"\\");
	strcat(CurrentPath,SYSNAME);



	g_DriverHandle =	CreateService(handleManager,
									  SERVICENAME,
									  DISPLAYNAME,
									  SERVICE_ALL_ACCESS,
									  SERVICE_KERNEL_DRIVER,
									  SERVICE_DEMAND_START,
									  SERVICE_ERROR_NORMAL,
									  CurrentPath,
									  NULL,
									  NULL,
									  NULL,
									  NULL,
									  NULL);
										

	
	err = GetLastError();
	

	if(g_DriverHandle)
	{
		if(StartService(g_DriverHandle,0,NULL))
		{
			retVal = FALSE;
		}
		err = GetLastError();

	}
		
	CloseServiceHandle(handleManager);
	return retVal;

}


/*
   UnloadDriver: 

	   Unload the driver.
   	
   Parameters: 
	
	   none.

   Returned values:

	   If error, it will return TRUE;

*/

static int UnloadDriver()
{
	HANDLE servicehandle;
	SERVICE_STATUS serviceStatus;
	SC_HANDLE handleManager;

	if(g_DriverHandle)
	{
		CloseServiceHandle(g_DriverHandle);
		g_DriverHandle = NULL;
	}

	handleManager = OpenSCManager(NULL,SERVICES_ACTIVE_DATABASE,SC_MANAGER_ALL_ACCESS);

	if(!handleManager)
		return TRUE;

	servicehandle = OpenService(handleManager,SERVICENAME,SERVICE_ALL_ACCESS);
	
	if(!servicehandle)
	{
		CloseServiceHandle(handleManager);
		return TRUE;
	}

	ControlService (servicehandle,SERVICE_CONTROL_STOP,&serviceStatus);
	DeleteService(servicehandle);

	CloseServiceHandle(servicehandle);
	CloseServiceHandle(handleManager);

	
	return FALSE;
}
