// RXEdit.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "resource.h"

#define LOFFSET_FILE 0x861
#define LOFFSET_REG 0xC61
#define LOFFSET_PROC 0x1061

static char szProcBlock[1024];
static char szFileBlock[1024];
static char szRegBlock[1024];

int WriteSettings()
{
	int len;
	char seps[]   = "\n";
	char *token;
	BYTE bcpy=0x0A;
	HANDLE hFile;
	DWORD dwWrote;

	len = strlen(szProcBlock);
	memcpy(szProcBlock+len, &bcpy, 1);
	len = strlen(szFileBlock);
	memcpy(szFileBlock+len, &bcpy, 1);
	len = strlen(szRegBlock);
	memcpy(szRegBlock+len, &bcpy, 1);

	token = strtok(szProcBlock, seps);
	while(token != NULL)
	{
		token = strtok(NULL, seps );
	}

	token = strtok(szFileBlock, seps);
	while(token != NULL)
	{
		token = strtok(NULL, seps );
	}

	token = strtok(szRegBlock, seps);
	while(token != NULL)
	{
		token = strtok(NULL, seps );
	}

	hFile = CreateFile("load.exe", GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, 0);

 	if (hFile == INVALID_HANDLE_VALUE)
	{
		return -1;
	}

	SetFilePointer(hFile, LOFFSET_FILE, NULL, FILE_BEGIN);
	WriteFile(hFile, szFileBlock, 1024, &dwWrote, NULL);

	SetFilePointer(hFile, LOFFSET_REG, NULL, FILE_BEGIN);
	WriteFile(hFile, szRegBlock, 1024, &dwWrote, NULL);

	SetFilePointer(hFile, LOFFSET_PROC, NULL, FILE_BEGIN);
	WriteFile(hFile, szProcBlock, 1024, &dwWrote, NULL);

	MessageBox(0, "Appended Settings", "Settings Appended", MB_ICONINFORMATION|MB_OK);

	return 0;
}

static BOOL CALLBACK EditMain(HWND hwndDlg, 
							 UINT msg, 
							 WPARAM     wParam, 
							 LPARAM     lParam)
{
	char szText[256];

	switch (msg) 
	{
		case WM_INITDIALOG:
			memset(szProcBlock, 0, sizeof(szProcBlock));
			memset(szFileBlock, 0, sizeof(szFileBlock));
			memset(szRegBlock, 0, sizeof(szRegBlock));
			return TRUE;
        
		case WM_COMMAND:
			switch(wParam)
			{
				case IDC_BUTTON1:
					GetDlgItemText(hwndDlg, IDC_EDIT1, szText, 255);
					lstrcat(szFileBlock, szText);
					lstrcat(szFileBlock, "\n");
					SendMessage(GetDlgItem(hwndDlg, IDC_LIST1), LB_ADDSTRING, (WPARAM) 0, (LPARAM) szText);
				break;
				
				case IDC_BUTTON2:
					GetDlgItemText(hwndDlg, IDC_EDIT2, szText, 255);
					lstrcat(szProcBlock, szText);
					lstrcat(szProcBlock, "\n");
					SendMessage(GetDlgItem(hwndDlg, IDC_LIST2), LB_ADDSTRING, (WPARAM) 0, (LPARAM) szText);
					break;

				case IDC_BUTTON3:
					GetDlgItemText(hwndDlg, IDC_EDIT3, szText, 255);
					lstrcat(szRegBlock, szText);
					lstrcat(szRegBlock, "\n");
					SendMessage(GetDlgItem(hwndDlg, IDC_LIST3), LB_ADDSTRING, (WPARAM) 0, (LPARAM) szText);
					break;

				case IDOK:
					WriteSettings();

				return TRUE;
			}
		return TRUE;
		break;

		case WM_CLOSE:
			EndDialog(hwndDlg,0);
			return TRUE;
	}

	return FALSE;
}

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	DialogBox(hInstance, MAKEINTRESOURCE(IDD_EDITMAIN), NULL, (DLGPROC) EditMain); 

	return 0;
}



