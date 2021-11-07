   ; VOLUME
   ; ~~~~~~
   ; - sb volume control (use highest to completely fuckup lamerz)

   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    VOLUME, CODE32, PERMUTABLE

   handleevent:            hookevent EV_VOLUME_SET, _set
                           stc
                           retn

   ; input: ESI=volume (0..FFFF)

   _set:                   pusha
                           mov     edi, 10         ; edi=controlID:
   __cycle:                call    setvolume       ; global, wave, midi, ...
                           dec     edi             ; !!! numbers depends
                           jns     __cycle         ; !!! on sb driver
                           popa
                           clc
                           retn

   setvolume:              push    esi             ; details: channel 2
                           push    esi             ; details: channel 1
                           push    esp             ; LPVOID paDetails
                           push    4               ; DWORD cbDetails
                           push    0               ; DWORD cMultipleItems || HWND hwndOwner
                           push    2               ; DWORD cChannels
                           push    edi             ; DWORD dwControlID
                           push    18h             ; DWORD cbStruct
                           mov     eax, esp
                           push    0               ; DWORD fdwDetails
                           push    eax             ; LPMIXERCONTROLDETAILS pmxcd
                           push    eax             ; HMIXEROBJ hmxobj
                           mov     eax, esp
                           push    0               ; mixerOpen: DWORD fdwOpen
                           push    0               ; mixerOpen: DWORD dwInstance
                           push    0               ; mixerOpen: DWORD dwCallback
                           push    0               ; mixerOpen: UINT uMxId
                           push    eax             ; mixerOpen: LPHMIXER phmx
   ;                       mov     ebx, [esp]
                           callMM  mixerOpen
                           callMM  mixerSetControlDetails
   ;                       push    ebx
   ;                       callMM  mixerClose
                           add     esp, 18h+8
                           retn

                           PLUGIN_END
