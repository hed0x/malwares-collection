   ;
   ;JQCODING.INC - Supertiny/fast Compression/Encryption library - ASM include
   ;(c) 1998 by Jacky Qwerty/29A.
   ;

   SizeOf_Mem      equ     10000h  ;64Kb

   ifndef mask0
     mask0         equ     5AC157B3h
   endif
   ifndef mask1
     mask1         equ     76C52B8Dh
   endif

   invalid_state   equ     2864E25Ch

   _Pushed_ret     equ     4
   _Pushed         equ     4

   _Pushad struc
           _edi    dd      ?
           _esi    dd      ?
           _ebp    dd      ?
           _esp    dd      ?
           _ebx    dd      ?
           _edx    dd      ?
           _ecx    dd      ?
           _eax    dd      ?
   _Pushad ends

   _out            equ     <_Pushed_ret + size _Pushad +  0>
   _in             equ     <_Pushed_ret + size _Pushad +  4>
   _in_len         equ     <_Pushed_ret + size _Pushad +  8>
   _mem64k         equ     <_Pushed_ret + size _Pushad + 12>

   _Args           equ     4

   jq_encode       equ     <_jq_encode@16>
   jq_decode       equ     <_jq_decode@16>
