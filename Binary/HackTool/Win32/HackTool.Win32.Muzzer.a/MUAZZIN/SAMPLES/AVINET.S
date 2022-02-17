;Block access to AV sites

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "avip"              ;AV IP
VERSION EQU 0102h

entry:
       mov edi, [esp+4]
       test dword [edi+m_why], MT_BLOCKIP
       jnz .request
       test dword [edi+m_why], MT_QUERY
       jnz .query
       mov dword [edi+m_result], MR_DONE
       ret 4

  .query:
       mov esi, MT_QUERY+MT_BLOCKIP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

  .request:
       mov ebx, [edi+m_ip]
       shl ebx, 8
       call .delta
  .delta:
       pop esi
       sub esi, .delta-ip_table
       mov ecx, (ip_table.end-ip_table)/4
  .loop:
       lodsd
       shl eax, 8
       cmp eax, ebx
       je .block
       loop .loop
       mov dword [edi+m_result], MR_OK
       ret 4
  .block:
       mov dword [edi+m_result], MR_ERROR
       ret 4

ip_table:
%include "av_ip.inc"
  .end:
