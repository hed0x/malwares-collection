#ifndef SDK_ASSEMBLY_INCLUDED
#define SDK_ASSEMBLY_INCLUDED

#ifdef _AMD64_
    #define nax   rax
    #define nbx   rbx
    #define ncx   rcx
    #define ndx   rdx
    #define nsi   rsi
    #define ndi   rdi
    #define nbp   rbp
    #define nsp   rsp
    #define nip   rip
    #define ns    gs
    #define nword qword
#else
    #define nax   eax
    #define nbx   ebx
    #define ncx   ecx
    #define ndx   edx
    #define nsi   esi
    #define ndi   edi
    #define nbp   ebp
    #define nsp   esp
    #define nip   eip
    #define ns    fs
    #define nword dword
#endif

#endif
