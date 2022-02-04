// Single-threaded multiconnect SOCKS4 proxy. 
// (c) CNerd, hangupteam

#include "stdafx.h"

#define PORT 2026

LRESULT CALLBACK WndProc(HWND hwnd, UINT iMsg,
                         WPARAM wParam, LPARAM lParam);


SOCKET as[60],cs[60]; // accepted sockets, proxy client sockets arrays
SOCKET sw;            // основной сокет
SOCKADDR_IN sa,st;
int q,r;
WSAEVENT he[3];
char *b1;

DWORD WINAPI proxy(HINSTANCE hInst)
{
	HWND hwnd;            // хэндл созданного окна
	WNDCLASS wc;
	ZeroMemory(&wc, sizeof(wc));
	wc.lpfnWndProc=(WNDPROC)WndProc;
	wc.hInstance=hInst;
	wc.lpszClassName="uyguy";
	RegisterClass(&wc);
	hwnd=CreateWindow("uyguy", "", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, 
		CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, hInst, NULL);
	if(!hwnd)
		return 0;

	WSADATA wd;
	WSAStartup(0x101, &wd);
	sw=socket(AF_INET, SOCK_STREAM, 0); //(AF_INET,SOCK_STREAM,PF_UNSPEC); // создаем сокет
	st.sin_family      = AF_INET;
	st.sin_addr.s_addr = INADDR_ANY;
	st.sin_port        = htons(PORT); // порт проксика
	
	memset(as, 0, sizeof(as));
	memset(cs, 0, sizeof(as));
	bind(sw,(const struct sockaddr*)&st,sizeof(st));
	listen(sw,60);
	b1=(char*)valloc(65536);
	
	WSAAsyncSelect(sw,hwnd,20000,FD_ACCEPT);  // назначаем обработчик
	// показ окна
	ShowWindow(hwnd, SW_HIDE);
	UpdateWindow(hwnd);
	// цикл сообщений
	MSG msg;
	while(GetMessage(&msg, NULL, 0,0)) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	return msg.wParam;
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT iMsg,
                         WPARAM wParam, LPARAM lParam)
{	
	switch(iMsg){
	case 20000:
		// соединились с основным сокетом
		if (LOWORD(lParam) == FD_ACCEPT)
		{
			q=sizeof(sa);
			r=accept(wParam,(struct sockaddr*)&sa,&q); // получаем подтвержденный сокет
//			as[(r-wParam)/4-1]=r;                      // заносим его в массив
			for (q=0;q<60;q++) 
				if (as[q] == 0) {
					as[q]=r;
					break; 
				}
			WSAAsyncSelect(r,hwnd,20001,FD_READ|FD_CLOSE); // обработчик чтения и закрытия
		}
		return 0;

	case 20001:
		lParam=LOWORD(lParam);
		for (r=0;r<60;r++)
			if (as[r] == wParam)
				break; // определяем номер сокета

		/* Чтение из сокета */
		if (lParam == FD_READ) {
			q=recv(as[r],b1,65535,0);  // собственно читаем
			// Это запрос серверу на соединение с удаленным хостом?
			if ((b1[0] == 4) && (b1[1] == 1)) {
				closesocket(cs[r]);
				cs[r]=socket(AF_INET,SOCK_STREAM,AF_UNSPEC); // создаем клиентный сокет
				sa.sin_family=AF_INET;                       // с таким же номером
				// выковыриваем IP
				sa.sin_addr.s_addr=MAKELONG(MAKEWORD(b1[4],b1[5]),MAKEWORD(b1[6],b1[7]));
				sa.sin_port=htons(b1[3]+b1[2]*256); // и порт
				WSAAsyncSelect(cs[r],hwnd,20002,FD_READ|FD_CLOSE|FD_CONNECT);
				connect(cs[r],(const struct sockaddr*)&sa,sizeof(sa));
			}
			else
				send(cs[r],b1,q,0); // иначе - передача данных в клиентный сокет
		}

		/* Закрытие подтвержденного сокета */
		if (lParam == FD_CLOSE){
			as[r]=0; 
			closesocket(cs[r]); // мочим соотв. клиентный сокет
		}
		return 0;

	case 20002:
		int i = HIWORD(lParam); // код ошибки
		lParam=LOWORD(lParam);
		for (r=0;r<60;r++)
			if (cs[r] == wParam)
				break;
		/* Успешно соединились с удаленным хостом! - рапортуем */
		if (lParam == FD_CONNECT){
			if(i!=0){
			    closesocket(cs[r]);
				cs[r]=0;
				closesocket(as[r]);
				as[r]=0;
			}
			else
				send(as[r],"\0\132\0\0\0\0\0\0",8,0); // oct132=dec90=hex5A
		}

		/* Передача данных в подтвержденный сокет as[r] */
		if (lParam == FD_READ) {
			q=recv(cs[r],b1,65535,0);
			send(as[r],b1,q,0);
		}

		/* Отвалился клиентный сокет, обламываемся */

		if (lParam == FD_CLOSE){
			closesocket(as[r]); // закрываем подтвержденный
			as[r]=0;
		}

		return 0;

	}
	return DefWindowProc(hwnd, iMsg, wParam, lParam);	
}
