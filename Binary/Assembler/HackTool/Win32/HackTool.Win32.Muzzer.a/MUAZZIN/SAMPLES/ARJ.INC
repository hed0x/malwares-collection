STRUC arjheader
.arj_headerid         resw 1   ;0ea60h
.arj_headersize       resw 1   ;from here ending in the .arj_headercrc
.arj_headersize_      resb 1   ;total size till compressed data
.arj_versiondone      resb 1   ;6
.arj_versionneed      resb 1   ;1
.arj_hostos           resb 1   ;0=msdos
.arj_flags            resb 1   ;0
.arj_method           resb 1   ;0=stored
.arj_type             resb 1   ;0=binary
.arj_reserved         resb 1
.arj_datetime         resd 1
.arj_compressedsize   resd 1
.arj_uncompressedsize resd 1
.arj_filecrc          resd 1
.arj_entryname        resw 1
.arj_accessmode       resw 1   ;21h
.arj_hostdata         resw 1
.arj_filename         resb 1    ;variable string
.arj_comment          resb 1    ;variable string
.arj_headercrc        resd 1
.arj_extheader        resw 1
ENDSTRUC
