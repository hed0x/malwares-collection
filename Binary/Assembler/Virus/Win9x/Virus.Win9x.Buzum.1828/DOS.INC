   ;DOS structures, by Horned Beast/VADER.

   BOOTSECTOR         STRUC
     BS_Jump          DB 3 DUP (?)
     BS_OemName       DB '????????'
     BS_BytesPerSec   DW ?
     BS_SecPerClust   DB ?
     BS_ResSectors    DW ?
     BS_FATs          DB ?
     BS_RootDirEnts   DW ?
     BS_Sectors       DW ?
     BS_Media         DB ?
     BS_FATsecs       DW ?
     BS_SecPerTrack   DW ?
     BS_Heads         DW ?
     BS_HiddenSecs    DD ?
     BS_HugeSectors   DD ?
     BS_DriveNumber   DB ?
     BS_Reserved1     DB ?
     BS_BootSignature DB ?
     BS_VolumeID      DD ?
     BS_VolumeLabel   DB 11 DUP (?)
     BS_FileSysType   DB 8 DUP (?)
   BOOTSECTOR         ENDS

   DEVICEPARAMS       STRUC
     DP_SpecFunc      DB ?
     DP_DevType       DB ?
     DP_DevAttr       DW ?
     DP_Cylinders     DW ?
     DP_MediaType     DB ?
     DP_BytesPerSec   DW ?
     DP_SecPerClust   DB ?
     DP_ResSectors    DW ?
     DP_FATs          DB ?
     DP_RootDirEnts   DW ?
     DP_Sectors       DW ?
     DP_Media         DB ?
     DP_FATsecs       DW ?
     DP_SecPerTrack   DW ?
     DP_Heads         DW ?
     DP_HiddenSecs    DD ?
     DP_HugeSectors   DD ?
     DP_Reserved1     DB 6 DUP (?) ;A documentation error in the
     DP_TrkLayoutCnt  DW ?         ;MS-DOS Programmer's Reference 5.0
   DEVICEPARAMS       ENDS         ;omits these last two fields.

   DIRENTRY           STRUC
     DE_Name          DB '????????'
     DE_Extension     DB '???'
     DE_Attributes    DB ?
     DE_Reserved1     DB 10 DUP (?)
     DE_Time          DW ?
     DE_Date          DW ?
     DE_StartCluster  DW ?
     DE_FileSize      DD ?
   DIRENTRY           ENDS

   DISKIO             STRUC
     DI_StartSector   DD ?
     DI_Sectors       DW ?
     DI_Buffer        DD ?
   DISKIO             ENDS

   DPB                STRUC
     DPB_Drive        DB ?
     DPB_Unit         DB ?
     DPB_SectorSize   DW ?
     DPB_ClusterMask  DB ?
     DPB_ClusterShift DB ?
     DPB_FirstFAT     DW ?
     DPB_FATCount     DB ?
     DPB_RootEntries  DW ?
     DPB_FirstSector  DW ?
     DPB_MaxCluster   DW ?
     DPB_FATSize      DW ?
     DPB_DirSector    DW ?
     DPB_DriverAddr   DD ?
     DPB_Media        DB ?
     DPB_FirstAccess  DB ?
     DPB_NextDPB      DD ?
     DPB_NextFree     DW ?
     DPB_FreeCnt      DW ?
   DPB                ENDS

   EXTENDEDFCB        STRUC
     EXT_Signature    DB 0FFh
     EXT_Reserved1    DB 5 DUP (0)
     EXT_Attribute    DB ?
     EXT_DriveID      DB ?
     EXT_FileName     DB '????????'
     EXT_Extent       DB '???'
     EXT_CurBlockNo   DW ?
     EXT_RecSize      DW ?
     EXT_FileSize     DB 4 DUP (?)
     EXT_FileDate     DW ?
     EXT_FileTime     DW ?
     EXT_Reserved2    DB 8 DUP (?)
     EXT_CurRecNo     DB ?
     EXT_RandomRecNo  DB 4 DUP (?)
   EXTENDEDFCB        ENDS

   EXTHEADER          STRUC
     EH_Signature     DB 0FFh
     EH_Reserved      DB 5 DUP (?)
     EH_SearchAttrs   DB ?
   EXTHEADER          ENDS

   FCB                STRUC
     FCB_DriveID      DB ?
     FCB_FileName     DB '????????'
     FCB_Extent       DB '???'
     FCB_CurBlockNo   DW ?
     FCB_RecSize      DW ?
     FCB_FileSize     DB 4 DUP (?)
     FCB_FileDate     DW ?
     FCB_FileTime     DW ?
     FCB_Reserved1    DB 8 DUP (?)
     FCB_CurRecNo     DB ?
     FCB_RandomRecNo  DB 4 DUP (?)
   FCB                ENDS

   FILEINFO           STRUC
     FI_Reserved1     DB 21 DUP (?)
     FI_Attribute     DB ?
     FI_FileTime      DW ?
     FI_FileDate      DW ?
     FI_Size          DD ?
     FI_FileName      DB 13 DUP (?)
   FILEINFO           ENDS

   FVBLOCK            STRUC
     FV_SpecFunc      DB 0
     FV_Head          DW ?
     FV_Cylinder      DW ?
   FVBLOCK            ENDS

   MID                STRUC
     MID_InfoLevel    DW 0
     MID_SerialNum    DD ?
     MID_VolLabel     DD 11 DUP (?)
     MID_FileSysType  DB 8 DUP (?)
   MID                ENDS

   PARTENTRY          STRUC
     PE_Bootable      DB ?
     PE_BeginHead     DB ?
     PE_BeginSector   DB ?
     PE_BeginCylinder DB ?
     PE_FileSystem    DB ?
     PE_EndHead       DB ?
     PE_EndSector     DB ?
     PE_EndCylinder   DB ?
     PE_StartSector   DD ?
     PE_Sectors       DD ?
   PARTENTRY          ENDS

   RENAMEFCB          STRUC
     REN_DriveID      DB ?
     REN_OldName      DB '????????'
     REN_OldExtent    DB '???'
     REN_Reserved1    DB 5 DUP (?)
     REN_NewName      DB '????????'
     REN_NewExtent    DB '???'
     REN_Reserved2    DB 9 DUP (?)
   RENAMEFCB          ENDS

   RWBLOCK            STRUC
     RW_SpecFunc      DB 0
     RW_Head          DW ?
     RW_Cylinder      DW ?
     RW_FirstSector   DW ?
     RW_Sectors       DW ?
     RW_Buffer        DD ?
   RWBLOCK            ENDS

   CHAINED_MCB = 'M'
   LAST_MCB    = 'Z'

   MCB                STRUC
     MCB_BlockType    DB ?
     MCB_ProcessID    DW ?
     MCB_BlockSize    DW ?
     MCB_Reserved1    DB 3 DUP (?)
     MCB_ProgramName  DB '????????'
   MCB                ENDS

   COMMANDTAIL        STRUC
     CT_Length        DB ?
     CT_Arguments     DB 127 DUP (?)
   COMMANDTAIL        ENDS

   PSP                STRUC
     PSP_Int20h       DW 20CDh
     PSP_TopOfMem     DW ?
     PSP_Reserved1    DB ?
     PSP_DispatchCall DB 5 DUP (?)
     PSP_AddrInt22h   DD ?
     PSP_AddrInt23h   DD ?
     PSP_AddrInt24h   DD ?
     PSP_Reserved2    DB 22 DUP (?)
     PSP_Environment  DW ?
     PSP_Reserved3    DB 34 DUP (?)
     PSP_Int21h       DW 21CDh
     PSP_FarRet       DB 0CBh
     PSP_Reserved4    DB 9 DUP (?)
     PSP_FirstFCB     DB 16 DUP (?)
     PSP_SecondFCB    DB 16 DUP (?)
     PSP_Reserved5    DB 4 DUP (?)
                      UNION
     PSP_CommandLine  COMMANDTAIL <>
     PSP_DefaultDTA   FILEINFO <>
                      ENDS
   PSP                ENDS

   FATTRIB RECORD FA_unused:2, FA_archive:1, FA_directory:1, FA_volumelabel:1,\
                  FA_system:1, FA_hidden:1, FA_readonly:1

   FTIME   RECORD FT_hours:5, FT_minutes:6, FT_seconds2:5

   FDATE   RECORD FD_year:7, FD_month:4, FD_day:5
