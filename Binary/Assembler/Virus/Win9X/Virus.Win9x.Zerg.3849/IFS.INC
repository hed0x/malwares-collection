   IFSMgr_Device_ID        equ     000040h ; Installable File System Manager
   IFSMgr_Init_Order       equ     010000h + V86MMGR_Init_Order
   FSD_Init_Order          equ     000100h + IFSMgr_Init_Order


   ubuffer_t       equ     <dd>
   pos_t           equ     <dd>
   uid_t           equ     <db>
   sfn_t           equ     <dw>
   $F              equ     <dd>

   path_t          equ     <dd>
   string_t        equ     <dd>
   pid_t           equ     <dd>
   rh_t            equ     <dd>
   fh_t            equ     <dd>
   vfunc_t         equ     <dd>
   $P              equ     <dd>
   $I              equ     <dd>
   fsdwork struc
           dd      16 dup (?)
   fsdwork ends


   IFS_VERSION     equ     0030Ah
   IFS_REVISION    equ     010h


   ;*      Maximum path length - excluding nul
   MAX_PATH        equ     260     ; Maximum path length - including nul

   ; Maximum length for a LFN name element - excluding nul
   LFNMAXNAMELEN   equ     255


   MAXIMUM_USERID  equ     2       ; max. # of users that can be logged
                                           ; on at the same time.  Ir_user must
                                           ; always be less than MAXIMUM_USERID.
   NULL_USER_ID    equ     0       ; special user id for operations when
                                           ; not logged on.

   ; Status indications returned as errors:
   STATUS_PENDING  equ     -1      ; request is pending
   STATUS_RAWLOCK  equ     -2      ; rawlock active on session
                                           ; (only returned for async requests,
                                           ;  sync requests will wait for the raw
                                           ;  lock to be released)
   STATUS_BUSY     equ     -3      ; request can't be started because of
                                           ; serialization.

   ;*      ANYPROID - Any Provider ID
   ANYPROID        equ     -1


   ;*      Common function defintions for NetFunction
   NF_PROCEXIT             equ     0111Dh  ; Process Exit sent (ID = ANYPROID)
   NF_DRIVEUSE             equ     00001h  ; Drive Use Created (ID = ID of owner FSD)
   NF_DRIVEUNUSE           equ     00002h  ; Drive Use Broken (ID = ID of owner FSD)
   NF_GETPRINTJOBID        equ     00003h  ; Get Print Job ID
                                             ; ir_fh - ptr to master file info
                                             ; ir_data - ptr to data buffer
                                             ; ir_length - IN: buffer size
                                             ;             OUT: amount transfered
                                             ; ir_SFN - SFN of file handle
   NF_PRINTERUSE           equ     00004h  ; Printer Use Created (ID = ID of owner FSD)
   NF_PRINTERUNUSE         equ     00005h  ; Printer Use Broken (ID = ID of owner FSD)
   NF_NetSetUserName       equ     01181h

   ;* Flags passed to NetFunction
   WIN32_CALLFLAG          equ     004h    ; call is Win32 api


   ;* dos_time - DOS time & date format
   ;typedef struct dos_time dos_time;
   dos_time        struc
     dt_time       dw      ?
     dt_date       dw      ?
   dos_time        ends


   aux_data struc
     aux_dword     dd      ?
   aux_data ends
   aux_ul  equ     aux_dword
   aux_ui  equ     aux_dword
   aux_vf  equ     aux_dword
   aux_hf  equ     aux_dword
   aux_ptr equ     aux_dword
   aux_str equ     aux_dword
   aux_pp  equ     aux_dword
   aux_buf equ     aux_dword
   aux_dt  equ     aux_dword


   ioreq   struc
     % ir_length   $I      ?       ; length of user buffer (eCX)
     ir_flags      db      ?       ; misc. status flags (AL)
     % ir_user     uid_t   ?       ; user ID for this request
     % ir_sfn      sfn_t   ?       ; System File Number of file handle
     % ir_pid      pid_t   ?       ; process ID of requesting task
     % ir_ppath    path_t  ?       ; unicode pathname
     ir_aux1       dd      ?       ; secondary user data buffer (CurDTA)
     % ir_data   ubuffer_t ?       ; ptr to user data buffer (DS:eDX)
     ir_options    dw      ?       ; request handling options
     ir_error      dw      ?       ; error code (0 if OK)
     % ir_rh       rh_t    ?       ; resource handle
     % ir_fh       fh_t    ?       ; file (or find) handle
     % ir_pos      pos_t   ?       ; file position for request
     ir_aux2       dd      ?       ; misc. extra API parameters
     ir_aux3       dd      ?       ; misc. extra API parameters
     % ir_pev      $P      ?       ; ptr to IFSMgr event for async requests
     ir_fsd        db      (size fsdwork) dup (?)  ; Provider work space
   ioreq   ends


   ; misc. fields overlayed with other ioreq members:
   ir_size         equ     ir_pos
   ir_conflags     equ     ir_pos  ; flags for connect
   ir_attr2        equ     ir_pos  ; destination attributes for Rename
   ir_attr         equ     ir_length ; DOS file attribute info
   ir_pathSkip     equ     ir_length ; # of path elements consumed by Connect
   ir_lananum      equ     ir_sfn  ; LanA to Connect on (0xFF for any net)
   ir_tuna         equ     ir_sfn  ; Mount: FSD authorises IFSMGR tunneling
   ir_ptuninfo     equ     ir_data ; Rename/Create: advisory tunneling info ptr

   ; Fields overlayed with ir_options:
   ir_namelen      equ     ir_options
   ir_sectors      equ     ir_options      ; sectors per cluster
   ir_status       equ     ir_options      ; named pipe status

   ; Fields overlayed with ir_aux1:
   ir_data2        equ     <ir_aux1.aux_buf>       ; secondary data buffer
   ir_vfunc        equ     <ir_aux1.aux_vf>        ; volume function vector
   ir_hfunc        equ     <ir_aux1.aux_hf>        ; file handle function vector
   ir_ppath2       equ     <ir_aux1.aux_pp>        ; second pathname for Rename
   ir_volh         equ     <ir_aux1.aux_ul>        ; VRP address for Mount

   ; Fields overlayed with ir_aux2:
   ir_numfree      equ     <ir_aux2.aux_ul>        ; number of free clusters
   ir_locklen      equ     <ir_aux2.aux_ul>        ; length of lock region
   ir_msglen       equ     <ir_aux2.aux_ui>        ; length of current message (peek pipe)
                                                           ; next msg length for mailslots
   ir_dostime      equ     <ir_aux2.aux_dt>        ; DOS file date & time stamp
   ir_timeout      equ     <ir_aux2.aux_ul>        ; timeout value in milliseconds
   ir_password     equ     <ir_aux2.aux_ptr>       ; password for Connect
   ir_drvh         equ     <ir_aux2.aux_ptr>       ; drive handle for Mount
   ir_prtlen       equ     <ir_aux2.aux_dt.dt_time>; length of printer setup string
   ir_prtflag      equ     <ir_aux2.aux_dt.dt_date>; printer flags
   ir_firstclus    equ     <ir_aux2.aux_ui>        ; First cluster of file
   ir_mntdrv       equ     <ir_aux2.aux_ul>        ; driveletter for Mount
   ir_cregptr      equ     <ir_aux2.aux_ptr>       ; pointer to client registers
   ir_uFName       equ     <ir_aux2.aux_str>       ; case preserved filename

   ; Fields overlayed with ir_aux3:
   ir_upath        equ     <ir_aux3.aux_str>       ; pointer to unparsed pathname
   ir_scratch      equ     <ir_aux3.aux_ptr>       ; scratch buffer for NetFunction calls

   ; Fields overlayed with ir_user:
   ir_drivenum     equ     ir_user         ; Logical drive # (when mounting)


   ;* hndlfunc - I/O functions for file handles
   NUM_HNDLMISC    equ     8

   ;typedef struct hndlmisc hndlmisc;
   hndlfunc        struc
     % hf_read     $P      ?       ; file read handler function
     % hf_write    $P      ?       ; file write handler function
     % hf_misc     $P      ?       ; ptr to misc. function vector
   hndlfunc        ends

   hndlmisc        struc
     hm_version    dw      ?       ; IFS version #
     hm_revision   db      ?       ; IFS interface revision #
     hm_size       db      ?       ; # of entries in table
     % hm_func     $P      NUM_HNDLMISC dup (?)
   hndlmisc        ends

   HM_SEEK         equ     0       ; Seek file handle
   HM_CLOSE        equ     1       ; close handle
   HM_COMMIT       equ     2       ; commit buffered data for handle
   HM_FILELOCKS    equ     3       ; lock/unlock byte range
   HM_FILETIMES    equ     4       ; get/set file modification time
   HM_PIPEREQUEST  equ     5       ; named pipe operations
   HM_HANDLEINFO   equ     6       ; get/set file information
   HM_ENUMHANDLE   equ     7       ; enum filename from handle, lock info


   ;*      volfunc - volume based api fucntions
   NUM_VOLFUNC     equ     15

   volfunc         struc
     vfn_version   dw      ?       ; IFS version #
     vfn_revision  db      ?       ; IFS interface revision #
     vfn_size      db      ?       ; # of entries in table
     % vfn_func    $P      NUM_VOLFUNC dup (?)     ; volume base function handlers
   volfunc ends

   VFN_DELETE      equ     0               ; file delete
   VFN_DIR         equ     1               ; directory manipulation
   VFN_FILEATTRIB  equ     2               ; DOS file attribute manipulation
   VFN_FLUSH       equ     3               ; flush volume
   VFN_GETDISKINFO equ     4               ; query volume free space
   VFN_OPEN        equ     5               ; open file
   VFN_RENAME      equ     6               ; rename path
   VFN_SEARCH      equ     7               ; search for names
   VFN_QUERY       equ     8               ; query resource info (network only)
   VFN_DISCONNECT  equ     9               ; disconnect from resource (net only)
   VFN_UNCPIPEREQ  equ     10              ; UNC path based named pipe operations
   VFN_IOCTL16DRIVE equ    11              ; drive based 16 bit IOCTL requests
   VFN_GETDISKPARMS equ    12              ; get DPB
   VFN_FINDOPEN    equ     13              ; open  an LFN file search
   VFN_DASDIO      equ     14              ; direct volume access


   ;* IFS Function IDs passed to IFSMgr_CallProvider
   IFSFN_READ      equ     0               ; read a file
   IFSFN_WRITE     equ     1               ; write a file
   IFSFN_FINDNEXT  equ     2               ; LFN handle based Find Next
   IFSFN_FCNNEXT   equ     3               ; Find Next Change Notify
   IFSFN_SEEK      equ     10              ; Seek file handle
   IFSFN_CLOSE     equ     11              ; close handle
   IFSFN_COMMIT    equ     12              ; commit buffered data for handle
   IFSFN_FILELOCKS equ     13              ; lock/unlock byte range
   IFSFN_FILETIMES equ     14              ; get/set file modification time
   IFSFN_PIPEREQUEST equ   15              ; named pipe operations
   IFSFN_HANDLEINFO equ    16              ; get/set file information
   IFSFN_ENUMHANDLE equ    17              ; enum file handle information
   IFSFN_FINDCLOSE equ     18              ; LFN find close
   IFSFN_FCNCLOSE  equ     19              ; Find Change Notify Close
   IFSFN_CONNECT   equ     30              ; connect or mount a resource
   IFSFN_DELETE    equ     31              ; file delete
   IFSFN_DIR       equ     32              ; directory manipulation
   IFSFN_FILEATTRIB equ    33              ; DOS file attribute manipulation
   IFSFN_FLUSH     equ     34              ; flush volume
   IFSFN_GETDISKINFO equ   35              ; query volume free space
   IFSFN_OPEN      equ     36              ; open file
   IFSFN_RENAME    equ     37              ; rename path
   IFSFN_SEARCH    equ     38              ; search for names
   IFSFN_QUERY     equ     39              ; query resource info (network only)
   IFSFN_DISCONNECT equ    40              ; disconnect from resource (net only)
   IFSFN_UNCPIPEREQ equ    41              ; UNC path based named pipe operations
   IFSFN_IOCTL16DRIVE equ  42              ; drive based 16 bit IOCTL requests
   IFSFN_GETDISKPARMS equ  43              ; get DPB
   IFSFN_FINDOPEN  equ     44              ; open  an LFN file search
   IFSFN_DASDIO    equ     45              ; direct volume access


   ;*      Resource types passed in on the File Hook:
   IFSFH_RES_UNC           equ     001h    ; UNC resource
   IFSFH_RES_NETWORK       equ     008h    ; Network drive connection
   IFSFH_RES_LOCAL         equ     010h    ; Local drive
   IFSFH_RES_CFSD          equ     080h    ; Character FSD


   ;* values for ir_options to Connect:
   ; Note that only one of RESOPT_UNC_REQUEST, RESOPT_DEV_ATTACH, and
   ; RESOPT_UNC_CONNECT may be set at once.
   RESOPT_UNC_REQUEST      equ     001h    ; UNC-style path based request
   RESOPT_DEV_ATTACH       equ     002h    ; explicit redirection of a device
   RESOPT_UNC_CONNECT      equ     004h    ; explicit UNC-style use
   RESOPT_DISCONNECTED     equ     008h    ; Set up connection disconnected
                                                   ; (Don't touch net)
   RESOPT_NO_CREATE        equ     010h    ; don't create a new resource
   RESOPT_STATIC           equ     020h    ; don't allow ui to remove


   ;* values for ir_flags to Connect:
   RESTYPE_WILD    equ     0               ; wild card service type
   RESTYPE_DISK    equ     1               ; disk resource
   RESTYPE_SPOOL   equ     2               ; spooled printer
   RESTYPE_CHARDEV equ     3               ; character device
   RESTYPE_IPC     equ     4               ; interprocess communication
   FIRST_RESTYPE   equ     RESTYPE_DISK
   LAST_RESTYPE    equ     RESTYPE_IPC


   ;* values for ir_options to Close *
   RESOPT_NO_IO    equ     001h    ; no I/O allowed during the operation


   ;* values for ir_flags for FSD operations
   IR_FSD_MOUNT    equ     0               ; mount volume
   IR_FSD_DISMOUNT equ     1               ; dismount volume
   IR_FSD_VERIFY   equ     2               ; verify volume
   IR_FSD_UNLOAD   equ     3               ; unload volume
   IR_FSD_MOUNT_CHILD equ  4               ; mount child volume
   IR_FSD_MAP_DRIVE equ    5               ; change drive mapping
   IR_FSD_UNMAP_DRIVE equ  6               ; reset drive mapping


   ;* Value for ir_error from IR_FSD_MOUNT if volume exists *
   ERROR_IFSVOL_EXISTS     equ     284     ; mounted volume already exists


   ;* Values returned in ir_tuna from IR_FSD_MOUNT (default IR_TUNA_NOTUNNEL)
   IR_TUNA_NOTUNNEL        equ     0       ; Disable IFSMGR tunneling on volume
   IR_TUNA_FSDTUNNEL       equ     0       ; FSD implements tunneling itself
   IR_TUNA_IFSTUNNEL       equ     1       ; FSD requests IFSMGR tunneling support


   ;* Values for IFSMgr_PNPVolumeEvent
   PNPE_SUCCESS            equ     000h
   PNPE_QUERY_ACCEPTED     equ     000h
   PNPE_QUERY_REFUSED      equ     001h
   PNPE_BAD_ARGS           equ     002h
   PNPE_UNDEFINED          equ     0FFh


   ;* Type values for IFSMgr_PNPEvent
   PNPT_VOLUME     equ     010000000h
   PNPT_NET        equ     020000000h
   PNPT_MASK       equ     0F0000000h


   ;* Values for ir_options returned from QueryResource:
   RESSTAT_OK      equ     0               ; connection to resource is valid
   RESSTAT_PAUSED  equ     1               ; paused by workstation
   RESSTAT_DISCONN equ     2               ; disconnected
   RESSTAT_ERROR   equ     3               ; cannot be reconnected
   RESSTAT_CONN    equ     4               ; first connection in progress
   RESSTAT_RECONN  equ     5               ; reconnection in progress


   ;* Values for ir_flags to HM_CLOSE:
   CLOSE_HANDLE    equ     0               ; only closing a handle
   CLOSE_FOR_PROCESS equ   1               ; last close of SFN for this process
   CLOSE_FINAL     equ     2               ; final close of SFN for system


   ;* Values for ir_options to HM_CLOSE, HM_COMMIT, hf_read, hf_write:
   FILE_NO_LAST_ACCESS_DATE equ    001h    ; do not update last access date
   FILE_CLOSE_FOR_LEVEL4_LOCK equ  002h    ; special close on a level 4 lock
   FILE_COMMIT_ASYNC       equ     004h    ; commit async instead of sync
   FILE_FIND_RESTART       equ     040h    ; set for findnext w/key
   IOOPT_PRT_SPEC          equ     080h    ; ir_options flag for int17 writes


   ;*      Values for ir_flags to VFN_DIR:
   CREATE_DIR      equ     0
   DELETE_DIR      equ     1
   CHECK_DIR       equ     2
   QUERY83_DIR     equ     3
   QUERYLONG_DIR   equ     4


   ;*      ir_flags values for HM_FILELOCKS:
   LOCK_REGION     equ     0                       ; lock specified file region
   UNLOCK_REGION   equ     1                       ; unlock region

   ; Note: these values are also used by the sharing services
   ;* ir_options values for HM_FILELOCKS:
   LOCKF_MASK_RDWR         equ     001h    ; Read / write lock flag
   LOCKF_WR                equ     000h    ; bit 0 clear - write lock
   LOCKF_RD                equ     001h    ; bit 0 set - read lock(NW only)
   LOCKF_MASK_DOS_NW       equ     002h    ; DOS/Netware style lock flag
   LOCKF_DOS               equ     000h    ; bit 1 clear - DOS-style lock
   LOCKF_NW                equ     002h    ; bit 1 set - Netware-style lock

   ;* These values are used internally by the IFS manager only:
   LOCKF_MASK_INACTIVE     equ     080h    ; lock active/inactive flag
   LOCKF_ACTIVE            equ     000h    ; bit 7 clear - lock active
   LOCKF_INACTIVE          equ     080h    ; bit 7 set - lock inactive


   ;* Values for ir_flags to VFN_PIPEREQUEST and HM_PIPEREQUEST:
   ;       (NOTE: these values have been chosen to agree with the opcodes used
   ;       by the TRANSACTION SMB for the matching operation.)
   PIPE_QHandState         equ     021h
   PIPE_SetHandState       equ     001h
   PIPE_QInfo              equ     022h
   PIPE_Peek               equ     023h
   PIPE_RawRead            equ     011h
   PIPE_RawWrite           equ     031h
   PIPE_Wait               equ     053h
   PIPE_Call               equ     054h
   PIPE_Transact           equ     026h


   ;* Values for ir_flags for HM_HANDLEINFO call:
   HINFO_GET               equ     0       ; retrieve current buffering info
   HINFO_SETALL            equ     1       ; set info (all parms)
   HINFO_SETCHARTIME       equ     2       ; set handle buffer timeout
   HINFO_SETCHARCOUNT      equ     3       ; set handle max buffer count


   ;* Values for ir_flags for HM_ENUMHANDLE call:
   ENUMH_GETFILEINFO       equ     0       ; get fileinfo by handle
   ENUMH_GETFILENAME       equ     1       ; get filename associated with handle
   ENUMH_GETFINDINFO       equ     2       ; get info for resuming
   ENUMH_RESUMEFIND        equ     3       ; resume find operation
   ENUMH_RESYNCFILEDIR     equ     4       ; resync dir entry info for file


   ;* Values for ir_options for the ENUMH_RESYNCFILEDIR call:
   RESYNC_INVALIDATEMETACACHE      equ     001h    ; invalidate meta cache on resync


   ;* Values for ir_flags for VFN_FILEATTRIB:
   ;*
   ;*      Note: All functions that modify the volume MUST be odd.
   ;*       Callers rely on this & test the low order bit.
   GET_ATTRIBUTES                  equ     0 ; get attributes of file/dir
   SET_ATTRIBUTES                  equ     1 ; set attributes of file/dir
   GET_ATTRIB_COMP_FILESIZE        equ     2 ; get compressed size of file
   SET_ATTRIB_MODIFY_DATETIME      equ     3 ; set date last written of file/dir
   GET_ATTRIB_MODIFY_DATETIME      equ     4 ; get date last written of file/dir
   SET_ATTRIB_LAST_ACCESS_DATETIME equ     5 ; set date last accessed of file/dir
   GET_ATTRIB_LAST_ACCESS_DATETIME equ     6 ; get date last accessed of file/dir
   SET_ATTRIB_CREATION_DATETIME    equ     7 ; set create date of file/dir
   GET_ATTRIB_CREATION_DATETIME    equ     8 ; get create date of file/dir
   GET_ATTRIB_FIRST_CLUST          equ     9 ; get first cluster of a file


   ;* Values for ir_flags for VFN_FLUSH:
   GDF_NORMAL      equ     000h    ; walk disk, if needed, to get free space
   GDF_NO_DISK_HIT equ     001h    ; return current "hint", don't walk disk


   ;* Values for ir_flags for HM_FILETIMES:
   GET_MODIFY_DATETIME     equ     0       ; get last modification date/time
   SET_MODIFY_DATETIME     equ     1       ; set last modification date/time
   GET_LAST_ACCESS_DATETIME equ    4       ; get last access date/time
   SET_LAST_ACCESS_DATETIME equ    5       ; set last access date/time
   GET_CREATION_DATETIME   equ     6       ; get creation date/time
   SET_CREATION_DATETIME   equ     7       ; set creation date/time


   ;* Values for ir_flags for HM_SEEK:
   FILE_BEGIN      equ     0               ; absolute posn from file beginning
   FILE_END        equ     2               ; signed posn from file end


   ;* Values for ir_flags for VFN_OPEN:
   ACCESS_MODE_MASK        equ     00007h  ; Mask for access mode bits
   ACCESS_READONLY         equ     00000h  ; open for read-only access
   ACCESS_WRITEONLY        equ     00001h  ; open for write-only access
   ACCESS_READWRITE        equ     00002h  ; open for read and write access
   ACCESS_EXECUTE          equ     00003h  ; open for execute access
   SHARE_MODE_MASK         equ     00070h  ; Mask for share mode bits
   SHARE_COMPATIBILITY     equ     00000h  ; open in compatability mode
   SHARE_DENYREADWRITE     equ     00010h  ; open for exclusive access
   SHARE_DENYWRITE         equ     00020h  ; open allowing read-only access
   SHARE_DENYREAD          equ     00030h  ; open allowing write-only access
   SHARE_DENYNONE          equ     00040h  ; open allowing other processes access
   SHARE_FCB               equ     00070h  ; FCB mode open


   ;* Values for ir_options for VFN_OPEN:
   ACTION_MASK             equ     0ffh    ; Open Actions Mask
   ACTION_OPENEXISTING     equ     001h    ; open an existing file
   ACTION_REPLACEEXISTING  equ     002h    ; open existing file and set length
   ACTION_CREATENEW        equ     010h    ; create a new file, fail if exists
   ACTION_OPENALWAYS       equ     011h    ; open file, create if does not exist
   ACTION_CREATEALWAYS     equ     012h    ; create a new file, even if it exists

   ;* Alternate method: bit assignments for the above values:
   ACTION_EXISTS_OPEN      equ     001h    ; BIT: If file exists, open file
   ACTION_TRUNCATE         equ     002h    ; BIT: Truncate file
   ACTION_NEXISTS_CREATE   equ     010h    ; BIT: If file does not exist, create

   ; these mode flags are passed in via ifs_options to VFN_OPEN
   OPEN_FLAGS_NOINHERIT    equ     00080h
   OPEN_FLAGS_NO_CACHE     equ     R0_NO_CACHE ; 0x0100
   OPEN_FLAGS_NO_COMPRESS  equ     00200h
   OPEN_FLAGS_ALIAS_HINT   equ     00400h
   OPEN_FLAGS_NOCRITERR    equ     02000h
   OPEN_FLAGS_COMMIT       equ     04000h
   OPEN_FLAGS_REOPEN       equ     00800h  ; file is being reopened on vol lock

   ;* Values returned by VFN_OPEN for action taken:
   ACTION_OPENED           equ     1       ; existing file has been opened
   ACTION_CREATED          equ     2       ; new file has been created
   ACTION_REPLACED         equ     3       ; existing file has been replaced


   ;* Values for ir_flags for VFN_SEARCH:
   SEARCH_FIRST            equ     0       ; findfirst operation
   SEARCH_NEXT             equ     1       ; findnext operation


   ;* Values for ir_flags for VFN_DISCONNECT:
   DISCONNECT_NORMAL       equ     0       ; normal disconnect
   DISCONNECT_NO_IO        equ     1       ; no i/o can happen at this time
   DISCONNECT_SINGLE       equ     2       ; disconnect this drive only


   ;* Values for ir_options for VFN_FLUSH:
   VOL_DISCARD_CACHE       equ     1
   VOL_REMOUNT             equ     2


   ;* Values for ir_options for VFN_IOCTL16DRIVE:
   IOCTL_PKT_V86_ADDRESS   equ     0       ; V86 pkt address in user DS:DX
   IOCTL_PKT_LINEAR_ADDRESS equ    1       ; Linear address to packet in ir_data


   ;* Values for ir_flags for VFN_DASDIO:
   DIO_ABS_READ_SECTORS    equ     0       ; Absolute disk read
   DIO_ABS_WRITE_SECTORS   equ     1       ; Absolute disk write
   DIO_SET_LOCK_CACHE_STATE equ    2       ; Set cache state during volume lock


   ;*      Values for ir_options for DIO_SET_LOCK_CACHE_STATE:
   DLC_LEVEL4LOCK_TAKEN    equ     001h    ; cache writethru, discard name cache
   DLC_LEVEL4LOCK_RELEASED equ     002h    ; revert to normal cache state
   DLC_LEVEL1LOCK_TAKEN    equ     004h    ; cache writethru, discard name cache
   DLC_LEVEL1LOCK_RELEASED equ     008h    ; revert to normal cache state


   ; These values for ir_options are used only on ring 0 apis
   R0_NO_CACHE             equ     00100h  ; must not cache reads/writes
   R0_SWAPPER_CALL         equ     01000h  ; called by the swapper
   R0_MM_READ_WRITE        equ     08000h  ; indicates this is a MMF R0 i/o
   R0_SPLOPT_MASK          equ     0FF00h  ; mask for ring 0 special options


   ;* Values for ir_attr for different file attributes:
   FILE_ATTRIBUTE_READONLY         equ     001h    ; read-only file
   FILE_ATTRIBUTE_HIDDEN           equ     002h    ; hidden file
   FILE_ATTRIBUTE_SYSTEM           equ     004h    ; system file
   FILE_ATTRIBUTE_LABEL            equ     008h    ; volume label
   FILE_ATTRIBUTE_DIRECTORY        equ     010h    ; subdirectory
   FILE_ATTRIBUTE_ARCHIVE          equ     020h    ; archived file/directory
   FILE_ATTRIBUTE_DEVICE           equ     040h    ; device

   ; The second byte of ir_attr is a mask of attributes which "must match"
   ; on a SEARCH or FINDOPEN call.  If an attribute bit is set in the
   ; "must match" mask, then the file must also have that attribute set
   ; to match the search/find.
   FILE_ATTRIBUTE_MUSTMATCH        equ     000003F00h      ; 00ADVSHR Must Match
   FILE_ATTRIBUTE_EVERYTHING       equ     00000003Fh      ; 00ADVSHR Find Everything
   FILE_ATTRIBUTE_INTERESTING      equ     00000001Eh      ; 000DVSH0 Search bits


   ;   Auto-generation flags returned from CreateBasis()
   BASIS_TRUNC             equ     001h    ; original name was truncated
   BASIS_LOSS              equ     002h    ; char translation loss occurred
   BASIS_UPCASE            equ     004h    ; char in basis was upcased
   BASIS_EXT               equ     020h    ; char in basis is extended ASCII

   ;   Flags that SHOULD associated with detecting 'collisions' in the basis name
   ;   and the numeric tail of a basis name.  They are defined here so that routines
   ;   who need to flag these conditions use these values in a way that does not
   ;   conflict with the previous three 'basis' flags.
   BASIS_NAME_COLL         equ     008h    ; collision in the basis name component
   BASIS_NUM_TAIL_COLL     equ     010h    ; collision in the numeric-tail component


   ;       Flags returned by long-name FindOpen/Findnext calls.  The flags
   ;       indicate whether a mapping from UNICODE to BCS of the primary and
   ;       altername names in the find buffer have lost information.  This
   ;       occurs whenever a UNICODE char cannot be mapped into an OEM/ANSI
   ;       char in the codepage specified.
   FIND_FLAG_PRI_NAME_LOSS                 equ     00001h
   FIND_FLAG_ALT_NAME_LOSS                 equ     00002h


   ;       Flags returned by UNIToBCS, BCSToUni, UniToBCSPath, MapUniToBCS
   ;  MapBCSToUni.  The flags indicate whether a mapping from UNICODE
   ;  to BCS, or BCS to UNICODE have lost information.  This occurs
   ;       whenever a char cannot be mapped.
   MAP_FLAG_LOSS                                   equ     00001h
   MAP_FLAG_TRUNCATE                               equ     00002h


   ; These bits are also set in ir_attr for specific properties of the
   ; pathname/filename.
   ;
   ; A filename is 8.3 compatible if it contains at most 8 characters before
   ; a DOT or the end of the name, at most 3 chars after a DOT, at most one
   ; DOT, and no new LFN only characters.  The new LFN characters are:
   ; , + = [ ] ;
   ;
   ; If a name does not meet all of the 8.3 rules above then it is considered
   ; to be a "long file name", LFN.
   FILE_FLAG_WILDCARDS     equ     080000000h      ; set if wildcards in name
   FILE_FLAG_HAS_STAR      equ     040000000h      ; set if *'s in name (PARSE_WILD also set)
   FILE_FLAG_LONG_PATH     equ     020000000h      ; set if any path element is not 8.3
   FILE_FLAG_KEEP_CASE     equ     010000000h      ; set if FSD should use ir_uFName
   FILE_FLAG_HAS_DOT       equ     008000000h      ; set if last path element contains .'s
   FILE_FLAG_IS_LFN        equ     004000000h      ; set if last element is LFN


   ; Function definitions on the ring 0 apis function list:
   ; NOTE: Most functions are context independent unless explicitly stated
   ; i.e. they do not use the current thread context. R0_LOCKFILE is the only
   ; exception - it always uses the current thread context.
   R0_OPENCREATFILE        equ     0D500h  ; Open/Create a file
   R0_OPENCREAT_IN_CONTEXT equ     0D501h  ; Open/Create file in current context
   R0_READFILE             equ     0D600h  ; Read a file, no context
   R0_WRITEFILE            equ     0D601h  ; Write to a file, no context
   R0_READFILE_IN_CONTEXT  equ     0D602h  ; Read a file, in thread context
   R0_WRITEFILE_IN_CONTEXT equ     0D603h  ; Write to a file, in thread context
   R0_CLOSEFILE            equ     0D700h  ; Close a file
   R0_GETFILESIZE          equ     0D800h  ; Get size of a file
   R0_FINDFIRSTFILE        equ     04E00h  ; Do a LFN FindFirst operation
   R0_FINDNEXTFILE         equ     04F00h  ; Do a LFN FindNext operation
   R0_FINDCLOSEFILE        equ     0DC00h  ; Do a LFN FindClose operation
   R0_FILEATTRIBUTES       equ     04300h  ; Get/Set Attributes of a file
   R0_RENAMEFILE           equ     05600h  ; Rename a file
   R0_DELETEFILE           equ     04100h  ; Delete a file
   R0_LOCKFILE             equ     05C00h  ; Lock/Unlock a region in a file
   R0_GETDISKFREESPACE     equ     03600h  ; Get disk free space
   R0_READABSOLUTEDISK     equ     0DD00h  ; Absolute disk read
   R0_WRITEABSOLUTEDISK    equ     0DE00h  ; Absolute disk write


   ; Special definitions for ring 0 apis for drive information flags
   IFS_DRV_RMM             equ     00001h  ; drive is managed by RMM
   IFS_DRV_DOS_DISK_INFO   equ     00002h  ; drive needs DOS


   ;* search - Search record structure
   ;
   ; This strucure defines the result buffer format for search returns
   ; for int21h based file searches: 11H/12H FCB Find First/Next
   ;       and 4eH/4fH path based Find First/Next
   ;
   ; There are two areas in the search_record reserved for use by file system
   ; drivers. One is to be used by local file systems such as FAT or CDROM
   ; and the other is to be used by network file systems such as an SMB or
   ; NCP client. The reason for the split is because many network file
   ; systems send and receive the search key directly on the net.

   ;typedef struct srch_key srch_key;
   srch_key        struc
     sk_drive      db      ?               ; Drive specifier (set by IFS MGR)
     sk_pattern    db      11 dup (?)      ; Reserved (pattern sought)
     sk_attr       db      ?               ; Reserved (attribute sought)
     sk_localFSD   db      4 dup (?)       ; available for use local FSDs
     sk_netFSD     db      2 dup (?)       ; available for use by network FSDs
     sk_ifsmgr     db      2 dup (?)       ; reserved for use by IFS MGR
   srch_key        ends

   ;typedef struct srch_entry srch_entry;
   srch_entry      struc
     se_key        db      (size srch_key) dup (?) ; resume key
     se_attrib     db      ?               ; file attribute
     se_time       dw      ?               ; time of last modification to file
     se_date       dw      ?               ; date of last modification to file
     se_size       dd      ?               ; size of file
     se_name       db      13 dup (?)      ; ASCIIZ name with dot included
   srch_entry      ends


   ;* Win32 Date Time structure
   ; This structure defines the new Win32 format structure for returning the
   ; date and time
   ;typedef struct _FILETIME _FILETIME;
   _FILETIME       struc
     dwLowDateTime dd      ?
     dwHighDateTime dd     ?
   _FILETIME       ends


   ;* Win32 Find Structure
   ;  This structure defines the contents of the result buffer on a
   ; Win32 FindFirst / FindNext. These calls are accessed by the new
   ; LFN find apis
   ;typedef struct _WIN32_FIND_DATA _WIN32_FIND_DATA;
   _WIN32_FIND_DATA        struc
     dwFileAttributes      dd      ?
     ftCreationTime        db      (size _FILETIME) dup (?)
     ftLastAccessTime      db      (size _FILETIME) dup (?)
     ftLastWriteTime       db      (size _FILETIME) dup (?)
     nFileSizeHigh         dd      ?
     nFileSizeLow          dd      ?
     dwReserved0           dd      ?
     dwReserved1           dd      ?
     cFileName             dw      MAX_PATH dup (?)        ; includes NUL
     cAlternateFileName    dw      14 dup (?)              ; includes NUL
   _WIN32_FIND_DATA        ends


   ;* Win32 File Info By Handle Structure
   ;  This structure defines the contents of the result buffer on a
   ;  Win32 FileInfoByHandle. These calls are accessed by the new
   ;  LFN find apis
   ;typedef struct _BY_HANDLE_FILE_INFORMATION _BY_HANDLE_FILE_INFORMATION;
   _BY_HANDLE_FILE_INFORMATION     struc   ; bhfi
     bhfi_dwFileAttributes         dd      ?
     bhfi_ftCreationTime           db      (size _FILETIME) dup (?)
     bhfi_ftLastAccessTime         db      (size _FILETIME) dup (?)
     bhfi_ftLastWriteTime          db      (size _FILETIME) dup (?)
     bhfi_dwVolumeSerialNumber     dd      ?
     bhfi_nFileSizeHigh            dd      ?
     bhfi_nFileSizeLow             dd      ?
     bhfi_nNumberOfLinks           dd      ?
     bhfi_nFileIndexHigh           dd      ?
     bhfi_nFileIndexLow            dd      ?
   _BY_HANDLE_FILE_INFORMATION     ends


   ; these are win32 defined flags for GetVolInfo
   FS_CASE_IS_PRESERVED            equ     000000002h
   FS_UNICODE_STORED_ON_DISK       equ     000000004h

   ; these flags for GetVolInfo are NOT defined
   FS_VOL_IS_COMPRESSED            equ     000008000h
   FS_VOL_SUPPORTS_LONG_NAMES      equ     000004000h


   ; these flags are returned by IFSMgr_Get_Drive_Info
   FDRV_INT13              equ     001h
   FDRV_FASTDISK           equ     002h
   FDRV_COMP               equ     004h
   FDRV_RMM                equ     008h
   FDRV_DOS                equ     010h
   FDRV_USE_RMM            equ     020h
   FDRV_COMPHOST           equ     040h
   FDRV_NO_LAZY            equ     080h


   ;* TUNINFO - Tunneling Information
   ;       This structure defines the information passed into the FSD on
   ;       a Create or Rename operation if tunneling was detected.  This
   ;       gives a set of advisory information to create the new file with.
   ;       if ir_ptuninfo is NULL on Create or Rename, none of this information
   ;       is available.  All of this information is advisory.  tuni_bfContents
   ;       defines what pieces of tunneling information are available.
   ;typedef struct TUNINFO         TUNINFO;
   TUNINFO         struc
     tuni_bfContents       dd      ?
     % tuni_pAltName       $P      ?
     tuni_ftCreationTime   db      (size _FILETIME) dup (?)
     tuni_ftLastAccessTime db      (size _FILETIME) dup (?)
     tuni_ftLastWriteTime  db      (size _FILETIME) dup (?)
   TUNINFO ends

   TUNI_CONTAINS_ALTNAME   equ     000000001h      ; pAltName available
   TUNI_CONTAINS_CREATIONT equ     000000002h      ; ftCreationTime available
   TUNI_CONTAINS_LASTACCESST equ   000000004h      ; ftLastAccessTime available
   TUNI_CONTAINS_LASTWRITET equ    000000008h      ; ftLastWriteTime available


   ;* _QWORD - 64-bit data type
   ;  A struct used to return 64-bit data types to C callers
   ;  from the qwUniToBCS & qwUniToBCS rotuines.  These
   ;  'routines' are just alias' for UntoToBCS & UniToBCSPath
   ;  routines and do not exist as separate entities.  Both
   ;  routines always return a 64-bit result.  The lower
   ;  32-bits are a length.  The upper 32-bits are flags.
   ;  Typically, the flag returned indicates whether a mapping
   ;  resulted in a loss on information in the UNICODE to BCS
   ;  translation (i.e. a unicode char was converted to an '_').
   ;typedef struct _QWORD _QWORD;
   _QWORD  struc
     ddLower       dd      ?
     ddUpper       dd      ?
   _QWORD  ends


   ;* ParsedPath - structure of an IFSMgr parsed pathname
   PathElement     struc
     pe_length     dw      ?
     pe_unichars   dw      1 dup (?)
   PathElement     ends

   ParsedPath      struc
     pp_totalLength dw     ?
     pp_prefixLength dw    ?
     pp_elements   db      (1*size PathElement) dup (?)
   ParsedPath      ends


   ; Values for charSet passed to character conversion routines
   BCS_WANSI       equ     0       ; use Windows ANSI set
   BCS_OEM         equ     1       ; use current OEM character set
   BCS_UNI         equ     2       ; use UNICODE character set


   ;   Matching semantics flags passed to MetaMatchUni()
   UFLG_META       equ     001h
   UFLG_NT         equ     002h
   UFLG_NT_DOS     equ     004h
   UFLG_DOS        equ     000h


   ; define the utb and btu ptr table structures
   ;typedef struct CPPtrs CPPtrs;
   CPPtrs  struc
     AnsiPtr       dd      ?
     OEMPtr        dd      ?
   CPPtrs  ends

   ;typedef struct UnitoUpperTab UnitoUpperTab;
   UnitoUpperTab   struc
     delta         dd      ?
     TabPtr        dd      ?
   UnitoUpperTab   ends

   ;typedef struct CPTablePtrs CPTablePtrs;
   CPTablePtrs     struc
     CPT_Length    dd      ?
     utbPtrTab     db      (size CPPtrs) dup (?)
     btuPtrTab     db      (size CPPtrs) dup (?)
     UnitoUpperPtr db      (size UnitoUpperTab) dup (?)
   CPTablePtrs     ends


   fmode_t         struc           ; File mode information
     fm_uid        dd      ?       ; User ID
     % fm_cookie0  $P      ?       ; Caller-supplied cookie
     % fm_cookie1  $P      ?       ; Caller-supplied cookie
     fm_mode       dw      ?       ; File sharing mode and access
     fm_attr       dw      ?       ; File attributes
   fmode_t ends


   ; These flags are used on the Win32 service to duplicate an extended handle
   DUP_NORMAL_HANDLE       equ     000h    ; dup handle for normal file io
   DUP_MEMORY_MAPPED       equ     001h    ; dup handle for memory-mapping
   DUP_MEM_MAPPED_WRITE    equ     002h    ; mem mapping is for write if set,
                                           ; is for read if clear.


   ; These constants for the different subfunctions on NameTrans (7160h)
   NAMTRN_NORMALQUERY      equ     000h    ; normal LFN NameTrans operation
   NAMTRN_DO83QUERY        equ     001h    ; NameTrans to return full 8.3 name
   NAMTRN_DOLFNQUERY       equ     002h    ; NameTrans to return full LFN name


   ; These constants are used for the different subfunctions on Get List Of
   ; Open Files (440dh, 086Dh)
   ENUM_ALL_FILES          equ     000h    ; enumerate all open files
   ENUM_UNMOVEABLE_FILES   equ     001h    ; enumerate only unmoveable files


   ;* Structure for the open file information from DOS to take over open files.
   ;typedef struct SFTOpenInfo SFTOpenInfo;
   ;typedef struct SFTOpenInfo *pSFTOpenInfo;
   SFTOpenInfo     struc
     soi_dirclus   dw      ?               ; cluster # for directory
     soi_dirind    dw      ?               ; directory index of dir entry
     soi_dirname   db      11 dup (?)      ; directory entry name
     soi_pad       db      ?               ; pad out for dword boundary
   SFTOpenInfo     ends
