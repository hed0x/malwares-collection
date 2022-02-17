   RANDOM_VERSION          equ     1

   EV_RANDOM_BASE          equ     00001900h
   EV_RANDOM_RANDOMIZE     equ     EV_RANDOM_BASE+01h
   EV_RANDOM_RANDOM        equ     EV_RANDOM_BASE+02h  ; o:EAX
   EV_RANDOM_RND           equ     EV_RANDOM_BASE+03h  ; i:ECX o:EAX
