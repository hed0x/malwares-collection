include memory.inc


;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;Out:	eax=seed
randomize:
		pusha
		xcall GetTickCount
		mov [esp._eax],eax
		popa
		ret

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	eax=msecs count
sleep:
		pusha
		push eax
		xcall Sleep
		popa
		ret

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	edx=SYSTEMIME bufer offset
getsystime:
		pusha
		push edx
		xcall GetLocalTime
		popa
		ret
