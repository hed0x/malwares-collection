;ATOM_IPC	=	1
MUTEX_IPC	=	1

;-- Common API's -------------------------------------------------------------

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EAX= object handle
waitobject:
		pusha
		push 1000
		push eax
		kernelCall WaitForSingleObject
		jmp ipc_exit

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EAX= object handle
killobject:
		pusha
		push eax
		kernelCall CloseHandle
		popa
		ret

;-- Mutex API's --------------------------------------------------------------
ifdef MUTEX_IPC
;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EDX= mutex name offset
;Out:	EAX= mutex handle
addmutex:
		pusha
		push edx
		push 0
		push 0
		kernelCall CreateMutexA
		jmp ipc_exit

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EDX= mutex name offset
;Out:	EAX= mutex handle or 0
openmutex:

		pusha
		push edx
		push 0
		push SYNCHRONIZE
		kernelCall OpenMutexA
		jmp ipc_exit

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EAX= mutex handle
releasemutex:
		pusha
		push eax
		kernelCall ReleaseMutex				;free mutex
		popa
		ret
endif

;-- Atom API's ---------------------------------------------------------------
ifdef ATOM_IPC

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EDX= atom name offset
;Out:	EAX=atom id
addatom:
		pusha
		push edx
		kernelCall GlobalAddAtomA
		jmp ipc_exit

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EAX = atom id
killatom:
		pusha
		push eax
		kernelCall GlobalDeleteAtom
		popa
		ret		

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:	EDX = atom name offset
;Out:	ZF=1 if atom not finded
findatom:
		pusha
		push edx
		kernelCall GlobalFindAtomA

		or eax,eax
endif

ipc_exit:
		mov [esp._eax],eax
		popa
		ret		
