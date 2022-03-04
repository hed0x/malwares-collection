include memory.inc
include ipc.inc


;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
;Out:	eax=seed
randomize:
		pusha
		kernelCall GetTickCount
		mov [esp._eax],eax
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
;In:	eax=msecs count
sleep:
		pusha
		push eax
		kernelCall Sleep
		popa
		ret