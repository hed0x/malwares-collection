!binary
!include sice-val.ms

# mov si,OLD_SI -> mov si,NEW_SI
\190:p
\190:x
# mov di,OLD_DI -> mov di,NEW_DI
\191:q
\191:y

# cmp si,OLD_SI -> cmp si,NEW_SI
\129\254:p
\129\254:x
# cmp di,OLD_DI -> cmp di,NEW_DI
\129\255:q
\129\255:y

# cmp w,[bp+4],OLD_SI -> cmp w,[bp+4],NEW_SI
\129\126\4:p
\129\126\4:x
# cmp w,[bp+0],OLD_DI -> cmp w,[bp+0],NEW_DI
\129\126\0:q
\129\126\0:y

# mov w,[bp+4],OLD_SI -> mov w,[bp+4],NEW_SI
\199\70\4:p
\199\70\4:x
# mov w,[bp+0],OLD_DI -> mov w,[bp+0],NEW_DI
\199\70\0:q
\199\70\0:y


# not sure about these ones...

# cmp w,[4],OLD_SI -> cmp w,[4],NEW_SI
\129\62\4\0:p
\129\62\4\0:x

# mov ax,OLD_SI -> mov ax,NEW_SI
\184:p
\184:x
