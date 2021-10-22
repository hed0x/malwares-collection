!binary
!include sice-val.ms

# original SI:\71\70 'FG'
# original DI:\77\74 'JM'

# mov si,OLD -> mov si,NEW
\190:p
\190:x
# mov di,OLD -> mov di,NEW
\191:q
\191:y

# cmp si,OLD -> cmp si,NEW
\129\254:p
\129\254:x

# cmp w,[4],OLD -> cmp w,[4],NEW
\129\62\4\0:p
\129\62\4\0:x

# cmp w,[bp+4],OLD -> cmp w,[bp+4],NEW
\129\126\4:p
\129\126\4:x
# cmp w,[bp+0],OLD -> cmp w,[bp+0],NEW
\129\126\0:q
\129\126\0:y

# mov w,[bp+4],OLD -> mov w,[bp+4],NEW
\199\70\4:p
\199\70\4:x
# mov w,[bp+0],OLD -> mov w,[bp+0],NEW
\199\70\4:q
\199\70\4:y

# not sure about this one... (only one occurance)
# mov ax,OLD -> mov ax,NEW
#\184:p
#\184:x
