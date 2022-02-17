#define IOCTL_GET_NAME_STRING \
  CTL_CODE(FILE_DEVICE_UNKNOWN, 0x800, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_IMPERSONATE_PROCESS \
  CTL_CODE(FILE_DEVICE_UNKNOWN, 0x801, METHOD_BUFFERED, FILE_ANY_ACCESS)

#define NT_DEVICE_NAME          L"\\Device\\HxDefDriver"
#define DOS_DEVICE_NAME         L"\\DosDevices\\HxDefDriver"
#define DEVICE_NAME		L"\\\\.\\HxDefDriver"

typedef struct 
{
  ULONG pid;
  HANDLE hwnd;
} DIB_NAME_STRING;

typedef struct 
{
  ULONG TargetProcess;
  ULONG SystemProcess;
} DIB_IMPERSONATE_PROCESS;

typedef struct 
{
  ULONG status;
} DOB_UNKNOWN;

typedef struct 
{
  ULONG status;
  ANSI_STRING name;
} DOB_NAME_STRING;

typedef struct 
{
  ULONG status;
} DOB_IMPERSONATE_PROCESS;
