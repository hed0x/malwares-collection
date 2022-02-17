; -> string macros ripped from ELiASM by ELiCZ<-
;-----------------------------------------------

UNICODE = 0

ASTRING         macro   _STRING_
;
                _npar__ =  0
_ESC_           =       0
                irpc    _CHAR_,<_STRING_>
;
                if      _ESC_
_ESC_           =       0
;
                _npar__ = _npar__ + 1
                if      "&_CHAR_" eq "/"
                BYTE    "/"
                elseif  "&_CHAR_" eq "n"
                BYTE    0Dh, 0Ah
                _npar__ = _npar__ + 1
                elseif  "&_CHAR_" eq "r"
                BYTE    0Dh
                elseif  "&_CHAR_" eq "l"
                BYTE    0Ah
                elseif  "&_CHAR_" eq "s"
                BYTE    20h
                elseif  "&_CHAR_" eq "c"
                BYTE    3bh
                elseif  "&_CHAR_" eq "t"
                BYTE    09h
                elseif  "&_CHAR_" eq ":"
                BYTE    "!"
                elseif  "&_CHAR_" eq "-"
                BYTE    "'"
                elseif  "&_CHAR_" eq "="
                BYTE    '"'
                elseif  "&_CHAR_" eq "|"
                BYTE    "\"
                elseif  "&_CHAR_" eq "#"
                BYTE    "%"
                elseif  "&_CHAR_" eq "+"
                BYTE    "&"
                elseif  "&_CHAR_" eq "("
                BYTE    "<"
                elseif  "&_CHAR_" eq ")"
                BYTE    ">"
                elseif  "&_CHAR_" eq "0"
                BYTE    0
                elseif  "&_CHAR_" eq "1"
                BYTE    1
                else
                BYTE    "/", "&_CHAR_"
                _npar__ = _npar__ + 1
                endif
;
                else
;
                if      "&_CHAR_" eq "/"
_ESC_           =       1
                else
_ESC_           =       0
                BYTE    "&_CHAR_"
                _npar__ = _npar__ + 1
                endif
;
                endif
;
                endm
;
                endm
;
;------------------------------------------------------------------------------
;
WSTRING         macro   _STRING_
;
                _npar__ =  0
_ESC_           =       0
                irpc    _CHAR_,<_STRING_>
;
                if      _ESC_
_ESC_           =       0
;
                _npar__ = _npar__ + 1
                if      "&_CHAR_" eq "/"
                WORD    "/"
                elseif  "&_CHAR_" eq "n"
                WORD    0Dh, 0Ah
                _npar__ = _npar__ + 1
                elseif  "&_CHAR_" eq "r"
                WORD    0Dh
                elseif  "&_CHAR_" eq "l"
                WORD    0Ah
                elseif  "&_CHAR_" eq "s"
                WORD    20h
                elseif  "&_CHAR_" eq "c"
                WORD    3bh
                elseif  "&_CHAR_" eq "t"
                WORD    09h
                elseif  "&_CHAR_" eq ":"
                WORD    "!"
                elseif  "&_CHAR_" eq "-"
                WORD    "'"
                elseif  "&_CHAR_" eq "="
                WORD    '"'
                elseif  "&_CHAR_" eq "|"
                WORD    "\"
                elseif  "&_CHAR_" eq "#"
                WORD    "%"
                elseif  "&_CHAR_" eq "+"
                WORD    "&"
                elseif  "&_CHAR_" eq "("
                WORD    "<"
                elseif  "&_CHAR_" eq ")"
                WORD    ">"
                elseif  "&_CHAR_" eq "0"
                WORD    0
                elseif  "&_CHAR_" eq "1"
                WORD    1
                else
                WORD    "/", "&_CHAR_"
                _npar__ = _npar__ + 1
                endif
;
                else
;
                if      "&_CHAR_" eq "/"
_ESC_           =       1
                else
_ESC_           =       0
                WORD    "&_CHAR_"
                _npar__ = _npar__ + 1
                endif
;
                endif
;
                endm
;
                endm
;
;------------------------------------------------------------------------------
ACHAR      typedef BYTE    ;ansi character
WCHAR      typedef WORD    ;wide character
ACHAR_     equ     1       ;ansi char size
WCHAR_     equ     2       ;unicode char size

IF UNICODE
 SIGN      textequ <WCHAR> ;unicode char type
 SIGN_     equ     WCHAR_  ;unicode char size
 USIGN     textequ <WCHAR> ;unicode char type
 USIGN_    equ     WCHAR_  ;unicode char size
 STRING    TEXTEQU <WSTRING>
 TEXT      TEXTEQU <TEXTW>
ELSE
 SIGN      textequ <ACHAR> ;ansi char type
 SIGN_     equ     ACHAR_  ;ansi char size
 USIGN     textequ <ACHAR> ;ansi char type
 USIGN_    equ     ACHAR_  ;ansi char size
 STRING    TEXTEQU <ASTRING>
 TEXT      TEXTEQU <TEXTA>
ENDIF


TEXTA      MACRO __Nomen,  __Text
           ALIGN ACHAR_
           __Nomen LABEL ACHAR
           s&__Nomen EQU OFFSET __Nomen
           ASTRING  <__Text>
           L&__Nomen EQU _npar__
           ENDM

TEXTW      MACRO __Nomen,  __Text
           ALIGN WCHAR_
           __Nomen LABEL WCHAR
           s&__Nomen EQU OFFSET __Nomen
           WSTRING  <__Text>
           L&__Nomen EQU _npar__
           ENDM
