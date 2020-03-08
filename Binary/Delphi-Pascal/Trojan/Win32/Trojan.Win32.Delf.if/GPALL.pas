    {
     ******************************************************
     GPALL Unit by Falckon

     Esta Unit permite usar las APIS GetProcAddress
     y LoadLibraryA y gracias a ello poder usar otras APIS
     en tu codigo sin necesidad de estar poniendo en las uses
     el nombre de la unit que contenga las apis que quieras usar
     ya que esto mete más y más apis al ejecutable y por lo tanto
     el tamano de este es demasiado :)

     Aplicacion de consola con Sysutils y Windows: 37.5 kb
     Solo con GPALL: 8 kb!!!!!
     :)

     ******************************************************
    }

   unit GPALL;

   interface

     type
     LPCSTR = PAnsiChar;
     FARPROC = Pointer;
     HMODULE = System.HMODULE;

     function GetProcAddress(hModule: HMODULE; lpProcName: LPCSTR): FARPROC; stdcall;
     {$EXTERNALSYM GetProcAddress}
     function LoadLibraryA(lpLibFileName: PAnsiChar): HMODULE; stdcall;
     {$EXTERNALSYM LoadLibraryA}

     Const
     Kernel32 = 'kernel32.dll';

   implementation

     function GetProcAddress; external kernel32 name 'GetProcAddress';
     function LoadLibraryA; external kernel32 name 'LoadLibraryA';


   end.

