/***[ThuNderSoft]*************************************************************
						   KUANG2: anti-virus thread
								   ver: 0.12
								˙˘ƒÕ WEIRD Õƒ˘˙
*****************************************************************************/

/* HISTORY */
// ver 0.12 (15-may-1999): maxdeep
// ver 0.10 (10-may-1999): born code

#include <windows.h>
#include <strmem.h>
#include <win95e.h>
#include <ctypew.h>
#include <tools.h>
#include "k2c.h"

// maximalna dozvoljena dubina rekurzije
#define		MAX_DEEP		12

HWND hsmall, hsmallist;
extern HWND hDlg;
extern BOOL connected;
char t[BUFFER_SIZE];
extern char buffer[BUFFER_SIZE];
extern HANDLE hThread;
BOOL scanning;
unsigned int deep;
unsigned int totalfiles, totalinfected, totalcleaned;

extern int IsFileInfect(char *, char* );

/*
	Enabler
	-------
  ˛ pomoÜna funkcija za enable/disable. */

void Enabler(BOOL cond)
{
	EnableWindow(hDlg, cond);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_CLEAN), cond);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON), cond);
	return;
}


/*
	SmallSay
	--------
  ˛ ispisuje poruku u pomoÜnom prozoru. */

void SmallSay(char *poruka)
{
	unsigned int i;

	strcopyF(t, poruka); i=0;
	while ( (t[i]!='\r') && t[i]) i++;      // pronaîi kraj poruke ili prvi /r/n (CRLF)
	t[i]=0;									// u ovom drugom sluÅaju iseci CRLF jer se to ne prikazuje

	SendMessage(hsmallist, WM_SETREDRAW, FALSE, 0);						// iskljuÅi aÇuriranje list boxa da bi smanjli flicker
	SendDlgItemMessage(hsmall, ID_LISTBOX, LB_ADDSTRING, 0, (LPARAM) t);
	i=SendDlgItemMessage(hsmall, ID_LISTBOX, LB_GETTOPINDEX, 0, 0);		// preuzmi index prve prikazane linije
	if (i==32101) {														// viÑe od 32100 nevidljivih linija linija na gore?
		SendDlgItemMessage(hsmall, ID_LISTBOX, LB_DELETESTRING, 0, 0);	// da, obriÑi prvu
		i=32100;
	}
	SendDlgItemMessage(hsmall, ID_LISTBOX, LB_SETTOPINDEX, i+1, 0);		// postavi da se sadrÇaj listboxa promeni tako da se dodata linija vidi

	i=SendDlgItemMessage(hsmall, ID_LISTBOX, LB_GETCOUNT, 0, 0);			// naîi index+1 poslednjeg
	SendMessage(hsmallist, WM_SETREDRAW, TRUE, 0);						// ukljuÅi aÇuriranje list boxa (trebalo bi posle sledeÜe pa onda InvalidateRect, ali neÜu da komplikujem)
	SendDlgItemMessage(hsmall, ID_LISTBOX, LB_SETCARETINDEX, i-1, MAKELPARAM(TRUE, 0)); // fokusiraj poslednji i osveÇi ceo list box
	return;
}


/*
	SmallSayReplace
	---------------
  ˛ ispisuje poruku u pomoÜnom prozoru ali tako Ñto zameni poslednju. */

void SmallSayReplace(char *poruka)
{
	unsigned int i;
	strcopyF(t, poruka); i=0;
	while ( (t[i]!='\r') && t[i]) i++;      // pronaîi kraj poruke ili prvi /r/n (CRLF)
	t[i]=0;									// u ovom drugom sluÅaju iseci CRLF jer se to ne prikazuje

	SendMessage(hsmallist, WM_SETREDRAW, FALSE, 0);						// iskljuÅi aÇuriranje
	i=SendDlgItemMessage(hsmall, ID_LISTBOX, LB_GETCOUNT, 0, 0);		// naîi index+1 poslednjeg
	SendDlgItemMessage(hsmall, ID_LISTBOX, LB_DELETESTRING, i-1, 0);	// obriÑi poslednji
	SendMessage(hsmallist, WM_SETREDRAW, TRUE, 0);						// ukljuÅi aÇuriranje
	SendDlgItemMessage(hsmall, ID_LISTBOX, LB_ADDSTRING, 0, (LPARAM) t);// dodaj novi umesto obrisanog i osveÇi list box
	return;
}


/*
	small_MsgLoop
	-------------
  ˛ odgovara na poruke za mali pomoÜni dijalog. */

LRESULT CALLBACK small_MsgLoop(HWND hd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg) {

		case WM_CREATE:
			hsmallist=GetDlgItem(hd, ID_LISTBOX);
			return TRUE;


		case WM_GETMINMAXINFO: {		// zahteva se informacija o min/max dimenzijama dijaloga
			MINMAXINFO *lpMMI = (MINMAXINFO *)lParam;
			lpMMI->ptMinTrackSize.x=200;		// minimalna Ñirina
			lpMMI->ptMinTrackSize.y=96;			// minimalna visina
			return 0;		// vraÜa se 0 ako je ova poruka obraîena
			}

		case WM_SIZING: {	// pomeranje u toku...
			unsigned int w,h;
			RECT *lpr=(LPRECT) lParam;
			w = (lpr->right - lpr->left)-8;		// oslobodi se bordera
			h = (lpr->bottom - lpr->top)-8;		// oslobodi se bordera
			h=(h/16)*16;						// visina linije listboxa je 16 pixela
			lpr->bottom=lpr->top+h+15;
			MoveWindow(GetDlgItem(hd, ID_LISTBOX), 0,0, w, h+4-16, TRUE);	// po 2 pixela je razmak gornje i donje ivice listboxa
			return TRUE;													// od prve i poslednje vidljive linije
			}

		case WM_SIZE:		// pomeranje je zavrÑeno
			InvalidateRect(hd, NULL, FALSE);		// osveÇi ceo prozor
			return TRUE;

		case WM_SYSCOMMAND:
			if (wParam==SC_CLOSE) {					// pritisnuto 'x' dugme za kraj
				if (scanning) {						// skeniranje u toku
					SuspendThread(hThread);			// privremeno stopiraj thread
					if (MessageBox(hd, "Stop scanning?", "Kuang2 anti-virus",MB_ICONQUESTION | MB_YESNO | MB_APPLMODAL) == IDYES) {
						scanning=FALSE;				// oznaÅi da je gotovo sa sekniranjem
					}
					ResumeThread(hThread);
				} else {							// skeniranje zavrÑeno
					Enabler(TRUE);
					DestroyWindow(hd);				// ubij dijalog
				}
				return TRUE;
			}
		}
	return FALSE;
}

// Potpis Kuang2 virusa. Od pravog potpisa se razlikuje samo u prvom
// karakteru da AntiVirus ne bi naÑao sam sebe kao zaraÇen!

char signature[]={
 'W', 0x46, 0x53, 0x4F, 0x46, 0x4D, 0x34, 0x33, 0x2F, 0x45,
0x4D, 0x4D, 0x01, 0x48, 0x66, 0x75, 0x58, 0x6A, 0x6F, 0x65,
0x70, 0x78, 0x74, 0x45, 0x6A, 0x73, 0x66, 0x64, 0x75, 0x70,
0x73, 0x7A, 0x42, 0x01, 0x48, 0x66, 0x75, 0x44, 0x70, 0x6E,
0x71, 0x76, 0x75, 0x66, 0x73, 0x4F, 0x62, 0x6E, 0x66, 0x42};

/*
	DesinfectFile
	-------------
  ˛ Åisti fajl od virusa
  ˛ virus je user-friendly tako da omoguÜava ultra-lako ÅiÑÜenje!
  ˛ vraÜa 0 ako je sve u redu. */

int DesinfectFile(char *fname) {
	unsigned int retvalue;			// povratna vrednost
	char *filemap;					// pointer na MMF
	char *filestart;				// pointer na poÅetak MMF fajla
	unsigned int fsize;				// veliÅina fajla
	unsigned int fattr;				// atributi fajla
	unsigned int nasao;				// rezultat pretrage
	unsigned int *_val;
	FILETIME creation_time, lastacc_time, lastwr_time;
	HANDLE hfile, hfilemap;

	retvalue=0;

	// uzmi atribute fajla i vidi da li je read only!
	fattr=GetFileAttributes(fname);			// uzmi atribute fajla
	if (fattr & FILE_ATTRIBUTE_READONLY)	// resetuj readonly ako ga ima
		SetFileAttributes(fname, fattr ^ FILE_ATTRIBUTE_READONLY);

	// otvori fajl
	hfile=CreateFile(fname, GENERIC_WRITE | GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, fattr, NULL);
	if (hfile==INVALID_HANDLE_VALUE) {retvalue=0x10; goto end1;}

	// uzmi veliÅinu fajla
	fsize=GetFileSize(hfile, NULL);
	if (fsize==0xFFFFFFFF) {retvalue=0x11; goto end2;}

	// saÅuvaj original vreme fajla
	GetFileTime(hfile, &creation_time, &lastacc_time, &lastwr_time);

	// kreiraj MMF
	hfilemap=CreateFileMapping (hfile, NULL, PAGE_READWRITE, 0, fsize, NULL);
	if (hfilemap==NULL) {retvalue=0x12; goto end2;}
	// kreiraj MMF view na ceo fajl
	filemap=(void *) MapViewOfFile (hfilemap, FILE_MAP_ALL_ACCESS, 0,0,0);
	if (filemap==NULL) {retvalue=0x13; goto end3;}
	filestart=filemap;


	// proveri da li je veÜ zaraÇen (Åak 50 znakova!)
	nasao=memfind(filestart, fsize, signature, 50);
	if (nasao==-1) goto end4;

	filemap=filestart+nasao-53;		// vrati se 53 bajtova iza naîenog stringa
	_val=(unsigned int*) filemap;	// preuzmi pointer na poÅetak bloka

	// zapis #1 - EntryPoint
	filemap=filestart + *(_val+1);
	*(unsigned int *) filemap=*_val;
	// zapis #2 - FileSize
	_val+=2;
	fsize=*_val;

	// zapis #old1 - #old5
	nasao=0; _val++;
	while (nasao<5) {
		if (*_val) {
			filemap=filestart + *_val;				// ofset
			*(unsigned int *) filemap=*(_val+1);	// data
		}
		_val+=2;
		nasao++;
	}

/*** REGULARAN KRAJ ***/
	retvalue=0;

	// upiÑi sve promene nazad u fajl
	FlushViewOfFile(filestart,0);
end4:
	UnmapViewOfFile(filemap);	// zatvaramo MMF view
end3:
	CloseHandle(hfilemap);		// zatvaramo MMF
	if (!retvalue) {			// ako nije bilo greÑke
		// namesti regularnu veliÅinu fajla
		SetFilePointer(hfile, fsize, NULL, FILE_BEGIN);
		SetEndOfFile(hfile);
		// vrati staro vreme
		SetFileTime(hfile, &creation_time, &lastacc_time, &lastwr_time);
		// a i atribute (ako je bio read-only)
		if (fattr & FILE_ATTRIBUTE_READONLY) SetFileAttributes(fname, fattr);
	}
end2:
	CloseHandle(hfile);			// zatvarmo fajl
end1:
	return retvalue;
}

char *fn;
char _bf[]="..";


/*
	DesinfectFolder
	---------------
  ˛ Åisti folder.
  ˛ rekurzija, ali do odreîene dubine. */

void DesinfectFolder(char *folder) {
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
	hSearch=FindFirstFile(path, &FileData);			// traÇi foldere
	if (hSearch==INVALID_HANDLE_VALUE) {
		wsprintf(buffer, "[Warning]: %s", path);
		SmallSayReplace(buffer);
		SmallSay("searching...");
		return;
	}

	// vrti sve fajlove
	do {
		// proveri da li je doÑao zahtev za zavrÑavanjem thread-a?
		if (!scanning) break;
		setfilename(path, FileData.cFileName);		// uzmi ime trenutnog fajla

		if (FileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
			fn=getfilename(path);
			if (!strcompF(fn, &_bf[1]) || !strcompF(fn, _bf)) continue;
			ix=strlengthF(path);
			path[ix]='\\'; path[ix+1]=0;            // dodaj '/'
			DesinfectFolder(path);					// rekurzija!
			path[ix]=0;								// obriÑi '/'
		} else {
			fn=getfileext(path);					// uzmi extenziju
			if (fn==NULL) continue;					// ako ne postoji izaîi
			ix=0; while (fn[ix]) {					// ako postoji
				fn[ix]=_to_lower(fn[ix]);			// napravi mala slova
				ix++;								// sva slova
			}
			if (!strcompF(fn, "exe")) {             // da li je .exe?
				SmallSayReplace(path);				// da, posao :)
				totalfiles++;
				switch (IsFileInfect(path, signature)) {
					case -1:
						wsprintf(buffer, "[Error] %s", path);
						SmallSayReplace(buffer);
						SmallSay("seraching...");
						break;
					case 0:
						break;
					case 1:
						totalinfected++;
						if (!DesinfectFile(path)) {
							ix=0; while(path[ix]) {path[ix]=_to_lower(path[ix]); ix++;}
							wsprintf(buffer, "[CLEANED] %s", path);
							totalcleaned++;
						} else {
							MessageBeep(MB_ICONEXCLAMATION);
							wsprintf(buffer, "[INFECTED] %s", path);
						}
						SmallSayReplace(buffer);
						SmallSay("searching...");
						break;
				}
			}
		}
	} while (FindNextFile(hSearch, &FileData));

	FindClose(hSearch);					// zavrÑi sa pretragom
	deep--;
	return;
}


/*
	CleanSystem
	-----------
  ˛ Åisti ceo sistem od Kuang2 virusa. */

DWORD WINAPI CleanSystem(LPVOID _d)
{
	DWORD drives;
	char root[]="a:\\";
	char explorer[MAX_PATH];
	char temp[MAX_PATH];
	char wininit[MAX_PATH];

	scanning=TRUE;
	Enabler(FALSE);

	signature[0]=0x4C;
	totalfiles=totalinfected=totalcleaned=0;

	// FAZA #1
	SmallSay("Phase #1: scanning system kernel.");
	// sledeÜi deo je identiÅan kao i kod inficiranja, osim Ñto se
	// koristi funkcija 'DesinfectFile'
	GetWindowsDirectory(explorer, MAX_PATH);
	strcopyF(wininit, explorer);
	straddF(explorer, "\\Explorer.exe");        // napravi string sa Explorer.exe
	straddF(wininit, "\\wininit.ini");          // napravi string sa Winit.exe

	if (IsFileInfect(explorer, signature)==1) { // ako je zaraÇen...
		SmallSay("System kernel is infected!");
		strcopyF(temp, explorer);
		setfileext(temp, "wk2");                // napravi string za kopiju Exlorer.exe
		CopyFile(explorer, temp, FALSE);		// kopiraj Explorer.exe
		if (!DesinfectFile(temp)) {				// ako je uspeÑno dezinfikovan
			WritePrivateProfileString("Rename", explorer, temp, wininit);   // napravi 'wininit.ini' :)
			SmallSay("[CLEANED] system. Reboot and Run anti-virus again!");
			scanning=FALSE;
			return 0;
		} else {
			SmallSay("[Error] can't desinfect!");
			DeleteFile(temp);				// a ako nije obriÑi kopirani fajl
		}
	} else SmallSay("System kernel is clean.");


	// FAZA #2
	SmallSay("------------------------------------------------------------");
	SmallSay("Phase #2: scanning all fixed drives.");

	// Prvo naîi samo fixne drajvove
	drives=GetDrives(DRIVE_FIXED);
	// priprema drajvova...
	root[0]='a';

	SmallSay("scanning...");
	/* Pretraga */
	while (drives) {
		if (!scanning) break;
		deep=0;
		if (drives & 1) DesinfectFolder(root);
		drives=drives>>1;
		root[0]++;
	}

	// Kraj, statistika
	SmallSayReplace("------------------------------------------------------------");
	wsprintf(temp, "Total scanned: %u files.", totalfiles);
	SmallSay(temp);
	wsprintf(temp, "Total infected: %u files.", totalinfected);
	SmallSay(temp);
	// ako ima zaraÇenih
	if (totalinfected) {
		wsprintf(temp, "Total cleaned: %u files.", totalcleaned);
		SmallSay(temp);
	}
	// ako ima greÑaka
	deep=totalinfected - totalcleaned;
	if (deep) {
		wsprintf(temp, "No. of errors: %u files.", deep);
		SmallSay(temp);
	}

	SmallSay("Done.");
	scanning=FALSE;
	return 0;
}
