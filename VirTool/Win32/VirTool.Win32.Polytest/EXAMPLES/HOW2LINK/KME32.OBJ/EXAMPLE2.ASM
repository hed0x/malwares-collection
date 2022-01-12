
;                         example of linking KME-32
;                         ~~~~~~~~~~~~~~~~~~~~~~~~~
;
include                 ..\..\..\KME32\kme32.int

extrn                   kme_start
extrn                   kme_end
extrn                   kme_main:PROC

                        p386
                        model   flat

                        .data

                        db      ?

                        .code
start:
                        ret
                        
;                       push    ...
                        call    kme_main

                        end     start
