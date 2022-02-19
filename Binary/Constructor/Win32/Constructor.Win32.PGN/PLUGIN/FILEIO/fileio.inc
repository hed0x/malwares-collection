
ff_struc                struc                   ; win32 "searchrec" structure
ff_attr                 dd      ?
ff_time_create          dd      ?,?
ff_time_lastaccess      dd      ?,?
ff_time_lastwrite       dd      ?,?
ff_size_hi              dd      ?
ff_size                 dd      ?
                        dd      ?,?
ff_fullname             db      260 dup (?)
ff_shortname            db      14 dup (?)
                        ends

