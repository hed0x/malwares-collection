
SYNCHRONIZE                     equ	        00100000h

MB_OK                   	equ 		0
MB_OKCANCEL             	equ 		1
MB_ABORTRETRYIGNORE             equ 		2
MB_YESNOCANCEL          	equ 		3
MB_YESNO                	equ 		4
MB_RETRYCANCEL          	equ 		5

FILE_BEGIN           		equ		0
FILE_CURRENT         		equ		1
FILE_END             		equ		2

OF_READWRITE   			equ 		00000002h

GMEM_FIXED			EQU		000000000h
GMEM_MOVEABLE			EQU		000000002h
GMEM_ZEROINIT			EQU		000000040h
GMEM_MODIFY			EQU		000000080h
GMEM_SHARE			EQU		000002000h
GMEM_DDESHARE			EQU		000002000h
GMEM_NOTIFY			EQU		000004000h
GMEM_INVALID_HANDLE		EQU		000008000h

CREATE_NEW			EQU		00000001h
CREATE_ALWAYS			EQU		00000002h
OPEN_EXISTING			EQU		00000003h
OPEN_ALWAYS			EQU		00000004h
TRUNCATE_EXISTING		EQU		00000005h

STD_OUTPUT_HANDLE		equ		-11
STD_INPUT_HANDLE    		equ		-10

FILE_SHARE_READ                 equ 		00000001h
FILE_SHARE_WRITE                equ 		00000002h  

GENERIC_READ                    equ 		80000000h
GENERIC_WRITE                   equ 		40000000h

FILE_ATTRIBUTE_READONLY         equ 		00000001h  
FILE_ATTRIBUTE_HIDDEN           equ 		00000002h  
FILE_ATTRIBUTE_SYSTEM           equ 		00000004h  
FILE_ATTRIBUTE_DIRECTORY        equ 		00000010h  
FILE_ATTRIBUTE_ARCHIVE          equ		00000020h  
FILE_ATTRIBUTE_NORMAL           equ 		00000080h  
FILE_ATTRIBUTE_TEMPORARY        equ 		00000100h  
FILE_ATTRIBUTE_COMPRESSED       equ 		00000800h  
FILE_ATTRIBUTE_OFFLINE          equ 		00001000h  

DRIVE_UNKNOWN     		equ		0
DRIVE_NO_ROOT_DIR 		equ		1
DRIVE_REMOVABLE   		equ		2
DRIVE_FIXED       		equ		3
DRIVE_REMOTE      		equ		4
DRIVE_CDROM       		equ		5
DRIVE_RAMDISK     		equ		6

f_struc                		struc

				ff_attr                 dd      ?
				ff_time_create          dd      ?,?
				ff_time_lastaccess      dd      ?,?
				ff_time_lastwrite       dd      ?,?
				ff_size_high            dd      ?
				ff_size                 dd      ?
		         	                	dd      ?,?
				ff_fullname             db      260 dup (?)
				ff_shortname            db      14 dup (?)

                       		ends

FILETIME			struc
				ft_LowDateTime		dd	?
				ft_HighDateTime		dd	?
FILETIME			ends

SYSTEMTIME 			struc
     				st_Year		        dw	?
    				st_Month		dw	?
				st_DayOfWeek		dw	?
				st_Day			dw	?
				st_Hour			dw	?
				st_Minute		dw	?
				st_Second		dw	?
    				st_Milliseconds		dw	?
		                ends

