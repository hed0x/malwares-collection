#ifndef INSTANCE_INCLUDED
#define INSTANCE_INCLUDED

extern WCHAR InstanceMutantPath[48];
extern HANDLE InstanceMutantObject;

BOOL
DECLSPEC_NOINLINE
CreateInstance(VOID);

#endif
