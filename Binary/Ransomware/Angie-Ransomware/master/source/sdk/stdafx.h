
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

#define ON  1
#define OFF 0

#include <..\..\..\globalconfig.h>

#define SCFG_CORE_CONFIG_DEBUG_PATH ON // OFF

#define SCFG_CRYPTO_AESKEY_FORCE_USE_XOROSHIRO ON  // OFF
#define SCFG_CRYPTO_AESKEY_FORCE_USE_HARDWARE  OFF // OFF
#define SCFG_CRYPTO_AESKEY_FORCE_USE_CRYPTAPI  OFF // OFF

#include <winsdk.h>
#include <simdsdk.h>
#include <rtlp.h>
