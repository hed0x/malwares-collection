
;                        example of including KME-32
;                        ~~~~~~~~~~~~~~~~~~~~~~~~~~
;
include                 ..\..\..\KME32\kme32.int

                        p386
                        model   flat

                        .data

                        db      ?

                        .code
start:
                        ret
                        
;                       push    ...
                        call    kme_main

include                 ..\..\..\KME32\kme32.inc

                        end     start
