@echo macro has to be exported to a.bin
bin2inc a.bin wbdrop.inc < wbdrop.txt
@echo -------------------------------------------
@echo nezabudni zmazat posledny byte z wbdrop.inc
@echo a pridat  seeklo(1), seekhi(2) a copycnt(3)
@echo -------------------------------------------
@echo a skopirovat do bind\wbdrop

