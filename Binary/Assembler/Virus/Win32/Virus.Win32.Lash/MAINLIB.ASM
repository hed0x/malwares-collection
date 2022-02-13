
;
; This is just the main function calling
; View sonia.c for more information
;

.386
.model flat, STDCALL

    extrn WinMain:PROC

.code

Sonia:
   call WinMain

end Sonia