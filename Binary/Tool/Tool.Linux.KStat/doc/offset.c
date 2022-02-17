/*
 * Very Simple, YES Really Very Simple Offset Calculator
 * kstat for 2.4.x
 *
 * use this to calculate offsets if compilation or running
 * are not as expected
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
        unsigned long addr1, addr2;

        addr1=strtoul(argv[1], NULL, 16);
        addr2=strtoul(argv[2], NULL, 16);

        printf("\n%p - %p = %ld\n", (void*)addr1, (void*)addr2, addr1-addr2);
        exit(0);
}
