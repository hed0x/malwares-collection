.data
	align 4

MDSTRUCTURE	struct
	dwSumA	dd	?
	dwSumB	dd	?
	dwSumC	dd	?
	dwSumD	dd	?
	dwSumE	dd	?
MDSTRUCTURE	ends

RMDValues	dd	0
		dd	0
		dd	0
		dd	0
		dd	0

esi_			dd	0
edi_			dd	0
ebp_			dd	0

szCharSet	db	"abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", NULL
szCharEnd	equ	$-1

MinLen	dd	1
MaxLen	dd	12

hCharSet	dd	offset szCharSet
hCharEnd	dd	szCharEnd

LenOrder	dd	LOWDW
ByteOrder	dd	LITTLE_ENDIAN

szAlgorithm		dd	offset szMD5
AuditRoutine	dd	offset Audit128
hAlgorithm		dd	offset MD5
HashLen		dd	ONE_TWENTY_EIGHT_BITS
hMessage		dd	0
szFile		dd	0
hFound		dd	0
hInfo			dd	0
Dictionary		dd	0
;--------------------------------------------------------------------
szUsage	db	CRLF,TAB,TAB,"Calypzo V 0.2 - bcom@hushmail.com",CRLF
		db	CRLF,"Usage: %s [OPTIONS] -set <CHARS> <HASH> -wrd <FILE>"
		db	CRLF,"-alg :  0 - 4"
		db	CRLF,TAB,"0 - MD4"
		db	CRLF,TAB,"1 - MD5"
		db	CRLF,TAB,"2 - RIPEMD-128"
		db	CRLF,TAB,"3 - RIPEMD-160"
		db	CRLF,TAB,"4 - SHA-1"
		db	CRLF,"-min : Minimum length of pass"
		db	CRLF,"-max : Maximum length"
		db	CRLF,"-set : Custom character set"
		db	CRLF,"-wrd : Read words from <FILE> (Dictionary Attack)"
		db	CRLF,"<HASH> should be 128/160-bit message digest",CRLF
		db	CRLF,"Thanks to Greenant for code - http://greenant.cjb.net/",CRLF,NULL

szInfo	db	CRLF,TAB,"Calypzo V 0.2 - bcom@hushmail.com",CRLF
		db	CRLF,"Auditing hash: %s"
		db	CRLF,"Using %s algorithm"
		db	CRLF,"Minimum Length: %d"
		db	CRLF,"Maximum Length: %d"
		db	CRLF,"Using character set: %s", CRLF,NULL

szFound	db	CRLF,"Found password: %s", 0

pAlgTable	dd	offset MD4
		dd	offset MD5
		dd	offset RIPEMD128
		dd	offset RIPEMD160
		dd	offset SHA1

pSetOptions	dd	offset @endget
		dd	offset @endget
		dd	offset @endget
		dd	offset @setoptions
		dd	offset @setsha1

AsciiTable	dd	offset szMD4
		dd	offset szMD5
		dd	offset szRIPEMD128
		dd	offset szRIPEMD160
		dd	offset szSHA1

szMD4		db	'MD4', 		NULL
szMD5		db	'MD5',		NULL
szRIPEMD128	db	'RIPEMD-128',	NULL
szRIPEMD160	db	'RIPEMD-160',	NULL
szSHA1	db	'SHA-1',		NULL

Passwd	MDSTRUCTURE	<0>

pRoutines	dd	offset tolower
		dd	offset toupper
		dd	offset @dummy

.data?
	align 4
StartTime		dd	?
hBuffers		dd	?
printf		dd	?
hCmdLine		dd	?

