   IOHOOKER_VERSION        equ     1

   EV_IOHOOKER_BASE        equ     00003B00h
   EV_IOHOOKER_ON_SEND     equ     EV_IOHOOKER_BASE+01h    ; EDX=send() stack frame ptr
   EV_IOHOOKER_ON_RECV     equ     EV_IOHOOKER_BASE+02h    ; --//--, ECX=# of bytes received
   EV_IOHOOKER_ON_CONNECT  equ     EV_IOHOOKER_BASE+03h    ; --//--
