;*****************************************************************************
;*                                                                           *
;*    This structure define format of LE header for OS/2,Windows exe files   *
;*       ----------------------------------------------------------          *
;*                                                                           *
;*    Author Trigub Serge. B&M&T Corp.                                       *
;*           10 January 1993                                                 *
;*                                                                           *
;*****************************************************************************
;
LE_Header_define       Struc
;
LE_Signature                            dw      0    ; Signature 'LE' for exe header
LE_Byte_Order                           db      0    ;
LE_Word_Order                           db      0    ;
LE_Exec_Format_Level                    dd      0    ;
LE_CPU_Type                             dw      0    ;
LE_Target_OS                            dw      0    ;
LE_Module_Version                       dd      0    ;
LE_Module_Type_Flags                    dd      0    ;
LE_Number_Of_Memory_Pages               dd      0    ;
LE_Initial_CS                           dd      0    ;
LE_Initial_EIP                          dd      0    ;
LE_Initial_SS                           dd      0    ;
LE_Initial_ESP                          dd      0    ;
LE_Memory_Page_Size                     dd      0    ;
LE_Bytes_On_Last_Page                   dd      0    ;
LE_Fixup_Section_Size                   dd      0    ;
LE_Fixup_Section_Checksum               dd      0    ;
LE_Loader_Section_Size                  dd      0    ;
LE_Loader_Section_CheckSum              dd      0    ;
LE_Object_Table_Offset                  dd      0    ;
LE_Object_Table_Entries                 dd      0    ;
LE_Object_Page_Map_Table_Offset         dd      0    ;
LE_Object_Iterate_Data_Map_Offset       dd      0    ;
LE_Resource_Table_Offset                dd      0    ;
LE_Resource_Table_Entries               dd      0    ;
LE_Resident_Names_Table_Offset          dd      0    ;
LE_Entry_Table_Offset                   dd      0    ;
LE_Module_Directives_Table_Offset       dd      0    ;
LE_Module_Directives_Table_Entries      dd      0    ;
LE_Fixup_Page_Table_Offset              dd      0    ;
LE_Fixup_Record_Table_Offset            dd      0    ;
LE_Imported_Module_Names_Table_Offset   dd      0    ;
LE_Imported_Modules_Count               dd      0    ;
LE_Imported_Procedure_Name_Table_Offset dd      0    ;
LE_Per_page_Checksum_Table_Offset       dd      0    ;
LE_Data_Pages_Offset                    dd      0    ;
LE_Preload_Page_Count                   dd      0    ;
LE_Nonresident_Names_Table_Offset       dd      0    ;
LE_Nonresident_Names_Table_Length       dd      0    ;
LE_Nonresident_Names_Table_Checksum     dd      0    ;
LE_Automatic_Data_Object                dd      0    ;
LE_Debug_Information_Offset             dd      0    ;
LE_Debug_Information_Length             dd      0    ;
LE_Preload_Instance_Pages_Number        dd      0    ;
LE_Demand_Instance_Pages_Number         dd      0    ;
LE_Extra_Heap_Allocation                dd      0    ;
LE_Unknown                              dd      0    ;
;
LE_Header_define       Ends
;_______________________________________________________________________________
;
LE_Module_Type_Flags_Define             RECORD  {
;
                          LE_EXE_Module_Is_DLL          :1
                          LE_EXE_Reserved1              :1
                          LE_EXE_Errors_In_Module       :1
                          LE_EXE_Reserved2              :1
                          LE_EXE_Code_Load_Application  :1
                          LE_EXE_Application_Type       :3
                          LE_EXE_Reserved3              :2
                          LE_EXE_No_External_FIXUP      :1
                          LE_EXE_No_Internal_FIXUP      :1
                          LE_EXE_Protected_Mode_Only    :1
                          LE_EXE_Global_Initialization  :1
                          LE_EXE_Multipledata           :1
                          LE_EXE_Singledata             :1
;
                                                }
;
;-------------------------------------------------------------------------------
;
LE_Object_Table_Define          STRUC
;
LE_OBJ_Virtual_Segment_Size             dd      0
LE_OBJ_Relocation_Base_Address          dd      0
LE_OBJ_FLAGS                            dd      0
LE_OBJ_Page_MAP_Index                   dd      0
LE_OBJ_Page_MAP_Entries                 dd      0
LE_OBJ_Reserved                         dd      0
;
LE_Object_Table_Define          ENDS
;_______________________________________________________________________________
;
LE_OBJ_FLAGS_Define             Record  {
                        LE_OBJ_FL_I_O_Privilage_Level   :1
                        LE_OBJ_FL_Conforming_Segment    :1
                        LE_OBJ_FL_BIG_Segment           :1
                        LE_OBJ_FL_16_16_Alias           :1
                        LE_OBJ_FL_Reserved              :1
                        LE_OBJ_FL_Resident_Long_Locable :1
                        LE_OBJ_FL_Segment_Type          :2
                        LE_OBJ_FL_Segment_Invalid       :1
                        LE_OBJ_FL_Segment_Preloaded     :1
                        LE_OBJ_FL_Segment_Shared        :1
                        LE_OBJ_FL_Segment_Discardable   :1
                        LE_OBJ_FL_Segment_Resource      :1
                        LE_OBJ_FL_Segment_Executable    :1
                        LE_OBJ_FL_Segment_Writable      :1
                        LE_OBJ_FL_Segment_Readable      :1
                                        }
LE_OBJ_FL_Segment_Type_ENUM     ENUM    {
;
                LE_OBJ_FL_Segment_Type_Normal
                LE_OBJ_FL_Segment_Zero_Filled
                LE_OBJ_FL_Segment_Resident
                LE_OBJ_FL_Segment_Resident_contiguous
;
                                        }
;
;-------------------------------------------------------------------------------
;
LE_Page_Map_Table_Define        STRUC
;
LE_PM_High_Page_Number          dw      0
LE_PM_Low_Page_Number           db      0
LE_PM_FLAGS                     db      0
;
LE_Page_Map_Table_Define        ENDS
;
;-------------------------------------------------------------------------------
;
LE_PM_FLAGS_Define      RECORD  {
                        LE_PM_FLG_Page_Type     :2
                        LE_PM_FLG_Reserved      :6
                        LE_PM_FLG_End_Page      :2

                                }
;_______________________________________________________________________________
;
LE_PM_FLG_Page_Type_Enum        ENUM    {
                        LE_Legal_Page         = 0
                        LE_Iterated_Page      = 1
                        LE_Invalid_Page       = 2
                        LE_Zero_Filled_Page   = 3
                                        }
;_______________________________________________________________________________
;
LE_Entry_Table_Define           STRUC
;
LE_Entry_Number_of_Entries      db      0
LE_Entry_Bungle_Flags           db      0
LE_Entry_Object_Index           dw      0
LE_Entry_First_Entry            equ     $
;
LE_Entry_Table_Define           ENDS
;_______________________________________________________________________________
;
LE_Entry_Define                 STRUC
;
LE_Entry_Entry_Flags            db      0
;
                                UNION
LE_Entry_Word_Offset            dw      0
LE_Entry_Dword_Offset           dd      0
                                ENDS
;
LE_Entry_Define                 ENDS
;
;-------------------------------------------------------------------------------
;
LE_Entry_Bungle_Flags_define    RECORD  {
                        LE_EB_32_Bits_Entry :1
                        LE_EB_32_Valid_Entry:1
                                        }
;_______________________________________________________________________________
;
LE_Fixup_Record_Table_Define    STRUC
;
LE_Fixup_Relocation_Address_Type        db      0
LE_Fixup_Relocation_Type                db      0
LE_Fixup_Relocation_Page_Offset         dw      0
LE_Fixup_Segment_or_Module_Index        db      0
LE_Fixup_Offset_Or_Ordinal_Value        dw      0
;
LE_Fixup_Record_Table_Define    ENDS
;_______________________________________________________________________________
;
LE_Rel_Addr_Type_Define         RECORD  {
                        LE_RAT_Repeat_Offset            :1
                        LE_RAT_Target_OFFSET_Absent     :1
                        LE_RAT_Rel_Addr_Type            :4
                                        }
;_______________________________________________________________________________
;
LE_Relocation_Address_Type_ENUM ENUM    {
                        LE_RA_Low_Byte              = 0h
                        LE_RA_16_bits_selector      = 2h
                        LE_RA_32_bits_Far_Pointer   = 3h
                        LE_RA_16_bits_Offset        = 5h
                        LE_RA_48_bits_Far_Pointer   = 6h
                        LE_RA_32_bits_Offset        = 7h
                        LE_RA_32_bits_EIP_Rel       = 8h
                                        }
;_______________________________________________________________________________
;
LE_Reloc_Type_Define    RECORD  {
                        LE_RT_Ordinal_Byte      :1
                        LE_RT_Reserv1           :1
                        LE_RT_ABS_Dword         :1
                        LE_RT_Target_Offset_32  :1
                        LE_RT_Reserv2           :1
                        LE_RT_ADDITIVE_Type     :1
                        LE_RT_Reloc_Type        :2
                                }
;_______________________________________________________________________________
;
LE_Relocation_Type_ENUM         ENUM    {
                        LE_RT_Internal_Reference    = 0
                        LE_RT_Imported_Ordinal      = 1
                        LE_RT_Imported_Name         = 2
                        LE_RT_OS_FIXUP              = 3
                                        }
;_______________________________________________________________________________
;
LE_CPU_Type_ENUM                ENUM    {
;
                        LE_CPU_i80286           = 01h
                        LE_CPU_i80386           = 02h
                        LE_CPU_i80486           = 03h
                        LE_CPU_i80586           = 04h
                        LE_CPU_i860_N10         = 20h
                        LE_CPU_i860_N11         = 21h
                        LE_CPU_MIPS_Mark_I      = 40h
                        LE_CPU_MIPS_Mark_II     = 41h
                        LE_CPU_MIPS_Mark_III    = 42h
;
                                        }
