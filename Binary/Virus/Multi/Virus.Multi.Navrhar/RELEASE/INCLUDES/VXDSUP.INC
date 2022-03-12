VMM_DEVICE_ID = 1h
IFSMgr_Device_Id = 40h

@@_HeapAllocate   = 1004fh
@@_CreateMutex    = 10101h
@@_EnterMutex     = 1012eh
@@_LeaveMutex     = 1012fh
@@_strupr         = 1018fh
@@_lstrlen        = 1017ch

; IFSMgr
@@IFSMgr_InstallFileSystemApiHook = 400067h
@@IFSMgr_Ring0_FileIO = 400032h
@@UniToBCSPath = 400041h

; Values for charSet passed to character conversion routines
BCS_WANSI	equ	0	; use Windows ANSI set
BCS_OEM	equ	1	; use current OEM character set
BCS_UNI	equ	2	; use UNICODE character set


R0_OPENCREATFILE        equ 0D500h  ; Open/Create a file
R0_OPENCREAT_IN_CONTEXT equ 0D501h  ; Open/Create file in current context
R0_READFILE             equ 0D600h  ; Read a file, no context
R0_WRITEFILE            equ 0D601h  ; Write to a file, no context
R0_READFILE_IN_CONTEXT  equ 0D602h  ; Read a file, in thread context
R0_WRITEFILE_IN_CONTEXT equ 0D603h  ; Write to a file, in thread context
R0_CLOSEFILE            equ 0D700h  ; Close a file
R0_GETFILESIZE          equ 0D800h  ; Get size of a file
R0_FINDFIRSTFILE        equ 04E00h  ; Do a LFN FindFirst operation
R0_FINDNEXTFILE         equ 04F00h  ; Do a LFN FindNext operation
R0_FINDCLOSEFILE        equ 0DC00h  ; Do a LFN FindClose operation
R0_FILEATTRIBUTES       equ 04300h  ; Get/Set Attributes of a file
R0_RENAMEFILE           equ 05600h  ; Rename a file
R0_DELETEFILE           equ 04100h  ; Delete a file
R0_LOCKFILE             equ 05C00h  ; Lock/Unlock a region in a file
R0_GETDISKFREESPACE     equ 03600h  ; Get disk free space
R0_READABSOLUTEDISK     equ 0DD00h  ; Absolute disk read
R0_WRITEABSOLUTEDISK    equ 0DE00h  ; Absolute disk write

IFSFN_READ              equ     0               ; read a file
IFSFN_WRITE             equ     1               ; write a file
IFSFN_FINDNEXT          equ     2               ; LFN handle based Find Next
IFSFN_FCNNEXT           equ     3               ; Find Next Change Notify

IFSFN_SEEK              equ     10              ; Seek file handle
IFSFN_CLOSE             equ     11              ; close handle
IFSFN_COMMIT            equ     12              ; commit buffered data for handle
IFSFN_FILELOCKS         equ     13              ; lock/unlock byte range
IFSFN_FILETIMES         equ     14              ; get/set file modification time
IFSFN_PIPEREQUEST       equ     15              ; named pipe operations
IFSFN_HANDLEINFO        equ     16              ; get/set file information
IFSFN_ENUMHANDLE        equ     17              ; enum file handle information
IFSFN_FINDCLOSE         equ     18              ; LFN find close
IFSFN_FCNCLOSE          equ     19              ; Find Change Notify Close

IFSFN_CONNECT           equ     30              ; connect or mount a resource
IFSFN_DELETE            equ     31              ; file delete
IFSFN_DIR               equ     32              ; directory manipulation
IFSFN_FILEATTRIB        equ     33              ; DOS file attribute manipulation
IFSFN_FLUSH             equ     34              ; flush volume
IFSFN_GETDISKINFO       equ     35              ; query volume free space
IFSFN_OPEN              equ     36              ; open file
IFSFN_RENAME            equ     37              ; rename path
IFSFN_SEARCH            equ     38              ; search for names
IFSFN_QUERY             equ     39              ; query resource info (network only)
IFSFN_DISCONNECT        equ     40              ; disconnect from resource (net only)
IFSFN_UNCPIPEREQ        equ     41              ; UNC path based named pipe operations
IFSFN_IOCTL16DRIVE      equ     42              ; drive based 16 bit IOCTL requests
IFSFN_GETDISKPARMS      equ     43              ; get DPB
IFSFN_FINDOPEN          equ     44              ; open  an LFN file search
IFSFN_DASDIO            equ     45              ; direct volume access


ubuffer_t	equ	<dd>
pos_t		equ	<dd>
uid_t		equ	<db>
sfn_t		equ	<dw>
$F			equ	<dd>



	path_t		equ	<dd>
	string_t	equ	<dd>
	pid_t		equ	<dd>
	rh_t		equ	<dd>
	fh_t		equ	<dd>
	vfunc_t		equ	<dd>
	$P			equ	<dd>
	$I			equ	<dd>
	fsdwork struc
		dd	16 dup (?)
	fsdwork ends



PathElement 	struc
	pe_length dw ?
	pe_unichars dw 1 dup (?)
PathElement	ends

ParsedPath 	struc
	pp_totalLength dw ?
	pp_prefixLength dw ?
	pp_elements	db  (1*size PathElement) dup (?)
ParsedPath	ends



;typedef struct event event, *pevent;

ioreq 	struc
	% ir_length $I ?	; length of user buffer (eCX)
	ir_flags db ?	; misc. status flags (AL)
% ir_user uid_t ?	; user ID for this request
% ir_sfn sfn_t ?		; System File Number of file handle
% ir_pid pid_t ?		; process ID of requesting task
% ir_ppath path_t ?	; unicode pathname
	ir_aux1 dd ?	; secondary user data buffer (CurDTA)
% ir_data ubuffer_t ?	; ptr to user data buffer (DS:eDX)
	ir_options dw ?	; request handling options
	ir_error dw ?	; error code (0 if OK)
% ir_rh rh_t ?		; resource handle
% ir_fh fh_t ?		; file (or find) handle
% ir_pos pos_t ?		; file position for request
	ir_aux2 dd ?	; misc. extra API parameters
	ir_aux3 dd ?	; misc. extra API parameters
	% ir_pev $P ?		; ptr to IFSMgr event for async requests
	ir_fsd db (size fsdwork) dup (?);		; Provider work space
ioreq	ends


; misc. fields overlayed with other ioreq members:

ir_size	equ	ir_pos
ir_conflags	equ	ir_pos		; flags for connect
ir_attr2	equ	ir_pos		; destination attributes for Rename
ir_attr	equ	ir_length	; DOS file attribute info
ir_pathSkip	equ	ir_length	; # of path elements consumed by Connect
ir_lananum	equ	ir_sfn		; LanA to Connect on (0xFF for any net)
ir_tuna	equ	ir_sfn		; Mount: FSD authorises IFSMGR tunneling
ir_ptuninfo	equ	ir_data		; Rename/Create: advisory tunneling info ptr


; Fields overlayed with ir_options:

ir_namelen	equ	ir_options
ir_sectors	equ	ir_options	; sectors per cluster
ir_status	equ	ir_options	; named pipe status


; Fields overlayed with ir_aux1:

ir_data2	equ	<ir_aux1.aux_buf>	; secondary data buffer
ir_vfunc	equ	<ir_aux1.aux_vf>	; volume function vector
ir_hfunc	equ	<ir_aux1.aux_hf>	; file handle function vector
ir_ppath2	equ	<ir_aux1.aux_pp>	; second pathname for Rename
ir_volh	equ	<ir_aux1.aux_ul>	; VRP address for Mount


; Fields overlayed with ir_aux2:

ir_numfree	equ	<ir_aux2.aux_ul>	; number of free clusters
ir_locklen	equ	<ir_aux2.aux_ul>	; length of lock region
ir_msglen	equ	<ir_aux2.aux_ui>	; length of current message (peek pipe)
									; next msg length for mailslots
ir_dostime	equ	<ir_aux2.aux_dt>	; DOS file date & time stamp
ir_timeout	equ	<ir_aux2.aux_ul>	; timeout value in milliseconds
ir_password	equ	<ir_aux2.aux_ptr>	; password for Connect
ir_drvh	equ	<ir_aux2.aux_ptr>	; drive handle for Mount
ir_prtlen	equ	<ir_aux2.aux_dt.dt_time>	; length of printer setup string
ir_prtflag	equ	<ir_aux2.aux_dt.dt_date>	; printer flags
ir_firstclus	equ	<ir_aux2.aux_ui>	; First cluster of file
ir_mntdrv	equ	<ir_aux2.aux_ul>	; driveletter for Mount
ir_cregptr	equ	<ir_aux2.aux_ptr>	; pointer to client registers
ir_uFName	equ	<ir_aux2.aux_str>	; case preserved filename

; Fields overlayed with ir_aux3:

ir_upath	equ	<ir_aux3.aux_str>	; pointer to unparsed pathname
ir_scratch	equ	<ir_aux3.aux_ptr>	; scratch buffer for NetFunction calls

; Fields overlayed with ir_user:

ir_drivenum	equ	ir_user		; Logical drive # (when mounting)




??_align    =   0
DYNA_LINK_INT = 20h

?marg   macro   name, num
    .xcref
    .xcref  ?AM&num
    .cref
    ?AM&num &macro
        push    name
        ??_pushed = ??_pushed + 4
        &endm
    endm
    .xcref  ?marg



?invprg macro   name1, name2
    name1&name2
    purge   name1&name2
    endm
    .xcref  ?invprg


GenDD2 MACRO vt, sn, jf
    dd  OFFSET vt[sn+jf]
ENDM

GenDD   MACRO   P, vid, snum, jflag
    LOCAL   vtable
    dd  @@&P+jflag

ENDM



PushCParams macro arglst, flags
    ??_argc = 0
IFDEF   NONSTANDARD_CCALL
    ??_popargs = 0
ELSE
    ??_popargs = ??_align EQ 0
ENDIF
    ifidni  <flags>, <SMALL>
        ??_popargs = 1
    elseifidni <flags>, <FAST>
        ??_popargs = 0
    endif

    irp x,<arglst>
        ??_argc = ??_argc + 1
        ?marg   <x>,%??_argc
    endm
    ?count = ??_argc
    rept    ??_argc
        ?invprg <?AM>,%?count
        ?count = ?count - 1
    endm
    endm


ClearCParams macro fPreserveFlags
	if	??_argc ne 0
	    if (??_popargs) AND (??_argc LE 2)
	      rept ??_argc
		pop	ecx
	      endm
	    else
	      ifidni <fPreserveFlags>, <PRESERVE_FLAGS>
		lea	esp, [esp][??_argc * 4]
	      else
		add	esp,??_argc * 4
	      endif
	    endif
	endif
	??_pushed = ??_pushed - (??_argc * 4)
	endm

;VxDCall     macro service
;            int   20h
;            dd    service
;            endm

VxDCall MACRO P, Param, flags
    ??_vxdid = (@@&P SHR 16)
    ??_servicenum = (@@&P AND 0FFFFh)
    ifdef ??_nonstandardccall_&P
    PushCParams <Param>, <FAST>
    else
    PushCParams <Param>, <flags>
    endif
    int Dyna_Link_Int
    GenDD   P, %??_vxdid, %??_servicenum, 0
    ifdef ??_nonstandardccall_&P
	ClearCParams PRESERVE_FLAGS
    else
	ClearCParams
    endif
    ENDM


VMMCall MACRO P, Param
    .ERRNZ (@@&P SHR 16) - VMM_DEVICE_ID
    VxDCall <P>, <Param>
    ENDM


;VMMCall     macro service
;            VxDCall 10000h*VMM_Device_Id + service
;            endm


offset32    equ offset

BeginProc   macro name
name        proc
            endm

EndProc     macro name
name        endp
            endm
