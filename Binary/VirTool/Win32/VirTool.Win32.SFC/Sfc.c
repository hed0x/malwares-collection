//
// Sfc check
//
// A stupid but useful program to check if a file is protected
// by System File Protection
//
// Tested under Windows 2000 Professional Build 2128
//
// GriYo / 29A
//

#include "stdio.h"
#include <windows.h>
#include <sfc.h>

int main( int argc, char* argv[])
{
	OSVERSIONINFO		VersionInformation ;
	HMODULE				hSFC ;
	FARPROC				a_SfcIsFileProtected ;
	FARPROC				a_SfcGetNextProtectedFile ;
	WCHAR				wszFileName[ MAX_PATH] ;
	PROTECTED_FILE_DATA pfd ;

	printf( "Sfp check by GriYo / 29A\n\n") ;

	if ( argc > 2)
	{
		printf( "Usage:\n\n" 
				"%s             <--- List protected files\n\n" 
				"or\n\n" 
				"%s /f:filename <--- Check if file is protected\n\n", argv[ 0], argv[ 0]) ;

		return -1 ;
	}

	VersionInformation.dwOSVersionInfoSize = sizeof( OSVERSIONINFO) ;

	if ( GetVersionEx( &VersionInformation) == 0)
	{
		printf( "Error: Api GetVersionEx() failed\n\n", argv[ 0]) ;
		return -1 ;
	}

	if (	( VersionInformation.dwPlatformId != VER_PLATFORM_WIN32_NT) ||
			( VersionInformation.dwMajorVersion != 5))
	{
		printf( "Error: This program only runs under Windows 2000\n\n") ;
		return -1 ;
	}

	if ( ( hSFC = LoadLibrary( "SFC.DLL")) == NULL)
	{
		printf( "Error: SFC.DLL not found\n\n", argv[ 0]) ;
		return -1 ;
	}

	if ( argc == 2)
	{
		//
		//		SfcIsFileProtected
		//
		//		[This is preliminary documentation and subject to change.] 
		//
		//		The SfcIsFileProtected function determines whether the specified 
		//		file is protected. Applications should avoid replacing protected 
		//		system files. 
		//
		//				BOOL WINAPI SfcIsFileProtected( IN HANDLE RpcHandle, // must be NULL
		//												IN LPCWSTR ProtFileName) ;
		//
		//		Parameters:
		//
		//				ProtFileName 
		//
		//				[in] Pointer to a string that specifies the name of the 
		//				file. 
		//
		//		Return Value:
		//
		//				If the file is protected, the return value is a nonzero 
		//				value.
		//
		//				If the file is not protected, the return value is zero.
		//
		//		Requirements :
		//
		//				Windows NT/2000:	Requires Windows 2000.
		//				Windows 95/98:		Unsupported.
		//				Windows CE:			Unsupported.
		//				Header:				Declared in sfc.h.
		//				Import Library:		Use sfc.lib.
		//
		//		See Also:
		//
		//				SfcGetNextProtectedFile 
		//

		if ( ( a_SfcIsFileProtected = GetProcAddress( hSFC, "SfcIsFileProtected")) == NULL)
		{
			FreeLibrary( hSFC) ;
			printf( "Error: Api SfcIsFileProtected not found\n\n", argv[ 0]) ;
			return -1 ;
		}

		MultiByteToWideChar(CP_ACP, 0, argv[ 1], -1, wszFileName, MAX_PATH) ;

		if ( a_SfcIsFileProtected( NULL, wszFileName)) printf( "Protected file\n\n") ;
		else printf( "Unprotected file\n\n") ;
	}
	else
	{
		//
		//		SfcGetNextProtectedFile
		//
		//		[This is preliminary documentation and subject to change.] 
		//
		//		The SfcGetNextProtectedFile function retrieves the complete list of protected 
		//		files. Applications should avoid replacing these files. 
		//
		//				BOOL WINAPI SfcGetNextProtectedFile( IN HANDLE RpcHandle, // must be NULL
		//													 IN PPROTECTED_FILE_DATA ProtFileData) ;
		//
		//		Parameters:
		//
		//				ProtFileData [in/out] Receives the list of protected files. The format 
		//				of this structure is as follows:
		//
		//				typedef struct _PROTECTED_FILE_DATA {
		//						WCHAR   FileName[ MAX_PATH] ;
		//						DWORD   FileNumber ;
		//				} PROTECTED_FILE_DATA, *PPROTECTED_FILE_DATA ;
		//
		//				Before calling this function the first time, set the FileNumber 
		//				member to zero. 
		//
		//		Return Value:
		//
		//				If the function succeeds, the return value is nonzero. 
		//
		//				If there are no more protected files to enumerate, the return value 
		//				is zero. 
		//
		//		Requirements:
		//
		//				Windows NT/2000:	Requires Windows 2000.
		//				Windows 95/98:		Unsupported.
		//				Windows CE:			Unsupported.
		//				Header:				Declared in sfc.h.
		//				Import Library:		Use sfc.lib.
		//
		//		See Also:
		//
		//				SfcIsFileProtected 
		//

		if ( ( a_SfcGetNextProtectedFile = GetProcAddress( hSFC, "SfcGetNextProtectedFile")) == NULL)
		{
			FreeLibrary( hSFC) ;
			printf( "Error: Api SfcGetNextProtectedFile not found\n\n", argv[ 0]) ;
			return -1 ;
		}

		printf( "List of protected files:\n\n") ;

		pfd.FileNumber = 0 ;

		while( SfcGetNextProtectedFile( NULL, &pfd) != 0)
		{
			printf( "%ws\n", &pfd.FileName) ;
		}
	}

	FreeLibrary( hSFC) ;
	return 0;
}