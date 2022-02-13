
include                 ..\..\INCLUDE\consts.inc
include                 ..\ADDPGN\addpgn.inc

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

include                 key1.inc

                        .code

HandleEvent:            mov     eax, [esp+4]    ; event_id
                        cmp     eax, EV_ADDPGN_GETKEY
                        je      __check_key

__return_0:             xor     eax, eax
                        retn

__check_key:            mov     edx, [esp+8]    ; user_param
                        mov     eax, [edx+0]    ; hash
                        cmp     eax, keydata.dword ptr 0   ; hash
                        jne     __return_0
                        ; return keyptr
                        mov     dword ptr [edx+4], offset keydata
                        mov     eax, 1
                        retn

                        end
