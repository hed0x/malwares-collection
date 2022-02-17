#include "resource.h"
#include "Includes.h"

typedef struct _ICONDIRENTRY {
  BYTE bWidth;
  BYTE bHeight;
  BYTE bColorCount;
  BYTE bReserved;
  WORD wPlanes;
  WORD wBitCount;
  DWORD dwBytesInRes;
  DWORD dwImageOffset;
} ICONDIRENTRY, 
 * LPICONDIRENTRY;

typedef struct _ICONDIR {
  WORD idReserved;
  WORD idType;
  WORD idCount;
  ICONDIRENTRY idEntries[1];
} ICONDIR, 
 * LPICONDIR;

#pragma pack(push)
#pragma pack(2)
typedef struct _GRPICONDIRENTRY {
  BYTE bWidth;
  BYTE bHeight;
  BYTE bColorCount;
  BYTE bReserved;
  WORD wPlanes;
  WORD wBitCount;
  DWORD dwBytesInRes;
  WORD nID;
} GRPICONDIRENTRY, 
 * LPGRPICONDIRENTRY;
#pragma pack(pop)

#pragma pack(push)
#pragma pack(2)
typedef struct _GRPICONDIR {
  WORD idReserved;
  WORD idType;
  WORD idCount;
  GRPICONDIRENTRY idEntries[1];
} GRPICONDIR, 
 * LPGRPICONDIR;
#pragma pack(pop)

typedef DWORD (WINAPI* _RtlCompressBuffer)(IN ULONG CompressionFormat,IN PVOID SourceBuffer,IN ULONG SourceBufferLength,
	OUT PVOID DestinationBuffer,IN ULONG DestinationBufferLength,IN ULONG Unknown,OUT PULONG pDestinationSize,IN PVOID WorkspaceBuffer );

typedef DWORD (WINAPI *_RtlGetCompressionWorkSpaceSize )(IN ULONG CompressionFormat,OUT PULONG pNeededBufferSize,OUT PULONG pUnknown );

HINSTANCE hInst;
OPENFILENAME OFN;
HRSRC hResource;
DWORD szResource;
HGLOBAL hGlob;
POINT pt;
RECT rect;
LPSTR nFileName;
CHAR strFileSize[1024];
CHAR iFileName[MAX_PATH];
HICON hIcon;
DWORD dwBytes;
DWORD Seek;

BOOL CALLBACK DlgProc(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam);
DWORD vGetFileSize(LPSTR nFileName);
BOOL AddIcon(LPSTR szIFileName, LPSTR szEFileName);
LPSTR LoadFile(LPSTR nFileName,DWORD FileSize);
LPSTR GetExtension(LPSTR nFileName);
VOID SaveFileToDisk(LPSTR nFileName,LPSTR lpFileMaped,DWORD FileSize);
LPSTR CompressBuffer(LPSTR lpBuffer,DWORD szBuffer,LPDWORD dwSizeOut);

int APIENTRY WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPSTR lpCmdLine,int nCmdShow)
{
	nFileName=(LPSTR)malloc(MAX_PATH);
	hInst = hInstance;
	DialogBox(hInst,MAKEINTRESOURCE(IDD_MAIN),NULL,(DLGPROC)DlgProc);
	return 0;
}

BOOL CALLBACK DlgProc(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
switch(uMsg)
{
	case WM_INITDIALOG:
		InitCommonControls();
		InitListView1(GetDlgItem(hDlg,ID_LIST1));
		hIcon = LoadIcon(hInst,MAKEINTRESOURCE(IDI_ICON1));
		SendMessage(hDlg,WM_SETICON,(WPARAM)ICON_SMALL,(LPARAM)hIcon);
		hIcon = LoadIcon(hInst,MAKEINTRESOURCE(IDI_ICON2));
		SendMessage(GetDlgItem(hDlg,ID_LICON),STM_SETICON,(WPARAM)hIcon,(LPARAM)0);
	break;

	case WM_CLOSE:
		EndDialog(hDlg,0);
	break;

	case WM_MOUSEMOVE:
		GetCursorPos(&pt);
		GetWindowRect(GetDlgItem(hDlg,ID_LICON),&rect);
		if(PtInRect(&rect,pt))
		{
			SetCursor(LoadCursor(NULL,MAKEINTRESOURCE(32649)));
		}
		else
		{
			SetCursor(LoadCursor(NULL,IDC_ARROW));
		}
	break;

	case WM_LBUTTONDOWN:
		GetCursorPos(&pt);
		GetWindowRect(GetDlgItem(hDlg, ID_LICON),&rect);
		if(PtInRect(&rect,pt))
		{
			SetCursor(LoadCursor(NULL, MAKEINTRESOURCE(32649)));
			memset(&OFN,0,sizeof(OFN));
			nFileName[0] = '\0';
			OFN.lStructSize = sizeof(OPENFILENAME);
			OFN.lpstrFilter = "Iconos (*.ico)\0*.ico\0\0";
			OFN.lpstrFile = iFileName;
			OFN.nMaxFile = MAX_PATH;
			if(GetOpenFileName(&OFN))
			{
				hIcon=ExtractIcon(hInst,iFileName,0);
				SendMessage(GetDlgItem(hDlg,ID_LICON),STM_SETICON,(WPARAM)hIcon,(LPARAM)0);
			}
		}
	break;
	
	case WM_RBUTTONDOWN:
		GetCursorPos(&pt);
		GetWindowRect(GetDlgItem(hDlg,ID_LICON),&rect);
		if(PtInRect(&rect,pt))
		{
			SetCursor(LoadCursor(NULL,MAKEINTRESOURCE(32649)));
		}
	break;

	case WM_COMMAND:
		switch LOWORD(wParam)
		{
			case ID_ADD:
				OFN.lStructSize=sizeof(OPENFILENAME);
				OFN.hwndOwner=hDlg;
				OFN.lpstrFilter="Todos los archivos (*.*)\0*.*\0\0";
				OFN.lpstrFile=nFileName;
				OFN.nMaxFile=MAX_PATH;
				if(GetOpenFileName(&OFN))
				{
					wsprintf(strFileSize,"%i",vGetFileSize(nFileName));
					ListAddItem(GetDlgItem(hDlg,ID_LIST1),nFileName,strFileSize);
				}
			break;

			case ID_DELETE:
				DeleteSelectedItem(GetDlgItem(hDlg,ID_LIST1));
			break;

			case ID_COMPILAR:
				
				//Obtenemos el numero de archivos a unir
				DWORD NumArchivos=SendMessage(GetDlgItem(hDlg,ID_LIST1),LVM_GETITEMCOUNT,0,0);

				if(!NumArchivos)
				{
					MessageBox(0,"Debe seleccionar 2 o más archivos","Little Joiner",MB_ICONERROR);
					break;
				}

				OFN.lStructSize=sizeof(OPENFILENAME);
				OFN.hwndOwner=hDlg;
				OFN.lpstrFilter="Archivos Ejecutables (*.exe)\0*.exe\0\0";
				OFN.lpstrFile=nFileName;
				OFN.nMaxFile=MAX_PATH;
				if(!GetSaveFileName(&OFN))
				{
					break;
				}

				if(IsDlgButtonChecked(hDlg,ID_ICONOCHECK)==BST_CHECKED)
				{
					//Cargamos el resource
					hResource=FindResource(NULL,MAKEINTRESOURCE(IDR_STUB1),"STUB");
					szResource=SizeofResource(NULL,hResource);
					hGlob=LoadResource(NULL,hResource);
					LPSTR lpBuffer=(LPSTR)LockResource(hGlob);

					//Creamos el archivo
					HANDLE hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0);
					WriteFile(hFile,lpBuffer,szResource,&dwBytes,0);
					CloseHandle(hFile);

					if(iFileName[0]!=0)
					{
						if(AddIcon(iFileName,nFileName)==FALSE)
						{
							MessageBox(0,"No se pudo añadir el icono","Little Joiner",0);
						}
					}

					Seek=0;

					for(DWORD z=0;z<NumArchivos;z++)
					{
						//Abrimos el Stub
						hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
						DWORD szStub=GetFileSize(hFile,0);
						LPSTR lpStub=(LPSTR)malloc(szStub);
						ReadFile(hFile,lpStub,szStub,&dwBytes,0);
						CloseHandle(hFile);

						//Obtenemos el nombre y extensión del archivo a unir
						LPSTR SubArchivo=(LPSTR)malloc(MAX_PATH);
						SubArchivo=GetItem(GetDlgItem(hDlg,ID_LIST1),z,0);
						LPSTR extSubArchivo=(LPSTR)malloc(3);
						extSubArchivo=GetExtension(SubArchivo);

						//Abrimos el archivo a unir
						HANDLE hSubArchivo=CreateFile(SubArchivo,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
						DWORD szSubArchivo=GetFileSize(hSubArchivo,0);
						LPSTR lpSubArchivo=(LPSTR)malloc(szSubArchivo);
						ReadFile(hSubArchivo,lpSubArchivo,szSubArchivo,&dwBytes,0);
						CloseHandle(hSubArchivo);

						//Comprimimos el archivo
						DWORD szCompressedSubArchivo;
						LPSTR lpCompressedSubArchivo=CompressBuffer(lpSubArchivo,szSubArchivo,&szCompressedSubArchivo);

						//Lo juntamos con el Stub el numero de archivos, tamaño, extensión y archivo
						LPSTR lpFileMaped=(LPSTR)malloc(szStub+szCompressedSubArchivo+11);
						CopyMemory(&lpFileMaped[0],&lpStub[0],szStub);
						CopyMemory(&lpFileMaped[szStub],&NumArchivos,4);
						CopyMemory(&lpFileMaped[szStub+4],&szCompressedSubArchivo,4);
						CopyMemory(&lpFileMaped[szStub+8],&extSubArchivo[0],3);
						CopyMemory(&lpFileMaped[szStub+11],&lpCompressedSubArchivo[0],szCompressedSubArchivo);

						//Guardamos los cambios
						hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
						WriteFile(hFile,lpFileMaped,szStub+szCompressedSubArchivo+11,&dwBytes,0);
						CloseHandle(hFile);
					}
				}
				else
				{
					//Cargamos el resource
					hResource=FindResource(NULL,MAKEINTRESOURCE(IDR_STUB),"STUB");
					szResource=SizeofResource(NULL,hResource);
					hGlob=LoadResource(NULL,hResource);
					LPSTR lpBuffer=(LPSTR)LockResource(hGlob);

					//Creamos el archivo
					HANDLE hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0);
					WriteFile(hFile,lpBuffer,szResource,&dwBytes,0);
					CloseHandle(hFile);

					//Obtenemos el numero de archivos a unir
					DWORD NumArchivos=SendMessage(GetDlgItem(hDlg,ID_LIST1),LVM_GETITEMCOUNT,0,0);

					Seek=0;

					for(DWORD z=0;z<NumArchivos;z++)
					{
						//Abrimos el Stub
						hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
						DWORD szStub=GetFileSize(hFile,0);
						LPSTR lpStub=(LPSTR)malloc(szStub);
						ReadFile(hFile,lpStub,szStub,&dwBytes,0);
						CloseHandle(hFile);

						//Obtenemos el nombre y extensión del archivo a unir
						LPSTR SubArchivo=(LPSTR)malloc(MAX_PATH);
						SubArchivo=GetItem(GetDlgItem(hDlg,ID_LIST1),z,0);
						LPSTR extSubArchivo=(LPSTR)malloc(3);
						extSubArchivo=GetExtension(SubArchivo);

						//Abrimos el archivo a unir
						HANDLE hSubArchivo=CreateFile(SubArchivo,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
						DWORD szSubArchivo=GetFileSize(hSubArchivo,0);
						LPSTR lpSubArchivo=(LPSTR)malloc(szSubArchivo);
						ReadFile(hSubArchivo,lpSubArchivo,szSubArchivo,&dwBytes,0);
						CloseHandle(hSubArchivo);

						//Comprimimos el archivo
						DWORD szCompressedSubArchivo;
						LPSTR lpCompressedSubArchivo=CompressBuffer(lpSubArchivo,szSubArchivo,&szCompressedSubArchivo);

						//Lo juntamos con el Stub el numero de archivos, tamaño, extensión y archivo
						LPSTR lpFileMaped=(LPSTR)malloc(szStub+szCompressedSubArchivo+11);
						CopyMemory(&lpFileMaped[0],&lpStub[0],szStub);
						CopyMemory(&lpFileMaped[szStub],&NumArchivos,4);
						CopyMemory(&lpFileMaped[szStub+4],&szCompressedSubArchivo,4);
						CopyMemory(&lpFileMaped[szStub+8],&extSubArchivo[0],3);
						CopyMemory(&lpFileMaped[szStub+11],&lpCompressedSubArchivo[0],szCompressedSubArchivo);

						//Ajustamos el Pe para metar el EOF dentro de la sección
						PIMAGE_DOS_HEADER IDH;
						PIMAGE_NT_HEADERS INTH;
						PIMAGE_SECTION_HEADER ISH;

						IDH=(PIMAGE_DOS_HEADER)&lpFileMaped[0];
						INTH=(PIMAGE_NT_HEADERS)&lpFileMaped[IDH->e_lfanew];
						ISH=(PIMAGE_SECTION_HEADER)&lpFileMaped[IDH->e_lfanew+sizeof(IMAGE_NT_HEADERS)];

						ISH->SizeOfRawData=ISH->SizeOfRawData+szCompressedSubArchivo+11;
						ISH->Misc.VirtualSize=ISH->Misc.VirtualSize+szCompressedSubArchivo+11;
						INTH->OptionalHeader.SizeOfImage=INTH->OptionalHeader.SizeOfImage+szCompressedSubArchivo+11;

						//Guardamos los cambios
						hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
						WriteFile(hFile,lpFileMaped,szStub+szCompressedSubArchivo+11,&dwBytes,0);
						CloseHandle(hFile);
					}
				}

				MessageBox(0,"Finalizado Correctamente","Little Joiner",MB_ICONINFORMATION);
			break;
		}
	break;
}
return 0;
}

VOID SaveFileToDisk(LPSTR nFileName,LPSTR lpFileMaped,DWORD FileSize)
{
	DWORD Escritos;
	HANDLE hFile=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0);
	WriteFile(hFile,lpFileMaped,FileSize,&Escritos,0);
	CloseHandle(hFile);
}

LPSTR CompressBuffer(LPSTR lpBuffer,DWORD szBuffer,LPDWORD dwSizeOut)
{
	_RtlCompressBuffer miRtlCompressBuffer;
	_RtlGetCompressionWorkSpaceSize miRtlGetCompressionWorkSpaceSize;
	DWORD dwRet;
	DWORD dwSize;
	LPVOID WSB;
  
	DWORD dstSize=16*szBuffer;

	LPSTR szRet=(LPSTR)malloc(dstSize);

	miRtlCompressBuffer =(_RtlCompressBuffer)GetProcAddress((HINSTANCE)LoadLibraryA("NTDLL.DLL"),"RtlCompressBuffer");
	miRtlGetCompressionWorkSpaceSize=(_RtlGetCompressionWorkSpaceSize)GetProcAddress((HINSTANCE)LoadLibraryA("NTDLL.DLL"),"RtlGetCompressionWorkSpaceSize");

	miRtlGetCompressionWorkSpaceSize(COMPRESSION_FORMAT_LZNT1,&dwSize,&dwRet);

	WSB=(LPVOID)malloc(dwSize);

	miRtlCompressBuffer(COMPRESSION_FORMAT_LZNT1,lpBuffer,szBuffer,szRet,dstSize,0,dwSizeOut,WSB);

	free(WSB);
	return szRet;
}

DWORD vGetFileSize(LPSTR nFileName)
{
	HANDLE hGFS=CreateFile(nFileName,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,0,0);
	if(hGFS==INVALID_HANDLE_VALUE)
	{
		return NULL;
	}

	DWORD szFile=GetFileSize(hGFS,0);
	if(szFile==INVALID_FILE_SIZE)
	{
		return NULL;
	}
	CloseHandle(hGFS);

	return szFile;
}

BOOL AddIcon(LPSTR szIFileName, LPSTR szEFileName)
{
	HANDLE hFile = CreateFile(szIFileName, GENERIC_READ,FILE_SHARE_WRITE+FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
	if(hFile == INVALID_HANDLE_VALUE)
	{
		return FALSE;
	}
	LPICONDIR lpid;
	lpid = (LPICONDIR)malloc(sizeof(ICONDIR));
	if(lpid == NULL)
	{
		return FALSE;
	}
	DWORD dwBytesRead;
	ReadFile(hFile, &lpid->idReserved, sizeof(WORD), &dwBytesRead, NULL);
	ReadFile(hFile, &lpid->idType, sizeof(WORD), &dwBytesRead, NULL);
	ReadFile(hFile, &lpid->idCount, sizeof(WORD), &dwBytesRead, NULL);
	lpid = (LPICONDIR)realloc(lpid, (sizeof(WORD) * 3) + (sizeof(ICONDIRENTRY) * lpid->idCount));
	if(lpid == NULL)
	{
		return FALSE;
	}
	ReadFile(hFile, &lpid->idEntries[0], sizeof(ICONDIRENTRY) * lpid->idCount, &dwBytesRead, NULL);
	LPGRPICONDIR lpgid;
	lpgid = (LPGRPICONDIR)malloc(sizeof(GRPICONDIR));
	if(lpgid == NULL)
	{
		return FALSE;
	}
	lpgid->idReserved = lpid->idReserved;
	lpgid->idType = lpid->idType;
	lpgid->idCount = lpid->idCount;
	lpgid = (LPGRPICONDIR)realloc(lpgid, (sizeof(WORD) * 3) + (sizeof(GRPICONDIRENTRY) * lpgid->idCount));
	if(lpgid == NULL)
	{
		return FALSE;
	}
	for(int i = 0; i < lpgid->idCount; i++)
	{
		lpgid->idEntries[i].bWidth = lpid->idEntries[i].bWidth;
		lpgid->idEntries[i].bHeight = lpid->idEntries[i].bHeight;
		lpgid->idEntries[i].bColorCount = lpid->idEntries[i].bColorCount;
		lpgid->idEntries[i].bReserved = lpid->idEntries[i].bReserved;
		lpgid->idEntries[i].wPlanes = lpid->idEntries[i].wPlanes;
		lpgid->idEntries[i].wBitCount = lpid->idEntries[i].wBitCount;
		lpgid->idEntries[i].dwBytesInRes = lpid->idEntries[i].dwBytesInRes;
		lpgid->idEntries[i].nID = i + 1;
	}
	HANDLE hUpdate;
	hUpdate = BeginUpdateResource(szEFileName, TRUE);
	if(hUpdate == NULL)
	{
		CloseHandle(hFile);
		return FALSE;
	}
	for(i = 0; i < lpid->idCount; i++)
	{
		LPBYTE lpBuffer = (LPBYTE)malloc(lpid->idEntries[i].dwBytesInRes);
		if(lpBuffer == NULL)
		{
			CloseHandle(hFile);
			return FALSE;
		}
		SetFilePointer(hFile, lpid->idEntries[i].dwImageOffset, NULL, FILE_BEGIN);
		ReadFile(hFile, lpBuffer, lpid->idEntries[i].dwBytesInRes, &dwBytesRead, NULL);
		if(UpdateResource(hUpdate, RT_ICON, MAKEINTRESOURCE(lpgid->idEntries[i].nID), MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), &lpBuffer[0], lpid->idEntries[i].dwBytesInRes) == FALSE)
		{
			CloseHandle(hFile);
			free(lpBuffer);
			return FALSE;
		}
		free(lpBuffer);
	}
	CloseHandle(hFile);
	if(UpdateResource(hUpdate, RT_GROUP_ICON, MAKEINTRESOURCE(1), MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), &lpgid[0], (sizeof(WORD) * 3) + (sizeof(GRPICONDIRENTRY) * lpgid->idCount)) == FALSE)
	{
		return FALSE;
	}
	if(EndUpdateResource(hUpdate, FALSE) == FALSE)
	{
		return FALSE;
	}
	return TRUE;
}

LPSTR GetExtension(LPSTR nFileName)
{
	LPSTR extension=(LPSTR)malloc(3);
	for(DWORD i=0;nFileName[i]!='.';i++)
	{
	}

	extension[0]=nFileName[i+1];
	extension[1]=nFileName[i+2];
	extension[2]=nFileName[i+3];

	return extension;
}