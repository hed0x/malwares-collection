
extern "C" void pascal DISASM_INIT(void* tableptr);
extern "C" int  pascal DISASM_MAIN(void* tableptr, void* opcodeptr);

char tbl[2048];

void disasm_init()
{
  DISASM_INIT(&tbl);
}

int disasm(void* x)
{
  return DISASM_MAIN(&tbl, x);
}
