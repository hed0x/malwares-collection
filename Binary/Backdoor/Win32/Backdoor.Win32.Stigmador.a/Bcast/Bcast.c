#include <Windows.h>
#include <stdio.h>

#include "..\Headers.h"
#include "..\Blowfish\Blowfish.h"
#include "..\RMD160\RMD160.h"

int main( int argc, char **argv)
{
	int				Size ;
	int				IpSize ;
	int				TotalBcast ;
	int				SizeOfFile ;

	unsigned long	BytesWritten ;

	unsigned char	*Ptr2RMD160 ;

	HANDLE			hFile ;
	HANDLE			hMap ;

	char			*pMem ;
	char			*Pos ;
	char			*Begin ;

	BLOWFISH_CTX	ctx ;

	char			szIp[ 32] ;
	//DWORD			Bcast[ NUMBEROF_BROADCAST_ADDR] ;

	WSADATA			wsa ;

	STIGMA_BROADCAST_FILE StigmaBroadcastFile ;

	memset( &StigmaBroadcastFile, 0, sizeof( STIGMA_BROADCAST_FILE)) ;

	printf( "Bcast.exe\n"
			"Nmap to Stigma file converter\n"
			"Coded by GriYo [29A]\n\n") ;

	if( argc != 3)
	{
		printf( "Usage: bcast <nmapfile> <outputfile>\n\n") ;
		return 0 ;
	}

	if( WSAStartup( 0x0202, &wsa) != 0)
	{
		printf( "Cant initialize Windows Sockets 2.2\n\n") ;
		return 0 ;
	}

	Blowfish_Init( &ctx, STIGMA_PASSWORD, sizeof( STIGMA_PASSWORD) - 1) ;

	hFile = CreateFile(	argv[ 1],
						GENERIC_READ,
						FILE_SHARE_READ,
						NULL,
						OPEN_EXISTING,
						FILE_ATTRIBUTE_NORMAL,
						NULL) ;

	if( hFile == INVALID_HANDLE_VALUE)
	{
		printf( "Error: Cant open nmap file\n\n") ;
		return 0 ;
	}

	Size = GetFileSize( hFile, NULL) ;

	if( Size == 0)
	{
		printf( "Error: Nmap file have invalid size\n\n") ;
		return 0 ;
	}

	TotalBcast = 0 ;

	hMap = CreateFileMapping(	hFile,
								NULL,
								PAGE_READONLY,
								0,
								0,
								NULL) ;

	if( hMap == NULL)
	{
		printf( "Error: Cant create file mapping\n\n") ;
	}
	else
	{
		pMem = MapViewOfFile(	hMap,
								FILE_MAP_READ,
								0,
								0,
								0) ;

		if( pMem == NULL)
		{
			printf( "Error: Cant map view of file\n\n") ;
		}
		else
		{
			Pos = pMem ;
			Begin = NULL ;
			IpSize = 0 ;

			while( Size > 0)
			{
				if( *Pos == '(')
				{
					Pos++ ;
					Size-- ;

					if( ( *Pos >= '0') && ( *Pos <= '9')) Begin = Pos ;
				}
				else if( *Pos == ')')
				{
					if( Begin != NULL)
					{
						memcpy( szIp, Begin, IpSize) ;

						szIp[ IpSize] = ( char) NULL ;

						StigmaBroadcastFile.Broadcast[ TotalBcast] = inet_addr( szIp) ;
						TotalBcast++ ;

						printf( "* Added: %s\n", szIp) ;

						Begin = NULL ;
						IpSize = 0 ;

						Pos++ ;
						Size-- ;
					}
				}

				Pos++ ;
				Size-- ;

				if( Begin != NULL) IpSize++ ;
			}

			UnmapViewOfFile( pMem) ;
		}

		CloseHandle( hMap) ;
	}

	CloseHandle( hFile) ;

	if( TotalBcast > 0)
	{
		printf( "Total broadcast addresses: %d\n\n"
				"Creating Stigma file...\n", 
				StigmaBroadcastFile.NumberOfEntries) ;

		hFile = CreateFile(	argv[ 2],
							GENERIC_READ|GENERIC_WRITE,
							FILE_SHARE_READ,
							NULL,
							CREATE_ALWAYS,
							FILE_ATTRIBUTE_NORMAL,
							NULL) ;

		if( hFile == INVALID_HANDLE_VALUE)
		{
			printf( "Error: Cant create Stigma file\n") ;
		}
		else
		{
			StigmaBroadcastFile.NumberOfEntries = TotalBcast ;

			Ptr2RMD160 = RMD( ( unsigned char *) StigmaBroadcastFile.Broadcast,
								sizeof( unsigned long) * TotalBcast) ;

			memcpy( StigmaBroadcastFile.RMD160, Ptr2RMD160, 20) ;

			SizeOfFile = sizeof( STIGMA_BROADCAST_FILE) - ( NUMBEROF_BROADCAST_ADDR - ( sizeof( unsigned long) * TotalBcast)) ;

			Blowfish_Encode(	&ctx, 
								( unsigned char *) &StigmaBroadcastFile, 
								SizeOfFile) ;

			if( !WriteFile(	hFile,
							( unsigned char *) &StigmaBroadcastFile,
							SizeOfFile,
							&BytesWritten,
							NULL))
			{
				printf( "Error: Cant write to Stigma file\n") ;
			}

			CloseHandle( hFile) ;
		}
	}

	WSACleanup() ;

	return 0 ;
}