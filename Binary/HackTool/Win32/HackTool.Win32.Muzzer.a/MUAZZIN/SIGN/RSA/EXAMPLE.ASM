; RSA algo code from Z0mbie
; comments and cosmetic changes from Guillermito
; (when you're not an asm genius, the only thing you can do is to comment and adapt genial code)
; (hey, don't laugh, even Vecna had problems to do this implementation! :)

; interesting trick for lazy guys like me who do not like to copy/paste a bunch of extrn:PROC

callW                   macro   x
                        extrn   x:PROC
                        call    x
                        endm

p386
model   flat

                        
.data

encr db "encrypted text",0	; title of the MessageBox with encryption output
decr db "decrypted text",0	; title of the MessageBox with decryption output
           
n1 db 'Z0mbie is an asm genius.',13,10,0		; the plaintext message to be encrypted
size_message equ $-offset n1				; size of the message
fill_with_empty_bytes equ ((BN_DWORD*4)-size_message)	; calculate the remaining size 
fill db fill_with_empty_bytes dup (0)			; get a fixed size message block
n2 dd      BN_DWORD dup (0)				; fixed size zone for encryption
n3 dd      BN_DWORD dup (0)				; fixed size zone for decryption

; Here are the big numbers used in the RSA algo, calculated for us by PGP from the first 
; random generation of 2 big primes p and q. Look at the PGP source if you wanna find the
; different tests used to generate prime numbers, that's funny. Some other tools are able 
; to generate big primes (Proth, PrimeFinder...), but you will need to calculate n, e and 
; d by hand (forget it...). The best solution is to use the tools Z0mbie coded for us, to 
; grab easily all we need from PGP output. Look at their souces to know how to proceed.
;
; Remember that we are talking about really BIG numbers. A 512 bits number like the ones 
; that follow contains roughly 150 digits (because 2^10 = 1024, roughly equal to 10^3, 
; so 2^512 is roughly equal to 10^153), so forget clasical ways to do simple operations 
; on them.

; bignumber, output from PGP (here 512 bits key)
; plus 32 zero bits at the end to fit Z0mbie's algo implementation
; n = p*q
; (p and q are 2 big primes, but we don't need them anymore)
; (btw, the heart of any asymetric cypher is a mathematical function which is easy to
; do in one direction and very hard to do in the opposite. In the RSA case, the easy thing
; is to multiplicate 2 big primes, the hard thing is to factorize a very big number into
; its 2 prime factors) 

rsa_n                    label   dword
dd 0F6D58855h,0747BF3C7h,0B7D9D280h,076448E09h	
dd 06C97DC66h,0B4D97170h,0060A25C0h,0F948D05Fh	
dd 0CE6BE78Bh,014AB8C18h,0DC121E55h,0EEBF310Ch	
dd 0649200EAh,033500C0Bh,079F9FA9Eh,0C154D832h	
dd 0

; bignumber, output from PGP (here 512 bits key)
; plus 32 zero bits at the end to fit Z0mbie's algo implementation
; e is prime with (p-1)*(q-1)
; "RSA encryption by software is really more rapid if you carefully choose the value
; of e. The more used choices are 3, 17 and 65537. Why? because the binary representation
; of these numbers just have two "1", so the calculation of their power is done with 
; just 17 multiplications." (Bruce Schneier, "Applied Cryptography", 2nd edition)
; here PGP gave us 17d (11h)
; e and n form the public key, to encrypt and/or to verify a signature
; NB: if you want to speed up decryption and not encryption, swap public/private keys

rsa_e                    label   dword
dd 000000011h,000000000h,000000000h,000000000h
dd 000000000h,000000000h,000000000h,000000000h	
dd 000000000h,000000000h,000000000h,000000000h
dd 000000000h,000000000h,000000000h,000000000h
dd 0

; bignumber, output from PGP (here 512 bits key)
; plus 32 zero bits at the end to fit Z0mbie's algo implementation
; d is calculated as d = inv(e) modulo [(p-1)*(q-1)]
; d and n form the private (secret) key, to decrypt and/or to create a signature

rsa_d                    label   dword
dd 02805442Bh,0C522F768h,0E2955511h,08F8FFBABh	
dd 01072DC0Fh,04A60867Bh,0AA6600B8h,083F85DABh	
dd 0E2990444h,0F287EAFBh,08E443A8Eh,069545967h
dd 0E89AC42Bh,061EE9BE6h,044DF39DCh,0554B1416h
dd 0

rsa_bit                 equ     512			; size in bits of PGP output keys
BN_BIT 			equ 	rsa_bit+32		; size in bits of BigNumbers we use 
BN_BYTE                 equ     BN_BIT/8		; same in bytes
BN_DWORD                equ     BN_BIT/32		; same in dwords
MAX_BLOCK_SIZE          equ     ((rsa_bit/8)-1)		; max size of message in bytes ??

                        .code
start:

;======================================================================
;                        EXAMPLE OF ENCRYPTION
;======================================================================

; encrypt message n1 into n2 using public rsa_e and public rsa_n

                        push    offset n1       ; input = clear message
                        push    offset n2       ; output = encrypted message
                        push    offset rsa_e    ; e = public key 
                        push    offset rsa_n    ; n = modulo
                        call    rsa_main

; show encrypted message (even if it's not ASCII, we don't care)

pusha
push 0
push offset encr
push offset n2
push 0
callW MessageBoxA
popa

;======================================================================
;                        EXAMPLE OF DECRYPTION
;======================================================================

; decrypt message n2 into n3 using secret rsa_d and public rsa_n

                        push    offset n2       ; input = encrypted message
                        push    offset n3       ; output = decrypted message
                        push    offset rsa_d    ; d = private key
                        push    offset rsa_n    ; n = modulo
                        call    rsa_main

; show decrypted message (this time it should be back to ASCII)

pusha                  
push 0
push offset decr
push offset n3
push 0
callW MessageBoxA
popa

; exit to md
                        push    -1
                        callW   ExitProcess

;======================================================================
;                           THE RSA ALGO
;======================================================================

; subroutine: rsa_main
; action:     x = (a^b) mod m
; the same is used for encryption and decryption

rsa_main                proc    pascal
                        arg     m:DWORD         ; modulus (always n) - push last
                        arg     b:DWORD         ; exponent (e to encrypt, d to decrypt)
                        arg     x:DWORD         ; result
                        arg     a:DWORD         ; base - push first
                        local   p:DWORD:BN_DWORD; temporary (a^i) mod m
                        local   t:DWORD:BN_DWORD; temporary bgnumber
                        pusha

                        cld			; direction flag in normal way

; explanation of the algo and the mathematical simplifications used to make the
; calculations possibles (ripped from http://yoyo.cc.monash.edu.au/~davmac/algrthm/pkc.html)
;
; in computing the power of y^x, the efficiency can be greatly increased by use
; of the following identities:
;
; y^a * y^b = y^(a+b) which also yields to y^a * y^a = y^2a
; (y^a mod d) * (y^b mod d) = y^(a+b) mod d
; ((y^a mod d) * y^b) mod d = y^(a+b) mod d
;
; What are the practical upshots? Firstly, calculating a large power is made faster
; by multiplying lesser powers, in particular powers of powers of 2 (because a left 
; shift of bytes is easier to do than a big multiplication), giving us the
; following algo for y^x:
;
; let result = 1
; let product = y
; repeat: {
; 	if the lowest bit of x is set, multiply result by product (@)
;	multiply product by itself (@@)
;	shift x right by one bit
; 	if x is 0, break from the loop
;	  } 
;
; Now, the second identity gives us a solution to the further problem that "result" quickly
; becomes very large, too large to fit in any of the normal computer variable storage sizes.
; To get around this problem, we make use of the second and third identities by inserting
; just after the line marked by @ in the algo above:
;
;	let result = the modulus of itself by n           ????????????????
;
; And after the line marked by a @@:
;
; 	let product = the modulus of itself by n
;
; This is the algo used by Z0mbie the asm genius
;
; A practical example: calculate 3^13 modulo 7
; It's simple enough to calculate it with a pocket calculator: 
; 3^13 modulo 7 = 1594323 modulo 7 = 3
; Now let's use the algo:
;
; NB: x = 13d =  1101b
; 
; First round:
; result = 1
; product = 3
; the lowest bit of x is set: multiply result by product. So result = 1*3 = 3
; let result = the modulus of itself by n: result = 3 modulo 7 = 3
; multiply product by itself: product = 3*3 = 9
; let product = the modulus of itself by n: product = 9 modulo 7 = 2
; shift x right by one bit: x is now egal to 110b
;
; Second round:
; result = 3
; product = 2
; the lowest bit of x is not set: do nothing
; multiply product by itself: product = 2*2 = 4
; let product = the modulus of itself by n: product = 4 modulo 7 = 4
; shift x right by one bit: x is now egal to 11b
;
; Third round:
; result = 3
; product = 4
; the lowest bit of x is set: multiply result by product. So result = 3*4 = 12 
; let result = the modulus of itself by n: result = 12 modulo 7 = 5
; multiply product by itself: product = 4*4 = 16
; let product = the modulus of itself by n: product = 16 modulo 7 = 2
; shift x right by one bit: x is now egal to 1b
;
; Fourth round:
; result = 5
; product = 2
; the lowest bit of x is set: multiply result by product. So result = 5*2 = 10
; let result = the modulus of itself by n: result = 10 modulo 7 = 3
; multiply product by itself: product = 2*2 = 4
; let product = the modulus of itself by n: product = 4 modulo 7 = 4
; shift x right by one bit: x is now egal to 0b: break the loop
;
; The result is 3. So we were able to calculate 3^13 modulo 7 using just very small numbers.
;
; I hope now the code is a bit easier to understand (or maybe even more difficult? :)

; x = 1
                        mov     edi, x		; put a 1 in the first 
                        mov     eax, 1		; bit of the BigNumber "result"
                        stosd
                        mov     ecx, BN_DWORD-1	; and fill the rest
                        dec     eax		; with zeros
                        rep     stosd

; p = a
                        lea     edi, p		; copy the BN "input"
                        mov     esi, a		; in the tmp location (product)
                        mov     ecx, BN_DWORD
                        rep     movsd

; ebx = highestbit(b)

                        mov     edi, b		; find the highest bit of the power 
                        call    @@bitscan	; it comes back in ebx

; for (edx=0; edx<=ebx; edx++)

                        xor     edx, edx	; start with bit counter = 0 (lowest weight)
@@pwr_cycle:            push    edx		; save counter
                        push    ebx		; save highest bit

; if (b.bit[edx])
                        mov     eax, b		; test current bit of the power
                        bt      [eax], edx	; put bit in cf 
                        jnc     @@pwr_nobit	; if bit=0, directly multiply product by itself
						; and find modulo
; x=(x*p) mod m
                        mov     edx, x		; if bit=1, multiply result by product  
                        call    @@mulmod	; and find modulo 

@@pwr_nobit:

; p=(p*p) mod m
                        lea     edx, p		; multiply product by itself
                        call    @@mulmod	; and find modulo

; } // for
                        pop     ebx		; recup highest bit
                        pop     edx		; recup counter

                        inc     edx		; inc counter
                        cmp     edx, ebx	; are we at the last bit (highest)?
                        jbe     @@pwr_cycle	; no => continue the loop

                        popa
                        ret			; yes => break the loop
                        			; the result is waiting for you in x

;========== routine to calculate the modulo of a BN multiplication ================

; Explanation of the algorithm to multiply 2 big numbers:
; The best way is to do exactly what we all did in school with a pencil and a sheet
; of paper, decomposing the big multiplication in small ones (using just one digit
; of the second number), writing all these intermediary results each time shifted
; with one digit to the left, and then doing an addition of them all. Now we do the 
; same but of course in base 2, which is even more easy: if the bit is 0, we have 
; nothing to add, if the bit is 1 we just copy the same number (it's multiplied by 1), 
; shifted with the appropriate number of positions to the left and add it to the result.
; So, in base 2, a multiplication of big numbers can be replaced by successive additions 
; of a left-shifted number. Easy, no?
;
; [By the way, addition of 2 big numbers is very easy: add the lightest doublewords, keep
; the carry if there is one, shift to the next doubleword, add with carry, etc... The same
; for the substraction.]
; 
; an example: 23 * 13
;
;     - first in base 10:
;
;        23
;    *   13
;   --------
;        69    
;       23  
;   --------
;       299
;
;     - now in base 2:
;
;        10111
;    *    1101
;   ------------
;        10111     
;       00000
;      10111
;     10111
;   ------------
;    100101011     ...  which is 299


; input:  x in EDX
; action: x=(x*p) mod m
; used:   t

                        align   4
@@mulmod:
                        lea     edi, t		; fill tmp BN zone with zeros
                        mov     ecx, BN_DWORD	
                        xor     eax, eax
                        rep     stosd

                        lea     edi, p
                        call    @@bitscan	; find the highest bit of the product, in ebx

@@mul_cycle:            lea     edi, t
                        mov     ecx, BN_DWORD
                        xor     eax, eax
@@shl_cycle:            rcl     dword ptr [edi], 1	; use carry to keep "escaping" bit
                        lea     edi, [edi+4]
                        loop    @@shl_cycle	; shift all BN one bit left

                        call    @@cmpsub	; substract modulo if needed

                        bt      p, ebx		; put highest product bit in cf
                        jnc     @@mul_nobit	; if bit = 0, no need to add nothing

                        mov     esi, edx	; if bit = 1, add x to tmp BN
                        lea     edi, t
                        xor     eax, eax
                        mov     ecx, BN_DWORD
@@add_cycle:            mov     eax, [esi]
                        adc     [edi], eax
                        lea     esi, [esi+4]
                        lea     edi, [edi+4]
                        loop    @@add_cycle

                        call    @@cmpsub	; substract modulo if needed

@@mul_nobit:            dec     ebx		; dec the counter	
                        jns     @@mul_cycle	; loop until counter = -1

                        mov     edi, edx
                        lea     esi, t
                        mov     ecx, BN_DWORD
                        rep     movsd		; replace x by the result of the operation 

                        retn
                        
;================ routine to test highest bit ===============================

; input:  EDI=bignumber
; output: EBX=number of highest bit (0-based)

@@bitscan:              mov     ebx, BN_BIT-1	; nb of bits to scan, start from highest weight
@@bitscan_cycle:        bt      [edi], ebx	; put the bit in cf
                        jc      @@bitscan_exit	; bit=1 found? yes => stop the loop
                        dec     ebx		; no => test the next one and decrement counter
                        jnz     @@bitscan_cycle	; and continue the loop
@@bitscan_exit:         retn

;=========== routine to find modulo by substraction ================

; action: if (t>=m) t-=m;

                        align   4
@@cmpsub:
                        lea     esi, t		; esi to the BN to moduloate
                        mov     edi, m		; edi to the modulo
                        mov     ecx, BN_DWORD-1	; counter from the heaviest to the lightest dw
@@cmp_cycle:            mov     eax, [esi+ecx*4]; eax is the heavy part of the BN
                        cmp     eax, [edi+ecx*4]; cmp to the same dw of the modulo
                        jb      @@cmpsub_exit	; inf : BN mod m = BN : nothing to substract
                        ja      @@sub		; sup : need to substract the modulo
                        dec     ecx		; equ : test the immediate inferior dword
                        jns     @@cmp_cycle	; loop through all dw until ecx is equal to -1
@@sub:
                        mov     esi, m		; esi to the modulo
                        lea     edi, t		; edi to the BN to moduloate
                        xor     eax, eax	; put the carry to zero for the first sbb?
                        mov     ecx, BN_DWORD	; loop through all dw starting with the lightest
@@sub_cycle:            mov     eax, [esi]	; put light dword of the modulo in eax
                        sbb     [edi], eax	; substract it from the same dword in the BN
                        			; the carry is kept from each step to the next
                        lea     esi, [esi+4]	; continue with immediate superior dw of modulo
                        lea     edi, [edi+4]	; continue with immediate superior dw of BN
                        loop    @@sub_cycle	; loop through all dwords
@@cmpsub_exit:
                        retn

                        endp






                        end     start
