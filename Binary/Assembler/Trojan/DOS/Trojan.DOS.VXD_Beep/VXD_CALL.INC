
VxDCall                 macro   Service
                        db      0CDh
                        db      020h
                        dd      Service
                        endm

VMMCall                 macro   Service
                        VxDCall VMM_&Service&
                        endm
