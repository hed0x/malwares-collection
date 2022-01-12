/***[ThuNderSoft]*************************************************************
								KUANG2: request
								   ver: 0.10
								úùÄÍ WEIRD ÍÄùú
*****************************************************************************/

/* HISTORY */
// ver 0.10 (28-apr-1999): born code

#include <windows.h>
#include <winsock.h>
#include "kuang2.h"

// Kod velikih servera Request lista bi trebalo da se dobija dinamiki, tj.
// da se memorija odvaja pri svakom dodavanju. Po„to ovo nije veliki server
// ve† mali, Request lista se mo‚e i ovako napraviti.
REQUEST request[MAXCONN];

/*
	ClearRequests
	-------------
  ş Bri„e celu request listu. */

void ClearRequests(void)
{
	int i;

	for (i=0; i<MAXCONN; i++) request[i].socket=-1;

	return;
}


/*
	NewRequest
	----------
  ş Pretrazuje Request listu za slobodnim mestom i vra†a njegov index.
  ş Vra†a -2 ako nema slobonih mesta. */

int NewRequest(void)
{
	unsigned int i;

	for (i=0; i<MAXCONN; i++)
		if (request[i].socket==-1) return i;

	return NOMOREREQUEST;
}

/*
	GetRequest
	----------
  ş Pretrazuje Request listu i vra†a index kada se poklope socketi.
  ş Vra†a -3 ako nema slobonih mesta. */

int GetRequest(SOCKET s)
{
	unsigned int i;

	for (i=0; i<MAXCONN; i++)
		if (request[i].socket==s) return i;

	return BADREQUEST;
}
