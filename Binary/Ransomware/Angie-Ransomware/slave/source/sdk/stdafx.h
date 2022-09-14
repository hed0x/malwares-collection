
#ifdef _M_AMD64 
    #define _AMD64_
#endif

#ifdef _M_IX86
    #define _X86_
#endif

#pragma warning(disable:537 ) // declaring a void parameter list with a typedef is nonstandard
#pragma warning(disable:137 ) // expression must be a modifiable lvalue)
#pragma warning(disable:1899) // multicharacter character literal (potential portability problem)
#pragma warning(disable:69  ) // integer conversion resulted in truncation

typedef enum _NTVERSION {
    NTVERSION_WIN10_1809_MJ  = 10,
    NTVERSION_WIN10_1803_MJ  = 10,
    NTVERSION_WIN10_1709_MJ  = 10,
    NTVERSION_WIN10_1703_MJ  = 10,
    NTVERSION_WIN10_1607_MJ  = 10,
    NTVERSION_WIN10_1511_MJ  = 10,
    NTVERSION_WIN10_MJ       = 10,
    NTVERSION_WIN9_MJ        = 6,
    NTVERSION_WIN8_MJ        = 6,
    NTVERSION_WIN7_SP1_MJ    = 6,
    NTVERSION_WIN7_MJ        = 6,

    NTVERSION_WIN10_1809_MN  = 0,
    NTVERSION_WIN10_1803_MN  = 0,
    NTVERSION_WIN10_1709_MN  = 0,
    NTVERSION_WIN10_1703_MN  = 0,
    NTVERSION_WIN10_1607_MN  = 0,
    NTVERSION_WIN10_1511_MN  = 0,
    NTVERSION_WIN10_MN       = 0,
    NTVERSION_WIN9_MN        = 1,
    NTVERSION_WIN8_MN        = 2,
    NTVERSION_WIN7_SP1_MN    = 1,
    NTVERSION_WIN7_MN        = 1,

    NTVERSION_WIN10_1809_BNO = 17763,
    NTVERSION_WIN10_1803_BNO = 17134,
    NTVERSION_WIN10_1709_BNO = 16299,
    NTVERSION_WIN10_1703_BNO = 15063,
    NTVERSION_WIN10_1607_BNO = 14393,
    NTVERSION_WIN10_1511_BNO = 10586,
    NTVERSION_WIN10_BNO      = 10240,
    NTVERSION_WIN9_BNO       = 9600,
    NTVERSION_WIN8_BNO       = 9200,
    NTVERSION_WIN7_SP1_BNO   = 7601,
    NTVERSION_WIN7_BNO       = 7600,
} NTVERSION, *PNTVERSION;

#define ON  1
#define OFF 0

#include <..\..\..\globalconfig.h>

/* Max version that we will run */
#define SCFG_NTVESRION_MAX_MJ            (NTVERSION_WIN10_1809_MJ + 1)
#define SCFG_NTVESRION_MAX_MN            ??
#define SCFG_NTVESRION_MAX_BNO           ??

/* Windows minimal version supported */
#define SCFG_NTVERSION_MIN_MJ            NTVERSION_WIN7_MJ
#define SCFG_NTVERSION_MIN_MN            NTVERSION_WIN7_MN
#define SCFG_NTVERSION_MIN_BNO           NTVERSION_WIN7_BNO

/* Minimal version that is fully supported, higher means might crash on somethings due incapability */
#define SCFG_NTVERSION_DEPRECATED_MI_MJ  NTVERSION_WIN10_1809_MJ
#define SCFG_NTVERSION_DEPRECATED_MI_MN  NTVERSION_WIN10_1809_MN
#define SCFG_NTVERSION_DEPRECATED_MI_BNO NTVERSION_WIN10_1809_BNO

#define SCFG_DLOG_LARGEST_PROC_NAME   30

#pragma region CORE
    #define SCFG_DLOG_CORE_THREAD0 L"\\Device\\NamedPipe\\{49E0CB71-B6D5-4501-A508-E7770725CF55}"
    #define SCFG_DLOG_CORE_THREAD1 L"\\Device\\NamedPipe\\{49E0CB71-B6D5-4501-A508-E7770725CF55}"

    #define SCFG_CORE_LDR_PRINT_FOUND_PROC    ON  // OFF
    #define SCFG_CORE_LDR_PRINT_SYSCALLS      ON  // OFF

    #define SCFG_CORE_NTAPI_INIT_USE_PROCLOAD OFF // OFF 
    #define SCFG_CORE_NTAPI_INIT_USE_SYSCALLS OFF // OFF

    #define SCFG_CORE_IGNORE_HARDWARE_DBG     ON  // OFF
    #define SCFG_CORE_IGNORE_SOFTWARE_DBG     ON  // OFF
    #define SCFG_CORE_IGNORE_SAFEBOOT         ON  // OFF
    
    #define SCFG_CORE_INSTANCE_IGNORE_OTHER   OFF // OFF
    #define SCFG_CORE_INSTANCE_USE_SEED_SALT  ON  // ON

    #define SCFG_CORE_DROPPER_FORCE_X86       OFF // OFF
#pragma endregion

#pragma region DROPPER
    #ifdef _AMD64_
        #define SCFG_DLOG_DROPPER_X64_THREAD0 L"\\Device\\NamedPipe\\{49E0CB71-B6D5-4501-A508-E7770725CF55}"
    #else
        #define SCFG_DROPPER_NTAPI_STUB_X86_USE_WOW64 ON  // OFF (I have Windows 10 x64, can't use x86 stubs without VMX
    #endif

    #define SCFG_DROPPER_LDR_PRINT_FOUND_PROC     ON  // OFF
    #define SCFG_DROPPER_LDR_PRINT_SYSCALLS       ON  // OFF

    #define SCFG_DROPPER_NTAPI_INIT_USE_PROCLOAD  OFF // OFF
    #define SCFG_DROPPER_NTAPI_INIT_USE_SYSCALLS  OFF // OFF

    #define SCFG_DROPPER_PROCESSQUERY_INJECT_TO_PHONY    ON        // OFF
    #define SCFG_DROPPER_PROCESSQUERY_PRINT_QUERY        ON        // OFF
    #define SCFG_DROPPER_PROCESSQUERY_TIME_DENOMINATOR   100000000 // 100000000
    #define SCFG_DROPPER_PROCESSQUERY_TRIES              5         // 5
    #define SCFG_DROPPER_PROCESSQUERY_TIME_SHIFT_ON_FAIL 5         // 5

    #if !(SCFG_DROPPER_PROCESSQUERY_TIME_DENOMINATOR << (SCFG_DROPPER_PROCESSQUERY_TRIES - 1) * SCFG_DROPPER_PROCESSQUERY_TIME_SHIFT_ON_FAIL)
        #error Invalid SCFG_DROPPER_PROCESSQUERY_TRIES, SCFG_DROPPER_PROCESSQUERY_TIME_SHIFT_ON_FAIL or SCFG_DROPPER_PROCESSQUERY_TIME_DENOMINATOR
    #endif

    #define SCFG_DROPPER_ANGIE_PRETEND_TO_INJECT OFF // OFF
#pragma endregion

#pragma region ANGIE
    #define SCFG_DLOG_ANGIE_THREAD0 L"\\Device\\NamedPipe\\{49E0CB71-B6D5-4501-A508-E7770725CF55}"

    #define SCFG_ANGIE_INITIAL_BREAK_ON_DBG ON  // OFF
#pragma endregion

#include <assembly.h>
#include <winsdk.h>
#include <simdsdk.h>
#include <dlog.h>
#include <rtlp.h>
