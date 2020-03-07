; Entry: EAX == Max_Val.
; 
; Return: EAX == Random number between 0..Max_Val-1.
; routine by T-2000
        
rand:           assume ebp:ptr vars
            push ecx
                push edx
                push eax

            rdtsc
            mov ecx,dword ptr [ebp].random_seed ; random seed 
            add eax,ecx

            rol ecx, 1
            add ecx, 666h
            mov dword ptr [ebp].random_seed,ecx ; random seed 

            push 32
            pop ecx

CRC_Bit:            shr eax, 1
                jnc Loop_CRC_Bit
                xor eax,0EDB88320h

Loop_CRC_Bit:       loop CRC_Bit                
                pop ecx
                xor edx,edx
                div ecx

            xchg edx,eax
            or eax,eax

            pop edx
            pop ecx
            retn
                
