cls

@tasm32 /m /ml /z /q ldizx_t.asm
@tlink32 /Tpe /x /c  -B:0x00400000 ldizx_t.obj,,,%TASM%lib\import32.lib
stospack.exe ldizx_t.exe tmp_asm.inc

@tasm32 /m /ml /z /q tables.asm
@tlink32 /Tpe /x /c  -B:0x00400000 tables.obj,,,%TASM%lib\import32.lib
ct.exe tables.exe ldizx_init

@tasm32 /m /ml /z /q ldizx_c.asm
@tlink32 /Tpe /x /c  -B:0x00400000 ldizx_c.obj,,,%TASM%lib\import32.lib
ct.exe ldizx_c.exe ldizx
         
@del *.obj>nul 
@del ldizx_c.exe>nul         
@del ldizx_t.exe>nul         
@del tables.exe>nul 
@type ldizx_init.inc >> ldizx.inc
@type ldizx_init.c >> ldizx.c
@del  ldizx_init.inc
@del  ldizx_init.c
@del  tmp_asm.inc