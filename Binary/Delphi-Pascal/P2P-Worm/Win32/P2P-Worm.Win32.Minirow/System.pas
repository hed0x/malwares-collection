   unit System;

   interface

   procedure _InitExe;
   procedure _HandleFinally;
   procedure _halt0;

   type
     TGUID = record
       D1: LongWord;
       D2: Word;
       D3: Word;
       D4: array[0..7] of Byte;
     end;

   const
     Kernel32 = 'kernel32.dll';
     User32 = 'user32.dll';

   var
     HKernel32: LongWord;
     HUser32: LongWord;

   type
     TFNExitProcess = procedure(uExitCode: LongWord); stdcall;

   var
     ExitCode: LongWord;
     ExitProcess: TFNExitProcess;

   function LoadLibraryA(lpLibFileName: PAnsiChar): LongWord; stdcall;
   function LoadLibraryW(lpLibFileName: PWideChar): LongWord; stdcall;
   function LoadLibrary(lpLibFileName: PChar): LongWord; stdcall;
   function GetProcAddress(hModule: LongWord; lpProcName: PChar): Pointer; stdcall;

   implementation

   function LoadLibraryA; external kernel32 name 'LoadLibraryA';
   function LoadLibraryW; external kernel32 name 'LoadLibraryW';
   function LoadLibrary; external kernel32 name 'LoadLibraryA';
   function GetProcAddress; external kernel32 name 'GetProcAddress';

   procedure _InitExe;
   const
     PExitProcess: PChar = 'ExitProcess';
     PKernelModul: PChar = Kernel32;
     PUserModul: PChar = User32;
   asm
     PUSH PExitProcess
     PUSH PUserModul
     CALL LoadLibrary
     MOV  HUser32, EAX
     PUSH PKernelModul
     CALL LoadLibrary
     MOV  HKernel32, EAX
     PUSH EAX
     CALL GetProcAddress
     MOV  ExitProcess, EAX
   end;

   procedure _HandleFinally;
   asm
   end;

   procedure _halt0;
   asm
     PUSH ExitCode
     CALL ExitProcess
   end;

   end.
