;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; macro definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	locals __
;-----------------------------------------------------------------------------

; (0) Z0MBIE
_seh_struc struc
	m_pSEH dd ?
	m_pExcFunction dd ? 
_seh_struc ends

calchash macro procname
 hash=0
 bytes=0
 irpc c, <procname>
  hash = ((hash shl 3) and 0FFFFFFFFh) or (hash shr (32-3))
  hash = hash xor "&c"
  bytes=bytes+1
 endm
endm

; you must define number of functions manually

declfunc macro funcname
 local txt
 calchash funcname
 txt textequ <>
 txt catstr <_>, <funcname>, txt
 db bytes
 dd hash
 txt: push 12345678h;mov eax, 0
 ret; jmp eax			
; txt _func <bytes, hash, 0>
endm
decllen	equ 11
xcall macro funcname
 local txt
 txt textequ <>
 txt catstr <_>, <funcname>, txt
; call [ebp+(txt-rec)]
 call txt
endm

; load API function address in eax
apiaddr macro func, delta
 local txt1
 local txt2
 txt1 textequ <>
 txt1 catstr <_>, <func>, <+5->, <delta>
 txt2 textequ <>
 txt2 catstr <_>, <func>, <+1->, <delta>
 ;lea eax, [ebp+txt1]
 mov eax, [ebp+txt2]
endm

