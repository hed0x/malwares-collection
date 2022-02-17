    TRUSTEE                     STRUCT
     pMultipleTrustee           DWORD ?
     MultipleTrusteeOperation   DWORD ?
     TrusteeForm                DWORD ?
     TrusteeType                DWORD ?
     ptstrName                  LPSTR ?
    TRUSTEE                     ENDS

;MULTIPLE_TRUSTEE_OPERATION
    NO_MULTIPLE_TRUSTEE         EQU 0
    TRUSTEE_IS_IMPERSONATE      EQU 1

;TRUSTEE_FORM
    TRUSTEE_IS_SID              EQU 0
    TRUSTEE_IS_NAME             EQU 1
    TRUSTEE_BAD_FORM            EQU 2
 
;TRUSTEE_TYPE
    TRUSTEE_IS_UNKNOWN          EQU 0
    TRUSTEE_IS_USER             EQU 1
    TRUSTEE_IS_GROUP            EQU 2
    TRUSTEE_IS_DOMAIN           EQU 3
    TRUSTEE_IS_ALIAS            EQU 4
    TRUSTEE_IS_WELL_KNOWN_GROUP EQU 5
    TRUSTEE_IS_DELETED          EQU 6
    TRUSTEE_IS_INVALID          EQU 7


    EXPLICIT_ACCESS             STRUCT
     grfAccessPermissions       DWORD ?
     grfAccessMode              DWORD ?
     grfInheritance             DWORD ?
     Trustee                    TRUSTEE <>
    EXPLICIT_ACCESS             ENDS


;ACCESS_MODE
    NOT_USED_ACCESS             EQU 0
    GRANT_ACCESS                EQU 1 
    SET_ACCESS                  EQU 2
    DENY_ACCESS                 EQU 3
    REVOKE_ACCESS               EQU 4
    SET_AUDIT_SUCCESS           EQU 5
    SET_AUDIT_FAILURE           EQU 6


;Inheritance flags
    NO_INHERITANCE              EQU 0
    SUB_OBJECTS_ONLY_INHERIT    EQU 1
    SUB_CONTAINERS_ONLY_INHERIT EQU 2
    SUB_CONTAINERS_AND_OBJECTS_INHERIT EQU 3
    INHERIT_NO_PROPAGATE        EQU 4
    INHERIT_ONLY                EQU 8
    INHERITED_ACCESS_ENTRY      EQU 10H
    INHERITED_PARENT            EQU 10000000H
    INHERITED_GRANDPARENT       EQU 20000000H


;SE_OBJECT_TYPE
    SE_UNKNOWN_OBJECT_TYPE      EQU 0
    SE_FILE_OBJECT              EQU 1
    SE_SERVICE                  EQU 2
    SE_PRINTER                  EQU 3
    SE_REGISTRY_KEY             EQU 4
    SE_LMSHARE                  EQU 5
    SE_KERNEL_OBJECT            EQU 6
    SE_WINDOW_OBJECT            EQU 7
    SE_DS_OBJECT                EQU 8
    SE_DS_OBJECT_ALL            EQU 9
    SE_PROVIDER_DEFINED_OBJECT  EQU 10


    ALL_SECURITY_INFORMATION    =   OWNER_SECURITY_INFORMATION OR \
                                    GROUP_SECURITY_INFORMATION OR \
                                    DACL_SECURITY_INFORMATION OR \
                                    SACL_SECURITY_INFORMATION
