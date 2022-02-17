/* instructionSet.h   the opcodes that my program recognizes
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */





#ifndef _instructionSet_h_
#define _instructionSet_h_


#include "opcode.h"


/* OPD declare the given mnemonic
 * inside the class data members
 */
#define OPD(mnemonic)            	const static OpCode mnemonic

/* OPV£assign values to the data 
 * const OpCode InstructionSet::#mnemonic
 * passing 3 parameters to the constructor
 */
#define OPV3(opcode,size,mnemonic)	const OpCode InstructionSet::mnemonic=\
                                  	OpCode((const unsigned char*)opcode,size,#mnemonic) 
/* this is used with modifyable opcodes,
 * like for example jumps
 */
#define OPV4(opcode,size,mnemonic,mask)      const OpCode InstructionSet::mnemonic=\
                                             OpCode((const unsigned char*)opcode,size,\
                                             #mnemonic,(const unsigned char*)mask)

/* NOTE:
 * I use intel syntax, so:
 * MOV_EAX_EBX   means:
 * EAX=EBX
 */

class InstructionSet
{
public:

//const static OpCode NOP;  //is shorter rewritten as above:
//OPD(NOP);   

  //xor
  OPD(XOR_EAX_EAX);
  OPD(XOR_ECX_ECX);
  OPD(XOR_EDX_EDX);
  OPD(XOR_EBX_EBX);
  OPD(XOR_ESP_ESP);
  OPD(XOR_EBP_EBP);
  OPD(XOR_ESI_ESI);
  OPD(XOR_EDI_EDI);
  //push
  OPD(PUSH_EAX);
  OPD(PUSH_ECX);
  OPD(PUSH_EDX);
  OPD(PUSH_EBX);
  OPD(PUSH_ESP);
  OPD(PUSH_EBP);
  OPD(PUSH_ESI);
  OPD(PUSH_EDI);
  //pop
  OPD(POP_EAX);
  OPD(POP_ECX);
  OPD(POP_EDX);
  OPD(POP_EBX);
  OPD(POP_ESP);
  OPD(POP_EBP);
  OPD(POP_ESI);
  OPD(POP_EDI);

  //mov
  OPD(MOV_EBP_ESP);
  //
  OPD(NOP);   
  OPD(RET);
  OPD(LEAVE);

//modifyable opcodes
  OPD(JMP_BYTE);
  OPD(JMP_DWORD); 

//List1 opcodes:
//note: the syntax I have used is 'c' stay for content of like [...]
//      'p' stay for plus
  OPD(CMPB_cESP_BYTE);  //cmp [esp], byte
  OPD(JGEeJMP_DWORD);  //jmp greater or equal to next, else jmp dword
  OPD(MOV_AL_BYTE); //here mov al,11
  OPD(LEA_ECX_cESPpN); //lea ecx,[esp+N]
  OPD(MOV_EBX_cECX);  //mov ebx,[ecx]
  OPD(MOV_EDX_ECX); 
  //others
  OPD(MOV_EDX_ESP); 
  OPD(INT80);


};

extern InstructionSet IS;

















#endif

