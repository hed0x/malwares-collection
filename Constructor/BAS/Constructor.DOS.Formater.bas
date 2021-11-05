CLS
REM Special Format Generator || Constructor.BAT.SFG
REM by SeCoNd PaRt To HeLl
RANDOMIZE TIMER
PRINT ""
PRINT "                   Special Format Generator"
PRINT "                     by SeCoNd PaRt To HeLl"
PRINT "                            spth@jet2web.cc"
PRINT "                             www.spth.de.vu"
PRINT ""
OPEN "format.txt" FOR OUTPUT AS #1
PRINT #1, "cls"
a = 0
aa:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO aa
is$ = is$ + b$
IF a < 5 THEN GOTO aa
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; is$; "="; e$
PRINT #1, "set "; is$; "=s"
PRINT #1, "goto "; is$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; is$; "="; e$
PRINT #1, ":"; is$

a = 0
ab:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ab
ie$ = ie$ + b$
IF a < 5 THEN GOTO ab
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; ie$; "="; e$
PRINT #1, "set "; ie$; "=e"
PRINT #1, "goto "; ie$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; ie$; "="; e$
PRINT #1, ":"; ie$

a = 0
ac:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ac
it$ = it$ + b$
IF a < 5 THEN GOTO ac
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; it$; "="; e$
PRINT #1, "set "; it$; "=t"
PRINT #1, "goto "; it$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; it$; "="; e$
PRINT #1, ":"; it$

a = 0
ad:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ad
iset$ = iset$ + b$
IF a < 5 THEN GOTO ad
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; iset$; "="; e$
PRINT #1, "set "; iset$; "=%" + is$ + "%%" + ie$ + "%%" + it$ + "%"
PRINT #1, "goto "; iset$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, "set "; iset$; "="; e$
PRINT #1, ":"; iset$
iset$ = "%" + iset$ + "%"

a = 0
ae:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ae
if$ = if$ + b$
IF a < 5 THEN GOTO ae
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; if$; "="; e$
PRINT #1, iset$; " "; if$; "=f"
PRINT #1, "goto "; if$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; if$; "="; e$
PRINT #1, ":"; if$

a = 0
af:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO af
io$ = io$ + b$
IF a < 5 THEN GOTO af
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; io$; "="; e$
PRINT #1, iset$; " "; io$; "=o"
PRINT #1, "goto "; io$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; io$; "="; e$
PRINT #1, ":"; io$

a = 0
ag:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ag
ir$ = ir$ + b$
IF a < 5 THEN GOTO ag
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; ir$; "="; e$
PRINT #1, iset$; " "; ir$; "=r"
PRINT #1, "goto "; ir$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; ir$; "="; e$
PRINT #1, ":"; ir$

a = 0
ah:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ah
im$ = im$ + b$
IF a < 5 THEN GOTO ah
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; im$; "="; e$
PRINT #1, iset$; " "; im$; "=m"
PRINT #1, "goto "; im$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; im$; "="; e$
PRINT #1, ":"; im$

a = 0
ai:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ai
ia$ = ia$ + b$
IF a < 5 THEN GOTO ai
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; ia$; "="; e$
PRINT #1, iset$; " "; ia$; "=a"
PRINT #1, "goto "; ia$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; ia$; "="; e$
PRINT #1, ":"; ia$

a = 0
aj:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO aj
iu$ = iu$ + b$
IF a < 5 THEN GOTO aj
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iu$; "="; e$
PRINT #1, iset$; " "; iu$; "=u"
PRINT #1, "goto "; iu$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iu$; "="; e$
PRINT #1, ":"; iu$

a = 0
ak:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ak
iq$ = iq$ + b$
IF a < 5 THEN GOTO ak
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iq$; "="; e$
PRINT #1, iset$; " "; iq$; "=q"
PRINT #1, "goto "; iq$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iq$; "="; e$
PRINT #1, ":"; iq$

a = 0
al:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO al
iformat$ = iformat$ + b$
IF a < 5 THEN GOTO al
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iformat$; "="; e$
PRINT #1, iset$; " "; iformat$; "=%"; if$; "%%"; io$; "%%"; ir$; "%%"; im$; "%%"; ia$; "%%"; it$; "%"
PRINT #1, "goto "; iformat$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iformat$; "="; e$
PRINT #1, ":"; iformat$


a = 0
am:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO am
iautotest$ = iautotest$ + b$
IF a < 5 THEN GOTO am
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iautotest$; "="; e$
PRINT #1, iset$; " "; iautotest$; "=%"; ia$; "%%"; iu$; "%%"; it$; "%%"; io$; "%%"; it$; "%%"; ie$; "%%"; is$; "%%"; it$; "%"
PRINT #1, "goto "; iautotest$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iautotest$; "="; e$
PRINT #1, ":"; iautotest$

a = 0
ao:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ao
isl$ = isl$ + b$
IF a < 5 THEN GOTO ao
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; isl$; "="; e$
PRINT #1, iset$; " "; isl$; "=/"
PRINT #1, "goto "; isl$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; isl$; "="; e$
PRINT #1, ":"; isl$

a = 0
ap:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO ap
iddp$ = iddp$ + b$
IF a < 5 THEN GOTO ap
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iddp$; "="; e$
PRINT #1, iset$; " "; iddp$; "=:"
PRINT #1, "goto "; iddp$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; iddp$; "="; e$
PRINT #1, ":"; iddp$

a = 0
an:
a = a + 1
d = INT(RND * 191) + 64
b$ = CHR$(d)
IF b$ = "|" OR b$ = "^" THEN GOTO an
ispth$ = ispth$ + b$
IF a < 5 THEN GOTO an
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; ispth$; "="; e$
PRINT #1, iset$; " "; ispth$; "=%"; iformat$; "% c%"; iddp$; "% %"; isl$; "%%"; iu$; "% %"; isl$; "%%"; iq$; "% %"; isl$; "%%"; iautotest$; "%"
PRINT #1, "goto "; ispth$
ran = INT(RND * 26) + 97
e$ = CHR$(ran)
PRINT #1, iset$; " "; ispth$; "="; e$
PRINT #1, ":"; ispth$

PRINT #1, "%"; ispth$; "%"
CLOSE #1

