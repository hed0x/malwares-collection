#include <stdio.h>
#include <windows.h>

int main(int argc,char* argv[])
{

if (argc !=2){printf("Ussage:  killatom.exe  < atom_name >\n");return 1;}

ATOM   atm;
atm=GlobalFindAtom(argv[1]);
if (!atm){printf("*Atom %s is not finded!\n",argv[1]);return 1;}

GlobalDeleteAtom(atm);
printf("Atom %s was deleted.",argv[1]);
return 0;
}