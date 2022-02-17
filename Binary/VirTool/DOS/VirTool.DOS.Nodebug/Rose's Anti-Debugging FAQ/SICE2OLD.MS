!binary
!include sice-val.ms

# original SI:\71\70 'FG'
# original DI:\77\74 'JM'

# mov si,NEW -> mov si,OLD
\190:x
\190:p
# mov di,NEW -> mov di,OLD
\191:y
\191:q

# cmp si,NEW -> cmp si,OLD
\129\254:x
\129\254:p

# cmp w,[4],NEW -> cmp w,[4],OLD
\129\62\4\0:x
\129\62\4\0:p

# cmp w,[bp+4],NEW -> cmp w,[bp+4],OLD
\129\126\4:x
\129\126\4:p
# cmp w,[bp+0],NEW -> cmp w,[bp+0],OLD
\129\126\0:y
\129\126\0:q

# mov w,[bp+4],NEW -> mov w,[bp+4],OLD
\199\70\4:x
\199\70\4:p
# mov w,[bp+0],NEW -> mov w,[bp+0],OLD
\199\70\4:y
\199\70\4:q

# not sure about this one... (only one occurance)
# mov ax,NEW -> mov ax,OLD
#\184:x
#\184:p
