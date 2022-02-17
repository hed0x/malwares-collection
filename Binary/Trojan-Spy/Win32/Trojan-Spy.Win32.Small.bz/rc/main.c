#include <NTDDK.H>
#include "stdlib.h"
#include "ntifs.h"
#include "stdio.h"



#define NT_DEVICE_NAME L"\\Device\\HOOKERDRIVER"
#define DOS_DEVICE_NAME L"\\DosDevices\\HOOKERDRIVER"


#define LOG_FILE_NAME L"\\??\\c:\\int2espy.log"

unsigned int    pid = 0;
#define __MAX_PATH 255+10
short FileForLog[__MAX_PATH];


#define IOCONTROL_SET_PID				1
#define IOCONTROL_SET_CONFIG_FILE		2


NTSTATUS HookerDispatch(IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp);
NTSTATUS HookerCreate (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp);
void HookerUnload (IN PDRIVER_OBJECT DriverObject);
void ParseConfigFile(char * configFile);
void StartTheHook(void);
void StopTheHook(void);
void HookRutine(void);
void SubHook(int reax,int redx);
int TryToParseParameters(int service,int * parameters,HANDLE hfile);
int IsValidMemoryRange(int addr,int size);


NTSTATUS DriverEntry(IN PDRIVER_OBJECT DriverObject, IN PUNICODE_STRING RegistryPath)
{
  PDEVICE_OBJECT deviceObject = NULL; 
  NTSTATUS status; 
  UNICODE_STRING NtNameString;
  UNICODE_STRING Win32NameString;

  KdPrint (("HOOKER DRIVER ACTIVATED\n"));


  RtlInitUnicodeString (&NtNameString, NT_DEVICE_NAME);

  // Create the device object for this driver. This is not a real device,
  // and we only need one such object. 

  status = IoCreateDevice
   (
    DriverObject, 
    0, 
    &NtNameString, 
    FILE_DEVICE_UNKNOWN, 
    0, 
    FALSE, 
    &deviceObject
   );

  if (NT_SUCCESS(status))
  {
    // Setup the entry points in the MajorFunction jump table. 
  
	DriverObject->MajorFunction[IRP_MJ_CREATE] = HookerCreate;
    DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = HookerDispatch;
    DriverObject->DriverUnload = HookerUnload;
    
    // Set up the I/O mode in the DeviceObject. 
  
    deviceObject->Flags |= DO_BUFFERED_IO;

    // Create the symbolic link from the DOS driver name to the NT driver name. 
  
    RtlInitUnicodeString (&Win32NameString, DOS_DEVICE_NAME);
    status = IoCreateSymbolicLink (&Win32NameString, &NtNameString);

    // If we failed, delete the DeviceObject we created. 
  
    if (!NT_SUCCESS(status))
    {
      KdPrint(("HOOKER DRIVER: error creating the symbolic link\n"));
      IoDeleteDevice (DriverObject->DeviceObject);
    }

    else
    {
      KdPrint(("HOOKER DRIVER: All initialized\n"));
    }
  }
  else
  {
    KdPrint(("HOOKER DRIVER: error creating the device\n"));
  }
  
  wcscpy(FileForLog,LOG_FILE_NAME);
  
  return status;
}


NTSTATUS HookerDispatch (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp)
{
	char * buffer;
	PIO_STACK_LOCATION IrpStack = IoGetCurrentIrpStackLocation(Irp);

	buffer = Irp->AssociatedIrp.SystemBuffer;

	switch(IrpStack->Parameters.DeviceIoControl.IoControlCode)
    {	
	
		case IOCONTROL_SET_PID:

			//the driver must be unloaded before using
			//it again...so if we have been configurated
			//with a pid we will not accept other more

			if(!pid)
			{
				pid = (int)*(int *)buffer;
				StartTheHook();
			}
			
			break;
		
		case IOCONTROL_SET_CONFIG_FILE:		

			ParseConfigFile(buffer);
			
			break;
		
	}

	IoCompleteRequest(Irp,IO_NO_INCREMENT);
	return STATUS_SUCCESS;
}

NTSTATUS HookerCreate (IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp)
{

	IoCompleteRequest(Irp,IO_NO_INCREMENT);
	return STATUS_SUCCESS;
}

void HookerUnload (IN PDRIVER_OBJECT DriverObject)
{
    UNICODE_STRING Win32NameString;

	
	StopTheHook();


	
    // When we unload the driver, we delete the DOS name link, and we also
    // delete the DeviceObject we created at DriverEntry time. 
  
    KdPrint(("HOOKER DRIVER: Unloading\n")); 
    RtlInitUnicodeString(&Win32NameString, DOS_DEVICE_NAME);
    IoDeleteSymbolicLink(&Win32NameString);
    IoDeleteDevice(DriverObject->DeviceObject);

}

/*
	ParseConfigFile:
	
	This funcion will parse the config file for getting a 
	configuration.

*/

void ParseConfigFile(char * configFile)
{





}

typedef struct {

	short AddrL;
	short AddrH;

} WWAddr;

typedef struct {

	short AddrL;
	short selector;
	short flags;
	short AddrH;

} IntDesc;


	IntDesc * intsBase;
	WWAddr  g_OldAddr;

#define INT2E 0x2e


void StartTheHook(void)
{
	
    char	idt[6];
	int auxConv;
	WWAddr  * NewAddr = (WWAddr *)&auxConv;

	__asm {

		sidt idt;

	};

	intsBase = (IntDesc *)(*(int *)&idt[2]);
	
	auxConv = (int)&HookRutine;

	g_OldAddr.AddrH = intsBase[INT2E].AddrH;
	g_OldAddr.AddrL = intsBase[INT2E].AddrL;
		
	__asm cli;

	intsBase[INT2E].AddrH = NewAddr->AddrH;
	intsBase[INT2E].AddrL = NewAddr->AddrL;

	__asm sti;
		
}


void StopTheHook(void)
{
	__asm cli;

	intsBase[INT2E].AddrH = g_OldAddr.AddrH;
	intsBase[INT2E].AddrL = g_OldAddr.AddrL;

	__asm sti;
}


void __declspec(naked) HookRutine(void)
{
 
	__asm{
	
		PUSHAD
		PUSHFD
		PUSH FS

		MOV     EBX,00000030h
		MOV     FS,BX
		STI
		push edx
		push eax
		call SubHook

	}

	
	__asm{

		POP     FS
		POPFD
		POPAD

		jmp dword ptr [g_OldAddr]
		
	};

	
}

int g_ThreadsInTheHook[1000] = {0};
char g_ArrayBlocker=0;
char g_FileBlocker=0;

void BlockIt(char * p)
{
	__asm 
	{
		mov edx,[p]
loopWaitArray:
		xor eax,eax
		xor ebx,ebx
		inc ebx
		cmpxchg [edx],bl
		jnz loopWaitArray
	}
}

void FreeIt(char * p)
{
	__asm
	{
		mov edx,[p]
		xor eax,eax
		mov [edx],al
	}
}


void SubHook(int reax,int redx)
{
	struct _EPROCESS * proc;
	
			

	if(!pid)
		return;

	proc = IoGetCurrentProcess();

	if(proc->UniqueProcessId == pid)
	{
		int tid;

		tid = (int)PsGetCurrentThreadId();

		BlockIt(&g_ArrayBlocker);
		{
			int i;
			
			for(i=0;i<1000 && g_ThreadsInTheHook[i];i++)
			{
				if(g_ThreadsInTheHook[i] == tid)
				{
					FreeIt(&g_ArrayBlocker);
					return;
				}
			}
			
			if(i == 1000)
			{
				FreeIt(&g_ArrayBlocker);
				return;
			}

			g_ThreadsInTheHook[i] = tid;
			g_ThreadsInTheHook[i+1] = 0;

		}		
		FreeIt(&g_ArrayBlocker);


		BlockIt(&g_FileBlocker);
		{			
			OBJECT_ATTRIBUTES oa;
			UNICODE_STRING us;
			HANDLE hfile = NULL;
			IO_STATUS_BLOCK iosb;
					
			RtlInitUnicodeString(&us,FileForLog);

			InitializeObjectAttributes(&oa,
								   &us,
								   OBJ_CASE_INSENSITIVE,
								   NULL,
								   NULL);

			ZwCreateFile(&hfile,
			FILE_APPEND_DATA,
			&oa,
			&iosb,
			NULL,
			FILE_ATTRIBUTE_NORMAL,
			FILE_SHARE_READ|FILE_SHARE_WRITE,
			FILE_OPEN_IF,
			FILE_NON_DIRECTORY_FILE|FILE_SYNCHRONOUS_IO_NONALERT,
			NULL,
			0);

            if(hfile)
			{
				char buffer[100];

				//we will print service and thread

				sprintf(buffer,"-----------------------------\n"
							   "Thread:%x\nService:0x%x\n\n"
							   ,tid,reax);

				ZwWriteFile(hfile,
							NULL,
							NULL,
							NULL,
							&iosb,
							buffer,
							strlen(buffer),
							NULL,
							NULL);
				TryToParseParameters(reax,redx,hfile);
				ZwClose(hfile);
				hfile=NULL;
			}
		}		
		FreeIt(&g_FileBlocker);
		BlockIt(&g_ArrayBlocker);
		{
			int i;
			int j;
			for(i=0;g_ThreadsInTheHook[i]!=tid;i++);
			for(j=i;g_ThreadsInTheHook[j];j++);
			
			g_ThreadsInTheHook[i] = g_ThreadsInTheHook[j-1];
			g_ThreadsInTheHook[j-1] = 0;
		}
		FreeIt(&g_ArrayBlocker);

	
	}

}

/*
	TryToParseParameters:

	This function will work in this manner:
		It will get each parameter and it will try to predict
	if the current param is a pointer or flags for the 
	service. It will print always the value of the param,but
	if the param could be a pointer it will try to "understand"
	the structure pointed by the parameter printing values for
	that structures.

*/

int TryToParseParameters(int service,int * parameters,HANDLE hfile)
{
	int nParams;
	int paramValue;
	char buffer[3000];
	int i;
	IO_STATUS_BLOCK iosb;
	int goodMem = 0;		

	for(i=1,(nParams = (KeServiceDescriptorTable->ArgumentTable[service]/4));
		nParams > 0;
		nParams--,parameters++,i++)
	{
		paramValue = *parameters;

		if(MmIsAddressValid(paramValue))
		{
			/*
			 * If the address is valid we could try to parse
			 * a possible structure.
			 */
		
			sprintf(buffer,"Parameter %d Value: %x Is A Valid Memory\n",i,paramValue);	

		}
		else
		{
			sprintf(buffer,"Parameter %d Value: %x\n",i,paramValue);
		}
		
		ZwWriteFile(hfile,
					NULL,
					NULL,
					NULL,
					&iosb,
					buffer,
					strlen(buffer),
					NULL,
					NULL);

		if(MmIsAddressValid(paramValue))
		{
			/*
			 * If the address is valid we could try to parse
			 * a possible structure.
			 */
			
			POBJECT_ATTRIBUTES poa;
			int OffsetInPage;
			ANSI_STRING as;

            //Is A Object Attributes?

			poa = (POBJECT_ATTRIBUTES)paramValue;
			
			if(IsValidMemoryRange(poa,sizeof(OBJECT_ATTRIBUTES)) && 
		      (poa->Length == sizeof(OBJECT_ATTRIBUTES)))
			{
				if(IsValidMemoryRange(poa->ObjectName,sizeof(UNICODE_STRING))&&
				   IsValidMemoryRange(poa->ObjectName->Buffer,poa->ObjectName->Length)&&
				   (poa->ObjectName->Length == (wcslen(poa->ObjectName->Buffer)*2)))
				{
					sprintf(buffer,  "        OBJECT_ATTRIBUTES:\n"
									 "        Attributes:%x\n"
									 "        ObjectName:"
									 ,poa->Attributes
									 );
					as.Buffer = &buffer[strlen(buffer)];

					RtlUnicodeStringToAnsiString(
					&as,
					poa->ObjectName,
					FALSE);
										
					strcat(buffer,"\n\n");

					ZwWriteFile(hfile,
					NULL,
					NULL,
					NULL,
					&iosb,
					buffer,
					strlen(buffer),
					NULL,
					NULL);
				}
			}
		}	
	}
}



int IsValidMemoryRange(int addr,int size)
{	
	int Pages = 0;
	int n;
	int initialPage;

	initialPage = addr&0xFFFFF000;
	
	for(n=0;((initialPage+(n*0x1000)) < (addr+size));n++)
	{
		Pages++;
	}

	for(n=0,Pages;Pages;n++,Pages--)
	{
		if(!MmIsAddressValid(initialPage+(n*0x1000)))
		{
			return FALSE;	
		}

	}

	return TRUE;
}